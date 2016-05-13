Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D3F3C60796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DH68Je022121; Fri, 13 May 2016 18:06:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id whhKNLG2p6o7; Fri, 13 May 2016 18:06:07 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DH62O0022115
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 May 2016 18:06:03 +0100
Message-ID: <1463159162.9746.117.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 18:06:02 +0100
In-Reply-To: <cover.1462545440.git.ed.bartosh@linux.intel.com>
References: <cover.1462545440.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RFC][PATCH 0/7] image creation improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2016 17:06:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-05-06 at 17:58 +0300, Ed Bartosh wrote:
> Hi,
> 
> This patchset contains various improvements for the image creation
> functionality
> made by Patchick Ohly during his work on bug #9076:
>  - added support for zip compression
>  - fixed dependency calculation for conversion chaining
>  - converted vmdk/vdi/qcow2 image types into conversion commands
>  - renamed COMPRESSION variables to CONVERSION as the term
> "compression"
>    is no longer accurate
>  - prioritized specialized image creation methods over using
> conversion chaining
> 
> The changes look reasonable to me. However, it would be good to hear
> other
> people opinions as some changes are quite complex.

Ross made some changes to the imagetypes code and I suspect this series
won't apply on top of them. I also don't like moving that dependency
code to image.bbclass, even if its the only caller. The idea is to keep
the "image types" code into its own class.

I'll queue the zip piece but the rest probably needs to be rebased...

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2172176312
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 19:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4IJm1Fe032645; Wed, 18 May 2016 20:48:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rCE43CnTJTpk; Wed, 18 May 2016 20:48:01 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4IJlwVN032641
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 May 2016 20:47:59 +0100
Message-ID: <1463600878.4578.77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 20:47:58 +0100
In-Reply-To: <1463513111-4092-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1463513111-4092-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: Re: [PATCH v3] zip: fix security issues
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
X-List-Received-Date: Wed, 18 May 2016 19:48:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-05-17 at 14:25 -0500, Edwin Plauchu wrote:
> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> 
> This patch avoids zip recipe fails to compile with compiler flags
> which elevate common string formatting issues into an error (-Wformat
> -Wformat-security -Werror=format-security).

In future please wrap the commit log as above and also, when sending a
series of patches like this, please don't allow them all to conflict.

In this case I could edit the patches by hand to make them apply as a
series but I shouldn't need to do that, it should be a series of 3,
with each one applying on top of the previous one.

The patches are in master-next and much improved over the original
versions, thanks.

Cheers,

Richard


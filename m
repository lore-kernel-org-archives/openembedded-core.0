Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC7575D4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBSP8V016783; Fri, 12 Feb 2016 11:28:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zqsEM7-lZ4pk; Fri, 12 Feb 2016 11:28:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBSMiu016779
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 12 Feb 2016 11:28:23 GMT
Message-ID: <1455276502.16142.272.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexander.kanavin@linux.intel.com, Bruce Ashfield
	<bruce.ashfield@windriver.com>
Date: Fri, 12 Feb 2016 11:28:22 +0000
In-Reply-To: <61992.10.252.9.169.1455277045.squirrel@linux.intel.com>
References: <cover.1455203165.git.bruce.ashfield@windriver.com>
	<61992.10.252.9.169.1455277045.squirrel@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] linux-yocto: -stable and BSP updates
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
X-List-Received-Date: Fri, 12 Feb 2016 11:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-12 at 13:37 +0200, alexander.kanavin@linux.intel.com
wrote:
> > Here are the pending updates to the 4.1 and 4.4 kerne to integrate 
> > -stable
> > updates
> > and to backport the mainline galileo support patches.
> > Bruce Ashfield (3):
> >   linux-yocto/4.4: update to v4.4.1
> >   linux-yocto/4.1: update to v4.1.17
> >   linux-yocto/4.1: galileo backports and support
> 
> Shouldn't linux-libc-headers be updated to 4.4.1 at the same time?

We tend to only change linux-libc-headers if there is a need to outside
major version bumps. We have had cases where there have been fixes in
point releases we've needed but they should be rare.

Cheers,

Richard


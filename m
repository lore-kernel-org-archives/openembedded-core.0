Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 30D0465CD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3RL2Cbu028711; Mon, 27 Apr 2015 22:02:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oncohYNS5E3g; Mon, 27 Apr 2015 22:02:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3RL208W028707
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Apr 2015 22:02:11 +0100
Message-ID: <1430168520.13022.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 27 Apr 2015 22:02:00 +0100
In-Reply-To: <1429732638-18404-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1429704663-9104-1-git-send-email-ed.bartosh@linux.intel.com>
	<1429732638-18404-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] split_and_strip_files: regroup hardlinks to make build deterministic
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
X-List-Received-Date: Mon, 27 Apr 2015 21:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-22 at 22:57 +0300, Ed Bartosh wrote:
> Reverted 7c0fd561bad0250a00cef63e3d787573112a59cf
> 
> Created separate group of hardlinks for the files inside
> the same package. This should prevent stripped files to be
> populated outside of package directories.
> 
> [YOCTO #7586]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/package.bbclass | 10 ++++++++++
>  meta/lib/oe/package.py       |  3 +--
>  2 files changed, 11 insertions(+), 2 deletions(-)

I ran this on the autobuilder. I noticed:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/269/steps/BuildImages_1/logs/stdio

which would seem related to this patch somehow but I'm not sure what is
happening to cause it as yet.

Cheers,

Richard



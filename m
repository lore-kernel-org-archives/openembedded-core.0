Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 031736FB5E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:47:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4SDllI6006652; Wed, 28 May 2014 14:47:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 25C22YIl-uae; Wed, 28 May 2014 14:47:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4SDld1v006628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 28 May 2014 14:47:40 +0100
Message-ID: <1401284851.2607.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 28 May 2014 14:47:31 +0100
In-Reply-To: <5385DC75.6020902@windriver.com>
References: <cover.1401124899.git.bruce.ashfield@windriver.com>
	<81e37d5db466c157a8ca0069c60102eb12616532.1401124899.git.bruce.ashfield@windriver.com>
	<1401266199.2607.15.camel@ted> <5385DC75.6020902@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] linux-yocto/3.10: bump kver to v3.10.40
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
X-List-Received-Date: Wed, 28 May 2014 13:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-05-28 at 08:54 -0400, Bruce Ashfield wrote:
> On 14-05-28 04:36 AM, Richard Purdie wrote:
> > On Mon, 2014-05-26 at 13:40 -0400, Bruce Ashfield wrote:
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> >> index 7081cd18aa57..b1b80341d6d2 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> >> @@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
> >>   LINUX_KERNEL_TYPE = "tiny"
> >>   KCONFIG_MODE = "--allnoconfig"
> >>
> >> -LINUX_VERSION ?= "3.10.38"
> >> +LINUX_VERSION ?= "3.10.40"
> >>
> >>   KMETA = "meta"
> >>
> >> -SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
> >> -SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
> >> +SRCREV_machine ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
> >> +SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
> >
> > We're seeing failures since "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
> > doesn't appear to exist in the 3.10 tree meta branch. "bitbake -b
> > linux-yocto-tiny_3.10 -c fetch" reproduces.
> >
> > Did you miss pushing something?
> 
> I don't manually push anything anymore, just my release scripts. I'll
> check to see if the infrastructure has let me down by re-running them
> now.
> 
> .. and I did see the meta branch SRCREV push, and re-launched my
> builders. But all should be fine now.
> 
> Sorry :(

No problem, these things happen. We just need to figure out what
happened and make sure it doesn't happen again. The commit is there now
so I'm guessing that should fix the build failures.

Cheers,

Richard




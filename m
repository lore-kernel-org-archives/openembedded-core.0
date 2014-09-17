Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 72E8660144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 07:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8H7O1iG014698; Wed, 17 Sep 2014 08:24:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3RrrrMCxpdIV; Wed, 17 Sep 2014 08:24:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8H7NsFU014694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 17 Sep 2014 08:23:56 +0100
Message-ID: <1410938636.14624.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Wed, 17 Sep 2014 08:23:56 +0100
In-Reply-To: <5418D4FF.9030103@windriver.com>
References: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYYSxR7VDtZ8JyCg+MtgJQpnXgno6P9xs744Pzx=FRXJw@mail.gmail.com>
	<5418D4FF.9030103@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmod: remove the setting of INHIBIT_PACKAGE_STRIP
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
X-List-Received-Date: Wed, 17 Sep 2014 07:24:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-17 at 08:25 +0800, Rongqing Li wrote:
> 
> On 09/16/2014 05:46 PM, Burton, Ross wrote:
> > On 15 September 2014 09:27,  <rongqing.li@windriver.com> wrote:
> >> Setting INHIBIT_PACKAGE_STRIP is added by 61cb45869c[kmod: ptest fixes], but I
> >> can not reproduce the described issue, and seems it make wrong logical [
> >> when enable ptest, INHIBIT_PACKAGE_STRIP is always 1; and when disable ptest,
> >> INHIBIT_PACKAGE_STRIP is always 0]
> >
> > I take my comment back:
> >
> > ERROR: runstrip: ''arm-poky-linux-gnueabi-strip' --strip-debug
> > --remove-section=.comment --remove-section=.note --preserve-dates
> > '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/armv5te-poky-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/package/usr/lib/kmod/ptest/testsuite/rootfs/test-dependencies/lib/modules/4.0.20-kmod/kernel/fs/mbcache.ko''
> > strip command failed
> >
> > The autobuilder failed dramatically on this.
> >
> > Instead of inhibiting the strip globally, I wonder if there's a way to
> > avoid stripping the test suite.
> >
> > Ross
> >
> 
> OK, I will see it

If there isn't, we should perhaps add something...

Cheers,

Richard



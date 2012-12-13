Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TjF4Z-0003aD-Pk
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 21:07:59 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1237905bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 11:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:x-mailer:mime-version:content-transfer-encoding;
	bh=JhTXoWuvgUmIiIwhg2ZTofbKzcItTq6VD9lgFDKlgZ8=;
	b=qH30dlrAqL8VzaFwQla+dzAhBSxHn6pNvGQa+QGtmin9RoAYW5fCBQbM2zlRq0MVC5
	09LOOIRKew15IOurVAqQ3SM37gbCH1oT0rlhJh1TbHLHFQdtTGuCnlD6F0GbORQfQgMd
	miFCXVz2Q0uOFBLkyCjLmRBAqWVVAXMiFBVXCtftYEeKBynKI9jMXn4XCaEHnYG+opXQ
	T1RKZmcdg1M4P/wL3CTt8jvqLaU/Hf5kvs2beKpL2TsdxDoo/aFV/Ge2VR07POPmkVrR
	Gw8qdDD8DDsbWn0Ku520+M7eVbzls1/UEHmT6LG+0rnT24i7VTMVFb2s5nhuj9+//Yhv
	8AOg==
Received: by 10.204.3.205 with SMTP id 13mr1568333bko.38.1355428404535;
	Thu, 13 Dec 2012 11:53:24 -0800 (PST)
Received: from [192.168.1.25] (93-142-254-158.adsl.net.t-com.hr.
	[93.142.254.158])
	by mx.google.com with ESMTPS id i20sm2498330bkw.5.2012.12.13.11.53.21
	(version=SSLv3 cipher=OTHER); Thu, 13 Dec 2012 11:53:22 -0800 (PST)
Message-ID: <1355428397.4799.7.camel@dromedary>
From: Marko =?UTF-8?Q?Kati=C4=87?= <dromede@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 13 Dec 2012 20:53:17 +0100
In-Reply-To: <CAP9ODKrQ1XQNwGz2D7HVcDeP1n7ndxCHTkiXD6tZotYLTMfKNA@mail.gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
	<CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
	<CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
	<CAHod+Gf2ayXp4Zubxh0yiEeOM7wGJ72EVVqY8uma0+y-oYFcdQ@mail.gmail.com>
	<CAP9ODKrQ1XQNwGz2D7HVcDeP1n7ndxCHTkiXD6tZotYLTMfKNA@mail.gmail.com>
X-Mailer: Evolution 3.6.0-0ubuntu3 
Mime-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>, Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 20:07:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2012-11-20 at 18:23 -0200, Otavio Salvador wrote:
> On Tue, Nov 20, 2012 at 5:59 PM, Marko Katić <dromede@gmail.com> wrote:
> > On Sat, Nov 17, 2012 at 7:54 PM, Otavio Salvador
> > <otavio@ossystems.com.br> wrote:
> >>
> >>
> >> On Sat, Nov 17, 2012 at 4:38 PM, Chris Larson <clarson@kergoth.com> wrote:
> >>>
> >>> On Sat, Nov 17, 2012 at 11:02 AM, Marko Katić <dromede@gmail.com> wrote:
> >>>>
> >>>> A proper solution might be to:
> >>>>
> >>>> a) Leave udevtest and udevinfo in udev-utils to properly support older
> >>>> versions of udev that have these packages.
> >>>> b) Move udevadm into the main udev package. This makes a lot of sense
> >>>> since udevadm is crucial for proper udev operation.
> >>>> c) Remove udev-utils from RRECOMMENDS.
> >>>
> >>>
> >>> This sounds like a clean, solid route to me. Hopefully someone else will
> >>> chime in with input on it as well.
> >>
> >>
> >> I see no value in having the others and deprecated tools available. Having
> >> udevadm available in udev-utils allows for it use with mdev for trigger the
> >> events in kernel, for example. I like to have this possibility.
> >>
> >> --
> >> Otavio Salvador                             O.S. Systems
> >> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> >> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> >>
> >
> > Ok, so udevadm should stay in udev-utils. In that case i propose we:
> >
> > a) Add ${bindir}/udevadm and ${base_sbindir}/udevadm to
> > FILES_udev-utils. This should
> > ensure that udevadm will always go in udev-utils regardless of the
> > udev version being built.
> > This should also ensure that udev-utils package will always be made.
> >
> > b) Make udevadm available in both ${bindir} and ${base_sbindir} via
> > symlinks installed in
> > do_install_append. This should ensure proper support for all versions of udev.
> 
> I like your plan.
> 
> +1
> 

Oh dear, i completely forgot about this patch. It's been sitting in my
local repo for weeks!

So here's my (hopefully) final solution:

diff --git a/meta/recipes-core/udev/udev.inc
b/meta/recipes-core/udev/udev.inc
index 4705b9b..677c33a 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -74,7 +74,7 @@ FILES_udev-cache = "${sysconfdir}/init.d/udev-cache
${sysconfdir}/default/udev-c
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl
${base_libdir}/udev/rules.d/70-acl.rules"
 
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest
${base_sbindir}/udevadm"
+FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest
${base_sbindir}/udevadm ${bindir}/udevadm"
 
 RDEPENDS_udev-consolekit += "udev-acl"
 FILES_udev-consolekit = "${libdir}/ConsoleKit"
@@ -97,4 +97,19 @@ do_install_append () {
        rm -f ${D}${base_libdir}/udev/hid2hci
 
        echo 'udev_run="/var/run/udev"' >>
${D}${sysconfdir}/udev/udev.conf
+       
+       #Starting with udev 176, udevadm is by default installed in
${bindir}.
+       #To properly support all versions of udev we make udevadm
available
+       #in ${bindir} and in ${base_sbindir}.
+               
+       if [ "${PV}" -gt "175" ]
+       then
+               install -d ${D}${base_sbindir}
+               ln -s ${bindir}/udevadm ${D}${base_sbindir}/udevadm
+
+       else
+               install -d ${D}${bindir}
+               ln -s ${base_sbindir}/udevadm ${D}${bindir}/udevadm
+
+       fi
 }





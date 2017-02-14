Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id D8C3F731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 10:26:35 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id 203so30371941ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 02:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=HGH29W31DEBKJfWgwaTXXX/i6ZlsILEmsiHF4HGwMLE=;
	b=NrCv0q9Bd6vMBog55zoC7UFobdm3y433glq8n+8bpeP8cjab3s3+Q9aXVsGf5l+eTa
	bETgiq4oxk3mrcD1uKLZoJMmrvDXcWdvNsMsRW6NoTDBetFnkJk8aVmbpxA42bombZpF
	aIxazBRr9yYRw0GLDWqAyEWeChm2eciEzKhDRDHYm4QCSQnTuGa4y0qbNLyfnx8+2B2k
	A3y7kTfozLERg1Rqk3+CjRq6acer65SdXIZniNGiKCLFJP27iIi11SQVEq8EIHC6doae
	3w/+A0RNqBx/DCbjg+013+A0ZvkVhNRIZFiHgvYcb2qXJRoxEzrZtazs+ZeXSV1UUnox
	+sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=HGH29W31DEBKJfWgwaTXXX/i6ZlsILEmsiHF4HGwMLE=;
	b=MS39pWEAvbSDqDJHgw8dgy5tEIXFFOgihq3uwGe8IogUestd9R64EnCIWVDz3wkzm6
	cZLtJWiWfgwOAvUyqK93rwU0pyEcb92lR/9/O+r8qrJREoXX+IzwsweKBsV1qGBsW1Gu
	K1JaEw6PXFNBbcxLckF3cvQDmXoLAPKcXeM9yDBiuQQLLZK2UoqlGeUKnBnMYGvZCFP7
	0E8kIYBGyNlGPXO1Zn8s7aia53OvQtnplgEuRW5RGQahqxPcJ28T+UuZ/wvWDW7LlXkM
	cm75dSCgEl/16cPNW6ebM0stLxVak7hmri3Oc6kbYGweDkaxxuZEZAJb6dg96XA6Z/fY
	VveA==
X-Gm-Message-State: AMke39ni3j3kuAXBcej+hvfEPu/M4Oj2x0SfmTVBlIuPjXQMCL+mDxniZdJqqNDarnQ29B2s
X-Received: by 10.107.16.217 with SMTP id 86mr25090445ioq.2.1487067995267;
	Tue, 14 Feb 2017 02:26:35 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E015.dip0.t-ipconnect.de. [93.232.224.21])
	by smtp.gmail.com with ESMTPSA id l19sm156339ioe.51.2017.02.14.02.26.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 02:26:33 -0800 (PST)
Message-ID: <1487067990.13854.328.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@intel.com>
Date: Tue, 14 Feb 2017 11:26:30 +0100
In-Reply-To: <1487005422.13854.247.camel@intel.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
	<1487005422.13854.247.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Tue, 14 Feb 2017 10:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-13 at 18:03 +0100, Patrick Ohly wrote:
> On Mon, 2017-02-13 at 16:24 +0100, Patrick Ohly wrote:
> > On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
> > > Hi Andreas,
> > > 
> > > 
> > > I think it's feature which was already there, but almost never
> > > triggered (even in test-dependencies.sh tests), but with RSS it fails
> > > reliably.
> > > 
> > > 
> > > See:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.html
> > 
> > That's not quite the same, if I understand it correctly. In that email,
> > Richard was talking about "dependencies of that target are not needed
> > and not installed" and used "quilt-native" and "compiler/toolchain" as
> > example. In other words, if recipe foo DEPENDS on bar for getting foo
> > compiled, that dependency on bar gets ignored when installing "foo" into
> > the recipe specific sysroot because it shouldn't be needed anymore.
> > 
> > But the example here is a recipe foo which has a runtime dependency on
> > bar, so bar must be installed in addition to foo, otherwise foo will not
> > work.
> > 
> > This is where it gets tricky: do native recipes have RDEPENDS? They are
> > not getting packaged, so I suppose not. One could collect all RDEPENDS_*
> > values (regardless of the actual package), but that might be too broad
> > (for example, when "packaging" the native recipe wouldn't even produce
> > that package).
> 
> Apparently RDEPENDS do work, also for native recipes. Based on some
> testing, it seems that all RDEPENDS are considered, even those that
> refer to packages that would normally be empty, i.e. the sysroot
> potentially contains more than strictly needed, but that shouldn't be a
> problem.

My testing was flawed: in addition to the RDEPENDS there also was a
DEPENDS with the same entry, and despite what was said earlier about
build dependencies, that entry did have an effect. So it is a bit more
complicated.

The way I'd expect this to work for native tools is this:
     1. DEPENDS should be ignored (build dependencies like compiler
        which are not needed when using the resulting tool)
     2. RDEPENDS_${PN} needs to be used (essential runtime dependencies,
        set the same way as for the target recipes, because then
        BBCLASSEXTEND native mostly works automatically)
     3. RDEPENDS_foo for foo != ${PN} is *not* used - that's basically a
        convention, and addresses the issue I mentioned where it is
        unclear for a native recipe whether it really has such a package

But the actual implementation isn't quite doing this. Instead,
extend_recipe_sysroot() in staging.bbclass and setscene_depvalid() in
sstate.bbclass look at the task dependencies.

Here's an example, using Poky e758547db = current master:
$ bitbake wic-tools
...
$ grep gettext tmp/work/i586-poky-linux/wic-tools/1.0-r0/temp/log.do_prepare_recipe_sysroot
Considering setscene task: ['gettext-native', 'do_populate_sysroot']
  considering dependency: ['gettext-native', 'do_populate_sysroot']
Skipping setscene dependency virtual:native:/work/poky/meta/recipes-core/gettext/gettext_0.19.8.1.bb:do_populate_sysroot for installation into the sysroot
...
$ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/
-name gettext
tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/usr/share/gettext
tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/installeddeps/gettext

"gettext" is not installed.

Let's add it to RDEPENDS_${PN} of dosfstools-native, one of the
dependencies of wic-tools:
$ echo 'RDEPENDS_dosfstools-native_append_pn-dosfstools-native = " gettext-native"' >conf/auto.conf
$ bitbake -e dosfstools-native | grep ^RDEPENDS
RDEPENDS_dosfstools-native="gettext-native"
RDEPENDS=""
RDEPENDS_kernel-base=""
RDEPENDS_dosfstools-native-staticdev="dosfstools-native-dev (= 4.1-r0)"
RDEPENDS_dosfstools-native-dev="dosfstools-native (= 4.1-r0)"

First observation: "bitbake wic-tools:do_prepare_recipe_sysroot" does
not run again. But even forcing it to run again doesn't change anything,
i.e. either "gettext-native" in RDEPENDS_dosfstools-native or
RDEPENDS_dosfstools-native are ignored.

Let's compare adding something new to RDEPENDS vs. DEPENDS:
$ echo 'DEPENDS_append_pn-dosfstools-native = " socat-native"' >conf/auto.conf
$ bitbake -g wic-tools
$ grep -e '->.*socat-native.do_populate_sysroot' task-depends.dot 
"dosfstools-native.do_prepare_recipe_sysroot" -> "socat-native.do_populate_sysroot"

$ echo 'RDEPENDS_dosfstools-native_append_pn-dosfstools-native = " gettext-native"' >conf/auto.conf
$ bitbake -g wic-tools
$ grep -e '->.*socat-native.do_populate_sysroot' task-depends.dot 

Nothing. RDEPENDS_dosfstools-native was completely ignored. To me that
looks like a missing feature or even a bug, if it was meant to work
already.

I'm leaning towards the "bug" theory. There are examples where RDEPENDS
is set explicitly for native recipes, albeit inconsistently:
meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:RDEPENDS_class-native = "libxslt-native"
meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb:RDEPENDS_${PN}_class-native += "mkfontscale-native"

Of these two, only setting RDEPENDS_class-native actually has an effect
(tested by adding socat-native to the assignment). mkfontscale-native
gets installed through some other, indirect dependency.

Digging deeper, it seems that it also depends on whether a recipe sets
PACKAGES. The insane.bbclass pkgvarcheck allows RDEPENDS (without
suffix) if PACKAGES is empty, which is the case for native recipes -
unless a recipe sets PACKAGES explicitly, as libnewt does with
PACKAGES_append.

It gets more confusing. Based on the observation about xmlto, I'd expect
that this change to libnewt should have an effect:

$ git diff meta/recipes-extended/newt
diff --git a/meta/recipes-extended/newt/libnewt_0.52.19.bb b/meta/recipes-extended/newt/libnewt_0.52.19.bb
index a26ce1fbe75..0a1d693e110 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.19.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.19.bb
@@ -38,7 +38,8 @@ CLEANBROKEN = "1"
 
 export CPPFLAGS
 
-PACKAGES_prepend = "whiptail "
+PACKAGES_prepend_class-target = "whiptail "
+RDEPENDS_class-native = "socat-native"
 
 do_configure_prepend() {
     sh autogen.sh

It changes PACKAGES and RDEPENDS as expected, but tasks dependencies do
not:

$ bitbake -e libnewt-native | grep -e PACKAGES= -e ^RDEPENDS=
RDEPENDS="socat-native"
PACKAGES=""
$ bitbake -g libnewt-native
$ grep -e '->.*socat-native' task-depends.dot 

Nothing.

Here's the same test for xmlto:

$ git diff meta/recipes-devtools/xmlto
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index ce5d1e0c502..9e995fe5e9d 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -13,7 +13,7 @@ SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
 SRC_URI[sha256sum] =
"2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
 
 inherit autotools
-RDEPENDS_class-native = "libxslt-native"
+RDEPENDS_class-native = "libxslt-native socat-native"
 
 # xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
 RDEPENDS_${PN} = "docbook-xml-dtd4 \

$ bitbake -e xmlto-native | grep -e PACKAGES= -e ^RDEPENDS=
RDEPENDS="libxslt-native socat-native"
PACKAGES=""
$ bitbake -g xmlto-native 
$ grep -e '->.*socat-native' task-depends.dot 
"socat-native.do_populate_sysroot" -> "socat-native.do_install"
"socat-native.do_patch" -> "socat-native.do_unpack"
"socat-native.do_unpack" -> "socat-native.do_fetch"
"socat-native.do_compile" -> "socat-native.do_configure"
"socat-native.do_prepare_recipe_sysroot" -> "socat-native.do_fetch"
"socat-native.do_configure" -> "socat-native.do_prepare_recipe_sysroot"
"socat-native.do_configure" -> "socat-native.do_patch"
"socat-native.do_install" -> "socat-native.do_compile"
"xmlto-native.do_populate_sysroot" -> "socat-native.do_populate_sysroot"

If this email sounds confused, then that's because I am - sorry for that ;-}

Can someone clarify how RDEPENDS really works at the moment for native
recipes?

Now regarding DEPENDS being ignored: that's not quite the case either.

$ echo 'DEPENDS_append_pn-dosfstools-native = " socat-native"' >conf/auto.conf
$ bitbake wic-tools
...
$ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/ -name socat
tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/usr/bin/socat

In other words, a build dependency got installed although it shouldn't
really be needed.

Finally, re-running do_populate_sysroot_setscene does not remove entries
which no longer should be there. Test case:

$ echo 'DEPENDS_append_pn-dosfstools-native = " socat-native"' >conf/auto.conf
$ bitbake wic-tools:do_prepare_recipe_sysroot | cat
...
NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 682 tasks of which 681 didn't need to be rerun and all succeeded.
$ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/ -name socat
tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/usr/bin/socat
$ echo  >conf/auto.conf
$ bitbake wic-tools:do_prepare_recipe_sysroot | cat
...
NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 674 tasks of which 673 didn't need to be rerun and all succeeded.
$ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/ -name socat
tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/usr/bin/socat
$ bitbake -c clean wic-tools
...
$ bitbake wic-tools:do_prepare_recipe_sysroot | cat
...
NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wic-tools-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 674 tasks of which 672 didn't need to be rerun and all succeeded.
$ find tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native/ -name socat

Is there a missing [cleandirs] for the recipe-sysroot-native or is this
reuse of the existing content intentional?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





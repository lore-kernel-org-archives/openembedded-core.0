Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4727E605BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 19:52:59 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id q198so3346022vke.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c0cpQy+7+FaulbtHko9m1sxQcSoLDas2VWZFrx8GTjs=;
	b=InukxQT3z8j66VG+lGSPj0gd4UWhS0Lo0b1Oz9CORKOoJ040GxWXNw4q2ZqbI70Qmj
	jTQ/Z7WWjc9ih9UkmKQGoWRR1+vQYp/ztpz34TWr3q2zCDBGoDLXi9SfeNoTBbIcc8Iu
	r86VjTmBR1GuiZt+QusTohJU+W8x/AmhA3K67FV30Vxhovv2vl2tMm21N2poqCLAWfRI
	zvASM7b3pCjkBTZdCAjdMboqYfR2DOBxwNP2KTZ4Z3IWk1UmHOPLWrvJdY3Yzb3tDUiL
	zh5ouV4A4EbtYb9dv2ilR9hH1eH4p6i61dvpCANNIl/1amJB3cB/02x+DeKETV9Fg66A
	SFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c0cpQy+7+FaulbtHko9m1sxQcSoLDas2VWZFrx8GTjs=;
	b=q7oaCkMnykdcErTTbYEd3NhUcQB4f/R5rU7gYj5t8OUgWOIqQs1c5aLXCy03scijHF
	YLXQtISWSDJY2FZXE+W4ZvkzkQRCzmlIga3r8dqAJjiWIbM6mLD5+IdprloGDl+3XefB
	FOAnLSye6VSnYOg7pZPAR0759OD2aTTwfYIle1j24jE9mAEnUx1BeF2Rd3VvwCByJaQK
	Fs0Zg95Z21Yk1xvfW8ROX8fzJvo3ROxTCB1/adyW3zaPovPYq1NOtn+kKc7pduOxyTEH
	ImSoW6Z12gKdMFfwa5C9XgsCoGVJSEVebd+cx9SecOzMSXrAFGd2WYVorgne7MqCNtM+
	UmaQ==
X-Gm-Message-State: AElRT7EJpDxt6S0aHDVPorXl50U3fZacien8vJO1NHYGMDdRXHmkALH/
	5P+rezA24eGfGJMNaWyaqiGcN61fo++D9j7ooaU=
X-Google-Smtp-Source: AG47ELt90P0Av9u29gXH6xBSiCFyJ/YL6qG6+1xFwdcozd5NmXWjswHQ/ElHJj5iSVMJaaitIZhnq4TYSqRcH9v+Q1Y=
X-Received: by 10.31.74.1 with SMTP id x1mr15173427vka.44.1522007580985; Sun,
	25 Mar 2018 12:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzHQwth9b6MxA79OEwCVPMCwJTZ+j-WKwz-uemgXoPZy7g@mail.gmail.com>
	<CAJTo0LbL6BA5sNeOi+sH8VCdDBDhvdkztFxbQSkAsau2FRuNUQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbL6BA5sNeOi+sH8VCdDBDhvdkztFxbQSkAsau2FRuNUQ@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Sun, 25 Mar 2018 19:52:50 +0000
Message-ID: <CAPGMVzEA52STvoMh=cAHqxsYc++pmxmhywVM082thHuB_OJ_0w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: kazuhiro3.hayashi@toshiba.co.jp,
	OE-core <openembedded-core@lists.openembedded.org>,
	yoshitake.kobayashi@toshiba.co.jp
Subject: Re: [meta-debian] build error
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
X-List-Received-Date: Sun, 25 Mar 2018 19:53:00 -0000
Content-Type: multipart/alternative; boundary="001a114db11035cfdc0568420115"

--001a114db11035cfdc0568420115
Content-Type: text/plain; charset="UTF-8"

Ok, thanks for the clarification.

On Mon, 26 Mar 2018, 01:21 Burton, Ross, <ross.burton@intel.com> wrote:

> Speaking as an oe-core maintainer, we don't support meta-debian: use
> it at your own risk.
>
> Ross
>
> On 25 March 2018 at 20:49, Rajath C S <rajathcs.1996@gmail.com> wrote:
> > Hi,
> >
> > I am encountering the below error while building meta-debian (which is
> added
> > in bblayer.conf)
> >
> > ERROR: /home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb: Error
> > executing a python function in <code>:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 3, function: <module>
> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
> >
> 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
> function:
> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
> >      0583:    needsrcrev = False
> >      0584:    srcuri = d.getVar('SRC_URI')
> >      0585:    for uri in srcuri.split():
> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
> >  *** 0587:
> >      0588:        # HTTP/FTP use the wget fetcher
> >      0589:        if scheme in ("http", "https", "ftp"):
> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
> > wget-native:do_populate_sysroot')
> >      0591:
> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> > function: decodeurl
> >      0364:    """
> >      0365:
> >      0366:    m =
> >
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
> >      0367:    if not m:
> >  *** 0368:        raise MalformedUrl(url)
> >      0369:
> >      0370:    type = m.group('type')
> >      0371:    location = m.group('location')
> >      0372:    if not location:
> > Exception: bb.fetch2.MalformedUrl: The URL:
> >
> '${MISC_GIT_URI}/${MISC_GIT_PREFIX}ltp.git;protocol=${MISC_GIT_PROTOCOL}' is
> > invalid and cannot be interpreted
> >
> > ERROR:
> > /home/jarvis/poky/meta-debian/recipes-misc/qemu/
> qemu-bios-native_1.7.0.bb:
> > Error executing a python function in <code>:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 3, function: <module>
> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
> >
> 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
> function:
> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
> >      0583:    needsrcrev = False
> >      0584:    srcuri = d.getVar('SRC_URI')
> >      0585:    for uri in srcuri.split():
> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
> >  *** 0587:
> >      0588:        # HTTP/FTP use the wget fetcher
> >      0589:        if scheme in ("http", "https", "ftp"):
> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
> > wget-native:do_populate_sysroot')
> >      0591:
> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> > function: decodeurl
> >      0364:    """
> >      0365:
> >      0366:    m =
> >
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
> >      0367:    if not m:
> >  *** 0368:        raise MalformedUrl(url)
> >      0369:
> >      0370:    type = m.group('type')
> >      0371:    location = m.group('location')
> >      0372:    if not location:
> > Exception: bb.fetch2.MalformedUrl: The URL:
> >
> '${MISC_GIT_URI}/${MISC_GIT_PREFIX}qemu.git;protocol=${MISC_GIT_PROTOCOL};branch=stable-2.1'
> > is invalid and cannot be interpreted
> >
> > ERROR:
> > /home/jarvis/poky/meta-debian/recipes-kernel/linux-libc-headers/
> linux-libc-headers-base_git.bb:
> > Error executing a python function in <code>:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 3, function: <module>
> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
> >
> 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
> function:
> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
> >      0583:    needsrcrev = False
> >      0584:    srcuri = d.getVar('SRC_URI')
> >      0585:    for uri in srcuri.split():
> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
> >  *** 0587:
> >      0588:        # HTTP/FTP use the wget fetcher
> >      0589:        if scheme in ("http", "https", "ftp"):
> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
> > wget-native:do_populate_sysroot')
> >      0591:
> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> > function: decodeurl
> >      0364:    """
> >      0365:
> >      0366:    m =
> >
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
> >      0367:    if not m:
> >  *** 0368:        raise MalformedUrl(url)
> >      0369:
> >      0370:    type = m.group('type')
> >      0371:    location = m.group('location')
> >      0372:    if not location:
> > Exception: bb.fetch2.MalformedUrl: The URL:
> >
> '${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
> > is invalid and cannot be interpreted
> >
> > ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux/
> linux-base_git.bb:
> > Error executing a python function in <code>:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 3, function: <module>
> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
> >
> 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
> function:
> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
> >      0583:    needsrcrev = False
> >      0584:    srcuri = d.getVar('SRC_URI')
> >      0585:    for uri in srcuri.split():
> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
> >  *** 0587:
> >      0588:        # HTTP/FTP use the wget fetcher
> >      0589:        if scheme in ("http", "https", "ftp"):
> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
> > wget-native:do_populate_sysroot')
> >      0591:
> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> > function: decodeurl
> >      0364:    """
> >      0365:
> >      0366:    m =
> >
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
> >      0367:    if not m:
> >  *** 0368:        raise MalformedUrl(url)
> >      0369:
> >      0370:    type = m.group('type')
> >      0371:    location = m.group('location')
> >      0372:    if not location:
> > Exception: bb.fetch2.MalformedUrl: The URL:
> >
> '${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
> > is invalid and cannot be interpreted
> >
> > ERROR: Failed to parse recipe:
> > /home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb
> > ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zlib/zlib_debian.bb:
> > Error executing a python function in <code>:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 3, function: <module>
> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
> >
> 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
> function:
> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
> >      0583:    needsrcrev = False
> >      0584:    srcuri = d.getVar('SRC_URI')
> >      0585:    for uri in srcuri.split():
> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
> >  *** 0587:
> >      0588:        # HTTP/FTP use the wget fetcher
> >      0589:        if scheme in ("http", "https", "ftp"):
> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
> > wget-native:do_populate_sysroot')
> >      0591:
> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> > function: decodeurl
> >      0364:    """
> >      0365:
> >      0366:    m =
> >
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
> >      0367:    if not m:
> >  *** 0368:        raise MalformedUrl(url)
> >      0369:
> >      0370:    type = m.group('type')
> >      0371:    location = m.group('location')
> >      0372:    if not location:
> > Exception: bb.fetch2.MalformedUrl: The URL:
> >
> '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zlib.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
> > is invalid and cannot be interpreted
> >
> > ERROR:
> > /home/jarvis/poky/meta-debian/recipes-debian/zeromq3/zeromq3_debian.bb:
> > Error executing a python function in <code>:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 3, function: <module>
> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
> >
> 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
> function:
> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
> >      0583:    needsrcrev = False
> >      0584:    srcuri = d.getVar('SRC_URI')
> >      0585:    for uri in srcuri.split():
> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
> >  *** 0587:
> >      0588:        # HTTP/FTP use the wget fetcher
> >      0589:        if scheme in ("http", "https", "ftp"):
> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
> > wget-native:do_populate_sysroot')
> >      0591:
> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> > function: decodeurl
> >      0364:    """
> >      0365:
> >      0366:    m =
> >
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
> >      0367:    if not m:
> >  *** 0368:        raise MalformedUrl(url)
> >      0369:
> >      0370:    type = m.group('type')
> >      0371:    location = m.group('location')
> >      0372:    if not location:
> > Exception: bb.fetch2.MalformedUrl: The URL:
> >
> '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zeromq3.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
> > is invalid and cannot be interpreted
> >
> > ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zip/zip_debian.bb:
> Error
> > executing a python function in <code>:
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 3, function: <module>
> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
> >
> 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
> function:
> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
> >      0583:    needsrcrev = False
> >      0584:    srcuri = d.getVar('SRC_URI')
> >      0585:    for uri in srcuri.split():
> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
> >  *** 0587:
> >      0588:        # HTTP/FTP use the wget fetcher
> >      0589:        if scheme in ("http", "https", "ftp"):
> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
> > wget-native:do_populate_sysroot')
> >      0591:
> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> > function: decodeurl
> >      0364:    """
> >      0365:
> >      0366:    m =
> >
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
> >      0367:    if not m:
> >  *** 0368:        raise MalformedUrl(url)
> >      0369:
> >      0370:    type = m.group('type')
> >      0371:    location = m.group('location')
> >      0372:    if not location:
> > Exception: bb.fetch2.MalformedUrl: The URL:
> >
> '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zip.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
> > is invalid and cannot be interpreted
> >
> > Do help me with the solution
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a114db11035cfdc0568420115
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks for the clarification.=C2=A0</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Mon, 26 Mar 2018, 01:21 Burton, Ross=
, &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Speaking as an oe-core mai=
ntainer, we don&#39;t support meta-debian: use<br>
it at your own risk.<br>
<br>
Ross<br>
<br>
On 25 March 2018 at 20:49, Rajath C S &lt;<a href=3D"mailto:rajathcs.1996@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail.com</a>&=
gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am encountering the below error while building meta-debian (which is=
 added<br>
&gt; in bblayer.conf)<br>
&gt;<br>
&gt; ERROR: /home/jarvis/poky/meta-debian/recipes-misc/ltp/<a href=3D"http:=
//ltp_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ltp_git.bb</a=
>: Error<br>
&gt; executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes_bas=
e_bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(=
d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_pac=
kage_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debi=
an_bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function:<br>
&gt; __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 needsrcrev =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 srcuri =3D d.getVar(&#39;SRC_UR=
I&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 for uri in srcuri.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 (scheme, _ , path=
) =3D bb.fetch.decodeurl(uri)[:3]<br>
&gt;=C2=A0 *** 0587:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # HTTP/FTP use th=
e wget fetcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scheme in (&qu=
ot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39;<br>
&gt; wget-native:do_populate_sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&=
lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${MISC_GIT_URI}/${MISC_GIT_PREFIX}ltp.git;protocol=3D${MISC_GIT_P=
ROTOCOL}&#39; is<br>
&gt; invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR:<br>
&gt; /home/jarvis/poky/meta-debian/recipes-misc/qemu/<a href=3D"http://qemu=
-bios-native_1.7.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">qemu=
-bios-native_1.7.0.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes_bas=
e_bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(=
d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_pac=
kage_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debi=
an_bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function:<br>
&gt; __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 needsrcrev =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 srcuri =3D d.getVar(&#39;SRC_UR=
I&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 for uri in srcuri.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 (scheme, _ , path=
) =3D bb.fetch.decodeurl(uri)[:3]<br>
&gt;=C2=A0 *** 0587:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # HTTP/FTP use th=
e wget fetcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scheme in (&qu=
ot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39;<br>
&gt; wget-native:do_populate_sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&=
lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${MISC_GIT_URI}/${MISC_GIT_PREFIX}qemu.git;protocol=3D${MISC_GIT_=
PROTOCOL};branch=3Dstable-2.1&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR:<br>
&gt; /home/jarvis/poky/meta-debian/recipes-kernel/linux-libc-headers/<a hre=
f=3D"http://linux-libc-headers-base_git.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">linux-libc-headers-base_git.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes_bas=
e_bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(=
d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_pac=
kage_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debi=
an_bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function:<br>
&gt; __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 needsrcrev =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 srcuri =3D d.getVar(&#39;SRC_UR=
I&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 for uri in srcuri.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 (scheme, _ , path=
) =3D bb.fetch.decodeurl(uri)[:3]<br>
&gt;=C2=A0 *** 0587:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # HTTP/FTP use th=
e wget fetcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scheme in (&qu=
ot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39;<br>
&gt; wget-native:do_populate_sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&=
lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=3D${=
LINUX_GIT_SRCREV};protocol=3D${LINUX_GIT_PROTOCOL}&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux/<a href=3D"h=
ttp://linux-base_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">li=
nux-base_git.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes_bas=
e_bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(=
d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_pac=
kage_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debi=
an_bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function:<br>
&gt; __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 needsrcrev =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 srcuri =3D d.getVar(&#39;SRC_UR=
I&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 for uri in srcuri.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 (scheme, _ , path=
) =3D bb.fetch.decodeurl(uri)[:3]<br>
&gt;=C2=A0 *** 0587:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # HTTP/FTP use th=
e wget fetcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scheme in (&qu=
ot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39;<br>
&gt; wget-native:do_populate_sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&=
lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=3D${=
LINUX_GIT_SRCREV};protocol=3D${LINUX_GIT_PROTOCOL}&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR: Failed to parse recipe:<br>
&gt; /home/jarvis/poky/meta-debian/recipes-misc/ltp/<a href=3D"http://ltp_g=
it.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ltp_git.bb</a><br>
&gt; ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zlib/<a href=3D"ht=
tp://zlib_debian.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">zlib_d=
ebian.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes_bas=
e_bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(=
d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_pac=
kage_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debi=
an_bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function:<br>
&gt; __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 needsrcrev =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 srcuri =3D d.getVar(&#39;SRC_UR=
I&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 for uri in srcuri.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 (scheme, _ , path=
) =3D bb.fetch.decodeurl(uri)[:3]<br>
&gt;=C2=A0 *** 0587:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # HTTP/FTP use th=
e wget fetcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scheme in (&qu=
ot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39;<br>
&gt; wget-native:do_populate_sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&=
lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zlib.git;protocol=3D${DEBIA=
N_GIT_PROTOCOL};branch=3Drocko-master&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR:<br>
&gt; /home/jarvis/poky/meta-debian/recipes-debian/zeromq3/<a href=3D"http:/=
/zeromq3_debian.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">zeromq3=
_debian.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes_bas=
e_bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(=
d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_pac=
kage_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debi=
an_bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function:<br>
&gt; __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 needsrcrev =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 srcuri =3D d.getVar(&#39;SRC_UR=
I&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 for uri in srcuri.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 (scheme, _ , path=
) =3D bb.fetch.decodeurl(uri)[:3]<br>
&gt;=C2=A0 *** 0587:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # HTTP/FTP use th=
e wget fetcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scheme in (&qu=
ot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39;<br>
&gt; wget-native:do_populate_sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&=
lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zeromq3.git;protocol=3D${DE=
BIAN_GIT_PROTOCOL};branch=3Drocko-master&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zip/<a href=3D"htt=
p://zip_debian.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">zip_debi=
an.bb</a>: Error<br>
&gt; executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes_bas=
e_bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(=
d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_pac=
kage_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debi=
an_bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function:<br>
&gt; __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0583:=C2=A0 =C2=A0 needsrcrev =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0584:=C2=A0 =C2=A0 srcuri =3D d.getVar(&#39;SRC_UR=
I&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0585:=C2=A0 =C2=A0 for uri in srcuri.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0586:=C2=A0 =C2=A0 =C2=A0 =C2=A0 (scheme, _ , path=
) =3D bb.fetch.decodeurl(uri)[:3]<br>
&gt;=C2=A0 *** 0587:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # HTTP/FTP use th=
e wget fetcher<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scheme in (&qu=
ot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39;<br>
&gt; wget-native:do_populate_sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&=
lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zip.git;protocol=3D${DEBIAN=
_GIT_PROTOCOL};branch=3Drocko-master&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; Do help me with the solution<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
</blockquote></div>

--001a114db11035cfdc0568420115--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D34B8605BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 19:51:41 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id o4so20742909iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qvCHUTxOuVyesNMwMwNQkOytgw/SlzYezDuKVwnGGls=;
	b=bpo+bWiSj0sl/Le/91WqZXg26DNa7LvcVUEHqvqAjFdXDHGoK6nFrU1elymuoRHC/2
	j0nkzJYQwuk8s6ioyCFk57+iBM7wWMFReoXqYFWh5gATxgut4BgH7krKv+uT2E7YMmoM
	LjkhBqybZN8RChMV6rrJYMG4qnu2RMOZI22CNQW6rvKW43+PexyZN/Hp8l/oYRe9Pfy8
	tEpUUbGG2LtY1tQiQ/bg0I6xlEhdWVhhck73eYSIlzHKTdDUx5PMj8AyYMQYkRT1FrX4
	jb7TO6TSvokj8jVMbIVHnqDeatWDslggmXhW1H1ZtG3qydFsiZeXncMW977958/dtUg6
	MSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qvCHUTxOuVyesNMwMwNQkOytgw/SlzYezDuKVwnGGls=;
	b=a9ycv7LS577aBvYfAVsLtZeWmGEYg6OIQZww8eSapaUHDP6MpEglgXOaBU7XcziPrd
	/+ExOC41RhZkHrIuFqc/ykF3WdvWq4OAZvrRGqRugWqN5WO43sHceLs+Rw/PINVxpwP/
	PmGHu5yjSFlLuQIGe5n4B5u1PwHSb8VGIfeVJ4UsKF+UGtSKtzxlBESvFjZZwPei5pQB
	TgN0cl7PM2pW9KUlGJUuDRMUt01pBHL7igfob2X4X6P9P5/ealgWBwmDUmu40VLXWMg+
	pMeTjVd7ijGzQdAUB/2X+0555E2a2JrsTRr5T5yP41G+EdXnjjfcgyRp4vib4lZ8rGqt
	R3rw==
X-Gm-Message-State: AElRT7HxRsUW4RJSoP8jhaO8PGKKyB2fVEHr1MfrHPG6xsy1U0AEv2LH
	7a8TB2EVJrVAAIvDQXLAbNY/Iz2Csj0m84FGzCiz7A==
X-Google-Smtp-Source: AIpwx4+yg9mJWxcm8dw7gX/Fb7n1yCnMyR6i58kObCToQ1kwpYe3HRK0iXUPoxGgUVZk4KJ8E7yYiZW92mAPUWCooQM=
X-Received: by 10.107.201.135 with SMTP id z129mr14269979iof.20.1522007502737; 
	Sun, 25 Mar 2018 12:51:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Sun, 25 Mar 2018 12:51:22 -0700 (PDT)
In-Reply-To: <CAPGMVzHQwth9b6MxA79OEwCVPMCwJTZ+j-WKwz-uemgXoPZy7g@mail.gmail.com>
References: <CAPGMVzHQwth9b6MxA79OEwCVPMCwJTZ+j-WKwz-uemgXoPZy7g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 25 Mar 2018 20:51:22 +0100
Message-ID: <CAJTo0LbL6BA5sNeOi+sH8VCdDBDhvdkztFxbQSkAsau2FRuNUQ@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
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
X-List-Received-Date: Sun, 25 Mar 2018 19:51:42 -0000
Content-Type: text/plain; charset="UTF-8"

Speaking as an oe-core maintainer, we don't support meta-debian: use
it at your own risk.

Ross

On 25 March 2018 at 20:49, Rajath C S <rajathcs.1996@gmail.com> wrote:
> Hi,
>
> I am encountering the below error while building meta-debian (which is added
> in bblayer.conf)
>
> ERROR: /home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb: Error
> executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 3, function: <module>
>      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
>      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
> __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>      0583:    needsrcrev = False
>      0584:    srcuri = d.getVar('SRC_URI')
>      0585:    for uri in srcuri.split():
>      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0587:
>      0588:        # HTTP/FTP use the wget fetcher
>      0589:        if scheme in ("http", "https", "ftp"):
>      0590:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0591:
> File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> function: decodeurl
>      0364:    """
>      0365:
>      0366:    m =
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
>      0367:    if not m:
>  *** 0368:        raise MalformedUrl(url)
>      0369:
>      0370:    type = m.group('type')
>      0371:    location = m.group('location')
>      0372:    if not location:
> Exception: bb.fetch2.MalformedUrl: The URL:
> '${MISC_GIT_URI}/${MISC_GIT_PREFIX}ltp.git;protocol=${MISC_GIT_PROTOCOL}' is
> invalid and cannot be interpreted
>
> ERROR:
> /home/jarvis/poky/meta-debian/recipes-misc/qemu/qemu-bios-native_1.7.0.bb:
> Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 3, function: <module>
>      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
>      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
> __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>      0583:    needsrcrev = False
>      0584:    srcuri = d.getVar('SRC_URI')
>      0585:    for uri in srcuri.split():
>      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0587:
>      0588:        # HTTP/FTP use the wget fetcher
>      0589:        if scheme in ("http", "https", "ftp"):
>      0590:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0591:
> File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> function: decodeurl
>      0364:    """
>      0365:
>      0366:    m =
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
>      0367:    if not m:
>  *** 0368:        raise MalformedUrl(url)
>      0369:
>      0370:    type = m.group('type')
>      0371:    location = m.group('location')
>      0372:    if not location:
> Exception: bb.fetch2.MalformedUrl: The URL:
> '${MISC_GIT_URI}/${MISC_GIT_PREFIX}qemu.git;protocol=${MISC_GIT_PROTOCOL};branch=stable-2.1'
> is invalid and cannot be interpreted
>
> ERROR:
> /home/jarvis/poky/meta-debian/recipes-kernel/linux-libc-headers/linux-libc-headers-base_git.bb:
> Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 3, function: <module>
>      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
>      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
> __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>      0583:    needsrcrev = False
>      0584:    srcuri = d.getVar('SRC_URI')
>      0585:    for uri in srcuri.split():
>      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0587:
>      0588:        # HTTP/FTP use the wget fetcher
>      0589:        if scheme in ("http", "https", "ftp"):
>      0590:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0591:
> File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> function: decodeurl
>      0364:    """
>      0365:
>      0366:    m =
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
>      0367:    if not m:
>  *** 0368:        raise MalformedUrl(url)
>      0369:
>      0370:    type = m.group('type')
>      0371:    location = m.group('location')
>      0372:    if not location:
> Exception: bb.fetch2.MalformedUrl: The URL:
> '${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
> is invalid and cannot be interpreted
>
> ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux/linux-base_git.bb:
> Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 3, function: <module>
>      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
>      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
> __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>      0583:    needsrcrev = False
>      0584:    srcuri = d.getVar('SRC_URI')
>      0585:    for uri in srcuri.split():
>      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0587:
>      0588:        # HTTP/FTP use the wget fetcher
>      0589:        if scheme in ("http", "https", "ftp"):
>      0590:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0591:
> File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> function: decodeurl
>      0364:    """
>      0365:
>      0366:    m =
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
>      0367:    if not m:
>  *** 0368:        raise MalformedUrl(url)
>      0369:
>      0370:    type = m.group('type')
>      0371:    location = m.group('location')
>      0372:    if not location:
> Exception: bb.fetch2.MalformedUrl: The URL:
> '${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
> is invalid and cannot be interpreted
>
> ERROR: Failed to parse recipe:
> /home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb
> ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zlib/zlib_debian.bb:
> Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 3, function: <module>
>      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
>      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
> __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>      0583:    needsrcrev = False
>      0584:    srcuri = d.getVar('SRC_URI')
>      0585:    for uri in srcuri.split():
>      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0587:
>      0588:        # HTTP/FTP use the wget fetcher
>      0589:        if scheme in ("http", "https", "ftp"):
>      0590:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0591:
> File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> function: decodeurl
>      0364:    """
>      0365:
>      0366:    m =
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
>      0367:    if not m:
>  *** 0368:        raise MalformedUrl(url)
>      0369:
>      0370:    type = m.group('type')
>      0371:    location = m.group('location')
>      0372:    if not location:
> Exception: bb.fetch2.MalformedUrl: The URL:
> '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zlib.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
> is invalid and cannot be interpreted
>
> ERROR:
> /home/jarvis/poky/meta-debian/recipes-debian/zeromq3/zeromq3_debian.bb:
> Error executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 3, function: <module>
>      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
>      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
> __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>      0583:    needsrcrev = False
>      0584:    srcuri = d.getVar('SRC_URI')
>      0585:    for uri in srcuri.split():
>      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0587:
>      0588:        # HTTP/FTP use the wget fetcher
>      0589:        if scheme in ("http", "https", "ftp"):
>      0590:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0591:
> File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> function: decodeurl
>      0364:    """
>      0365:
>      0366:    m =
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
>      0367:    if not m:
>  *** 0368:        raise MalformedUrl(url)
>      0369:
>      0370:    type = m.group('type')
>      0371:    location = m.group('location')
>      0372:    if not location:
> Exception: bb.fetch2.MalformedUrl: The URL:
> '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zeromq3.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
> is invalid and cannot be interpreted
>
> ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zip/zip_debian.bb: Error
> executing a python function in <code>:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 3, function: <module>
>      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
>      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
> File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
> __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>      0583:    needsrcrev = False
>      0584:    srcuri = d.getVar('SRC_URI')
>      0585:    for uri in srcuri.split():
>      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0587:
>      0588:        # HTTP/FTP use the wget fetcher
>      0589:        if scheme in ("http", "https", "ftp"):
>      0590:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0591:
> File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
> function: decodeurl
>      0364:    """
>      0365:
>      0366:    m =
> re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
>      0367:    if not m:
>  *** 0368:        raise MalformedUrl(url)
>      0369:
>      0370:    type = m.group('type')
>      0371:    location = m.group('location')
>      0372:    if not location:
> Exception: bb.fetch2.MalformedUrl: The URL:
> '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zip.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
> is invalid and cannot be interpreted
>
> Do help me with the solution
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


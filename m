Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 24AE67803F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 19:58:07 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id c40so10819146uae.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hyh+0UDYyU31LiFeRZ+GsgIHcrCgQKBYpoDDKZ8ByL4=;
	b=Z5A8HIb1+tqbzD3NzNn733KDYPsmAq/e+zluFgYtQdfSi4LWleWZ+puisjZqJ+1AoK
	vxMMQwFCpNP1uxaoRYzXN+YdfVDMLCrcBZMiPz1pJNu7qqWVV3nsumz+yAQVgH2bBkX5
	IsL/5xDnlLWZmpP0Y+fGmj+DUC61jIkAnlZHbMJodNMOpfMsuWufSka6tC+5PDsKB9vI
	OX1xLJEmhIfFrA3d0jb5kbEWqzzaSZaWTG+cPw7q746tWvZ8Vb+M+DkC4fIq9WJF5EHH
	y4QY8ERd27SzVRkI/CpbuVVUDJTlDUCNjYJFx5qxtZJMOE5HDTlibwh6+4Zoho1b2Spl
	L+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hyh+0UDYyU31LiFeRZ+GsgIHcrCgQKBYpoDDKZ8ByL4=;
	b=HEeT1Ob8mB/CpFqKQHBWbDaQ3C7Rg7RGB+PHlSiLdxpPqA9ffRvLcQxVHIx0VcUW6s
	OlEpQO5hACe6qDMrHL3j6ILbtvUweOD5gk30TXZ4P6WN1Y9ZPP0cKEC1y8Jq5Z4Mj0JZ
	UKcBoH3mtAQS9B/9vS2MlAvzC5o/Wzp3zqwOOdz4UUl73shfFwGhTXlggvUEW4IDEfna
	1KszaWjt3xjXdSLUgr24yduyu1apEz3X7JcNSjnAMdxPx40k55jjYVDp/RnW3y1FIb9G
	wHKahReWNFnWXbC+oqKMNa0JJNvfyHWyGGPEgk9bCTE3Kaqi+mdxmRcznxj1JG2s5tbV
	0ubw==
X-Gm-Message-State: AElRT7FVM3wF1hv9qiB2+dkow+J3iwG+tI2tCpMiI1lPZ/CGE15YakNC
	PBkI1BN+mA1vnVUy4QP453KSdie0MBS5iQbemZE=
X-Google-Smtp-Source: AG47ELsOq58NDqUekSe6cFpRhhItCyEF3fW3dq2U/G67GaJv0H/m2VB5lTfGxPhiJxMe9X3yCHtWZ6LDHoRTWc6mnC8=
X-Received: by 10.176.78.167 with SMTP id l39mr26068707uah.193.1522007888632; 
	Sun, 25 Mar 2018 12:58:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Sun, 25 Mar 2018 12:58:08 -0700 (PDT)
In-Reply-To: <CAPGMVzEA52STvoMh=cAHqxsYc++pmxmhywVM082thHuB_OJ_0w@mail.gmail.com>
References: <CAPGMVzHQwth9b6MxA79OEwCVPMCwJTZ+j-WKwz-uemgXoPZy7g@mail.gmail.com>
	<CAJTo0LbL6BA5sNeOi+sH8VCdDBDhvdkztFxbQSkAsau2FRuNUQ@mail.gmail.com>
	<CAPGMVzEA52STvoMh=cAHqxsYc++pmxmhywVM082thHuB_OJ_0w@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Mon, 26 Mar 2018 01:28:08 +0530
Message-ID: <CAPGMVzE+kKb7OwafERjT6J+iSwWU-4R1gvx0tD5uBTabQ1B-5g@mail.gmail.com>
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
X-List-Received-Date: Sun, 25 Mar 2018 19:58:08 -0000
Content-Type: multipart/alternative; boundary="f403043eee748c1e8d056842133e"

--f403043eee748c1e8d056842133e
Content-Type: text/plain; charset="UTF-8"

Error while building opencv

ERROR:
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0
do_compile: Function failed: do_compile (log file is located at
/home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_compile.7688)
ERROR: Logfile of failure stored in:
/home/jarvis/poky/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_compile.7688

may i know what this error is precisely referring to  i dint have this
error when i was trying to build opencv yesterday

Thanks



Rajath C S,
9964182112,
Bangalore - 560060

On Mon, Mar 26, 2018 at 1:22 AM, Rajath C S <rajathcs.1996@gmail.com> wrote:

> Ok, thanks for the clarification.
>
> On Mon, 26 Mar 2018, 01:21 Burton, Ross, <ross.burton@intel.com> wrote:
>
>> Speaking as an oe-core maintainer, we don't support meta-debian: use
>> it at your own risk.
>>
>> Ross
>>
>> On 25 March 2018 at 20:49, Rajath C S <rajathcs.1996@gmail.com> wrote:
>> > Hi,
>> >
>> > I am encountering the below error while building meta-debian (which is
>> added
>> > in bblayer.conf)
>> >
>> > ERROR: /home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb: Error
>> > executing a python function in <code>:
>> >
>> > The stack trace of python calls that resulted in this exception/failure
>> was:
>> > File: '<code>', lineno: 3, function: <module>
>> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>> >      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_
>> bbclass(d)
>> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
>> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
>> function:
>> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>> >      0583:    needsrcrev = False
>> >      0584:    srcuri = d.getVar('SRC_URI')
>> >      0585:    for uri in srcuri.split():
>> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>> >  *** 0587:
>> >      0588:        # HTTP/FTP use the wget fetcher
>> >      0589:        if scheme in ("http", "https", "ftp"):
>> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
>> > wget-native:do_populate_sysroot')
>> >      0591:
>> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno:
>> 368,
>> > function: decodeurl
>> >      0364:    """
>> >      0365:
>> >      0366:    m =
>> > re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<
>> location>[^;]+)(;(?P<parm>.*))?').match(url)
>> >      0367:    if not m:
>> >  *** 0368:        raise MalformedUrl(url)
>> >      0369:
>> >      0370:    type = m.group('type')
>> >      0371:    location = m.group('location')
>> >      0372:    if not location:
>> > Exception: bb.fetch2.MalformedUrl: The URL:
>> > '${MISC_GIT_URI}/${MISC_GIT_PREFIX}ltp.git;protocol=${MISC_GIT_PROTOCOL}'
>> is
>> > invalid and cannot be interpreted
>> >
>> > ERROR:
>> > /home/jarvis/poky/meta-debian/recipes-misc/qemu/qemu-bios-
>> native_1.7.0.bb:
>> > Error executing a python function in <code>:
>> >
>> > The stack trace of python calls that resulted in this exception/failure
>> was:
>> > File: '<code>', lineno: 3, function: <module>
>> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>> >      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_
>> bbclass(d)
>> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
>> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
>> function:
>> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>> >      0583:    needsrcrev = False
>> >      0584:    srcuri = d.getVar('SRC_URI')
>> >      0585:    for uri in srcuri.split():
>> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>> >  *** 0587:
>> >      0588:        # HTTP/FTP use the wget fetcher
>> >      0589:        if scheme in ("http", "https", "ftp"):
>> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
>> > wget-native:do_populate_sysroot')
>> >      0591:
>> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno:
>> 368,
>> > function: decodeurl
>> >      0364:    """
>> >      0365:
>> >      0366:    m =
>> > re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<
>> location>[^;]+)(;(?P<parm>.*))?').match(url)
>> >      0367:    if not m:
>> >  *** 0368:        raise MalformedUrl(url)
>> >      0369:
>> >      0370:    type = m.group('type')
>> >      0371:    location = m.group('location')
>> >      0372:    if not location:
>> > Exception: bb.fetch2.MalformedUrl: The URL:
>> > '${MISC_GIT_URI}/${MISC_GIT_PREFIX}qemu.git;protocol=${
>> MISC_GIT_PROTOCOL};branch=stable-2.1'
>> > is invalid and cannot be interpreted
>> >
>> > ERROR:
>> > /home/jarvis/poky/meta-debian/recipes-kernel/linux-libc-headers/
>> linux-libc-headers-base_git.bb:
>> > Error executing a python function in <code>:
>> >
>> > The stack trace of python calls that resulted in this exception/failure
>> was:
>> > File: '<code>', lineno: 3, function: <module>
>> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>> >      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_
>> bbclass(d)
>> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
>> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
>> function:
>> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>> >      0583:    needsrcrev = False
>> >      0584:    srcuri = d.getVar('SRC_URI')
>> >      0585:    for uri in srcuri.split():
>> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>> >  *** 0587:
>> >      0588:        # HTTP/FTP use the wget fetcher
>> >      0589:        if scheme in ("http", "https", "ftp"):
>> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
>> > wget-native:do_populate_sysroot')
>> >      0591:
>> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno:
>> 368,
>> > function: decodeurl
>> >      0364:    """
>> >      0365:
>> >      0366:    m =
>> > re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<
>> location>[^;]+)(;(?P<parm>.*))?').match(url)
>> >      0367:    if not m:
>> >  *** 0368:        raise MalformedUrl(url)
>> >      0369:
>> >      0370:    type = m.group('type')
>> >      0371:    location = m.group('location')
>> >      0372:    if not location:
>> > Exception: bb.fetch2.MalformedUrl: The URL:
>> > '${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};
>> branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
>> > is invalid and cannot be interpreted
>> >
>> > ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux/linux-
>> base_git.bb:
>> > Error executing a python function in <code>:
>> >
>> > The stack trace of python calls that resulted in this exception/failure
>> was:
>> > File: '<code>', lineno: 3, function: <module>
>> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>> >      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_
>> bbclass(d)
>> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
>> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
>> function:
>> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>> >      0583:    needsrcrev = False
>> >      0584:    srcuri = d.getVar('SRC_URI')
>> >      0585:    for uri in srcuri.split():
>> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>> >  *** 0587:
>> >      0588:        # HTTP/FTP use the wget fetcher
>> >      0589:        if scheme in ("http", "https", "ftp"):
>> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
>> > wget-native:do_populate_sysroot')
>> >      0591:
>> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno:
>> 368,
>> > function: decodeurl
>> >      0364:    """
>> >      0365:
>> >      0366:    m =
>> > re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<
>> location>[^;]+)(;(?P<parm>.*))?').match(url)
>> >      0367:    if not m:
>> >  *** 0368:        raise MalformedUrl(url)
>> >      0369:
>> >      0370:    type = m.group('type')
>> >      0371:    location = m.group('location')
>> >      0372:    if not location:
>> > Exception: bb.fetch2.MalformedUrl: The URL:
>> > '${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};
>> branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
>> > is invalid and cannot be interpreted
>> >
>> > ERROR: Failed to parse recipe:
>> > /home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb
>> > ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zlib/zlib_debian.bb
>> :
>> > Error executing a python function in <code>:
>> >
>> > The stack trace of python calls that resulted in this exception/failure
>> was:
>> > File: '<code>', lineno: 3, function: <module>
>> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>> >      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_
>> bbclass(d)
>> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
>> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
>> function:
>> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>> >      0583:    needsrcrev = False
>> >      0584:    srcuri = d.getVar('SRC_URI')
>> >      0585:    for uri in srcuri.split():
>> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>> >  *** 0587:
>> >      0588:        # HTTP/FTP use the wget fetcher
>> >      0589:        if scheme in ("http", "https", "ftp"):
>> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
>> > wget-native:do_populate_sysroot')
>> >      0591:
>> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno:
>> 368,
>> > function: decodeurl
>> >      0364:    """
>> >      0365:
>> >      0366:    m =
>> > re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<
>> location>[^;]+)(;(?P<parm>.*))?').match(url)
>> >      0367:    if not m:
>> >  *** 0368:        raise MalformedUrl(url)
>> >      0369:
>> >      0370:    type = m.group('type')
>> >      0371:    location = m.group('location')
>> >      0372:    if not location:
>> > Exception: bb.fetch2.MalformedUrl: The URL:
>> > '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zlib.git;protocol=$
>> {DEBIAN_GIT_PROTOCOL};branch=rocko-master'
>> > is invalid and cannot be interpreted
>> >
>> > ERROR:
>> > /home/jarvis/poky/meta-debian/recipes-debian/zeromq3/zeromq3_debian.bb:
>> > Error executing a python function in <code>:
>> >
>> > The stack trace of python calls that resulted in this exception/failure
>> was:
>> > File: '<code>', lineno: 3, function: <module>
>> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>> >      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_
>> bbclass(d)
>> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
>> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
>> function:
>> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>> >      0583:    needsrcrev = False
>> >      0584:    srcuri = d.getVar('SRC_URI')
>> >      0585:    for uri in srcuri.split():
>> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>> >  *** 0587:
>> >      0588:        # HTTP/FTP use the wget fetcher
>> >      0589:        if scheme in ("http", "https", "ftp"):
>> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
>> > wget-native:do_populate_sysroot')
>> >      0591:
>> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno:
>> 368,
>> > function: decodeurl
>> >      0364:    """
>> >      0365:
>> >      0366:    m =
>> > re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<
>> location>[^;]+)(;(?P<parm>.*))?').match(url)
>> >      0367:    if not m:
>> >  *** 0368:        raise MalformedUrl(url)
>> >      0369:
>> >      0370:    type = m.group('type')
>> >      0371:    location = m.group('location')
>> >      0372:    if not location:
>> > Exception: bb.fetch2.MalformedUrl: The URL:
>> > '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zeromq3.git;
>> protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
>> > is invalid and cannot be interpreted
>> >
>> > ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zip/zip_debian.bb:
>> Error
>> > executing a python function in <code>:
>> >
>> > The stack trace of python calls that resulted in this exception/failure
>> was:
>> > File: '<code>', lineno: 3, function: <module>
>> >      0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
>> >      0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >  *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
>> >      0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
>> >      0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
>> >      0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_
>> bbclass(d)
>> >      0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
>> > File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587,
>> function:
>> > __anon_686__home_jarvis_poky_meta_classes_base_bbclass
>> >      0583:    needsrcrev = False
>> >      0584:    srcuri = d.getVar('SRC_URI')
>> >      0585:    for uri in srcuri.split():
>> >      0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>> >  *** 0587:
>> >      0588:        # HTTP/FTP use the wget fetcher
>> >      0589:        if scheme in ("http", "https", "ftp"):
>> >      0590:            d.appendVarFlag('do_fetch', 'depends', '
>> > wget-native:do_populate_sysroot')
>> >      0591:
>> > File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno:
>> 368,
>> > function: decodeurl
>> >      0364:    """
>> >      0365:
>> >      0366:    m =
>> > re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<
>> location>[^;]+)(;(?P<parm>.*))?').match(url)
>> >      0367:    if not m:
>> >  *** 0368:        raise MalformedUrl(url)
>> >      0369:
>> >      0370:    type = m.group('type')
>> >      0371:    location = m.group('location')
>> >      0372:    if not location:
>> > Exception: bb.fetch2.MalformedUrl: The URL:
>> > '${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zip.git;protocol=${
>> DEBIAN_GIT_PROTOCOL};branch=rocko-master'
>> > is invalid and cannot be interpreted
>> >
>> > Do help me with the solution
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>>
>

--f403043eee748c1e8d056842133e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Error while building opencv<br><div><br>ERROR: opencv-3.3+=
gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0 do_com=
pile: Function failed: do_compile (log file is located at /home/jarvis/poky=
/build/tmp/work/i586-poky-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed=
_a62e20676a_34e4206aef_fccf7cd6a4-r0/temp/log.do_compile.7688)<br>ERROR: Lo=
gfile of failure stored in: /home/jarvis/poky/build/tmp/work/i586-poky-linu=
x/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4-r0/temp/log.do_compile.7688<br><br></div><div>may i know what this erro=
r is precisely referring to=C2=A0 i dint have this error when i was trying =
to build opencv yesterday<br><br></div><div>Thanks<br></div><div><br><br></=
div></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></=
div></div>
<br><div class=3D"gmail_quote">On Mon, Mar 26, 2018 at 1:22 AM, Rajath C S =
<span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"=
_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"auto">Ok, thanks for the clarification.=C2=A0</di=
v><div class=3D"HOEnZb"><div class=3D"h5"><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Mon, 26 Mar 2018, 01:21 Burton, Ross, &lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Speaking as an oe-core mainta=
iner, we don&#39;t support meta-debian: use<br>
it at your own risk.<br>
<br>
Ross<br>
<br>
On 25 March 2018 at 20:49, Rajath C S &lt;<a href=3D"mailto:rajathcs.1996@g=
mail.com" rel=3D"noreferrer" target=3D"_blank">rajathcs.1996@gmail.com</a>&=
gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am encountering the below error while building meta-debian (which is=
 added<br>
&gt; in bblayer.conf)<br>
&gt;<br>
&gt; ERROR: /home/jarvis/poky/meta-debian/<wbr>recipes-misc/ltp/<a href=3D"=
http://ltp_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ltp_git.=
bb</a>: Error<br>
&gt; executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_patch_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_<wbr>poky_meta_classe=
s_base_<wbr>bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_<wbr>poky_meta_classes_base_<wb=
r>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_<wbr>poky_meta_class=
es_insane_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_<wbr>poky_meta_classe=
s_package_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_<wbr>poky_meta_classe=
s_package_deb_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_debian_<wbr>bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/<wbr>classes/base.bbclass&#39;, line=
no: 587, function:<br>
&gt; __anon_686__home_jarvis_poky_<wbr>meta_classes_base_bbclass<br>
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
&gt; wget-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/<wbr>lib/bb/fetch2/__init__.py&#3=
9;, lineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://<wbr>((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;<wbr>location&gt;[^;]+)(;(?P&lt;parm&gt;.*))<wbr>?&#39;).match(url)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${MISC_GIT_URI}/${MISC_GIT_<wbr>PREFIX}ltp.git;protocol=3D${<wbr>=
MISC_GIT_PROTOCOL}&#39; is<br>
&gt; invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR:<br>
&gt; /home/jarvis/poky/meta-debian/<wbr>recipes-misc/qemu/<a href=3D"http:/=
/qemu-bios-native_1.7.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>qemu-bios-<wbr>native_1.7.0.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_patch_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_<wbr>poky_meta_classe=
s_base_<wbr>bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_<wbr>poky_meta_classes_base_<wb=
r>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_<wbr>poky_meta_class=
es_insane_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_<wbr>poky_meta_classe=
s_package_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_<wbr>poky_meta_classe=
s_package_deb_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_debian_<wbr>bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/<wbr>classes/base.bbclass&#39;, line=
no: 587, function:<br>
&gt; __anon_686__home_jarvis_poky_<wbr>meta_classes_base_bbclass<br>
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
&gt; wget-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/<wbr>lib/bb/fetch2/__init__.py&#3=
9;, lineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://<wbr>((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;<wbr>location&gt;[^;]+)(;(?P&lt;parm&gt;.*))<wbr>?&#39;).match(url)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${MISC_GIT_URI}/${MISC_GIT_<wbr>PREFIX}qemu.git;protocol=3D${<wbr=
>MISC_GIT_PROTOCOL};branch=3D<wbr>stable-2.1&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR:<br>
&gt; /home/jarvis/poky/meta-debian/<wbr>recipes-kernel/linux-libc-<wbr>head=
ers/<a href=3D"http://linux-libc-headers-base_git.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">linux-libc-headers-<wbr>base_git.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_patch_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_<wbr>poky_meta_classe=
s_base_<wbr>bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_<wbr>poky_meta_classes_base_<wb=
r>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_<wbr>poky_meta_class=
es_insane_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_<wbr>poky_meta_classe=
s_package_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_<wbr>poky_meta_classe=
s_package_deb_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_debian_<wbr>bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/<wbr>classes/base.bbclass&#39;, line=
no: 587, function:<br>
&gt; __anon_686__home_jarvis_poky_<wbr>meta_classes_base_bbclass<br>
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
&gt; wget-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/<wbr>lib/bb/fetch2/__init__.py&#3=
9;, lineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://<wbr>((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;<wbr>location&gt;[^;]+)(;(?P&lt;parm&gt;.*))<wbr>?&#39;).match(url)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${LINUX_GIT_URI}/${LINUX_GIT_<wbr>PREFIX}${LINUX_GIT_REPO};<wbr>b=
ranch=3D${LINUX_GIT_SRCREV};<wbr>protocol=3D${LINUX_GIT_PROTOCOL}<wbr>&#39;=
<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR: /home/jarvis/poky/meta-debian/<wbr>recipes-kernel/linux/<a href=
=3D"http://linux-base_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">linux-<wbr>base_git.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_patch_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_<wbr>poky_meta_classe=
s_base_<wbr>bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_<wbr>poky_meta_classes_base_<wb=
r>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_<wbr>poky_meta_class=
es_insane_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_<wbr>poky_meta_classe=
s_package_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_<wbr>poky_meta_classe=
s_package_deb_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_debian_<wbr>bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/<wbr>classes/base.bbclass&#39;, line=
no: 587, function:<br>
&gt; __anon_686__home_jarvis_poky_<wbr>meta_classes_base_bbclass<br>
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
&gt; wget-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/<wbr>lib/bb/fetch2/__init__.py&#3=
9;, lineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://<wbr>((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;<wbr>location&gt;[^;]+)(;(?P&lt;parm&gt;.*))<wbr>?&#39;).match(url)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${LINUX_GIT_URI}/${LINUX_GIT_<wbr>PREFIX}${LINUX_GIT_REPO};<wbr>b=
ranch=3D${LINUX_GIT_SRCREV};<wbr>protocol=3D${LINUX_GIT_PROTOCOL}<wbr>&#39;=
<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR: Failed to parse recipe:<br>
&gt; /home/jarvis/poky/meta-debian/<wbr>recipes-misc/ltp/<a href=3D"http://=
ltp_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ltp_git.bb</a><=
br>
&gt; ERROR: /home/jarvis/poky/meta-debian/<wbr>recipes-debian/zlib/<a href=
=3D"http://zlib_debian.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
zlib_<wbr>debian.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_patch_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_<wbr>poky_meta_classe=
s_base_<wbr>bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_<wbr>poky_meta_classes_base_<wb=
r>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_<wbr>poky_meta_class=
es_insane_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_<wbr>poky_meta_classe=
s_package_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_<wbr>poky_meta_classe=
s_package_deb_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_debian_<wbr>bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/<wbr>classes/base.bbclass&#39;, line=
no: 587, function:<br>
&gt; __anon_686__home_jarvis_poky_<wbr>meta_classes_base_bbclass<br>
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
&gt; wget-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/<wbr>lib/bb/fetch2/__init__.py&#3=
9;, lineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://<wbr>((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;<wbr>location&gt;[^;]+)(;(?P&lt;parm&gt;.*))<wbr>?&#39;).match(url)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${DEBIAN_GIT_URI}/${DEBIAN_<wbr>GIT_PREFIX}zlib.git;protocol=3D$<=
wbr>{DEBIAN_GIT_PROTOCOL};branch=3D<wbr>rocko-master&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR:<br>
&gt; /home/jarvis/poky/meta-debian/<wbr>recipes-debian/zeromq3/<a href=3D"h=
ttp://zeromq3_debian.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ze=
romq3<wbr>_debian.bb</a>:<br>
&gt; Error executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_patch_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_<wbr>poky_meta_classe=
s_base_<wbr>bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_<wbr>poky_meta_classes_base_<wb=
r>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_<wbr>poky_meta_class=
es_insane_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_<wbr>poky_meta_classe=
s_package_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_<wbr>poky_meta_classe=
s_package_deb_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_debian_<wbr>bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/<wbr>classes/base.bbclass&#39;, line=
no: 587, function:<br>
&gt; __anon_686__home_jarvis_poky_<wbr>meta_classes_base_bbclass<br>
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
&gt; wget-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/<wbr>lib/bb/fetch2/__init__.py&#3=
9;, lineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://<wbr>((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;<wbr>location&gt;[^;]+)(;(?P&lt;parm&gt;.*))<wbr>?&#39;).match(url)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${DEBIAN_GIT_URI}/${DEBIAN_<wbr>GIT_PREFIX}zeromq3.git;<wbr>proto=
col=3D${DEBIAN_GIT_<wbr>PROTOCOL};branch=3Drocko-master&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; ERROR: /home/jarvis/poky/meta-debian/<wbr>recipes-debian/zip/<a href=
=3D"http://zip_debian.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">z=
ip_debian.<wbr>bb</a>: Error<br>
&gt; executing a python function in &lt;code&gt;:<br>
&gt;<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_patch_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0002:__anon_160__home_jarvis_<wbr>poky_meta_classe=
s_base_<wbr>bbclass(d)<br>
&gt;=C2=A0 *** 0003:__anon_686__home_jarvis_<wbr>poky_meta_classes_base_<wb=
r>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0004:__anon_1305__home_jarvis_<wbr>poky_meta_class=
es_insane_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0005:__anon_250__home_jarvis_<wbr>poky_meta_classe=
s_package_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0006:__anon_352__home_jarvis_<wbr>poky_meta_classe=
s_package_deb_<wbr>bbclass(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0007:__anon_25__home_jarvis_<wbr>poky_meta_classes=
_debian_<wbr>bbclass(d)<br>
&gt; File: &#39;/home/jarvis/poky/meta/<wbr>classes/base.bbclass&#39;, line=
no: 587, function:<br>
&gt; __anon_686__home_jarvis_poky_<wbr>meta_classes_base_bbclass<br>
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
&gt; wget-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0591:<br>
&gt; File: &#39;/home/jarvis/poky/bitbake/<wbr>lib/bb/fetch2/__init__.py&#3=
9;, lineno: 368,<br>
&gt; function: decodeurl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0364:=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0365:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0366:=C2=A0 =C2=A0 m =3D<br>
&gt; re.compile(&#39;(?P&lt;type&gt;[^:]*)://<wbr>((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;<wbr>location&gt;[^;]+)(;(?P&lt;parm&gt;.*))<wbr>?&#39;).match(url)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0367:=C2=A0 =C2=A0 if not m:<br>
&gt;=C2=A0 *** 0368:=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise MalformedUrl(url)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0369:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0370:=C2=A0 =C2=A0 type =3D m.group(&#39;type&#39;=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0371:=C2=A0 =C2=A0 location =3D m.group(&#39;locat=
ion&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0372:=C2=A0 =C2=A0 if not location:<br>
&gt; Exception: bb.fetch2.MalformedUrl: The URL:<br>
&gt; &#39;${DEBIAN_GIT_URI}/${DEBIAN_<wbr>GIT_PREFIX}zip.git;protocol=3D${<=
wbr>DEBIAN_GIT_PROTOCOL};branch=3D<wbr>rocko-master&#39;<br>
&gt; is invalid and cannot be interpreted<br>
&gt;<br>
&gt; Do help me with the solution<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">Openembedded-core@lists.<wbr>openembedded.org</a=
><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</blockquote></div></div></div></blockquote></div><br></div>

--f403043eee748c1e8d056842133e--

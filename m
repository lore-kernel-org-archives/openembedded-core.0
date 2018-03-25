Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C839605BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 19:49:10 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id f124so10031358vkg.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=ZhfYMg1rqTj6EuijXhKFet90YmI1USByUhEL4IpBYiQ=;
	b=QHTj/j2GeueruPgbZW0vF1pxTLWIZf9tWKFzxahT9+Hli2Rlc1mL3vjns4sLrskvl2
	+YSEkJiHda9jQwRNMW4XTSuGQ/SGbQJrgy8xwe+L8EApPqsi6AN1TwbW5WNLaOillVMP
	MokDxEM4Y2J6f45+cwmLQ3qFCtTe1QNu5L3H1kcNT30gtCfq6Cyej7AWix2twFd+jaKU
	Grr+TYr6pYvQcO4PYPRXzrymMlJBfzL/uipJQA2HfLNCkxRFciy+5bEj+/fAKWVmElnf
	niSLekIoW9PWsyEcvycNmaecrDyvDs94fni98PwLqXbu9yez0/8B5i5H5lChI5XFaunR
	oSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=ZhfYMg1rqTj6EuijXhKFet90YmI1USByUhEL4IpBYiQ=;
	b=GPXftXJXE8/95+zIjY8WgXwOo8eVWiyaKjrpgGaCy6siaCJLCFkK4zeqSxFR3wU9g3
	gF5TH59j5LAFxt9DoRW8tP77dmkXuzusUxGLw1cazhY/hUNbotgEjA8Bf2tzZ4Es4lL2
	9Y8vLH6H9GPGPW+dh5IflOSi3R5agKu8SvH5bth1GKt/FjKx7jzt2gFNkSjjpT4klTU4
	GN1nXI3Z/U80ZqlQx6eF6JNFu0socrp7yh98P10AHsHTH8HGgq+XlEHPM/nIFTlZ9Z6G
	N9tBSwrqfwe7yzLaNmMBbGN+356iTze6jQYLcMerOizyxfzfP3/p1xQbvHGK4KxL0BZw
	MGcg==
X-Gm-Message-State: AElRT7FN8CnNstxM/mqzUihAU+8BrW6p51dBMjavAuGz79qANSPpTT+T
	KUN7qKufZ4A1s5gs9P9S680cW/3YpXPqOVXeISw59w==
X-Google-Smtp-Source: AG47ELsGlMBGi6pd4ymYRTZvAyLVCek31/XqKUdcDq81pe9JXVxIRsp527BVCE617jDu7+qK+J/sInPCcRzB9KyR5FI=
X-Received: by 10.31.198.131 with SMTP id w125mr22865048vkf.158.1522007351455; 
	Sun, 25 Mar 2018 12:49:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Sun, 25 Mar 2018 12:49:10 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Mon, 26 Mar 2018 01:19:10 +0530
Message-ID: <CAPGMVzHQwth9b6MxA79OEwCVPMCwJTZ+j-WKwz-uemgXoPZy7g@mail.gmail.com>
To: yoshitake.kobayashi@toshiba.co.jp
Cc: kazuhiro3.hayashi@toshiba.co.jp,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: [meta-debian] build error
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
X-List-Received-Date: Sun, 25 Mar 2018 19:49:11 -0000
Content-Type: multipart/alternative; boundary="001a114db6c287741a056841f3d5"

--001a114db6c287741a056841f3d5
Content-Type: text/plain; charset="UTF-8"

Hi,

I am encountering the below error while building meta-debian (which is
added in bblayer.conf)

ERROR: /home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb: Error
executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 3, function: <module>
     0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
     0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
     0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
     0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
     0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
     0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
__anon_686__home_jarvis_poky_meta_classes_base_bbclass
     0583:    needsrcrev = False
     0584:    srcuri = d.getVar('SRC_URI')
     0585:    for uri in srcuri.split():
     0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0587:
     0588:        # HTTP/FTP use the wget fetcher
     0589:        if scheme in ("http", "https", "ftp"):
     0590:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0591:
File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
function: decodeurl
     0364:    """
     0365:
     0366:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0367:    if not m:
 *** 0368:        raise MalformedUrl(url)
     0369:
     0370:    type = m.group('type')
     0371:    location = m.group('location')
     0372:    if not location:
Exception: bb.fetch2.MalformedUrl: The URL:
'${MISC_GIT_URI}/${MISC_GIT_PREFIX}ltp.git;protocol=${MISC_GIT_PROTOCOL}'
is invalid and cannot be interpreted

ERROR: /home/jarvis/poky/meta-debian/recipes-misc/qemu/
qemu-bios-native_1.7.0.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 3, function: <module>
     0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
     0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
     0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
     0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
     0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
     0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
__anon_686__home_jarvis_poky_meta_classes_base_bbclass
     0583:    needsrcrev = False
     0584:    srcuri = d.getVar('SRC_URI')
     0585:    for uri in srcuri.split():
     0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0587:
     0588:        # HTTP/FTP use the wget fetcher
     0589:        if scheme in ("http", "https", "ftp"):
     0590:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0591:
File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
function: decodeurl
     0364:    """
     0365:
     0366:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0367:    if not m:
 *** 0368:        raise MalformedUrl(url)
     0369:
     0370:    type = m.group('type')
     0371:    location = m.group('location')
     0372:    if not location:
Exception: bb.fetch2.MalformedUrl: The URL:
'${MISC_GIT_URI}/${MISC_GIT_PREFIX}qemu.git;protocol=${MISC_GIT_PROTOCOL};branch=stable-2.1'
is invalid and cannot be interpreted

ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux-libc-headers/
linux-libc-headers-base_git.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 3, function: <module>
     0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
     0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
     0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
     0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
     0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
     0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
__anon_686__home_jarvis_poky_meta_classes_base_bbclass
     0583:    needsrcrev = False
     0584:    srcuri = d.getVar('SRC_URI')
     0585:    for uri in srcuri.split():
     0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0587:
     0588:        # HTTP/FTP use the wget fetcher
     0589:        if scheme in ("http", "https", "ftp"):
     0590:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0591:
File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
function: decodeurl
     0364:    """
     0365:
     0366:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0367:    if not m:
 *** 0368:        raise MalformedUrl(url)
     0369:
     0370:    type = m.group('type')
     0371:    location = m.group('location')
     0372:    if not location:
Exception: bb.fetch2.MalformedUrl: The URL:
'${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
is invalid and cannot be interpreted

ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux/linux-base_git.bb:
Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 3, function: <module>
     0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
     0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
     0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
     0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
     0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
     0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
__anon_686__home_jarvis_poky_meta_classes_base_bbclass
     0583:    needsrcrev = False
     0584:    srcuri = d.getVar('SRC_URI')
     0585:    for uri in srcuri.split():
     0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0587:
     0588:        # HTTP/FTP use the wget fetcher
     0589:        if scheme in ("http", "https", "ftp"):
     0590:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0591:
File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
function: decodeurl
     0364:    """
     0365:
     0366:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0367:    if not m:
 *** 0368:        raise MalformedUrl(url)
     0369:
     0370:    type = m.group('type')
     0371:    location = m.group('location')
     0372:    if not location:
Exception: bb.fetch2.MalformedUrl: The URL:
'${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=${LINUX_GIT_SRCREV};protocol=${LINUX_GIT_PROTOCOL}'
is invalid and cannot be interpreted

ERROR: Failed to parse recipe:
/home/jarvis/poky/meta-debian/recipes-misc/ltp/ltp_git.bb
ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zlib/zlib_debian.bb:
Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 3, function: <module>
     0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
     0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
     0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
     0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
     0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
     0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
__anon_686__home_jarvis_poky_meta_classes_base_bbclass
     0583:    needsrcrev = False
     0584:    srcuri = d.getVar('SRC_URI')
     0585:    for uri in srcuri.split():
     0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0587:
     0588:        # HTTP/FTP use the wget fetcher
     0589:        if scheme in ("http", "https", "ftp"):
     0590:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0591:
File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
function: decodeurl
     0364:    """
     0365:
     0366:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0367:    if not m:
 *** 0368:        raise MalformedUrl(url)
     0369:
     0370:    type = m.group('type')
     0371:    location = m.group('location')
     0372:    if not location:
Exception: bb.fetch2.MalformedUrl: The URL:
'${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zlib.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
is invalid and cannot be interpreted

ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zeromq3/
zeromq3_debian.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 3, function: <module>
     0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
     0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
     0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
     0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
     0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
     0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
__anon_686__home_jarvis_poky_meta_classes_base_bbclass
     0583:    needsrcrev = False
     0584:    srcuri = d.getVar('SRC_URI')
     0585:    for uri in srcuri.split():
     0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0587:
     0588:        # HTTP/FTP use the wget fetcher
     0589:        if scheme in ("http", "https", "ftp"):
     0590:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0591:
File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
function: decodeurl
     0364:    """
     0365:
     0366:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0367:    if not m:
 *** 0368:        raise MalformedUrl(url)
     0369:
     0370:    type = m.group('type')
     0371:    location = m.group('location')
     0372:    if not location:
Exception: bb.fetch2.MalformedUrl: The URL:
'${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zeromq3.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
is invalid and cannot be interpreted

ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zip/zip_debian.bb:
Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 3, function: <module>
     0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)
     0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)
 *** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)
     0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)
     0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)
     0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)
     0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)
File: '/home/jarvis/poky/meta/classes/base.bbclass', lineno: 587, function:
__anon_686__home_jarvis_poky_meta_classes_base_bbclass
     0583:    needsrcrev = False
     0584:    srcuri = d.getVar('SRC_URI')
     0585:    for uri in srcuri.split():
     0586:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 *** 0587:
     0588:        # HTTP/FTP use the wget fetcher
     0589:        if scheme in ("http", "https", "ftp"):
     0590:            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')
     0591:
File: '/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py', lineno: 368,
function: decodeurl
     0364:    """
     0365:
     0366:    m =
re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url)
     0367:    if not m:
 *** 0368:        raise MalformedUrl(url)
     0369:
     0370:    type = m.group('type')
     0371:    location = m.group('location')
     0372:    if not location:
Exception: bb.fetch2.MalformedUrl: The URL:
'${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zip.git;protocol=${DEBIAN_GIT_PROTOCOL};branch=rocko-master'
is invalid and cannot be interpreted

Do help me with the solution

--001a114db6c287741a056841f3d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>I am encountering the below err=
or while building meta-debian (which is added in bblayer.conf)<br><br>ERROR=
: /home/jarvis/poky/meta-debian/recipes-misc/ltp/<a href=3D"http://ltp_git.=
bb">ltp_git.bb</a>: Error executing a python function in &lt;code&gt;:<br><=
br>The stack trace of python calls that resulted in this exception/failure =
was:<br>File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_pa=
tch_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0002:__anon_160__home_jarvis_pok=
y_meta_classes_base_bbclass(d)<br>=C2=A0*** 0003:__anon_686__home_jarvis_po=
ky_meta_classes_base_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:__anon_130=
5__home_jarvis_poky_meta_classes_insane_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0007:__anon_25__home_jarvis=
_poky_meta_classes_debian_bbclass(d)<br>File: &#39;/home/jarvis/poky/meta/c=
lasses/base.bbclass&#39;, lineno: 587, function: __anon_686__home_jarvis_po=
ky_meta_classes_base_bbclass<br>=C2=A0=C2=A0=C2=A0=C2=A0 0583:=C2=A0=C2=A0=
=C2=A0 needsrcrev =3D False<br>=C2=A0=C2=A0=C2=A0=C2=A0 0584:=C2=A0=C2=A0=
=C2=A0 srcuri =3D d.getVar(&#39;SRC_URI&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0=
585:=C2=A0=C2=A0=C2=A0 for uri in srcuri.split():<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0586:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (scheme, _ , path) =3D =
bb.fetch.decodeurl(uri)[:3]<br>=C2=A0*** 0587:<br>=C2=A0=C2=A0=C2=A0=C2=A0 =
0588:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # HTTP/FTP use the wget fet=
cher<br>=C2=A0=C2=A0=C2=A0=C2=A0 0589:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if scheme in (&quot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):=
<br>=C2=A0=C2=A0=C2=A0=C2=A0 0590:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(&#39;do_fetch&#39;, &#39;depend=
s&#39;, &#39; wget-native:do_populate_sysroot&#39;)<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0591:<br>File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__=
.py&#39;, lineno: 368, function: decodeurl<br>=C2=A0=C2=A0=C2=A0=C2=A0 0364=
:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0365:<br=
>=C2=A0=C2=A0=C2=A0=C2=A0 0366:=C2=A0=C2=A0=C2=A0 m =3D re.compile(&#39;(?P=
&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&lt;location&gt;[^;]+)(;(=
?P&lt;parm&gt;.*))?&#39;).match(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0367:=C2=
=A0=C2=A0=C2=A0 if not m:<br>=C2=A0*** 0368:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 raise MalformedUrl(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0369:<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0370:=C2=A0=C2=A0=C2=A0 type =3D m.group(&#39;type=
&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0371:=C2=A0=C2=A0=C2=A0 location =3D m.g=
roup(&#39;location&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0372:=C2=A0=C2=A0=C2=
=A0 if not location:<br>Exception: bb.fetch2.MalformedUrl: The URL: &#39;${=
MISC_GIT_URI}/${MISC_GIT_PREFIX}ltp.git;protocol=3D${MISC_GIT_PROTOCOL}&#39=
; is invalid and cannot be interpreted<br><br>ERROR: /home/jarvis/poky/meta=
-debian/recipes-misc/qemu/<a href=3D"http://qemu-bios-native_1.7.0.bb">qemu=
-bios-native_1.7.0.bb</a>: Error executing a python function in &lt;code&gt=
;:<br><br>The stack trace of python calls that resulted in this exception/f=
ailure was:<br>File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;modul=
e&gt;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0001:__anon_25__home_jarvis_poky_meta_cla=
sses_patch_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0002:__anon_160__home_jar=
vis_poky_meta_classes_base_bbclass(d)<br>=C2=A0*** 0003:__anon_686__home_ja=
rvis_poky_meta_classes_base_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:__a=
non_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass=
(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0006:__anon_352__home_jarvis_poky_meta_clas=
ses_package_deb_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0007:__anon_25__home=
_jarvis_poky_meta_classes_debian_bbclass(d)<br>File: &#39;/home/jarvis/poky=
/meta/classes/base.bbclass&#39;, lineno: 587, function: __anon_686__home_ja=
rvis_poky_meta_classes_base_bbclass<br>=C2=A0=C2=A0=C2=A0=C2=A0 0583:=C2=A0=
=C2=A0=C2=A0 needsrcrev =3D False<br>=C2=A0=C2=A0=C2=A0=C2=A0 0584:=C2=A0=
=C2=A0=C2=A0 srcuri =3D d.getVar(&#39;SRC_URI&#39;)<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0585:=C2=A0=C2=A0=C2=A0 for uri in srcuri.split():<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 0586:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (scheme, _ , p=
ath) =3D bb.fetch.decodeurl(uri)[:3]<br>=C2=A0*** 0587:<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 0588:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # HTTP/FTP use th=
e wget fetcher<br>=C2=A0=C2=A0=C2=A0=C2=A0 0589:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if scheme in (&quot;http&quot;, &quot;https&quot;, &quot;ft=
p&quot;):<br>=C2=A0=C2=A0=C2=A0=C2=A0 0590:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(&#39;do_fetch&#39;, &#=
39;depends&#39;, &#39; wget-native:do_populate_sysroot&#39;)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 0591:<br>File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2=
/__init__.py&#39;, lineno: 368, function: decodeurl<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0364:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0365:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0366:=C2=A0=C2=A0=C2=A0 m =3D re.comp=
ile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&lt;location&=
gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0367:=C2=A0=C2=A0=C2=A0 if not m:<br>=C2=A0*** 0368:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 raise MalformedUrl(url)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0369:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0370:=C2=A0=C2=A0=C2=A0 type =3D m.gr=
oup(&#39;type&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0371:=C2=A0=C2=A0=C2=A0 loc=
ation =3D m.group(&#39;location&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0372:=C2=
=A0=C2=A0=C2=A0 if not location:<br>Exception: bb.fetch2.MalformedUrl: The =
URL: &#39;${MISC_GIT_URI}/${MISC_GIT_PREFIX}qemu.git;protocol=3D${MISC_GIT_=
PROTOCOL};branch=3Dstable-2.1&#39; is invalid and cannot be interpreted<br>=
<br>ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux-libc-headers/=
<a href=3D"http://linux-libc-headers-base_git.bb">linux-libc-headers-base_g=
it.bb</a>: Error executing a python function in &lt;code&gt;:<br><br>The st=
ack trace of python calls that resulted in this exception/failure was:<br>F=
ile: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbcl=
ass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0002:__anon_160__home_jarvis_poky_meta_c=
lasses_base_bbclass(d)<br>=C2=A0*** 0003:__anon_686__home_jarvis_poky_meta_=
classes_base_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:__anon_1305__home_=
jarvis_poky_meta_classes_insane_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0005=
:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_=
bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0007:__anon_25__home_jarvis_poky_met=
a_classes_debian_bbclass(d)<br>File: &#39;/home/jarvis/poky/meta/classes/ba=
se.bbclass&#39;, lineno: 587, function: __anon_686__home_jarvis_poky_meta_c=
lasses_base_bbclass<br>=C2=A0=C2=A0=C2=A0=C2=A0 0583:=C2=A0=C2=A0=C2=A0 nee=
dsrcrev =3D False<br>=C2=A0=C2=A0=C2=A0=C2=A0 0584:=C2=A0=C2=A0=C2=A0 srcur=
i =3D d.getVar(&#39;SRC_URI&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0585:=C2=A0=
=C2=A0=C2=A0 for uri in srcuri.split():<br>=C2=A0=C2=A0=C2=A0=C2=A0 0586:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (scheme, _ , path) =3D bb.fetch.=
decodeurl(uri)[:3]<br>=C2=A0*** 0587:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0588:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # HTTP/FTP use the wget fetcher<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0589:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 scheme in (&quot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 0590:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 d.appendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &=
#39; wget-native:do_populate_sysroot&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0591=
:<br>File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, l=
ineno: 368, function: decodeurl<br>=C2=A0=C2=A0=C2=A0=C2=A0 0364:=C2=A0=C2=
=A0=C2=A0 &quot;&quot;&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0365:<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 0366:=C2=A0=C2=A0=C2=A0 m =3D re.compile(&#39;(?P&lt;type&g=
t;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&lt;location&gt;[^;]+)(;(?P&lt;parm=
&gt;.*))?&#39;).match(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0367:=C2=A0=C2=A0=C2=
=A0 if not m:<br>=C2=A0*** 0368:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
raise MalformedUrl(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0369:<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 0370:=C2=A0=C2=A0=C2=A0 type =3D m.group(&#39;type&#39;)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0371:=C2=A0=C2=A0=C2=A0 location =3D m.group(&#39;=
location&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0372:=C2=A0=C2=A0=C2=A0 if not l=
ocation:<br>Exception: bb.fetch2.MalformedUrl: The URL: &#39;${LINUX_GIT_UR=
I}/${LINUX_GIT_PREFIX}${LINUX_GIT_REPO};branch=3D${LINUX_GIT_SRCREV};protoc=
ol=3D${LINUX_GIT_PROTOCOL}&#39; is invalid and cannot be interpreted<br><br=
>ERROR: /home/jarvis/poky/meta-debian/recipes-kernel/linux/<a href=3D"http:=
//linux-base_git.bb">linux-base_git.bb</a>: Error executing a python functi=
on in &lt;code&gt;:<br><br>The stack trace of python calls that resulted in=
 this exception/failure was:<br>File: &#39;&lt;code&gt;&#39;, lineno: 3, fu=
nction: &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0001:__anon_25__home_jar=
vis_poky_meta_classes_patch_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0002:__a=
non_160__home_jarvis_poky_meta_classes_base_bbclass(d)<br>=C2=A0*** 0003:__=
anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_insane_bbclass(d)=
<br>=C2=A0=C2=A0=C2=A0=C2=A0 0005:__anon_250__home_jarvis_poky_meta_classes=
_package_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0006:__anon_352__home_jarvi=
s_poky_meta_classes_package_deb_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0007=
:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d)<br>File: &#39;/=
home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 587, function: __a=
non_686__home_jarvis_poky_meta_classes_base_bbclass<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0583:=C2=A0=C2=A0=C2=A0 needsrcrev =3D False<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0584:=C2=A0=C2=A0=C2=A0 srcuri =3D d.getVar(&#39;SRC_URI&#39;)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0585:=C2=A0=C2=A0=C2=A0 for uri in srcuri.split():=
<br>=C2=A0=C2=A0=C2=A0=C2=A0 0586:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (scheme, _ , path) =3D bb.fetch.decodeurl(uri)[:3]<br>=C2=A0*** 0587:<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0 0588:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# HTTP/FTP use the wget fetcher<br>=C2=A0=C2=A0=C2=A0=C2=A0 0589:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if scheme in (&quot;http&quot;, &quot;htt=
ps&quot;, &quot;ftp&quot;):<br>=C2=A0=C2=A0=C2=A0=C2=A0 0590:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(&#39=
;do_fetch&#39;, &#39;depends&#39;, &#39; wget-native:do_populate_sysroot&#3=
9;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0591:<br>File: &#39;/home/jarvis/poky/bitba=
ke/lib/bb/fetch2/__init__.py&#39;, lineno: 368, function: decodeurl<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 0364:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 0365:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0366:=C2=A0=C2=A0=C2=
=A0 m =3D re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)=
?(?P&lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 0367:=C2=A0=C2=A0=C2=A0 if not m:<br>=C2=A0*** 0368:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise MalformedUrl(url)<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 0369:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0370:=C2=A0=C2=A0=C2=
=A0 type =3D m.group(&#39;type&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0371:=C2=
=A0=C2=A0=C2=A0 location =3D m.group(&#39;location&#39;)<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 0372:=C2=A0=C2=A0=C2=A0 if not location:<br>Exception: bb.fetch2.=
MalformedUrl: The URL: &#39;${LINUX_GIT_URI}/${LINUX_GIT_PREFIX}${LINUX_GIT=
_REPO};branch=3D${LINUX_GIT_SRCREV};protocol=3D${LINUX_GIT_PROTOCOL}&#39; i=
s invalid and cannot be interpreted<br><br>ERROR: Failed to parse recipe: /=
home/jarvis/poky/meta-debian/recipes-misc/ltp/<a href=3D"http://ltp_git.bb"=
>ltp_git.bb</a><br>ERROR: /home/jarvis/poky/meta-debian/recipes-debian/zlib=
/<a href=3D"http://zlib_debian.bb">zlib_debian.bb</a>: Error executing a py=
thon function in &lt;code&gt;:<br><br>The stack trace of python calls that =
resulted in this exception/failure was:<br>File: &#39;&lt;code&gt;&#39;, li=
neno: 3, function: &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0001:__anon_2=
5__home_jarvis_poky_meta_classes_patch_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0002:__anon_160__home_jarvis_poky_meta_classes_base_bbclass(d)<br>=C2=
=A0*** 0003:__anon_686__home_jarvis_poky_meta_classes_base_bbclass(d)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0004:__anon_1305__home_jarvis_poky_meta_classes_in=
sane_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0005:__anon_250__home_jarvis_po=
ky_meta_classes_package_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0006:__anon_=
352__home_jarvis_poky_meta_classes_package_deb_bbclass(d)<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 0007:__anon_25__home_jarvis_poky_meta_classes_debian_bbclass(d=
)<br>File: &#39;/home/jarvis/poky/meta/classes/base.bbclass&#39;, lineno: 5=
87, function: __anon_686__home_jarvis_poky_meta_classes_base_bbclass<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 0583:=C2=A0=C2=A0=C2=A0 needsrcrev =3D False<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 0584:=C2=A0=C2=A0=C2=A0 srcuri =3D d.getVar(&#39;SRC_=
URI&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0585:=C2=A0=C2=A0=C2=A0 for uri in sr=
curi.split():<br>=C2=A0=C2=A0=C2=A0=C2=A0 0586:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (scheme, _ , path) =3D bb.fetch.decodeurl(uri)[:3]<br>=C2=
=A0*** 0587:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0588:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 # HTTP/FTP use the wget fetcher<br>=C2=A0=C2=A0=C2=A0=C2=A0=
 0589:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if scheme in (&quot;http&q=
uot;, &quot;https&quot;, &quot;ftp&quot;):<br>=C2=A0=C2=A0=C2=A0=C2=A0 0590=
:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appen=
dVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39; wget-native:do_popula=
te_sysroot&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0591:<br>File: &#39;/home/jarv=
is/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, lineno: 368, function: deco=
deurl<br>=C2=A0=C2=A0=C2=A0=C2=A0 0364:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot=
;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0365:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0366:=C2=A0=
=C2=A0=C2=A0 m =3D re.compile(&#39;(?P&lt;type&gt;[^:]*)://((?P&lt;user&gt;=
[^/;]+)@)?(?P&lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*))?&#39;).match(url)<=
br>=C2=A0=C2=A0=C2=A0=C2=A0 0367:=C2=A0=C2=A0=C2=A0 if not m:<br>=C2=A0*** =
0368:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise MalformedUrl(url)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0369:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0370:=C2=A0=C2=
=A0=C2=A0 type =3D m.group(&#39;type&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0371=
:=C2=A0=C2=A0=C2=A0 location =3D m.group(&#39;location&#39;)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 0372:=C2=A0=C2=A0=C2=A0 if not location:<br>Exception: bb.f=
etch2.MalformedUrl: The URL: &#39;${DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zli=
b.git;protocol=3D${DEBIAN_GIT_PROTOCOL};branch=3Drocko-master&#39; is inval=
id and cannot be interpreted<br><br>ERROR: /home/jarvis/poky/meta-debian/re=
cipes-debian/zeromq3/<a href=3D"http://zeromq3_debian.bb">zeromq3_debian.bb=
</a>: Error executing a python function in &lt;code&gt;:<br><br>The stack t=
race of python calls that resulted in this exception/failure was:<br>File: =
&#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patch_bbclass(d)=
<br>=C2=A0=C2=A0=C2=A0=C2=A0 0002:__anon_160__home_jarvis_poky_meta_classes=
_base_bbclass(d)<br>=C2=A0*** 0003:__anon_686__home_jarvis_poky_meta_classe=
s_base_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:__anon_1305__home_jarvis=
_poky_meta_classes_insane_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0005:__ano=
n_250__home_jarvis_poky_meta_classes_package_bbclass(d)<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_package_deb_bbclas=
s(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0007:__anon_25__home_jarvis_poky_meta_clas=
ses_debian_bbclass(d)<br>File: &#39;/home/jarvis/poky/meta/classes/base.bbc=
lass&#39;, lineno: 587, function: __anon_686__home_jarvis_poky_meta_classes=
_base_bbclass<br>=C2=A0=C2=A0=C2=A0=C2=A0 0583:=C2=A0=C2=A0=C2=A0 needsrcre=
v =3D False<br>=C2=A0=C2=A0=C2=A0=C2=A0 0584:=C2=A0=C2=A0=C2=A0 srcuri =3D =
d.getVar(&#39;SRC_URI&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0585:=C2=A0=C2=A0=
=C2=A0 for uri in srcuri.split():<br>=C2=A0=C2=A0=C2=A0=C2=A0 0586:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (scheme, _ , path) =3D bb.fetch.decode=
url(uri)[:3]<br>=C2=A0*** 0587:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0588:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # HTTP/FTP use the wget fetcher<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 0589:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if schem=
e in (&quot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 0590:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 d.appendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39; w=
get-native:do_populate_sysroot&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0591:<br>F=
ile: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__.py&#39;, lineno:=
 368, function: decodeurl<br>=C2=A0=C2=A0=C2=A0=C2=A0 0364:=C2=A0=C2=A0=C2=
=A0 &quot;&quot;&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0365:<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 0366:=C2=A0=C2=A0=C2=A0 m =3D re.compile(&#39;(?P&lt;type&gt;[^:]=
*)://((?P&lt;user&gt;[^/;]+)@)?(?P&lt;location&gt;[^;]+)(;(?P&lt;parm&gt;.*=
))?&#39;).match(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0367:=C2=A0=C2=A0=C2=A0 if=
 not m:<br>=C2=A0*** 0368:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise =
MalformedUrl(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0369:<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0370:=C2=A0=C2=A0=C2=A0 type =3D m.group(&#39;type&#39;)<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 0371:=C2=A0=C2=A0=C2=A0 location =3D m.group(&#39;locati=
on&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0372:=C2=A0=C2=A0=C2=A0 if not locatio=
n:<br>Exception: bb.fetch2.MalformedUrl: The URL: &#39;${DEBIAN_GIT_URI}/${=
DEBIAN_GIT_PREFIX}zeromq3.git;protocol=3D${DEBIAN_GIT_PROTOCOL};branch=3Dro=
cko-master&#39; is invalid and cannot be interpreted<br><br>ERROR: /home/ja=
rvis/poky/meta-debian/recipes-debian/zip/<a href=3D"http://zip_debian.bb">z=
ip_debian.bb</a>: Error executing a python function in &lt;code&gt;:<br><br=
>The stack trace of python calls that resulted in this exception/failure wa=
s:<br>File: &#39;&lt;code&gt;&#39;, lineno: 3, function: &lt;module&gt;<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0001:__anon_25__home_jarvis_poky_meta_classes_patc=
h_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0002:__anon_160__home_jarvis_poky_=
meta_classes_base_bbclass(d)<br>=C2=A0*** 0003:__anon_686__home_jarvis_poky=
_meta_classes_base_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:__anon_1305_=
_home_jarvis_poky_meta_classes_insane_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0005:__anon_250__home_jarvis_poky_meta_classes_package_bbclass(d)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0006:__anon_352__home_jarvis_poky_meta_classes_pac=
kage_deb_bbclass(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0007:__anon_25__home_jarvis=
_poky_meta_classes_debian_bbclass(d)<br>File: &#39;/home/jarvis/poky/meta/c=
lasses/base.bbclass&#39;, lineno: 587, function: __anon_686__home_jarvis_po=
ky_meta_classes_base_bbclass<br>=C2=A0=C2=A0=C2=A0=C2=A0 0583:=C2=A0=C2=A0=
=C2=A0 needsrcrev =3D False<br>=C2=A0=C2=A0=C2=A0=C2=A0 0584:=C2=A0=C2=A0=
=C2=A0 srcuri =3D d.getVar(&#39;SRC_URI&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0=
585:=C2=A0=C2=A0=C2=A0 for uri in srcuri.split():<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 0586:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (scheme, _ , path) =3D =
bb.fetch.decodeurl(uri)[:3]<br>=C2=A0*** 0587:<br>=C2=A0=C2=A0=C2=A0=C2=A0 =
0588:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # HTTP/FTP use the wget fet=
cher<br>=C2=A0=C2=A0=C2=A0=C2=A0 0589:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if scheme in (&quot;http&quot;, &quot;https&quot;, &quot;ftp&quot;):=
<br>=C2=A0=C2=A0=C2=A0=C2=A0 0590:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag(&#39;do_fetch&#39;, &#39;depend=
s&#39;, &#39; wget-native:do_populate_sysroot&#39;)<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0591:<br>File: &#39;/home/jarvis/poky/bitbake/lib/bb/fetch2/__init__=
.py&#39;, lineno: 368, function: decodeurl<br>=C2=A0=C2=A0=C2=A0=C2=A0 0364=
:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0365:<br=
>=C2=A0=C2=A0=C2=A0=C2=A0 0366:=C2=A0=C2=A0=C2=A0 m =3D re.compile(&#39;(?P=
&lt;type&gt;[^:]*)://((?P&lt;user&gt;[^/;]+)@)?(?P&lt;location&gt;[^;]+)(;(=
?P&lt;parm&gt;.*))?&#39;).match(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0367:=C2=
=A0=C2=A0=C2=A0 if not m:<br>=C2=A0*** 0368:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 raise MalformedUrl(url)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0369:<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0370:=C2=A0=C2=A0=C2=A0 type =3D m.group(&#39;type=
&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0371:=C2=A0=C2=A0=C2=A0 location =3D m.g=
roup(&#39;location&#39;)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0372:=C2=A0=C2=A0=C2=
=A0 if not location:<br>Exception: bb.fetch2.MalformedUrl: The URL: &#39;${=
DEBIAN_GIT_URI}/${DEBIAN_GIT_PREFIX}zip.git;protocol=3D${DEBIAN_GIT_PROTOCO=
L};branch=3Drocko-master&#39; is invalid and cannot be interpreted<br><br><=
/div>Do help me with the solution<br></div>

--001a114db6c287741a056841f3d5--

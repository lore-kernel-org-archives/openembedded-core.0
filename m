Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 40FDF6E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 13:52:16 +0000 (UTC)
Received: by widdi4 with SMTP id di4so58182761wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Mo9BIG8uY/6cQnlO8H/mXzQLFqkX3Cbzj3Jun0GyqKU=;
	b=cgPIWO8R3YWIjvinLTkEzuIC7yzK8V4y99Rj9Jjyv1NpomSfW0HQdywXaE6TFmwb2u
	5WKRXT4MVjAsuygKj4Xg3l6nyOBGXy/gzc3j6lF+pIjVppISanH9e8JZXyFe59UZAjru
	XoFu5xfN+NnUX1Bdl4MgS35uh8+vSpWbTJdvVkfouv8FMDR9DdcjWg+GgootS5fj1MQA
	25tzCa7BBxBdZbs3ZCMhgEUbBGY7T+ZGpg1ES1fjussHrSFnLsrZXxPGV1XLnSLd5g3F
	oL6+GZhrmWLFQsqv5E5DwKI6KSvVATsxUfCjWNB+0Jai0MRshbrEwc7+qArO9V7iVTv1
	YwWA==
X-Received: by 10.180.97.164 with SMTP id eb4mr6264733wib.3.1429710737751;
	Wed, 22 Apr 2015 06:52:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id m4sm7454713wjb.25.2015.04.22.06.52.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Apr 2015 06:52:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Apr 2015 15:52:25 +0200
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20150422135225.GA2336@jama>
References: <cover.1425076707.git.alejandro.hernandez@linux.intel.com>
	<93d70e328d697eb20a6bcd5b86ec96c89e1019cc.1425076707.git.alejandro.hernandez@linux.intel.com>
	<20150413184018.GL2330@jama> <552C340E.4030804@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <552C340E.4030804@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python3: Upgrade from 3.3.3 to 3.4.2
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
X-List-Received-Date: Wed, 22 Apr 2015 13:52:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 04:24:30PM -0500, Alejandro Hernandez wrote:
>=20
>=20
> On 13/04/15 13:40, Martin Jansa wrote:
> > On Fri, Feb 27, 2015 at 06:30:52PM -0600, Alejandro Hernandez wrote:
> >> Modifies:
> >> python3-native_3.3.3.bb -> python3-native_3.4.2.bb: Updates checksums,=
 version, patches
> >> and SRC_URIs to use xz format, LICENSE did not change, dates were upda=
ted, adds fix for
> >> ctypes/libffi needed for pip <- required since Python 3.4 (see PEP #45=
3).
> >> python3_3.3.3.bb -> python3_3.4.2.bb: Updates checksums, version, patc=
hes and SRC_URIs
> >> to use xz format, adds fix for ctypes/libffi, fixes oe_multilib_header=
() call,
> >> adds python3-core as RDEPENDS to python3-misc to avoid QA issue.
> >> generate-manifest-3.4.py - > generate-manifest-3.4.py: fixes reprlib,
> >> adds _sitebuiltins and _collections_abc <- formerly part of collection=
s, separated since 3.4
> >> python-3.3-manifest.inc -> python-3.4-manifest.inc
> >>
> >> Rebases:
> >> 12-distutils-prefix-is-inside-staging-area.patch
> >> python-3.3-multilib.patch
> >> 04-default-is-optimized.patch
> >> avoid-ncursesw-include-path.patch
> >>
> >> Deletes (fixed upstream):
> >> fix-ast.h-dependency.patch
> >> python3-fix-build-error-with-Readline-6.3.patch
> >> 06-ctypes-libffi-fix-configure.patch
> >> remove_sqlite_rpath.patch
> > There is a lot of textrel QA warnings in 3.3.3 (you can see them e.g. in
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-March/10=
2948.html
> > ), is this upgrade fixing them?
> >
> >> [YOCTO #6857]
> >>
> >> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.co=
m>
> >>
> I don't remember there being any warnings when I first did the upgrade,=
=20
> but I just checked and now they are being shown, something must've=20
> changed , anyway they are still there for 3.4, we can still upgrade and=
=20
> I'll dig into this later
>=20

The version in master-next still has this issue:
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-audio/usr/=
lib/python3.4/lib-dynload/ossaudiodev.cpython-34m.so' has relocations in .t=
ext [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-codecs/usr=
/lib/python3.4/lib-dynload/_codecs_tw.cpython-34m.so' has relocations in .t=
ext [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-core/usr/l=
ib/python3.4/lib-dynload/binascii.cpython-34m.so' has relocations in .text =
[textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-crypt/usr/=
lib/python3.4/lib-dynload/_sha256.cpython-34m.so' has relocations in .text =
[textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-ctypes/usr=
/lib/python3.4/lib-dynload/_ctypes_test.cpython-34m.so' has relocations in =
=2Etext [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-curses/usr=
/lib/python3.4/lib-dynload/_curses.cpython-34m.so' has relocations in .text=
 [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-elementtre=
e/usr/lib/python3.4/lib-dynload/_elementtree.cpython-34m.so' has relocation=
s in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-fcntl/usr/=
lib/python3.4/lib-dynload/fcntl.cpython-34m.so' has relocations in .text [t=
extrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-gdbm/usr/l=
ib/python3.4/lib-dynload/_gdbm.cpython-34m.so' has relocations in .text [te=
xtrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-io/usr/lib=
/python3.4/lib-dynload/_socket.cpython-34m.so' has relocations in .text [te=
xtrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-json/usr/l=
ib/python3.4/lib-dynload/_json.cpython-34m.so' has relocations in .text [te=
xtrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-lang/usr/l=
ib/python3.4/lib-dynload/_bisect.cpython-34m.so' has relocations in .text [=
textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-math/usr/l=
ib/python3.4/lib-dynload/cmath.cpython-34m.so' has relocations in .text [te=
xtrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-mmap/usr/l=
ib/python3.4/lib-dynload/mmap.cpython-34m.so' has relocations in .text [tex=
trel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-multiproce=
ssing/usr/lib/python3.4/lib-dynload/_multiprocessing.cpython-34m.so' has re=
locations in .text [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-profile/us=
r/lib/python3.4/lib-dynload/_lsprof.cpython-34m.so' has relocations in .tex=
t [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-readline/u=
sr/lib/python3.4/lib-dynload/readline.cpython-34m.so' has relocations in .t=
ext [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-resource/u=
sr/lib/python3.4/lib-dynload/resource.cpython-34m.so' has relocations in .t=
ext [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-syslog/usr=
/lib/python3.4/lib-dynload/syslog.cpython-34m.so' has relocations in .text =
[textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-textutils/=
usr/lib/python3.4/lib-dynload/_csv.cpython-34m.so' has relocations in .text=
 [textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-unixadmin/=
usr/lib/python3.4/lib-dynload/grp.cpython-34m.so' has relocations in .text =
[textrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-xml/usr/li=
b/python3.4/lib-dynload/pyexpat.cpython-34m.so' has relocations in .text [t=
extrel]
python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5e-oe-linux-gnueabi/python3/3.4.2-r1.0/packages-split/python3-misc/usr/l=
ib/python3.4/lib-dynload/_posixsubprocess.cpython-34m.so' has relocations i=
n .text [textrel]

It also installs bunch of files without sstate knowledge as reported by
openembedded-core/scripts/sstate-sysroot-cruft.sh:

x86_64-linux/usr/lib/python3.4/__pycache__
x86_64-linux/usr/lib/python3.4/collections/__pycache__
x86_64-linux/usr/lib/python3.4/ctypes/__pycache__
x86_64-linux/usr/lib/python3.4/distutils/__pycache__
x86_64-linux/usr/lib/python3.4/distutils/command/__pycache__
x86_64-linux/usr/lib/python3.4/email/__pycache__
x86_64-linux/usr/lib/python3.4/encodings/__pycache__
x86_64-linux/usr/lib/python3.4/ensurepip/__pycache__
x86_64-linux/usr/lib/python3.4/html/__pycache__
x86_64-linux/usr/lib/python3.4/http/__pycache__
x86_64-linux/usr/lib/python3.4/importlib/__pycache__
x86_64-linux/usr/lib/python3.4/json/__pycache__
x86_64-linux/usr/lib/python3.4/lib2to3/__pycache__
x86_64-linux/usr/lib/python3.4/lib2to3/fixes/__pycache__
x86_64-linux/usr/lib/python3.4/lib2to3/pgen2/__pycache__
x86_64-linux/usr/lib/python3.4/logging/__pycache__
x86_64-linux/usr/lib/python3.4/unittest/__pycache__
x86_64-linux/usr/lib/python3.4/urllib/__pycache__
x86_64-linux/usr/lib/python3.4/xml/__pycache__
x86_64-linux/usr/lib/python3.4/xml/etree/__pycache__
x86_64-linux/usr/lib/python3.4/xml/parsers/__pycache__
x86_64-linux/usr/lib/python3.4/xml/sax/__pycache__
x86_64-linux/usr/lib/python3.4/xmlrpc/__pycache__

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


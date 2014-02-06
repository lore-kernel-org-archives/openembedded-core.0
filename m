Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 71E736D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 08:16:52 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id c11so1205854lbj.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 00:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=PHciU8r41+4rTLrfQWqTTIPenruespGm6R52MXstqgQ=;
	b=EyCYxdxvyDMetP7w6LbRLbnMMOzJHdC5Qp4DBlzLe/f83ljXbKNwSL6e1WpUIDQUul
	YW5Rl5lXCUzLxodFY213y62dbOwqQSA0wgDa1w4h2V6qkP2GmVP6E+hHICQzW5uHizJs
	chd9t0+VRB9YNEAjyaZdIoBD6GUMn67kMOtHJVa+eq0NLJCK8KY5V0RCXihAV3FuLEaL
	rQRE/VRxdUNbpMjfNw/jVfMSxqnH7QK/WWKbKUYZYYwF4tJk2tWK0OVnzFdQXvYFuPVo
	69nHAPxdrL9fC4DVWNgrJFBqL+Cv56TxtEzgSgSFR+SOiw+p8VXZO8+1OzyHtR50rBdh
	v9LA==
X-Gm-Message-State: ALoCoQmDMas6afJdiLG7ZvCKAjFSZuXuwGVwz73VgoKE74j3vJwCI+zStpPAWKxHMiPHmyZJUZlM
MIME-Version: 1.0
X-Received: by 10.112.204.104 with SMTP id kx8mr4417731lbc.12.1391674612150;
	Thu, 06 Feb 2014 00:16:52 -0800 (PST)
Received: by 10.112.91.227 with HTTP; Thu, 6 Feb 2014 00:16:52 -0800 (PST)
In-Reply-To: <CAMKF1soNtssUgdfyxjiH0P02cJR4fGTnQ9_WojjN1zz4sDn8Bg@mail.gmail.com>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
	<1390912914-31576-2-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1soNtssUgdfyxjiH0P02cJR4fGTnQ9_WojjN1zz4sDn8Bg@mail.gmail.com>
Date: Thu, 6 Feb 2014 10:16:52 +0200
Message-ID: <CAGNsrLChYwpzaaP5=hOykqaYgyRxaXybvatb4dkezns7sERCsQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 1/6] ltp: update SRC_REV to LTP 20140115 release
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
X-List-Received-Date: Thu, 06 Feb 2014 08:16:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 29 January 2014 01:06, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jan 28, 2014 at 4:41 AM, Fathi Boudra <fathi.boudra@linaro.org> w=
rote:
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  meta/recipes-extended/ltp/ltp_20130904.bb | 78 ------------------------=
-------
>>  meta/recipes-extended/ltp/ltp_20140115.bb | 78 ++++++++++++++++++++++++=
+++++++
>>  2 files changed, 78 insertions(+), 78 deletions(-)
>>  delete mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb
>>  create mode 100644 meta/recipes-extended/ltp/ltp_20140115.bb
>
> would be easier to revirew if it was generates with git format-patch -M
>
>>
>> diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-ex=
tended/ltp/ltp_20130904.bb
>> deleted file mode 100644
>> index c346c5c..0000000
>> --- a/meta/recipes-extended/ltp/ltp_20130904.bb
>> +++ /dev/null
>> @@ -1,78 +0,0 @@
>> -SUMMARY =3D "Linux Test Project"
>> -DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IB=
M, OSDL, and Bull with a goal to deliver test suites to the open source com=
munity that validate the reliability, robustness, and stability of Linux. T=
he Linux Test Project is a collection of tools for testing the Linux kernel=
 and related features."
>> -HOMEPAGE =3D "http://ltp.sourceforge.net"
>> -SECTION =3D "console/utils"
>> -
>> -LICENSE =3D "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c31=
7bb3 \
>> -                   file://testcases/kernel/controllers/freezer/COPYING;=
md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>> -                   file://testcases/kernel/controllers/freezer/run_free=
zer.sh;beginline=3D5;endline=3D17;md5=3D86a61d2c042d59836ffb353a21456498 \
>> -                   file://testcases/kernel/fs/ext4-new-features/ffsb-6.=
0-rc2/COPYING;md5=3Dc46082167a314d785d012a244748d803 \
>> -                   file://testcases/kernel/hotplug/memory_hotplug/COPYI=
NG;md5=3De04a2e542b2b8629bf9cd2ba29b0fe41 \
>> -                   file://testcases/kernel/hotplug/cpu_hotplug/COPYING;=
md5=3De04a2e542b2b8629bf9cd2ba29b0fe41 \
>> -                   file://testcases/open_posix_testsuite/COPYING;md5=3D=
216e43b72efbe4ed9017cc19c4c68b01 \
>> -                   file://testcases/realtime/COPYING;md5=3D12f884d2ae1f=
f87c09e5b7ccc2c4ca7e \
>> -                   file://tools/netpipe-2.4/COPYING;md5=3D9e3781bb5fe78=
7aa80e1f51f5006b6fa \
>> -                   file://tools/netpipe-2.4-ipv6/COPYING;md5=3D9e3781bb=
5fe787aa80e1f51f5006b6fa \
>> -                   file://tools/top-LTP/proc/COPYING;md5=3Daefc88eb8a41=
672fbfcfe6b69ab8c49c \
>> -                   file://tools/pounder21/COPYING;md5=3D94d55d512a9ba36=
caa9b7df079bae19f \
>> -                   file://utils/benchmark/kernbench-0.42/COPYING;md5=3D=
94d55d512a9ba36caa9b7df079bae19f \
>> -               "
>> -
>> -DEPENDS =3D "attr libaio libcap acl openssl"
>> -
>> -SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
>> -           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-n=
ame.patch \
>> -           file://regen-makefile.patch \
>> -"
>> -
>> -SRCREV =3D "a8c42db5f9314211811c36275a21f83902830dc5"
>> -S =3D "${WORKDIR}/git"
>> -
>> -export prefix =3D "/opt/ltp"
>> -export exec_prefix =3D "/opt/ltp"
>> -
>> -inherit autotools
>> -
>> -RDEPENDS_${PN} =3D "perl e2fsprogs-mke2fs"
>> -
>> -FILES_${PN}-dbg +=3D "/opt/ltp/runtest/.debug"
>> -FILES_${PN}-dbg +=3D "/opt/ltp/testcases/bin/.debug"
>> -FILES_${PN}-dbg +=3D "/opt/ltp/testcases/bin/*/bin/.debug"
>> -FILES_${PN}-dbg +=3D "/opt/ltp/testcases/bin/*/test/.debug"
>> -FILES_${PN}-dbg +=3D "/opt/ltp/scenario_groups/.debug"
>> -FILES_${PN}-dbg +=3D "/opt/ltp/testscripts/.debug"
>> -FILES_${PN}-dbg +=3D "/opt/ltp/testscripts/open_posix_testsuite/.debug"
>> -
>> -FILES_${PN}-staticdev +=3D "/opt/ltp/lib/libmem.a"
>> -
>> -FILES_${PN} +=3D "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_group=
s/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testsc=
ripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_p=
osix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Docume=
ntation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/tes=
tcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsui=
te/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/test=
cases/open_posix_testsuite/tools/*"
>> -
>> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> -
>> -do_unpack_append() {
>> -    bb.build.exec_func('do_extract_tarball', d)
>> -}
>> -
>> -do_extract_tarball() {
>> -       if test -f ${WORKDIR}/ltp-full-${PV} ; then
>> -           tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORK=
DIR}
>> -           rm -rf ${WORKDIR}/ltp-${PV}
>> -           mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
>> -       fi
>> -}
>> -
>> -do_install(){
>> -       install -d ${D}/opt/ltp/
>> -       oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install
>> -
>> -       # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>> -       cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>> -
>> -       # We need to remove all scripts which depend on /usr/bin/expect,=
 since expect is not supported in poky
>> -       # We will add expect for enhancement in future
>> -       find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" |=
 awk -F":" '{print $1}' | xargs rm -f
>> -}
>> -
>> -# Avoid generated binaries stripping. Otherwise some of the ltp tests s=
uch as ldd01 & nm01 fails
>> -INHIBIT_PACKAGE_STRIP =3D "1"
>> diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-ex=
tended/ltp/ltp_20140115.bb
>> new file mode 100644
>> index 0000000..e81fd7a
>> --- /dev/null
>> +++ b/meta/recipes-extended/ltp/ltp_20140115.bb
>> @@ -0,0 +1,78 @@
>> +SUMMARY =3D "Linux Test Project"
>> +DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IB=
M, OSDL, and Bull with a goal to deliver test suites to the open source com=
munity that validate the reliability, robustness, and stability of Linux. T=
he Linux Test Project is a collection of tools for testing the Linux kernel=
 and related features."
>> +HOMEPAGE =3D "http://ltp.sourceforge.net"
>> +SECTION =3D "console/utils"
>> +
>> +LICENSE =3D "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c31=
7bb3 \
>> +                   file://testcases/kernel/controllers/freezer/COPYING;=
md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>> +                   file://testcases/kernel/controllers/freezer/run_free=
zer.sh;beginline=3D5;endline=3D17;md5=3D86a61d2c042d59836ffb353a21456498 \
>> +                   file://testcases/kernel/fs/ext4-new-features/ffsb-6.=
0-rc2/COPYING;md5=3Dc46082167a314d785d012a244748d803 \
>> +                   file://testcases/kernel/hotplug/memory_hotplug/COPYI=
NG;md5=3De04a2e542b2b8629bf9cd2ba29b0fe41 \
>> +                   file://testcases/kernel/hotplug/cpu_hotplug/COPYING;=
md5=3De04a2e542b2b8629bf9cd2ba29b0fe41 \
>> +                   file://testcases/open_posix_testsuite/COPYING;md5=3D=
216e43b72efbe4ed9017cc19c4c68b01 \
>> +                   file://testcases/realtime/COPYING;md5=3D12f884d2ae1f=
f87c09e5b7ccc2c4ca7e \
>> +                   file://tools/netpipe-2.4/COPYING;md5=3D9e3781bb5fe78=
7aa80e1f51f5006b6fa \
>> +                   file://tools/netpipe-2.4-ipv6/COPYING;md5=3D9e3781bb=
5fe787aa80e1f51f5006b6fa \
>> +                   file://tools/top-LTP/proc/COPYING;md5=3Daefc88eb8a41=
672fbfcfe6b69ab8c49c \
>> +                   file://tools/pounder21/COPYING;md5=3D94d55d512a9ba36=
caa9b7df079bae19f \
>> +                   file://utils/benchmark/kernbench-0.42/COPYING;md5=3D=
94d55d512a9ba36caa9b7df079bae19f \
>> +               "
>> +
>> +DEPENDS =3D "attr libaio libcap acl openssl"
>> +
>> +SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
>> +           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-n=
ame.patch \
>> +           file://regen-makefile.patch \
>> +"
>> +
>> +SRCREV =3D "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
>> +S =3D "${WORKDIR}/git"
>> +
>> +export prefix =3D "/opt/ltp"
>> +export exec_prefix =3D "/opt/ltp"
>
> can this be changed to something under /usr ?

I'll prefer to skip this change. IMO, LTP has never meant to be
installed like many test suites.
build system and install is just horrible. Many distro have dropped
LTP packaging for this reason.

>> +
>> +inherit autotools
>> +
>> +RDEPENDS_${PN} =3D "perl e2fsprogs-mke2fs"
>> +
>> +FILES_${PN}-dbg +=3D "/opt/ltp/runtest/.debug"
>> +FILES_${PN}-dbg +=3D "/opt/ltp/testcases/bin/.debug"
>> +FILES_${PN}-dbg +=3D "/opt/ltp/testcases/bin/*/bin/.debug"
>> +FILES_${PN}-dbg +=3D "/opt/ltp/testcases/bin/*/test/.debug"
>> +FILES_${PN}-dbg +=3D "/opt/ltp/scenario_groups/.debug"
>> +FILES_${PN}-dbg +=3D "/opt/ltp/testscripts/.debug"
>> +FILES_${PN}-dbg +=3D "/opt/ltp/testscripts/open_posix_testsuite/.debug"
>> +
>> +FILES_${PN}-staticdev +=3D "/opt/ltp/lib/libmem.a"
>> +
>> +FILES_${PN} +=3D "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_group=
s/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testsc=
ripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_p=
osix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Docume=
ntation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/tes=
tcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsui=
te/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/test=
cases/open_posix_testsuite/tools/*"
>> +
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> is above still needed may be ltp should be fixed for respecting
> compiler/linker options

I'll check.

>> +
>> +do_unpack_append() {
>> +    bb.build.exec_func('do_extract_tarball', d)
>> +}
>> +
>> +do_extract_tarball() {
>> +       if test -f ${WORKDIR}/ltp-full-${PV} ; then
>> +           tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORK=
DIR}
>> +           rm -rf ${WORKDIR}/ltp-${PV}
>> +           mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
>> +       fi
>> +}
>> +
>> +do_install(){
>> +       install -d ${D}/opt/ltp/
>> +       oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install
>> +
>> +       # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>> +       cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>> +
>> +       # We need to remove all scripts which depend on /usr/bin/expect,=
 since expect is not supported in poky
>> +       # We will add expect for enhancement in future
>> +       find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" |=
 awk -F":" '{print $1}' | xargs rm -f
>> +}
>> +
>> +# Avoid generated binaries stripping. Otherwise some of the ltp tests s=
uch as ldd01 & nm01 fails
>> +INHIBIT_PACKAGE_STRIP =3D "1"
>> --
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


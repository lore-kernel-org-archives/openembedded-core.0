Return-Path: <riku.voipio@linaro.org>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id D418B6D22A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 07:37:18 +0000 (UTC)
Received: by mail-bk0-f52.google.com with SMTP id e11so1112031bkh.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 00:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Cif87U22wXdkgWcbktMcLlqxuUeU2r5m8+BtYdCykwo=;
	b=ZKQY29vMlCFnZXTzkk4g0yWvEKZEfCJ3kUz8R2LrI4GV8ulP0eUflf6grYQuiA5o9L
	iVQVfhems7MivprkWTn/OZ/DTJ1Z8TGbRcpw8Wq5k8SVTMLKL89RJNbcYFIPk800I9Mz
	IVMNILO6pi6RjT4eQUzHfjvJM8wMQLYpK9DCa/8X6Nv5K4eGA3vE4JYkp1FB1Ds+PTWo
	Ki1QKcg7OtNT7V8zQ2MUw2DNLFY2STMeJfWx54hStWMj6laQ+S6u2qyXeuUE30X0vITW
	DNmIktmoPG6UN4oOOKYgr9tEhC5YiCnREijJWC2ig2IKqM2sDCLv8wRZVbhNbQq/AHO/
	auEQ==
X-Gm-Message-State: ALoCoQk3BEhbReZLwyRY7aF6iNKYKj9NHtKD6HNnapaTuYUcsv9Ir7G0PnEdp8XSr8CBGyKILKpL
MIME-Version: 1.0
X-Received: by 10.205.25.1 with SMTP id rg1mr281217bkb.56.1382427439915; Tue,
	22 Oct 2013 00:37:19 -0700 (PDT)
Received: by 10.204.66.141 with HTTP; Tue, 22 Oct 2013 00:37:19 -0700 (PDT)
In-Reply-To: <CAMKF1sqpTK+vypxO-2vrHvf34mqfDdF8AK2sgybnd62WtXvn1A@mail.gmail.com>
References: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
	<CAMKF1sqpTK+vypxO-2vrHvf34mqfDdF8AK2sgybnd62WtXvn1A@mail.gmail.com>
Date: Tue, 22 Oct 2013 10:37:19 +0300
Message-ID: <CAAqcGHmA8JKz-LEZvN76HzViMwA1P0FtYWLgt0z4oztet0C6fA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] ltp: cleanup recipe
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
X-List-Received-Date: Tue, 22 Oct 2013 07:37:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 October 2013 01:42, Khem Raj <raj.khem@gmail.com> wrote:
> On Monday, October 21, 2013, Riku Voipio <riku.voipio@linaro.org> wrote:
>> Cleanups for ltp:
>>
>> 1. Instead of using giturl like in Anders's patch use the sourceforge
>> mirror URL.
>
> whats wrong with git url ?

The previous LTP version in OE used to have tarball url, so I was just
changing it back. I guess the main functional difference is that git
url won't have checksums for downloads? Using tarball downloads over
git checkouts is being more kind to upstream hosting. Mostly a matter
of taste, or does OE-core have some preferred policy?

Riku

>> 2. remove to the manual unpack rule and just set S variable to source
>> directory.
>> 3. Follow the OE style guide for variable order.
>> ---
>>  meta/recipes-extended/ltp/ltp_20130904.bb | 50
>> +++++++++++++------------------
>>  1 file changed, 21 insertions(+), 29 deletions(-)
>>
>> diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb
>> b/meta/recipes-extended/ltp/ltp_20130904.bb
>> index 5e10448..43fe780 100644
>> --- a/meta/recipes-extended/ltp/ltp_20130904.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20130904.bb
>> @@ -21,44 +21,21 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>
>>  DEPENDS = "attr libaio libcap acl openssl"
>>
>> -SRC_URI = "git://github.com/linux-test-project/ltp.git"
>> +SRC_URI =
>> "${SOURCEFORGE_MIRROR}/project/ltp/LTP%20Source/ltp-${PV}/ltp-full-${PV}.tar.bz2
>> \
>> +           "
>>
>> -SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
>> -S = "${WORKDIR}/git"
>> +SRC_URI[md5sum] = "0cf2ccb7199f8318d413c62a085629f0"
>> +SRC_URI[sha256sum] =
>> "662c3661a4d1bfbf3187d0835f35e613b43eedc35a840e3283e378a19606ee0b"
>>
>>  export prefix = "/opt/ltp"
>>  export exec_prefix = "/opt/ltp"
>>
>>  inherit autotools
>>
>> -RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
>> -
>> -FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
>> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
>> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
>> -FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
>> -FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
>> -FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
>> -FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
>> -
>> -FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
>> -
>> -FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/*
>> /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/*
>> /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/*
>> /opt/ltp/testcases/open_posix_testsuite/conformance/*
>> /opt/ltp/testcases/open_posix_testsuite/Documentation/*
>> /opt/ltp/testcases/open_posix_testsuite/functional/*
>> /opt/ltp/testcases/open_posix_testsuite/include/*
>> /opt/ltp/testcases/open_posix_testsuite/scripts/*
>> /opt/ltp/testcases/open_posix_testsuite/stress/*
>> /opt/ltp/testcases/open_posix_testsuite/tools/*"
>> +S = "${WORKDIR}/ltp-full-${PV}"
>>
>>  TARGET_CC_ARCH += "${LDFLAGS}"
>>
>> -do_unpack_append() {
>> -    bb.build.exec_func('do_extract_tarball', d)
>> -}
>> -
>> -do_extract_tarball() {
>> -       if test -f ${WORKDIR}/ltp-full-${PV} ; then
>> -           tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C
>> ${WORKDIR}
>> -           rm -rf ${WORKDIR}/ltp-${PV}
>> -           mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
>> -       fi
>> -}
>> -
>>  do_install(){
>>         install -d ${D}/opt/ltp/
>>         oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
>> @@ -66,10 +43,25 @@ do_install(){
>>         # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>>         cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>>
>> -       # We need to remove all scripts which depend on /usr/bin/expect,
>> since expect is not supported in poky
>> +       # We need to remove all scripts which depend on /usr/bin/expect,
>> since expect is not supported in oe-core
>>         # We will add expect for enhancement in future
>>         find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" |
>> awk -F":" '{print $1}' | xargs rm -f
>>  }
>>
>> +FILES_${PN}-dbg += "/opt/ltp/runtest/.debug \
>> +                    /opt/ltp/testcases/bin/.debug \
>> +                    /opt/ltp/testcases/bin/*/bin/.debug \
>> +                    /opt/ltp/testcases/bin/*/test/.debug \
>> +                    /opt/ltp/scenario_groups/.debug \
>> +                    /opt/ltp/testscripts/.debug \
>> +                    /opt/ltp/testscripts/open_posix_testsuite/.debug \
>> +                    "
>> +
>> +FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
>> +
>> +FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/*
>> /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/*
>> /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/*
>> /opt/ltp/testcases/open_posix_testsuite/conformance/*
>> /opt/ltp/testcases/open_posix_testsuite/Documentation/*
>> /opt/ltp/testcases/open_posix_testsuite/functional/*
>> /opt/ltp/testcases/open_posix_testsuite/include/*
>> /opt/ltp/testcases/open_posix_testsuite/scripts/*
>> /opt/ltp/testcases/open_posix_testsuite/stress/*
>> /opt/ltp/testcases/open_posix_testsuite/tools/*"
>> +
>> +RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
>> +
>>  # Avoid generated binaries stripping. Otherwise some of the ltp tests
>> such as ldd01 & nm01 fails
>>  INHIBIT_PACKAGE_STRIP = "1"
>> --
>> 1.8.3.1
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


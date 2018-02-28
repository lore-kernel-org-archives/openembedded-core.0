Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 47E0A782A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:46:17 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id u5so495655pfh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=m/stg2+3cbWvf7A3tefAVkPn79PghJQltxYY38GUeu4=;
	b=qmQum4gC6CzF4SakCuIzIPQVjhtDI3zyrQmBsBWOTkk/b341ytsgtPpdrISGQUVHkJ
	EaV1vgqd+YL5GzsJgedfLJ6KSmZ9kiKu8z7ur2Di3i4AeQo3N2PPL/0u2jJTspDoQDFk
	56awrnWNev4erXFjKf1t3nL4DrvC5NyF7fve1okwxaYD1bVJcY9I5bKNM1Mm3PLgSOEa
	11sPhJU8ggP3N66H1rEXQOQWnjagtb1Xa5ycb/QBdGdOAYlIzxKa/HwUISqPBnD6CiMH
	psE+N9Sj8xh/q+5QVAmIH4WinbmGAhBWQz54wWPFajOY2nCqSWs+RgyjyoLc6Wd20DOB
	dSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=m/stg2+3cbWvf7A3tefAVkPn79PghJQltxYY38GUeu4=;
	b=SXIQCE60GvEMsg08Lv8cuYl+sPD8MGpwFTzwgOnwjCoSvUObEn2Cxue5cXZnnw6CwQ
	PumqIF77GVbkos7Y83u16DhAwZk6h6XPS8yqPsO0sZXGd1qpzuJ66vWgSIw4fnvAjGkX
	/FFjNuvBGnrmauomsFfA7ghVS8V9zkZCNAPoQ9tUFHTYzGlMif0hOJq7d1OQOGI+B4ja
	tQ1RKhW3fBf/uiVoF3jKorYoV2YLEO+x1g8yrqRpkjthgEv3YneLFMMCD/b8Qc8sv807
	lglf/yylWkkNPoRdIhyIWmLrNJYUJklq2zwsA5y7imeWp8Bd8fBZMwV3So5K/bV1HrU+
	tezQ==
X-Gm-Message-State: APf1xPDSLadumtyhhV9bbhaPmhB9C/keZ1GwUhJDAVS4TawKep2Pbe2n
	M5JNUihsAABAjfrSmUdeYUc=
X-Google-Smtp-Source: AH8x224fJPZ8eB3p2pCukbpl6/uWedI6cfWd2NzwCulvi6ROmeXT1eoBgwJzes9bUHbd2q2atbjJ7Q==
X-Received: by 10.101.81.204 with SMTP id i12mr13032557pgq.206.1519789579312; 
	Tue, 27 Feb 2018 19:46:19 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:812d:b93c:3785:4a27])
	by smtp.gmail.com with ESMTPSA id
	k195sm648144pgc.61.2018.02.27.19.46.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 19:46:18 -0800 (PST)
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1519762766-20100-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <eda462cd-26be-df48-2157-8bbfe00a4740@gmail.com>
Date: Tue, 27 Feb 2018 19:46:17 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1519762766-20100-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH] dbus-test_1.12.2: various fixes
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
X-List-Received-Date: Wed, 28 Feb 2018 03:46:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/27/18 12:19 PM, Juro Bystricky wrote:
> The result of running dbus-test-ptest was a series of
> various segfaults, interpreted as FAILs. This was a direct consequence
> of the test suite loading the installed shared library libdbus-1.so, not the
> one built along the test suite.
> 
> While we normally want to test against the installed libraries, we cannot
> do this in this case as the test suite expects a library that is configured/compiled
> differently from the installed one. We could configure the installed library
> identically as the test suite expects, (and there should be no issues), however
> this is not desirable for performance reasons.
> 
> Hence we need to use the library built along with the test suite.
> Of course, running the test suite against its own library does not
> test the installed library, however they are both built from the same
> sources so that can give us some kind of indication.
> 
> The following changes were made:
> 
> 1. Configure the test library as close as possible to the installed one,
>     with some additional configuration options that are needed for testing.
>     (Use dbus_1.12.2.bb recipe as a template)
> 2. Include the shared libraries in the package, use LD_LIBRARY_PATH during
>     testing to load them instead of the installed ones.
> 3. Add a few more tests. (There are still some additional tests built that
>     are not used, but they would have to be special-cased).
> 4. When evaluating the test results, differentiate between "FAIL" and "SKIP"
> 
> [YOCTO #10841]
> [YOCTO #12277]
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>   meta/recipes-core/dbus/dbus-test_1.12.2.bb | 30 ++++++++++++++++++++++++++----
>   meta/recipes-core/dbus/dbus/run-ptest      | 20 +++++++++++++++++---
>   2 files changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.2.bb b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
> index c3891a3..a6a5ca2 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.2.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
> @@ -34,25 +34,47 @@ EXTRA_OECONF = "--enable-tests \
>                   --enable-checks \
>                   --enable-asserts \
>                   --enable-verbose-mode \
> +                --enable-largefile \

Perhaps this should be controlled with DISTRO_FEATURE for largefile as 
well ?

>                   --disable-xml-docs \
>                   --disable-doxygen-docs \
>                   --disable-libaudit \
> -                --disable-systemd \
> -                --without-systemdsystemunitdir \
>                   --with-dbus-test-dir=${PTEST_PATH} \
>                   ${EXTRA_OECONF_X}"
>   
> +EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
> +PACKAGECONFIG_class-native = ""
> +PACKAGECONFIG_class-nativesdk = ""
> +
> +PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
> +PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
> +PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> +

hmm packageconfigs while a good thing here, would be nice if was 
mentioned in commit msg.

>   do_install() {
>       :
>   }
>   
>   do_install_ptest() {
>   	install -d ${D}${PTEST_PATH}/test
> -	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
> +	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay \
> +	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass "

Dont know if we will be testing same things but this is a good start.

>   	for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
> +
>   	l="bus bus-system bus-launch-helper"
>   	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
> -	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
> +
>   	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
> +	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
> +
> +	install -d ${D}${PTEST_PATH}/test/.libs
> +	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
> +
> +	# Remove build host references...
> +	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf \) -type f -exec \
> +		sed -i \
> +		 -e 's:${B}:${PTEST_PATH}:g' \
> +		 {} +
>   }
> +
>   RDEPENDS_${PN}-ptest += "bash"
> diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
> index c72d083..8a8970e 100755
> --- a/meta/recipes-core/dbus/dbus/run-ptest
> +++ b/meta/recipes-core/dbus/dbus/run-ptest
> @@ -1,10 +1,24 @@
>   #!/bin/sh
>   
>   output() {
> -  if [ $? -eq 0 ]
> +  retcode=$?
> +  if [ $retcode -eq 0 ]
>       then echo "PASS: $i"
> -    else echo "FAIL: $i"
> +  elif [ $retcode -eq 77 ]
> +    then echo "SKIP: $i"
> +  else echo "FAIL: $i"
>     fi
>   }
>   
> -for i in `ls test/test-*`; do ./$i ./test/data DBUS_TEST_HOMEDIR=./test >/dev/null; output; done
> +export DBUS_TEST_HOMEDIR=./test
> +export XDG_RUNTIME_DIR=./test
> +export LD_LIBRARY_PATH=/usr/lib/dbus-test/ptest/test/.libs
> +
> +files=`ls test/test-*`
> +
> +for i in $files
> +	do
> +		./$i ./test/data >/dev/null
> +		output
> +	done
> +
> 


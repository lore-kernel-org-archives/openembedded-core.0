Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3687F74BBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 12:44:51 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id s198-v6so35567600oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IRhspz/kqhmm6Az4FGG5vMmkYYIoZfiK4VRIraPAVBM=;
	b=PTqM+Y9lU92AAF6DstDQw+fbQqB0mr92ZiznboWcsdADjF+GHMLQPN9CtoPut4+8cy
	7fxuoChWwYPQO5ywjdQpAhfpFV2oFrdm1YEtq3gRlYLTCmHznQKA51UmULyUp3XD4IHR
	Ru7SOxDZzmTgBVQtxdw6Q2MaJojLiaCG3nP489GWf/SjqGFqq14IGEcrE2YT7MV1irjb
	bQaNVDZt6pJ4LN+Eza7CDESkWNvbXG4+qAaA/KoqQn2fHyPdlI3H0ucSgRMOdS8IzKdA
	4wY5xEFxq+9HiH22hcw2JF7WEu0YnFWOCEXusPWiipu+lrYzuIul2Uxk2UAX0RysdJSE
	cuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IRhspz/kqhmm6Az4FGG5vMmkYYIoZfiK4VRIraPAVBM=;
	b=qUSwgEuZOaiA5A6PLWbplWSHnN478JT18n0zWVFWrUQoL3Fub5UXmm9+e/E7Qvksy6
	ehr5w7OlnKxA1Zp7S5/0/ag8uwnKPvRKTbz/7W/MHFjQdw4DhGdSf4zr8npOkJe1T9zS
	/IUxDVB//xBwGAb7jckvELWE6Xqsa26Jj66+7TKm3eUQeE8jKL+UKe7ppGZCbi3E6zgE
	/G7zB6yBK+XBKeoaaYqlgEWVMHWt9u1n9T39HrycCr3DEDQU8GKbHY92QzlwMECjy2LF
	z77hUZo88imBOCn2TcHHhkIt6FZOWetrSNutvKyWOPhJl1t0TeKEqEll8ucE4XpAhTWq
	eZcA==
X-Gm-Message-State: APt69E0uGjdjBqVvBV99fQ8R/1W/dd3OOcQxCEkFE/IvFij3sNMyfS2v
	3Ok+9YX3/v8mtJ4fOYEqVsDMfFAqSaj4vVpDNjg=
X-Google-Smtp-Source: AAOMgpegY/PNSJ5YiB5xmFKeYvw3kV8A+gYvvseh7tkXj2sgXVcxGlUGmBI78coxn8waJ4AifQnn7X8SfVMD1krPWH8=
X-Received: by 2002:aca:4fcf:: with SMTP id
	d198-v6mr20574034oib.51.1531140292174; 
	Mon, 09 Jul 2018 05:44:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 05:44:51 -0700 (PDT)
In-Reply-To: <a377c55a-3c71-1a84-37ec-183bf02ec46b@siemens.com>
References: <20180608140403.27855-1-andrej.valek@siemens.com>
	<20180611133005.27521-3-andrej.valek@siemens.com>
	<a377c55a-3c71-1a84-37ec-183bf02ec46b@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jul 2018 14:44:51 +0200
Message-ID: <CANNYZj8HHt0y5GRjsB2YHFyDR_GHTB3b6Gin8CEDjpWbfaQgeg@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 3/3] openssl-1.1: /etc/ssl location compatibility
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
X-List-Received-Date: Mon, 09 Jul 2018 12:44:51 -0000
Content-Type: text/plain; charset="UTF-8"

No open issues from my side, please resend as Ross probably forgot to
pull it into his staging branch.

Alex

2018-07-09 14:06 GMT+02:00 Andrej Valek <andrej.valek@siemens.com>:
> Hi Alex,
>
> What is the current status of this upgrade? Are there still some open
> points?
>
> Cheers,
> Andrej
>
> On 06/11/18 15:30, Andrej Valek wrote:
>> Some packages have hard-coded path to /etc/ssl location.
>> Create a symlinks to correct location.
>>
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> Signed-off-by: Marko Peter <peter.marko@siemens.com>
>> ---
>>  meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> index df05f3a2b7..487219b600 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> @@ -22,7 +22,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>>
>>  S = "${WORKDIR}/openssl-${PV}"
>>
>> -inherit lib_package multilib_header ptest
>> +inherit lib_package multilib_header ptest relative_symlinks
>>
>>  do_configure () {
>>       os=${HOST_OS}
>> @@ -133,6 +133,18 @@ EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
>>  do_install () {
>>          oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
>>          oe_multilib_header openssl/opensslconf.h
>> +
>> +        # Create SSL structure for PATH hard-coded packages like ca-certificates
>> +        # Debian is also using this technique
>> +        install -d ${D}${sysconfdir}/ssl/
>> +        mv ${D}${libdir}/ssl-1.1/openssl.cnf \
>> +           ${D}${libdir}/ssl-1.1/certs \
>> +           ${D}${libdir}/ssl-1.1/private \
>> +           \
>> +           ${D}${sysconfdir}/ssl/
>> +        ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl-1.1/certs
>> +        ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl-1.1/private
>> +        ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl-1.1/openssl.cnf
>>  }
>>
>>  do_install_append_class-native () {
>> @@ -163,6 +175,6 @@ FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
>>  FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
>>  RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
>>  FILES_${PN}-engines = "${libdir}/engines-1.1"
>> -FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
>> -CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
>> +FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf ${libdir}/ssl-1.1/openssl.cnf"
>> +CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
>>  RRECOMMENDS_libcrypto += "openssl-conf"
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31254792EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:05:21 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id g18-v6so5020326uam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 22:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BUrVohAsMYQodORSuszF9GZo2WZVjv3j74nDOMJohGI=;
	b=QTtO5rfEevElu8AOQpyKXIvyIVRV0WgsZtd6t6BDGlEw3HyLPbHKFklx8Stj3Hw2DT
	65U4JyCRJagp4JePefzOoDJPviBgEjHpTjoWhy17sJac49brmNJPiYH4v0ONyT0pWbse
	ybPkVnG+nW7X+EgCsZ/rKtK6fFBLTb95KeG0C58iBZZWAaMqWHBUJx8hsXiXzTXFZrN6
	1LUf4w9B/jYedRSuzPkv4vfgK56baAZlbWNr1T2RxW8rxMJHlzbTAimhg6HEdVJUykvg
	K4Wt4oU7JqRHk+Z5+gwt2FQFSVRxY0d4hjTMGFVKrFbCpb3Y2ogoRRgdXWeH3BF5rwxz
	xQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BUrVohAsMYQodORSuszF9GZo2WZVjv3j74nDOMJohGI=;
	b=Ys0Ud/gZqLAbFXd+YCwn8FBf66h3rlFpIlg1+Jc4m9TZmW1OHjfbR86yTCx4OFzqot
	VGAZ20/LFMOK0F5UUg2M/mfDEQRlppGRhXub4F5sA5CVAO6arulluvMenTGwk98dsipW
	KdP0T8KFxo0lXckPXNLyVLg73ntN2ocbTEoQFQ6Zl3cWbbNfFBYwWMbVK0d+5c+qP00h
	K+CFYOGWNhbq91JYt6+4iRi+AlFE1zxIV9WIDaOwl7iyaVkGphIbZGDA6R+qNpM86kmg
	d5L97kUCogrMqIaPNee5oS1fESmWkPp/Jk+spkq9XB4uynuMMzhdHPJYPRtpWzJM4QZI
	iXXA==
X-Gm-Message-State: AOUpUlH7CEN67sCR8JwW4lyPy4elNlFPcDx9iGLBXyc0Gzjfz6hLL76Z
	vsFFf/wljRxhdLD47NgcsVkab96D8q4Q3x+SBj4=
X-Google-Smtp-Source: AA+uWPwj8CJ8m1yPbzahPfG3iJ8fA0BFWqa+Ux2gqv9avPgACl/7wUkiark8W+u07re0X/H6rna9O6xa2pxs6o690KI=
X-Received: by 2002:ab0:5b8f:: with SMTP id
	y15-v6mr21856497uae.59.1534482322051; 
	Thu, 16 Aug 2018 22:05:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 16 Aug 2018 22:05:21 -0700 (PDT)
In-Reply-To: <CAJ86T=WL-za2Yd9d=jkQ48gBc9FB4uy3TH0VBR4vEy8hJcoPYQ@mail.gmail.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
	<20180717091035.26461-1-andrej.valek@siemens.com>
	<20180717091035.26461-3-andrej.valek@siemens.com>
	<CAJ86T=WL-za2Yd9d=jkQ48gBc9FB4uy3TH0VBR4vEy8hJcoPYQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Aug 2018 22:05:21 -0700
Message-ID: <CAJ86T=W22Q_U1U18Q5TgSZtmQS93iwj=TwUuL9BUjeJxWhOsKA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 2/3] openssl-1.1: rework packaging
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
X-List-Received-Date: Fri, 17 Aug 2018 05:05:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 12:34 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Jul 17, 2018 at 2:10 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
>> The main idea is to have libssl and libcrypto in separate packages.
>> This saves space if only single library is needed and also some recipes
>> (in other layers) depend on these library packages.
>> Together with this other packages like in 1.0.x were created.
>> The only difference is that openssl 1.1 has additional package openssl-bin.
>>
>> Add missing dependency to perl for openssl-bin pkg, c_rehash requires it.

That perl dependency needs to be looked at again. By using the
unofficial c_rehash shell script for -native and the official upstream
perl script for the target we get the worst of both worlds - the
maintenance effort of the unofficial shell script and the perl runtime
dependency on the target.

To help users who don't want perl on the target, either the perl
version of c_rehash should go back into openssl-misc (where it always
used to be) or maybe it can now be dropped entirely as "openssl
rehash" seems to be replacement?

  https://www.openssl.org/docs/man1.1.0/apps/rehash.html

>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> Signed-off-by: Marko Peter <peter.marko@siemens.com>
>> ---
>>  meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> index c5de085521..7af527ca31 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
>> @@ -158,12 +158,22 @@ do_install_ptest() {
>>          sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
>>  }
>>
>> -PACKAGES =+ "${PN}-engines"
>> +PACKAGES =+ "libcrypto libssl ${PN}-misc ${PN}-engines openssl-conf"
>>
>> +FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
>> +FILES_libssl = "${libdir}/libssl${SOLIBS}"
>>  FILES_${PN} =+ "${libdir}/ssl-1.1/*"
>>  FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
>>  FILES_${PN}-engines = "${libdir}/engines-1.1"
>>
>> +FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
>> +RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
>
> There is no "perl" PACKAGECONFIG in the openssl 1.1 recipe (there are
> no PACKAGECONFIG options at all...).
>
>> +
>> +FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
>> +CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
>> +RRECOMMENDS_libcrypto += "openssl-conf"
>> +
>> +RDEPENDS_${PN}-bin = "perl"
>>  RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
>>
>>  BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


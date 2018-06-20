Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 76C2575318
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 18:08:17 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id d19-v6so522931oti.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6A7CVpuF7ifq8dLsdxq59GUZf6vZlqT3On96eP6POlE=;
	b=U6M+FUBuUZXCd9MVYhcqT9gikqvTkSXgzOJkxnTE9jD8FF5KSKfKtu4K/UgxZn5HGz
	9kdxXco3nS0ENYqvKCRfj2JPkkJUp3nxhK8Fhe7UKEgJWp48ueRvV+YE8vFiKOxEEb2Q
	KOkTID0TdHRwiVgtljiqgwcMgBlscZimA4ZCqK84wKtNjMWRCCZcQBoc2Gzabus8pmTW
	0NSX+zah5noasMEn7xsYhDPw083NMKNORh+JGIi9CYuMSY7Mr1majoIFgwrOsH81jk74
	wpdnICp22hp73D1CkfU8y41R0iChC8A7s2/AOtoIXcr3kJJG1sKyiPJxiSWsYnwC1n88
	hmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6A7CVpuF7ifq8dLsdxq59GUZf6vZlqT3On96eP6POlE=;
	b=NErWmpPLB89Zm698p+OcCmtoG+wa6+xpz14L/9YAMWQWLlfNjN/r+aefPTUfxfRmvb
	xnoS0ne92bL26syqjXf4687mhr8Ey/mDRTbs9yep7EBqB2pTNVPoDgbUvSiGRp/3isWD
	UqgY1LYfz/1iF3auHKH4vBGtd+Sdco2sLnNUHc2866nfoI+JF5jMc+eMmGZgFtCo+bAA
	xlIPoYIiSAIRodEjJxlwh1s539AECdp2CoPSidKM2nNh+r3Z30jKZym1OPbsZoFp7Kes
	15qzS6uqPpcKzDRD4rgI1WjL69sjldoK060rLrvVCD4JbkCFopo0kQ/g43BCCupFjKSg
	AX+g==
X-Gm-Message-State: APt69E3Y7oCDpAIOCTIDpa1xaHTKCdotoAsdSuABlIvLQiWVkxmo9VSM
	3aOmYFnZiZZpwdCcnEMv9WD6dBzUFJk/Au4CAggMhg==
X-Google-Smtp-Source: ADUXVKL4NGXw2WeXJ7iZ/18f4pSlLSMWocSSaGchxLQVf4Kjb8mU14xvvL5Vf6QHh1UkdcMrx9ngQ2MBB2vR4goIVlU=
X-Received: by 2002:a9d:5170:: with SMTP id
	u45-v6mr13034168oti.89.1529518098588; 
	Wed, 20 Jun 2018 11:08:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 11:07:58
	-0700 (PDT)
In-Reply-To: <CAMKF1spbWUXYQ-Gz1z-sbm+f_QYz_FPHh0bR=uqmVbfUTcSULA@mail.gmail.com>
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
	<1529503642-7158-5-git-send-email-maxin.john@intel.com>
	<CAMKF1spbWUXYQ-Gz1z-sbm+f_QYz_FPHh0bR=uqmVbfUTcSULA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jun 2018 19:07:58 +0100
Message-ID: <CAJTo0LaWe1NNusp==RoC767_Tq-3ifozumgdRLxyYRhG5XbmZg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Wed, 20 Jun 2018 18:08:17 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, those should be in the -dev package.

Ross

On 20 June 2018 at 18:18, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jun 20, 2018 at 7:07 AM Maxin B. John <maxin.john@intel.com> wrote:
>>
>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> ---
>>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb}             | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb} (82%)
>>
>> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
>> similarity index 82%
>> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
>> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
>> index 0a9b029..f8b0056 100644
>> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
>> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
>> @@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
>>
>>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
>>
>> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
>> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
>> +SRC_URI[md5sum] = "97cb89c6e2a914c05c8b7e858703885f"
>> +SRC_URI[sha256sum] = "fbed6392ddb085e45e6090a9f389f72926d0e355f4b0a2ef51d35cf21686df45"
>>
>>  inherit autotools pkgconfig lib_package gtk-doc
>>
>> @@ -27,6 +27,10 @@ EXTRA_OECONF = " \
>>      --with-glib \
>>      --without-graphite2 \
>>  "
>> +do_install_append() {
>> +    # Remove unnecessary cmake files
>> +    rm -rf ${D}${libdir}/cmake
>> +}
>
> perhaps they should go into -dev package instead.
>
>>
>>  PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
>>
>> --
>> 2.4.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


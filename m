Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B8D596BD4E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 17:37:31 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y126so18610984pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2019 09:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:references:to:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=8RoR5jlRyTq/Mms3nJHmDtPnqWgK7MLVVjEELMlmDhI=;
	b=O1QPSx64I2O5ctnfCJTwPJ5LTB2jtXs5TSsa+laSCg5l2Mb2TSB279Iw0DG55SK1px
	mq4nKe6leVZ+GgCndMGapAngtruqGN1+Y//whIPP7vzCOdJb7okc7FZJJVa56JduIj+P
	w8E7sc82IXb7ZBN0q0R3JEFAysVGpkaoSHXbQ9ULRp3CYjmYRrU21Vod8DUldrlrE3pC
	RS0d2Y/rvvni5XDK7kvXimQjoA/k2HUboS3QxeLVb0+FZsAsLBPr2io9hq5eumQkc2XJ
	WrvB3PT2i5leEPdXEmaYVtJ7hitSkQ4O3Fpy8D+jLy2c4DDqTiDnI9PW9M0liPHLqWgj
	5exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=8RoR5jlRyTq/Mms3nJHmDtPnqWgK7MLVVjEELMlmDhI=;
	b=Anb1+f1ySvQnDl1qDCD+PXZivxk9VkKAAZArjdgiOGCQ8mBJv90vZSaAkhnI7s7ZTb
	LGc+DzIs8T8uauDZAwgoXN/iryd+h2HkrJ9nwzib4D+DrRDzROJnSFe8+rydzHyf8UiJ
	j++Gp1gHtdNjFRr6xRzSLpwXd3uaX0XaWC9eOMmaN23DSC+onMpiaEONfp6QM5E8uLzk
	VkejrA2ruOHxz1PSPj+bhVx9OkjThesDt2gUfmwxp0mxs4TvNTc8NZ7To+ANnSGrtMMt
	xv7ZjirbD87KO5LJAgoEdUBTTh/7/tmWAn7PwNaHHRx0r7TQ1xwNYY9eZcfsyT1sakZP
	yC2A==
X-Gm-Message-State: AJcUukd438j4R8CkhdKczL56bG1JjrtEjd4eWvniPxKhJhlJ0c+faaBz
	12AZWxRie1LxRr2YISrCAR4piYv5
X-Google-Smtp-Source: ALg8bN5Tfa/TdC6zxkqrS2LI+DKgVf5yIHP6F4I50m+FrXSiDgcfqnt/jXyoolcitidySCaj3m1ogQ==
X-Received: by 2002:a63:8e43:: with SMTP id k64mr49119096pge.346.1546623452229;
	Fri, 04 Jan 2019 09:37:32 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7513:b68a:6d2a:56d9?
	([2601:202:4180:c33:7513:b68a:6d2a:56d9])
	by smtp.gmail.com with ESMTPSA id
	u29sm80943136pgn.23.2019.01.04.09.37.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 09:37:31 -0800 (PST)
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <cc0495de-43f3-7b0b-5580-ec3a2eefab91@gmail.com>
Date: Fri, 4 Jan 2019 09:37:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH 1/8] tzdata/tzcode-native: update to 2018i
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
X-List-Received-Date: Fri, 04 Jan 2019 17:37:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/2/19 8:36 AM, Armin Kuster wrote:
> 2018i:
>
>   Briefly:
>     São Tomé and Príncipe switches from +01 to +00 on 2019-01-01.
>
>   Changes to future timestamps
>
>     Due to a change in government, São Tomé and Príncipe switches back
>     from +01 to +00 on 2019-01-01 at 02:00.  (Thanks to Vadim
>     Nasardinov and Michael Deckers.)

Is there any issue with this update? I notice some of my update got in
but no feedback on this one.

- Armin
>
> 2018h:
> Briefly:
>     Qyzylorda, Kazakhstan moved from +06 to +05 on 2018-12-21.
>     New zone Asia/Qostanay because Qostanay, Kazakhstan didn't move.
>     Metlakatla, Alaska observes PST this winter only.
>     Guess Morocco will continue to adjust clocks around Ramadan.
>     Add predictions for Iran from 2038 through 2090.
>
>   Changes to future timestamps
>
>     Guess that Morocco will continue to fall back just before and
>     spring forward just after Ramadan, the practice since 2012.
>     (Thanks to Maamar Abdelkader.)  This means Morocco will observe
>     negative DST during Ramadan in main and vanguard formats, and in
>     rearguard format it stays in the +00 timezone and observes
>     ordinary DST in all months other than Ramadan.  As before, extend
>     this guesswork to the year 2037.  As a consequence, Morocco is
>     scheduled to observe three DST transitions in some Gregorian years
>     (e.g., 2033) due to the mismatch between the Gregorian and Islamic
>     calendars.
>
>     The table of exact transitions for Iranian DST has been extended.
>     It formerly cut off before the year 2038 in a nod to 32-bit time_t.
>     It now cuts off before 2091 as there is doubt about how the Persian
>     calendar will treat 2091.  This change predicts DST transitions in
>     2038-9, 2042-3, and 2046-7 to occur one day later than previously
>     predicted.  As before, post-cutoff transitions are approximated.
>
>   Changes to past and future timestamps
>
>     Qyzylorda (aka Kyzylorda) oblast in Kazakhstan moved from +06 to
>     +05 on 2018-12-21.  This is a zone split as Qostanay (aka
>     Kostanay) did not switch, so create a zone Asia/Qostanay.
>
>     Metlakatla moved from Alaska to Pacific standard time on 2018-11-04.
>     It did not change clocks that day and remains on -08 this winter.
>     (Thanks to Ryan Stanley.)  It will revert to the usual Alaska
>     rules next spring, so this change affects only timestamps
>     from 2018-11-04 through 2019-03-10.
>
>   Change to past timestamps
>
>     Kwajalein's 1993-08-20 transition from -12 to +12 was at 24:00,
>     not 00:00.  I transcribed the time incorrectly from Shanks.
>     (Thanks to Phake Nick.)
>
>     Nauru's 1979 transition was on 02-10 at 02:00, not 05-01 at 00:00.
>     (Thanks to Phake Nick.)
>
>     Guam observed DST irregularly from 1959 through 1977.
>     (Thanks to Phake Nick.)
>
>     Hong Kong observed DST in 1941 starting 06-15 (not 04-01), then on
>     10-01 changed standard time to +08:30 (not +08).  Its transition
>     back to +08 after WWII was on 1945-09-15, not the previous day.
>     Its 1904-10-30 change took effect at 01:00 +08 (not 00:00 LMT).
>     (Thanks to Phake Nick, Steve Allen, and Joseph Myers.)  Also,
>     its 1952 fallback was on 11-02 (not 10-25).
>
>     This release contains many changes to timestamps before 1946 due
>     to Japanese possession or occupation of Pacific/Chuuk,
>     Pacific/Guam, Pacific/Kosrae, Pacific/Kwajalein, Pacific/Majuro,
>     Pacific/Nauru, Pacific/Palau, and Pacific/Pohnpei.
>     (Thanks to Phake Nick.)
>
>     Assume that the Spanish East Indies was like the Philippines and
>     observed American time until the end of 1844.  This affects
>     Pacific/Chuuk, Pacific/Kosrae, Pacific/Palau, and Pacific/Pohnpei.
>
>   Changes to past tm_isdst flags
>
>     For the recent Morocco change, the tm_isdst flag should be 1 from
>     2018-10-27 00:00 to 2018-10-28 03:00.  (Thanks to Michael Deckers.)
>     Give a URL to the official decree.  (Thanks to Matt Johnson.)
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../tzcode/{tzcode-native_2018g.bb => tzcode-native_2018i.bb}     | 8 ++++----
>  meta/recipes-extended/tzdata/{tzdata_2018g.bb => tzdata_2018i.bb} | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-extended/tzcode/{tzcode-native_2018g.bb => tzcode-native_2018i.bb} (70%)
>  rename meta/recipes-extended/tzdata/{tzdata_2018g.bb => tzdata_2018i.bb} (98%)
>
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018g.bb b/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
> similarity index 70%
> rename from meta/recipes-extended/tzcode/tzcode-native_2018g.bb
> rename to meta/recipes-extended/tzcode/tzcode-native_2018i.bb
> index 3e2b60a..f056370 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2018g.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
> @@ -11,10 +11,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
>  
>  UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>  
> -SRC_URI[tzcode.md5sum] = "b48f0282b80bb7dbe16e35626f446ae9"
> -SRC_URI[tzcode.sha256sum] = "aa53f4fb6570f02081be61dc11ade19ea5a280c23822a5b4016ce0c6be23c427"
> -SRC_URI[tzdata.md5sum] = "e71cb1f9d8d53c43904d79d7aeeedc1b"
> -SRC_URI[tzdata.sha256sum] = "02dfde534872f6513ae4553a3388fdae579441e31b862ea99170dfc447f46a16"
> +SRC_URI[tzcode.md5sum] = "6a6d98be8fa2fa3485e25343e79188b4"
> +SRC_URI[tzcode.sha256sum] = "aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b32b9f2ded32dc"
> +SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
> +SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
>  
>  S = "${WORKDIR}"
>  
> diff --git a/meta/recipes-extended/tzdata/tzdata_2018g.bb b/meta/recipes-extended/tzdata/tzdata_2018i.bb
> similarity index 98%
> rename from meta/recipes-extended/tzdata/tzdata_2018g.bb
> rename to meta/recipes-extended/tzdata/tzdata_2018i.bb
> index dba82ac..4482e89 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2018g.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2018i.bb
> @@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
>  SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
>  UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>  
> -SRC_URI[tzdata.md5sum] = "e71cb1f9d8d53c43904d79d7aeeedc1b"
> -SRC_URI[tzdata.sha256sum] = "02dfde534872f6513ae4553a3388fdae579441e31b862ea99170dfc447f46a16"
> +SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
> +SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
>  
>  inherit allarch
>  



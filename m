Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 841AF7D537
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:10:12 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id n190so13581678pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QzjmEbAaSlQgvPmA1n6ekTBTeumxuuklBrK5G6wwUCs=;
	b=cuB5HnJ2RqYCbBcRCLG7M4YpAgzfibp/AQpUTwdd8+dUmhAeKcs3JvA6+WFAnb9wdH
	k0Nx+uwULNwwIfER0W2ZB4DJ+cVVzkpCd8jvZ0GPQLyzZI5ZdzZPsdFglCwR0mpfsqJe
	JFUKsn+dx9RBR6OH5zauBPAPKmxCUGH8y0sSzOzhOY0eOgo/jPXYI+GyCec+8FKmyoD2
	3iBBYluH8GrU1SgZuWhAaR/CP7bgolcV3enc1MDwyNx7RHCtGb9S1tJSQ9fSLtkZh5XM
	wH/lHz6wM4t/mrJaSQTlT8z6qJ8VPIa9WPBi0hsDA79t2YRGj0LXRPwSQBX528dzsSYo
	+IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QzjmEbAaSlQgvPmA1n6ekTBTeumxuuklBrK5G6wwUCs=;
	b=n/UaU44qa50bX4TxL14OQ9QdeFT3ZHfzQLlAqQrPve2ts5x7CjT7diEuJExGuultMz
	1bL2Mx6cp46x2Wtdf7YNjRpCOdha9HdkoowWiGBNca4jWQ7Uwq0us+5/Wg68Uq30aitM
	RTW4VPLkN2n8KgVXkhmhQeF2eT1nb9UIauCHygEwUkeELin0XcOAwSIdWkEZGSsywmVg
	kTfzbgCA/7rHlHnCMgloiAsynUxTKYcjaRSqR85Y3YmL0jz77T79HaBgVxhHV42/rnOR
	uz+Q10By5XebaiVbYK/wsmM4Zd5VXmIiQOMCV15fxuk0B0cv7sF3Hon1NYoqM1tRJ0MG
	YB9w==
X-Gm-Message-State: APjAAAXbJ2GplFa4KtXXACdTXiNBXCkEtqrMGVsZYquHEH9KFQ7C2TyH
	X1yQy1dXpf3GyJbqI/kZ7VEf0kx3R8Y=
X-Google-Smtp-Source: APXvYqykIqYdNaNZOWh4dVQUvKeDrHnR4cAKkMeQ1JGOa/4OkoLmCE7/ITRUZfMoQWKRdcTzMBkqgg==
X-Received: by 2002:a17:90a:f0c6:: with SMTP id
	fa6mr174537pjb.137.1568297412406; 
	Thu, 12 Sep 2019 07:10:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:94af:b4e3:6058:dfc8?
	([2601:202:4180:c33:94af:b4e3:6058:dfc8])
	by smtp.gmail.com with ESMTPSA id
	b20sm30515661pff.158.2019.09.12.07.10.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Sep 2019 07:10:11 -0700 (PDT)
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <20190912065221.733-1-zangrc.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e91aab69-d7ab-dd80-1671-72e21e85711b@gmail.com>
Date: Thu, 12 Sep 2019 07:10:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912065221.733-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [PATCHv2] timezone:upgrade 2019b -> 2019c
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
X-List-Received-Date: Thu, 12 Sep 2019 14:10:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/11/19 11:52 PM, Zang Ruochen wrote:
> -tzdata : upgrade from 2019b to 2019c.
>
> -tzcode-native : upgrade from 2019b to 2019c.
>
> -tzdata.bb and tzcode-native.bb require timezone.inc.

Not exactly what I had in mind.  When there is a TZ update they send out
what changed any why.  It looks like this"

Briefly:
    Fiji observes DST from 2019-11-10 to 2020-01-12.
    Norfolk Island starts observing Australian-style DST.

  Changes to future timestamps

    Fiji's next DST transitions will be 2019-11-10 and 2020-01-12
    instead of 2019-11-03 and 2020-01-19.  (Thanks to Raymond Kumar.)
    Adjust future guesses accordingly.

    Norfolk Island will observe Australian-style DST starting in
    spring 2019.  The first transition is on 2019-10-06.  (Thanks to
    Kyle Czech and Michael Deckers.)

  Changes to past timestamps

    Many corrections to time in Turkey from 1940 through 1985.
    (Thanks to Oya Vulaş via Alois Treindl, and to Kıvanç Yazan.)

    The Norfolk Island 1975-03-02 transition was at 02:00 standard
    time, not 02:00 DST.  (Thanks to Michael Deckers.)

    South Korea observed DST from 1948 through 1951.  Although this
    info was supposed to appear in release 2014j, a typo inadvertently
    suppressed the change.  (Thanks to Alois Treindl.)

    Detroit observed DST in 1967 and 1968 following the US DST rules,
    except that its 1967 DST began on June 14 at 00:01.  (Thanks to
    Alois Treindl for pointing out that the old data entries were
    probably wrong.)

    Fix several errors in pre-1970 transitions in Perry County, IN.
    (Thanks to Alois Triendl for pointing out the 1967/9 errors.)

    Edmonton did not observe DST in 1967 or 1969.  In 1946 Vancouver
    ended DST on 09-29 not 10-13, and Vienna ended DST on 10-07 not
    10-06.  In 1945 Königsberg (now Kaliningrad) switched from +01/+02
    to +02/+03 on 04-10 not 01-01, and its +02/+03 is abbreviated
    EET/EEST, not CET/CEST.  (Thanks to Alois Triendl.)  In 1946
    Königsberg switched to +03 on 04-07 not 01-01.

    In 1946 Louisville switched from CST to CDT on 04-28 at 00:01, not
    01-01 at 00:00.  (Thanks to Alois Treindl and Michael Deckers.)
    Also, it switched from CST to CDT on 1950-04-30, not 1947-04-27.

    The 1892-05-01 transition in Brussels was at 00:17:30, not at noon.
    (Thanks to Michael Deckers.)

  Changes to past time zone abbreviations and DST flags

    Hong Kong Winter Time, observed from 1941-10-01 to 1941-12-25,
    is now flagged as DST and is abbreviated HKWT not HKT.

  Changes to code

    leapseconds.awk now relies only on its input data, rather than
    also relying on its comments.  (Inspired by code from Dennis
    Ferguson and Chris Woodbury.)

    The code now defends against CRLFs in leap-seconds.list.
    (Thanks to Brian Inglis and Chris Woodbury.)

  Changes to documentation and commentary

    theory.html discusses leap seconds.  (Thanks to Steve Summit.)

    Nashville's newspapers dueled about the time of day in the 1950s.
    (Thanks to John Seigenthaler.)

    Liechtenstein observed Swiss DST in 1941/2.
    (Thanks to Alois Treindl.)



>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
> index ce16524..f6bab1a 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -4,7 +4,7 @@ SECTION = "base"
>  LICENSE = "PD & BSD & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>  
> -PV = "2019b"
> +PV = "2019c"
>  
>  SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
>             http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
> @@ -12,7 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
>  
>  UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>  
> -SRC_URI[tzcode.md5sum] = "91e0978d947496fd6aaf46d351f9c41d"
> -SRC_URI[tzcode.sha256sum] = "2e479d409337da41408629ce6c3b4d8410b10ba6d4431d862e22d2b137d7756d"
> -SRC_URI[tzdata.md5sum] = "b26b5d7d844cb96c73ed2fb6d588daaf"
> -SRC_URI[tzdata.sha256sum] = "05d9092c90dcf9ec4f3ccfdea80c7dcea5e882b3b105c3422da172aaa9a50c64"
> +SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
> +SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
> +SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
> +SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"



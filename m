Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 183E3793E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:25:11 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id m11-v6so22697880oic.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5/LiZ13w1iO0vFqOVaYOYnwZqaK/nRK3me3X9+ELc1A=;
	b=xNXnlad1mhXpEueXuKvedIenjPIo4JvUFmIyrnr5H/8kTS1+rdx0zgg+QMXJL8x9MG
	gqGnKSryaExlgy8cfudbAOB+nAmzHJ/0HIyBJFTVeClVQPVMJ/au1FWg0PwSuKYLxxdJ
	gsI7lyhs5yiJWtQL87STyqMANITEksBs9zygq8laV8Fpm8SOT2TTsZqx0/QbwAaSPt8P
	2Pf566tMGa3xxsm0zW3W2axvFxXmU/A18fv+t3u/9LoY9Zose425n/fQljk2OlP8rYkO
	Qp4W1MIROzCSkm/KolgLqJfSQigJ3AtwGsX9AIy4ILaL59biZLNQw6baS8LEFJPg9amZ
	AdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5/LiZ13w1iO0vFqOVaYOYnwZqaK/nRK3me3X9+ELc1A=;
	b=aGb/Tqwdl3JxV9xCX2odnE3v7z+E+UGW2KNx9iSFYtf1/txvijAl4F8jKHjIB07FXJ
	LDlSHwKezIIv5WgI99iE8nI4GQRwbYkVU1ZpCezl27gW1tWTfFs5l1GEMlrzeH2AoUxW
	rWkdFZ2+c8XHEu3kgH5kwce39iAQ/Vwo/9aqa9a3KMCCgWecq0OuTMPciOAjqYdIC2Ip
	onSY2zpJz1sw9fGz6faHSsP+hxjsIOeDUZjn2FRs2F+vw/f0WbJZOnsuaAdfVHjBCqla
	o2H1dNVKrqj2GBLTu3fPOse9mXOE9vC00n7FtMUn+OixxDvgRH0y45DSiQsRViJSRwi1
	ro1Q==
X-Gm-Message-State: APzg51A1NF8btUaEZL6ra5XOiEntrD8jLr0SH7uaa8T8MOYYYpuCZyhe
	iTD+5qydkYDI40gpwUf4cmHRFrUpHJprJsUrqvS3yg==
X-Google-Smtp-Source: ANB0VdaJIvPgZsGlOfFcePVaS0KEudj/2OMyPPsXec6mYuiwIg+jzouaIJAehQaKJkDZXUtG6PClcbl+e+/v1A3ceU8=
X-Received: by 2002:aca:6cd5:: with SMTP id
	h204-v6mr7711671oic.140.1535732713047; 
	Fri, 31 Aug 2018 09:25:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7c0c:0:0:0:0:0 with HTTP; Fri, 31 Aug 2018 09:24:52
	-0700 (PDT)
In-Reply-To: <CAMKF1sqB66TwpFhpQtRc_UpZtdh-xizwWB93qsakpMBD-2zgEw@mail.gmail.com>
References: <20180830221333.31366-1-ross.burton@intel.com>
	<CAMKF1sqB66TwpFhpQtRc_UpZtdh-xizwWB93qsakpMBD-2zgEw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Aug 2018 17:24:52 +0100
Message-ID: <CAJTo0LZHfqad_cwy5QFnLe_aCraniJUM5TMHzqokfoUhFd8bQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs: disable static libraries in libjpeg-turbo
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
X-List-Received-Date: Fri, 31 Aug 2018 16:25:12 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, the way the controls need to be in here has bothered me for a while.

Ross

On 31 August 2018 at 17:17, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Aug 30, 2018 at 3:13 PM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Previously this was done with the generic autotools support, but CMake doesn't
>> have a standard option so set it explicitly.
>>
>
> Not particularly relevant to this patch but another approach could be
> to turn no-staticlibs into a distro feature and move these controls to
> respective recipes.
> may be for next release ..
>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/conf/distro/include/no-static-libs.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
>> index 7fd578b3ce7..cdc53916d07 100644
>> --- a/meta/conf/distro/include/no-static-libs.inc
>> +++ b/meta/conf/distro/include/no-static-libs.inc
>> @@ -36,6 +36,7 @@ DISABLE_STATIC_pn-libusb1-native = ""
>>  EXTRA_OECONF_append = "${DISABLE_STATIC}"
>>
>>  EXTRA_OECMAKE_append_pn-libical = " -DSHARED_ONLY=True"
>> +EXTRA_OECMAKE_append_pn-libjpeg-turbo = " -DENABLE_STATIC=False"
>>
>>  EXCONFIG_ARGS_append_pn-ncurses = " --without-normal"
>>  EXCONFIG_ARGS_append_pn-ncurses-native = " --without-normal"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


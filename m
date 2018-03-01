Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 118B7605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 09:56:58 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z10so2212731pfh.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 01:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vwcPc3ZiEDliKlBG44VGKhz43HXI9yS3+AN+MT+mtyg=;
	b=n52Ku+MtYKIahA+K1xwR1bLBDyMEh6QjsuadaA5KbM8V+UeESeDt5mxnj9jzPRNJpi
	zPdFaKmkwyBqqXyIyy6EqLcN6FA3TrgQ/HPQwRrA6fV7KthXIwzx48+H8qfoz3MU/nSS
	DLMk7IDHd4wStbHBiJGc0y0pGKhhXla0Zu5M2rFN/RnY04rvnlCczLgtopdytl7I+9KL
	0RJeh7HBI0rwRtdi889auTH/w4OvFXSdxX5VRf+j06I7rxgbBSsWT0qk0dcnYfEybHs3
	2+2LH10E0MDxUog14egls0+baupdSCw8V86U3+Xbs5bZ7FjL3zad1suk7bUhsb0bfARS
	W8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vwcPc3ZiEDliKlBG44VGKhz43HXI9yS3+AN+MT+mtyg=;
	b=F0RnsDmF//Sz3N57A5/ONBT2lGjAwQO8kvJnl5hsTle6LSzm9D7GWa3mzPgLv9qZKQ
	WoeuorMN7DC+13Jip7q4X9qeYbsy7r9Qwxfor3fEBCDnGC16fTPFwqxH7gPGHJr7Af5y
	6pcFV+OjzYNYZoG6xfesXjpNC5e4Ux635vGl4hUitdmh8q6O+yuCNQn022bLGnNldZjg
	gN74kUTEZj4fK/trq3O/EVjRehBohcUcBmqCymBgYuq9kWSmJ8elcE6g2e/lF/uSf820
	KvSX6+eoZIyBz091zJHcVr8J7auLG3toxvLHQkbJQIZLFWX6Dm0g9i5RGjlIz95aNcaI
	lm9w==
X-Gm-Message-State: APf1xPD7bpKDHYqxCsWztSX6XjXodZkdkb/JCq1TeyKjzZxryDAlMfWr
	bqfpdg078p8Qt6yXTgKCNxWq8b2vtmeQcp0/N6g=
X-Google-Smtp-Source: AG47ELvBoE2AtRp/QMLPJTJo4soGRnQPucbk+oigaPTTGtMnGEu8M4AsehM1RtzV1K2+HSHD22iOCDWxnNhWNpigHFo=
X-Received: by 10.99.64.66 with SMTP id n63mr1104100pga.204.1519898219758;
	Thu, 01 Mar 2018 01:56:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Thu, 1 Mar 2018 01:56:29 -0800 (PST)
In-Reply-To: <CAJTo0LacweumOd2kSTtcxuLn_wwEcG+D6R=zqNc_OqO2OMApPA@mail.gmail.com>
References: <20180228204607.16416-1-raj.khem@gmail.com>
	<CAJTo0LacweumOd2kSTtcxuLn_wwEcG+D6R=zqNc_OqO2OMApPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Mar 2018 01:56:29 -0800
Message-ID: <CAMKF1spLiBppPymRX5=mD9Vaazet=QF=rV0s=MQ9Uv-0dof5Cw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Enable static PIE support
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
X-List-Received-Date: Thu, 01 Mar 2018 09:56:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2018 at 12:35 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> Would this be the cause of glibc failing to build like this on PPC?
>
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/build/tm=
p/work/ppc7400-poky-linux/glibc/2.27-r0/recipe-sysroot-native/usr/bin/power=
pc-poky-linux.gcc-cross-initial-powerpc/../../libexec/powerpc-poky-linux.gc=
c-cross-initial-powerpc/gcc/powerpc-poky-linux/7.3.0/ld:
> read-only segment has dynamic relocations.
>

yes, I think we need to enable this option only for x86/x86_64/aarch64
since they alone support static PIE and may be we should limit this
to only with security_flags are enabled.

> The previous glibc run was all green, added this patch and it fails.
>
> Ross
>
> On 28 February 2018 at 20:46, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> go programs when compiled with PIE fails otherwise on aarch64
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/glibc/glibc_2.27.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb
>> b/meta/recipes-core/glibc/glibc_2.27.bb
>> index e9d4117a47..62db3e9d02 100644
>> --- a/meta/recipes-core/glibc/glibc_2.27.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
>> @@ -81,6 +81,7 @@ EXTRA_OECONF =3D "--enable-kernel=3D${OLDEST_KERNEL} \
>>                  --enable-bind-now \
>>                  --enable-stack-protector=3Dstrong \
>>                  --enable-stackguard-randomization \
>> +                --enable-static-pie \
>>                  ${GLIBC_EXTRA_OECONF}"
>>
>>  EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
>> --
>> 2.16.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


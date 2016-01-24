Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id D1EC465CBC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 20:20:46 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id h5so3163486igh.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fi4jqkg5ttjkPYM8rZsX1i5YshuS8V/cdeN6h5cWeYA=;
	b=LEmiV+sx6i6SyJZwETe+a9/ZDmiEZG5D5ByZebjrDlM53ogT9MfrcbqkxZg/CrCGsr
	xgbrxC2KCQ+lhzBnxP8otgBiwBlG1dQwJZZKEJQOdahBl2TJyOi2q12ryFNLNhbHNwwc
	gfp17eqBKZ01Otu5SQEsY3dk7jEXWXIdoSrJ1iPeVQOx5O7M7Nan3DTTDkPkrhpmf4+K
	KEvGBQourrgXosLRbit9SBVIS93HsFloSTfm9PEbKe74Zy08VjdrZtdYsExV6tuaW7fq
	2CQSCJp36Sw2JdCZEXv0nUJXaeotlJFB5L3Qcw5cJ13/YMtK8NCKHnvGVdcQXv73Lr3c
	P2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fi4jqkg5ttjkPYM8rZsX1i5YshuS8V/cdeN6h5cWeYA=;
	b=SoWA2i8cqVMRDxX8oAlteWuUxK1DDEFt1NyXcw6MLb0eIwHw86KUArOwkpQpNEQ65m
	E69RVnJwTPf/AvRGCUj7HydO/Jebrh6vcFxAUGX6Ccaoj84saqBn/zWickmwJOtbM7DE
	LTyNR8ARNGFz15uHwFHQNEtHrxaxH40cI8W9hGrxTBJ0/e6y9S75BfopSPuCJXzQznfr
	d/57tharXsWIhAjE+RsRwwW0KvdEww+SoIA0olQdT/ja92k26X+8RTnBIqUYGWEGsnmC
	KbOPf36FiDucm8njbo4ua0ZwIZ4zhmqR1lGRanr0rCnr+IdsKEgRuM6CvbQVKBshwp1W
	4K0w==
X-Gm-Message-State: AG10YOSlAcPltrdZIBSOZXDfOEEvbJy1BElw4SWvasLS/Qd8dTLeGgcK5ivewfTBw0cIMkJtBZjyicddmM1FXA==
X-Received: by 10.50.33.81 with SMTP id p17mr12849295igi.75.1453666847484;
	Sun, 24 Jan 2016 12:20:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sun, 24 Jan 2016 12:20:18 -0800 (PST)
In-Reply-To: <1692476.LQWgxAY4ZP@peggleto-mobl.ger.corp.intel.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<1453495750-104494-2-git-send-email-raj.khem@gmail.com>
	<1692476.LQWgxAY4ZP@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jan 2016 12:20:18 -0800
Message-ID: <CAMKF1srdMfR7o+zNHH9h7bvuKNuMyWytpy_jOsHmYrMir=Xnxg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] local.conf.sample: Document HOW-TO enable systemd or busbox to replace sysvinit
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
X-List-Received-Date: Sun, 24 Jan 2016 20:20:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 24, 2016 at 11:21 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Fri, 22 Jan 2016 20:49:10 Khem Raj wrote:
>> OE core provides systemd,busybox as options for system init system along
>> with sysvinit being the default. Document the needed settings to enable
>> systemd and busybox as options if user wishes.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/conf/local.conf.sample | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>> index a662f4d..b760546 100644
>> --- a/meta/conf/local.conf.sample
>> +++ b/meta/conf/local.conf.sample
>> @@ -209,6 +209,23 @@ PACKAGECONFIG_append_pn-qemu-native = " sdl"
>>  PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
>>  #ASSUME_PROVIDED += "libsdl-native"
>>
>> +#
>> +# Use busybox/mdev for system initialization
>> +#
>> +#VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
>> +#VIRTUAL-RUNTIME_login_manager = "busybox"
>> +#VIRTUAL-RUNTIME_init_manager = "busybox"
>> +#VIRTUAL-RUNTIME_initscripts = "initscripts"
>> +#VIRTUAL-RUNTIME_keymaps = "keymaps"
>> +#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>> +
>> +#
>> +# Use systemd for system initialization
>> +#
>> +#DISTRO_FEATURES_append = " systemd sysvinit"
>> +#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>> +#VIRTUAL-RUNTIME_init_manager = "systemd"
>> +#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
>>
>>  # CONF_VERSION is increased each time build/conf/ changes incompatibly and
>> is used to # track the version of this file when it was generated. This can
>> safely be ignored if
>
> Is this sort of thing really appropriate for local.conf though? Shouldn't we
> be encouraging people to create a distro config for this level of
> customisation?

with IRC feedback from RP and others. Its more of local.conf.extended
item. So I have moved it in there in my v2 patch currently under test.

https://github.com/kraj/openembedded-core/commit/78edec042a47814ffb465d3c6c326fcd2e45447f

poky .e.g works well with both sysvinit and systemd
and some other derived distros as well. So think more it may be
that putting this sort of information in nodistro conf in OE-Core may
be another option but extended local conf is quite advanced user experience
as well

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


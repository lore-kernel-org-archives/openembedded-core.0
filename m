Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 608AF78371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 12:46:31 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id x184so5464627oia.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=2ECjuDTs/oHJAbXkEXbDz79W038Jsa8VSgK7prO/vSs=;
	b=YP2StF0nLAFbn3ID+EAdRJfC8uHUDuf2jav5+7vIieuAsgPI6mEgojyw5BlMh+VphA
	Pv8csq4LoushwBmSED0n92kP97ZqZ85sx1BMaJGm/QgQ3XEasA2Pf6u2NQLNM5eyC6nd
	STLMpiD74sOTai5p86eA0E2rFLVawmzOPHW5RX/C4uFcZs5qU8+JzIonzaq5pyENsmHv
	G+vFgWLmCqkxWeICPhReCzgr+gsJ+8JlQeX1/bKk7LmEMSeQr+U5Z4QTsO5oxz6eV9Pb
	Gw6+cIgNpdAq2R5UBMSOx0Z/tmHVm1t/FY+LJ3dCWmnf/Oc0mez31pEt20Z+PhKwrjEx
	G7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=2ECjuDTs/oHJAbXkEXbDz79W038Jsa8VSgK7prO/vSs=;
	b=eQHIvGl5ilyb+U8Dqbxk0IeQMewZSPvmUQguSPGux8+Kx3bwsxuzCEYiRBPS4x7f2w
	i/sZQw5h1u5+EziP7U23l4mibBTPYRK2sGE86EWmt5Dz9Y2BHrpUiREKCd5o0qewyq89
	CQkojtrEceTITK2BcrBuMAqC2O6b4HHjU8zXzx1Nbp/SMqP/xiCtdPPkRvtn4TRVmKX4
	g92F6PD7f05jolxBGFJ7aReN/Xf0gpQEYnMNC1RuGcZHsSQm1IEPz9cYm9/ZOeQz2/qb
	tpplVGVliWH8Ac8JObXvWHluuqb7ps0nv/FITs0fFRWxm0kyAhVqobjDRwHfX4e6p9pF
	5qog==
X-Gm-Message-State: AHYfb5g+fl3BDQbNjpp2WJzsAdva/5SYN5CUzPuGJqU7HLUAM/mb/HGv
	NkAMMgNxCuOpf+DEuHs=
X-Google-Smtp-Source: ADKCNb7aLef4MBNrEwCft8TBWnJ+VAhsxpi1uw0mGudHUzAUgM+r7Lc+3R6IPP5rteh3cRm0SODbQw==
X-Received: by 10.202.236.204 with SMTP id k195mr1313522oih.294.1504097191960; 
	Wed, 30 Aug 2017 05:46:31 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	o204sm5329548oib.5.2017.08.30.05.46.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 05:46:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id t75so50174589oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 05:46:30 -0700 (PDT)
X-Received: by 10.202.85.196 with SMTP id j187mr1561942oib.67.1504097190096;
	Wed, 30 Aug 2017 05:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Wed, 30 Aug 2017 05:46:29 -0700 (PDT)
In-Reply-To: <1504085996.12799.39.camel@intel.com>
References: <20170829204309.16139-1-otavio@ossystems.com.br>
	<1504085996.12799.39.camel@intel.com>
Date: Wed, 30 Aug 2017 09:46:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqSH7PNk1fATkb6CGiwkKAnkuR5d2esZtVbzp77b2n3Mg@mail.gmail.com>
Message-ID: <CAP9ODKqSH7PNk1fATkb6CGiwkKAnkuR5d2esZtVbzp77b2n3Mg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Wed, 30 Aug 2017 12:46:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 30, 2017 at 6:39 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Tue, 2017-08-29 at 17:43 -0300, Otavio Salvador wrote:
>> There is no COMPATIBLE_HOST in the recipe neither it makes sense for
>> this to be machine specific.
>>
>> Possibly, initramfs-framework's based modules may be machine specific
>> but if there is the case they can just RDEPENDS on
>> initramfs-framework-base and provide the specific module as another
>> recipe.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>> Changes in v4:
>> - Drop INHIBIT_DEFAULT_DEPS as allarch defines it
>>
>> Changes in v3:
>> - Add the new dependencies to the hash whitelist
>
> As I said before ("Re: [OE-core] [PATCH v6 1/1] initramfs-framework:
> module to support boot live image" from July 31st), I consider it a
> mistake that support for live boot with all its dependencies was added
> directly to initramfs-framework.bb.

I tend to agree that it should be split out and depends on base.

> I was in a hurry at the time and therefore didn't file a bug, but I can
> also do that.

Sure.

>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 38bec33197..04aa730160 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -50,8 +50,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>>    docbook-xsl-stylesheets->perl \
>>    ca-certificates->openssl \
>>    initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
>> -  initramfs-framework->systemd \
>> +  initramfs-framework->dosfstools \
>> +  initramfs-framework->e2fsprogs \
>>    initramfs-framework->eudev \
>> +  initramfs-framework->parted \
>> +  initramfs-framework->systemd \
>> +  initramfs-framework->util-linux \
>
> Let's not dig us deeper into this hole and instead split out the live
> boot module into its own, arch-specific recipe.
>
> Then initramfs-framework can become allarch without having to make
> layer.conf more complicated.

I think this can be in two steps. Splitting it out makes sense as it
avoids the build of useless packages if someone is not using the live
modules but it can be another patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


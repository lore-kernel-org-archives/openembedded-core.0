Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id A3E677E01B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 16:07:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j49so4607836otc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xq6WSORMXtkxtI7nQLJ1RWF7bxtA0JlZQI3KrripvWw=;
	b=Zotdkh7+eJWU0k2c7GTL7i9fNjPmtYFUgofn0bgE9194BJXkIasqcsdxbQKVNLZJUo
	OJiEsOWEYoNR1MONP2xZflsPLzAAdel3kGTvuOjLXYUkWRRER3Zepl9n5vs8dALanUUk
	drMulrdBn2Z2aa0YSl2LY0tXYqe+boHD8/rti1zjpwd4FUb0fH2MhgcF5Nqysm2Hg5qm
	Xwrg/L/QuM9XMbGxW2NIcJVqgT0SIx2MorYMtuTAQVeAh8DkXXlt5Db96U1zrw0upQty
	obLeFLyw/REPpJrKZa6wKgHjESTSZ/8fovJEeZaZbLVpmB0vLgKqzgk20xqu6/sOCxP8
	ElwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xq6WSORMXtkxtI7nQLJ1RWF7bxtA0JlZQI3KrripvWw=;
	b=iS0SwIJIXPHRw70CEc0q+/ObdewibmknL7QaNBGJXpRmYEn7e7jsdB6U1wdcWyqcSR
	uDsSNPE3elmg+kwvaIp9m9y0xn57IeuUPKf892G9hzBlbLP9sWcdFb4poETrm0koTm1z
	JBZnWLr4vkOoBWb4fmo5asotfbNlV06+wIMyxeWhnw3PkSvV7kLRtayX3QVv1Y5R62AO
	lJ377IhpL28huRiuKkBrkGyNNlwYG0s8pddvv0lYnY75e4XPBGJ1nXiujpopv0yHbXZG
	RYMVP/DX8rG0ELy4/9tpbnvhQCfKWvm+RtG/U5sY6hsCSPpgrvXL0J/dgURFimRkWN6u
	LTOA==
X-Gm-Message-State: APjAAAWuWvgK6U1XIjx83PVDVSINHXFXx2L/wZQywPXUs2CdrbKH7kLB
	ewhdF+Ej/2HvRVWeS31qTEwv06xJVw2U2Qq/eAs=
X-Google-Smtp-Source: APXvYqxE4436gyHn/L9AqK3TUwTW9UL29YAKdW2FHLAmOUQYVorueZMigXiI4KvlsScKFezPu7WLSANgivRmZvEoCvQ=
X-Received: by 2002:a9d:6c13:: with SMTP id f19mr17511093otq.96.1557763676717; 
	Mon, 13 May 2019 09:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
	<CAJTo0LZ=yDqyaZYv0PEOokt=6prPMa_gA=hnsYuNRA1oqw9TUQ@mail.gmail.com>
	<CAMKF1sorBuvDn0kmuPfn24t=vnM3QT_rT358REmcZkmZZS1T-A@mail.gmail.com>
In-Reply-To: <CAMKF1sorBuvDn0kmuPfn24t=vnM3QT_rT358REmcZkmZZS1T-A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2019 18:07:44 +0200
Message-ID: <CANNYZj8wfJ6wQYHSc1c71BU1DCS=ymz+Dbkz=+0sEsGmo-O3jQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 16:07:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that the 32 bit machine from meta-intel has actually been using
core2-32 tune for a while, so we are simply catching up here.

Alex

On Mon, 13 May 2019 at 18:02, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, May 13, 2019 at 9:00 AM Burton, Ross <ross.burton@intel.com> wrot=
e:
>>
>> On Mon, 13 May 2019 at 08:55, Khem Raj <raj.khem@gmail.com> wrote:
>> > While I like this change I also worry if we are leaving out any signif=
icant x86 implementation out there in embedded space x86-64 is relatively n=
ewer compared to 32 bit which was long stable
>>
>> core2duo isn't exactly a modern chipset though, first released in
>> 2006.  Does anyone *know* of any significant 32-bit x86 deployments
>> which are using significantly older hardware?
>
>
> If intel bsp folks are okay with this then let=E2=80=99s go for it
>>
>>
>> Ross


Return-Path: <matt@madison.systems>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 073F17317E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 13:31:07 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id u9so25324330lbp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 05:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=I8wT+4SGr09MBMSNTy8Uj9nqvVD0JixZS7eVdhD5Ao0=;
	b=opMMHTZXvyagMPEz1JLErXLQ2wGzdRq4r6lGYiy5FLGseTe0zW4+HXFe9Y7QWJqXk9
	kjfbvDyyHbV5VGU8n+0V+7gySRi+LBZAvVOGMRCfpRT5PSAO0hlykZQnZ+4EI94cECiG
	Cvap4BLG7FRR13yh7eq/fdf06+ZOkp8mVgDf8S8S6l52BRSfQlMP1QVdrpppQrzQSGnA
	L3LZ+BblTMhYEIiRl7tW5ok6R+pEp07+OeHQIzIHqo6i/Wvy1DpBZmYtrlz9gsyv63ep
	k/HHBkL1D7PRwbGcmr8cliNFJOn6WFZguW/UIBXc48y/lmspo4mhod3BhQx304SmpuWJ
	Q+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=I8wT+4SGr09MBMSNTy8Uj9nqvVD0JixZS7eVdhD5Ao0=;
	b=hOEgR3JSRPJDMqPOdIyVLpykWove2+xnR2Gs6QRRRwYPP8x2YXfkuzZVQqwqfwqfyx
	d1eH4zDbJCCANRX+uCT/y+hxAF0dHs53MyD2jLs4oMJ3GOopr/yWdgaaTUq+JMR2AsyB
	NxCTlWG2uvaEO4jNzil++HLDLnDP2tsW1edZkj+7hmsvipRYxNFGGKMD3ApSfRWpcDha
	IkcHXGqNXMtijzc1iRMdtgz/0u0P3Kot+Z7K0itBcm7UOlRnOVV77uXE2RgDe6QnE1oJ
	qxKqG8XoWImGwkrAJLwVNKcPkJRENq34qfSA+N26NML/lxpKdyyCVodNMWFGsawdkFkC
	F3cA==
X-Gm-Message-State: ALoCoQmc60Gginu+J0LB1qZgUJ28nhENwr0H2y42+i7Ds7fj/v/oWqFDhQ4W07WowBtreGYM3j5V0mqlwQIK3VpL9+avtTfCrA==
MIME-Version: 1.0
X-Received: by 10.112.184.45 with SMTP id er13mr18203559lbc.133.1450272667664; 
	Wed, 16 Dec 2015 05:31:07 -0800 (PST)
Received: by 10.25.145.200 with HTTP; Wed, 16 Dec 2015 05:31:07 -0800 (PST)
In-Reply-To: <567092CA.2040600@linux.intel.com>
References: <1449422732-12975-1-git-send-email-matt@madison.systems>
	<56704DFF.9070804@linux.intel.com>
	<CAGgRHJqibg_vCYzFp_nQktE4kEcMYe1SMWrz=UH0Up0Q2vuXmg@mail.gmail.com>
	<567092CA.2040600@linux.intel.com>
Date: Wed, 16 Dec 2015 05:31:07 -0800
Message-ID: <CAGgRHJptKNTkhDi5s9F1S821PG5apBDtW4mG7anGqA84m5d7kw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Debian multilib packaging fixes
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
X-List-Received-Date: Wed, 16 Dec 2015 13:31:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 2:23 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Hi Matt,
>
> Trying to build core-image-sato with qemux86-64 and multilib enabled an
> errors appear (see attached log), next the config.

OK, yep, I can reproduce this.  I'll investigate further.

Thanks,
-Matt


>
> MACHINE ??=3D "qemux86-64"
>
> IMAGE_INSTALL_append =3D " lib32-connman"
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> PACKAGE_CLASSES ?=3D "package_deb"
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks package-management"
>
> Kind regards,
>         alimon
>
>
> On 12/15/2015 01:28 PM, Matt Madison wrote:
>> On Tue, Dec 15, 2015 at 9:29 AM, An=C3=ADbal Lim=C3=B3n
>> <anibal.limon@linux.intel.com> wrote:
>>> Hi Matt,
>>>
>>> I'm starting to look at your patches, in what arches/combinations you
>>> test the patches?
>>
>> I've been working on a BSP layer for the jetson-tx1, which is
>> aarch64/armv7a-hf, so that's what I've been testing with.  The BSP
>> defs are in https://github.com/madisongh/meta-tegra.
>>
>> Thanks,
>> -Matt
>>
>>
>>>
>>> Kind regards,
>>>         alimon
>>>
>>>
>>> On 12/06/2015 11:25 AM, Matt Madison wrote:
>>>> I ran into sevearl issues while trying to build an ARM multilib rootfs
>>>> using Debian packaging.  After several go-rounds, it looked like the
>>>> cleanest solution was to tweak how DPKG_ARCH gets constructed and
>>>> to have the DpkgPM class in oe/package_manager.py use that variable
>>>> to locate multilib variants (similar to RpmPM).  I also took the
>>>> liberty of expanding the Debian architecture mappings so the names
>>>> align better with what's documented on the Debian wiki, for those
>>>> cases where a direct mapping is possible.
>>>>
>>>> Matt Madison (2):
>>>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>>>     function
>>>>   package_manager.py: fixes for multilib deb packaging builds
>>>>
>>>>  meta/classes/cross-canadian.bbclass |  2 +-
>>>>  meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++---=
-------
>>>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>>>  3 files changed, 37 insertions(+), 17 deletions(-)
>>>>


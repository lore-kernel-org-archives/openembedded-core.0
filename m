Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA8460123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 08:23:15 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x190so21832703vka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=+6qh+l5McEybhbx9bw09Q/Gd2L5vaL5yfa6kdueLneE=;
	b=dqrvsNDGuecV4/zi6N1gmAJuTeYjEbdHuCwx6TXkOm96r4Me3ybJVMr27v/z0T4p0P
	SDmrLajJ/MvfALtPiBf//FlvexXEibIxWiY4Kg0YSHGXCPzkgiKkVLoEan5Z8taWF8MT
	OuctrSUxoR45No7OErYr4ZyyoPpYwNznlStfdUUAREmqPJyLryuLlpwo5g2jwb3lZnb7
	Tm947ijbkIXpkumKKA/Cwai6TaRiq1RVWvtWyj3JL0Z5XbCMSiKWnt9q453IhsFN9Dbi
	lyHtvyn8EM42zJZnCV06BNTAHWAeVMttASG8gCO8hRvaV2DuPWrfXCCFxeuFg/bdnoP8
	g2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=+6qh+l5McEybhbx9bw09Q/Gd2L5vaL5yfa6kdueLneE=;
	b=BuHInSZIlaR7Iv0lwa4YYdelcUxq+mhoDn3cB7IH+3OMrpTFmClgh3NJLuywPJCj/o
	e3YecM51oUp65ooiJp9YUXmaUok42mG+GEbNmmEZPO6Lxk6iNwnyyVUI+Ek2eItIsi4U
	byFC1ZbJu7UtbTAKOrVg9vOG+ZWCsT31UMOWVewARDoiBhuijBHZY7UbjuCOix9oKH2i
	W1x7QvPTPzQdBxRLS92z1Iahxlos+nsIUw2ya14kRaXAXZMVXBVwZ1JYfj3a13aVP92Q
	PcycwSCfD9z5y3je39Mlarfz/OpO4bH43ma/3ZSuQcGSUbgfJOz9r2u79ASEPiSAYE+u
	ujBQ==
X-Gm-Message-State: AOPr4FUDy1QaeLHLvI/fe5FBjhdeS1D2CWMDkqqGbhL9gCLdPBvBH42GEoYn9qQ7gAP8CJ6K1CFU10aSxSvq5A==
MIME-Version: 1.0
X-Received: by 10.159.53.67 with SMTP id o61mr2092442uao.83.1460967796636;
	Mon, 18 Apr 2016 01:23:16 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Mon, 18 Apr 2016 01:23:16 -0700 (PDT)
In-Reply-To: <571496CC.8010607@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
Date: Mon, 18 Apr 2016 10:23:16 +0200
Message-ID: <CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 08:23:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 10:11 AM, Hongxu Jia <hongxu.jia@windriver.com> wro=
te:
> On 04/18/2016 04:09 PM, Andreas M=C3=BCller wrote:
>>>
>>> >
>>
>> Has anybody tried remote debugging with this patch applied? For me the
>> source files are no more found and I think this patch looks
>> suspicious...
>
>
> What's your build steps?
>
Don't understand your question I guess. I build by bitbake <image> with

INHIBIT_SYSROOT_STRIP =3D "1"

and set sysroot to build sysroot - see [1].

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-March/11=
8635.html

Andreas


Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1311A7707F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 11:27:08 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 38so297104084iol.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SYRuLnbMZVlap6YZvKU4sxYEl4Eg8NTqYRX+NKvPegA=;
	b=CzQUGD9r5MuSUMQNam+8TGBV5FMjGHxuSL6RMB6SMJwiGX3+IMPQwVCouVOgram8sX
	FtnNZi20aNZSPLhMA6P1NmxjFPVjf3XbMbZ5/GZkriO0lbjSqtptAdkni3u6B5/T3ksF
	MZW9PcHSsSvBDCA1ELkW3jM/Vs5WGd/B/E6NCANy93l3j2oabYhik7wOqJkgdwHRF3jI
	XIMIbTZWVBXP51TKUEIzW/Q+/b9jOwsAZLYAcK4rq4musiILaG/D5po9xFefIBxg4pnL
	i5F7dtGUtHsEBx4EDFDql/q7pwpLtFTbHeW2nhWwZYhPr/mw84cgDZaSeleZw/c0H0ca
	V1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SYRuLnbMZVlap6YZvKU4sxYEl4Eg8NTqYRX+NKvPegA=;
	b=ShKaeRiodampKb/B4YJh7Q+KOSCORBXnrtPrmpYTRtpVeF+btRvq/l/KCiLRG9yyFr
	nszMx4Wdj8EsLR/EMVqYemriz1w6TgpjV095sAm2a7xyK/F1deCMQ+vJrmAJ+pO38eXS
	Q2wp4quPV+CZiuLHUlC4QUEaPb6USvf1aZbonMGO8CNjWOXMUYuWMItlsHYWuRW9Lfx9
	D3kgOQ/c912mUtdvlqMpF32ZGefHBADjw9L1LsEV5UmM5ysnibjDRkgSd3tFhwBrvuTF
	rkhr5BNB1KP7PSNq4X1RbL6GXPOn9DI9kVHi+WGiintNaoXyNmsYO/tI0ISJpcPP712o
	MMJQ==
X-Gm-Message-State: AEkoouuix7ewZaW2JlqwAdi5mmyzqzd3xQOGnxZD7WI6yHEBTpY/TIPS8c7PJB55IySPWtEjVdZlcNd9eiYMOD3l
X-Received: by 10.107.154.196 with SMTP id c187mr76133490ioe.99.1470396429338; 
	Fri, 05 Aug 2016 04:27:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 5 Aug 2016 04:26:48 -0700 (PDT)
In-Reply-To: <1470390033.4581.6.camel@andred.net>
References: <1470389692-9787-1-git-send-email-git@andred.net>
	<1470390033.4581.6.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 12:26:48 +0100
Message-ID: <CAJTo0LaQk2qcmHM8Bx7evw8WeyfUBSOqv=o46s7tkKKP0F_SCA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cml1.bbclass: explicitly set workdir
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
X-List-Received-Date: Fri, 05 Aug 2016 11:27:09 -0000
Content-Type: multipart/alternative; boundary=001a1140e81ed9afb50539515818

--001a1140e81ed9afb50539515818
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 August 2016 at 10:40, Andr=C3=A9 Draszik <git@andred.net> wrote:

> Sorry, please ignore this! Didn't realise it's fixed in oe-core just not =
in
> poky.git yet.
>

Merges happen to both at the same time generally, but you likely missed it
by hours.

Ross

--001a1140e81ed9afb50539515818
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 August 2016 at 10:40, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":sd" class=3D"a3s aXjCH=
 m1565a13c0e51fb45">Sorry, please ignore this! Didn&#39;t realise it&#39;s =
fixed in oe-core just not in<br>
poky.git yet.<br></div></blockquote><div><br></div><div>Merges happen to bo=
th at the same time generally, but you likely missed it by hours.</div><div=
><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a1140e81ed9afb50539515818--

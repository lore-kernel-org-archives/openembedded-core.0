Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A5ADB771CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 23:25:55 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 38so372314739iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WlHBe6I5HuYqpdvrfQuNKVseu742RFUC9M0+Fexq4ZE=;
	b=pQMD2qoQM+bW0/gs9qIEH8JTKlq/9hncQh0wJeYVUAPRMxm2IY3FQVtxySAM5u1LzY
	yUyiWzAxKGMOKHK7K6KpXL9ZaJvVs3v69z3SZfei0PFgETe4IHxgCTTBAlq/YzQ6GvME
	V7MXUBazjyNzLNxyEh+OSQexzHhz+USDwHaKN/9CcpSUeSqQ93abICmiIO7TFxCeZl3i
	N7h16C/ZU4wAldZNmKejRFTuiungQxK94JoRIOfT2Cq8plNnGJwLm701gouMAHj/kuIK
	7JhoTpXs8OgpKsGdMGEMBnCAySUgMyksiijMuExFIQ4fnYQLtEUGxO9EGeD/C1UOaV6J
	FVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WlHBe6I5HuYqpdvrfQuNKVseu742RFUC9M0+Fexq4ZE=;
	b=V0yleUj4QOZp1GcW3RKHSV1f34r4KfmXqsG5YgQNei44Cj8TKq1MJpHuuYb15iw239
	B9wyDsgMF4jvfHqpvmRSVMK+KXI6sMbhftyQMEkVbZJ0nrvWEez2nGCPy/2WFIa99JAj
	nyANmvcy6uMvJ81mwnqJ6jbE7M6YQyJI+T+7je/9Q+PlRPOhT3/TBBw2y4kyPxFGfliJ
	HjtfelPtaCP5I4/oBOFXJEgk6WKWMsVDKTkCT4qlr0hUHkPxsQxlVO//2c76YqtGSSGO
	2IdN6VBGrMcYjbhzJNeZnks0LiZrlE/wRUIbcaEkTTWk7R3C/ihEiV0AN08wuUTx1PFS
	WafA==
X-Gm-Message-State: AEkoouug/JxJHn9cHdQF8NUMm314h5EXlKdZr7YbMNTccErIg+QVlrTQpw86gjwyDPW10udLpfi1FJhIYye7d/pX
X-Received: by 10.107.135.142 with SMTP id r14mr106816196ioi.133.1470698755890;
	Mon, 08 Aug 2016 16:25:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 16:25:35 -0700 (PDT)
In-Reply-To: <20160808225101.32385-2-raj.khem@gmail.com>
References: <20160808225101.32385-1-raj.khem@gmail.com>
	<20160808225101.32385-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 00:25:35 +0100
Message-ID: <CAJTo0LYGGyd20Whnox1TCcrROVx24YybiGWkVaS+JX4U+hxiiQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libunwind: Do not use gold for linking
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
X-List-Received-Date: Mon, 08 Aug 2016 23:25:56 -0000
Content-Type: multipart/alternative; boundary=001a113eccbceab411053997bcfa

--001a113eccbceab411053997bcfa
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 23:51, Khem Raj <raj.khem@gmail.com> wrote:

> This effectively reverts the commit
> 3dd233ac0c80393824100c54bb525236f8290fd2
>
> gold now emits errors on copy relocs against
> protected symbols what ld.bfd did in past, however
> it seems its too conservative.
>
> This does not fix the case for folks who
> use gold as default linker, however it
> does make bintuls 2.27 work with default
> configuration of OE
>

Presumably this is blocked by the binutils upgrade and should be merged
with it and not beforehand?

Ross

--001a113eccbceab411053997bcfa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 23:51, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1bm" class=3D"a3s aXjCH =
m1566c5a9a87d5cea">This effectively reverts the commit<br>
3dd233ac0c80393824100c54bb5252<wbr>36f8290fd2<br>
<br>
gold now emits errors on copy relocs against<br>
protected symbols what ld.bfd did in past, however<br>
it seems its too conservative.<br>
<br>
This does not fix the case for folks who<br>
use gold as default linker, however it<br>
does make bintuls 2.27 work with default<br>
configuration of OE</div></blockquote></div><br>Presumably this is blocked =
by the binutils upgrade and should be merged with it and not beforehand?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a113eccbceab411053997bcfa--

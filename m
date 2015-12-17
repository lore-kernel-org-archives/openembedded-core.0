Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id B7CA26FF76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 13:23:57 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id q126so54534762iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 05:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=q+wRAurRppbdiC3ppfGHFve/JX8O5zxc2lzTuqw5W8Y=;
	b=EtGfbm/f0PKxhTHo0mt30L2X6NRzQ7/jN+N4yBdjua+hMyNFKz0ApOdT4YIdhL0MAc
	pI9ko3T+ppRf7h/lwsCQsNnk5cKrWv9r0DpHaZumMNG7IYMrZrqMKg+iMLtP0cFx8Anc
	MOKTIcmUhJm93UxYz/vfVmkFdmkZf6zu3IY6L279AcmdmoRjMJ/XIknAVCUeBqVqcsKA
	lHRlAsaAl1CdKt6Gyxqfx6JUxC5OSrvCQiNLJ9bAvOFV2lWNV6MwVG1Evfo1xl1SwxrM
	DuPJYRSmucO3XZ9EmuoveC8Li5dHwqvm4aM6bI16RZqmDwhWAUyXc4yQVGlVxUn31eaM
	GYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q+wRAurRppbdiC3ppfGHFve/JX8O5zxc2lzTuqw5W8Y=;
	b=QS2h9oXP9sEb3CsofSY+FkueCcZS/NYT9n6jQjfPJKhZT4SJh5E4NKfX098CW5+J+q
	tdF2Zw6q8/+FZzS31yOIzAvAWODEibC1Tq72p/ptH/2nQGdWE5+lrjxBGQOwLVAiSQm8
	RNbhCHCqd5nQAbbAp1/v9T4JwJFg/IlsXyG4TA6t6JLlRpNFxM0HPwP0XPG6hw3NP5rS
	Svaetivabahgak4FnZ+VGRtKvFjohP1JbTlnsP16TT2NYKOHLC02aDvxJVkOZBL175sy
	hpN7qtyRwetnX1cCVQLrCIVCY14s1XqeuUU7Mnsyt3Okj84cbwlY5IwTs+VaOH19dozM
	mHhQ==
X-Gm-Message-State: ALoCoQl6++JOC6OS0XL7/XV43vj+qru7mPk4v+Ay1pPydiwSFzeUQZeutQdNOYQHssYwT0J0CZenKSL1w+SQFP99a2hBTYRb9F9bi5wZyv8KMawczQhOr8s=
X-Received: by 10.107.164.161 with SMTP id d33mr4957452ioj.148.1450358638247; 
	Thu, 17 Dec 2015 05:23:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 05:23:38 -0800 (PST)
In-Reply-To: <5672B673.5030400@collabora.co.uk>
References: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
	<20151217122121.GB30559@linux.intel.com>
	<5672B673.5030400@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 13:23:38 +0000
Message-ID: <CAJTo0LZwhbeAixqxh8yK13XXUaZry6_U_oOnmzv5vE91vPdVHw@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Thu, 17 Dec 2015 13:24:00 -0000
Content-Type: multipart/alternative; boundary=001a1141c9766e2259052717ef02

--001a1141c9766e2259052717ef02
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 13:19, Joshua Lock <joshua.lock@collabora.co.uk>
wrote:

> I see meta/lib/oeqa/selftest/wic.py has a bunch of functions with
> @testcase decorators but I'm not familiar with how this should all fit
> together.
>

@testcase is just to map from test functions to testopia entries.  This
doesn't (yet) have a testopia entry, so you can leave it.

Apart from that it's standard Python unittest, so find a test that's
somewhat similar and copy it.

Ross

--001a1141c9766e2259052717ef02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 13:19, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"=
mailto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@collabora=
.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
1xw" class=3D"a3s" style=3D"overflow:hidden">I see meta/lib/oeqa/selftest/w=
ic.py has a bunch of functions with @testcase decorators but I&#39;m not fa=
miliar with how this should all fit together.<br></div></blockquote></div><=
br>@testcase is just to map from test functions to testopia entries.=C2=A0 =
This doesn&#39;t (yet) have a testopia entry, so you can leave it.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Apart from tha=
t it&#39;s standard Python unittest, so find a test that&#39;s somewhat sim=
ilar and copy it.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a1141c9766e2259052717ef02--

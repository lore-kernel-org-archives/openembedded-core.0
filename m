Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id EDC40774F1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:06:43 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id v76so22141752ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7RS/UrzHtU+q03Qs8+wmQ2eWGa+VCgoCfICx+8PHDCU=;
	b=DqkqMoWl3jaVyT8SuF18qsYpvyuctPdJAa9IjDktj9IcJFHjshEFH2UC68OUqN7HDb
	lqbF7+71QwHcg70KNQC8Iv3ZNzOQBpDUvjoT6C+7kdaC0CApeiQB7VhFfEufwVcRYKae
	mMCvHhxaTUVOAUGaZrthr3a2R9tPrlYXAbw+T1DkzaMpM/XHAwN1EL/Fb//hQ7k7JVyz
	QPlq+vMIU5xGw8U/e3yh45gG8M7lcuwrt+b/pdiXpEsINbjZo7ZLJ0R+hBueDXkuAzrX
	zMV9R28qusZM/BZGpdcfaiKBvyUu8AtiIO1HLUaOTIhq/mkBVuhl5jwvuhm1UsxctxpX
	Wqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7RS/UrzHtU+q03Qs8+wmQ2eWGa+VCgoCfICx+8PHDCU=;
	b=E6bY8dZjoEfbEqBtLQRd9R2k1XAH6l0ZBNINEwwIUaTedWF0uxl2XAfmCdRxMfI6Cf
	oRskaRNXF9Y1SoGihbZiX7eL5Abx/Q9WjHKEey3yQFKx5kCHxb9EaWLlJmZPo72fd5IX
	dlnenlrgYxe1a0exRpbSx0hVB7Jy6ADwm5zN88qUO8OC2D1D53V/tV6GNPFQRCBG3NC8
	bTy2qgJyFQcGrNS9iW4PSEdtPWGF90wHRN4wiKLwb0mOYdE5piKI0CLB7jcuqTtgV24P
	5xPqPW7jxndTcD1Vh6bwpkxv5TlqwZJeXEsBH6SRKttVDuu2ERCy/Y9IzITDRZbqZO3n
	juIw==
X-Gm-Message-State: AMke39l3wc5DAeaBq08UJxzcTRI/0xyKPZCwJyekVPBdn5vXLCoJdtd+Kuyeuq9TVlahvy0vJu0Vpt9yfGItaP9E
X-Received: by 10.237.33.69 with SMTP id 63mr7627853qtc.109.1488812804934;
	Mon, 06 Mar 2017 07:06:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 07:06:24 -0800 (PST)
In-Reply-To: <CAJTo0LZB4x2Eb8Wkxpe3ckJjZjA5AWs5vF4JRcqShD3FB-AgLQ@mail.gmail.com>
References: <20170203070635.30804-1-tanuk@iki.fi>
	<CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
	<1488036652.2631.4.camel@iki.fi>
	<CAJTo0LZB4x2Eb8Wkxpe3ckJjZjA5AWs5vF4JRcqShD3FB-AgLQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 15:06:24 +0000
Message-ID: <CAJTo0Lamb2XczYu-YHG=ddAaFhD=B-tBPCycwJk_1uoJ3++LnA@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Mon, 06 Mar 2017 15:06:45 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc8604f3b054a113e6c

--94eb2c0c7fc8604f3b054a113e6c
Content-Type: text/plain; charset=UTF-8

On 27 February 2017 at 11:40, Burton, Ross <ross.burton@intel.com> wrote:

> Typical. :/  Thanks for trying, I must have something locally that
> triggers it.
>

So I grabbed scanelf to look into this quickly:

scanelf: scanelf_file_textrels(): ELF pulseaudio has TEXTREL markings but
doesnt appear to have any real TEXTREL's !?

Sigh.  Tooling bug.

Ross

--94eb2c0c7fc8604f3b054a113e6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2017 at 11:40, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">Typical. :=
/ =C2=A0Thanks for trying, I must have something locally that triggers it.<=
/div></blockquote><div><br></div><div>So I grabbed scanelf to look into thi=
s quickly:</div><div><br></div><div>scanelf: scanelf_file_textrels(): ELF p=
ulseaudio has TEXTREL markings but doesnt appear to have any real TEXTREL&#=
39;s !?=C2=A0</div></div><br></div><div class=3D"gmail_extra">Sigh.=C2=A0 T=
ooling bug.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--94eb2c0c7fc8604f3b054a113e6c--

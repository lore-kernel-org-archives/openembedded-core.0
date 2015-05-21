Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id AF0B0609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 10:32:46 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so49877398qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 03:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qVUPspykZDDxcbDN5x4i+4/GoYKOJ+AXBtAzuexnGRU=;
	b=Vy3eLrcWJV68NCU7GtPFmodkS40aNMHx/KyjV2h8xwWiU3nMofAkZgc5x6Dxg0wJak
	HeuzOE6dm0X37Vwpl1WyxQ71pNymQxGOVaSiyEhNk7panxUV/r/baiJDdeWQ/sK49KCF
	9LbqiKBO83g5ISq62hH2A2TVhxULZ1dmQW/I2/BN4njWG5/nFDwtMoMg0D/Ikguy76Sv
	1ec8ZD/7FWqU2LcDKaeeKcCupAmCF5DsW5GAIQ0xrfVWeXdljsU5PuR2Y01cCse4g1A8
	uMHfzCeZ4t7ZVUSNnRPdvxGDtFZXqIt6OzcTy7m6Eu/bNvvi3X2z8ITKJEwiLOdx1qi5
	ieOA==
X-Gm-Message-State: ALoCoQnkvHdz3k0A+KHLeYJLKL7xAkpEouHSaGChloqNdJzMrdak5chmNNXb3iMepUZClCHQpOsx
X-Received: by 10.55.18.155 with SMTP id 27mr3273289qks.36.1432204367040; Thu,
	21 May 2015 03:32:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 21 May 2015 03:32:26 -0700 (PDT)
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B0120D4C1B2@COSNADEXC13.usr.ingenico.loc>
References: <1430813641-24223-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B0120D4B987@COSNADEXC13.usr.ingenico.loc>
	<CAJTo0LbG3evANWWUoR5kxU3JB=WJOPA8PW5sRhgMPTmuMw0KZg@mail.gmail.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B0120D4C1B2@COSNADEXC13.usr.ingenico.loc>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 May 2015 11:32:26 +0100
Message-ID: <CAJTo0LYqjGUif1071Uuy_c+Er0x=NOpk3jW-+_1ngNrbSKj8jg@mail.gmail.com>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zlib: minor symbolic link issue
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
X-List-Received-Date: Thu, 21 May 2015 10:32:47 -0000
Content-Type: multipart/alternative; boundary=001a114737968b26e205169510f8

--001a114737968b26e205169510f8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 May 2015 at 08:31, Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
wrote:

> I didn=E2=80=99t know such a function was existing. You can use it of cou=
rse, it=E2=80=99s
> much better.
>
> I found the (obscure) regexp in libcgroup recipe, it could be updated too=
.
>
>
>
> Is it worth it I send a v2 patch ?
>

I already sent it, but thanks for the offer!

Ross

--001a114737968b26e205169510f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 May 2015 at 08:31, Matthieu CRAPET <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Matthieu.CRAPET@ingenico.com" target=3D"_blank">Matthieu.CRAPET@ingen=
ico.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D=
"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">I didn=E2=80=99t know=
 such a function was existing. You can use it of course, it=E2=80=99s much =
better.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">I found th=
e (obscure) regexp in libcgroup recipe, it could be updated too.<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=
=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">Is it wort=
h it I send a v2 patch ?</span></p></blockquote></div><br>I already sent it=
, but thanks for the offer!</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a114737968b26e205169510f8--

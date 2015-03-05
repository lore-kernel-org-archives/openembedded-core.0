Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5756465C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 17:31:27 +0000 (UTC)
Received: by qgea108 with SMTP id a108so6369256qge.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 09:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZAz+N0RApqghxlzgEimPnmfcjzrHX4kAWHhSkN/lSPQ=;
	b=WoUIFACTAzG8NMsv9swFWOknjbTxMlIbdv4js2dipPrDE8hICLuv1Xhs16Ig/xK7H1
	p0bEP8N0UIhR8DyG0B8srQPAWsosJlwiDZlQwNvQzNeHL80czW062paWbbZuct11Yvkr
	kV4DMo1WgWdk8vsiMgvcy3MkwFICcf4/pu+iaqiSN3YhoJC0WEdA2v6sXaVZhWADQ1Qm
	hQKgkpqZ8pCXWxKC4pE7vHFYAuNb9ZTEXk67V4jHTCsHHma9xblz3qrBco2FQusPFji/
	HIkC3rwVqkCIRD9KKXS+ClfClsYGWAVWKXo7RnDfX0x6xFZa5EJ9MU9eiyWcHcwmnuRc
	22YA==
X-Gm-Message-State: ALoCoQk6uY4dOLRnWrCBlNcf7LddU1pFR/rl+MHc+t4p3CuaHrKUGBMWJiUu2vJAw5wwkTezWCpc
X-Received: by 10.229.28.9 with SMTP id k9mr4038464qcc.11.1425576688727; Thu,
	05 Mar 2015 09:31:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 5 Mar 2015 09:31:07 -0800 (PST)
In-Reply-To: <1425570333-17554-1-git-send-email-raj.khem@gmail.com>
References: <1425570333-17554-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Mar 2015 17:31:07 +0000
Message-ID: <CAJTo0LacwjVi-_BYKCwPDVUF15YiK=+3v1B2eRRFVMGVYDHieg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Thu, 05 Mar 2015 17:31:29 -0000
Content-Type: multipart/alternative; boundary=001a1133ba9a21cbd005108df06b

--001a1133ba9a21cbd005108df06b
Content-Type: text/plain; charset=UTF-8

On 5 March 2015 at 15:45, Khem Raj <raj.khem@gmail.com> wrote:

> Sometimes we need to override the gdb from third party
> tool SDKs, this helps out, moreover it also makes it consistent
> with in OE-Core too to have multiple versions of gdb if we ever
> needed to
>

We're feature frozen now so the upgrade isn't going in - if you can change
this so it's against master then this can be merged now and the upgrade
later.

Ross

--001a1133ba9a21cbd005108df06b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 March 2015 at 15:45, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":1sl" class=3D"a3s" style=
=3D"overflow:hidden">Sometimes we need to override the gdb from third party=
<br>
tool SDKs, this helps out, moreover it also makes it consistent<br>
with in OE-Core too to have multiple versions of gdb if we ever<br>
needed to</div></blockquote></div><br>We&#39;re feature frozen now so the u=
pgrade isn&#39;t going in - if you can change this so it&#39;s against mast=
er then this can be merged now and the upgrade later.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1133ba9a21cbd005108df06b--

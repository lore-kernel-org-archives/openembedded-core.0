Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 55F4D71A21
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 20:15:50 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c47so94719951qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 12:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UnvvaWx10ydOaikaoSqWDU8fLZKD0Uo+YC1ETUj7o8g=;
	b=EghAMwMbZkYUvThgubu4zu7fKvmaGEW0iyZ55ZPapJNen+cmAm/05qt9EY73UTu6Da
	mFspBgNoQMpa4kbpKsAgKnAc8mC0/3mpxfrasY9c/ocDx2bE+v8vET3K1WbOEmd0kCnQ
	lU4qS7SI9EhniXN5AuAzM+z7cc+IZ3/mWSzHSHTrAV0JPpElc2VmPY0fNpyMx+iNMXfi
	nlM4vSmq2O94OtLGi7PaAiEaDkGuuoRSSUxrL/HFusGf+A1lCCSR3JJitA7YElmK1FNT
	OpgkGtN8GUbQhGKbYrp8iB/NVX4EAaBArYn1eaZfcXlm7fyIigvWQiHb47UiZytCSfGN
	gPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UnvvaWx10ydOaikaoSqWDU8fLZKD0Uo+YC1ETUj7o8g=;
	b=Usf4DMShcRbYM6T3rLcR76y1dUP+fkgZtpPfWk70XjLaFiPj4SFi6C46dUTBgo1XnM
	mfsKet/SwpHfbLnwD0qD/o/qRkRlamcI+WrIZtE4PDkmOHlSVFLmKJ0AFoQvMlewQrpW
	9MgLAyM4GBR6tpJRM+ocaleWM88goiZ7migLNoy3erMHLTHb+1BkXdvixqVGpuQ76HDC
	KoKUh5qRHGxGxlhJ54wHx7hm69Dz04HI/Yd1GBNpt8nt8bEAIIVAiLxZNHiMHvIdnZM6
	kAz0/IGRV0BueAsh/b3XMfh/gpMJdKs6ZellN67am5TWBOtZjbs4S5qgSbO2kGINkcRO
	3GuA==
X-Gm-Message-State: ABUngvdA6ErfEQVr2ixjmJmNssk+tNJ3jIjg1s96MexraI38wmmiWSyX33ZmS8M2JtTdTBbpoJZd6bgJ4YlOHP1N
X-Received: by 10.200.53.69 with SMTP id z5mr8611065qtb.64.1478549752132; Mon,
	07 Nov 2016 12:15:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 12:15:31 -0800 (PST)
In-Reply-To: <20161107182006.4207-1-marex@denx.de>
References: <20161107182006.4207-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 20:15:31 +0000
Message-ID: <CAJTo0LYgvyAriBj2Wf839f6E6Vv04+MLh++gBOEdqSQS+zizwg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Mon, 07 Nov 2016 20:15:54 -0000
Content-Type: multipart/alternative; boundary=001a11405858c257b80540bbb0c3

--001a11405858c257b80540bbb0c3
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 18:20, Marek Vasut <marex@denx.de> wrote:

> +       # Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
> +       # generating it requires bin2header tool, which for target build
> +       # is built with target tools and thus cannot be executed on host.
> +       sed -i "s/CONFIG_CMD_LICENSE.*/# CONFIG_CMD_LICENSE is not set/"
> .config
>

Looking at the makefile this isn't the case - it's part of hostprogs so if
anyone of the host-built tools work, they all should.

Ross

--001a11405858c257b80540bbb0c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2016 at 18:20, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":2nj" class=3D"a3s aXjCH m1584=
00582b1a1c80">+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Disable CONFIG_CMD_LICENSE, lic=
ense.h is not used by tools and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# generating it requires bin2header tool, which=
 for target build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# is built with target tools and thus cannot be=
 executed on host.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s/CONFIG_CMD_LICENSE.*/# CONFIG_CM=
D_LICENSE is not set/&quot; .config</div></blockquote></div><br>Looking at =
the makefile this isn&#39;t the case - it&#39;s part of hostprogs so if any=
one of the host-built tools work, they all should.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11405858c257b80540bbb0c3--

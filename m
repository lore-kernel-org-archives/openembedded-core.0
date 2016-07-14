Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 36D3A731A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:56:29 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id f6so364882ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 11:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rR/vCaipUbehvzL/+PP/kIuUyDV7LzpCwwfguww2jM8=;
	b=wn7c6D6nPvRnZy5Ur4e4mT9i0E3hWkDJBBRaTRwuXNLAdhR+Z8wjM9Y/cZWVXgg+/3
	SlH2puc97vrSpmLvXJO1Xg/OGrvciUSTf9fDf3shXBg0atIjkTnL1SPuZaFbskDyHHFO
	NUf25YrzN8KLzbqelmDB2pbcSZ2lifeRZJr2zsEu83X3AfUSArtnHWOc7xrgdBqWVTma
	EWd1tPEXm5sg+7izwCmqvWz5szPv66rBardylTJWogQ1RbpfFCiQTViiqnksXR8pG2JQ
	OE8Ui+gI4UoxtqrVNqNJ0pEr9Ei2igbWHrdNnNirD1hPeklKYf8BhNV3HdJr8xM+CIpC
	UYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rR/vCaipUbehvzL/+PP/kIuUyDV7LzpCwwfguww2jM8=;
	b=fI5zz6wnE6HTY96/R5ent/js+/PioMTUgkgTCqk7KrgnmayMkPPfsgv82j2jnZfJoc
	ZDACw5+ycH0i1WoddnsFaldP4k7Xz5o5JfbLLWlxqBhL7d7EYoYJIjQ9YJ4F3qDojoK7
	4Xd9Hb8hoO6X/Mfm/DU8caGBL/iV+CXTWKEm3Ku4l0HAIsrONOKiW23+tiRepuzb/j3Z
	IuT0TPfVoPHpyen1PqJ52NpsDpw0QIp9a3Vx/Rnmt344RFaeVLAR+haAaByypd/PDW64
	H+JKXkUAUZSEMjbgiM2ejNOel/Yhl/9jmgilbWcxygcexvqlrbs3ArunVJIytWAFlbwk
	m2NQ==
X-Gm-Message-State: ALyK8tLYj14J0Q98iHIHSiXfMbHosHFbuG8T1VMN1Cs4hy867isEVxrJyHB4bm7SsfbWKcTgimE60FNnHnWxuFqH
X-Received: by 10.36.121.21 with SMTP id z21mr17410848itc.38.1468522590244;
	Thu, 14 Jul 2016 11:56:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 14 Jul 2016 11:56:10 -0700 (PDT)
In-Reply-To: <12a9fa85-952e-eeed-81ee-3bda503225ce@linux.intel.com>
References: <1468514381-6587-1-git-send-email-ross.burton@intel.com>
	<1468514381-6587-2-git-send-email-ross.burton@intel.com>
	<12a9fa85-952e-eeed-81ee-3bda503225ce@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jul 2016 19:56:10 +0100
Message-ID: <CAJTo0LYktuO2dC4WrDbXDpBu=rKsYnH0gOH9U83HHUijEEWkZg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] build: don't use $B as the default cwd for functions
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
X-List-Received-Date: Thu, 14 Jul 2016 18:56:31 -0000
Content-Type: multipart/alternative; boundary=001a114a95a0564b7b05379d0f3f

--001a114a95a0564b7b05379d0f3f
Content-Type: text/plain; charset=UTF-8

On 14 July 2016 at 19:52, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> this is a bitbake change so it was sent to the wrong list.
>

Yes it was, I was in a rush to send patches before dinner :)

Ross

--001a114a95a0564b7b05379d0f3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 July 2016 at 19:52, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div id=3D":14g" class=3D"a3s aXjCH m155eabeac07cffb4=
">this is a bitbake change so it was sent to the wrong list.<div class=3D"y=
j6qo ajU"><div id=3D":13m" class=3D"ajR" tabindex=3D"0"></div></div></div><=
/blockquote></div><br>Yes it was, I was in a rush to send patches before di=
nner :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a114a95a0564b7b05379d0f3f--

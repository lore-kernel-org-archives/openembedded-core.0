Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id BB2B660123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:16:32 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id c16so444487itc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jrAd0bhw2sApXGNAMDE6gQ4dmWkxQe/pmYuqye9x6oA=;
	b=TCF110vBq10AdoJguQSOsbW6TiDyfyd99tgufluGCl4qOJHEw+OV/UwqgBMAi7bdbD
	KLw8GLmunRHPSSIKGA2MJoyIVHwpAIZ09jmK0WH+xdeI5zIn/hZNzE8/yYZms/LPtMeT
	gfVISYvkTm6LcOHECOobLim4K+fHbpdwHIHfAyrC1YwwAHiFXvSi6W38bhE0MEJNZA7M
	SSh1mIvZybzuIw2HlOV/MDZbCUaZc0Pfm9p1eAyQ0z31uCRE/4nWdCXpm5BhWmEiNWoD
	lRGyyHLlPMigo6FDzuJcZYZY0BJfETBdEpdXC6hGQlFjxv6E4bULY63XoEQx6CCf8sfV
	WT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jrAd0bhw2sApXGNAMDE6gQ4dmWkxQe/pmYuqye9x6oA=;
	b=iko1q8909sfIuA4717IfEZQ3Nw5sUvyAX/Yf6ztoWvC9FTOuUYBGpaW9sGktDQwQ4F
	/sfZ9lUGcGPDXbQAw2WkK6CymjQmRbSb5LD3sz1QzfVDKz6l2W+iQIzfWj2JSOpf7SY/
	h4xIGW//nHrQdm3ZNMtxw78/dntqSE+wkTuzJAYtHexJFgSC9YKyHZLivVzWKbSmpsUZ
	OBlDGspPQksF9tU2EjKutU33Wm6s0VjEMcVw+v2lADdiEObKtwJcQzlaJpdeARgFin2X
	N68TAMRj4o3ICHhCBswFBrAOAc2ImrNUCT3CuDXD2SRtMYBRcngD4IThqjOSlAGaiX/P
	mVgA==
X-Gm-Message-State: AKwxytdDVyvYmK26jM96kN0nDODTj7YMQbLAJhnpnfbsnEm/vsMI7GXJ
	xKRY6koPSVW390A+UW8hmUvlZxeazu1a0fnCxRRtZA==
X-Google-Smtp-Source: AH8x226LFLWpeyknH+5zA0BSHJm8QaBN8JFzf9PnlDiEfW48F573cEfLrWR0LET3GFRdHOfRLtXeGCF9uiqt58uoeCA=
X-Received: by 10.36.228.197 with SMTP id o188mr15521462ith.85.1517418993854; 
	Wed, 31 Jan 2018 09:16:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 31 Jan 2018 09:16:13 -0800 (PST)
In-Reply-To: <CA+chaQcD1Xt04c4A=1J3eNS-vd_1Bw04A0aV=oQ211ONo1ZAuQ@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
	<CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
	<CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
	<1517418291.31752.85.camel@gmail.com>
	<CA+chaQcD1Xt04c4A=1J3eNS-vd_1Bw04A0aV=oQ211ONo1ZAuQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jan 2018 17:16:13 +0000
Message-ID: <CAJTo0LYe7qU66tBRbyDfWkg=PJm2aPXg5fhCVP5rp2PwbyFnfw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Wed, 31 Jan 2018 17:16:32 -0000
Content-Type: multipart/alternative; boundary="94eb2c1253d01ac0fa056415a4dc"

--94eb2c1253d01ac0fa056415a4dc
Content-Type: text/plain; charset="UTF-8"

On 31 January 2018 at 17:07, Martin Jansa <martin.jansa@gmail.com> wrote:

> What about the recipes which don't have ${S}/waf at all (and might inherit
> waf from possibly wrong reasons), like all those waf-samba recipes
> mentioned before?
>

If a recipe inherits waf but doesn't use waf I'm absolutely fine with it
erroring out.  Its always bothered me that autotools.bbclass doesn't object
if configure can't be found.

Ross

--94eb2c1253d01ac0fa056415a4dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 January 2018 at 17:07, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">What abou=
t the recipes which don&#39;t have ${S}/waf at all (and might inherit waf f=
rom possibly wrong reasons), like all those waf-samba recipes mentioned bef=
ore?</div></blockquote><div><br></div><div>If a recipe inherits waf but doe=
sn&#39;t use waf I&#39;m absolutely fine with it erroring out.=C2=A0 Its al=
ways bothered me that autotools.bbclass doesn&#39;t object if configure can=
&#39;t be found.</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c1253d01ac0fa056415a4dc--

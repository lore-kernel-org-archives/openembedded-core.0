Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id C1A5871DEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:06:29 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c13so31782295qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1nc/gD1tT0yKBH7E1plAlmrZJPpQKc7vtxYrGc7WiDY=;
	b=Ph41jFMcqCqOMhnNR5tXDLNyu6c0H6P7RBkzFEvxnj8Q8bpE9Hm1P+hB80zAfjPrGV
	4NnPBahKSv/8oaBZrw6D8zys8q6WB4qcS++4jLAei4jo/2PXXSHRKJ2hJSrwEtGDBrPL
	KlM5KiMrlDmstTcCCegPuWHcTFpgUyNuch0WZpJRT4imZg3k0L+8VvcZgAMbbxba16R6
	MPhnqdSwDRHxnPX1ay1mms7tMaBzx3kojiHo5ao5NyFPufRPJeCq0bRkKS1U3rieXldX
	nq1v8ynoMcsYzuaRSmq8Z2GLorqDiYVY2JnJSWHoUbApSskasDnnh9Upf3xwpsYHNvol
	PP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1nc/gD1tT0yKBH7E1plAlmrZJPpQKc7vtxYrGc7WiDY=;
	b=MrLyIs6FH2Nj0nA9QPH/cB6p4AHycP2+D0pkAx28DHmsJzEjoshrjOuXKdFmJpXVWX
	tfHS/AFCKObJPQ5z3yrRuWpQvdTsT2dbhqwasDsiAB7a5a3N+cCz9VM4wach5xqMSeif
	4GmfY77iQ7FMGPDYE0Hm0l/UlkRiHUa8rdRncdpi/cJ1gn+UZE8MxW+c+fGjJlajowK6
	D9IK/LkkRrpqUcm8oK4VP/zgP9dJFTRjZarasbGe21OyXo19a1h7OHDBqxyH4KXkOV+t
	YFGN7MHknyVAiI1YcUa1AY3skvUsxx6OrymfyIxv5JDq7ciR3/rxCeHqMd/d6ixFahet
	XTow==
X-Gm-Message-State: AODbwcBXo/U6ac3D1dhvQXEdR5lKSNxTnMlE3ie0e2WjGBfQJ1uwTEgf
	2X/UsyRH0g0l+zqU67qGwVA7siXBtBkmfAw=
X-Received: by 10.200.46.217 with SMTP id i25mr5048398qta.188.1494853590375;
	Mon, 15 May 2017 06:06:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Mon, 15 May 2017 06:06:09 -0700 (PDT)
In-Reply-To: <1494851042.1179.246.camel@intel.com>
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
	<237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
	<1494851042.1179.246.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 May 2017 14:06:09 +0100
Message-ID: <CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] manpages.bbclass: avoid QA warning when "manpages" feature not supported
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
X-List-Received-Date: Mon, 15 May 2017 13:06:30 -0000
Content-Type: multipart/alternative; boundary="001a1146b1283ef968054f8fb940"

--001a1146b1283ef968054f8fb940
Content-Type: text/plain; charset="UTF-8"

Hi Jose,

On 15 May 2017 at 13:24, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Patchwork-Status: Rejected
>

The patch in patchworks hasn't been updated (
https://patchwork.openembedded.org/series/6723/), I thought patchworks was
listening for these commands now?

Ross

--001a1146b1283ef968054f8fb940
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Jose,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 15 May 2017 at 13:24, Patrick O=
hly <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick.ohly@intel.com" target=
=3D"_blank">patrick.ohly@intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex=
"><div id=3D"gmail-:2eu" class=3D"gmail-a3s gmail-aXjCH gmail-m15c0c1154d4f=
b966">Patchwork-Status: Rejected<br></div></blockquote><div><br></div><div>=
The patch in patchworks hasn&#39;t been updated (<a href=3D"https://patchwo=
rk.openembedded.org/series/6723/">https://patchwork.openembedded.org/series=
/6723/</a>), I thought patchworks was listening for these commands now?</di=
v><div><br></div><div>Ross=C2=A0</div></div><br><br></div></div>

--001a1146b1283ef968054f8fb940--

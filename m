Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
	[209.85.221.175])
	by mail.openembedded.org (Postfix) with ESMTP id 338C27EE24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 11:34:57 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id f68so16570983vkf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xC4LTmUEJLV+qTVChtv9l+GQg6UfHdCwNkx6wVSxMm8=;
	b=cMrh0gIEFT7DO3ail08K9y1NhjEcquxDC05dZElaM4IC67aaDoMcBPrRcZwg/60aqC
	HRIcFOuX36Ro+CxV24YejFTSLpXQx4FYySBio8Xx5kK5pRh8XgrsQ3EmGVoxzyS8SAzK
	g8ErmerFmah+gG/oLVIUU48JrSsqBMwa41R+G9az7SfU7bb/fv4n9sMY+ggBhXPBWJ3o
	5aZPjKbprFUztDIDEODPNzHBFRa7+1JL3/e+JQFd/k4Y3EyXDIuzs/TT4IICgYhwY9BC
	0Z48JOsB4m/cf0PLFxW7YrxHia150F8n6SUtp9l7Sgz05Ezh5UuBCFS2eDhKiQ3VETLD
	XVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xC4LTmUEJLV+qTVChtv9l+GQg6UfHdCwNkx6wVSxMm8=;
	b=a9ZR3w3WJrWID8IPYNWA5JaIeKRrZ4eVGt02rhl2ecD2qa18TIrNUKMRyFpS6f1PZZ
	xOQnJo6fN8rJEOSXPuKgxQ73GywJtSitJFAzi6C0EF8kQft6pyws6bT+V9ItM/68/eMA
	IuqQxgaAuFAazDN2vTX16pAmwSDUA2RJ6ep22LUY5f5C29ry94sq4KADWdPagzzcKZqs
	14jctAGFCqhFMIpLL9iREV6/V0PTDGf8e9HDRfLs0alGZucPK5sTfV1ER8Wnpw09oFf6
	emmro/T1cIw76HlnUltvDGt/pJalCcEylFyCcMGZGpR/oBuDfDSYYgt0OnfbbF19QyfW
	811Q==
X-Gm-Message-State: APjAAAVrloCDqCPKTbTHG+/EIHwhTORW3+qaVfhT4tBPJ3pF3XSozIdd
	+lDlH1hhSnJ+tA8w1JBdorSaYA74IGSuhdMRNuA=
X-Google-Smtp-Source: APXvYqxzqlhEVzTvxdeHeYCPO3HIxBVXFVvJUCVk8p9A8LDwSSFDsgGn10LkVqol6X4+1AJqP2HDYdfefx5OGK5+7Io=
X-Received: by 2002:a1f:91d2:: with SMTP id t201mr2941218vkd.81.1565004898062; 
	Mon, 05 Aug 2019 04:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190731174820.16459-1-raj.khem@gmail.com>
In-Reply-To: <20190731174820.16459-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Aug 2019 13:34:47 +0200
Message-ID: <CANNYZj8jXXn4-kjumdBu-jeJmZec_X3sfjO=Z+YjY=wZocrdhQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libedit: Move from meta-oe
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
X-List-Received-Date: Mon, 05 Aug 2019 11:34:57 -0000
Content-Type: multipart/alternative; boundary="000000000000055690058f5d1961"

--000000000000055690058f5d1961
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jul 2019 at 19:48, Khem Raj <raj.khem@gmail.com> wrote:

> +UPSTREAM_CHECK_REGEX = "libedit-(?P<pver>\d+(\.\d+)+)\.tar.gz"
>

The recipe in meta-oe did not have this line. Where did you take it from
and how did you test it? It is incorrect as it does not match anything with
a dash (-) in it.
Simply dropping the line makes the version check work again.

Alex

--000000000000055690058f5d1961
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 31 Jul 2019 at 19:48, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">+UPSTREAM_CHECK_REGEX =3D &quot;libedit-(?P&lt;pver&gt;\d+(\.\d+=
)+)\.tar.gz&quot;<br></blockquote><div><br></div><div>The recipe in meta-oe=
 did not have this line. Where did you take it from and how did you test it=
? It is incorrect as it does not match anything with a dash (-) in it.</div=
><div>Simply dropping the line makes the version check work again.<br></div=
><div><br></div><div>Alex<br></div></div></div>

--000000000000055690058f5d1961--

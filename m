Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8957470030
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 19:04:15 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c198so4916054ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QjhVayhHkDXHuX89zJeoRhG2kFnEZmSEmyr9Orw1IRo=;
	b=k9PVQMs8kXeaiWCSvr+q3Aeyhtgk3ZrpTTA79fJkyfGDGsI7DRAPJppG9dfc2Gp2zf
	l9j0hPOoe42yRzrbCvg9mMe6YQKW2PlRp/EtkX+WOmPM4lDNvigGH2x7GUCrAz/vfsVz
	M6BK/2mHe3WB6UnB4hl/90m5aSuYUJII5fmy0oljpQjmGdIuVZ3VXCKr4XxGCEZpDPmr
	+WaPk0qTlFN2SvyfKJ5f8XXnmrByE32ssPDw6FHTEHuuGOepQrzphSCW+IeWe9aH86M/
	zs2bP6BLfod4th+P6YvHNyk4UBf/1Q1qiaqGpmlk7n/2xKB93W51jUsNqkcRYstMw4t+
	Ez4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QjhVayhHkDXHuX89zJeoRhG2kFnEZmSEmyr9Orw1IRo=;
	b=HMggyjI5eQic1jaOj12wOzWqJ9rzMoGYf71S2Q1ynvmfutePTx8wBSafki1DM9n3Cb
	Vtz1Mc82yWSyGCrPSEXhmPmJ+ZV/gBR3kxHfxROxssTXHW9S9ur6SeTwn6ah6vG3hBW7
	e8BlrLIFULv4nPmrjbVp8JAzclVyKTXHhRz1LNNF8pj2dnSn57H3U8T7io3yt/U+Uv32
	I5A9lw2e2mKqiBdBK/LW+XmUoglfisKBrAL/NYyy4TFvBuJUHELaR2o3zUKMOcm4vxt6
	gq9K04Xo/13NDUFUSvhqD07Vp83OntWMRum5xMBbB5rNm7CW3t3KZCOQiaZPseazKkO8
	NrKA==
X-Gm-Message-State: AE9vXwMoZsyk16cdfUyJCwlZk4jJfnUtRJ6xPvxfYQ8CWkUskd15J+J2BPKoOGTsktg8XDWemezE8+zGGtG8z3w3
X-Received: by 10.157.9.183 with SMTP id q52mr1318029otd.87.1473361456352;
	Thu, 08 Sep 2016 12:04:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 8 Sep 2016 12:03:56 -0700 (PDT)
In-Reply-To: <1473355762.20226.242.camel@linuxfoundation.org>
References: <1473353924-21627-1-git-send-email-ross.burton@intel.com>
	<1473353924-21627-2-git-send-email-ross.burton@intel.com>
	<1473355762.20226.242.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Sep 2016 20:03:56 +0100
Message-ID: <CAJTo0LY2QiBgS_APZU7ht3fzCbkUcuKbPo1=tHwWVzYNJsshdw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] rpm: remove redundant removals
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
X-List-Received-Date: Thu, 08 Sep 2016 19:04:16 -0000
Content-Type: multipart/alternative; boundary=001a113dc2c03b6178053c03b2e2

--001a113dc2c03b6178053c03b2e2
Content-Type: text/plain; charset=UTF-8

On 8 September 2016 at 18:29, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Why are these redundant? Need a touch more info.
>

Erm, I appear to have sent the patch from my WIP branch instead of the one
with the longer commit message.  V2 incoming if I can find it.

Ross

--001a113dc2c03b6178053c03b2e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2016 at 18:29, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":6p4" class=3D"a3s aXjCH m1570ad95b41da7f9">Why are these =
redundant? Need a touch more info.<br></div></blockquote></div><br>Erm, I a=
ppear to have sent the patch from my WIP branch instead of the one with the=
 longer commit message.=C2=A0 V2 incoming if I can find it.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113dc2c03b6178053c03b2e2--

Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF81E7EC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 20:27:15 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id v18so40692uad.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 13:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+ctDDZ/LRaRghJY2E45tKG65YruqaBslykYOpXuoJww=;
	b=rNntUguEmVLhA5+IeRGFEus0CqzPbLe0Mwpm0Kreb6ZCvVnct5Z1npjadQGajwca5j
	+Q2IJyTdtbch45LwDC4h6GMksjfuYYeHWeSusHx7TiOLOz7qXRg/a6KN/w8lua5Gh3Hx
	jcNDz1SDADlv1jURJcH1ccRtOfI3b2Xqaqx1poXVplNyBVP/hU0PX4YEMSUb3l+EueGB
	DvWxEQyl9JaiLEB5kGJp9XE2ReejEiOuoToXhDqLhrDIThDNsev55BuCW8w8bmXuvNhd
	y0qr2p8Awd35Fqg7P9WDlir3anmDe+yhTD03bKc46lB1mWQX2xCWynYwpo8f1dzxARsk
	BqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+ctDDZ/LRaRghJY2E45tKG65YruqaBslykYOpXuoJww=;
	b=ZeXh1Skqo50zf2UXuFEF+DM4VH4kEINSvIhhknNJwwcwzVCbzkv8lbOUj4PMLImIkj
	hUWgT1j6jDUq5bbcnLgU10WVc2Soln+uf3PAET7FrnQy4mREKYS5cJ5geEpXPFohqYp5
	T4P9KOOFrW3GohsniUnrHb4BOKdB4aeXJTFep1GliWDWV3QZZKBU0yactJCoqEw9+oyN
	d/35Hx/7CY826OcjEn4qrKvPofMiCKfNlUXPaW7xA8Kh06VvGGZkD+J3jTgME3U84vBM
	HVN/P4lCeIh+IkKWsRLkHbRfdq17YiKbAhT+zcvty43CQA+7SyBalA3mYmNA0xhyCZUR
	7r0A==
X-Gm-Message-State: APjAAAXzRe+zhX5z8rnHFEJMudRA0K+sr9paPhkZH9Zc1ZuTTYMVx46b
	wAazWLTu35MTITxIFs/lROtPGXVwIPuAUqGEppw=
X-Google-Smtp-Source: APXvYqyjee0Z6M38Ba8FSjA1eOH3Yhq/MvtcFNbP1vj+c7vEHBxmW7wHJGUGSRj44t5+Epxr1V30zaAWPjRutXftB3Y=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr1295036uak.71.1565814436696;
	Wed, 14 Aug 2019 13:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
	<123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
In-Reply-To: <123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 22:27:05 +0200
Message-ID: <CANNYZj_XzB3g55qEe4hYGGCBwPPkg9kwydWQ0jGwRbi8UkJNGw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 20:27:16 -0000
Content-Type: multipart/alternative; boundary="0000000000004894d20590199505"

--0000000000004894d20590199505
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2019 at 14:55, <richard.purdie@linuxfoundation.org> wrote:

> You followed up mentioning this wasn't with master-next. I think there
> is a patch in -next which will help with the empty task spin so both
> together might get us back to more normal numbers.
>

As all of these patches are now in master, I re-ran the test with that
(209f89ab8ed51ac2867ca8f749336af1ee24ab25), but without including the
spinning task part, pressing ctrl-c just as it starts. The outcome is
9m42s, compared to 2m9s for the baseline
(6c7c0cefd34067311144a1d4c01986fe0a4aef26).
So the worst is fixed, but the slowdown is still noticeable.

Alex

--0000000000004894d20590199505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 14 Aug 2019 at 14:55, &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">You followed up menti=
oning this wasn&#39;t with master-next. I think there<br>
is a patch in -next which will help with the empty task spin so both<br>
together might get us back to more normal numbers.<br>
</blockquote><div><br></div><div>As all of these patches are now in master,=
 I re-ran the test with that (209f89ab8ed51ac2867ca8f749336af1ee24ab25), bu=
t without including the spinning task part, pressing ctrl-c just as it star=
ts. The outcome is 9m42s, compared to 2m9s for the baseline (<span class=3D=
"gmail-im">6c7c0cefd34067311144a1d4c01986fe0a4aef26). So the worst is fixed=
, but the slowdown is still noticeable.<br></span></div><div></div><div><br=
></div><div>Alex<br> </div></div></div>

--0000000000004894d20590199505--

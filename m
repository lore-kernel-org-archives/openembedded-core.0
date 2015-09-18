Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2B473243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 20:23:37 +0000 (UTC)
Received: by qgx61 with SMTP id 61so48262701qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Rwj6+QMEeiLsckFhQS1JQZkLIGApdYWZ4jpeFDRciqo=;
	b=esDayRW5g5zABG+PHbWvt9Ds4TXPFv/6bJpkYTImbABz9fZDxDvdIQd7uHQJ4+98KB
	BKFTbCcsVirPuyCeLFwHkdfW4S6Y0WpExtebhs5LJZ5Pdb4vduoZjYB4n/ne2V0SwQ0t
	yC/XmU3NKVW9G1FPDizgMv5a6KEldLIWdk+XULIwuCkSexEpIYdoKBDaq3h/GNH1kWJ9
	iYK/fDEwSoHuNXcvn1FloG5iEOB62qzakAMSeWD1GcbCiNyF0c7DERKs+OiHzyGJB23L
	eKeOt1jyzAUQZH6znH7pS0QbFqyAfTbrK9PwSkJeFJz4DT9TzmSixmLoUskj/jsL6Eyn
	+thw==
X-Gm-Message-State: ALoCoQn8v3kHUHBb7BInLc8pQLKqfRT947eHaBtqxBSvExKLyD8iHHagaQAFHBtVkAnME8bZR0P0
X-Received: by 10.140.32.119 with SMTP id g110mr8670766qgg.15.1442607817403;
	Fri, 18 Sep 2015 13:23:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 18 Sep 2015 13:23:17 -0700 (PDT)
In-Reply-To: <55F945B5.9060007@windriver.com>
References: <cover.1442370259.git.liezhi.yang@windriver.com>
	<90e4a1064ea7dfa9be458d306bba765136b50306.1442370259.git.liezhi.yang@windriver.com>
	<CAHiDW_Gij3wQ0daYSBetKgBmz-E=DncKUvtP_WJ+O_g-T4vn_w@mail.gmail.com>
	<55F945B5.9060007@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Sep 2015 21:23:17 +0100
Message-ID: <CAJTo0LYZ+mcOxm0Tu3E7-sqG08pmtzpkqr3+-r6vESkqOx4S8A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gtk+/cairo: enable x11 or directfb
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
X-List-Received-Date: Fri, 18 Sep 2015 20:23:39 -0000
Content-Type: multipart/alternative; boundary=001a1139bc1881c76005200b4e39

--001a1139bc1881c76005200b4e39
Content-Type: text/plain; charset=UTF-8

On 16 September 2015 at 11:34, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Make the world build OK when possible, for example, when no x11 in
> DISTRO_FEATURE.
>

But now you're just explicitly ignoring the directfb DISTRO_FEATURE.  Maybe
if you want to do a world build without X11 enabled the you should add
directfb to DISTRO_FEATURES?

Ross

--001a1139bc1881c76005200b4e39
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 September 2015 at 11:34, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4jw=
" class=3D"a3s" style=3D"overflow:hidden">Make the world build OK when poss=
ible, for example, when no x11 in<br>
DISTRO_FEATURE.<span class=3D""><br></span></div></blockquote></div><br>But=
 now you&#39;re just explicitly ignoring the directfb DISTRO_FEATURE.=C2=A0=
 Maybe if you want to do a world build without X11 enabled the you should a=
dd directfb to DISTRO_FEATURES?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a1139bc1881c76005200b4e39--

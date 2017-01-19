Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id AF96D71C7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 18:16:37 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id w75so43425862ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 10:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2yVGYoJsdwytM7JW0SRmRe3SL2Q/6h1GZZ3Y7RVqH5c=;
	b=ZgJbeLQg014VJbUbaayw5P1qjBZDQCM2l9DlaW084cjF20RV25ioDVkhDKXYvV0DtG
	phn9qiHkqxBEv4b4nOoi7sDXn1Yr9WgklOo4akWQHR9CLXCNTNC0M3huo+FxVUaBMuNx
	2wzsMnAaj+SAAL40J34iV/vNCIMkCJGV9npF/FERA9zQyOIal/Z6vp/zRFgb3rW3gpJs
	XrdKfpFxnUA7iUad3tpa6zGcK2/hLA6OS6fRUbI6FrefANmlJxv+y1ulsv/jniOJ7Fw1
	fnbDrxDUNlMvLRwVw8rh033ZY3y6rkjHeuYBl0FzVWWhptvI0+IjOBTx/niwYt9yNNiX
	Nq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2yVGYoJsdwytM7JW0SRmRe3SL2Q/6h1GZZ3Y7RVqH5c=;
	b=pVAJBmrUB7hv3uXBdkkFy97NCgPT34m5SI8QhOwxsNJFtS9OSYENP8EoRltXailwPg
	DoGpaulozh/kDK6aPsU79HBVlayBEy90R1cubij/JhEkjI2VtvitiE64bA2ul000NLI4
	8udUyLsHg8wHFBkiUDluq5jIzpe69o5pY7uIHqReYQwfa0ItcYKZRnp/NPwqOt8a885U
	01HDnR7g3pDjJZs5LMPTWsiXy9PD8lUtsuJkmU8L4x1Dy2PoXmZuQMEXNCpavOWbWnUw
	OZtv5p58RDSx/xaHnT10I7X6NqC0oR8EWPAPmDo5BHnaRFaPBAyWKjLCzg49zvx2l+/r
	QtZw==
X-Gm-Message-State: AIkVDXLGReTiwmhDy4p+IfIDFG/wON3kVi50s/AhYB8T8zeBjFxjqHLyeL59oDOcPey8NA6VG89tjw0g4TKXX30h
X-Received: by 10.55.16.11 with SMTP id a11mr9807182qkh.3.1484849797708; Thu,
	19 Jan 2017 10:16:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 10:16:17 -0800 (PST)
In-Reply-To: <20170119174540.GY15833@denix.org>
References: <20170119165803.22583-1-raltherr@google.com>
	<20170119173700.GX15833@denix.org>
	<CAJTo0LY8Nr_3qpqn6W6NKGcau80KP1JYGH0N60MS42t5eLPVZw@mail.gmail.com>
	<20170119174540.GY15833@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 18:16:17 +0000
Message-ID: <CAJTo0Lb2pZwrqY1UY5KuxyawmfCLbqFwa=dez-ROxSJUFx5kEA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: Let U-Boot select ramdisk load/entry address
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
X-List-Received-Date: Thu, 19 Jan 2017 18:16:38 -0000
Content-Type: multipart/alternative; boundary=001a11475cbcbcd01505467688ee

--001a11475cbcbcd01505467688ee
Content-Type: text/plain; charset=UTF-8

On 19 January 2017 at 17:45, Denys Dmytriyenko <denis@denix.org> wrote:

> Yeah, that one too, missed it... Been sitting there since October?
>

Nathan pinged earlier, it's in mut now and will be in master when RP has a
moment.  As you may have noticed, the recipe-specific-sysroots work is
keeping him busy :)

Ross

--001a11475cbcbcd01505467688ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2017 at 17:45, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":ys" class=3D"a3s aX=
jCH m159b7d5c9c3a1d39">Yeah, that one too, missed it... Been sitting there =
since October?<div class=3D"yj6qo ajU"><div id=3D":14x" class=3D"ajR" tabin=
dex=3D"0"></div></div></div></blockquote></div><br>Nathan pinged earlier, i=
t&#39;s in mut now and will be in master when RP has a moment.=C2=A0 As you=
 may have noticed, the recipe-specific-sysroots work is keeping him busy :)=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11475cbcbcd01505467688ee--

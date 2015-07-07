Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0282A73779
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 20:30:51 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so148765832qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 13:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZqXN1Xgu9w/Cu4VjE9GAk19/y3Szeu7OpFFxzYQJJAU=;
	b=cr+Bfbg1nf0Y9/Kdq+u3syPKWAmqVuTKcGKZEAOyMPjrNlKCm0MKzh10ILrlAqnOlY
	79sLPf0h1Cp1KFDZF/QcNKaPUm6e40AgtJqzTXvwUyEfya4oTw3w/qFGl906fT2rTXaR
	gfizbyTlkS8eU/slDfjQMwzgVi5imkboFx+iD9SZa9dd3a6Laie3DArnB8APFisxEkLn
	DHLWbCLn54gtWkBZAUI4/c5mChmiErAh6h666JuBOi7bQNqAtB1a16/gu2DABdOPYSU7
	ob9+F0kuBVXbikviRJ2vo6ddPTT0mcSMY/18EsWUKA8YYO15DC4178nC5WPlBoJCTB51
	7iKQ==
X-Gm-Message-State: ALoCoQnWPQf1HKdAalgRoek/Y/Zh8vayRb5xNsoHqdbpB2s7pWDUkxCRgbTB1o3DK40yoOUE0TeW
X-Received: by 10.55.15.129 with SMTP id 1mr9949679qkp.29.1436301051703; Tue,
	07 Jul 2015 13:30:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 7 Jul 2015 13:30:32 -0700 (PDT)
In-Reply-To: <559C320F.4020707@gmail.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com> <20150707053411.GA17548@ad.chargestorm.se>
	<CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
	<559C320F.4020707@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Jul 2015 21:30:32 +0100
Message-ID: <CAJTo0LYLzjMAWYJQH3g0sGzZgdPtPXjthJCAgVuh=ux1mgm5Kw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 07 Jul 2015 20:30:54 -0000
Content-Type: multipart/alternative; boundary=001a1146f100fa49e8051a4ee5f0

--001a1146f100fa49e8051a4ee5f0
Content-Type: text/plain; charset=UTF-8

On 7 July 2015 at 21:09, akuster808 <akuster808@gmail.com> wrote:

> which recipe? 2.7.1 / 3.1 or both?
>
> - armin
> ( sucks at this licensing stuff)
>
>>
So: 2.7.1 is "LGPL" (v2).

3.1.1 is GPLv2+ or LGPLv3+.

An "interesting" choice to say the least. Because the v2 bit is not L, I'm
wondering if we will need to keep both versions.  But a 3.1.1 recipe with
GPLv2+ *or* LGPLv3+ would be a good start.

Ross

--001a1146f100fa49e8051a4ee5f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 7 July 2015 at 21:09, akuste=
r808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=
=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":2og" class=3D"a3s" sty=
le=3D"overflow:hidden">which recipe? 2.7.1 / 3.1 or both?<br>
<br>
- armin<br>
( sucks at this licensing stuff)<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"></blockquote></div></blockquote></div><br>So=
: 2.7.1 is &quot;LGPL&quot; (v2).</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">3.1.1 is GPLv2+ or LGPLv3+.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">An &quot;interesting&quot=
; choice to say the least. Because the v2 bit is not L, I&#39;m wondering i=
f we will need to keep both versions.=C2=A0 But a 3.1.1 recipe with GPLv2+ =
*or* LGPLv3+ would be a good start.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a1146f100fa49e8051a4ee5f0--

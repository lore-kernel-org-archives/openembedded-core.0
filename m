Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id DFB6A62135
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 22:16:48 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d62so10910416iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 15:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6gaZdXCgpgZSQNsKmz084wUL18a31wxuDdg7TgGIp5Q=;
	b=O5ASXFyzVlNtYUP8zVXFBvjFXgBj8IAl9wq7B85VMar2dhKW5/N3QzeoLU9YEdDrO4
	ih4hPU1BprFn5dCczDFVZERfsNxXfEq8+T/CMwMR+k7ebChsZvQ8ArfrajeXpZii/ZTV
	Y4Ys1YtlIPUPG/L21RnS7uS4Mu0DdcLXsAIaFezFx3+Xww2oBCe7iJA0DyS4pv2M9J51
	4lAcntXOctYR+d6qNDVurYP9nA5TR3VAQBaEMxpStZcN8MsBQ6VpFCTcs77JgU4/OA8r
	tuI0JdaO1ZsopoYMThCNT6dHLmBoE3vy0fTBWISOUFOLx2xwd+OGO9jQBt6ID29HfL3i
	X+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6gaZdXCgpgZSQNsKmz084wUL18a31wxuDdg7TgGIp5Q=;
	b=lmqmtqofcS71CdTk/UrEE1Kl8iEeH5RUFGn2uiHn8oa2rdExgh3aFyCRGpui99Af1J
	bI+51ux3YRvpFuedbxdPTXgBSw/t6gdSzgV1P7x1oQhmMdhLYjsRCy8jLWDN79KDk9xS
	UiYgj/nkPF+DoK02aQo7Yx6QQM1JSia0HQnFZ4KW6/Kggb4aqg1zMnt9JpC3KV5y6bwn
	Ip8QFw/5HhpaaBxC1eXf31qzkHICQkFCBI8wz3/vl+x8Qa9Nw88oO+cbhbcGcNnWzN8U
	3TNrkyGt39FdTWxyPB6ERjoW3ybf9Q/AKhBStVlO41TyoOfOtGUFmx+1PENT+GWplrXJ
	2k7g==
X-Gm-Message-State: AOPr4FWUIoWPClubYL7IjVS6ofYnHx55y5iVUpfZ+9N59NdzL7NVDXNbaYsuIkE3c77tHrtkkC+QMqOimFZkVQ==
X-Received: by 10.107.147.7 with SMTP id v7mr20047627iod.3.1462486609141; Thu,
	05 May 2016 15:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Thu, 5 May 2016 15:16:29 -0700 (PDT)
In-Reply-To: <CAMKF1srtLpbqyE00f6RJ3irfS2n-zz-GjQ=saPFKOMoy5-OYZQ@mail.gmail.com>
References: <cover.1462476586.git.chris_larson@mentor.com>
	<e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
	<289ee855c6244dfd7a5b1e0f2a4a27ad236ac60c.1462476586.git.chris_larson@mentor.com>
	<CAMKF1srtLpbqyE00f6RJ3irfS2n-zz-GjQ=saPFKOMoy5-OYZQ@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 5 May 2016 15:16:29 -0700
Message-ID: <CABcZAN=TRx6VQZ_5eEB=Z6q1cKBOOkcSk7mTmwyBpMv+QRGSCw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH 2/3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Thu, 05 May 2016 22:16:49 -0000
Content-Type: multipart/alternative; boundary=94eb2c055f68d3a7eb05321fb250

--94eb2c055f68d3a7eb05321fb250
Content-Type: text/plain; charset=UTF-8

On Thu, May 5, 2016 at 2:54 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 5, 2016 at 12:30 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We weren't consistent in the HOST_ (aka BUILD_) and non-HOST_ flags, so
> we
> > were using BUILD_CPPFLAGS to compile target stuff, for example. Sort
> that out,
> > and make sure we obey LDFLAGS.
> >
>
> may be you should fold it into cross_compile patch ?


Probably a good idea, since this builds on that. I'll send a v2, thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c055f68d3a7eb05321fb250
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 5, 2016 at 2:54 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, May 5,=
 2016 at 12:30 PM, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.c=
om">kergoth@gmail.com</a>&gt; wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We weren&#39;t consistent in the HOST_ (aka BUILD_) and non-HOST_ flag=
s, so we<br>
&gt; were using BUILD_CPPFLAGS to compile target stuff, for example. Sort t=
hat out,<br>
&gt; and make sure we obey LDFLAGS.<br>
&gt;<br>
<br>
</span>may be you should fold it into cross_compile patch ?</blockquote></d=
iv><br>Probably a good idea, since this builds on that. I&#39;ll send a v2,=
 thanks.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphi=
cs</div></div>
</div></div>

--94eb2c055f68d3a7eb05321fb250--

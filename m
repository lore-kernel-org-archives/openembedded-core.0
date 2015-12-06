Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1B2601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 17:47:19 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so115349639wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 09:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iKaifeiHo6PTZ+JI17iLVJtBORHT7ELrSQr7W4MGuyU=;
	b=0iM6rmmVgq/3caMw35bNvZ2PYvRKY0iKLTy1ra6ZI1dXKLB7WL3DDtYJ9P7tJMQKvT
	QXlBA8OQUD8GyDF/GveQLxSWJLQdRp1uhW0kl5ET1b6s37yyrnbiLDp2xSdRGpyRf+rA
	Ft1/+sP2Fy1LXNJslZO1s9uqBM0iAQLVI2+OHQDl+PalUSPqkMI1IiEPtncMCLwHVsC1
	JQYKFyMMulnpPi9jhLWO+Q1vdSEii/U67tJfPe1oi8bVjetBWsTnXjsoyRdVJFkz3udb
	fH1knhqcJLZ99QOHWiyNKxuFbLuG9Pzfz7/q+O0nu+Hj5YPSbvxPUciKNJuFWFCCqxSi
	ju1A==
MIME-Version: 1.0
X-Received: by 10.28.183.215 with SMTP id h206mr17764282wmf.0.1449424040418;
	Sun, 06 Dec 2015 09:47:20 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Sun, 6 Dec 2015 09:47:20 -0800 (PST)
In-Reply-To: <1449421751-12670-1-git-send-email-matt@madison.systems>
References: <1449421751-12670-1-git-send-email-matt@madison.systems>
Date: Sun, 6 Dec 2015 18:47:20 +0100
Message-ID: <CA+chaQeA0AFTk3eTEckJnsc1jp-RLx-9LRde0BkrPnJHRp+AtA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] ARMPKGSFX_FP ordering
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
X-List-Received-Date: Sun, 06 Dec 2015 17:47:21 -0000
Content-Type: multipart/alternative; boundary=001a1148d9e40eec5905263e5523

--001a1148d9e40eec5905263e5523
Content-Type: text/plain; charset=UTF-8

See:

http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112919.html

I think it fixes the same issue.

On Sun, Dec 6, 2015 at 6:09 PM, Matt Madison <matt@madison.systems> wrote:

> I was trying some multilib ARM builds and ran into an issue.  For
> armv7ahf-neon-vfpv4, PACKAGE_EXTRA_ARCHS is coded as
> "armv7ahf-vfp-neon-vfpv4",
> but the ARMPKGSFX_FPU suffix was getting constructed as "-vfp-vfpv4-neon",
> resulting
> in 32-bit packages not getting found due to the name mismatch.
>
> The following patch fixes this by changing ARMPKGSFX_FPU.  I'm not sure if
> it
> would be more correct to change the PACKAGE_EXTRA_ARCHS settings, but the
> 'neon-vfpv4' more closely aligns to the tune names, so I took this route.
>
> Matt Madison (1):
>   feature-arm-neon.inc, feature-arm-vfp.inc: fix vfpv4 suffix ordering
>
>  meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
>  meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1148d9e40eec5905263e5523
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See:<div><br></div><div><a href=3D"http://lists.openembedd=
ed.org/pipermail/openembedded-core/2015-November/112919.html">http://lists.=
openembedded.org/pipermail/openembedded-core/2015-November/112919.html</a><=
br></div><div><br></div><div>I think it fixes the same issue.</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Dec 6, 2015=
 at 6:09 PM, Matt Madison <span dir=3D"ltr">&lt;<a href=3D"mailto:matt@madi=
son.systems" target=3D"_blank">matt@madison.systems</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">I was trying some multilib ARM builds and =
ran into an issue.=C2=A0 For<br>
armv7ahf-neon-vfpv4, PACKAGE_EXTRA_ARCHS is coded as &quot;armv7ahf-vfp-neo=
n-vfpv4&quot;,<br>
but the ARMPKGSFX_FPU suffix was getting constructed as &quot;-vfp-vfpv4-ne=
on&quot;, resulting<br>
in 32-bit packages not getting found due to the name mismatch.<br>
<br>
The following patch fixes this by changing ARMPKGSFX_FPU.=C2=A0 I&#39;m not=
 sure if it<br>
would be more correct to change the PACKAGE_EXTRA_ARCHS settings, but the<b=
r>
&#39;neon-vfpv4&#39; more closely aligns to the tune names, so I took this =
route.<br>
<br>
Matt Madison (1):<br>
=C2=A0 feature-arm-neon.inc, feature-arm-vfp.inc: fix vfpv4 suffix ordering=
<br>
<br>
=C2=A0meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-<br>
=C2=A0meta/conf/machine/include/arm/feature-arm-vfp.inc=C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1148d9e40eec5905263e5523--

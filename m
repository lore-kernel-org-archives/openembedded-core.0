Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9F92C60589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 08:16:08 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id b62so9765243iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RsyUyCTZ8JhSIhmkF1z1OCYevCRFblQYvJChuPaBs9k=;
	b=Qc7mjC0OupD2U/HzDtVH8Wm+H0AJfcT20dpM93KztzQ45qBcRLGE9d65l2TtoKWG/I
	wysKjf2nmDfVqQaDocaPAZThmCtQ5jXX7VXE570g9f94xM79pQ61bgg/Ph9hEdb72ind
	qUiIDvoBpL8FCgRY72xA5p6xP3338PyzCVoMaEPht8zi4zdsjLCF3SQbQVRRMcw+zrFx
	1bCYm3Cx+NkR2LZ15kWolVBvGZPlQFenvANLZE50sJOGtPcxgpuGoy+dLwIk1ZLk+Yg5
	gyRNr3rO1AU3TMtF92K3u/1EeYkAGkghKRrhtFE70H1B/OgyI61FIf2RqG7mqq/+7+9O
	Yv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RsyUyCTZ8JhSIhmkF1z1OCYevCRFblQYvJChuPaBs9k=;
	b=PPYlF933o26LTZTfBeo/lc3RRxZYXqXHvRTmPJB8N2e2E3CltojPnbIY/5uRQfigg9
	KxsBO+ucroNXWxN6eZkE4/Gq1zE/0RgEI/BQhg2DnhMMkAzTkcJPBLDm1m2OGipm432R
	IORJwTxmiHZ6EU5iEW187EpXDwk32LRXdappC1wfoA1V2JuoASXizKDRp3xIT5Ch1X8R
	o2xQCKHJ4Js2d6O7G/dBAElbif1erZ/E1IjeQsq4xMoltSwn0oFgLTTSznf0HijKj2k0
	aj6U9v5Xa+dH5G7jnc4kwandMiXbIYoQ9ptoW69NGnLT1BLQJZykhhnSkynCl4+JaBdF
	tvpg==
X-Gm-Message-State: ALyK8tKU5D0n02k4JyHNP0E+n/ENy6RKGJ+X0EDaCo0lnmGml39a5h2sXG8zw6eWbj5ozbfV0v0RmNXmNBYgelTq
X-Received: by 10.107.154.210 with SMTP id c201mr1329434ioe.99.1468311368969; 
	Tue, 12 Jul 2016 01:16:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 12 Jul 2016 01:15:49 -0700 (PDT)
In-Reply-To: <5784A2D0.9030902@mlbassoc.com>
References: <5784A2D0.9030902@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jul 2016 09:15:49 +0100
Message-ID: <CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Future of GCC
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
X-List-Received-Date: Tue, 12 Jul 2016 08:16:11 -0000
Content-Type: multipart/alternative; boundary=001a1140fab6913b6005376be10e

--001a1140fab6913b6005376be10e
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 08:57, Gary Thomas <gary@mlbassoc.com> wrote:

> Now that GCC 4.x is gone, we're left with (currently) 5.4 & 6.1
> Is the intention to track these both for a while, or will 5.x
> also be gone once things are working with 6.x?
>
> ... just wondering where to spend my effort since I'll have to
> make my targets (some are very old) work with at least 5.x
>
> Any advice?  Thanks
>

Personally I was thinking that gcc 5.x and 6.x should stay in oe-core for
this cycle, and then drop 5.x after the release.  I'm not the toolchain
owner though so that's just an opinion.

In theory bringing back toolchains isn't rocket science - just copying the
4.x recipes from oe-core prior to their removal into a new layer and
setting GCCVERSION should work.

Ross

--001a1140fab6913b6005376be10e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 08:57, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1a4" class=3D"a3s aXjCH =
m155de24c88ee7ce1">Now that GCC 4.x is gone, we&#39;re left with (currently=
) 5.4 &amp; 6.1<br>
Is the intention to track these both for a while, or will 5.x<br>
also be gone once things are working with 6.x?<br>
<br>
... just wondering where to spend my effort since I&#39;ll have to<br>
make my targets (some are very old) work with at least 5.x<br>
<br>
Any advice?=C2=A0 Thanks</div></blockquote></div><br>Personally I was think=
ing that gcc 5.x and 6.x should stay in oe-core for this cycle, and then dr=
op 5.x after the release.=C2=A0 I&#39;m not the toolchain owner though so t=
hat&#39;s just an opinion.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">In theory bringing back toolchains isn&#39;t rocket sc=
ience - just copying the 4.x recipes from oe-core prior to their removal in=
to a new layer and setting GCCVERSION should work.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140fab6913b6005376be10e--

Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5179B60745
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:54:07 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id mw1so75140004igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xsl7MBC3Ek66ROwhlX/9dKHol6j1E8/vx4E7LKOLNak=;
	b=e+2Jsko4xk1uJd9d8EleWGtQ+kgFsdC/u5ChKMUPkmP7iN8w1R+AZuJy/amzRyCtFR
	FUAZPqpvLPVEtRCkWZCVqcnNa0GEWkC7F9vIIW1/I4Rm7+AP7SH7BeGVvi8UiDtl9P0W
	b4RP/fFpx/lz1+Gc6P5aQlSWECk184i0CO3vgLdATwtFNrrWpwX3cchLMweQQV3erxsP
	s56FSUomj9oztj+QprbRtmDSa/bRM/PFhlzJCCTJoaBGbRpzaBrSE1FcrEF1S9Nca56E
	epdnR/ByDPAA12JYk5XMkVNabHjBLWO5zsUBo25U6uxh8QRNtqR2C+J69BEc4hRUlVrf
	a75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xsl7MBC3Ek66ROwhlX/9dKHol6j1E8/vx4E7LKOLNak=;
	b=mDpNzMdnzXk5R/zCzpEjWODMI93pyhqYJ2TT801obTn2bN+pgeaN47tvGzqk1f/NTL
	SGs4hMsJq9h1CqC48h44Gi01HZkJcwJNqbbprep0B1RkDisBG8FQ9Jul0y4s0njjLDU6
	emGeCyVx5V4Ur0lZJ8Dg2tQOHzCLACRi+8PUaVveetnLDSKrTZ4fPnHBrDaeY3yIpHew
	rPluteQBvoEwmKI1GYa/wor4SsHa6abO/pVmBzZ520BUZUM2rw7eg8UVpo5eBycggnG/
	nB2YZZjjv5r6Aq36GfjSFrdwqnnJXgq4fQlmPSCkOvfLzaZZmdv7isLVQu5e6KO5fNPv
	FmZA==
X-Gm-Message-State: ALoCoQl4R6Zj4+9vGm7zimOl9CldFQvoSgj2oi34Hme4WB4WDaIEP+HZSq3eTPnsUZIeY9AaNdELoQylIlA0sBx1ufy+xk8XL8EVQ1a9tt5WuF+eSL0njRU=
X-Received: by 10.50.13.100 with SMTP id g4mr20563204igc.64.1452264848744;
	Fri, 08 Jan 2016 06:54:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 06:53:49 -0800 (PST)
In-Reply-To: <CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 14:53:49 +0000
Message-ID: <CAJTo0LZeEtWA9qNQjNvqDPyW8d6hUjziJr_VuQsdEn4Y5dGcvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 14:54:10 -0000
Content-Type: multipart/alternative; boundary=089e013c66146dfea30528d3c2c6

--089e013c66146dfea30528d3c2c6
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 14:00, Burton, Ross <ross.burton@intel.com> wrote:

> Hm, for some reason, this doesn't work for me.
>
> Lots and lots of "files installed but not packaged", all locales.  eg
> /usr/lib/locale/hu/LC_MESSAGES/glib20.mo in glib-2.0.
>

So under musl the translations are being installed to /usr/lib/locale,
whereas under glibc its /usr/share/locale. This is showing some problems in
bitbake.conf: that sets localedir to ${libdir}/locale but then sets
FILES_PN-locale to ${datadir}/locale.

Ross

--089e013c66146dfea30528d3c2c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 14:00, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">Hm, for some reason, this doesn&#39;t work for me.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Lots and lots of &quot;files=
 installed but not packaged&quot;, all locales. =C2=A0eg /usr/lib/locale/hu=
/LC_MESSAGES/glib20.mo in glib-2.0.</div><div class=3D"gmail_extra"></div><=
/blockquote></div><br></div><div class=3D"gmail_extra">So under musl the tr=
anslations are being installed to /usr/lib/locale, whereas under glibc its =
/usr/share/locale. This is showing some problems in bitbake.conf: that sets=
 localedir to ${libdir}/locale but then sets FILES_PN-locale to ${datadir}/=
locale.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--089e013c66146dfea30528d3c2c6--

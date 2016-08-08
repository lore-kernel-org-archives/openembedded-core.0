Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7AC731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 15:44:02 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 38so361324673iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ozp//gXYEUcW9mwjDV6Dn9U2ga0SrgQa8UoOn62RNJw=;
	b=iSTxLeJT+eTNZupHQ+vKlmoAqsodwmfLm2cHclAJCWt8aaVirXnMENdy7CCk7e+Zyg
	gCrVYJLkrGOl8ajawW8R+qzdrmt3ClU3tWaPQ54gIQMIE1mLpDU4O2q1HrdU1T1tyVZL
	xKfm4fh8r46rNJstS2WFB+hv+WVjompFSPQatrhohJB5YatTj/UGcFZidKSdZUrm91vK
	t8EohuWzXObDRv2VXfu8v1tVg189bUJXoIps++Gq16K/UG+3KHhOAPGFsf0PGeVeN776
	LQry5YfUQdEgn5irwsU8n4jBN+ogphqhvBTLSxH0zMqm9iSyKXlWzeKsH17kwWvcSAvI
	4DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ozp//gXYEUcW9mwjDV6Dn9U2ga0SrgQa8UoOn62RNJw=;
	b=R+kB0gAmWMQRRKM0mHqDkNjf4TccD2G0ozp8qYdbdDW87H4ZVVhX0KsVB3P6+55dAD
	TbpyXvPc2wB3uFQ9xFoMWg7TjSwzzu+RSwB93boGWA7x1VsSXnurvgm9iy+otwG65z32
	pFgX139ofoXK7CVraHRP+pichmUX6HOa0Ci1aRe8KyCv9gOGwUBd6ILTqnFpImPXiQmM
	5oFRBGXAXJFFMu2F/mM5sEXDTKlcoBbrpStj2+plXw/6moEXWtEgaN3BHZJPqBuJQGBn
	tZsAT3QFelfLBvuVPYob1Lj/7h7599M5ki6bKSDKQDp4n5Z0vZRF+HxPnHvOTSN+4p0Z
	Nt0g==
X-Gm-Message-State: AEkoouvI7P2qfE9D6ilYE/wrOCGqDSN06xE8WQzEIHxydJyUvf+mJeJ8Su6B/eZxYtCq6kEZBPaxcBpBLcHBxaWW
X-Received: by 10.107.138.212 with SMTP id c81mr91117998ioj.148.1470671042282; 
	Mon, 08 Aug 2016 08:44:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 08:43:41 -0700 (PDT)
In-Reply-To: <1470665264-16321-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1470665264-16321-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 16:43:41 +0100
Message-ID: <CAJTo0LaJPojCEnOpd-QxW6DX1n9a0EgQgxH1u3Ai3j5+zYeiYQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags.inc: enable PIE for a few recipes
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
X-List-Received-Date: Mon, 08 Aug 2016 15:44:04 -0000
Content-Type: multipart/alternative; boundary=001a113ed9320e99e20539914944

--001a113ed9320e99e20539914944
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 15:07, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> -# These 2 have text relco errors with the pie options enabled
> -SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
>

This is still true for pulseaudio in my builds.

Ross

--001a113ed9320e99e20539914944
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 15:07, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":1d2" class=3D"a3s aXjCH m1566a7e969ac8278">-# These 2 have =
text relco errors with the <span class=3D"il">pie</span> options enabled<br=
>
-SECURITY_CFLAGS_pn-ltp =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;<br>
-SECURITY_CFLAGS_pn-pulseaudio =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;</d=
iv></blockquote></div><br>This is still true for pulseaudio in my builds.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113ed9320e99e20539914944--

Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2D36FFFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:43:21 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id r187so55632073oih.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+D0Gc0NNwSFJhZWa4fLCIfU9URCh1bZaxOliDAAm5tE=;
	b=cH5DpuBmE4DmMTs0qxY+3K/p2qxDHBRzJNR886lZsMAt6a5fVOK0+wgC8QsmfFj9OF
	s2T4ERWNdUYd8ieDtfOWMqy/dtHoiVQRzDXwW+yrLCI6YwwMDXw44VRQUmJUPT/RXULb
	LGtwXWOLJhiJ6FBtUKj6oJvRAy7xr6Ziu5SorY8ZvnRfjOqR5R7cU6bd0enHOayB4XR4
	EWFDENqih+NC+xPKp84QvJXryKw3wLHFEi72H8RKW6k0DiPsMZLGl6dh2534tJxxaTi9
	1Xc7ydpSNnfG2zRC1O3ZJhQ7A3Mnawmdkc/On1uXU4yJntXggP/0PYv/TDzOwWksCSr7
	Waew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+D0Gc0NNwSFJhZWa4fLCIfU9URCh1bZaxOliDAAm5tE=;
	b=cztnwVlgyjmiEs2wvnk+G0bzDAuNInTsu2NyEaFwDvai2SZSR7Hq3INGPtDhpmyuTn
	51TUW5yGzR4FnvgSghou/jfEcbxp0mecUhaFj+MFLpdC5P94XV9oKTXWShiVOuM53woY
	RZa/L5Em5sH6zwO60e4pHm5XeL61SBmraoki5hfHIsgb4jlpNUB0tQRpOwqv8nQ5f7+/
	n/MlZ8g+tPgJLMKU8MRyuW3NkLAd21szv6LClBzHjlhyd36OViD1eBxgieqro3ef6Xk/
	cB7VF90pcLDDG8go2bgBDd6uHTGL+KYpm1AftM5sX97qmfsg8VKdGHfw7P7TRd/DKjcH
	yCBQ==
X-Gm-Message-State: AD7BkJKR4a9k1ZgxkUVyNEpa5Kkk6m39/W1pxKDb4k7KyIvbdvarwkBRj90Fg0nTDOt0fbbVkICDafInvAeKbv12
X-Received: by 10.202.88.130 with SMTP id m124mr3708199oib.52.1458816201925;
	Thu, 24 Mar 2016 03:43:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Thu, 24 Mar 2016 03:43:02 -0700 (PDT)
In-Reply-To: <56F3C42E.6060703@mlbassoc.com>
References: <56F3B739.3030108@mlbassoc.com>
	<CAJTo0LZWmp7iqE22miPiq2Sp+oNUYzGtU-YR=7ZGiA3QjDaRbg@mail.gmail.com>
	<56F3C11E.5000204@mlbassoc.com>
	<CAJTo0LaS8jvkQ-ANsmyeVGNDR8rbfsti-oEXuO2LN6gM+PUj3Q@mail.gmail.com>
	<56F3C42E.6060703@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Mar 2016 10:43:02 +0000
Message-ID: <CAJTo0La3429ZJ_FeFbE8emjC25LTuhhVToFdp134S6gxdh=KXQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Change in udev
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
X-List-Received-Date: Thu, 24 Mar 2016 10:43:21 -0000
Content-Type: multipart/alternative; boundary=001a113d5e3e824b09052ec91d66

--001a113d5e3e824b09052ec91d66
Content-Type: text/plain; charset=UTF-8

On 24 March 2016 at 10:40, Gary Thomas <gary@mlbassoc.com> wrote:

> So /etc/udev/hwdb.bin is somehow unpackaged (an orphan)?
>

Have a look at the recipe: it's a postinst from eudev-hwdb.  Possibly that
package should ship an empty file and we force it to re-generate in the
postinst so it's not orphaned.


> Also, how will I prevent eudev-hwdb from being sucked in if I
> only depend [RDEPENDS/RRECOMMENDS] on 'udev'?
>

eudev recommends eudev-hwdb, so BAD_RECOMMENDATIONS as usual.

Ross

--001a113d5e3e824b09052ec91d66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2016 at 10:40, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":gih" class=3D"a3s" styl=
e=3D"overflow:hidden">So /etc/udev/hwdb.bin is somehow unpackaged (an orpha=
n)?<br></div></blockquote><div><br></div><div>Have a look at the recipe: it=
&#39;s a postinst from eudev-hwdb.=C2=A0 Possibly that package should ship =
an empty file and we force it to re-generate in the postinst so it&#39;s no=
t orphaned.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":gih" class=3D"a3s" style=3D"overflow:hidden">
Also, how will I prevent eudev-hwdb from being sucked in if I<br>
only depend [RDEPENDS/RRECOMMENDS] on &#39;udev&#39;?</div></blockquote></d=
iv><br>eudev recommends eudev-hwdb, so BAD_RECOMMENDATIONS as usual.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113d5e3e824b09052ec91d66--

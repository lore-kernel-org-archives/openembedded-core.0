Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id E785177162
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 22:31:38 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id q188so157231465oia.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VG01OaCVxF0H6b00TsWA5vFTwboup8KdSc7hFLE6AdE=;
	b=vl7FxMjN22fMaYpizB9NuR/6QwiBTiUZretVvAylskidcMiHEyR6Mv5WDe0uiY8ngE
	NA5A9BQYuL7jic1+XTIEQhSwB3DXEGRoI4Z5Z1E03AZFOpQ2lv2Tajml7y2fAnDT2Bug
	5RsdehVlI/I+gzr9yu57FZ8B00HB/DT+6tPpSnZiQV+fdikkqEeURMQpkhuCeX4looLC
	yLN1vDnb6aroHzG85Nb8RF1qF76ExraOhHpm3e6aAKRe1th753fSPOasyge519ZJEF7Z
	20Pl+uoLY2lC3yPamjJlh3eJEpPneo3SDpdMC3eERaYLpbRy/xQoE4YSVh89dWEb8XA1
	Kw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VG01OaCVxF0H6b00TsWA5vFTwboup8KdSc7hFLE6AdE=;
	b=EtntpbLfewK40gDWBHaZLE2g07bBEH93XelSo269YmOgimJEtuNlSOVzLWxYHeuL9Y
	pkEjBaNpVoQJz3cQyUGd7kvZWDrdJD0eqUxzErXOvJlufDB1noXqRoFL6AzP1Gcfmm8M
	8STib/hV4y3CsJIceShpnG6ndlleIamwfixAOb9qcj3mkoMV4uUgLel2aZx32OjLD/PP
	q32vr9pAW7AbVr1oIJeyhefCdGIQNOum5enTzKO3yGw8CeU0SuLjUk8xIJXUlWP9Ks0m
	xhfNpGEAydTpTKl7neKC8e989bcgSsAqka6q8bwfKaY2zmn/E0d/fJrjOs1JsYvuPuwU
	o/6Q==
X-Gm-Message-State: AE9vXwMRZIBSyNRtBR7JBCuFebzL8i6knszv37roe6C3VPcIlN46CuFPETRQoYhhdHb28SGDdgEmBUk7x3itCUBq
X-Received: by 10.202.186.65 with SMTP id k62mr20783381oif.143.1473633098739; 
	Sun, 11 Sep 2016 15:31:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Sun, 11 Sep 2016 15:31:18 -0700 (PDT)
In-Reply-To: <20160911193712.GA6859@jama>
References: <20160907233743.18699.54755@opal.openembedded.org>
	<20160907233744.4852350198@opal.openembedded.org>
	<20160911193712.GA6859@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 11 Sep 2016 23:31:18 +0100
Message-ID: <CAJTo0Lap_gBdBjbTpoNs5rF038TcNEGs+QybDb=G1GMM3nH4Bg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/24: gnutls: update to 3.5.3
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
X-List-Received-Date: Sun, 11 Sep 2016 22:31:40 -0000
Content-Type: multipart/alternative; boundary=001a113cd856615296053c42f1d8

--001a113cd856615296053c42f1d8
Content-Type: text/plain; charset=UTF-8

On 11 September 2016 at 20:37, Martin Jansa <martin.jansa@gmail.com> wrote:

> ERROR: gnutls-3.5.3-r0 do_package_qa: QA Issue: ELF binary
> 'gnutls/3.5.3-r0/packages-split/gnutls/usr/lib/libgnutls.so.30.9.0' has
> relocations in .text [textrel]
>

None of my builds have done this, what machine/tunes/anything else relevant
is this on?

Ross

--001a113cd856615296053c42f1d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 September 2016 at 20:37, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fo" cl=
ass=3D"a3s aXjCH m1571ac1ddf3d0072">ERROR: gnutls-3.5.3-r0 do_package_qa: Q=
A Issue: ELF binary &#39;gnutls/3.5.3-r0/packages-<wbr>split/gnutls/usr/lib=
/<wbr>libgnutls.so.30.9.0&#39; has relocations in .text [textrel]<br></div>=
</blockquote></div><br>None of my builds have done this, what machine/tunes=
/anything else relevant is this on?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113cd856615296053c42f1d8--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 302CA7016E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 10:05:21 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id z187so1015131ioz.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d0jPjnnzJ0gxNkSxvXLTUr62R9HpfvTh99Zl8Pvwdz0=;
	b=THa3N20UaqLP1Uu8Hl/pjZ8fW537V5cp0OFzhn6uIwcDv+T4uBKOAF6M6J/ltqDn/u
	YpyFn/tiZF6rd4EipD2Z8+oTFPiRm2uP5M/uXUMaVmIFvx3g9jr8Wt1Uo2blxTaNiuvT
	xFuYuuwimkHwQ34+BJDC1MiZwKCYXLweIjSPDsOOetEFxMDUNqllLkTNI3QQ/IbCs+dx
	7qi97uenTuxFvPCKOZCO5weRfju5K9MEfR+5MEdXMyeJo0Ob5vEC0bRBeANQtdnT2mtR
	CZGfrLevYcx8ffHfXyahLsShzg6EbhXGBdMDTKmpxvOuhOBSD8EWXqZsrLO+uaTzQpyo
	G+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d0jPjnnzJ0gxNkSxvXLTUr62R9HpfvTh99Zl8Pvwdz0=;
	b=FL6Ax1W2mugu94qmNsZrXdzEEkHP5rN7g+JEDz2Fhds2kro0rEzJwAEXxlDo6JyJHG
	XpPyA76sU37/ZQitcOLt7Liljq6CMg93BLgZA8UTz0tsSRxYAAKbShVzKDnk4e+1mkJO
	VPjX5Qb7nJiHUMFsNTf1WnidIRrXX4dE8/BtNXEuUFdeUsbdjDRAB0Xh5Vhzsl/YkO7y
	MOc++QZxFAUmZjXfCXzloiAX8AKDWtCU8Y3Mxja4tfXImkLQYtHmR5PKxwLRKxPMbrwd
	9q2r0Fx1qt/Di/bR1JHkYMbn6FbcEvQRU372HsCHIC8TnYDh0S4vhFNJcUSNv9oqoxZ/
	DMvg==
X-Gm-Message-State: AMCzsaWS4kwKEWJfvJPxTowwPrZ2Hpbmzu+O8U/V3K2mS8TIp450WGVe
	ArF0HtRxAtvVeGy5i9u5KIL2tCWcxHQCawZH0chPtw==
X-Google-Smtp-Source: AOwi7QAeaOpdu1Xb2+BNaVZ303nZImjCnJP4T304a2hcdtmH3Mw5JLCR07gxH59CO1TSn5r88IivkuQPEoomfvnlIn4=
X-Received: by 10.107.133.92 with SMTP id h89mr10809550iod.208.1506679523274; 
	Fri, 29 Sep 2017 03:05:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 03:05:02 -0700 (PDT)
In-Reply-To: <20170929094702.5334-1-francescogiancane8@gmail.com>
References: <20170929094702.5334-1-francescogiancane8@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 11:05:02 +0100
Message-ID: <CAJTo0LZTrRnhgFRhK3=GxVfzrT5H7p-k=Untwq9T+KWTrpyMQA@mail.gmail.com>
To: Francesco Giancane <francescogiancane8@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] xorg-xserver: fix building of the package when different virtual/egl provider are selected
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
X-List-Received-Date: Fri, 29 Sep 2017 10:05:22 -0000
Content-Type: multipart/alternative; boundary="001a113ff7d0c6a16a055a5129df"

--001a113ff7d0c6a16a055a5129df
Content-Type: text/plain; charset="UTF-8"

On 29 September 2017 at 10:47, Francesco Giancane <
francescogiancane8@gmail.com> wrote:

> -PACKAGECONFIG[glamor] = "--enable-glamor,--disable-
> glamor,libepoxy,libegl"
> +PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy,egl"
>

userland is in the wrong here, not mesa or xorg.

The policy is that there are generalised names (libgles, libegl) and they
should either be used by BSPs directly, or RPROVIDED.  Mesa generates
libgles1-mesa libegl-mesa etc, and they RPROVIDE libegl libegl1.

Ross

--001a113ff7d0c6a16a055a5129df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 September 2017 at 10:47, Francesco Giancane <span di=
r=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com" target=3D"_bl=
ank">francescogiancane8@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gm=
ail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">-PACKA=
GECONFIG[glamor] =3D &quot;--enable-glamor,--disable-<wbr>glamor,libepoxy,l=
ibegl&quot;<br>
+PACKAGECONFIG[glamor] =3D &quot;--enable-glamor,--disable-<wbr>glamor,libe=
poxy,egl&quot;<br></blockquote><div><br></div><div>userland is in the wrong=
 here, not mesa or xorg.</div><div><br></div><div>The policy is that there =
are generalised names (libgles, libegl) and they should either be used by B=
SPs directly, or RPROVIDED.=C2=A0 Mesa generates libgles1-mesa libegl-mesa =
etc, and they RPROVIDE libegl libegl1.</div><div><br></div><div>Ross=C2=A0<=
/div></div></div></div>

--001a113ff7d0c6a16a055a5129df--

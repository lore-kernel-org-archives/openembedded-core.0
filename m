Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7296FFD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:59:04 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id g8so15043791igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z8Ly115ZbegNcEpg/5v9JUHKtusIr1TVopAONtmv2zQ=;
	b=S1lFj6WwsYWH1OC6VsHXrVSRnYjUwcWOWT2CE0jQbIlW7sn+d1f+Pak1CAQfgPU4U4
	6VLlff+/0MfHNP3lewmDA/W4aHXY9oLi+kz2Baf/59ZqHN+VL0eCvLxCZyROUEMS4aJO
	1f9QBTyCmPBXNPIKebaI/dO6s+yBYOVs4ZrzPtBXhIN1nNCaiA8ZQgNQ3RJ5RZOYSyQq
	qap2DDprZGR2vftfKD4GrTQ4WZhEV3Nif7v+u2GwAxFw6u3Eba6pflrNrxAxBpBXFpjN
	a6MQi4r8zq47o/Unh0tWNFiHgR8QnDh4kCDU4UTbI4woYNc40OJAsi7kzpJw92ShsxgF
	apZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z8Ly115ZbegNcEpg/5v9JUHKtusIr1TVopAONtmv2zQ=;
	b=LOYU/dmqsryJQQ86wavnIqYBTsLxqren+QkVpyECInzr2X/5ZSNovXvHjbO2MsEvVe
	Y/4Ob/esuDx1YtzZahhR3uQ77FbHahtvn+KZ58Fli1qnDtt1hdxn1Njj6eTCpByLA+vE
	V4xr0b8SubCZQIpsRTbS0IRZ7wPnrMsnyK17xXjWtMyK3ZXmxxe6pMFjEb5rCH03ENh7
	vUIKasmWpRlsfrDcxM7c+5CUQLAYPfMfoWOA7cHUXNCa7Kl2DjdCLiWsNGU6B/aI6hJo
	Osp+j8w9qKTVGN5I/3A0JGsCtE+NRaF8IDkGG8X7UmWIzEKHOlOZI9ruC8qTdsxXedU0
	xCSQ==
X-Gm-Message-State: AOPr4FW6VoaOvptJYiGVdaudibvai666EpQhcjQZN4sDzNnc0ErGshaGct7k0+9ycz3/73TvqMSYyRuiO/ns1eas
X-Received: by 10.50.67.113 with SMTP id m17mr4206033igt.52.1461329945127;
	Fri, 22 Apr 2016 05:59:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Fri, 22 Apr 2016 05:58:45 -0700 (PDT)
In-Reply-To: <1461328888-5911-1-git-send-email-Sujith_Haridasan@mentor.com>
References: <1461328888-5911-1-git-send-email-Sujith_Haridasan@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Apr 2016 13:58:45 +0100
Message-ID: <CAJTo0LaA_rkiUrAvGxiadD3OuKzozCyjEJpMSXD6qcG_3R6vPA@mail.gmail.com>
To: Sujith Haridasan <sujith.h@gmail.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: package debug files properly and move -g removal to staging
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
X-List-Received-Date: Fri, 22 Apr 2016 12:59:06 -0000
Content-Type: multipart/alternative; boundary=047d7bd753ea479b6d0531126452

--047d7bd753ea479b6d0531126452
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 13:41, Sujith Haridasan <sujith.h@gmail.com> wrote:

> +FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug \
> +                    ${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
>

Debug packages are collected automatically, no need for FILES_PN-dbg
anymore unless you want to package something that isn't .debug/.

Please verify patches against master when submitting!

Ross

--047d7bd753ea479b6d0531126452
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 April 2016 at 13:41, Sujith Haridasan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D":3q8" class=3D"">+FILES_${PN}=
-dbg +=3D &quot;${libdir}/webkit2gtk-4.0/injected-bundle/.debug \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/webkitgtk/webkit2gtk-4.0/.debug/*&quot;<br></div></blockquote></div><=
br>Debug packages are collected automatically, no need for FILES_PN-dbg any=
more unless you want to package something that isn&#39;t .debug/.<br></div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Please veri=
fy patches against master when submitting!</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bd753ea479b6d0531126452--

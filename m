Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7227565C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 12:06:30 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so2633200qcw.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 04:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nNv29WichdYXpjCdJatLJ1/VQ942iyVzDbZEdgps1j0=;
	b=FYeigeXG08eZc956/r/FWKrrZjNH5QHSuyHNVUC6PeNfdVNmHruDYryFbCW+9apNAU
	mjITxomeXzHef8Breclo5QAtSUuv4skw4jK1KHcz1QZM6uEFQbn10Waq6N8+/B0zbEw/
	52Oady9+W0S2vUk2APFH3F9mjpNfWSfjbnZZBleqzil34qWpzebNs2DbmGpof5TDCJ7n
	3hnXpeYXMOdz5pgtq89g/yHbE7BVh8iDEu4KbLd3T0SLBCfrzCDvBZKHx+EDKRosDHLF
	b3CujZBldXnyJFG74NZLpdLdtUkmaqS+EpJbk4FJaAkY8E1faNXThP/SvdWCZE+Oxosa
	DlGA==
X-Gm-Message-State: ALoCoQmO/0+oMMJRmGVl0Mx6NB3rM2iihyfkxkRpgOPSrc80U4PtNwlgE0GInIFNRi4NWENkO2mi
X-Received: by 10.224.138.2 with SMTP id y2mr12554019qat.52.1415361991172;
	Fri, 07 Nov 2014 04:06:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 04:06:10 -0800 (PST)
In-Reply-To: <c9e08dddf533f34459fc1fbe15904a2293c98f81.1415346812.git.hongxu.jia@windriver.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<c9e08dddf533f34459fc1fbe15904a2293c98f81.1415346812.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 12:06:10 +0000
Message-ID: <CAJTo0LarBoyGukf_qbTJovfsHw9=TqdQ2LdnGXebAJ8ZyeZaNw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] oprofileui: use oprofileui-viewer as oprofileui's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 12:06:40 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c3b682e3050743a498

--047d7b6709c3b682e3050743a498
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 07:57, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> The package oprofileui does not exist, so we use oprofileui-viewer as
> the provider. It avoids the do_rootfs failure while IMAGE_INSTALL +=
> "oprofileui"
>

Erm, meta/recipes-kernel/oprofile/oprofileui_git.bb?

Ross

--047d7b6709c3b682e3050743a498
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 07:57, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div id=3D":tc" class=3D"" style=3D"o=
verflow:hidden">The package oprofileui does not exist, so we use oprofileui=
-viewer as<br>
the provider. It avoids the do_rootfs failure while IMAGE_INSTALL +=3D<br>
&quot;oprofileui&quot;<br></div></blockquote></div><br>Erm,=C2=A0meta/recip=
es-kernel/oprofile/<a href=3D"http://oprofileui_git.bb">oprofileui_git.bb</=
a>?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--047d7b6709c3b682e3050743a498--

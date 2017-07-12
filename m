Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 35E81780CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 10:03:44 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id h64so9823248iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=37UHfA0yVSKBBxm5tAp3s1shZibYfKNU6M1SZe24l0g=;
	b=cGrK4mTsbLO+11oyjhlSwDx5rgqUGb7jNS1PTgeGfj6/THCBB29DqeXDFRI4Rmelds
	adH+AkSUDWlgvZrLyGsR6qB21EcvsmBlyS8R/vx7uWQ2XBI8RzakamXCpfv4vb1lsoRH
	53g+w3/C2DSzfzdHcz8SQYzg74gvDr8EHefuLtdCDYp76HuWDxSlEFj0bE/DTHXUSSW3
	HCmmo/eVpvWa3COacUBJbIU3tS60XEEXFO4HDnatz6HKfh8BIoA2FaWK3uGlvyrgbiaL
	FRiVepbQ785T6X2Rwq6/1J9wxVTQ6b5DfmBWYA0VY94TnsSxbOORmToxupazoLO8HKBw
	Z+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=37UHfA0yVSKBBxm5tAp3s1shZibYfKNU6M1SZe24l0g=;
	b=j1MA2+txXxn8dO3/2KTDK+jsDfrDKQ+Gjigmti8pHPCM3MFb4RdQJHYczF7lNZok2j
	lgg0qmTAuPb4utOu99jJtFooDMThBZIPusBrJ6hORLm1HoFF/AF/DHpBupmAiAIfV+JE
	y/bxPq4U5eOSm5md2g9N97XI6W5yfPDVVqh1jeVxqcRlMUS93sErJTZK0yqgPWz31Unh
	hAXiFGKZXN9NvXaEEkn3aW9g8shO0cbFXl7W4vsC+dmyzOH68JJbFqv3wi0nbdnqmCu+
	TeCaOrtv/UxKVAk2XdLeWblIa+BzQTf/eMiF0lP8F/6hqRCzT/59VJ2dfU/B2bfy7zxn
	6nvg==
X-Gm-Message-State: AIVw113uP3ADEu0CO+VSGuKgpNalN3w3CFOp/SSNDtTN11ste7KHJIfo
	mDe3nhaW3WCp5t5Av0nOgQ39cJpzeseJ
X-Received: by 10.107.178.13 with SMTP id b13mr4165600iof.148.1499853826127;
	Wed, 12 Jul 2017 03:03:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 03:03:25 -0700 (PDT)
In-Reply-To: <1499788671-20890-1-git-send-email-lev.iserovich@deshawresearch.com>
References: <1499788671-20890-1-git-send-email-lev.iserovich@deshawresearch.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 11:03:25 +0100
Message-ID: <CAJTo0LYs38P1M3_YBNWfHq71s3RUMeJW4hGKUtQxBWMbT-HGBA@mail.gmail.com>
To: Lev Iserovich <lev.iserovich@deshawresearch.com>
Cc: Lev Iserovich <iserovil@deshawresearch.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: Enable generation of libasprintf in gettext 0.19
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
X-List-Received-Date: Wed, 12 Jul 2017 10:03:45 -0000
Content-Type: multipart/alternative; boundary="001a114c9fc685b63f05541beeba"

--001a114c9fc685b63f05541beeba
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 16:57, Lev Iserovich <lev.iserovich@deshawresearch.com>
wrote:

> Libasprintf was included in gettext 0.16 recipe, but omitted for some
> reason
> in 0.19. This turns it back on.
>

As this pulls C++ libraries into the core package, can it be split out like
the other libraries?

Ross

--001a114c9fc685b63f05541beeba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2017 at 16:57, Lev Iserovich <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:lev.iserovich@deshawresearch.com" target=3D"_blank">lev.iserovich@desh=
awresearch.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":35x" class=3D"a3s aXjCH m15d326fc46fecac5">Libasprintf was included=
 in <span class=3D"il">gettext</span> 0.16 recipe, but omitted for some rea=
son<br>
in 0.19. This turns it back on.<br></div></blockquote></div><br>As this pul=
ls C++ libraries into the core package, can it be split out like the other =
libraries?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a114c9fc685b63f05541beeba--

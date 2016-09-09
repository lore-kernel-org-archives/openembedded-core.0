Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1310260620
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 10:51:29 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id s131so127459711oie.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2016 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m+UtsOZQImn+uf8M0YGLblZE6socqhroSYEBZvrykI8=;
	b=GpOsCL31YAc/hwIA2S2skICIQdUwkfk0RfmUGhicivM+8YqilP6rre5lZtk7/ERPRk
	Lte9eblI6+ZifqnW37l9CEV9PfwNNJTyUVtYa7C+jAFp8CnuXMiCWckJRvIkHhjqSjul
	ZnmHAjkepztkIOr54OA3MtG7S8fxbyIXjM8wrFEMegVElz59JwlJ4SAqRAFnMYC5eRoq
	lkKCIOtJNQK2/ptEc1y9dYFOHnK8cRwbWUmHl1WKOykvCpEw/ceDi0CacaJJwLmNY8HP
	6RUX17Mtt+5N8jLgyd16ztD56syLiQxmmwDoB4h9swqettYnvo0tBCB7Fr59wr6C8vVq
	sh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m+UtsOZQImn+uf8M0YGLblZE6socqhroSYEBZvrykI8=;
	b=lq3TAOM5ExVmjEW9wsi6XAjzQPfCdMV4CdRl+8DPBiCV8cIJzRcjD8MIHXWOWqDDlI
	YmlT8OCwST3ks7pQfpRP+H/liUC1Rj6P5cu252Muk7LiDgaVCCLdmfRud6ytWIG1qsNJ
	fPwxfsoAFhprV0m8XVMUm+2gbBb20tLwMOCcre5gtcc6UyjHNZO7ar0Gv1ZWx0lDhYmH
	LrnDJVe4L6CV8DLed6j1ztJYFMAYF6juTZ+CNs/i/3i9cNfUDFuWxcKxt6I09IzP35xz
	gmgtDKBfNDbl+clBj/6ClGkPmzq48byUMnYH8bGl9X9msttWs+GCIFMF7xtfeN7b2t1E
	XR5A==
X-Gm-Message-State: AE9vXwMzrmbHse7kF0tGXCApWn4SgutLFnMGtKU/qmPTPVHy7XapQglC5x04BWtsmeY/dmkG7Mewr+r9EL+a9P1L
X-Received: by 10.157.46.209 with SMTP id w75mr3620310ota.170.1473418289025;
	Fri, 09 Sep 2016 03:51:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 9 Sep 2016 03:51:08 -0700 (PDT)
In-Reply-To: <1473400623-20500-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1473400623-20500-1-git-send-email-markus.lehtonen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Sep 2016 11:51:08 +0100
Message-ID: <CAJTo0Lb6coAQk0E=DXo2eUkJo4p8TDHXuuTv98i2r61AwgyvQA@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-player: include SRCPV in PV
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
X-List-Received-Date: Fri, 09 Sep 2016 10:51:30 -0000
Content-Type: multipart/alternative; boundary=001a1142ff74b92af2053c10ed72

--001a1142ff74b92af2053c10ed72
Content-Type: text/plain; charset=UTF-8

On 9 September 2016 at 06:57, Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> +PV = "git${SRCPV}"
>

This breaks packaging for me, throwing interesting python exceptions.

gst-player has a version in configure.ac, so this should be
0.0.1+git${SRCPV} I guess.

Ross

--001a1142ff74b92af2053c10ed72
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 September 2016 at 06:57, Markus Lehtonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:markus.lehtonen@linux.intel.com" target=3D"_blank">markus.lehton=
en@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":772" class=3D"a3s aXjCH m1570d87af1f8f38b">+PV =3D &quot;git${S=
RCPV}&quot;<br></div></blockquote></div><br>This breaks packaging for me, t=
hrowing interesting python exceptions.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">gst-player has a version in <a href=3D"htt=
p://configure.ac">configure.ac</a>, so this should be 0.0.1+git${SRCPV} I g=
uess.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a1142ff74b92af2053c10ed72--

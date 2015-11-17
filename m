Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id A8D426010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 14:08:55 +0000 (UTC)
Received: by igcto18 with SMTP id to18so13928461igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9xDD5V1zoUN4At+wx5lA9oC6Q7IMQwVh/AREWvUEMIs=;
	b=mzzRxfDzTODJJhrHu+0OkT5ydrwhROl5OQNM8HKplQVLk0hAV/DXHyXRYk8Ysq7lVe
	piXggPJ9lHVYqaPWk0RCRxgL+yJUEnh+zi4iL5MLOJgPuHvF2DcEbSE3FX63U9DT0aG5
	tyD+uccmpQT5K3qbLru3S5dcvN0UFeekSCt206JYU2cvsGLIb6He7m2IFvusCJ5OoBIe
	QiWOHctTaMR3x5qNQY1pzSBQc3K3YHDqnbLxs4/xtKCi6woa33PMapHciXfpRJlePoql
	wBaknciWEHALivgDU83jLBL8jR/dlWb+f0EI2qbAo8oecLmPE2s57BlYHV7NVB9vbpXz
	bu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9xDD5V1zoUN4At+wx5lA9oC6Q7IMQwVh/AREWvUEMIs=;
	b=OhKWDFAtse1hF4IAnWQ00xej25uGungMOpS/NiEyBH02fVx+lA5GgY9CUDcQX6EQnA
	av6zG2v6LD6UcxZdu1/3aA8W0oMvsH65qKciFoknN58dXYFXZ43BhunXNvzqqOJNiU78
	PO7c8Rn1WV3QIGBK+HQuTtw0gWUOFkeFaH9/rZoX3/NhKUlj7DiyZCfcWTtvlE1q4KQI
	hZ/3V0hKRkvQtN191aNckCS2iBMwIy9s8M2+bBOXhKFX8WBtIsRpRMhXyHnoEIDA/er2
	T5Dd4QQEAwiiUrw98kO1FthidtLClPjCaqOSd2WdWffmpy8JcSlqKPqJ884UDfkznhrd
	ciYA==
X-Gm-Message-State: ALoCoQmi/9eXtmEWrs/O+skpTRSZBRTDNW8VUXMX+5+e+wkXid4xLVRkN1sqQK5GG05cLWlJx+Zq
X-Received: by 10.50.112.99 with SMTP id ip3mr2180130igb.78.1447769335370;
	Tue, 17 Nov 2015 06:08:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 17 Nov 2015 06:08:35 -0800 (PST)
In-Reply-To: <ec29713b1461de3b8dbcfaa19b8263ad959bcf7c.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<ec29713b1461de3b8dbcfaa19b8263ad959bcf7c.1447757562.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 14:08:35 +0000
Message-ID: <CAJTo0LZhVh5g_C93KLP4oGXiZ48aHM+-iCphKuyZXGhb+dJLGw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 07/16] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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
X-List-Received-Date: Tue, 17 Nov 2015 14:08:56 -0000
Content-Type: multipart/alternative; boundary=047d7b3a97c4f3b0cf0524bd100d

--047d7b3a97c4f3b0cf0524bd100d
Content-Type: text/plain; charset=UTF-8

On 17 November 2015 at 10:57, Martin Jansa <martin.jansa@gmail.com> wrote:

> +PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
>

Thats great but gudev is only in meta-oe.  Can you submit a move of the
recipe to oe-core, or should I hold these back until someone else does?

Ross

--047d7b3a97c4f3b0cf0524bd100d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2015 at 10:57, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3e7" clas=
s=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[gudev]=C2=A0 =C2=A0 =C2=
=A0 =3D &quot;--with-gudev,--without-gudev,libgudev&quot;<br></div></blockq=
uote></div><br>Thats great but gudev is only in meta-oe.=C2=A0 Can you subm=
it a move of the recipe to oe-core, or should I hold these back until someo=
ne else does?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--047d7b3a97c4f3b0cf0524bd100d--

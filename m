Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
	[209.85.217.42])
	by mail.openembedded.org (Postfix) with ESMTP id DF9717E63A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:34:42 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id x123so5088488vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+cEvI3PwgKGayKrLm65YQjx8qKMaRmkv8OzGO0IekAo=;
	b=fisaJT7ctLeKqtZUr66QQ/S9acMWWG+02Y+3l0n2tZUZgxrJ1vDsqXofE02YF1ZFxW
	4X5NoJ//tl3Umcu10Hvocxc+yF9J/6sFWyrat+qFcVda9+AilutXxe67PVq4kvDLdw0T
	q+0DwwZx7w7678NdLD+4y3xYfEfQlIuyX+G5zs3vzBnXInpkZI0tSD+7qxG++hIlYOFs
	31aom7cR/3izMPjIB8rclMet2MAd33nvkEwMxZdQiMvRtfU136GLFJAcL8vWg5m8FE6A
	0gGbtmSgV9z01i7ybWR+hUON9orV/D/ypuvYP/4Mg4LAEziQa2Qnf/0fImeF1GppW6wp
	2csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+cEvI3PwgKGayKrLm65YQjx8qKMaRmkv8OzGO0IekAo=;
	b=nqBjwVR3o62HUP3GL3ITOyv0uLY/xU/EtcK11Nqhkce8UhBd7QC1LNJZ+zTdo1++Lz
	reaQa24B0IwFdu7l25jJwVAsKxU40mgKSD+xvL+tEihJfdZc7GTkWJb63URcgW3Zbcit
	KS/Cpc91Bf4ML63RSfNgS67qZnB0Cbt1MEYGN+Ia7HXQ+S5KAkSiasky+WBWCJaxtOjB
	BKLndafxf6l9OogKMAo3f4QKORDDR7v4e2aEZkEazrf4agEGP9ZscwnEgsTG8GSswLOW
	zcLRDHhWZPfLkChD5OAAnxQLiV2qMR+PXV9LQZ19Kh0Vhlcoo7xVJ+dHmvqMmTNGn3vh
	8ynQ==
X-Gm-Message-State: APjAAAXHYSpQCRlo5134Etkex2I5hV2vikG6PM/qVVWsHAERdC1LptXH
	UaEj1piykmANmYDzl7bVG7A2ZZUWrJjMGmms9Rc=
X-Google-Smtp-Source: APXvYqyb2767us4cAbv1Sc0+noTjCqKVWaGUGTXitAizYqJZM+j7aVosvT5ZWFXvlMVxTMVPoZkzNxrx2kEUZdEh7P0=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr6960529vsa.25.1578602083503; 
	Thu, 09 Jan 2020 12:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-4-schnitzeltony@gmail.com>
In-Reply-To: <20200109202623.28936-4-schnitzeltony@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 21:34:32 +0100
Message-ID: <CANNYZj_h_e2JKm6FV__b1+HNg6H20ewMtn+Qvdpy1YJHSXUPKw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/11] shared-mime-info: upgrade 1.10 -> 1.15
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
X-List-Received-Date: Thu, 09 Jan 2020 20:34:43 -0000
Content-Type: multipart/alternative; boundary="0000000000006dd306059bbaf0e8"

--0000000000006dd306059bbaf0e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jan 2020 at 21:27, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:

> -SRC_URI =3D "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.x=
z"
> +SRC_URI =3D "
> https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/b27eb88e4155d=
8fccb8bb3cd12025d5b/${BPN}-${PV}.tar.xz
> "
> +SRC_URI[md5sum] =3D "5215f3d679a817de97eb8b0b911e9393"
> +SRC_URI[sha256sum] =3D
> "f482b027437c99e53b81037a9843fccd549243fd52145d016e9c7174a4f5db90"
>

The changing hash in the URI will make automated upgrades impossible
unfortunately. How about building from git repo?

Alex

--0000000000006dd306059bbaf0e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 21:27, Andreas M=C3=
=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">-SRC_URI =3D &quot;<a href=3D"http://freedesk=
top.org/~hadess/shared-mime-info-$%7BPV%7D.tar.xz" rel=3D"noreferrer" targe=
t=3D"_blank">http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.xz</=
a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/xdg/shared-mim=
e-info/uploads/b27eb88e4155d8fccb8bb3cd12025d5b/$%7BBPN%7D-$%7BPV%7D.tar.xz=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/xdg/s=
hared-mime-info/uploads/b27eb88e4155d8fccb8bb3cd12025d5b/${BPN}-${PV}.tar.x=
z</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;5215f3d679a817de97eb8b0b911e9393&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f482b027437c99e53b81037a9843fccd549243fd52145=
d016e9c7174a4f5db90&quot;<br></blockquote><div><br></div><div>The changing =
hash in the URI will make automated upgrades impossible unfortunately. How =
about building from git repo?</div><div><br></div><div>Alex<br></div></div>=
</div>

--0000000000006dd306059bbaf0e8--

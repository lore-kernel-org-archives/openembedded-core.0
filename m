Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id D64896070A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 12:19:30 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 1so3505954uao.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 04:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0+sKXUVUB5VQg8+KrP7zWszLavZwcGMAv9sG/YdMstA=;
	b=Y5ekiRUwaN1nNI9k3a2+h5XGoohSSnlPRplhRwUHPeB0I5FeXYwncByS6lWAqvfpEC
	HhEGiMcgngn9NVJInWvI+OIQAQs6iUQI8/nhaqqOKSo5GI+8Y+kjjEM31oN7og4pMmxy
	j0mjRfQZWBaqqUdzlDWQczs3LdNj3H5u2m9VsNEzthbuBAd+SVROScX7bBfBzxTIo/VN
	LnNByoaQf3jD8imoBAikC8lLtXJXHPGjv1//SCCdrFolrY7TtGOcQFXzG4KwKxpfbLrc
	hSJ0K+rdo84Kw2Weet7g52B4SRYJYv3hec+KTLqqufLTscZNtwfsMfMwets9fi+wVVwc
	nKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0+sKXUVUB5VQg8+KrP7zWszLavZwcGMAv9sG/YdMstA=;
	b=oAESYaMfuyXeDap5fsSOtW+TRqyge5I41ZYG9nxO2kaFLUbNCX3nZW366VyYuaQ37W
	HaSJRRAwHQ46Tz7fwg+88wIH6U1vwp2wZRFqwTeOETVqWrGoAjYKbdMlzALA059Q5qpS
	Ma76rpWJbiNIIzwIyorwZCLa18WXDBZ9Iefm9jx6UCSfrLqCDAJl74Qf1tSk5b4loCb3
	7Mj99ZxHobZS4pctbnMLmQGoarKLNA1AwWpHELaoN+HmOo/YhoAmvELcdeHD1zPSmO/m
	vssEQ0iuKAfU6Pg9tczmVvFpQeCf3ed5kRHDMuOdUde9EKP9z0P0OV7Nk81pR0WSdq9i
	gFqA==
X-Gm-Message-State: APjAAAUyUSKqJI++wWp0vAhbQhayJ6X9dvygxaEw1XPyABFm3ZdJCObD
	m32dPn8Q6uJ01p9hOPx4PwFfBU3v6yi5Z3yglq+eSw==
X-Google-Smtp-Source: APXvYqzrGDsZInx/jse8V9RvJslaabpg1fg9CuZDJB6GbJgfcU5DEWFUojtoduNrCBzvgnLJF4/Ed58xL6pmE/gsdHg=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr1235333uap.93.1581682771581;
	Fri, 14 Feb 2020 04:19:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
	<CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
	<CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
	<CAMKF1spgO92JJAaVCP26veEsedY_FAziNn6zi9cbpuy2_ofmSg@mail.gmail.com>
	<CANNYZj-7Aidoy4Y6P7ZzXNuGtUCcKddF4B3oeBMrcmmNAceDtQ@mail.gmail.com>
	<CAMKF1soWY20D8HwCEQK8pTsxcR8Bxc7y3aE2mnx2_XdFVJW4Og@mail.gmail.com>
In-Reply-To: <CAMKF1soWY20D8HwCEQK8pTsxcR8Bxc7y3aE2mnx2_XdFVJW4Og@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Feb 2020 13:19:59 +0100
Message-ID: <CANNYZj-MhZhZ1QANwkQxiqCU8dtt5Mn3LzPTtqkB5-BCekDU3w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Fri, 14 Feb 2020 12:19:31 -0000
Content-Type: multipart/alternative; boundary="000000000000bf5f0c059e8837f8"

--000000000000bf5f0c059e8837f8
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Feb 2020 at 08:15, Khem Raj <raj.khem@gmail.com> wrote:

> local.conf I have
>
> DISTRO_FEATURES_append = " largefile opengl ptest multiarch wayland pam
> polkit "
> IMAGE_CLASSES += "testimage testsdk"
>

Right, I'm running this now, it's a bit tricky because I have to do it on
the Yocto AB. Big company's bureaucracy is causing delays in getting me a
build machine :(

Alex

--000000000000bf5f0c059e8837f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 14 Feb 2020 at 08:15, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">local.conf I have<br>
<br>
DISTRO_FEATURES_append =3D &quot; largefile opengl ptest multiarch wayland =
pam polkit &quot;<br>
IMAGE_CLASSES +=3D &quot;testimage testsdk&quot;<br></blockquote><div><br><=
/div><div>Right, I&#39;m running this now, it&#39;s a bit tricky because I =
have to do it on the Yocto AB. Big company&#39;s bureaucracy is causing del=
ays in getting me a build machine :(</div><div><br></div><div>Alex</div></d=
iv></div>

--000000000000bf5f0c059e8837f8--

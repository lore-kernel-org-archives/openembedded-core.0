Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 54EEE760A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:34:52 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id o3so13851158ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9te+OTo4D3eM2VEvlbxLuK+mXpvJMM/HAy762jaTzRM=;
	b=nqg9ndp9Ia+v24AwXLPWchkBDt+xO+Kf7/XuNM/t/6kvl+qhd3T0rI7poxU88yTXp5
	b+ljnF/PUcBGE9sWb30x5Ab2ZB563i4kOBCbR/Q7zxcBY/OZ8oo43XIc/69IFnkTcm2M
	uDn9NUzelVIlleRVY0mDgNgTBBGdo3BM4EwbxqZq471/aoDnP0hTzwrIibuJbOW6tvJ5
	9Q3BgJOj4KgeeOrTzc98XwirzgZkzHVITYMTEU5vYGokUnwMgP40O6P+JvVTda8MvpOf
	GS9YGNwO3vp2pp4DWF3uLFyGeFE5SQO/vbwynS/+frUO903lm6dALjc1keVVVPhjFEAR
	sJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9te+OTo4D3eM2VEvlbxLuK+mXpvJMM/HAy762jaTzRM=;
	b=iGmQ5arI4w8OEeU6C7ISRG5IOQ3sO0guUDtyYHa3Vv6KDzK9Hzppv9NG5IPkrrBzRj
	tiE9UnBi1RlSDsgpHScnM4impo9hBjUtix9p5QHSkatxHHkhqxoV9pquBU3VK+q0S4Cf
	HiD8ShWTsBcKYSEEC3Jr3bb0olsynUH/Ur817pXSOhvT7RlrkowzgfrniRUTbdQD54Te
	BSO9ucJH4kaRhaAzxEji8RN1ou/XZFTd8HVpOA6i/Ksh1gSBl0NuJMjy1jAirMX0b00i
	EyS03SRbTeO52WbTBtbXbWeO0hFcrepYNzdgExBbD2AmrWp3IZ+ba5GcdMb+ZYwTHHct
	iMrw==
X-Gm-Message-State: AE9vXwOBexbrpYXLYj2bMer12v4FDobJqMYZZEdAdgcUtR/Umw91RaANL4f9pwoJefolOKMT5gDpDuU8ir5gN8Vs
X-Received: by 10.157.17.203 with SMTP id y11mr21209429oty.188.1473694493707; 
	Mon, 12 Sep 2016 08:34:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 12 Sep 2016 08:34:33 -0700 (PDT)
In-Reply-To: <57D6C026.1050701@ti.com>
References: <CA+YB3raLEFHAECfBVAspQni9fG0_X0oTPM-Z_F64FzV6PuNdUw@mail.gmail.com>
	<57D6C026.1050701@ti.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Sep 2016 16:34:33 +0100
Message-ID: <CAJTo0LZv=DxdJOUUb3t0Wr4_gcD8mqL_-hu=bVsjUZh=n-mcLA@mail.gmail.com>
To: William Mills <wmills@ti.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Subjects for YP Developer Day at ELCE
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
X-List-Received-Date: Mon, 12 Sep 2016 15:34:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c192a56ce2033053c513c98

--94eb2c192a56ce2033053c513c98
Content-Type: text/plain; charset=UTF-8

On 12 September 2016 at 15:48, William Mills <wmills@ti.com> wrote:

> 5) Can Yocto [cross-]build snaps or flatpaks?
>

Just because it's interesting, note that the standard freedesktop.org
flatpak runtime is in fact bootstrapped through a custom OE distro.

Ross

--94eb2c192a56ce2033053c513c98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 September 2016 at 15:48, William Mills <span dir=3D"ltr">&lt;<a href=
=3D"mailto:wmills@ti.com" target=3D"_blank">wmills@ti.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1q3" class=3D"a3s aXjCH =
m1571edf9fa8dc535">5) Can Yocto [cross-]build snaps or flatpaks?<br></div><=
/blockquote></div><br>Just because it&#39;s interesting, note that the stan=
dard <a href=3D"http://freedesktop.org">freedesktop.org</a> flatpak runtime=
 is in fact bootstrapped through a custom OE distro.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c192a56ce2033053c513c98--

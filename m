Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8E5601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:36:05 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id to18so20133718igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/DX1tRK7QqtpJOfS4Qghmk23onQF4YFk1Pak3eNHiLA=;
	b=JVdsPsmJcGHIpQ97SXXw+lYuxx9xHvN5+6gdb9HqUBjgvtALeH9s1xwElUjSfVWcBy
	E917MvhErh6l+YvAQRsWJ35IcuAbAnX+TanB++lCmHjuQX+wh7KftQ6xGpGqhmVPKB4P
	yGirQdkLY/NC3RkI8RObLVwEMq4k5AwEO51R/D4tVWwifMsbcgwtMVxjv04UYu+EgrAC
	MTuoiNPspng5N7loEeDu7WtSe3B7sMthtMj/GC4D8ftPvfdSmrQ46Xv+5Ty4VT5KvoTV
	dWkZdJAWf4ccEDVErGnrbvpaCI9z3VJk3xr7H03XE27nIGT05ISclLTN7uVz1zGWuK3Q
	J+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/DX1tRK7QqtpJOfS4Qghmk23onQF4YFk1Pak3eNHiLA=;
	b=Ckf44vUdx2+wTIPQgBG4JHFk4k8HDmrs6U3DCb3qtW/ObDFhndaH2i62nQvbXsfSnd
	pATxDR6b+UWZKwGXfQ4O16oE9XdI9JccJliRl5bC72Ql58I/izA/Awu5tqU0Nfl2TLDy
	htezTR+i0UvWSSZHV+cMzmve43lh5zrGL1pVg0YVWedWzbi5b3EU1FRTFYRXaLaQGcJ6
	JS5djcgZimvbkK1jujLoOqMjwYqxuPJDH4EmcqNigza5FMX6Z/h+pPcLqSGl2rSh0BVf
	eTwmv8rj56bo71aniT7Hhc8exqZkJN9s1+ZA2YRq+p5TJS0DABZcWmbzm10uRAYe73rP
	4dnA==
X-Gm-Message-State: ALoCoQlQ4vba2/oFnNXQjlE01x5FQW4YuH2v6nQgX7XL9/A2iCP9majeDkIrj6mTfnU0ChWNW8/+pqtgt1QHlF1PfrAlt4C7R7X7/0TBhBnZc/8SNVhZR1Y=
X-Received: by 10.50.126.8 with SMTP id mu8mr440414igb.52.1450384566173; Thu,
	17 Dec 2015 12:36:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 12:35:46 -0800 (PST)
In-Reply-To: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 20:35:46 +0000
Message-ID: <CAJTo0LZkPQgzt6Kttmg4sWrXQk_m+iT9qLK1sR-ftkMBZxK0YA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: update to 1.59.0
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
X-List-Received-Date: Thu, 17 Dec 2015 20:36:11 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bfdadbeb05271df82e

--047d7b1635bfdadbeb05271df82e
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 11:45, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
wrote:

> Due to the version update, the two patches previously backported in
> this recipe are now dropped. The actual status of the
> arm-intrinsics.patch (reported with Upstream-Status: Backport)
> is unknown to the committer, and hence, that patch is kept in the
> recipe, even if it is possibly not required anymore. A deeper
> analysis is required to determine need and status of that patch.
>

This adds a new library so the packaging needs to be updated to reflect
that.  The obvious problem is that the development/debug/test packages are
all called libboost-timer after this upgrade.

Once fixed (extend BOOST_LIBS) it would be good to set FILES_${PN} to "" so
this can't happen in the future, and instead you'd get
installed-not-shipped errors.

Ross

--047d7b1635bfdadbeb05271df82e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 11:45, Lukas Bulwahn <span dir=3D"ltr">&lt;<a href=
=3D"mailto:lukas.bulwahn@oss.bmw-carit.de" target=3D"_blank">lukas.bulwahn@=
oss.bmw-carit.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":3hq" class=3D"a3s" style=3D"overflow:hidden">Due to the version u=
pdate, the two patches previously backported in<br>
this recipe are now dropped. The actual status of the<br>
arm-intrinsics.patch (reported with Upstream-Status: Backport)<br>
is unknown to the committer, and hence, that patch is kept in the<br>
recipe, even if it is possibly not required anymore. A deeper<br>
analysis is required to determine need and status of that patch.<br></div><=
/blockquote></div><br>This adds a new library so the packaging needs to be =
updated to reflect that.=C2=A0 The obvious problem is that the development/=
debug/test packages are all called libboost-timer after this upgrade.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Once fixed =
(extend BOOST_LIBS) it would be good to set FILES_${PN} to &quot;&quot; so =
this can&#39;t happen in the future, and instead you&#39;d get installed-no=
t-shipped errors.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--047d7b1635bfdadbeb05271df82e--

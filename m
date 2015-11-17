Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B27986011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 16:47:47 +0000 (UTC)
Received: by ioc74 with SMTP id 74so24469912ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 08:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s9G52bmx9jDE+sfR0QIiYVIw66lb/S4Ske3wEj+1tdA=;
	b=F650Maqlj6rwj+7z3ullz+iKKj8Zs9d7HCs4ZDmGLNMobChrty17/ToPNQuiXjLIy3
	Yas10E8ybQz4daJP4I+7RflgMns69wrFVigRaqMJeDhMU8Tivltp3fyEuXjjJr6IgkWs
	nZE75c1qQZKvAoWGdz+Gg+XDg86AXna1lf3fIsL5YkXDmbs8GhVvgPEzE3rJbhdCb0jx
	gN/lCEOYDdWogsBaZJz4x9vT9o3GXjdu26eWXuqKx1QIwKJmRf8oGMDvi8bEuBdLXz4Z
	rv2meD2C9X6uKxslGIoeqV0XmwdDJgvQt2lyvYBAH5OVBekllwz2368BE8XALAU6JUsl
	AXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=s9G52bmx9jDE+sfR0QIiYVIw66lb/S4Ske3wEj+1tdA=;
	b=GfPsT5CR0mqO9DVXWTMIt+rnVelIJ6U4xTbZtAQmoegZ4deUQK65iuJ6EkxXXkOk5e
	ITKYXxAxP1QghQ/Q+uRK3ooiikLnE1ElEAAqi04IFMYPp8BBjBWa8sXRIN7hPJrjCHwy
	JCyRqb/p0qw5t+fSTVotDmj7U6jjVLRfAiSzjAYAJ+2XK/KgOoLY+WOjvCmotdyojBU8
	hBZvgb48WCk31WIdlLUm+68g+xWbDsi+7XOZg2QvdBRFX/yuHviVjdN4y3HljdGwmd1v
	uArRtjFLK5KUelT6Ngw0hzxVu5z6b8YHaBye06H0B5YZ9MMEmGHPtxwU24MI3LfS1X1b
	ukXw==
X-Gm-Message-State: ALoCoQnSzeGETAZ03/oPxaTizns4ETXaecJpOvmR5T71vOnDyk4OU9MpFuxG9YEhLYP2fJcGQuMN
X-Received: by 10.107.135.30 with SMTP id j30mr35778146iod.148.1447778868205; 
	Tue, 17 Nov 2015 08:47:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 17 Nov 2015 08:47:28 -0800 (PST)
In-Reply-To: <4c979450dc388089218a40192a5eb9ae7d6e7f5b.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<4c979450dc388089218a40192a5eb9ae7d6e7f5b.1447757562.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 16:47:28 +0000
Message-ID: <CAJTo0LZpmtMrQWAdzG3WuDMMSEUOVut0vjfAdytoy9EXfrLNeA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 06/16] gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Nov 2015 16:47:47 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a27257b0524bf49ab

--001a113ec64a27257b0524bf49ab
Content-Type: text/plain; charset=UTF-8

On 17 November 2015 at 10:57, Martin Jansa <martin.jansa@gmail.com> wrote:

> +PACKAGECONFIG[uvch264]         =
> "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
>

Same problem with gudev...

Ross

--001a113ec64a27257b0524bf49ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2015 at 10:57, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17f" clas=
s=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[uvch264]=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-uvch264,--disable-uvch264,libusb1 li=
bgudev&quot;<br></div></blockquote></div><br>Same problem with gudev...=C2=
=A0</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a113ec64a27257b0524bf49ab--

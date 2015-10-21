Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id E57DB75D22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:43:29 +0000 (UTC)
Received: by qkfm62 with SMTP id m62so25199744qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 01:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WWjOGfEHLsOLMKfsZjR0puvLqX/DwHfTCdrY9OwEs5g=;
	b=iyOVeA8wQE+KT5Uy4GbrJIUQpHnpdU1u3kOfxmxWJw8qovxHymaxZUhaPqUJjqzSij
	Cd/cVvf0HTMeKICoF/G2HIskfJ/qgfsb/VlloBacmZtqH0hEMWTp9ks+DrJBq9TuiWNp
	gO1ssrNCBUPioxNmgEyRGgbhDEeeDe9EhIds7ReD090HIWtYp5VcBbaoF12ggq+I821m
	XOobdP0KKUrlh1J19+PqEW7GpGz8byXIdwENyh+H6QIMePEZS8QqFEq3wjWTTEoQv8HA
	cNcEpxnUUmAgtcx+8tCqgxWvQgbjYTy9xWrWtuWM3BlipwuWUtFXFM3pZZlwmPMbwH41
	qy5w==
X-Gm-Message-State: ALoCoQnfL+Ag0Y0F9zVsWWERcPQfOOBb21xnNiDBvY4ELpnX1ktPziZHPJyONAQX11kMa5UjpviT
X-Received: by 10.55.200.71 with SMTP id c68mr9323998qkj.72.1445417009846;
	Wed, 21 Oct 2015 01:43:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 21 Oct 2015 01:43:10 -0700 (PDT)
In-Reply-To: <34b6f876ffd9463779923ec2297e060e893034f4.1445415749.git.jussi.kukkonen@intel.com>
References: <cover.1445415749.git.jussi.kukkonen@intel.com>
	<34b6f876ffd9463779923ec2297e060e893034f4.1445415749.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Oct 2015 09:43:10 +0100
Message-ID: <CAJTo0LYxvYLQpeqVyR4HhzRJywUY5Ve_cHfsYo4VkV9otvJ5cA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk+3: Do not try to initialize GL without libgl
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
X-List-Received-Date: Wed, 21 Oct 2015 08:43:32 -0000
Content-Type: multipart/alternative; boundary=001a1139b4486cb4b00522995f65

--001a1139b4486cb4b00522995f65
Content-Type: text/plain; charset=UTF-8

On 21 October 2015 at 09:34, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> +PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
>

This adds a RDEPENDS of libgl to libgtk3, so the explicit RDEPENDS on
gtk3-demo isn't required.  As GTK+ explicitly checks for GLX at startup I
guess you want to remove the explicit RDEPENDS on gtk3-demo and the advice
that applications should rdepend on libgl?

Ross

--001a1139b4486cb4b00522995f65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 October 2015 at 09:34, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5a=
q" class=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[glx] =3D &quot;--=
enable-glx,--disable-glx,,libgl&quot;<br></div></blockquote></div><br>This =
adds a RDEPENDS of libgl to libgtk3, so the explicit RDEPENDS on gtk3-demo =
isn&#39;t required.=C2=A0 As GTK+ explicitly checks for GLX at startup I gu=
ess you want to remove the explicit RDEPENDS on gtk3-demo and the advice th=
at applications should rdepend on libgl?</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139b4486cb4b00522995f65--

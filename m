Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 849E66FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:34:59 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so116638058ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/b7JKe6GrceKMgxIW3L8VuZxP+SaeFVa0JCwXT8jJuI=;
	b=CPMcSZgVz+wFgPbIx7nN1TYC9YkS1Y3rpvkSu2VoEzi8h9NlokxG6lG6/VEagl2aGb
	AoAjcLDjMSKE6n3BgIejfVOykpE3rFdLq3154N9fgq3lK7WlVccPYAt8OUMRAHrHSoYf
	WAbuzMWdTE8k/ef82oQsNEFUlosTU7mYrX5uE4/K5FX9qgkwyVs6AaIs9zq8UzrPlhb4
	MhHEt78C3ltelnDr2+QtYwsvQjkdol1d8OiU3NZvzie9s77FL/PQUo9DOaIDYsPABLT5
	Z+eZAkzZ9c3kmDIR0YieJjEmPtDHNG6o/pHet2HPksTn4QioQBiUjeFkqM1CHmvZ6zXW
	3c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/b7JKe6GrceKMgxIW3L8VuZxP+SaeFVa0JCwXT8jJuI=;
	b=bgLwJkQDGpKc+Fh8jrEO1KYxRJ6jFdYyVUZF6xITXqQCd733UQNzE7rd842LboKNny
	mqXwWMmm5gbap305WINQYMlaIvk7lEmEyPcnaBSeB4505aels2JygSeDnekcyaFx5KP3
	ukQRIV5MN69atCFIn6kKB0NFtVcENgrYLp+4fF3V/Ww3Qly/R/cISh5OIzFnjmHvDBOy
	/Wq8p4xVDCXJWzmgyZJUtmw596t4ajjgXKvf6jlfF6HqmWChrceOdxpL7C+7OLctKgif
	/NwOZqLanKYUBmsvYUdGRMrcx7Ix7V15yWNY1JsxiUTi+tUtfJpaXwym5ggZNLzlSS4i
	MMNQ==
X-Gm-Message-State: ALyK8tIdNUtRC5196PrKGn7fO9i0XH2qDbtT6nVEL2roTStI3c4HfvALpIOSmZsntDbv4parThSOzXMsoofMQmBr
X-Received: by 10.36.121.204 with SMTP id z195mr46496859itc.22.1469025300780; 
	Wed, 20 Jul 2016 07:35:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 20 Jul 2016 07:34:41 -0700 (PDT)
In-Reply-To: <20160720140005.v32oywji2g7cujgg@jama>
References: <20160615170615.18982.45346@opal.openembedded.org>
	<20160615170625.A38495043A@opal.openembedded.org>
	<20160720140005.v32oywji2g7cujgg@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jul 2016 15:34:41 +0100
Message-ID: <CAJTo0LamipauKmzaLRpFrSZxxYxRWvfBNdy1+1bmoJ=gJFacVg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 38/47: sysprof: Upgrade to git version slightly past 3.20
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
X-List-Received-Date: Wed, 20 Jul 2016 14:35:01 -0000
Content-Type: multipart/alternative; boundary=001a114aa466383a970538121b9b

--001a114aa466383a970538121b9b
Content-Type: text/plain; charset=UTF-8

On 20 July 2016 at 15:00, Martin Jansa <martin.jansa@gmail.com> wrote:

> sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof: Files/directories were
> installed but not shipped in any package:
>   /lib
>   /usr/share/dbus-1
>   /usr/share/dbus-1/system.d
>   /usr/share/dbus-1/system-services
>   /usr/share/dbus-1/system.d/org.gnome.Sysprof2.conf
>   /usr/share/dbus-1/system-services/org.gnome.Sysprof2.service
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/sysprof2.service
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> sysprof: 9 installed and not shipped files. [installed-vs-shipped]
> sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it
> isn't a build dependency, missing polkit in DEPENDS or PACKAGECONFIG?
> [build-deps]
>

Filed as #9987, thanks Martin.

Ross

--001a114aa466383a970538121b9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2016 at 15:00, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3yu" class=3D=
"a3s aXjCH m156089bf4c3915c9">sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof=
: Files/directories were<br>
installed but not shipped in any package:<br>
=C2=A0 /lib<br>
=C2=A0 /usr/share/dbus-1<br>
=C2=A0 /usr/share/dbus-1/system.d<br>
=C2=A0 /usr/share/dbus-1/system-services<br>
=C2=A0 /usr/share/dbus-1/system.d/org.gnome.Sysprof2.conf<br>
=C2=A0 /usr/share/dbus-1/system-services/org.gnome.Sysprof2.service<br>
=C2=A0 /lib/systemd<br>
=C2=A0 /lib/systemd/system<br>
=C2=A0 /lib/systemd/system/sysprof2.service<br>
Please set FILES such that these items are packaged. Alternatively if<br>
they are unneeded, avoid installing them or delete them within<br>
do_install.<br>
sysprof: 9 installed and not shipped files. [installed-vs-shipped]<br>
sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it<br=
>
isn&#39;t a build dependency, missing polkit in DEPENDS or PACKAGECONFIG?<b=
r>
[build-deps]<br></div></blockquote></div><br>Filed as #9987, thanks Martin.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a114aa466383a970538121b9b--

Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF3A74051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 09:44:31 +0000 (UTC)
Received: by qgf75 with SMTP id 75so2992835qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 02:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UqJrPp5OCXgCgnbj+pX3uaalhTSIgZz2kMrz+lwhm1s=;
	b=fsPMEY5r9QHu/VlyQ9eGSWSAtTUDili6DOje7Qri2orRPj05NekmuG6UiNb/IhkUfD
	oyvQyMZtRCQB4ssoBAXuVayXa7ZKaAc10y2rlW08+vSTvdXre6PBANHAL8KKPcobVWA2
	Zy6KZWS1ZmZllzR87hsq76Lxplv8OQ3GNkL+tytN0mWgYzhXnuwUQ6G/xsfvUJ1ptOKy
	PifE/5hqMhpLxkUdI3ApATIFd5A/cNwBeTOpQ8fzagnmv1/7PXCpAfuUQNo61NewnkUQ
	RcYsCLgu0GAjqYi6nfcE8LKF83Jf2oa6QZxlUSE00vKpKNorkXCaz1fiEcmPLzVktXrK
	670g==
X-Gm-Message-State: ALoCoQniMzYYJ+u6wNwmYHMrtVab0ucDxNiGn1xo+vCYz6NtIPvIeaIUA56BzlPQOu9ca8oo2LGa
X-Received: by 10.55.40.18 with SMTP id o18mr69356014qkh.58.1434447872173;
	Tue, 16 Jun 2015 02:44:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 16 Jun 2015 02:44:11 -0700 (PDT)
In-Reply-To: <07825c738353263369f428bd4db48ad230176dca.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
	<07825c738353263369f428bd4db48ad230176dca.1433443273.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jun 2015 10:44:11 +0100
Message-ID: <CAJTo0LZWUUxBz563_ga=9D+bzGpqZcYGeYAu8Loe6YpdDcrQGg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/4] distrodata: Remove unnecessary include of package_regex.inc
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
X-List-Received-Date: Tue, 16 Jun 2015 09:44:35 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8dec36b05189f6b00

--001a11440fb8dec36b05189f6b00
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 June 2015 at 19:42, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.c=
om> wrote:

> This causes a warning when follow documentation to use distrodata
> class that points to include,
>
>         include conf/distro/include/distro_alias.inc
>         include conf/distro/include/recipe_color.inc
>         include conf/distro/include/maintainers.inc
>         include conf/distro/include/upstream_tracking.inc
>         include conf/distro/include/package_regex.inc
>         INHERIT+=3D "distrodata"
>

Can we revert this? Instead make the class include the configuration files
that it needs, and update the documentation.  As Paul pointed out in a bug
earlier several of these files can be deleted now anyway, and having
distrodata working with just a simple INHERIT is much neater.

(by which I mean: I've reverted this in master-under-test, shout if you
have a good argument against this)

Ross

--001a11440fb8dec36b05189f6b00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 June 2015 at 19:42, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":3an" class=3D"a3s" style=3D"overflow:hidden">This causes a warning =
when follow documentation to use <span class=3D"il">distrodata</span><br>
class that points to include,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include conf/<span class=3D"il">distro</span>/i=
nclude/distro_alias.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include conf/<span class=3D"il">distro</span>/i=
nclude/recipe_color.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include conf/<span class=3D"il">distro</span>/i=
nclude/maintainers.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include conf/<span class=3D"il">distro</span>/i=
nclude/upstream_tracking.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include conf/<span class=3D"il">distro</span>/i=
nclude/package_regex.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 INHERIT+=3D &quot;<span class=3D"il">distrodata=
</span>&quot;</div></blockquote></div><br>Can we revert this? Instead make =
the class include the configuration files that it needs, and update the doc=
umentation.=C2=A0 As Paul pointed out in a bug earlier several of these fil=
es can be deleted now anyway, and having distrodata working with just a sim=
ple INHERIT is much neater.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">(by which I mean: I&#39;ve reverted this in master-un=
der-test, shout if you have a good argument against this)</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11440fb8dec36b05189f6b00--

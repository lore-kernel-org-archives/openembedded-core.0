Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 29A0F77CEF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 14:02:34 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id b187so86961383oif.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xVka36NDZBARPvinbXymM1FK8YC+H4/LLP014hqTbxM=;
	b=PeUCpvbg9YRDQadExB/H5p2ndp5c97ROtx3gPCc+5U0zdI4oxQXwdo8mcPz2wjLbsM
	Gr7x5XKdHsLjat8jDGsBTrmhxLJfEca5ybygsLr9dEjGCmVjDbxggoE+6FicFObx3lPp
	ub1F4W+zqbNdZkcB6JFtxgRNJYkD25+TyxpGduJJwWn88EyVft6ckenXL96LHIZmTgfu
	seENBQjVu3+j5VcFBL3XP5raViW9NiNgoKwIl22OnLb+BXyIRbfCjdLyzctlGLv9zwz4
	2jWiG1UV0dKsKUobxZepdLYuctpNnvpq5t9AzeIFd/ZPhQTVEDF0u8LwWdz7YOHzpKa6
	Ay1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xVka36NDZBARPvinbXymM1FK8YC+H4/LLP014hqTbxM=;
	b=MDsGSsDRKn4r6U3MpwRFG/GmrGMpgdvmVRUoN3pSVms+Kgc3c/kKu+I5q39E/ss2OQ
	VoVdJgVg2un15PYQKKPbdrkd4ha7HADKHsfAyDph/K2rbdnMyG4SjZEuM6+Uj8XkgaUj
	2g+WL562cKhF5xKE3ATHstN6rz7PRi8paNapuDoahclB66h8idq1Yw2EmLIhKDJBblRe
	MudgnDicRFUqf+chcaeGnxSoQOk9DAIaCq3xso7QSZEOnr5w67TqZbIDBVrnYEYy+HhY
	hVXDX0KERR6+RmENZ8DZ3U5iTEC3VaIdQlcLeovUo6zhgTkyz+SOAJol38HgdOsj+NVg
	83Nw==
X-Gm-Message-State: AFeK/H16+GvZVFtG6rlxVNh69zvoBH1SQuwKd6CXtGHiPblDSNESnXt/Jwf1J1jWRSNLlg/OAJ3GCBHesLotUw==
X-Received: by 10.202.64.195 with SMTP id n186mr18888435oia.125.1491573756177; 
	Fri, 07 Apr 2017 07:02:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.197 with HTTP; Fri, 7 Apr 2017 07:02:15 -0700 (PDT)
In-Reply-To: <cover.1491484515.git.joshua.g.lock@intel.com>
References: <cover.1491484515.git.joshua.g.lock@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 7 Apr 2017 07:02:15 -0700
Message-ID: <CABcZANnLVci9_USGAYj7F7Fg3-+Z_08ySHa-YwSuGWBGsXXoKg@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fixes for building on Fedora 26 (Alpha)
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
X-List-Received-Date: Fri, 07 Apr 2017 14:02:35 -0000
Content-Type: multipart/alternative; boundary=001a113dd1e6e4b392054c941319

--001a113dd1e6e4b392054c941319
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 6, 2017 at 6:23 AM, Joshua Lock <joshua.g.lock@intel.com> wrote=
:

> As Fedora 26 has a new gcc [1] and a new system pkg-config implementation
> [2] I
> wanted to do some testing on that host OS so that we might be able to get
> some
> fixes in before Pyro/2.3 is released.
>
> The following series were the only changes required to start building (I
> have
> tested core-image-minimal, core-image-base and core-image-sato) on Fedora
> 26.
>
> 1. https://fedoraproject.org/wiki/Changes/GCC7
> 2. https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-config_
> implementation


Quite interesting. I started poking at pkgconf a while back =E2=80=94
https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113dd1e6e4b392054c941319
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 6, 2017 at 6:23 AM, Joshua Lock <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:joshua.g.lock@intel.com" target=3D"_blank">joshua.g.lock@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border=
-left-color:rgb(204,204,204);padding-left:1ex">As Fedora 26 has a new gcc [=
1] and a new system pkg-config implementation [2] I<br>
wanted to do some testing on that host OS so that we might be able to get s=
ome<br>
fixes in before Pyro/2.3 is released.<br>
<br>
The following series were the only changes required to start building (I ha=
ve<br>
tested core-image-minimal, core-image-base and core-image-sato) on Fedora 2=
6.<br>
<br>
1. <a href=3D"https://fedoraproject.org/wiki/Changes/GCC7" rel=3D"noreferre=
r" target=3D"_blank">https://fedoraproject.org/<wbr>wiki/Changes/GCC7</a><b=
r>
2. <a href=3D"https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-=
config_implementation" rel=3D"noreferrer" target=3D"_blank">https://fedorap=
roject.org/<wbr>wiki/Changes/pkgconf_as_<wbr>system_pkg-config_<wbr>impleme=
ntation</a></blockquote><div><br></div><div>Quite interesting. I started po=
king at pkgconf a while back =E2=80=94 <a href=3D"https://github.com/kergot=
h/meta-kergoth-wip/tree/master/meta-pkgconf">https://github.com/kergoth/met=
a-kergoth-wip/tree/master/meta-pkgconf</a>.</div></div>-- <br><div class=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson=
<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus=
<br>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a113dd1e6e4b392054c941319--

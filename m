Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 21C546FF56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 21:06:02 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id q12-v6so3946880qtp.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EXPAyzunbvorawplubH8zENFE+gGQBLfWNK3QtWzaAs=;
	b=YFOeOJkRlVaDmf0hz/VF7KQqfHhfgiuwcNwkRVX3plpVYqKGxDPQkNRw4dgzs6FDIE
	ORfx7ZMEOn4vPSE2zhzQ17CJfPjMYBPS2solduJ0VN2cbvoRzBer0sSjPwBgxJ2LiIBe
	nP+sBaL6FmnWBhirA7RdDRLsAX3bogNIWZaE6Oi8ZGUzIku0lXSkk98M4P0EyZDrrzaG
	v+lJ2V09/ld++YJNz0gSw/3fwBlQl/+v4hog++ee3wPvGiklW5SxPTSt5xbiKz+m8ICX
	hC3PD5NCmOYWZvCpHcM0zgnlOz6PKgOilUsgBugja45zvEE62Qhp/sc+hJzK28W6SenY
	Odrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EXPAyzunbvorawplubH8zENFE+gGQBLfWNK3QtWzaAs=;
	b=eqirT959aI/5as3ievnF1O3XQb5it6ATuem0VKpkZKtLQlkTONEh5PuidAE+XtTS1H
	P37oVYcCAaFX9el+YVjhfJTuAsIG/7VEIAhI++0PReSQ9vEFx6lY3Hj15ftS+6eCJCYr
	TdT0j0ixs/BteZ6Y4WKFuwHCNSGOJFlymEH+r3Myb7xul+0+C3SsiR9AcQVC79kumCRS
	bp+gxxDYkbmRuZAjdgHmRKZ8xhpi3d25HCyrxO9itHl1uk3Hvu53hFaGqpPXecB9rFRn
	m9sgBo1Ulz9oKEFaQYZ22RaHXlwTzzXPqXpqQsRE2jt7w0zIxaozPfewPs4jsE2NMDyx
	ZMWw==
X-Gm-Message-State: AOUpUlE2K9OPN5lgrfrQQX8Zre74wbzufEqY3Lzh+MQL4Sga3YiW202m
	Q5YKkWfR/QDvriCD3tggSmCY9rxhVXbW7FfTzPE=
X-Google-Smtp-Source: AAOMgpdoGzTvAk1z8ZAoPPvZqOdIFIfWKtYiu6W/dtTPLBsghaQ76Pcq7RdDzFD0sOWI5E65bDUt6rDRma67+FUeYSc=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr1186434qta.117.1533243963727; 
	Thu, 02 Aug 2018 14:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20180731170541.13620-1-ross.burton@intel.com>
	<20180731170541.13620-2-ross.burton@intel.com>
In-Reply-To: <20180731170541.13620-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 14:05:52 -0700
Message-ID: <CAMKF1sog84TTX8f9kmzx9o3e8LciAMp6SxVh+MwE4OX=NYm_SQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] python[3]native: allow use of both native Python 2 and 3
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
X-List-Received-Date: Thu, 02 Aug 2018 21:06:03 -0000
Content-Type: multipart/alternative; boundary="000000000000cfe53c05727a2d3a"

--000000000000cfe53c05727a2d3a
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 31, 2018 at 10:06 AM Ross Burton <ross.burton@intel.com> wrote:

> Instead of both classes using ${PYTHON_PN} (which is set by python-dir and
> python3-dir), hardcode the right values so that it is possible to inherit
> both
> pythonnative and python3native at the same time.
>
> If both are inherited then both native Pythons are available, but the last
> to be
> inherited will be the one to set PYTHON.


Not particularly thrilled about this usage it seems error prone

>
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/python3native.bbclass | 6 +++---
>  meta/classes/pythonnative.bbclass  | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/python3native.bbclass
> b/meta/classes/python3native.bbclass
> index 89665efee8b..da12a714703 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -1,8 +1,8 @@
>  inherit python3-dir
>
> -PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
> -EXTRANATIVEPATH += "${PYTHON_PN}-native"
> -DEPENDS_append = " ${PYTHON_PN}-native "
> +PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
> +EXTRANATIVEPATH += "python3-native"
> +DEPENDS_append = " python3-native "
>
>  # python-config and other scripts are using distutils modules
>  # which we patch to access these variables
> diff --git a/meta/classes/pythonnative.bbclass
> b/meta/classes/pythonnative.bbclass
> index 4cc8b2769c2..ae6600cd155 100644
> --- a/meta/classes/pythonnative.bbclass
> +++ b/meta/classes/pythonnative.bbclass
> @@ -1,11 +1,11 @@
>
>  inherit python-dir
>
> -PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
> +PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
>  # PYTHON_EXECUTABLE is used by cmake
>  PYTHON_EXECUTABLE="${PYTHON}"
> -EXTRANATIVEPATH += "${PYTHON_PN}-native"
> -DEPENDS_append = " ${PYTHON_PN}-native "
> +EXTRANATIVEPATH += "python-native"
> +DEPENDS_append = " python-native "
>
>  # python-config and other scripts are using distutils modules
>  # which we patch to access these variables
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000cfe53c05727a2d3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue,=
 Jul 31, 2018 at 10:06 AM Ross Burton &lt;<a href=3D"mailto:ross.burton@int=
el.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Instead of both classes using ${PYTHON_PN} (which is set by pytho=
n-dir and<br>
python3-dir), hardcode the right values so that it is possible to inherit b=
oth<br>
pythonnative and python3native at the same time.<br>
<br>
If both are inherited then both native Pythons are available, but the last =
to be<br>
inherited will be the one to set PYTHON.</blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Not particularly thrilled about this usage it seems=
 error prone</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/python3native.bbclass | 6 +++---<br>
=C2=A0meta/classes/pythonnative.bbclass=C2=A0 | 6 +++---<br>
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3nativ=
e.bbclass<br>
index 89665efee8b..da12a714703 100644<br>
--- a/meta/classes/python3native.bbclass<br>
+++ b/meta/classes/python3native.bbclass<br>
@@ -1,8 +1,8 @@<br>
=C2=A0inherit python3-dir<br>
<br>
-PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}&q=
uot;<br>
-EXTRANATIVEPATH +=3D &quot;${PYTHON_PN}-native&quot;<br>
-DEPENDS_append =3D &quot; ${PYTHON_PN}-native &quot;<br>
+PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/python3-native/python3&quot;<br>
+EXTRANATIVEPATH +=3D &quot;python3-native&quot;<br>
+DEPENDS_append =3D &quot; python3-native &quot;<br>
<br>
=C2=A0# python-config and other scripts are using distutils modules<br>
=C2=A0# which we patch to access these variables<br>
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.=
bbclass<br>
index 4cc8b2769c2..ae6600cd155 100644<br>
--- a/meta/classes/pythonnative.bbclass<br>
+++ b/meta/classes/pythonnative.bbclass<br>
@@ -1,11 +1,11 @@<br>
<br>
=C2=A0inherit python-dir<br>
<br>
-PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}&q=
uot;<br>
+PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/python-native/python&quot;<br>
=C2=A0# PYTHON_EXECUTABLE is used by cmake<br>
=C2=A0PYTHON_EXECUTABLE=3D&quot;${PYTHON}&quot;<br>
-EXTRANATIVEPATH +=3D &quot;${PYTHON_PN}-native&quot;<br>
-DEPENDS_append =3D &quot; ${PYTHON_PN}-native &quot;<br>
+EXTRANATIVEPATH +=3D &quot;python-native&quot;<br>
+DEPENDS_append =3D &quot; python-native &quot;<br>
<br>
=C2=A0# python-config and other scripts are using distutils modules<br>
=C2=A0# which we patch to access these variables<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000cfe53c05727a2d3a--

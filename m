Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id D8BD475742
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:10:00 +0000 (UTC)
Received: by qcej9 with SMTP id j9so19570633qce.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 09:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j9qOW7hJUQk+8oQ0jSuMzwKMJKU1Uw8M9rZR4aZYJS8=;
	b=a5vBu/qVYD3WX7NhbwGPBIl1WYe3HKJa1svrnsVCfvNnmCIIOqZYxfXXh+VCG4HgsQ
	6U+KNt44oAlFKwUQ4p6xHR7di1i2Nga2Mm+OmNh5eilPZ5Q1QMTUCPh3/ZYoHOS2jR63
	2Hq9fdqSqiKsZmQ0sTG2JDWajo5+J888/jbFmSJHBGSw4+Rscd9tTr4tHPt1MLLUSRJh
	hGcS71RiayhII0Hw0tYV5+6PQx3xZmrmBWSkyJLjCVP932qlqU+kupzKYWvNXl/t1eIA
	m3P22iZEpyAcovVzOjiqvL2SdxGtLwQ2vkqJ8lnwgnBEf11nvdrJ2IfXeosk/n3QDhTp
	WK8w==
X-Gm-Message-State: ALoCoQkeGWZg6d8ozVi0UAwcgGZUamI+qz3hpEXnr1b7pHOg25uWP3Z0XPCg+9h2M+m9zjnlhkVP
X-Received: by 10.140.89.104 with SMTP id u95mr32249627qgd.15.1433434201337;
	Thu, 04 Jun 2015 09:10:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 4 Jun 2015 09:09:40 -0700 (PDT)
In-Reply-To: <cover.1433274434.git.anibal.limon@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jun 2015 17:09:40 +0100
Message-ID: <CAJTo0LbAsutsVamsW4mYt8rKHL069DKFKhWMYhwMK-o9tcabwQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] recipeutils adds get_recipe_upstream_version and distrodata fixes
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
X-List-Received-Date: Thu, 04 Jun 2015 16:10:03 -0000
Content-Type: multipart/alternative; boundary=001a11c135f66146de0517b36826

--001a11c135f66146de0517b36826
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 June 2015 at 20:49, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.c=
om> wrote:

> An=C3=ADbal Lim=C3=B3n (4):
>   recipeutils: Add get_recipe_upstream_version and
>     get_recipe_pv_without_srcpv functions
>   distrodata: Remove unnecessary include of package_regex.inc
>   distrodata: checkpkg make usage of
>     oe.recipeutils.get_recipe_upstream_version
>   distrodata: Use Python CSV instead of did by hand
>

This series is causing this error if I run core-image-sato -c checkpkgall:

ERROR: Error executing a python function in
/home/ross/Yocto/poky/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'do_checkpkg', lineno: 126, function: <module>
     0122:            f.close()
     0123:        bb.utils.unlockfile(lf)
     0124:
     0125:
 *** 0126:do_checkpkg(d)
     0127:
File: 'do_checkpkg', lineno: 87, function: do_checkpkg
     0083:        """Set upstream version status"""
     0084:        if not pupver:
     0085:            pupver =3D "N/A"
     0086:        else:
 *** 0087:            pv, _, _ =3D
oe.recipeutils.get_recipe_pv_without_srcpv(pversion, uri_type)
     0088:            upv, _, _ =3D
oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
     0089:
     0090:            cmp =3D vercmp_string(pv, upv)
     0091:            if cmp =3D=3D -1:
File: '/home/ross/Yocto/poky/meta/lib/oe/recipeutils.py', lineno: 641,
function: get_recipe_pv_without_srcpv
     0637:    pfx =3D ''
     0638:    sfx =3D ''
     0639:
     0640:    if uri_type =3D=3D 'git':
 *** 0641:        rd_tmp =3D rd.createCopy()
     0642:
     0643:        rd_tmp.setVar('SRCPV', '')
     0644:        pv =3D rd_tmp.getVar('PV', True)
     0645:
Exception: AttributeError: 'str' object has no attribute 'createCopy'

Ross

--001a11c135f66146de0517b36826
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 June 2015 at 20:49, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":17z" c=
lass=3D"" style=3D"overflow:hidden">An=C3=ADbal Lim=C3=B3n (4):<br>
=C2=A0 recipeutils: Add get_recipe_upstream_version and<br>
=C2=A0 =C2=A0 get_recipe_pv_without_srcpv functions<br>
=C2=A0 distrodata: Remove unnecessary include of package_regex.inc<br>
=C2=A0 distrodata: checkpkg make usage of<br>
=C2=A0 =C2=A0 oe.recipeutils.get_recipe_upstream_version<br>
=C2=A0 distrodata: Use Python CSV instead of did by hand<br></div></blockqu=
ote><div><br></div><div>This series is causing this error if I run core-ima=
ge-sato -c checkpkgall:</div><div><br></div><div>ERROR: Error executing a p=
ython function in /home/ross/Yocto/poky/meta/recipes-graphics/xorg-lib/<a h=
ref=3D"http://libxcalibrate_git.bb">libxcalibrate_git.bb</a>:</div><div><br=
></div><div>The stack trace of python calls that resulted in this exception=
/failure was:</div><div>File: &#39;do_checkpkg&#39;, lineno: 126, function:=
 &lt;module&gt;</div><div>=C2=A0 =C2=A0 =C2=A00122: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0f.close()</div><div>=C2=A0 =C2=A0 =C2=A00123: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bb.utils.unlockfile(lf)</div><div>=C2=A0 =C2=A0 =C2=A00=
124:</div><div>=C2=A0 =C2=A0 =C2=A00125:</div><div>=C2=A0*** 0126:do_checkp=
kg(d)</div><div>=C2=A0 =C2=A0 =C2=A00127:</div><div>File: &#39;do_checkpkg&=
#39;, lineno: 87, function: do_checkpkg</div><div>=C2=A0 =C2=A0 =C2=A00083:=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Set upstream version status&q=
uot;&quot;&quot;</div><div>=C2=A0 =C2=A0 =C2=A00084: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if not pupver:</div><div>=C2=A0 =C2=A0 =C2=A00085: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pupver =3D &quot;N/A&quot;</div><div>=C2=A0 =C2=A0 =
=C2=A00086: =C2=A0 =C2=A0 =C2=A0 =C2=A0else:</div><div>=C2=A0*** 0087: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pv, _, _ =3D oe.recipeutils.get_recip=
e_pv_without_srcpv(pversion, uri_type)</div><div>=C2=A0 =C2=A0 =C2=A00088: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0upv, _, _ =3D oe.recipeutils.get_r=
ecipe_pv_without_srcpv(pupver, uri_type)</div><div>=C2=A0 =C2=A0 =C2=A00089=
:</div><div>=C2=A0 =C2=A0 =C2=A00090: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cmp =3D vercmp_string(pv, upv)</div><div>=C2=A0 =C2=A0 =C2=A00091: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cmp =3D=3D -1:</div><div>File: =
&#39;/home/ross/Yocto/poky/meta/lib/oe/recipeutils.py&#39;, lineno: 641, fu=
nction: get_recipe_pv_without_srcpv</div><div>=C2=A0 =C2=A0 =C2=A00637: =C2=
=A0 =C2=A0pfx =3D &#39;&#39;</div><div>=C2=A0 =C2=A0 =C2=A00638: =C2=A0 =C2=
=A0sfx =3D &#39;&#39;</div><div>=C2=A0 =C2=A0 =C2=A00639:</div><div>=C2=A0 =
=C2=A0 =C2=A00640: =C2=A0 =C2=A0if uri_type =3D=3D &#39;git&#39;:</div><div=
>=C2=A0*** 0641: =C2=A0 =C2=A0 =C2=A0 =C2=A0rd_tmp =3D rd.createCopy()</div=
><div>=C2=A0 =C2=A0 =C2=A00642:</div><div>=C2=A0 =C2=A0 =C2=A00643: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0rd_tmp.setVar(&#39;SRCPV&#39;, &#39;&#39;)</div><div>=
=C2=A0 =C2=A0 =C2=A00644: =C2=A0 =C2=A0 =C2=A0 =C2=A0pv =3D rd_tmp.getVar(&=
#39;PV&#39;, True)</div><div>=C2=A0 =C2=A0 =C2=A00645:</div><div>Exception:=
 AttributeError: &#39;str&#39; object has no attribute &#39;createCopy&#39;=
</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c135f66146de0517b36826--

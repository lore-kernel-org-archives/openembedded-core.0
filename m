Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web10.23198.1629722069027163731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=slqoRJXO;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id b30so3723557vsj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=id2FME0/Z5dZSyP8Uxc/JjRxGV6fp/IqcDBcQF7AeCY=;
        b=slqoRJXO46GFalPdx8PyEtW3y1sASGSHHoTs3Ua8iHF8apdfQHj4TGWl3wiqg6134f
         djLKBiCyl4nIEn1tTxoPhWVRJFtqL6/8Z4hlr3RhUeb28a/vNZqSLxmDF/KQdTI+OJvR
         FCZGU1bnmWUb1qClfToKip6rKm92xGmG08ycDFAY8I3i02N7DbY2khacW5peBsm/1oV9
         XUvnDQzUex/lYfPfCKO/0FCFBh0AmHsqbTA4Q5/HDSRayRuQOAlm9W66B3QUE/qWeS0N
         kZPTMh4NYIgvX/DyWX68aGiY1EMKo18PUScC0O+dv/VnsGGJxBFF5ZK0+zPNa1CHFkRS
         4KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=id2FME0/Z5dZSyP8Uxc/JjRxGV6fp/IqcDBcQF7AeCY=;
        b=FjtSyPm7MY32xi78GT89zeEoYO54NumypfGf5nUM8TdMpAa+myGd486RL35PPITBjo
         yrvSyhlTvkwhr4e9ELnMW2aTOyhF5nTpAE9EjD8YpMLVf4N/h1KZA85mpDtaLlsQPueA
         EcjBIId5yz8hAKIoIcL9e4hmCJ9Q/NGH2YUsE4NqGp7F3IfVQQu0/YLqOMp2OCkcxQT9
         CUUIhMkcN+xLGmz4O4oW26DyIwQhIIXANJCy99fdQd65PR8+uVdmUwQ2Hi+aD0j44pzc
         iyKmOECrWn8huFhJhqIdahDcHAadZqB6N0rmMwYPc8ccLCBZPXGv6uruYlVP/fozhAtT
         DN0w==
X-Gm-Message-State: AOAM531A+Cwu0MnUXEBjESpmbrrAftB+RWHjJhIObOCOdJ32NUVmx0v2
	Y1zypuezCFLYfXbcIHss/lq9OH3O5jkLXRy6Kb4=
X-Google-Smtp-Source: ABdhPJyPHN3tEpcx3vO8sziC/lxbDU26x7shqH8VBHft1/JoNU/az3um8tb42SxEjkFC0exkMbCuoyzlRODUNYZW2TE=
X-Received: by 2002:a67:c792:: with SMTP id t18mr23916724vsk.54.1629722068188;
 Mon, 23 Aug 2021 05:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210823122323.97400-1-zboszor@pr.hu> <20210823122323.97400-2-zboszor@pr.hu>
In-Reply-To: <20210823122323.97400-2-zboszor@pr.hu>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 23 Aug 2021 14:34:16 +0200
Message-ID: <CANNYZj_VL-bxXG_mb-Z5QaWhHZvr4p+LVnvgODm84tRkSrFjEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] package_rpm.bbclass: Handle posttrans scriptlets
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: multipart/alternative; boundary="000000000000f5026905ca393c0c"

--000000000000f5026905ca393c0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This needs to be better documented and tested.

What does this posttrans thing really do?
Who would want to use it?
Can there be examples?
Can the Postinst test in meta/lib/oeqa/selftest/cases/runtime_test.py be
extended to regression-check that it works?

Alex

On Mon, 23 Aug 2021 at 14:23, Zoltan Boszormenyi via lists.openembedded.org
<zboszor=3Dpr.hu@lists.openembedded.org> wrote:

> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> The "posttrans" scriptlet is the RPM equivalent of the
> OPKG "intercept script" concept and probably a cleaner one.
>
> "pretrans" also exists in RPM but there's no equivalent
> for it in OPKG.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes/package_rpm.bbclass | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> index 88d861c0e7..5992d3fd06 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -308,10 +308,11 @@ python write_specfile () {
>      srcrconflicts  =3D ""
>      srcrobsoletes  =3D ""
>
> -    srcrpreinst  =3D []
> -    srcrpostinst =3D []
> -    srcrprerm    =3D []
> -    srcrpostrm   =3D []
> +    srcrpreinst   =3D []
> +    srcrpostinst  =3D []
> +    srcrprerm     =3D []
> +    srcrpostrm    =3D []
> +    srcrposttrans =3D []
>
>      spec_preamble_top =3D []
>      spec_preamble_bottom =3D []
> @@ -373,11 +374,11 @@ python write_specfile () {
>          splitrconflicts  =3D localdata.getVar('RCONFLICTS') or ""
>          splitrobsoletes  =3D ""
>
> -        splitrpreinst  =3D localdata.getVar('pkg_preinst')
> -        splitrpostinst =3D localdata.getVar('pkg_postinst')
> -        splitrprerm    =3D localdata.getVar('pkg_prerm')
> -        splitrpostrm   =3D localdata.getVar('pkg_postrm')
> -
> +        splitrpreinst   =3D localdata.getVar('pkg_preinst')
> +        splitrpostinst  =3D localdata.getVar('pkg_postinst')
> +        splitrprerm     =3D localdata.getVar('pkg_prerm')
> +        splitrpostrm    =3D localdata.getVar('pkg_postrm')
> +        splitrposttrans =3D localdata.getVar('pkg_posttrans')
>
>          if not perfiledeps:
>              # Add in summary of per file dependencies
> @@ -405,6 +406,7 @@ python write_specfile () {
>              srcrpostinst   =3D splitrpostinst
>              srcrprerm      =3D splitrprerm
>              srcrpostrm     =3D splitrpostrm
> +            srcrposttrans  =3D splitrposttrans
>
>              file_list =3D []
>              walk_files(root, file_list, conffiles, dirfiles)
> @@ -496,6 +498,11 @@ python write_specfile () {
>              scriptvar =3D wrap_uninstall(splitrpostrm)
>              spec_scriptlets_bottom.append(scriptvar)
>              spec_scriptlets_bottom.append('')
> +        if splitrposttrans:
> +            spec_scriptlets_bottom.append('%%posttrans -n %s' % splitnam=
e)
> +            spec_scriptlets_bottom.append('# %s - posttrans' % splitname=
)
> +            spec_scriptlets_bottom.append(splitrposttrans)
> +            spec_scriptlets_bottom.append('')
>
>          # Now process files
>          file_list =3D []
> @@ -590,6 +597,11 @@ python write_specfile () {
>          scriptvar =3D wrap_uninstall(srcrpostrm)
>          spec_scriptlets_top.append(scriptvar)
>          spec_scriptlets_top.append('')
> +    if srcrposttrans:
> +        spec_scriptlets_top.append('%posttrans')
> +        spec_scriptlets_top.append('# %s - posttrans' % srcname)
> +        spec_scriptlets_top.append(srcrposttrans)
> +        spec_scriptlets_top.append('')
>
>      # Write the SPEC file
>      specfile =3D open(outspecfile, 'w')
> --
> 2.31.1
>
>
>=20
>
>

--000000000000f5026905ca393c0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This needs to be better documented and tested. <br></=
div><div><br></div><div>What does this posttrans thing really do? <br></div=
><div>Who would want to use it? <br></div><div>Can there be examples? <br><=
/div><div>Can the Postinst test in meta/lib/oeqa/selftest/cases/runtime_tes=
t.py be extended to regression-check that it works?</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 23 Aug 2021 at 14:23, Zoltan Boszormenyi via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;zboszor=
=3D<a href=3D"mailto:pr.hu@lists.openembedded.org">pr.hu@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto:zbos=
zor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
<br>
The &quot;posttrans&quot; scriptlet is the RPM equivalent of the<br>
OPKG &quot;intercept script&quot; concept and probably a cleaner one.<br>
<br>
&quot;pretrans&quot; also exists in RPM but there&#39;s no equivalent<br>
for it in OPKG.<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/package_rpm.bbclass | 30 +++++++++++++++++++++---------<=
br>
=C2=A01 file changed, 21 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bb=
class<br>
index 88d861c0e7..5992d3fd06 100644<br>
--- a/meta/classes/package_rpm.bbclass<br>
+++ b/meta/classes/package_rpm.bbclass<br>
@@ -308,10 +308,11 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0srcrconflicts=C2=A0 =3D &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0srcrobsoletes=C2=A0 =3D &quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 srcrpreinst=C2=A0 =3D []<br>
-=C2=A0 =C2=A0 srcrpostinst =3D []<br>
-=C2=A0 =C2=A0 srcrprerm=C2=A0 =C2=A0 =3D []<br>
-=C2=A0 =C2=A0 srcrpostrm=C2=A0 =C2=A0=3D []<br>
+=C2=A0 =C2=A0 srcrpreinst=C2=A0 =C2=A0=3D []<br>
+=C2=A0 =C2=A0 srcrpostinst=C2=A0 =3D []<br>
+=C2=A0 =C2=A0 srcrprerm=C2=A0 =C2=A0 =C2=A0=3D []<br>
+=C2=A0 =C2=A0 srcrpostrm=C2=A0 =C2=A0 =3D []<br>
+=C2=A0 =C2=A0 srcrposttrans =3D []<br>
<br>
=C2=A0 =C2=A0 =C2=A0spec_preamble_top =3D []<br>
=C2=A0 =C2=A0 =C2=A0spec_preamble_bottom =3D []<br>
@@ -373,11 +374,11 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0splitrconflicts=C2=A0 =3D localdata.getVa=
r(&#39;RCONFLICTS&#39;) or &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0splitrobsoletes=C2=A0 =3D &quot;&quot;<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrpreinst=C2=A0 =3D localdata.getVar(&#39;=
pkg_preinst&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrpostinst =3D localdata.getVar(&#39;pkg_p=
ostinst&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrprerm=C2=A0 =C2=A0 =3D localdata.getVar(=
&#39;pkg_prerm&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrpostrm=C2=A0 =C2=A0=3D localdata.getVar(=
&#39;pkg_postrm&#39;)<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrpreinst=C2=A0 =C2=A0=3D localdata.getVar=
(&#39;pkg_preinst&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrpostinst=C2=A0 =3D localdata.getVar(&#39=
;pkg_postinst&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrprerm=C2=A0 =C2=A0 =C2=A0=3D localdata.g=
etVar(&#39;pkg_prerm&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrpostrm=C2=A0 =C2=A0 =3D localdata.getVar=
(&#39;pkg_postrm&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitrposttrans =3D localdata.getVar(&#39;pkg_=
posttrans&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not perfiledeps:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add in summary of per fil=
e dependencies<br>
@@ -405,6 +406,7 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcrpostinst=C2=A0 =C2=A0=
=3D splitrpostinst<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcrprerm=C2=A0 =C2=A0 =C2=
=A0 =3D splitrprerm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcrpostrm=C2=A0 =C2=A0 =C2=
=A0=3D splitrpostrm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcrposttrans=C2=A0 =3D splitrpo=
sttrans<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_list =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0walk_files(root, file_list,=
 conffiles, dirfiles)<br>
@@ -496,6 +498,11 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scriptvar =3D wrap_uninstal=
l(splitrpostrm)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spec_scriptlets_bottom.appe=
nd(scriptvar)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spec_scriptlets_bottom.appe=
nd(&#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if splitrposttrans:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_bottom.append(&#=
39;%%posttrans -n %s&#39; % splitname)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_bottom.append(&#=
39;# %s - posttrans&#39; % splitname)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_bottom.append(sp=
litrposttrans)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_bottom.append(&#=
39;&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Now process files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_list =3D []<br>
@@ -590,6 +597,11 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scriptvar =3D wrap_uninstall(srcrpostrm)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spec_scriptlets_top.append(scriptvar)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spec_scriptlets_top.append(&#39;&#39;)<br=
>
+=C2=A0 =C2=A0 if srcrposttrans:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_top.append(&#39;%posttrans&#39=
;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_top.append(&#39;# %s - posttra=
ns&#39; % srcname)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_top.append(srcrposttrans)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spec_scriptlets_top.append(&#39;&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Write the SPEC file<br>
=C2=A0 =C2=A0 =C2=A0specfile =3D open(outspecfile, &#39;w&#39;)<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f5026905ca393c0c--

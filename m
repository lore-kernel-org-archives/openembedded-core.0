Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CEC07E7D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:46:33 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id w20so7175544edd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JsX0ML1G5kK/n3VFUcMohcLYfjhBrq+2enBwRMq78hQ=;
	b=SClfm/CpJD3xbfiuKtOyJH44ga4uk/mNbfppwPMyRSqO/zQPL3cwvV1x8l0VXNhjGN
	2DyRJW3BTIdwbITpiX8ygoTgo1cyzVAzqMFlzuQ1NC3KgUJV3gODBt9e7N065s64t6Nd
	9Vvrx0RVmTR5RbKvhkX4eiY5zbOW/KhBuBv82seC2jjgU06WmWLF2Np8MZZbY1mSZ5uR
	YVBmiS7q3/KfxfwgisT6SC+gsmKKO9nr4sl0w2ze1OfXroPZ85I97q3+bSLUlJTrJ4oZ
	34dRxt5+QYFkNfje5Y0hCX0GuuKIJuahlTq1C+EfHtuMtR2Nnk5i3zbffF2IPKuC+F4D
	1+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JsX0ML1G5kK/n3VFUcMohcLYfjhBrq+2enBwRMq78hQ=;
	b=ny1t2o2jvPaDXhh6z20loaeTKRC5a7VlB+4FrqgNrS6c3Ph5h5CC4gH8X8vD57GJnl
	5wjaSfgtcN9AXGbnqIkB1OS8aozd2ColgAcaUhTIW7LQOnTksON8Umf1hPB7s/9EZqlO
	zgu6bEfNM83bhUG8OQj/xY4Ip17e5cAthdRPEUC4lUZQlL606kwayKp8LLwXta2kN3uy
	zcyXwqOP00jPIoFIylFtvUWzYEWQL4TerZqC/zOKBC6EMwc2QvzVeayXqwnVM4fji9xQ
	jYEqLYJWhjamJ+os0nF9/k1a3DO3NvofH3YUlzQkuPxny0F/9GLt54nN6ST7M2GgrhWb
	/RUg==
X-Gm-Message-State: APjAAAWWhQwTe0jrOEROqrPBNYVsipYp/8x56hzrZBaZrUzXvM6Qv22V
	6a0xCsNYIX3o7UgKocbSLPxB1ZnzdxA5F3CHsO0=
X-Google-Smtp-Source: APXvYqzFvT5+FLVi2IL8VAkaitLu0bzJdiyZEy+6dEZjQGanH+HLGjGz+MToFaZmU2Htb9y+0U02J2t0vClXcFOFuKY=
X-Received: by 2002:a17:906:3e86:: with SMTP id
	a6mr3306299ejj.254.1561643193982; 
	Thu, 27 Jun 2019 06:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190627122854.28435-1-ross.burton@intel.com>
In-Reply-To: <20190627122854.28435-1-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Jun 2019 15:46:22 +0200
Message-ID: <CA+chaQcv680W=MSioGdQAM-deSYn4ghkFqGEs3OG3x3AhQEdyw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] buildhistory: write the contents of the sysroot
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
X-List-Received-Date: Thu, 27 Jun 2019 13:46:33 -0000
Content-Type: multipart/alternative; boundary="000000000000d7e51b058c4e6343"

--000000000000d7e51b058c4e6343
Content-Type: text/plain; charset="UTF-8"

> Changes to the sysroot as just as

small typo in commit message if you need to update this commit again for
whatever other reason.

On Thu, Jun 27, 2019 at 2:29 PM Ross Burton <ross.burton@intel.com> wrote:

> Changes to the sysroot as just as interesting during development, so write
> the
> file listing for the sysroot to buildhistory too.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/buildhistory.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 2e501df24b4..baa7c8e2799 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -60,15 +60,23 @@ SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .= "|
> buildhistory_emit_outputsigs"
>  # When extending build history, derive your class from
> buildhistory.bbclass
>  # and extend this list here with the additional files created by the
> derived
>  # class.
> -BUILDHISTORY_PRESERVE = "latest latest_srcrev"
> +BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
>
>  PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
>  PATCH_GIT_USER_NAME ?= "OpenEmbedded"
>
> +buildhistory_emit_sysroot() {
> +       mkdir --parents ${BUILDHISTORY_DIR_PACKAGE}
> +       buildhistory_list_files ${SYSROOT_DESTDIR}
> ${BUILDHISTORY_DIR_PACKAGE}/sysroot
> +}
> +
>  #
>  # Write out metadata about this package for comparison when writing
> future packages
>  #
>  python buildhistory_emit_pkghistory() {
> +    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot',
> 'populate_sysroot_setscene']:
> +        bb.build.exec_func("buildhistory_emit_sysroot", d)
> +
>      if not d.getVar('BB_CURRENTTASK') in ['packagedata',
> 'packagedata_setscene']:
>          return 0
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d7e51b058c4e6343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Changes to the sysroot as just as<div><div><br></div>=
<div>small typo in commit message if you need to update this commit again f=
or whatever other reason.</div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 27, 2019 at 2:29 PM Ross B=
urton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Cha=
nges to the sysroot as just as interesting during development, so write the=
<br>
file listing for the sysroot to buildhistory too.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/buildhistory.bbclass | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass<br>
index 2e501df24b4..baa7c8e2799 100644<br>
--- a/meta/classes/buildhistory.bbclass<br>
+++ b/meta/classes/buildhistory.bbclass<br>
@@ -60,15 +60,23 @@ SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .=3D &quot;| =
buildhistory_emit_outputsigs&quot;<br>
=C2=A0# When extending build history, derive your class from buildhistory.b=
bclass<br>
=C2=A0# and extend this list here with the additional files created by the =
derived<br>
=C2=A0# class.<br>
-BUILDHISTORY_PRESERVE =3D &quot;latest latest_srcrev&quot;<br>
+BUILDHISTORY_PRESERVE =3D &quot;latest latest_srcrev sysroot&quot;<br>
<br>
=C2=A0PATCH_GIT_USER_EMAIL ?=3D &quot;buildhistory@oe&quot;<br>
=C2=A0PATCH_GIT_USER_NAME ?=3D &quot;OpenEmbedded&quot;<br>
<br>
+buildhistory_emit_sysroot() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir --parents ${BUILDHISTORY_DIR_PACKAGE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buildhistory_list_files ${SYSROOT_DESTDIR} ${BU=
ILDHISTORY_DIR_PACKAGE}/sysroot<br>
+}<br>
+<br>
=C2=A0#<br>
=C2=A0# Write out metadata about this package for comparison when writing f=
uture packages<br>
=C2=A0#<br>
=C2=A0python buildhistory_emit_pkghistory() {<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;populate_sysr=
oot&#39;, &#39;populate_sysroot_setscene&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;buildhistory_emit_sys=
root&quot;, d)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if not d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;pack=
agedata&#39;, &#39;packagedata_setscene&#39;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
<br>
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
</blockquote></div>

--000000000000d7e51b058c4e6343--

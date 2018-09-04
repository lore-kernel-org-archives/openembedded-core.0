Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id DBD5D65CE8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:44:38 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t25-v6so3572441wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jEbLQZQAliwBkkwnpf04I+zdHLJN6URQRfjOuY5Uevo=;
	b=KCOVrFn4QpCwBTeT+tF2QME5s4fXLGMI4kXN3yFj3y2vejv3nxh3/G3B4L5waG/UwZ
	v9FA3uxJMc9SjJ9WeqJgzgR6FK7tzOGIJDrb/YhReyXFpaPN3H3GimLFzc45HCRqXCC4
	eQnS/qnsY6N4eYmJ9zO6V1yGz+slQcU87mIgXzRetSjA/a1gCMR810R7DAXvCMdYLYkQ
	2WkuGP2+J1ykWvNaIXDfjAVEhLm4F6MKj9bg3ZzmUf4KMarM4pWOEYoep3onX64przME
	o1GhjItaqN0LVTMVIw5H4u2CKGz3LD8em/4UzPddt35NI7EyApYgKm1CyP9nVfUrnHmN
	Az7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jEbLQZQAliwBkkwnpf04I+zdHLJN6URQRfjOuY5Uevo=;
	b=cNzmLQD3XGXTliBs+bpcJ3DDnj0ZD2eTjPEHxthkvwM0RA3ymYQ7j8kbvOAOHhVEGF
	ae4CJTZobN8WycPetAP+N+EBSoB05D1biiuKrFnpBAKucVzl6aGBtvFHh13otP93Yp39
	0pFzUYGm+t9GYc8dXu9BqVGFHiMDwEVn1okTyyEt7gV2KmnebZ0fTtHM7Q8H1mqWFOH+
	qf1Xj/Rnzxvo6wTmn2zac/pDO4OcxzN9FTqzwStQ4z+XU5bn9LwY22jjaQ0MDIAb20eB
	RXycrENWWkVBWCAgTJR5oPaeCjjWEyG4o+nEo3oOMUwWi6xIdmm4TMH4q2sAoMhP75oA
	vwhw==
X-Gm-Message-State: APzg51BrNNTVvwUuIFCCS7DE8NPS0+hvZ19jEpXN8cqjvCAGu26BdTDZ
	sxmm8phG4r7tgHWMWcjQ4DHUjcxWsAhKWFEiyJLjz0xN
X-Google-Smtp-Source: ANB0VdbZtbfMjgq442zD9ZNStwrY3+aqlNEeAZ04xDhsLE+KJ0DsGKwm4gQ06tBGfeErX4CA413GeNL45yUBLAECvBw=
X-Received: by 2002:a1c:c203:: with SMTP id s3-v6mr2043155wmf.65.1536054279419;
	Tue, 04 Sep 2018 02:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535216766.git.kai.kang@windriver.com>
	<55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
In-Reply-To: <55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Sep 2018 11:44:28 +0200
Message-ID: <CA+chaQfurea5vwojwt6fgzNvhUfRDF9HmPf_YFBhgEGhQPO2dA@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] update_font_cache: update script for multilib
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
X-List-Received-Date: Tue, 04 Sep 2018 09:44:39 -0000
Content-Type: multipart/alternative; boundary="000000000000ae3b8b057508816f"

--000000000000ae3b8b057508816f
Content-Type: text/plain; charset="UTF-8"

Hi Kai,

do you have similar fix for update_gio_module_cache intercept? It seems to
fail similarly with multilib enabled.

Regards,

On Sat, Aug 25, 2018 at 7:14 PM Kai Kang <kai.kang@windriver.com> wrote:

> Packages which inherit fontcache.bbclass call postinstall script
> update_font_cache. And in update_font_cache, it calls ${bindir}/fc-cache
> by qemuwrapper. When multilib is enabled, both packages foo and lib32-foo
> will call ${bindir}/fc-cache and one of them will fail to run obviously.
>
> Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and
> call proper fc-cache in update_font_cache.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 8 +++++++-
>  scripts/postinst-intercepts/update_font_cache         | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> index d4cbce80b45..db36c867741 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> @@ -35,9 +35,15 @@ do_configure_prepend() {
>      rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
>  }
>
> +do_install_append_class-target() {
> +    # duplicate fc-cache for postinstall script
> +    mkdir -p ${D}${libexecdir}
> +    cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
> +}
> +
>  PACKAGES =+ "fontconfig-utils"
>  FILES_${PN} =+ "${datadir}/xml/*"
> -FILES_fontconfig-utils = "${bindir}/*"
> +FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"
>
>  # Work around past breakage in debian.bbclass
>  RPROVIDES_fontconfig-utils = "libfontconfig-utils"
> diff --git a/scripts/postinst-intercepts/update_font_cache
> b/scripts/postinst-intercepts/update_font_cache
> index 20e9048adfc..e0ec471964c 100644
> --- a/scripts/postinst-intercepts/update_font_cache
> +++ b/scripts/postinst-intercepts/update_font_cache
> @@ -2,5 +2,5 @@
>
>  set -e
>
> -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv}
> $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
> +PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv}
> $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only
> ${fontconfigcacheparams}
>  chown -R root:root $D${fontconfigcachedir}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ae3b8b057508816f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Kai,<div><br></div><div>do you have si=
milar fix for=C2=A0update_gio_module_cache intercept? It seems to fail simi=
larly with multilib enabled.</div><div><br></div><div>Regards,</div></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Aug 25, 2018 a=
t 7:14 PM Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@w=
indriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Package=
s which inherit fontcache.bbclass call postinstall script<br>
update_font_cache. And in update_font_cache, it calls ${bindir}/fc-cache<br=
>
by qemuwrapper. When multilib is enabled, both packages foo and lib32-foo<b=
r>
will call ${bindir}/fc-cache and one of them will fail to run obviously.<br=
>
<br>
Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and<br>
call proper fc-cache in update_font_cache.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.12.6.=
bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</a> | 8 +++++=
++-<br>
=C2=A0scripts/postinst-intercepts/update_font_cache=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_=
2.12.6.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</a> b/=
meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.12.6.bb" re=
l=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</a><br>
index d4cbce80b45..db36c867741 100644<br>
--- a/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.12.6.=
bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</a><br>
+++ b/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.12.6.=
bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</a><br>
@@ -35,9 +35,15 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf<b=
r>
=C2=A0}<br>
<br>
+do_install_append_class-target() {<br>
+=C2=A0 =C2=A0 # duplicate fc-cache for postinstall script<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${libexecdir}<br>
+=C2=A0 =C2=A0 cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-ca=
che<br>
+}<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;fontconfig-utils&quot;<br>
=C2=A0FILES_${PN} =3D+ &quot;${datadir}/xml/*&quot;<br>
-FILES_fontconfig-utils =3D &quot;${bindir}/*&quot;<br>
+FILES_fontconfig-utils =3D &quot;${bindir}/* ${libexecdir}/*&quot;<br>
<br>
=C2=A0# Work around past breakage in debian.bbclass<br>
=C2=A0RPROVIDES_fontconfig-utils =3D &quot;libfontconfig-utils&quot;<br>
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postin=
st-intercepts/update_font_cache<br>
index 20e9048adfc..e0ec471964c 100644<br>
--- a/scripts/postinst-intercepts/update_font_cache<br>
+++ b/scripts/postinst-intercepts/update_font_cache<br>
@@ -2,5 +2,5 @@<br>
<br>
=C2=A0set -e<br>
<br>
-PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $=
D${bindir}/fc-cache --sysroot=3D$D --system-only ${fontconfigcacheparams}<b=
r>
+PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $=
D${libexecdir}/${binprefix}fc-cache --sysroot=3D$D --system-only ${fontconf=
igcacheparams}<br>
=C2=A0chown -R root:root $D${fontconfigcachedir}<br>
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

--000000000000ae3b8b057508816f--

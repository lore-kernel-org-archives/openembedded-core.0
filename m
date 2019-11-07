Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id EF14C7F639
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 12:27:00 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id m6so1122372vsn.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 04:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=83rY5p9+2WAkUh+dsVaa0XOA9Fc4cXaxnNojmWBhaPA=;
	b=V/mnWfzj2EjzTZTTR6dgvbSlA0PhaIt37zWnrodL5UDSLhQUQZZJ0I0GpoFdryUhoT
	F+JoTmT8XOGrLcJje5DbvSM1m1tEP+RW5+3FxHY/8s3monFruk/oGLs5rC8btRukiiOV
	omlvHXnFIJkH1cUbnZb36W1Eiso9baqtzbvQclvZC5oafU5rQn7s5hfaBOsOixpnqXrO
	AtOHxa+JyzbHTLSiAIhwfwUvD/vEwd9L9beB8GGdpqB9LHdQghRgswUHv7BZIyZAcNga
	IoQOzS3ZmqYM2Lu0F018rGkd+9RCL97oTqEtoGsGnTudkmVUQKcvwlfXMapq99WhFuq9
	5iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=83rY5p9+2WAkUh+dsVaa0XOA9Fc4cXaxnNojmWBhaPA=;
	b=YiO4RpdAuUaBR/TbAX80HQybfiKdxJMwZVgq7pHHD5vVOiMiYu89Gw14+TJpii26h8
	PLUmOLUIEwQatIQrFz97hFXz5zZ/r3W/UEkguh+M6VlNFiI1qsbA343cIdHT63CxrYre
	5PspaUGJLQbMH7oXJG957XYR945MPKG1mwBXELjtzUA0uZBI0W/nxHZOld/GfFtmeQvD
	lSB2maAZp9+rHoSlbzDiCGf9lnyiohHqmPuFGHg5Pe6a7JRIaabr+fW4jahIP1o0Kp+q
	4BR1Eax4x2clXjQhUknuqn5LeUaiIaalo2dJo4wLDwmav6aRVHr6Leb7mQlfbtXTzpVY
	G04A==
X-Gm-Message-State: APjAAAXsyk3IsCJK9jc+LJBHCna5MjqPmPKJg53NbUM2xLk+H8mEjVp8
	/fKLXYg4cHIxpLKZ1VhRXoJi5WCo4oIWrHSU4tCSf3+p
X-Google-Smtp-Source: APXvYqw9cMgvAyGhue89UEJQK0tpBMeUNcQUW+s1sqL3yEBFcrshOW2JmMPG51/6mNscfGjFapg7Zs6EGYGHbRXinoQ=
X-Received: by 2002:a67:ea5a:: with SMTP id r26mr2577792vso.94.1573129621850; 
	Thu, 07 Nov 2019 04:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20191107094033.33950-1-git@andred.net>
In-Reply-To: <20191107094033.33950-1-git@andred.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Nov 2019 13:26:50 +0100
Message-ID: <CANNYZj_Ph4M_cVFQXaWpgPExhnkjntYUOm_8Zio7APmtkP_Tgw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: enable OpenSSL unconditionally and update packaging
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
X-List-Received-Date: Thu, 07 Nov 2019 12:27:01 -0000
Content-Type: multipart/alternative; boundary="0000000000004bd0190596c0c843"

--0000000000004bd0190596c0c843
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would rather keep the option to disable openssl, but simply switch it on
by default.

Alex

On Thu, 7 Nov 2019 at 13:11, Andr=C3=A9 Draszik <git@andred.net> wrote:

> The original commit describes the reason for disabling openssl
> so as to get 'more deterministic build[s]' and size-reduction:
> commit 6c36fde6ce2e ("libevent: disable openssl by default"),
> commit ad130b97a51a in poky.
>
> Since the introduction of per-recipe sysroots, we always have
> deterministic builds.
>
> Size reduction can be achieved by splitting the package into
> multiple sub-packages, which each only provide one of the
> shared libraries.
>
> Hence there appears no reason anymore to disable OpenSSL
> support.
>
> Because this recipe only provides shared libraries which are
> handled automatically by bitbake, there is no need to add
> the subpackages to the RDEPENDS of PN for backwards
> compatibility. The packageing process of dependees will
> simply pull in the sub-packages as runtime dependency as
> needed.
>
> This also how Debian splits this up.
>
> While updating the packaging, we can also drop event_rpcgen.py
> which appears to be a tool for generating rpc bindings, i.e.
> something that should normally be in -dev. Given Debian
> doesn't package this at all, and given it actually requires
> python to run but no runtime dependency is stated at the
> moment, it would appear that no users of this exist.
>
> These changes also allow us to build all of nghttp2
> out-of-the-box, without affecting existing users.
>
> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ---
>  meta/recipes-support/libevent/libevent_2.1.11.bb | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb
> b/meta/recipes-support/libevent/libevent_2.1.11.bb
> index f005ab8bda..c746f22118 100644
> --- a/meta/recipes-support/libevent/libevent_2.1.11.bb
> +++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
> @@ -19,9 +19,6 @@ UPSTREAM_CHECK_URI =3D "http://libevent.org/"
>
>  S =3D "${WORKDIR}/${BPN}-${PV}-stable"
>
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> -
>  inherit autotools
>
>  # Needed for Debian packaging
> @@ -29,11 +26,19 @@ LEAD_SONAME =3D "libevent-2.1.so"
>
>  inherit ptest multilib_header
>
> -DEPENDS =3D "zlib"
> +DEPENDS =3D "openssl zlib"
> +
> +PACKAGES =3D+ "${PN}-core ${PN}-extra ${PN}-openssl ${PN}-pthreads"
> +FILES_${PN}-core =3D "${libdir}/libevent_core*${SOLIBS}"
> +FILES_${PN}-extra =3D "${libdir}/libevent_extra*${SOLIBS}"
> +FILES_${PN}-openssl =3D "${libdir}/libevent_openssl*${SOLIBS}"
> +FILES_${PN}-pthreads =3D "${libdir}/libevent_pthreads-*${SOLIBS}"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  do_install_append() {
> +       rm ${D}${bindir}/event_rpcgen.py
> +       rmdir ${D}${bindir}
>          oe_multilib_header event2/event-config.h
>  }
>
> --
> 2.23.0.rc1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004bd0190596c0c843
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would rather keep the option to disable openssl, bu=
t simply switch it on by default.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, 7 Nov 2019 at 13:11, Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@and=
red.net">git@andred.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">The original commit describes the reason for disabli=
ng openssl<br>
so as to get &#39;more deterministic build[s]&#39; and size-reduction:<br>
commit 6c36fde6ce2e (&quot;libevent: disable openssl by default&quot;),<br>
commit ad130b97a51a in poky.<br>
<br>
Since the introduction of per-recipe sysroots, we always have<br>
deterministic builds.<br>
<br>
Size reduction can be achieved by splitting the package into<br>
multiple sub-packages, which each only provide one of the<br>
shared libraries.<br>
<br>
Hence there appears no reason anymore to disable OpenSSL<br>
support.<br>
<br>
Because this recipe only provides shared libraries which are<br>
handled automatically by bitbake, there is no need to add<br>
the subpackages to the RDEPENDS of PN for backwards<br>
compatibility. The packageing process of dependees will<br>
simply pull in the sub-packages as runtime dependency as<br>
needed.<br>
<br>
This also how Debian splits this up.<br>
<br>
While updating the packaging, we can also drop event_rpcgen.py<br>
which appears to be a tool for generating rpc bindings, i.e.<br>
something that should normally be in -dev. Given Debian<br>
doesn&#39;t package this at all, and given it actually requires<br>
python to run but no runtime dependency is stated at the<br>
moment, it would appear that no users of this exist.<br>
<br>
These changes also allow us to build all of nghttp2<br>
out-of-the-box, without affecting existing users.<br>
<br>
Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net" tar=
get=3D"_blank">git@andred.net</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.11.bb" r=
el=3D"noreferrer" target=3D"_blank">libevent_2.1.11.bb</a> | 13 +++++++++--=
--<br>
=C2=A01 file changed, 9 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.1=
1.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.11.bb</a> b/meta/re=
cipes-support/libevent/<a href=3D"http://libevent_2.1.11.bb" rel=3D"norefer=
rer" target=3D"_blank">libevent_2.1.11.bb</a><br>
index f005ab8bda..c746f22118 100644<br>
--- a/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.11.bb" r=
el=3D"noreferrer" target=3D"_blank">libevent_2.1.11.bb</a><br>
+++ b/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.11.bb" r=
el=3D"noreferrer" target=3D"_blank">libevent_2.1.11.bb</a><br>
@@ -19,9 +19,6 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://libevent.o=
rg/" rel=3D"noreferrer" target=3D"_blank">http://libevent.org/</a>&quot;<br=
>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}-${PV}-stable&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-PACKAGECONFIG[openssl] =3D &quot;--enable-openssl,--disable-openssl,openss=
l&quot;<br>
-<br>
=C2=A0inherit autotools<br>
<br>
=C2=A0# Needed for Debian packaging<br>
@@ -29,11 +26,19 @@ LEAD_SONAME =3D &quot;<a href=3D"http://libevent-2.1.so=
" rel=3D"noreferrer" target=3D"_blank">libevent-2.1.so</a>&quot;<br>
<br>
=C2=A0inherit ptest multilib_header<br>
<br>
-DEPENDS =3D &quot;zlib&quot;<br>
+DEPENDS =3D &quot;openssl zlib&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-core ${PN}-extra ${PN}-openssl ${PN}-pthreads&qu=
ot;<br>
+FILES_${PN}-core =3D &quot;${libdir}/libevent_core*${SOLIBS}&quot;<br>
+FILES_${PN}-extra =3D &quot;${libdir}/libevent_extra*${SOLIBS}&quot;<br>
+FILES_${PN}-openssl =3D &quot;${libdir}/libevent_openssl*${SOLIBS}&quot;<b=
r>
+FILES_${PN}-pthreads =3D &quot;${libdir}/libevent_pthreads-*${SOLIBS}&quot=
;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0do_install_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${bindir}/event_rpcgen.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header event2/event-config.h<=
br>
=C2=A0}<br>
<br>
-- <br>
2.23.0.rc1<br>
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

--0000000000004bd0190596c0c843--

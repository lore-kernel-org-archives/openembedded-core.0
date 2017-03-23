Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id DDBF072F7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 07:38:27 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id d191so14160030ywe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aB/sdACNMvc46fchpkjz+6mj/xrlyEODyH0z3jS7Zto=;
	b=oXXtrSby8CldiZ0YfJL+bEde6ZAkDvEtXxFyEaRGeahCevaHWBF5C5/EkGXHAdwC1W
	fESB0EyycHJfeEZwDwSqrLyjXfC7OEZUJbZLHp9zx7z1qXCwBmH0BH+QOIM90uVEQoLk
	9N2WWMJvHLgAGSAUOAWNGVMu1Z4Fxar1NikZd5PBrKwX3yf863ypodUmSrS9owbpiwQw
	KHf6ID6zf0leoQKv6vksZjjdzoYUes43L2p3zEW15f3eFSnuzODmhNSqIZumQ/vHdTKu
	fXwXhqWB+hp4q8bfymCRob1Nl9WjEucZGmrCple6qyE34uXW8Phw5fhkRvyZ9TdO67El
	OOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aB/sdACNMvc46fchpkjz+6mj/xrlyEODyH0z3jS7Zto=;
	b=Dw77xJfPyny5pEc2uOI97t5NH8KSLkH0/E4l2MYmIrgj3ZugXXnY4YPrNJBc7+3SgY
	psL5asakG+5Ve7tY7Oqxh9iHYLZI3QEIbpG1Xj8qcQd3NhiZVm/oW0uYfNFwct+xehu8
	7Az1LKt1b2emudKKNRMbhLmMQIHo+qN0Df90jjv1q4lZUA6GUASbHACyvy6o8TdogT0b
	vLaU3NerfCi8/pt2IyllDPpY6KNfz0L5+6MnA2sj5oMs9a93G5UlTaiA5CiXKIO7mxy0
	W1AbKs+AbPi9A9jb2U9CA9xU/KFz0lOK4ofCpBz2NFmUz3IAKM9Z9ejT+aunxk1wxTdp
	ATHA==
X-Gm-Message-State: AFeK/H3cdbWiLW5IBC9qXXLl7MQPn2QrP6U9pyi/fbV6FuP6dzhIGLFwirYEybSA1wRJt1c8IInqGNmO+THFHXcE
X-Received: by 10.129.87.132 with SMTP id l126mr772273ywb.167.1490254708585;
	Thu, 23 Mar 2017 00:38:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.206.131 with HTTP; Thu, 23 Mar 2017 00:37:58 -0700 (PDT)
In-Reply-To: <1490213829.15509.26.camel@intel.com>
References: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
	<CAHiDW_FBnKy7Nx_G70zgXvTbJCXMy+uY0d1QUJk-ja3Z-gmw4A@mail.gmail.com>
	<1490213829.15509.26.camel@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 23 Mar 2017 09:37:58 +0200
Message-ID: <CAHiDW_GZuxuq9JHmsQ4aHM8M6iiFbz3-5yg9fhimD+LmC=xq1Q@mail.gmail.com>
To: "Patel, Vedang" <vedang.patel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Thu, 23 Mar 2017 07:38:29 -0000
Content-Type: multipart/alternative; boundary=001a1146269a87cbe1054b60f666

--001a1146269a87cbe1054b60f666
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 22:17, Patel, Vedang <vedang.patel@intel.com> wrote:
>
> Hi Jussi,
>

Hi Vedang,

If you can make your email client use ">" for quoting that would be great
(so it's possible to see who's talking even in plain text).

PACKAGECONFIG comments below.

> On Tue, 2017-03-21 at 08:36 +0000, Kukkonen, Jussi wrote:
> On 21 March 2017 at 02:31, Vedang Patel <vedang.patel@intel.com<mailto:
vedang.patel@intel.com>> wrote:
> Some options like python bindings, debug support, crypto are hardcoded
> inside the recipe. Change that to make those option configurable using
> PACKAGECONFIG.
>
> Signed-off-by: Vedang Patel <vedang.patel@intel.com<mailto:
vedang.patel@intel.com>>
> ---
>  meta/recipes-support/libxslt/libxslt_1.1.29.bb<http://libxslt_1.1.29.bb>
| 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb<
http://libxslt_1.1.29.bb> b/meta/recipes-support/libxslt/libxslt_1.1.29.bb<
http://libxslt_1.1.29.bb>
> index be747e608d9d..d362118aa307 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb<
http://libxslt_1.1.29.bb>
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb<
http://libxslt_1.1.29.bb>
> @@ -22,7 +22,7 @@ S = "${WORKDIR}/libxslt-${PV}"
>
>  BINCONFIG = "${bindir}/xslt-config"
>
> -inherit autotools pkgconfig binconfig-disabled lib_package
> +inherit autotools pkgconfig binconfig-disabled lib_package
distutils-common-base
>
>  # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the
header
>  do_configure_prepend () {
> @@ -33,7 +33,12 @@ do_configure_prepend () {
>         touch ${S}/doc/xsltproc.1
>  }
>
> -EXTRA_OECONF = "--without-python --without-debug --without-mem-debug
--without-crypto"
> +PACKAGECONFIG ??= "python libxslt-debug libxslt-mem-debug libxslt-crypto"
>
>
> You change all the defaults, is this on purpose? It should be noted in
the commit message in any case.
>
> Can you elabore on your concern? I am not exactly following it.
>
> the configs won't be enabled unless the corresponding features are
explicitly enabled in the image. I am using libxslt- prefix to make sure
someone does not inadvertently enables the features by using the generic
flags (python, debug, ... ).
>There seems to be some confusion here.

I think there's some confusion here about PACKAGECONFIG and image features:
PACKAGECONFIG is completely recipe specific -- it only controls this
recipe. There's no need to use a naming prefix as these variables are only
visible inside the recipe. Changing them from outside (like local.conf) is
possible but requires a syntax like
    PACKAGECONFIG_pn-libxslt = "python crypto"
so there's no need to fear namespace mixups.

Second, this line:
    PACKAGECONFIG ??= "python libxslt-debug libxslt-mem-debug
libxslt-crypto"
sets he default value of libxslt PACKAGECONFIG. Meaning that these options
will be given to configure:
    "--with-python=<ver> --with-debug --with-mem-debug --with-crypto"
Currently the EXTRA_OECONF line explicitly disables all these so this looks
like a change in defaults.

If in doubt (or I didn't make sense) you should run "bitbake -cconfigure
libxslt" with both versions and check what ends up in the configure options
in $WORKDIR/temp/log.do_configure.

Cheers,
  Jussi



> I do see a bug here, In the first line, python should be replaced with
libxslt-python. I will fix it in the next version of this patch.
>
> Thanks,
> Vedang Patel
> Software Engineer
> Intel Corporation
>
> +PACKAGECONFIG[libxslt-python] = "--with-python=${PYTHON_BASE_VERSION},
--without-python"
> +PACKAGECONFIG[libxslt-debug] = "--with-debug, --without-debug"
> +PACKAGECONFIG[libxslt-mem-debug] = "--with-mem-debug,
--without-mem-debug"
> +PACKAGECONFIG[libxslt-crypto] = "--with-crypto, --without-crypto"
> +
>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES_${PN}-bin += "${PN}-utils"
>  RCONFLICTS_${PN}-bin += "${PN}-utils"
> --
> 2.7.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<mailto:
Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1146269a87cbe1054b60f666
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 22 March 2017 at 22:17, Patel, Vedang &lt;<a href=3D"ma=
ilto:vedang.patel@intel.com">vedang.patel@intel.com</a>&gt; wrote:<br>&gt;<=
br>&gt; Hi Jussi,<br>&gt;<div><br></div><div>Hi Vedang,</div><div><br></div=
><div>If you can make your email client use &quot;&gt;&quot; for quoting th=
at would be great (so it&#39;s possible to see who&#39;s talking even in pl=
ain text).</div><div><br></div><div>PACKAGECONFIG comments below.</div><div=
><br>&gt; On Tue, 2017-03-21 at 08:36 +0000, Kukkonen, Jussi wrote:<br>&gt;=
 On 21 March 2017 at 02:31, Vedang Patel &lt;<a href=3D"mailto:vedang.patel=
@intel.com">vedang.patel@intel.com</a>&lt;mailto:<a href=3D"mailto:vedang.p=
atel@intel.com">vedang.patel@intel.com</a>&gt;&gt; wrote:<br>&gt; Some opti=
ons like python bindings, debug support, crypto are hardcoded<br>&gt; insid=
e the recipe. Change that to make those option configurable using<br>&gt; P=
ACKAGECONFIG.<br>&gt;<br>&gt; Signed-off-by: Vedang Patel &lt;<a href=3D"ma=
ilto:vedang.patel@intel.com">vedang.patel@intel.com</a>&lt;mailto:<a href=
=3D"mailto:vedang.patel@intel.com">vedang.patel@intel.com</a>&gt;&gt;<br>&g=
t; ---<br>&gt; =C2=A0meta/recipes-support/libxslt/<a href=3D"http://libxslt=
_1.1.29.bb">libxslt_1.1.29.bb</a>&lt;<a href=3D"http://libxslt_1.1.29.bb">h=
ttp://libxslt_1.1.29.bb</a>&gt; | 9 +++++++--<br>&gt; =C2=A01 file changed,=
 7 insertions(+), 2 deletions(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-=
support/libxslt/<a href=3D"http://libxslt_1.1.29.bb">libxslt_1.1.29.bb</a>&=
lt;<a href=3D"http://libxslt_1.1.29.bb">http://libxslt_1.1.29.bb</a>&gt; b/=
meta/recipes-support/libxslt/<a href=3D"http://libxslt_1.1.29.bb">libxslt_1=
.1.29.bb</a>&lt;<a href=3D"http://libxslt_1.1.29.bb">http://libxslt_1.1.29.=
bb</a>&gt;<br>&gt; index be747e608d9d..d362118aa307 100644<br>&gt; --- a/me=
ta/recipes-support/libxslt/<a href=3D"http://libxslt_1.1.29.bb">libxslt_1.1=
.29.bb</a>&lt;<a href=3D"http://libxslt_1.1.29.bb">http://libxslt_1.1.29.bb=
</a>&gt;<br>&gt; +++ b/meta/recipes-support/libxslt/<a href=3D"http://libxs=
lt_1.1.29.bb">libxslt_1.1.29.bb</a>&lt;<a href=3D"http://libxslt_1.1.29.bb"=
>http://libxslt_1.1.29.bb</a>&gt;<br>&gt; @@ -22,7 +22,7 @@ S =3D &quot;${W=
ORKDIR}/libxslt-${PV}&quot;<br>&gt;<br>&gt; =C2=A0BINCONFIG =3D &quot;${bin=
dir}/xslt-config&quot;<br>&gt;<br>&gt; -inherit autotools pkgconfig binconf=
ig-disabled lib_package<br>&gt; +inherit autotools pkgconfig binconfig-disa=
bled lib_package distutils-common-base<br>&gt;<br>&gt; =C2=A0# We don&#39;t=
 DEPEND on binutils for ansidecl.h so ensure we don&#39;t use the header<br=
>&gt; =C2=A0do_configure_prepend () {<br>&gt; @@ -33,7 +33,12 @@ do_configu=
re_prepend () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${S}/doc/xsltproc=
.1<br>&gt; =C2=A0}<br>&gt;<br>&gt; -EXTRA_OECONF =3D &quot;--without-python=
 --without-debug --without-mem-debug --without-crypto&quot;<br>&gt; +PACKAG=
ECONFIG ??=3D &quot;python libxslt-debug libxslt-mem-debug libxslt-crypto&q=
uot;<br>&gt;<br>&gt;<br>&gt; You change all the defaults, is this on purpos=
e? It should be noted in the commit message in any case.<br>&gt;<br>&gt; Ca=
n you elabore on your concern? I am not exactly following it.<br>&gt;<br>&g=
t; the configs won&#39;t be enabled unless the corresponding features are e=
xplicitly enabled in the image. I am using libxslt- prefix to make sure som=
eone does not inadvertently enables the features by using the generic flags=
 (python, debug, ... ).<br>&gt;There seems to be some confusion here.<br></=
div><div><br></div><div>I think there&#39;s some confusion here about PACKA=
GECONFIG and image features: PACKAGECONFIG is completely recipe specific --=
 it only controls this recipe. There&#39;s no need to use a naming prefix a=
s these variables are only visible inside the recipe. Changing them from ou=
tside (like local.conf) is possible but requires a syntax like</div><div>=
=C2=A0=C2=A0 =C2=A0PACKAGECONFIG_pn-libxslt =3D &quot;python crypto&quot;=
=C2=A0</div><div>so there&#39;s no need to fear namespace mixups.</div><div=
><br></div><div>Second, this line:=C2=A0</div><div>=C2=A0 =C2=A0 PACKAGECON=
FIG ??=3D &quot;python libxslt-debug libxslt-mem-debug libxslt-crypto&quot;=
<br></div><div>sets he default value of libxslt PACKAGECONFIG. Meaning that=
 these options will be given to configure:=C2=A0</div><div>=C2=A0 =C2=A0 &q=
uot;--with-python=3D&lt;ver&gt; --with-debug --with-mem-debug --with-crypto=
&quot;</div><div>Currently the EXTRA_OECONF line explicitly disables all th=
ese so this looks like a change in defaults.</div><div><br></div><div>If in=
 doubt (or I didn&#39;t make sense) you should run &quot;bitbake -cconfigur=
e libxslt&quot; with both versions and check what ends up in the configure =
options in $WORKDIR/temp/log.do_configure.</div><div><br></div><div>Cheers,=
</div><div>=C2=A0 Jussi</div><div><br></div><div><br></div><div><br></div><=
div>&gt; I do see a bug here, In the first line, python should be replaced =
with libxslt-python. I will fix it in the next version of this patch.</div>=
<div>&gt;<br></div><div>&gt; Thanks,<br>&gt; Vedang Patel<br>&gt; Software =
Engineer<br>&gt; Intel Corporation<br>&gt;<br>&gt; +PACKAGECONFIG[libxslt-p=
ython] =3D &quot;--with-python=3D${PYTHON_BASE_VERSION}, --without-python&q=
uot;<br>&gt; +PACKAGECONFIG[libxslt-debug] =3D &quot;--with-debug, --withou=
t-debug&quot;<br>&gt; +PACKAGECONFIG[libxslt-mem-debug] =3D &quot;--with-me=
m-debug, --without-mem-debug&quot;<br>&gt; +PACKAGECONFIG[libxslt-crypto] =
=3D &quot;--with-crypto, --without-crypto&quot;<br>&gt; +<br>&gt; =C2=A0# o=
lder versions of this recipe had ${PN}-utils<br>&gt; =C2=A0RPROVIDES_${PN}-=
bin +=3D &quot;${PN}-utils&quot;<br>&gt; =C2=A0RCONFLICTS_${PN}-bin +=3D &q=
uot;${PN}-utils&quot;<br>&gt; --<br>&gt; 2.7.3<br>&gt;<br>&gt; --<br>&gt; _=
______________________________________________<br>&gt; Openembedded-core ma=
iling list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.o=
rg">Openembedded-core@lists.openembedded.org</a>&lt;mailto:<a href=3D"mailt=
o:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openemb=
edded.org</a>&gt;<br>&gt; <a href=3D"http://lists.openembedded.org/mailman/=
listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/=
openembedded-core</a><br>&gt;<br>&gt;<br></div></div>

--001a1146269a87cbe1054b60f666--

Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHz5O-0005Xf-Ke
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:03:54 +0200
Received: by wibhm17 with SMTP id hm17so3810569wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=Nr5YLl01v40uB2Z9jSMLvjAHgp6C+rxppfYAo79jYDI=;
	b=CQgj9e/l9s7Any1y1PywAFjbjijMAZqVh3hhR6cSHW6yNRJm1YQaX8DVMsWnQwgICa
	7P/0pQuiMKPbui+CyyKSratMv7MWwvB5cx+Niv8Ky73J9e8ItlVOoVnO9fygNyxy0b/q
	HQ6B0lRaSEai6u5qlLBq5YYtCrOS/wFn3ODflAuxtfjlRDcaM3Icx/IyidgEC++9s59G
	o8G6iM81CGXt8EHXGconx8/fgmDLNsHKIfS20UypyEVUI+ddfUTV8f6J7E6mkTPte8oU
	swBLfHWKn4r5BWcE+48DanrhxdWPNqaU2T21reHy+1l16Wp57O0XwaahFCCfaUik40JE
	uAqg==
Received: by 10.180.76.240 with SMTP id n16mr16894606wiw.10.1334156075282;
	Wed, 11 Apr 2012 07:54:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Wed, 11 Apr 2012 07:54:15 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CA+chaQd=XHpTSX3xWrpsMJ+f8LaH1EEB__HpwN_9_QkfYHH5YQ@mail.gmail.com>
References: <cover.1334153781.git.andrei@gherzan.ro>
	<615f8201f2fb18a7e3e0e0c07febd57f788005ad.1334153781.git.andrei@gherzan.ro>
	<CA+chaQd=XHpTSX3xWrpsMJ+f8LaH1EEB__HpwN_9_QkfYHH5YQ@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 11 Apr 2012 17:54:15 +0300
Message-ID: <CAK18fxELtMkYA-LEBOJPR=mY1KMpKmiyU9KhdBc7ex=qedeDvA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn+7oio1kgvnv9R6XvULcwK9GZhyPRRQ6mk+/n3rUyXQG1wzMZRsvsJgwXNX6X7Id6qrYOd
Subject: Re: [PATCH 1/1] gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 15:03:54 -0000
Content-Type: multipart/alternative; boundary=f46d043c7b22f130b604bd686a72

--f46d043c7b22f130b604bd686a72
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 11, 2012 at 17:25, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Apr 11, 2012 at 4:18 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > ndbm.h is needed by python for dbm module. This is why
> -enable-libgdbm-compat was added
> > to configure.
> > The second change is because python is looking for the gdbm headers in
> include/gdbm.
> > The easiest way to solve this issue is to add symlinks in include/gdbm.
> >
> > In order to avoid breaking packages which depend on old package name
> libgdbm4 (>= 1.10),
> > compat libs are packaged into a separate package named gdbm-compat.
> >
> > [YOCTO #1937]
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-support/gdbm/gdbm_1.10.bb |   18 +++++++++++++++++-
> >  1 files changed, 17 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bbb/meta/recipes-support/gdbm/
> gdbm_1.10.bb
> > index 9b2fde4..40bdd86 100644
> > --- a/meta/recipes-support/gdbm/gdbm_1.10.bb
> > +++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
> > @@ -4,7 +4,7 @@ SECTION = "libs"
> >  LICENSE = "GPLv3"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
> >
> > -PR = "r1"
> > +PR = "r2"
> >
> >  SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
> >
> > @@ -13,4 +13,20 @@ SRC_URI[sha256sum] =
> "23f8134c5b94bbfb06d756a6b78f074fba6e6028cf2fe01341d40b26db
> >
> >  inherit autotools gettext lib_package
> >
> > +# Needed for dbm python module
> > +EXTRA_OECONF = "-enable-libgdbm-compat"
> > +
> >  BBCLASSEXTEND = "native nativesdk"
> > +
> > +do_install_append () {
> > +    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let
> other packages to find
> > +    # these headers
> > +    install -d ${D}${includedir}/gdbm
> > +    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
> > +    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
> > +}
> > +
>
> ^^ whole part above was already applied in
>
> http://git.openembedded.org/openembedded-core/commit/?id=e4d2ee00419f675ba8b7fb5d75256762253d8b32
>
>
>
Thanks. Didn't see that. Rebased.
@g

--f46d043c7b22f130b604bd686a72
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Apr 11, 2012 at 17:25, Martin Jansa <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Wed, Apr 11, 2012 at 4:18 PM, An=
drei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>=
&gt; wrote:<br>
&gt; ndbm.h is needed by python for dbm module. This is why -enable-libgdbm=
-compat was added<br>
&gt; to configure.<br>
&gt; The second change is because python is looking for the gdbm headers in=
 include/gdbm.<br>
&gt; The easiest way to solve this issue is to add symlinks in include/gdbm=
.<br>
&gt;<br>
&gt; In order to avoid breaking packages which depend on old package name l=
ibgdbm4 (&gt;=3D 1.10),<br>
&gt; compat libs are packaged into a separate package named gdbm-compat.<br=
>
&gt;<br>
&gt; [YOCTO #1937]<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.10.bb" target=3D=
"_blank">gdbm_1.10.bb</a> | =A0 18 +++++++++++++++++-<br>
&gt; =A01 files changed, 17 insertions(+), 1 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.10.bb"=
 target=3D"_blank">gdbm_1.10.bb</a> b/meta/recipes-support/gdbm/<a href=3D"=
http://gdbm_1.10.bb" target=3D"_blank">gdbm_1.10.bb</a><br>
&gt; index 9b2fde4..40bdd86 100644<br>
&gt; --- a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.10.bb" target=
=3D"_blank">gdbm_1.10.bb</a><br>
&gt; +++ b/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.10.bb" target=
=3D"_blank">gdbm_1.10.bb</a><br>
&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;libs&quot;<br>
&gt; =A0LICENSE =3D &quot;GPLv3&quot;<br>
&gt; =A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D241da1b9fe42e642cbb=
2c24d5e0c4d24&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r1&quot;<br>
&gt; +PR =3D &quot;r2&quot;<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz&quot;<br>
&gt;<br>
&gt; @@ -13,4 +13,20 @@ SRC_URI[sha256sum] =3D &quot;23f8134c5b94bbfb06d756=
a6b78f074fba6e6028cf2fe01341d40b26db<br>
&gt;<br>
&gt; =A0inherit autotools gettext lib_package<br>
&gt;<br>
&gt; +# Needed for dbm python module<br>
&gt; +EXTRA_OECONF =3D &quot;-enable-libgdbm-compat&quot;<br>
&gt; +<br>
&gt; =A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; +<br>
&gt; +do_install_append () {<br>
&gt; + =A0 =A0# Create a symlink to ndbm.h and gdbm.h in include/gdbm to le=
t other packages to find<br>
&gt; + =A0 =A0# these headers<br>
&gt; + =A0 =A0install -d ${D}${includedir}/gdbm<br>
&gt; + =A0 =A0ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h<br>
&gt; + =A0 =A0ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h<br>
&gt; +}<br>
&gt; +<br>
<br>
</div></div>^^ whole part above was already applied in<br>
<a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3De4d2e=
e00419f675ba8b7fb5d75256762253d8b32" target=3D"_blank">http://git.openembed=
ded.org/openembedded-core/commit/?id=3De4d2ee00419f675ba8b7fb5d75256762253d=
8b32</a><br>


<br><br></blockquote><div>=A0</div><div>Thanks. Didn&#39;t see that. Rebase=
d.=A0</div></div>@g

--f46d043c7b22f130b604bd686a72--

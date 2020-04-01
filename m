Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.2678.1585733940594265953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 02:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=pDwmSn4c;
 spf=pass (domain: googlemail.com, ip: 209.85.219.47, mailfrom: ayoub.zaki@googlemail.com)
Received: by mail-qv1-f47.google.com with SMTP id t4so8270869qvz.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NnvuCZg+AV2xu9RZEHN0jtD6spJothLzCV5PMDKKjn8=;
        b=pDwmSn4cbJWq0MYX8V16ygKzb0oU9cgwcAHqlQTQ8jGrZ3PKO4p6fndVyzyiN5MRq3
         PrKvaCR0TVUiko7yXjepdu3Jja9P01IuvYNuzryhd4SUAoPLylHb/sxVEV+46pyGt0SY
         1NKB93/qPShV5l702mik6UkO+K6wb/UZhYMPb7cBeJJKIoidvrubEPniGXbbsVCSOeDe
         9FxUupufZKIzmQF36gi6cM+n7cBSKHL+qxb3Ol3og3b7bxXcOHiDPigAq9/5Fi8vs2Sc
         atbvVBytIdTgGqEuEIuamUNveZQE+gYHeH0cghlu5Cq7ijdSfNbTbEQ6r8l284D5ajZi
         ymWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NnvuCZg+AV2xu9RZEHN0jtD6spJothLzCV5PMDKKjn8=;
        b=fyHGiBtqIRfW4gtDZLTHj41H2MN2YzfhYf8z/J43/58+9jTEyqrhalcD1Izcs0rTap
         FshX1DHDuIE364vsOCc6FkWtPQmZB5A7NK7/hqsvlKzd5QEhzBI8FqDKniVfFukL/5wR
         XX2OQeSX73BdN16nPg1hF1TFVM8l3SxEHT9Ex9F44GlvEODU/sh04HaSdHuqA/XQ72Lu
         rb9aGCD0yCz/BHd/4dMO5JoOGVXsE/1pbtZYickQpSOhO8VoU7SL3qhFByz6UvXJ2B09
         h0IMEBeRPKuhvw8O7aKVE9421AfnkKeoxAb5R6yW3TbQ0H2Xyd56Yj6sMq20/Vyfshbg
         GcsA==
X-Gm-Message-State: ANhLgQ2KqApz0EhtyyRvWFsYyNiplzXDhENfpEsTB4dMRUhHFmRoAc4a
	zdAEGryg9LNPP7qDGKf0kRUdE8XhJCp6qC/ariygMDAV
X-Google-Smtp-Source: ADFU+vtDToF1pzo5ipx1ES7cSIwrfFVOJhlTdrmklR9kmgnFKxKHqbPlojqc/TnJXU7HVlxMjpAL6pdzHVuud59mcx0=
X-Received: by 2002:a0c:db86:: with SMTP id m6mr19805643qvk.116.1585733939505;
 Wed, 01 Apr 2020 02:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200331151645.1030603-1-otavio@ossystems.com.br> <04006361-dc62-45a3-3cff-7f00004180e0@denx.de>
In-Reply-To: <04006361-dc62-45a3-3cff-7f00004180e0@denx.de>
From: "Ayoub Zaki" <ayoub.zaki@googlemail.com>
Date: Wed, 1 Apr 2020 11:38:48 +0200
Message-ID: <CA+-BmJagwwjtT9dy0TWvK7e73oihHL_Xs0zG-ObJdSQYm+K-1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: Restore valid default environment for running system
To: Stefano Babic <sbabic@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000002c322205a2377458"

--0000000000002c322205a2377458
Content-Type: text/plain; charset="UTF-8"

Hi,

it's very handy to have the environment file in the DEPLOY folder to for
example be able to integrate it to a WIC image.


BR

On Tue, Mar 31, 2020 at 5:32 PM Stefano Babic <sbabic@denx.de> wrote:

> Hi Otavio,
>
> On 31.03.20 17:16, Otavio Salvador wrote:
> > One significant change from previous OE-Core releases was the move from
> > u-boot-fw-utils to libubootenv which offers a generic and not machine
> > specific alternative. However, it is not fully functional as currently
> > we don't provide the default environment nor the required configuration
> > file to be used by it.
>
> Fully agree - it was on my TODO list, then forgotten. Thanks for fixing
> this !
>
> >
> > This change address this and include on the default u-boot.inc the
> > needed code to generate, install and deploy the default environment.
> >
> > The side effect of this change are:
> >
> > - new ${PN}-env
>
> Agree.
>
> > - u-boot-initial-env on deploy
> > - fw_env.config on deploy
>
> Why do we need both of them in deploy ? For making system functional, we
> just need that both files are in /etc, that is ${PN}-env must be
> installed (and then you set RRECOMMENDS). But why in deploy ? Am I
> missing something ?
>
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> > This change is late in the cycle but it is critical in my opinion.
> >
> > The lack of default environment as well as the configuration for the
> > tool is a regression from the previous release and this mitigates it.
> >
> > Changes in v2:
> > - Fix wrong path on do_install
> > - Change virtual/bootloader-env to u-boot-default-env (RP)
> > - Add Tom Rini and Stefano Babic to Cc
> >
> >  meta/recipes-bsp/u-boot/libubootenv_0.2.bb |  1 +
> >  meta/recipes-bsp/u-boot/u-boot.inc         | 54 ++++++++++++++++++----
> >  2 files changed, 46 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > index 7a7ec4c8856..144c5c941df 100644
> > --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > @@ -23,5 +23,6 @@ EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> >
> >  PROVIDES += "u-boot-fw-utils"
> >  RPROVIDES_${PN}-bin += "u-boot-fw-utils"
> > +RRECOMMENDS_${PN}-bin += "u-boot-default-env"
> >
> >  BBCLASSEXTEND = "native"
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> > index 648298da0bf..b13db224732 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -122,6 +122,11 @@ do_compile () {
> >                              cp ${B}/${config}/${binary}
> ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
> >                          fi
> >                      done
> > +
> > +                    # Generate the uboot-initial-env
> > +                    oe_runmake -C ${S} O=${B}/${config}
> u-boot-initial-env
> > +                    cp ${B}/${config}/u-boot-initial-env
> ${B}/${config}/u-boot-initial-env-${type}
> > +
> >                      unset k
> >                  fi
> >              done
> > @@ -130,6 +135,9 @@ do_compile () {
> >          unset  i
> >      else
> >          oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
> > +
> > +        # Generate the uboot-initial-env
> > +        oe_runmake -C ${S} O=${B} u-boot-initial-env
> >      fi
> >
> >  }
> > @@ -143,19 +151,26 @@ do_install () {
> >                  j=$(expr $j + 1);
> >                  if [ $j -eq $i ]
> >                  then
> > -                    install -d ${D}/boot
> > -                    install -m 644
> ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
> ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> > +                    install -D -m 644
> ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
> ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> >                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${D}/boot/${UBOOT_BINARY}-${type}
> >                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${D}/boot/${UBOOT_BINARY}
> > +
> > +                    # Install the uboot-initial-env
> > +                    install -D -m 644
> ${B}/${config}/u-boot-initial-env-${type}
> ${D}/${sysconfdir}/u-boot-initial-env-${type}-${PV}-${PR}
> > +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env-${type}
> > +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env
> >                  fi
> >              done
> >              unset  j
> >          done
> >          unset  i
> >      else
> > -        install -d ${D}/boot
> > -        install -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> > +        install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> >          ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> > +
> > +        # Install the uboot-initial-env
> > +        install -D -m 644 ${B}/u-boot-initial-env
> ${D}/${sysconfdir}/u-boot-initial-env-${PV}-${PR}
> > +        ln -sf u-boot-initial-env-${PV}-${PR}
> ${D}/${sysconfdir}/u-boot-initial-env
> >      fi
> >
> >      if [ -n "${UBOOT_ELF}" ]
> > @@ -224,7 +239,16 @@ do_install () {
> >
> >  }
> >
> > -FILES_${PN} = "/boot ${sysconfdir} ${datadir}"
> > +PACKAGE_BEFORE_PN += "${PN}-env"
> > +
> > +RPROVIDES_${PN}-env += "u-boot-default-env"
> > +FILES_${PN}-env = " \
> > +    ${sysconfdir}/u-boot-initial-env* \
> > +    ${sysconfdir}/fw_env.config \
> > +"
> > +
> > +FILES_${PN} = "/boot ${datadir}"
> > +RDEPENDS_${PN} += "${PN}-env"
> >
> >  do_deploy () {
> >      if [ -n "${UBOOT_CONFIG}" ]
> > @@ -235,25 +259,37 @@ do_deploy () {
> >                  j=$(expr $j + 1);
> >                  if [ $j -eq $i ]
> >                  then
> > -                    install -d ${DEPLOYDIR}
> > -                    install -m 644
> ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
> ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> > +                    install -D -m 644
> ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
> ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> > +                    install -D -m 644
> ${B}/${config}/u-boot-initial-env-${type}
> ${DEPLOYDIR}/u-boot-initial-env-${type}-${PV}-${PR}
> > +
> >                      cd ${DEPLOYDIR}
> >                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${UBOOT_SYMLINK}-${type}
> >                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${UBOOT_SYMLINK}
> >                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${UBOOT_BINARY}-${type}
> >                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> ${UBOOT_BINARY}
> > +
> > +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR}
> u-boot-initial-env-${type}
> > +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR}
> u-boot-initial-env
> >                  fi
> >              done
> >              unset  j
> >          done
> >          unset  i
> >      else
> > -        install -d ${DEPLOYDIR}
> > -        install -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> > +        install -D -m 644 ${B}/${UBOOT_BINARY}
> ${DEPLOYDIR}/${UBOOT_IMAGE}
> > +        install -D -m 644 ${B}/u-boot-initial-env
> ${DEPLOYDIR}/u-boot-initial-env-${PV}-${PR}
> >          cd ${DEPLOYDIR}
> >          rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> >          ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> >          ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> > +
> > +        ln -sf u-boot-initial-env-${PV}-${PR} u-boot-initial-env
> > +    fi
> > +
> > +    if [ -e ${WORKDIR}/fw_env.config ] ; then
> > +        install -D -m 644 ${WORKDIR}/fw_env.config
> ${DEPLOYDIR}/fw_env.config-${PV}-${PR}
> > +        cd ${DEPLOYDIR}
> > +        ln -sf fw_env.config-${PV}-${PR} fw_env.config
> >      fi
> >
> >      if [ -n "${UBOOT_ELF}" ]
> >
>
> Regards,
> Stefano
>
> --
> =====================================================================
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
> =====================================================================
> 
>

--0000000000002c322205a2377458
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>it&#39;s very handy to have the env=
ironment=C2=A0file=C2=A0in the DEPLOY folder to for example be able to inte=
grate it to a WIC image.</div><div><br></div><div><br></div><div>BR</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Mar 31, 2020 at 5:32 PM Stefano Babic &lt;<a href=3D"mailto:sbabic@de=
nx.de">sbabic@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Otavio,<br>
<br>
On 31.03.20 17:16, Otavio Salvador wrote:<br>
&gt; One significant change from previous OE-Core releases was the move fr=
om<br>
&gt; u-boot-fw-utils to libubootenv which offers a generic and not machine=
<br>
&gt; specific alternative. However, it is not fully functional as currentl=
y<br>
&gt; we don&#39;t provide the default environment nor the required configu=
ration<br>
&gt; file to be used by it.<br>
<br>
Fully agree - it was on my TODO list, then forgotten. Thanks for fixing<br=
>
this !<br>
<br>
&gt; <br>
&gt; This change address this and include on the default u-boot.inc the<br=
>
&gt; needed code to generate, install and deploy the default environment.<=
br>
&gt; <br>
&gt; The side effect of this change are:<br>
&gt; <br>
&gt; - new ${PN}-env<br>
<br>
Agree.<br>
<br>
&gt; - u-boot-initial-env on deploy<br>
&gt; - fw_env.config on deploy<br>
<br>
Why do we need both of them in deploy ? For making system functional, we<b=
r>
just need that both files are in /etc, that is ${PN}-env must be<br>
installed (and then you set RRECOMMENDS). But why in deploy ? Am I<br>
missing something ?<br>
<br>
&gt; <br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems=
.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; ---<br>
&gt; This change is late in the cycle but it is critical in my opinion.<br=
>
&gt; <br>
&gt; The lack of default environment as well as the configuration for the<=
br>
&gt; tool is a regression from the previous release and this mitigates it.=
<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; - Fix wrong path on do_install<br>
&gt; - Change virtual/bootloader-env to u-boot-default-env (RP)<br>
&gt; - Add Tom Rini and Stefano Babic to Cc<br>
&gt; <br>
&gt;=C2=A0 meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> |=C2=A0 1 +<br>
&gt;=C2=A0 meta/recipes-bsp/u-boot/u-boot.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 54 ++++++++++++++++++----<br>
&gt;=C2=A0 2 files changed, 46 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> b/meta/re=
cipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; index 7a7ec4c8856..144c5c941df 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; @@ -23,5 +23,6 @@ EXTRA_OECMAKE =3D &quot;-DCMAKE_BUILD_TYPE=3DReleas=
e&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PROVIDES +=3D &quot;u-boot-fw-utils&quot;<br>
&gt;=C2=A0 RPROVIDES_${PN}-bin +=3D &quot;u-boot-fw-utils&quot;<br>
&gt; +RRECOMMENDS_${PN}-bin +=3D &quot;u-boot-default-env&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-=
boot/u-boot.inc<br>
&gt; index 648298da0bf..b13db224732 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; +++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; @@ -122,6 +122,11 @@ do_compile () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${B}/${config}/${binary} ${B}/${conf=
ig}/u-boot-${type}.${UBOOT_SUFFIX}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # Generate the uboot-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 oe_runmake -C ${S} O=3D${B}/${config} u-boot-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cp ${B}/${config}/u-boot-initial-env ${B}/${config}/u-boot-initial-env=
-${type}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 unset k<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; @@ -130,6 +135,9 @@ do_compile () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${S} O=3D${B} ${UBOOT=
_MAKE_TARGET}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Generate the uboot-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${S} O=3D${B} u-boot-initi=
al-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 }<br>
&gt; @@ -143,19 +151,26 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j=3D$(e=
xpr $j + 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $j=
 -eq $i ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -d ${D}/boot<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot=
/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/b=
oot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT=
_BINARY}-${type}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT=
_BINARY}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # Install the uboot-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sys=
confdir}/u-boot-initial-env-${type}-${PV}-${PR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boo=
t-initial-env-${type}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boo=
t-initial-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 j<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/boot<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${B}/${UBOOT_BINARY} ${D}=
/boot/${UBOOT_IMAGE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/${UBOOT_BINARY} $=
{D}/boot/${UBOOT_IMAGE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${UBOOT_IMAGE} ${D}/boot/${U=
BOOT_BINARY}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install the uboot-initial-env<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/u-boot-initial-en=
v ${D}/${sysconfdir}/u-boot-initial-env-${PV}-${PR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf u-boot-initial-env-${PV}-${PR} ${=
D}/${sysconfdir}/u-boot-initial-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${UBOOT_ELF}&quot; ]<br>
&gt; @@ -224,7 +239,16 @@ do_install () {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -FILES_${PN} =3D &quot;/boot ${sysconfdir} ${datadir}&quot;<br>
&gt; +PACKAGE_BEFORE_PN +=3D &quot;${PN}-env&quot;<br>
&gt; +<br>
&gt; +RPROVIDES_${PN}-env +=3D &quot;u-boot-default-env&quot;<br>
&gt; +FILES_${PN}-env =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${sysconfdir}/u-boot-initial-env* \<br>
&gt; +=C2=A0 =C2=A0 ${sysconfdir}/fw_env.config \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +FILES_${PN} =3D &quot;/boot ${datadir}&quot;<br>
&gt; +RDEPENDS_${PN} +=3D &quot;${PN}-env&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_deploy () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${UBOOT_CONFIG}&quot; ]<br>
&gt; @@ -235,25 +259,37 @@ do_deploy () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j=3D$(e=
xpr $j + 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $j=
 -eq $i ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -d ${DEPLOYDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYD=
IR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPL=
OYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDI=
R}/u-boot-initial-env-${type}-${PV}-${PR}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 cd ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-=
${type}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-$=
{type}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${type}-${PV}-${PR} u-boot-initial-env-${typ=
e}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ln -sf u-boot-initial-env-${type}-${PV}-${PR} u-boot-initial-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 j<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset=C2=A0 i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${DEPLOYDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${B}/${UBOOT_BINARY} ${DE=
PLOYDIR}/${UBOOT_IMAGE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/${UBOOT_BINARY} $=
{DEPLOYDIR}/${UBOOT_IMAGE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${B}/u-boot-initial-en=
v ${DEPLOYDIR}/u-boot-initial-env-${PV}-${PR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${UBOOT_BINARY} ${UBOOT_SYMLI=
NK}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLI=
NK}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${UBOOT_IMAGE} ${UBOOT_BINAR=
Y}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf u-boot-initial-env-${PV}-${PR} u-=
boot-initial-env<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if [ -e ${WORKDIR}/fw_env.config ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 644 ${WORKDIR}/fw_env.conf=
ig ${DEPLOYDIR}/fw_env.config-${PV}-${PR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOYDIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf fw_env.config-${PV}-${PR} fw_env.=
config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${UBOOT_ELF}&quot; ]<br>
&gt; <br>
<br>
Regards,<br>
Stefano<br>
<br>
-- <br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director: Wol=
fgang Denk<br>
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<br>
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: <a href=3D"mailto:s=
babic@denx.de" target=3D"_blank">sbabic@denx.de</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
</blockquote></div>

--0000000000002c322205a2377458--

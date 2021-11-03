Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B4EC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 15:26:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9440.1635953181236728762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 08:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mlFyPOEH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2144502wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=53bgvkS9wLkkxx6ai5zZHq/YfPvx3qeQ7dSJRVhorPs=;
        b=mlFyPOEHpFAxclt6AJ219CU2R0w0BaukjxFEA8VFVaYdBrNY57ZoQfTp2pY3+MgUz2
         dvg1s3sRyYbJzSlqs19Eb9eWUxyVSWT+8PQXG4VEiL1kNQ6bz8zHKE/61Oo4u1DqptR+
         i2BoZUEr1vid560lriSQv8VUMYQiXpQ74pqjs2adAsggZ8wIw6QoiT0DSds82idUq3qf
         y23SYIpwu9h6kblP3b8kki6ROjUMGbrEFFjQJPSzNyMjKvXZy3eiNISFT8TAOG6eIqlQ
         f43h1OjF3ph6uXgVOJc8bxUvPGYlJibsMte221Fhkgg8N4+7yHTL17BYs/ZUQbcMz7jL
         1vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53bgvkS9wLkkxx6ai5zZHq/YfPvx3qeQ7dSJRVhorPs=;
        b=w7+eSY/rgaxcZFXlFroNpRZhUf45sFaYqH4QzISLP1+9FFP9E/6k4OuDQpg6y7jbTL
         kzKSgYFX+FwXgpOTPY6LKz/Bg9dRQ9L9q2BgPMCj/FgdXj066skz0ON1c0hnyb7StU2q
         4XwFaBjmS63f3iIGUMYxk2aAwNAuTmHZqV9a0GyJIIRFYkSWpHQoVNzXEQ4qtRfjNhfb
         MKGIx8u/JluL8YgTWqb/0ln4XvF9kg5DnSAUKwM+CEj9mfe/hWub+ljsE1p3/J1TOX83
         9Uke4nZ1u1umELPNuu8qLPfI19WlO20OOF3n0rYoNLPyN+PNEcTJ376lHL4hhmReSdYO
         PH6Q==
X-Gm-Message-State: AOAM531EZrGXkgvdmXYo3Nyqq8zzVAOaTLrSPMURAyswFDShmSdZA7PM
	FNHdjHAlKw5tJPvRHm5WE9YFYzvLWBZDQtirKbI=
X-Google-Smtp-Source: 
 ABdhPJx9AOLW3fgBVODql0ydJ3g6hSv9fFea2B2M8J45h81iOjKWLQQWsQJLYlGOs71WgO9gQ6GIPJOq9sp4kFGuJLs=
X-Received: by 2002:a05:600c:1:: with SMTP id
 g1mr15928621wmc.19.1635953179786;
 Wed, 03 Nov 2021 08:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211103072015.7401-1-rybczynska@gmail.com>
 <CAGDS+nkBhgVrxJ0VcN7xmzDuPRWewP092GATLdJ0faLCT-13ag@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nkBhgVrxJ0VcN7xmzDuPRWewP092GATLdJ0faLCT-13ag@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 3 Nov 2021 16:26:08 +0100
Message-ID: 
 <CAApg2=Tm1WW6MEJZwYxRi9v6wcKSc5NBc7MmZ+TmPg=M3DiNOA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][meta-oe][PATCH] networkmanager: update to
 1.22.16
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000002682aa05cfe408dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 15:26:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157830

--0000000000002682aa05cfe408dc
Content-Type: text/plain; charset="UTF-8"

Hello Steve,
Thank you for spotting this! The patch has been sent to the other list.

Kind regards,
Marta

On Wed, Nov 3, 2021 at 4:13 PM Steve Sakoman <steve@sakoman.com> wrote:

> Hi Marta,
>
> Thanks for the patch submission!
>
> Since this is for meta-openembedded, it should be sent to
> openembedded-devel@lists.openembedded.org, not the oe-core list.
>
> Similarly, you shouldn't use the [oe-core] tag, just the [meta-oe] tag.
>
> There are different maintainers for oe-core and meta-openembedded so
> these two things will make sure that the right person sees the patch.
>
> Best regards,
>
> Steve
>
> On Tue, Nov 2, 2021 at 9:20 PM Marta Rybczynska <rybczynska@gmail.com>
> wrote:
> >
> > NetworkManager 1.22.16 contains a fix for CVE-2020-10754.
> >
> > This version includes an additional option by default for firewalld
> zones,
> > --enable-firewalld-zone that installs additional files. Disable it to
> > keep the old behaviour if no firewalld.
> >
> > Also include a patch for fixing reallocarray usage from gatesgarth
> > meta-openembedded 165ad9ad4c86c9e63f3afcf3172c8e1d3629f3a5 required
> > for the build.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> > ---
> >  .../fix_reallocarray_check.patch              | 27 +++++++++++++++++++
> >  ...r_1.22.10.bb => networkmanager_1.22.16.bb} |  7 ++++-
> >  2 files changed, 33 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
> >  rename meta-networking/recipes-connectivity/networkmanager/{
> networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} (95%)
> >
> > diff --git
> a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
> > new file mode 100644
> > index 000000000..0a8de5410
> > --- /dev/null
> > +++
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
> > @@ -0,0 +1,27 @@
> > +reallocarray() is coming from stdlib.h which maybe indirectly included
> > +by malloc.h but not on all libc implementations
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
> > + # FIXME secure_getenv check is not useful?
> > + config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
> > + config_h.set('HAVE___SECURE_GETENV',
> cc.has_function('__secure_getenv'))
> > +-config_h.set10('HAVE_DECL_REALLOCARRAY',
> cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
> > ++config_h.set10('HAVE_DECL_REALLOCARRAY',
> cc.has_function('reallocarray', prefix: '#include <stdlib.h>'))
> > + config_h.set10('HAVE_DECL_EXPLICIT_BZERO',
> cc.has_function('explicit_bzero', prefix: '#include <string.h>'))
> > + config_h.set10('HAVE_DECL_MEMFD_CREATE',
> cc.has_function('memfd_create', prefix: '#include <sys/mman.h>'))
> > +
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -82,7 +82,7 @@ AC_CHECK_DECLS([
> > + AC_CHECK_DECLS([
> > +       reallocarray],
> > +       [], [], [[
> > +-#include <malloc.h>
> > ++#include <stdlib.h>
> > + ]])
> > +
> > + AC_CHECK_DECLS([
> > diff --git a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.10.bb
> b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.16.bb
> > similarity index 95%
> > rename from meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.10.bb
> > rename to meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.16.bb
> > index 33a2b7c0c..ff784b8ce 100644
> > --- a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.10.bb
> > +++ b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.16.bb
> > @@ -26,6 +26,7 @@ SRC_URI = " \
> >      file://${BPN}.initd \
> >
> file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
> >
> file://0002-Do-not-create-settings-settings-property-documentati.patch \
> > +    file://fix_reallocarray_check.patch \
> >  "
> >  SRC_URI_append_libc-musl = " \
> >      file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
> > @@ -33,7 +34,7 @@ SRC_URI_append_libc-musl = " \
> >      file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
> >      file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
> >  "
> > -SRC_URI[sha256sum] =
> "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
> > +SRC_URI[sha256sum] =
> "377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6"
> >
> >  S = "${WORKDIR}/NetworkManager-${PV}"
> >
> > @@ -71,6 +72,7 @@ PACKAGECONFIG[bluez5] =
> "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
> >  # consolekit is not picked by shlibs, so add it to RDEPENDS too
> >  PACKAGECONFIG[consolekit] =
> "--with-session-tracking=consolekit,,consolekit,consolekit"
> >  PACKAGECONFIG[modemmanager] =
> "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
> > +PACKAGECONFIG[firewalld] =
> "--enable-firewalld-zone,--disable-firewalld-zone,firewalld"
> >  PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
> >  # Use full featured dhcp client instead of internal one
> >  PACKAGECONFIG[dhclient] =
> "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
> > @@ -151,6 +153,9 @@ ALTERNATIVE_${PN} =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-co
> >  ALTERNATIVE_TARGET[resolv-conf] =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
> >  ALTERNATIVE_LINK_NAME[resolv-conf] =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
> >
> > +# Issue introduced in 1.26
> > +CVE_CHECK_WHITELIST = "CVE-2021-20297 "
> > +
> >  do_install_append() {
> >      install -Dm 0755 ${WORKDIR}/${BPN}.initd
> ${D}${sysconfdir}/init.d/network-manager
> >
> > --
> > 2.33.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157821):
> https://lists.openembedded.org/g/openembedded-core/message/157821
> > Mute This Topic: https://lists.openembedded.org/mt/86786130/3617601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sakoman@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000002682aa05cfe408dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Steve,</div><div>Thank you for spotting this! T=
he patch has been sent to the other list.</div><div><br></div><div>Kind reg=
ards,</div><div>Marta<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 4:13 PM Steve Sakoman=
 &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Marta,<br>
<br>
Thanks for the patch submission!<br>
<br>
Since this is for meta-openembedded, it should be sent to<br>
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bla=
nk">openembedded-devel@lists.openembedded.org</a>, not the oe-core list.<br=
>
<br>
Similarly, you shouldn&#39;t use the [oe-core] tag, just the [meta-oe] tag.=
<br>
<br>
There are different maintainers for oe-core and meta-openembedded so<br>
these two things will make sure that the right person sees the patch.<br>
<br>
Best regards,<br>
<br>
Steve<br>
<br>
On Tue, Nov 2, 2021 at 9:20 PM Marta Rybczynska &lt;<a href=3D"mailto:rybcz=
ynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; NetworkManager 1.22.16 contains a fix for CVE-2020-10754.<br>
&gt;<br>
&gt; This version includes an additional option by default for firewalld zo=
nes,<br>
&gt; --enable-firewalld-zone that installs additional files. Disable it to<=
br>
&gt; keep the old behaviour if no firewalld.<br>
&gt;<br>
&gt; Also include a patch for fixing reallocarray usage from gatesgarth<br>
&gt; meta-openembedded 165ad9ad4c86c9e63f3afcf3172c8e1d3629f3a5 required<br=
>
&gt; for the build.<br>
&gt;<br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@huawei.com" target=3D"_blank">marta.rybczynska@huawei.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../fix_reallocarray_check.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 27 +++++++++++++++++++<br>
&gt;=C2=A0 ...<a href=3D"http://r_1.22.10.bb" rel=3D"noreferrer" target=3D"=
_blank">r_1.22.10.bb</a> =3D&gt; <a href=3D"http://networkmanager_1.22.16.b=
b" rel=3D"noreferrer" target=3D"_blank">networkmanager_1.22.16.bb</a>} |=C2=
=A0 7 ++++-<br>
&gt;=C2=A0 2 files changed, 33 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/networkm=
anager/networkmanager/fix_reallocarray_check.patch<br>
&gt;=C2=A0 rename meta-networking/recipes-connectivity/networkmanager/{<a h=
ref=3D"http://networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blan=
k">networkmanager_1.22.10.bb</a> =3D&gt; <a href=3D"http://networkmanager_1=
.22.16.bb" rel=3D"noreferrer" target=3D"_blank">networkmanager_1.22.16.bb</=
a>} (95%)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/networkmanager/netwo=
rkmanager/fix_reallocarray_check.patch b/meta-networking/recipes-connectivi=
ty/networkmanager/networkmanager/fix_reallocarray_check.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..0a8de5410<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanag=
er/fix_reallocarray_check.patch<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +reallocarray() is coming from stdlib.h which maybe indirectly include=
d<br>
&gt; +by malloc.h but not on all libc implementations<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -114,7 +114,7 @@ config_h.set10(&#39;HAVE_GETRANDOM&#39;, use_sys<=
br>
&gt; + # FIXME secure_getenv check is not useful?<br>
&gt; + config_h.set(&#39;HAVE_SECURE_GETENV&#39;, cc.has_function(&#39;secu=
re_getenv&#39;))<br>
&gt; + config_h.set(&#39;HAVE___SECURE_GETENV&#39;, cc.has_function(&#39;__=
secure_getenv&#39;))<br>
&gt; +-config_h.set10(&#39;HAVE_DECL_REALLOCARRAY&#39;, cc.has_function(&#3=
9;reallocarray&#39;, prefix: &#39;#include &lt;malloc.h&gt;&#39;))<br>
&gt; ++config_h.set10(&#39;HAVE_DECL_REALLOCARRAY&#39;, cc.has_function(&#3=
9;reallocarray&#39;, prefix: &#39;#include &lt;stdlib.h&gt;&#39;))<br>
&gt; + config_h.set10(&#39;HAVE_DECL_EXPLICIT_BZERO&#39;, cc.has_function(&=
#39;explicit_bzero&#39;, prefix: &#39;#include &lt;string.h&gt;&#39;))<br>
&gt; + config_h.set10(&#39;HAVE_DECL_MEMFD_CREATE&#39;, cc.has_function(&#3=
9;memfd_create&#39;, prefix: &#39;#include &lt;sys/mman.h&gt;&#39;))<br>
&gt; +<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -82,7 +82,7 @@ AC_CHECK_DECLS([<br>
&gt; + AC_CHECK_DECLS([<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reallocarray],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[], [], [[<br>
&gt; +-#include &lt;malloc.h&gt;<br>
&gt; ++#include &lt;stdlib.h&gt;<br>
&gt; + ]])<br>
&gt; +<br>
&gt; + AC_CHECK_DECLS([<br>
&gt; diff --git a/meta-networking/recipes-connectivity/networkmanager/<a hr=
ef=3D"http://networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blank=
">networkmanager_1.22.10.bb</a> b/meta-networking/recipes-connectivity/netw=
orkmanager/<a href=3D"http://networkmanager_1.22.16.bb" rel=3D"noreferrer" =
target=3D"_blank">networkmanager_1.22.16.bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta-networking/recipes-connectivity/networkmanager/<a hre=
f=3D"http://networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blank"=
>networkmanager_1.22.10.bb</a><br>
&gt; rename to meta-networking/recipes-connectivity/networkmanager/<a href=
=3D"http://networkmanager_1.22.16.bb" rel=3D"noreferrer" target=3D"_blank">=
networkmanager_1.22.16.bb</a><br>
&gt; index 33a2b7c0c..ff784b8ce 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/networkmanager/<a href=3D"h=
ttp://networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blank">netwo=
rkmanager_1.22.10.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/networkmanager/<a href=3D"h=
ttp://networkmanager_1.22.16.bb" rel=3D"noreferrer" target=3D"_blank">netwo=
rkmanager_1.22.16.bb</a><br>
&gt; @@ -26,6 +26,7 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://${BPN}.initd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Fixed-configure.ac-Fix-pkgconfig-sysro=
ot-locations.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-Do-not-create-settings-settings-proper=
ty-documentati.patch \<br>
&gt; +=C2=A0 =C2=A0 file://fix_reallocarray_check.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://musl/0001-Fix-build-with-musl-systemd-speci=
fic.patch \<br>
&gt; @@ -33,7 +34,7 @@ SRC_URI_append_libc-musl =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://musl/0003-Fix-build-with-musl-for-n-dhcp4.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://musl/0004-Fix-build-with-musl-systemd-speci=
fic.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;2b29ccc1531ba7ebba95a97f40c22b963838e8b6=
833745efe8e6fb71fd8fca77&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;377aa053752eaa304b72c9906f9efcd9fbd5f7f6=
cb4cd4ad72425a68982cffc6&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/NetworkManager-${PV}&quot;<br>
&gt;<br>
&gt; @@ -71,6 +72,7 @@ PACKAGECONFIG[bluez5] =3D &quot;--enable-bluez5-dun,=
--disable-bluez5-dun,bluez5&quot;<br>
&gt;=C2=A0 # consolekit is not picked by shlibs, so add it to RDEPENDS too<=
br>
&gt;=C2=A0 PACKAGECONFIG[consolekit] =3D &quot;--with-session-tracking=3Dco=
nsolekit,,consolekit,consolekit&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[modemmanager] =3D &quot;--with-modem-manager-1=3Dy=
es,--with-modem-manager-1=3Dno,modemmanager&quot;<br>
&gt; +PACKAGECONFIG[firewalld] =3D &quot;--enable-firewalld-zone,--disable-=
firewalld-zone,firewalld&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[ppp] =3D &quot;--enable-ppp,--disable-ppp,ppp,ppp&=
quot;<br>
&gt;=C2=A0 # Use full featured dhcp client instead of internal one<br>
&gt;=C2=A0 PACKAGECONFIG[dhclient] =3D &quot;--with-dhclient=3D${base_sbind=
ir}/dhclient,,,dhcp-client&quot;<br>
&gt; @@ -151,6 +153,9 @@ ALTERNATIVE_${PN} =3D &quot;${@bb.utils.contains(&=
#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;resolv-co<br>
&gt;=C2=A0 ALTERNATIVE_TARGET[resolv-conf] =3D &quot;${@bb.utils.contains(&=
#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;${sysconfdir}/resolv-conf.N=
etworkManager&#39;,&#39;&#39;,d)}&quot;<br>
&gt;=C2=A0 ALTERNATIVE_LINK_NAME[resolv-conf] =3D &quot;${@bb.utils.contain=
s(&#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;${sysconfdir}/resolv.con=
f&#39;,&#39;&#39;,d)}&quot;<br>
&gt;<br>
&gt; +# Issue introduced in 1.26<br>
&gt; +CVE_CHECK_WHITELIST =3D &quot;CVE-2021-20297 &quot;<br>
&gt; +<br>
&gt;=C2=A0 do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sys=
confdir}/init.d/network-manager<br>
&gt;<br>
&gt; --<br>
&gt; 2.33.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157821): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157821" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157821</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86786130=
/3617601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86786130/3617601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:sakoman@gmail.com" ta=
rget=3D"_blank">sakoman@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000002682aa05cfe408dc--


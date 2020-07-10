Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.15085.1594399037294822794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 09:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QrNN+t4E;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id by13so5144551edb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5Qf3odpyjMrWsLtYdwsR6drAp4oj8YqUn1Me5hhURo=;
        b=QrNN+t4ECHP44ddkFKSyS6hZCt2nebXgy4LblQRWC6+q0ebp0F4FlhdGZUxVYCmXjg
         vqClTCBKtRuQ2k35RxVY1BaoQCIo1GRIlEuaKP28IiiAWfqdpmNr9Vr/Ia06dB/MCUi0
         3CMZL3YqqqkMVH622U3w/nFb2ZU31u+r6RdAfkui8QVZFo1r00CP9REHXFGTnrUdmMfk
         o+7Qyn7eiiMa1IosEpw9M5AssgB/OT+c/xY64nLb5+ET3x7iVLyaHXGeYtDGLQhD5TnV
         mZcp46OAMHWW8oe4xSmckZZYvzWTq9KLIciWKfUR6kZqmCuyoSe5IE+GWJYhpbZ4sL5B
         lqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5Qf3odpyjMrWsLtYdwsR6drAp4oj8YqUn1Me5hhURo=;
        b=Q9nzBP9g9BIT+4MsTh7Eb2Ku7vOaPdO+y6pUBpb05zwu/Hsb96aLbtj+eqeZb1RnKE
         1H9/18pIj/55RVkW5FeZvY6HlmShoVvk1+YkApkFDY/qo7HAXJaoQMrQBaWFNHqFIBOF
         Dray444WfSfMs8vTo8CNFoRRU8xhLbDbRSD5KU55bFVvhDDRkQikiSSzo8kAFXfk5bFr
         rIB9dyWWIu7Im5JlvbAEd5Y5wji6l/yDDmpe4ZzkI0W0j2ZxQCejKBQrco4AvWVafnVD
         cEHfvue575Fqg95gffZVWB0f8kY1oVqFTeejCwB00TVojaVH61qVhg8h9QfixBsCF2Gn
         lg4Q==
X-Gm-Message-State: AOAM531I5QIw7iGHQPCuDi8vit4H9oc1+tv1b/JnarbEFM/EDi/BFjh8
	vb1t/LeHWFv2F5jA8eiSynFAWHNy8O3C6HwA518=
X-Google-Smtp-Source: ABdhPJzIM+l813k0t4vUXP07o8t2Al2Nbxrt/1v19/FODVS/9aehz/vgVkggolSvJhhUqs6fI9941YxKVzw9m42z2wE=
X-Received: by 2002:a05:6402:1b1c:: with SMTP id by28mr51148629edb.270.1594399035719;
 Fri, 10 Jul 2020 09:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200630094907.1396284-1-changqing.li@windriver.com>
 <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org> <61ba6f0c-0bb3-42fa-408e-c2396d5a2773@windriver.com>
In-Reply-To: <61ba6f0c-0bb3-42fa-408e-c2396d5a2773@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 10 Jul 2020 18:37:04 +0200
Message-ID: <CA+chaQc3oXSrbDYdWKRyFEbqn9oNHdeiAVexmzVndwcyYFEBog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
To: Changqing Li <changqing.li@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000027854105aa18f462"

--00000000000027854105aa18f462
Content-Type: text/plain; charset="UTF-8"

With this change now in master and dunfell there is signature issue in
allarch adwaita-icon-theme now runtime depending on TUNE_PKGARCH gdk-pixbuf
as shown by sstate-diff-machines.sh/bitbake-diffsigs:

bitbake-diffsigs
tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-linux/adwaita-icon-theme/*do_prepare_recipe_sysroot*
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP: 127.0.0.1,
PORT: 33511, PID: 36423
Hash for dependent task gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot
changed from
a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to
1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
Unable to find matching sigdata for
openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot
with hashes
a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 or
1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f

On Wed, Jul 1, 2020 at 3:39 AM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 6/30/20 6:01 PM, Richard Purdie wrote:
> > On Tue, 2020-06-30 at 17:49 +0800, Changqing Li wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> fix error:
> >> + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
> >> /var/tmp/rpm-tmp.mdYxY6: line 12: /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-
> >> query-loaders: No such file or directory
> >> %post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 2961
> >> status 7f00
> >> warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet
> >> failed, exit status 127
> >>
> >> when install adwaita-icon-theme, which inherit gtk-icon-cache
> >> on target, above error reported,  fix by add needeed packages
> >> in RDEPENDS
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta/classes/gtk-icon-cache.bbclass | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-
> >> icon-cache.bbclass
> >> index 91cb4ad409..7f218ce7ae 100644
> >> --- a/meta/classes/gtk-icon-cache.bbclass
> >> +++ b/meta/classes/gtk-icon-cache.bbclass
> >> @@ -4,6 +4,8 @@ DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' ==
> >> 'hicolor-icon-theme']} gtk
> >>
> >>   PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
> >>
> >> +RDEPENDS_${PN} += "gdk-pixbuf gtk+3"
> >> +
> >>   gtk_icon_cache_postinst() {
> >>   if [ "x$D" != "x" ]; then
> >>      $INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG}
> >> \
> > This isn't quite right since the postinst may be added to a package
> > other than ${PN}.
> >
> > You need to add the RDEPENDS to the code:
> >
> >          rdepends = ' ' + d.getVar('MLPREFIX', False) +
> "hicolor-icon-theme"
> >          d.appendVar('RDEPENDS_%s' % pkg, rdepends)
> >
> > later in that class.
> >
> > Cheers,
> >
> > Richard
> Thanks, I will correct it.
> >
> 
>

--00000000000027854105aa18f462
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With this change now in master and dunfell there is signat=
ure issue in allarch=C2=A0adwaita-icon-theme now runtime depending on TUNE_=
PKGARCH gdk-pixbuf as shown by <a href=3D"http://sstate-diff-machines.sh/bi=
tbake-diffsigs">sstate-diff-machines.sh/bitbake-diffsigs</a>:<div><br></div=
><div>bitbake-diffsigs tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-lin=
ux/adwaita-icon-theme/*do_prepare_recipe_sysroot*<br>NOTE: Starting bitbake=
 server...<br>NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP:=
 127.0.0.1, PORT: 33511, PID: 36423<br>Hash for dependent task gdk-pixbuf/g=
dk-pixbuf_2.40.0.bb:do_populate_sysroot changed from a72aba8432699c8ce4ca1f=
71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to 1ad4e1bd76921b71482657f3b0171=
84e9ade8e2a0b9f43ad64ed2dda83b1520f<br>Unable to find matching sigdata for =
openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_pop=
ulate_sysroot with hashes a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b=
9d819fdb1e407f4 or 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda=
83b1520f<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Jul 1, 2020 at 3:39 AM Changqing Li &lt;<a href=
=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 6/30/20 6:01 PM, Richard Purdie wrote:<br>
&gt; On Tue, 2020-06-30 at 17:49 +0800, Changqing Li wrote:<br>
&gt;&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; fix error:<br>
&gt;&gt; + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache=
<br>
&gt;&gt; /var/tmp/rpm-tmp.mdYxY6: line 12: /usr/lib/gdk-pixbuf-2.0/gdk-pix=
buf-<br>
&gt;&gt; query-loaders: No such file or directory<br>
&gt;&gt; %post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 29=
61<br>
&gt;&gt; status 7f00<br>
&gt;&gt; warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet<b=
r>
&gt;&gt; failed, exit status 127<br>
&gt;&gt;<br>
&gt;&gt; when install adwaita-icon-theme, which inherit gtk-icon-cache<br>
&gt;&gt; on target, above error reported,=C2=A0 fix by add needeed package=
s<br>
&gt;&gt; in RDEPENDS<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@wi=
ndriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/classes/gtk-icon-cache.bbclass | 2 ++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/g=
tk-<br>
&gt;&gt; icon-cache.bbclass<br>
&gt;&gt; index 91cb4ad409..7f218ce7ae 100644<br>
&gt;&gt; --- a/meta/classes/gtk-icon-cache.bbclass<br>
&gt;&gt; +++ b/meta/classes/gtk-icon-cache.bbclass<br>
&gt;&gt; @@ -4,6 +4,8 @@ DEPENDS +=3D&quot; ${@[&#39;hicolor-icon-theme&#3=
9;, &#39;&#39;][&#39;${BPN}&#39; =3D=3D<br>
&gt;&gt; &#39;hicolor-icon-theme&#39;]} gtk<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0PACKAGE_WRITE_DEPS +=3D &quot;gtk+3-native gdk-pixbuf=
-native&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; +RDEPENDS_${PN} +=3D &quot;gdk-pixbuf gtk+3&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0gtk_icon_cache_postinst() {<br>
&gt;&gt;=C2=A0 =C2=A0if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 $INTERCEPT_DIR/postinst_intercept update_gtk_=
icon_cache ${PKG}<br>
&gt;&gt; \<br>
&gt; This isn&#39;t quite right since the postinst may be added to a packa=
ge<br>
&gt; other than ${PN}.<br>
&gt;<br>
&gt; You need to add the RDEPENDS to the code:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdepends =3D &#39; &#39; + d.getVar=
(&#39;MLPREFIX&#39;, False) + &quot;hicolor-icon-theme&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_%s&#39; %=
 pkg, rdepends)<br>
&gt;<br>
&gt; later in that class.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
Thanks, I will correct it.<br>
&gt;<br>
<br>
</blockquote></div>

--00000000000027854105aa18f462--

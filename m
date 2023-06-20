Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0411EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 14:12:56 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.11328.1687270367470917371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 07:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ef6GfUit;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-43f40006c48so1129961137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687270366; x=1689862366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjcylXfc0Jh+S0kPElIo2qByOf/9AenCnsVfoo4sVQw=;
        b=Ef6GfUith55tTDmCle8SJ6O0xN+lg8FYx6dnSCN0M/i7kxz4puV1c5OdrGMDc6fSGU
         8cpyCa2eJIxDJdzmXfgbdY1LYzuhTsm3PS4QEOeCtVayYs6sBCtI+OpyO7yc+H5HyHXv
         NiBtfPZac7SXmQFIF8VpnZJ1N7jYxkcTQU9RUgKBwVSwWadAPab2R0IGZuuQhMd4Qnc/
         5P6hSrSyqwB09MEDGyEmlBY1YYZ0i2Mr5F3TXfnYAMB4xd6lbsL+1RvQaqXQ58LplmI6
         Vj8Qzidy3qNUR2FpysRkhw1kXmV3/mDuxuamnEzU6ftCCsaIsQKanVqBZXfJEJZc3Oax
         U+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687270366; x=1689862366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjcylXfc0Jh+S0kPElIo2qByOf/9AenCnsVfoo4sVQw=;
        b=QyQqpsCehYBXSUD+cuy3ohREmaYcegNfL/VxVRR72N0B+sx/08L4y/b+wPS+N7j1a+
         R2JJBDmJKs9i5SPbbNfARvMjUzHXjSNpD+Puq6nUUyyfDsMo1JQ8TGRofz1VcYbcxsDu
         yTLOAhi27C4apQAmhalg4+FFeav+VkjvcE5hmHLpqZ6Ny8+WasIDSNMvW7qROYhtVJDl
         BwwjPx0UAx5zEOHoQ/PIBWRyyInE3Zn4IQo+FXv7gzpqKN3GcUZWFk9trhzPMSpHfmgE
         OAvvjYRh5bGXkiv1zRVp4Osr+sGCwuevlR6R+7XbmSviaHXoOrmVXKKE8W2Nu6PwfHx+
         QaKA==
X-Gm-Message-State: AC+VfDyo1zSO1PEKaNcvNP3fNqBlbdFCr9+eh1Qn3n8oA0wk/6PNiEdz
	m5nXY1hNHaQOOsm+sY1wCehfTaF659IhJKW1qsI=
X-Google-Smtp-Source: ACHHUZ4B2F3K+EBBLXKXED3AlEku/Aj7yGVWQWsQR8nXRJOnD+ZApjnxxpjlbuOzxhtZIpZmlcAa+JQZ1KWqQEdtfG8=
X-Received: by 2002:a05:6102:7cc:b0:436:57fc:ffa3 with SMTP id
 y12-20020a05610207cc00b0043657fcffa3mr3567491vsg.23.1687270366235; Tue, 20
 Jun 2023 07:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230619231343.1683736-1-jose.quaresma@foundries.io> <20230620155725.73656341@booty>
In-Reply-To: <20230620155725.73656341@booty>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 20 Jun 2023 15:12:35 +0100
Message-ID: <CANPvuRmCWG_dbCFod5Zzr9L2j7JXpum--ieZWJ6d9oeXKkrdqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="000000000000d1ce9705fe903ea7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 14:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183138

--000000000000d1ce9705fe903ea7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca Ceresoli <luca.ceresoli@bootlin.com> escreveu no dia ter=C3=A7a, 20/06=
/2023
=C3=A0(s) 14:57:

> Hello Jose,
>
> On Mon, 19 Jun 2023 23:13:43 +0000
> "Jose Quaresma" <quaresma.jose@gmail.com> wrote:
>
> > The modules-load.d [1] - Configure kernel modules to load at boot
> > should install their configuration files in /usr/lib/modules-load.d.
> >
> > The modprobe.d [2] - Configuration directory for modprobe
> > should install their configuration files in /lib/modprobe.d
> >
> > [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.htm=
l
> > [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> >
> > [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1221=
2
> >
> > CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> > CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>
> This patchset is triggering some AB failures:
>
>   Exception: NameError: name 'modprobedir' is not defined
>
> Some logs:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6229/s=
teps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/7658/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2935/s=
teps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7369/st=
eps/17/logs/stdio


Hi Luca,

Thanks for the info.

I missed some parts of the patch when updating to v2.
I am also addressing some comments on v2 and will send a v3
after some more testing.

--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -166,6 +166,8 @@ python split_kernel_module_packages () {
     splitmods =3D d.getVar('KERNEL_SPLIT_MODULES')
     postinst =3D d.getVar('pkg_postinst:modules')
     postrm =3D d.getVar('pkg_postrm:modules')
+    modulesloaddir =3D d.getVar('modulesloaddir')
+    modprobedir =3D d.getVar('modprobedir')

     if splitmods !=3D '1':
         d.appendVar('FILES:' + metapkg, '%s/ %s/ %s/modules/' %
(modulesloaddir, modprobedir, d.getVar("nonarch_base_libdir")))



>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d1ce9705fe903ea7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Luca Ceresoli &lt;<a href=3D"mailto:l=
uca.ceresoli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; escreveu no dia=
 ter=C3=A7a, 20/06/2023 =C3=A0(s) 14:57:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hello Jose,<br>
<br>
On Mon, 19 Jun 2023 23:13:43 +0000<br>
&quot;Jose Quaresma&quot; &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
<br>
&gt; The modules-load.d [1] - Configure kernel modules to load at boot<br>
&gt; should install their configuration files in /usr/lib/modules-load.d.<b=
r>
&gt; <br>
&gt; The modprobe.d [2] - Configuration directory for modprobe<br>
&gt; should install their configuration files in /lib/modprobe.d<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/man/module=
s-load.d.html" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop=
.org/software/systemd/man/modules-load.d.html</a><br>
&gt; [2] <a href=3D"https://www.man7.org/linux/man-pages//man5/modprobe.d.5=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/linux/man-=
pages//man5/modprobe.d.5.html</a><br>
&gt; <br>
&gt; [YOCTO #12212] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D12212" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D12212</a><br>
&gt; <br>
&gt; CC: Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.com" target=
=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;<br>
&gt; CC: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
<br>
This patchset is triggering some AB failures:<br>
<br>
=C2=A0 Exception: NameError: name &#39;modprobedir&#39; is not defined<br>
<br>
Some logs:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/104/buil=
ds/6229/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6229/steps/12/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/23/build=
s/7658/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/23/builds/7658/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/120/buil=
ds/2935/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2935/steps/12/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/89/build=
s/7369/steps/17/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7369/steps/17/logs/=
stdio</a></blockquote><div><br>Hi Luca,</div><div><br></div><div>Thanks for=
 the info.</div><div><br></div><div>I missed some parts of the patch=C2=A0w=
hen updating to v2.</div><div>I am also addressing some comments on v2 and =
will send a v3</div><div>after some more testing.<br><br>--- a/meta/classes=
-recipe/kernel-module-split.bbclass<br>+++ b/meta/classes-recipe/kernel-mod=
ule-split.bbclass<br>@@ -166,6 +166,8 @@ python split_kernel_module_package=
s () {<br>=C2=A0 =C2=A0 =C2=A0splitmods =3D d.getVar(&#39;KERNEL_SPLIT_MODU=
LES&#39;)<br>=C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;pkg_postinst:mo=
dules&#39;)<br>=C2=A0 =C2=A0 =C2=A0postrm =3D d.getVar(&#39;pkg_postrm:modu=
les&#39;)<br>+ =C2=A0 =C2=A0modulesloaddir =3D d.getVar(&#39;modulesloaddir=
&#39;)<br>+ =C2=A0 =C2=A0modprobedir =3D d.getVar(&#39;modprobedir&#39;)<br=
>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if splitmods !=3D &#39;1&#39;:<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;FILES:&#39; + metapkg, &#39;%s/ %s=
/ %s/modules/&#39; % (modulesloaddir, modprobedir, d.getVar(&quot;nonarch_b=
ase_libdir&quot;)))<br><br><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000d1ce9705fe903ea7--


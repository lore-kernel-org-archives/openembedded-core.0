Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web08.34797.1610376338488076062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eFvmiXtN;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id o195so4282093vka.9
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rq/vowtsAauDFWTxlHOoiIhPfU7yew41X+2bEZvsGaA=;
        b=eFvmiXtNhXrzd+L5uiHCskW14/nGQXxdozT6iu2SmmFJQe43TH1bef/XEiio0tE/t3
         KhQ2FygQAov/DF4NMaHW/NmbiOxlX9kgk+J/B3gYsGCTlYuF7tIdjY0ZCkQVEb44wb81
         iSGMwheYEBKEKyQKv6q5+hBTYjWLKwxqcQhS0tjOtsYCAUQnNtSDupkTSxkJRJE99oWU
         8cioapqiX4MjQ49JTdqvJd6Vjmn1Y3GGLSnt0BwZXhU1tHxX6nJOK2yLY8QcnZX1qNt8
         VJB9TV8WIbxtBoDvc0aauQaNqhENa4JHrJHB4y5ZeJdUSJMl81u75RUeFg1+1faMxY8L
         UgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rq/vowtsAauDFWTxlHOoiIhPfU7yew41X+2bEZvsGaA=;
        b=O5lKtK2B9key6dC8rYAI1pyyWNRcCrqKm3pBh4r7apaFnMrNA2CnNVYWVOqLtGTfRS
         Ex9aui99KQvki0xfuTtCT55QgCCFshMMu6zwmpbpSClEQZ6notZ7WquqeSjWeTwMrR4J
         TlFVh0tIof52aw2rK6spBkpOUtcoQS5Jxy8jt+2EEF3PIfreV0q+/CiRupl/p88V6EFd
         YTSiA71TTh42Qc/HnbL13Mo1ILETi1lcwd0m4StdyokyMUMDIsyc32duEGrwfe5fjlI8
         O271zBjpg6vunF0I/h3ZjURnX590W8kT+6xDyRUqkcLS/tx2EVmSIe6J/tunHDvFGF6B
         P8YQ==
X-Gm-Message-State: AOAM531CkOmcYrZsys3+z3jMzentJdeguUS+2S7Ie2nsOtuuq8wKQCZM
	CZO9BOb8cw2uQlqbnPaRcJBn2Cssf9Crop9ICJy0KyqC
X-Google-Smtp-Source: ABdhPJz0QXxR1s3oa9huWZJ78EtZ+xaZtWM77quqTUb/3Lt4mCnj1JKHC/CBFTzX/GXc9kFo7JjIdUzGQb7957dezU4=
X-Received: by 2002:a1f:c305:: with SMTP id t5mr98929vkf.7.1610376337648; Mon,
 11 Jan 2021 06:45:37 -0800 (PST)
MIME-Version: 1.0
References: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
 <CANNYZj994v93KxdpRZrpQ3p2sCTkhk6DJDRGhCPh4uw6fDMo3g@mail.gmail.com> <B5AACA79-EC38-460D-BA56-6BB7350CF7C5@bmw.de>
In-Reply-To: <B5AACA79-EC38-460D-BA56-6BB7350CF7C5@bmw.de>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 11 Jan 2021 15:45:26 +0100
Message-ID: <CANNYZj8n=-2kD8cXufcyiG+59Y6R7zyZNSLOtxOzsD277pcBxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
To: Michael Ho <Michael.Ho@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008f710905b8a0f57e"

--0000000000008f710905b8a0f57e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you can fix the deb packaging easily, then please do so, but it is not
mandatory, and don't spend too much time if it turns out to be a time sink=
.

Alex

On Mon, 11 Jan 2021 at 15:01, <Michael.Ho@bmw.de> wrote:

> Hello Alexander,
>
>
>
> Did a quick test and it seems the rpm packaging classes don=E2=80=99t ha=
ve this
> issue. The rootfs_deb bbclass however has the same lock files like with
> rootfs_ipk.
>
> Should I try to patch this too to keep them aligned?
>
>
>
> Kind regards,
>
> Michael
>
>
>
> --
>
> *BMW Car IT GmbH*
> Michael Ho
> Spezialist Entwicklung =E2=80=93 Build and Release Engineering
> Lise-Meitner-Stra=C3=9Fe 14
> 89081 Ulm
>
> Tel.: =C2=AD+49-731-37804-071
>
> Mobil: +49-152-54980-471
> Fax: +49-731-37804-001
> Mail: michael.ho@bmw-carit.de
> Web: http://www.bmw-carit.de
> ------------------------------------------------------------------------=
-
> BMW Car IT GmbH
> Gesch=C3=A4ftsf=C3=BChrer: Kai-Uwe Balszuweit und Michael B=C3=B6ttrich
> Sitz und Registergericht: M=C3=BCnchen HRB 134810
> ------------------------------------------------------------------------=
-
>
>
>
>
>
> *From: *Alexander Kanavin <alex.kanavin@gmail.com>
> *Date: *Monday, 11. January 2021 at 13:46
> *To: *"Ho Michael, JC-3UL" <Michael.Ho@bmw.de>
> *Cc: *OE-core <openembedded-core@lists.openembedded.org>
> *Subject: *Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in
> parallel to do_rootfs
>
>
>
> Does deb/rpm packaging already have this feature?
>
>
>
> Alex
>
>
>
> On Mon, 11 Jan 2021 at 13:45, Michael Ho <Michael.Ho@bmw.de> wrote:
>
> From: Michael Ho <Michael.Ho@bmw.de>
>
> Switch do_populate_sdk for the ipk package manager to use a separate tar=
get
> opkg config file and separate the lockfiles restricting do_rootfs and
> do_populate_sdk from running in parallel.
>
> This way if an image recipe includes a dependency to do_populate_sdk by
> default then it will run in parallel to do_rootfs saving time compared t=
o
> the
> sequential execution.
>
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  meta/classes/package_ipk.bbclass       | 1 +
>  meta/classes/rootfs_ipk.bbclass        | 4 ++--
>  meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> index 79cb36c..d31dba0 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?=3D "ipk"
>
>  IPKGCONF_TARGET =3D "${WORKDIR}/opkg.conf"
>  IPKGCONF_SDK =3D  "${WORKDIR}/opkg-sdk.conf"
> +IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
>
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
> diff --git a/meta/classes/rootfs_ipk.bbclass
> b/meta/classes/rootfs_ipk.bbclass
> index f1e0219..245c256 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -14,8 +14,8 @@ do_rootfs[recrdeptask] +=3D "do_package_write_ipk
> do_package_qa"
>  do_rootfs[vardeps] +=3D "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS
> PACKAGE_FEED_ARCHS"
>
>  do_rootfs[lockfiles] +=3D "${WORKDIR}/ipk.lock"
> -do_populate_sdk[lockfiles] +=3D "${WORKDIR}/ipk.lock"
> -do_populate_sdk_ext[lockfiles] +=3D "${WORKDIR}/ipk.lock"
> +do_populate_sdk[lockfiles] +=3D "${WORKDIR}/sdk-ipk.lock"
> +do_populate_sdk_ext[lockfiles] +=3D "${WORKDIR}/sdk-ipk.lock"
>
>  OPKG_PREPROCESS_COMMANDS =3D ""
>
> diff --git a/meta/lib/oe/package_manager/ipk/sdk.py
> b/meta/lib/oe/package_manager/ipk/sdk.py
> index 37af034..e2ca415 100644
> --- a/meta/lib/oe/package_manager/ipk/sdk.py
> +++ b/meta/lib/oe/package_manager/ipk/sdk.py
> @@ -14,6 +14,12 @@ class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=3DNone):
>          super(PkgSdk, self).__init__(d, manifest_dir)
>
> +        # In sdk_list_installed_packages the call to opkg is hardcoded =
to
> +        # always use IPKGCONF_TARGET and there's no exposed API to chan=
ge
> this
> +        # so simply override IPKGCONF_TARGET to use this separated conf=
ig
> file.
> +        ipkgconf_sdk_target =3D d.getVar("IPKGCONF_SDK_TARGET")
> +        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
> +
>          self.target_conf =3D self.d.getVar("IPKGCONF_TARGET")
>          self.host_conf =3D self.d.getVar("IPKGCONF_SDK")
>
> --
> 2.7.4
>
>
>=20
>
>

--0000000000008f710905b8a0f57e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If you can fix the deb packaging easily, then please =
do so, but it is not mandatory, and don&#39;t spend too much time if it tur=
ns out to be a time sink.</div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11=
 Jan 2021 at 15:01, &lt;<a href=3D"mailto:Michael.Ho@bmw.de">Michael.Ho@bmw=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">





<div style=3D"overflow-wrap: break-word;" lang=3D"en-DE">
<div class=3D"gmail-m_-5454070374538653633WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Hello Alexander,<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Did a quick test and it seems =
the rpm packaging classes don=E2=80=99t have this issue. The rootfs_deb bbc=
lass however has the same lock files like with rootfs_ipk.<br>
<br>
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Should I try to patch this too=
 to keep them aligned?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Kind regards,<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Michael<u></u><u></u></span></=
p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">--=C2=A0<u></u><u></u></span><=
/p>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:rgb(51,51,51)" lang=3D"EN-AU">BMW Car IT Gmb=
H</span></b><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,s=
ans-serif;color:rgb(51,51,51)" lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Michael Ho</span=
><br>
Spezialist Entwicklung =E2=80=93 Build and Release Engineering<br>
<span style=3D"background:white none repeat scroll 0% 0%">Lise-Meitner-Str=
a=C3=9Fe 14</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">89081 Ulm</span>=
<br>
<br>
<span style=3D"background:white none repeat scroll 0% 0%">Tel.:=C2=A0=C2=
=AD+49-731-37804-071<u></u><u></u></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:rgb(51,51,51);background:white none repeat scro=
ll 0% 0%" lang=3D"EN-AU">Mobil: +49-152-54980-471</span><span style=3D"font=
-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(51,51,51)" =
lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Fax: +49-731-378=
04-001</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">Mail:=C2=A0</spa=
n></span><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans=
-serif" lang=3D"EN-AU"><a href=3D"mailto:michael.ho@bmw-carit.de" target=3D=
"_blank"><span style=3D"color:rgb(5,99,193)">michael.ho@bmw-carit.de</span>=
</a><span style=3D"color:rgb(51,51,51);background:white none repeat scroll =
0% 0%">=C2=A0</span><span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Web:=C2=A0</span=
></span></span><span lang=3D"EN-AU"><a href=3D"http://www.bmw-carit.de/" ta=
rget=3D"_blank"><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quo=
t;,sans-serif;color:rgb(50,108,166)">http://www.bmw-carit.de</span></a></sp=
an><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif=
;color:rgb(51,51,51)" lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">----------------=
---------------------------------------------------------</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">BMW Car IT GmbH<=
/span><br>
<span style=3D"background:white none repeat scroll 0% 0%">Gesch=C3=A4ftsf=
=C3=BChrer:=C2=A0Kai-Uwe Balszuweit und</span></span><span style=3D"font-s=
ize:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(153,153,153)"=
 lang=3D"EN-AU">=C2=A0</span><span style=3D"font-size:10.5pt;font-family:&q=
uot;Arial&quot;,sans-serif" lang=3D"EN-AU">Michael
 B=C3=B6ttrich<span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Sitz und Registe=
rgericht: M=C3=BCnchen HRB 134810</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">----------------=
---------------------------------------------------------</span></span></sp=
an><span style=3D"font-size:8pt;font-family:&quot;BMWType V2 Light&quot;" l=
ang=3D"EN-AU"><u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<div style=3D"border-color:rgb(181,196,223) currentcolor currentcolor;bord=
er-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm=
">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:=
 </span></b><span style=3D"font-size:12pt;color:black">Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@=
gmail.com</a>&gt;<br>
<b>Date: </b>Monday, 11. January 2021 at 13:46<br>
<b>To: </b>&quot;Ho Michael, JC-3UL&quot; &lt;<a href=3D"mailto:Michael.Ho=
@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
<b>Cc: </b>OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;=
<br>
<b>Subject: </b>Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in=
 parallel to do_rootfs<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Does deb/rpm packaging already have this feature?<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, 11 Jan 2021 at 13:45, Michael Ho &lt;<a hre=
f=3D"mailto:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt; =
wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor r=
gb(204,204,204);border-style:none none none solid;border-width:medium mediu=
m medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Michael Ho &lt;<=
a href=3D"mailto:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>=
&gt;<br>
<br>
Switch do_populate_sdk for the ipk package manager to use a separate targe=
t<br>
opkg config file and separate the lockfiles restricting do_rootfs and<br>
do_populate_sdk from running in parallel.<br>
<br>
This way if an image recipe includes a dependency to do_populate_sdk by<br=
>
default then it will run in parallel to do_rootfs saving time compared to =
the<br>
sequential execution.<br>
<br>
Signed-off-by: Michael Ho &lt;<a href=3D"mailto:Michael.Ho@bmw.de" target=
=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/package_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta/classes/rootfs_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<=
br>
=C2=A0meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++<br>
=C2=A03 files changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.b=
bclass<br>
index 79cb36c..d31dba0 100644<br>
--- a/meta/classes/package_ipk.bbclass<br>
+++ b/meta/classes/package_ipk.bbclass<br>
@@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?=3D &quot;ipk&quot;<br>
<br>
=C2=A0IPKGCONF_TARGET =3D &quot;${WORKDIR}/opkg.conf&quot;<br>
=C2=A0IPKGCONF_SDK =3D=C2=A0 &quot;${WORKDIR}/opkg-sdk.conf&quot;<br>
+IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-target.conf&quot;<br>
<br>
=C2=A0PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
<br>
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbc=
lass<br>
index f1e0219..245c256 100644<br>
--- a/meta/classes/rootfs_ipk.bbclass<br>
+++ b/meta/classes/rootfs_ipk.bbclass<br>
@@ -14,8 +14,8 @@ do_rootfs[recrdeptask] +=3D &quot;do_package_write_ipk d=
o_package_qa&quot;<br>
=C2=A0do_rootfs[vardeps] +=3D &quot;PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PA=
THS PACKAGE_FEED_ARCHS&quot;<br>
<br>
=C2=A0do_rootfs[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
-do_populate_sdk[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
-do_populate_sdk_ext[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
+do_populate_sdk[lockfiles] +=3D &quot;${WORKDIR}/sdk-ipk.lock&quot;<br>
+do_populate_sdk_ext[lockfiles] +=3D &quot;${WORKDIR}/sdk-ipk.lock&quot;<b=
r>
<br>
=C2=A0OPKG_PREPROCESS_COMMANDS =3D &quot;&quot;<br>
<br>
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_=
manager/ipk/sdk.py<br>
index 37af034..e2ca415 100644<br>
--- a/meta/lib/oe/package_manager/ipk/sdk.py<br>
+++ b/meta/lib/oe/package_manager/ipk/sdk.py<br>
@@ -14,6 +14,12 @@ class PkgSdk(Sdk):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d, manifest_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(PkgSdk, self).__init__(d, manifest=
_dir)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In sdk_list_installed_packages the call to =
opkg is hardcoded to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # always use IPKGCONF_TARGET and there&#39;s =
no exposed API to change this<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so simply override IPKGCONF_TARGET to use t=
his separated config file.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ipkgconf_sdk_target =3D d.getVar(&quot;IPKGCO=
NF_SDK_TARGET&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;IPKGCONF_TARGET&quot;, ipkgcon=
f_sdk_target)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target_conf =3D self.d.getVar(&quot=
;IPKGCONF_TARGET&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.host_conf =3D self.d.getVar(&quot;I=
PKGCONF_SDK&quot;)<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--0000000000008f710905b8a0f57e--

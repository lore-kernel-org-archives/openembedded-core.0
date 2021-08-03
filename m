Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.2810.1627983309189731703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 02:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UfX9W81X;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id t26so7974941uao.12
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jcRI65UYUGB6VuECIbCoXzypyOS/Im214xpx9yeB6o=;
        b=UfX9W81XU9hHVwADCPj5G6r5qjA3yDUvmPU44N5HNjM5aNGHSubdYEQlDbvuFj1GFh
         xTDBhfF49SYyKZnxtsuz8pOobzs6coqcxBAon53jAfvuOGDewp1mbJ4YJzE56rgwW5wm
         hV7R/8o0KJIY8snaiqp6KBismQYYCS6W/JeWuS4O5OL/T7rA/KfW0ycPy9eE0O0Iv02u
         Jv8wvGO/uvAoBiPqcYpf/PWKAXKR99EZeAMRODJgS2+NSmkw87Ut5Bijk/VteiXoel31
         IRBNpbRZoGx84P3PZxaOzU7m8st71m/BRfRGfFvjzzphDwzbw6k76QhOujnage6aI5Vl
         UIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jcRI65UYUGB6VuECIbCoXzypyOS/Im214xpx9yeB6o=;
        b=aDLP4qunVv5+1Q0wni07/uKaiEqVHp6jibVkLvsxI9Tz2LIyAfi8NaAIE3na3dfwfB
         iI7Dd5K1YGS9DP3YU92CwXf89GFI+L3l/p4C7RZhwW7t4U7tryFSKleG4LwRTq42x68i
         kzEzsueqJfqy/j2mqJ2sXd5LWuHZZDHZOybFAPCBaYSCS7BEGiPDlcCTJVHHNmmJ9N6g
         0q3Uh2aZIYbm+0cvw5K6vqjPlkH849I05heada2jCs9i1XdAJoM4u7K3LKHeAytMxURE
         YKyFBuu/OHAY6VlRMR0ljbaNxJC37lFO1L72DyMMUmk1iSm8onLVcZYtOuSV8IC+tAlo
         Mq6g==
X-Gm-Message-State: AOAM531dM5HLTZzR+ADe6LGHtQa7Epvd3MBH+eB98m437kl/uPBBRNDt
	SrBgOA++EAn2l/AnShwe79OMrl6/uG8+L0HoJjA=
X-Google-Smtp-Source: ABdhPJzYnXq6ft7rZkF8mKzWdMtonjFC7+kAhGUJaofpMqDnpU5X29eCX5QyByJoMQhRYz+bFXcDtRYW1c5Sng+qokk=
X-Received: by 2002:ab0:3314:: with SMTP id r20mr1792942uao.89.1627983308103;
 Tue, 03 Aug 2021 02:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210802062543.101415-1-Qi.Chen@windriver.com>
 <CANNYZj_OVpNG31euNAgWYbCQ-PBr1A-wQvJmaJGRVnXxQQ0-Pw@mail.gmail.com> <CO6PR11MB56021A3A8E66FB735C3CF3B4EDF09@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB56021A3A8E66FB735C3CF3B4EDF09@CO6PR11MB5602.namprd11.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 3 Aug 2021 11:34:56 +0200
Message-ID: <CANNYZj_1621kQ=hzaaxmd9OYa8OHSU-H0YBd1S2RSKceySQ80w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gobject-introspection: fix default search path for girdir
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c7a4b005c8a46673"

--000000000000c7a4b005c8a46673
Content-Type: text/plain; charset="UTF-8"

Can you please provide the steps needed to reproduce the error? Can they be
automated and added to the AB? Otherwise, I cannot meaningfully review the
patch.

Also, the second concern is still not addressed: please submit upstream
first, and include the link to the oe-core submission. It's only a merge
request on gnome gitlab.

Alex

On Tue, 3 Aug 2021 at 06:51, Chen, Qi <Qi.Chen@windriver.com> wrote:

> I didn't notice the previous email.
> The reason that it's not seen on autobuilder is that it's runtime error.
> At build time, it uses a wrapper which adds extra parameters including the
> correct path. That's why we didn't see any error at build time.
>
> Regards,
> Qi
> ------------------------------
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Monday, August 2, 2021 20:57
> *To:* Chen, Qi <Qi.Chen@windriver.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core][PATCH] gobject-introspection: fix default search
> path for girdir
>
> The concerns are the same as the previous time this patch was submitted:
>
> This is not seen in the autobuilder, how can it be reproduced?
>
> Also, please submit upstream first.
>
>
> Alex
>
> On Mon, 2 Aug 2021 at 08:25, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> When running g-ir-scanner, we get the following error:
>
>   Couldn't find include 'GObject-2.0.gir' (search path:
>   '['/usr/lib64', 'gir-1.0', '/usr/local/share/gir-1.0',
> '/usr/share/gir-1.0',
>   '/usr/share/gir-1.0', '/usr/share/gir-1.0']')
>
> This is because g-ir-tool-template.in
> <https://urldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>
> is not setting girdir correctly.
> It's using the prefix instead of the actual girdir.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++++
>  .../gobject-introspection_1.68.0.bb
> <https://urldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$>
>          |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644
> meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
>
> diff --git
> a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> new file mode 100644
> index 0000000000..c0d263946b
> --- /dev/null
> +++
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> @@ -0,0 +1,33 @@
> +From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 13 Jul 2021 02:05:11 -0700
> +Subject: [PATCH] g-ir-tool-template.in
> <https://urldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>:
> fix girdir path
> +
> +In case gir_dir_prefix is set, it's possible that g-ir-scanner
> +cannot find the .gir files. This is because that the girdir
> +is set to gir_dir_prefix, which is wrong. It's not a prefix,
> +it the actual gir dir.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + tools/g-ir-tool-template.in
> <https://urldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>
> | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/g-ir-tool-template.in
> <https://urldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>
> b/tools/g-ir-tool-template.in
> <https://urldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>
> +index 6e98f52e..62c07c31 100755
> +--- a/tools/g-ir-tool-template.in
> <https://urldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>
> ++++ b/tools/g-ir-tool-template.in
> <https://urldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>
> +@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] = datadir
> +
> + # Respect gir_dir_prefix
> + girdir = ''
> +-girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@
> '))
> ++girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@',
> 'gir-1.0'))
> + builtins.__dict__['GIRDIR'] = [girdir]
> +
> + # Again, relative paths first so that the installation prefix is
> relocatable
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.68.0.bb
> <https://urldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$>
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
> <https://urldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$>
> index 048deabe64..647511f7ad 100644
> --- a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.68.0.bb
> <https://urldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$>
> +++ b/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.68.0.bb
> <https://urldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$>
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
>
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}",
> 2)}/${BPN}-${PV}.tar.xz \
>
> file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
> +           file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "d229242481a201b84a0c66716de1752bca41db4133672cfcfb37c93eb6e54a27"
> --
> 2.30.2
>
>
> 
>
>

--000000000000c7a4b005c8a46673
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you please provide the steps needed to reproduce =
the error? Can they be automated and added to the AB? Otherwise, I cannot m=
eaningfully review the patch.</div><div><br></div><div>Also, the second con=
cern is still not addressed: please submit upstream first, and include the =
link to the oe-core submission. It&#39;s only a merge request on gnome gitl=
ab.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Aug 2021 at 06:51,=
 Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
I didn&#39;t notice the previous email.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
The reason that it&#39;s not seen on autobuilder is that it&#39;s runtime =
error.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
At build time, it uses a wrapper which adds extra parameters including the=
 correct path. That&#39;s why we didn&#39;t see any error at build time.</d=
iv>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
Regards,
<div>Qi</div>
</div>
<div id=3D"gmail-m_6892927578432245871appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_6892927578432245871divRplyFwdMsg" dir=3D"ltr"><font sty=
le=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fro=
m:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> Monday, August 2, 2021 20:57<br>
<b>To:</b> Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D=
"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;=
<br>
<b>Subject:</b> Re: [OE-core][PATCH] gobject-introspection: fix default se=
arch path for girdir</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div>The concerns are the same as the previous time this patch was submitt=
ed:</div>
<div><br>
</div>
<div><span>
<div dir=3D"auto">This is not seen in the autobuilder, how can it be repro=
duced?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Also, please submit upstream first.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div>Alex<br>
</div>
</span></div>
</div>
<br>
<div>
<div dir=3D"ltr">On Mon, 2 Aug 2021 at 08:25, Chen Qi &lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt; wr=
ote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
When running g-ir-scanner, we get the following error:<br>
<br>
=C2=A0 Couldn&#39;t find include &#39;GObject-2.0.gir&#39; (search path:<b=
r>
=C2=A0 &#39;[&#39;/usr/lib64&#39;, &#39;gir-1.0&#39;, &#39;/usr/local/shar=
e/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;,<br>
=C2=A0 &#39;/usr/share/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;]&#39;)<b=
r>
<br>
This is because <a href=3D"https://urldefense.com/v3/__http://g-ir-tool-te=
mplate.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-ri=
VTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">
g-ir-tool-template.in</a> is not setting girdir correctly.<br>
It&#39;s using the prefix instead of the actual girdir.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++=
++<br>
=C2=A0.../<a href=3D"https://urldefense.com/v3/__http://gobject-introspect=
ion_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQ=
q-riVTsPB7qUVzZmyFvTA$" rel=3D"noreferrer" target=3D"_blank">gobject-intros=
pection_1.68.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-=
introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch<br>
<br>
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gob=
ject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-gir=
dir-path.patch<br>
new file mode 100644<br>
index 0000000000..c0d263946b<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-=
g-ir-tool-template.in-fix-girdir-path.patch<br>
@@ -0,0 +1,33 @@<br>
+From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001<br=
>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Tue, 13 Jul 2021 02:05:11 -0700<br>
+Subject: [PATCH] <a href=3D"https://urldefense.com/v3/__http://g-ir-tool-=
template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-=
riVTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">
g-ir-tool-template.in</a>: fix girdir path<br>
+<br>
+In case gir_dir_prefix is set, it&#39;s possible that g-ir-scanner<br>
+cannot find the .gir files. This is because that the girdir<br>
+is set to gir_dir_prefix, which is wrong. It&#39;s not a prefix,<br>
+it the actual gir dir.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool-template.i=
n__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qU=
VyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-template.in</a> =
| 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-too=
l-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQ=
q-riVTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-temp=
late.in</a> b/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool=
-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq=
-riVTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-templ=
ate.in</a><br>
+index 6e98f52e..62c07c31 100755<br>
+--- a/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool-templ=
ate.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTs=
PB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-template.in=
</a><br>
++++ b/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool-templ=
ate.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTs=
PB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-template.in=
</a><br>
+@@ -55,7 +55,7 @@ builtins.__dict__[&#39;DATADIR&#39;] =3D datadir<br>
+ <br>
+ # Respect gir_dir_prefix<br>
+ girdir =3D &#39;&#39;<br>
+-girdir =3D os.path.abspath(os.path.join(filedir, &#39;..&#39;, &#39;@gir=
_dir_prefix@&#39;))<br>
++girdir =3D os.path.abspath(os.path.join(filedir, &#39;..&#39;, &#39;@gir=
_dir_prefix@&#39;, &#39;gir-1.0&#39;))<br>
+ builtins.__dict__[&#39;GIRDIR&#39;] =3D [girdir]<br>
+ <br>
+ # Again, relative paths first so that the installation prefix is relocat=
able<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta/recipes-gnome/gobject-introspection/<a href=3D"https://u=
rldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J=
_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"=
noreferrer" target=3D"_blank">gobject-introspection_1.68.0.bb</a>
 b/meta/recipes-gnome/gobject-introspection/<a href=3D"https://urldefense.=
com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy=
92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"noreferrer=
" target=3D"_blank">gobject-introspection_1.68.0.bb</a><br>
index 048deabe64..647511f7ad 100644<br>
--- a/meta/recipes-gnome/gobject-introspection/<a href=3D"https://urldefen=
se.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5=
YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"norefer=
rer" target=3D"_blank">gobject-introspection_1.68.0.bb</a><br>
+++ b/meta/recipes-gnome/gobject-introspection/<a href=3D"https://urldefen=
se.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5=
YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"norefer=
rer" target=3D"_blank">gobject-introspection_1.68.0.bb</a><br>
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc434e812=
8a68bedd59b80b2ac1eb1c4a \<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version(&q=
uot;${PV}&quot;, 2)}/${BPN}-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-giscanner-ignore-err=
or-return-codes-from-ldd-wrapper.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-g-ir-tool-template.i=
n-fix-girdir-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d229242481a201b84a0c66716de1752bca41db4=
133672cfcfb37c93eb6e54a27&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--000000000000c7a4b005c8a46673--

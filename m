Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web12.6173.1593764290011092691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 01:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oiIFVUdZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id f24so16704421vsg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Zi3NtqWnul3Yofq6z6sogjKj1KRgO0yuB9jqm5HqsM=;
        b=oiIFVUdZBwylpa0BVRvFbr1dxvAoVYlgWNFUIDpUjpukCcEsfmzvvBVdf0QFGyh6r2
         l/ncNAxR5rj0/qob3/yZod+fabKfspTMfEoXVrH8YRLb/E5s+b9AQhadlPm3a+gzBjR0
         257wFnV5pxNYj+RcFMArQjTatmzZDdH3HuA3JR2CXOecfgc2fiQW+jrvq4v3Mk7NlR5H
         VE2r6aBUnsAruljv8dm4Vd2KvDEUC6Gdj4yuvhZ3KMMY8wyg5ivRwTo9SmBOOJ84vncc
         +TRu/QB0aJXAstlfQfEu2kwuj2+ZhL8E/MGgE0u4x/1GdWEHQdVBBvWPkUzQEYmjQTnm
         CczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Zi3NtqWnul3Yofq6z6sogjKj1KRgO0yuB9jqm5HqsM=;
        b=KEZVjquM8nO5ntjJiAKAm+kH6eZP5ZVDgy88MZV7up8z89SjP5CM2Jnou7CHVBapcr
         uo4jsjvQyO0okhjxkurgxCSccnOwfm6I9UyTMdW8mp7QHjG71soAusXo5B3RZh8QcrcM
         epDZh3X/frP+lbpuDC8daBkQaajMSXpcrAjxk0Rgw3fWnD3mREJgEB2Cd1UqQl9faNlc
         UkeceM0CahfKAnzUcv+lmH6aanAw2pAZME51fho6/LizLZ8Tl29mpH1ZEg20eXpffEMj
         V+60ubMSyX3/f8fqZoPVmSi//FDeSl7BC+cVkYLGj7aBqpTReD3Ux262KwhZ9nxOPUSe
         1ymA==
X-Gm-Message-State: AOAM532giCXrnhOQVrinInnKEQ0s9I/oMrrdgw5WDJphGUSJrqm4en6f
	vaNmqG2ISQBg3x/JU8rcMAZH2mNqTtyCh13eY5w=
X-Google-Smtp-Source: ABdhPJwSIEaqbJeSvBD5t31BrUf7eLaND03wpIY5XPZvvwydw7SobwYLDm8iKrKNRnG4IwpPAiO6cxmIiawZh0HR/3M=
X-Received: by 2002:a67:2d8d:: with SMTP id t135mr4935466vst.23.1593764289059;
 Fri, 03 Jul 2020 01:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 3 Jul 2020 10:17:57 +0200
Message-ID: <CANNYZj85DJ9zgUvqtdKgYnst+WnwrwFsbmxYiv-t9kRFwUCA=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000004e1fc405a9852a32"

--0000000000004e1fc405a9852a32
Content-Type: text/plain; charset="UTF-8"

Then this needs to be submitted for master first, we have a strict policy
for that.

Alex

On Fri, 3 Jul 2020 at 09:36, Rasmus Villemoes <rasmus.villemoes@prevas.dk>
wrote:

> Commit 992cec44 (coreutils: Move stdbuf into an own package
> coreutils-stdbuf) breaks package-qa when the single-binary
> PACKAGECONFIG is used:
>
> ERROR: coreutils-8.31-r0 do_package_qa: QA Issue: /usr/bin/stdbuf
> contained in package coreutils-stdbuf requires /usr/bin/coreutils, but no
> providers found in RDEPENDS_coreutils-stdbuf? [file-rdeps]
> ERROR: coreutils-8.31-r0 do_package_qa: QA run found fatal errors. Please
> consider fixing them.
> ERROR: Logfile of failure stored in:
> /mnt/ext4/projects/deif/pdsystems/yocto/tmp-glibc/work/ppce300c3-oe-linux/coreutils/8.31-r0/temp/log.do_package_qa.5594
> ERROR: Task
> (/mnt/ext4/projects/deif/pdsystems/yocto/meta-poky/meta/recipes-core/coreutils/coreutils_8.31.bb:do_package_qa)
> failed with exit code '1'
>
> With that PACKAGECONFIG, /usr/bin/stdbuf is just a simple "script"
> containing the single line
>
>   #!/usr/bin/coreutils --coreutils-prog-shebang=stdbuf
>
> Since there's no point splitting stdbuf to its own package when all
> the functionality is in the single big coreutils binary anyway, fix
> this by not creating the separate stdbuf package for the single-binary
> case.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
> The same issue exists in master, which has been bumped to 8.32, but
> other than that the patch should apply cleanly there as well.
>
>  meta/recipes-core/coreutils/coreutils_8.31.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb
> b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 57b2c1bdba..80e8161367 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -58,9 +58,9 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd
> echo false hostname kill l
>
>  sbindir_progs= "chroot"
>
> -PACKAGE_BEFORE_PN_class-target += "coreutils-stdbuf"
> +PACKAGE_BEFORE_PN_class-target += "${@bb.utils.contains('PACKAGECONFIG',
> 'single-binary', '', 'coreutils-stdbuf', d)}"
>  FILES_coreutils-stdbuf = "${bindir}/stdbuf
> ${libdir}/coreutils/libstdbuf.so"
> -RDEPENDS_coreutils_class-target += "coreutils-stdbuf"
> +RDEPENDS_coreutils_class-target += "${@bb.utils.contains('PACKAGECONFIG',
> 'single-binary', '', 'coreutils-stdbuf', d)}"
>
>  # Let aclocal use the relative path for the m4 file rather than the
>  # absolute since coreutils has a lot of m4 files, otherwise there might
> --
> 2.23.0
>
> 
>

--0000000000004e1fc405a9852a32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Then this needs to be submitted for master first, we =
have a strict policy for that.</div><div><br></div><div>Alex<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, 3 Jul 2020 at 09:36, Rasmus Villemoes &lt;<a href=3D"mailto:rasmus.ville=
moes@prevas.dk">rasmus.villemoes@prevas.dk</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Commit 992cec44 (coreutils: Move =
stdbuf into an own package<br>
coreutils-stdbuf) breaks package-qa when the single-binary<br>
PACKAGECONFIG is used:<br>
<br>
ERROR: coreutils-8.31-r0 do_package_qa: QA Issue: /usr/bin/stdbuf containe=
d in package coreutils-stdbuf requires /usr/bin/coreutils, but no providers=
 found in RDEPENDS_coreutils-stdbuf? [file-rdeps]<br>
ERROR: coreutils-8.31-r0 do_package_qa: QA run found fatal errors. Please =
consider fixing them.<br>
ERROR: Logfile of failure stored in: /mnt/ext4/projects/deif/pdsystems/yoc=
to/tmp-glibc/work/ppce300c3-oe-linux/coreutils/8.31-r0/temp/log.do_package_=
qa.5594<br>
ERROR: Task (/mnt/ext4/projects/deif/pdsystems/yocto/meta-poky/meta/recipe=
s-core/coreutils/coreutils_8.31.bb:do_package_qa) failed with exit code &#3=
9;1&#39;<br>
<br>
With that PACKAGECONFIG, /usr/bin/stdbuf is just a simple &quot;script&quo=
t;<br>
containing the single line<br>
<br>
=C2=A0 #!/usr/bin/coreutils --coreutils-prog-shebang=3Dstdbuf<br>
<br>
Since there&#39;s no point splitting stdbuf to its own package when all<br=
>
the functionality is in the single big coreutils binary anyway, fix<br>
this by not creating the separate stdbuf package for the single-binary<br>
case.<br>
<br>
Signed-off-by: Rasmus Villemoes &lt;<a href=3D"mailto:rasmus.villemoes@pre=
vas.dk" target=3D"_blank">rasmus.villemoes@prevas.dk</a>&gt;<br>
---<br>
The same issue exists in master, which has been bumped to 8.32, but<br>
other than that the patch should apply cleanly there as well.<br>
<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=
=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.=
bb" rel=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a> b/meta/recip=
es-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=3D"noreferrer" t=
arget=3D"_blank">coreutils_8.31.bb</a><br>
index 57b2c1bdba..80e8161367 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=
=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.31.bb" rel=
=
=3D"noreferrer" target=3D"_blank">coreutils_8.31.bb</a><br>
@@ -58,9 +58,9 @@ base_bindir_progs =3D &quot;cat chgrp chmod chown cp dat=
e dd echo false hostname kill l<br>
<br>
=C2=A0sbindir_progs=3D &quot;chroot&quot;<br>
<br>
-PACKAGE_BEFORE_PN_class-target +=3D &quot;coreutils-stdbuf&quot;<br>
+PACKAGE_BEFORE_PN_class-target +=3D &quot;${@bb.utils.contains(&#39;PACKA=
GECONFIG&#39;, &#39;single-binary&#39;, &#39;&#39;, &#39;coreutils-stdbuf&#=
39;, d)}&quot;<br>
=C2=A0FILES_coreutils-stdbuf =3D &quot;${bindir}/stdbuf ${libdir}/coreutil=
s/libstdbuf.so&quot;<br>
-RDEPENDS_coreutils_class-target +=3D &quot;coreutils-stdbuf&quot;<br>
+RDEPENDS_coreutils_class-target +=3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;single-binary&#39;, &#39;&#39;, &#39;coreutils-stdbuf&=
#39;, d)}&quot;<br>
<br>
=C2=A0# Let aclocal use the relative path for the m4 file rather than the<=
br>
=C2=A0# absolute since coreutils has a lot of m4 files, otherwise there mi=
ght<br>
-- <br>
2.23.0<br>
<br>
<br>
</blockquote></div>

--0000000000004e1fc405a9852a32--

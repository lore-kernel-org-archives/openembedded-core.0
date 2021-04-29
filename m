Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.5935.1619698555607343541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oz63psHQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id i3so52574003edt.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BQHMKuqvG0E38m6bupOB3mfFsJc2YlZU3JoanJvvTkI=;
        b=Oz63psHQh6W9yjiKLWJuRC3O8SKOaHjO1x6YOmbgV796AhILvBi2nNYhndTR7jXCYJ
         dxQG0dFGqD2NG0UlgoEnRpZQ39QEkgRlry+g/wanAS5Ifdcbj2chKN5pkqdl4k8+3MZa
         a2FWH0RlOkcjeHz8Y7+kXfhezwLjtlqF0PXM4EXQCwcxXmEp9Aij72GrkGb1fRq3yS0R
         a770eXSYe9KqPgc/edPo0zU7ThcsFtZasIGDU1HuTHCJSId32FGlh5O8CjmQfY2egyPZ
         fpj55HDlObXnyJ+WD5Y+a5/FykMvz4VV0PE/jqoGMulQy492O3aUsNI0LVBWfo/jWu+e
         QSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BQHMKuqvG0E38m6bupOB3mfFsJc2YlZU3JoanJvvTkI=;
        b=EkYdrI+/bxKjR8rj3Xp/bqYwBOayhin8Fwor1lcpRp6m2l6x/c0XWbl9Y9D0l09gNl
         V/EAF74LBrRHclH6SQdsw2a8Cwo6AKzgOA1Ctl7IZPJIX8tUkkE+/Sjzw18Rgc+/u6Vu
         CPm2IxOaoxJ07t8pbGD0VlhKZdcfHPX8ugy+KBxsX+5YHpeNRF0BeU6kYo8RwnwKEOoN
         5zLhejZq/nybXe5TySeXgeKwXYNzHB0qSZ37vc/Uqang8yHpbUsUrQ/5h8Ny4NeQtJWN
         +xYkj/yPnOzOmXLwG3WU/ENZX9UdZRaQUEF28DKncxpSvkmDVlse0THbIbYa/0NsatvY
         4SzQ==
X-Gm-Message-State: AOAM533Ij90C5t436HOZ+tqFPTb6193krx4VWt9XiXW7pluRw4BotsXG
	4py37+SRQbTxlLfPDovW+xs3YcwhUH/Kx4UBPdM=
X-Google-Smtp-Source: ABdhPJxzVsCwPAzIk2NqI8yHWGjV2ah1iGl40HF3J6+WGYkcLMrT8WljpL19CZod9/HFINSJ9KzCwSDPiJ6aU3BKLg8=
X-Received: by 2002:a05:6402:652:: with SMTP id u18mr2607461edx.388.1619698554088;
 Thu, 29 Apr 2021 05:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <167A52A9F0F767AB.22271@lists.openembedded.org>
In-Reply-To: <167A52A9F0F767AB.22271@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 29 Apr 2021 14:15:43 +0200
Message-ID: <CA+chaQfJFA-Teo3SL4-F2qxT6JKThZWir_zpQq1gk8t26aT=nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: find .ko.gz and .ko.xz kernel modules as well
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Christophe Chapuis <chris.chapuis@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f5aee205c11b7417"

--000000000000f5aee205c11b7417
Content-Type: text/plain; charset="UTF-8"

Ignore this for now, something else seems to be still broken. Will send v2
later.

On Thu, Apr 29, 2021 at 2:05 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> From: Christophe Chapuis <chris.chapuis@gmail.com>
>
> * with xz PACKAGECONFIG enabled in kmod and xz module compression enabled
> in kernel
>   the do_rootfs task doesn't run depmod in the image, because it thinks
> there are no modules:
>   NOTE: No Kernel Modules found, not running depmod
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>  meta/lib/oe/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 5f81023040..e4de0bfddf 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -305,7 +305,7 @@ class Rootfs(object, metaclass=ABCMeta):
>      def _check_for_kernel_modules(self, modules_dir):
>          for root, dirs, files in os.walk(modules_dir, topdown=True):
>              for name in files:
> -                found_ko = name.endswith(".ko")
> +                found_ko = name.endswith(".ko") or
> name.endswith(".ko.gz") or name.endswith(".ko.xz")
>                  if found_ko:
>                      return found_ko
>          return False
> --
> 2.30.2
>
>
> 
>
>

--000000000000f5aee205c11b7417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ignore this for now, something else seems to be still brok=
en. Will send v2 later.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Apr 29, 2021 at 2:05 PM Martin Jansa via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Marti=
n.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Christophe Chapuis &lt;<a href=3D"mailto:chris.cha=
puis@gmail.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
<br>
* with xz PACKAGECONFIG enabled in kmod and xz module compression enabled =
in kernel<br>
=C2=A0 the do_rootfs task doesn&#39;t run depmod in the image, because it =
thinks there are no modules:<br>
=C2=A0 NOTE: No Kernel Modules found, not running depmod<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
Signed-off-by: Christophe Chapuis &lt;<a href=3D"mailto:chris.chapuis@gmai=
l.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/rootfs.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
index 5f81023040..e4de0bfddf 100644<br>
--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -305,7 +305,7 @@ class Rootfs(object, metaclass=3DABCMeta):<br>
=C2=A0 =C2=A0 =C2=A0def _check_for_kernel_modules(self, modules_dir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for root, dirs, files in os.walk(modules=
_dir, topdown=3DTrue):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for name in files:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_ko =3D name=
.endswith(&quot;.ko&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_ko =3D name=
.endswith(&quot;.ko&quot;) or name.endswith(&quot;.ko.gz&quot;) or name.end=
swith(&quot;.ko.xz&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if found_ko:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return found_ko<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f5aee205c11b7417--

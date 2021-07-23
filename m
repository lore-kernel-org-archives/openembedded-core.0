Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.8791.1627049522179549132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 07:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m36RapmZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id k15so1883950edq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4hXMZGtUnqX3UzAZyn0V6aRz03L1UWHn5v3D0zxBiw=;
        b=m36RapmZQlg73XmokN0MulbJqpdWfEn8hnk5pSeHBYzi5pGSLNXwbLfAW0K2y8hU1n
         M7VVijxAE/756DxcS51YEctXqTDzZL3BxWIR/bgw24f7yIguBzvZaBBVlILzT65O1lYf
         4WRwT2TN558fi/gOFDV6hVKjaqg9CYdDPBKfzf4hFBtjd8Jbbe6RNMo6K8IiLgDNgmDX
         mASJvk4BfKQ5EqTHSMR6TjHekwIMiTEc76v2qAgUDAvsFlIlUSaicsOiwLEXDra13VHF
         7sU8iuaUDn2cdLsIuX80KZVMVNe8rJ4Kaa6O6S9mCmyx1jF8kT7+JNPrMiBF7QECFg17
         tkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h4hXMZGtUnqX3UzAZyn0V6aRz03L1UWHn5v3D0zxBiw=;
        b=QH4o16Hgfa7/5orLlDtUxkl83IpyCHWVygI6WQa+r8R4ERvx/bzMDy+vyTybil6xCL
         0sqD+gBsxv9I5LN2mOTJIuhi0F3RtvDgcdywLC2dYqDMioTJzSx0EjqXfsCI7tETNRAn
         cTHxz+nz4lhKjnOSrWcKB4L7j41N88JvL12BPJHuaXyxMwLlY2euM+gSln/RLT5SJzMh
         hnTB7d54T7LRjvGpCgf2OBXbf8QpHih1p/r5GMCfwidExUcqq0fV4kb7riEvTmBJ2PbK
         dZ7nWbgQDlfVR6w68fdXiKqZFbWd6J/LXR6apNZIzBln3ZQWmlZcAHks5MTq6LfUsHEW
         TJgA==
X-Gm-Message-State: AOAM5339sirVi7+LFs2oYX2BLoTEgpFOyI1Lest3Dt8ce3dFrYlyyxid
	O/t0oKprJ6H5vfr9Jq1z+rC1saFe3zLJqaY1f5c=
X-Google-Smtp-Source: ABdhPJxgtC+DlUKQrQ6WteNZGDDcKVrRldCY5CGd3v1Ud7zz3OU9R3nPLLVAND9YEaT+ulFpvWI4WB+xDnVMe7jFUtI=
X-Received: by 2002:a05:6402:1601:: with SMTP id f1mr5760746edv.388.1627049520405;
 Fri, 23 Jul 2021 07:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210723135348.87531-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210723135348.87531-1-michael.opdenacker@bootlin.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 23 Jul 2021 16:11:49 +0200
Message-ID: <CA+chaQe0K89xQd_Yts5UVbPwOc0AYJtBf0f3xASvmng79zdH_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-builddir: update YP docs and OE URLs
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b21dd605c7cafcd3"

--000000000000b21dd605c7cafcd3
Content-Type: text/plain; charset="UTF-8"

The 2nd chunk doesn't look correct, the 's' has eaten the ':'.

On Fri, Jul 23, 2021 at 3:53 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> This updates the link to the YP docs
> and proposes to access the OE website through https
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/oe-setup-builddir | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 30eaa8efbe..75f63f5680 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -113,10 +113,10 @@ if [ ! -z "$SHOWYPDOC" ]; then
>      cat <<EOM
>  The Yocto Project has extensive documentation about OE including a
> reference
>  manual which can be found at:
> -    http://yoctoproject.org/documentation
> +    https://docs.yoctoproject.org
>
>  For more information about OpenEmbedded see their website:
> -    http://www.openembedded.org/
> +    https//www.openembedded.org/
>
>  EOM
>  #    unset SHOWYPDOC
> --
> 2.25.1
>
>
> 
>
>

--000000000000b21dd605c7cafcd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The 2nd chunk doesn&#39;t look correct, the &#39;s&#39; ha=
s eaten the &#39;:&#39;.</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 3:53 PM Michael Opdenacker =
&lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bo=
otlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">This updates the link to the YP docs<br>
and proposes to access the OE website through https<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker=
@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-setup-builddir | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir<br>
index 30eaa8efbe..75f63f5680 100755<br>
--- a/scripts/oe-setup-builddir<br>
+++ b/scripts/oe-setup-builddir<br>
@@ -113,10 +113,10 @@ if [ ! -z &quot;$SHOWYPDOC&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0cat &lt;&lt;EOM<br>
=C2=A0The Yocto Project has extensive documentation about OE including a r=
eference<br>
=C2=A0manual which can be found at:<br>
-=C2=A0 =C2=A0 <a href=3D"http://yoctoproject.org/documentation" rel=3D"no=
referrer" target=3D"_blank">http://yoctoproject.org/documentation</a><br>
+=C2=A0 =C2=A0 <a href=3D"https://docs.yoctoproject.org" rel=3D"noreferrer=
" target=3D"_blank">https://docs.yoctoproject.org</a><br>
<br>
=C2=A0For more information about OpenEmbedded see their website:<br>
-=C2=A0 =C2=A0 <a href=3D"http://www.openembedded.org/" rel=3D"noreferrer"=
 target=3D"_blank">http://www.openembedded.org/</a><br>
+=C2=A0 =C2=A0 https//<a href=3D"http://www.openembedded.org/" rel=3D"nore=
ferrer" target=3D"_blank">www.openembedded.org/</a><br>
<br>
=C2=A0EOM<br>
=C2=A0#=C2=A0 =C2=A0 unset SHOWYPDOC<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b21dd605c7cafcd3--

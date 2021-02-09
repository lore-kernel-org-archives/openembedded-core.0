Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web09.11628.1612883822516670073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=lP7B76jd;
 spf=pass (domain: madison.systems, ip: 209.85.208.169, mailfrom: matt@madison.systems)
Received: by mail-lj1-f169.google.com with SMTP id b16so7025790lji.13
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A5mZIAo47v8+978SwsE44umli1KZNRdqnwpKk6eGIco=;
        b=lP7B76jdJgOeArvKnfD1Ux7t229VX2+nTzbX38T3w85duPQRc20/iK46ezVgUm/nB0
         yurQvwIupHaEU33VSeueVFc3RkNKa9j2uKR3KEGQc3N26AIx7U5FHld8OnKDGMrBNMe3
         QMqaBNNWp+7eUC13VrUQYTv4tWBbdxHuzWHzF6uebn8zWpA6gO0WQs0lABf1Azu+0c94
         pHaZSWNQRSj3QPcTXvSxr8US5/W9teFdcpAqdWfu9Q2ahGl+2vVJkZcNQkBgDDSbHr5w
         zvwb/7PNlxooL0G59uZyrwxQDxMjn9XeW0zGGo1MaQknWSQe1vgImYp026XR0hLG4rx0
         9bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A5mZIAo47v8+978SwsE44umli1KZNRdqnwpKk6eGIco=;
        b=emTzLV20j2bH8z1ZEOS2P2BxuaKwVuoBG83HnOE3cA0A7ipL9pZv0Np4C85V6sxVbk
         B7SV6goZFArCMDcGawyTjmjc+ewJNhZKJDv8t+q6GHa6fjBbNgypGN2W8kUDjhmBmOS/
         jnYjIcaQI0M8d9ohz3pF1FpeYv/AzZNJCGrjQO+5ay8eBMsFhADPNBXoRxcIBT2RLDTx
         Tw8iVNYDSc+1uO6A3ExcxYLkXWmDp+ZEL27gvF8zWxsJcY2YJ/4cnrAM9MqzfJEPx/mz
         VHMCjnspYb8HEIDvii/cmqUIkuCAertH9ndLepvk3RiGsvDlzQVVgd8d5eIaOQTRlEh0
         xg8Q==
X-Gm-Message-State: AOAM533ffHY/N3ynqxrqpQMAHZtY+YeY92Pye1YPqy36OOxWF9YZH0RA
	zUd0u7VFIoAOgtJP6J04WvbRhbpzg6jnWwdTalrt4Q==
X-Google-Smtp-Source: ABdhPJxrYDFT14l9U1zqZwuuffNST2ZAyChJV+ENx2WO8nEjvCi4bW7SxogkeuiXOKhuNeWWzAsZ3gSh4S+C/minCyw=
X-Received: by 2002:a2e:3203:: with SMTP id y3mr5304915ljy.476.1612883820495;
 Tue, 09 Feb 2021 07:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20210209143439.1807422-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210209143439.1807422-1-richard.purdie@linuxfoundation.org>
From: "Matt Madison" <matt@madison.systems>
Date: Tue, 9 Feb 2021 07:16:49 -0800
Message-ID: <CAGgRHJpP0B8RUnDwT5vyTApstFggmQPfXWd5xuF8iKUsX4i-Sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: Fix patch glitches
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002f61c305bae8c722"

--0000000000002f61c305bae8c722
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 6:34 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The original patch contained some text which shouldn't have been there
> and used brackets in configure which isn't a great idea. Tweak the patch
> to resolve this.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> index 285d258c635..6d0b1486ad3 100644
> --- a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> +++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> @@ -9,13 +9,12 @@ Index: opkg-0.4.4/configure.ac
>  ===================================================================
>  --- opkg-0.4.4.orig/configure.ac
>  +++ opkg-0.4.4/configure.ac
> -@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
> +@@ -281,7 +281,11 @@ AC_FUNC_UTIME_NULL
>   AC_FUNC_VPRINTF
>   AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup
> strerror strndup strrchr strstr strtol strtoul sysinfo utime])
>
>  -CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
> -+1607446883
> -+if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
> ++if ! -z "$SOURCE_DATE_EPOCH" ; then
>

This doesn't look like valid shell syntax - there should be a 'test'
command before the '!', right?
Or change the whole thing to use AS_IF.

-Matt

 +    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d
> '\n'`
>  +else
>  +    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
> --
> 2.27.0
>
>
> 
>
>

--0000000000002f61c305bae8c722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 6:34 AM Richar=
d Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">The original patch contained some text which shou=
ldn&#39;t have been there<br>
and used brackets in configure which isn&#39;t a great idea. Tweak the pat=
ch<br>
to resolve this.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/=
recipes-devtools/opkg/opkg/sourcedateepoch.patch<br>
index 285d258c635..6d0b1486ad3 100644<br>
--- a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch<br>
+++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch<br>
@@ -9,13 +9,12 @@ Index: opkg-0.4.4/<a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- opkg-0.4.4.orig/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
=C2=A0+++ opkg-0.4.4/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
-@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL<br>
+@@ -281,7 +281,11 @@ AC_FUNC_UTIME_NULL<br>
=C2=A0 AC_FUNC_VPRINTF<br>
=C2=A0 AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup =
strerror strndup strrchr strstr strtol strtoul sysinfo utime])<br>
<br>
=C2=A0-CLEAN_DATE=3D`date +&quot;%B %Y&quot; | tr -d &#39;\n&#39;`<br>
-+1607446883<br>
-+if [ ! -z &quot;$SOURCE_DATE_EPOCH&quot; ]; then<br>
++if ! -z &quot;$SOURCE_DATE_EPOCH&quot; ; then<br></blockquote><div><br><=
/div><div>This doesn&#39;t look like valid=C2=A0shell syntax - there should=
 be a &#39;test&#39; command before the &#39;!&#39;, right?</div><div>Or ch=
ange the whole thing to use AS_IF.<br></div><div><br></div><div>-Matt</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0+=C2=A0 =C2=A0 CLEAN_DATE=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH =
+&quot;%B %Y&quot; | tr -d &#39;\n&#39;`<br>
=C2=A0+else<br>
=C2=A0+=C2=A0 =C2=A0 CLEAN_DATE=3D`date +&quot;%B %Y&quot; | tr -d &#39;\n=
&#39;`<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000002f61c305bae8c722--

Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.34547.1605533407602033639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 05:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kecVy6Fl;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a15so18720940edy.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 05:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwSpeaXdLHTchfEjx9KLZnJiKDDSc5LTa0WBD62LxJ4=;
        b=kecVy6Fl0TRV2f8gP5MwKgO54aKVUxYL+Ytg+3Bj6WcaWQOaEKu7qjGuEsRk/9bL8X
         L4J7rThvj1Q8qUgYwHJwaof4tGKhARWu08DXXy6zjryLxhSnyIi5J/A8l1gvrF110Mol
         /WNUR7He7iMyTt6XWnKyDUz6X6gcZ9KJSgrqmos+m+izltqlo/YgcS154CtB9eVFrNnM
         ZWSe3KTkjkJyVfVz9XYLn39m070XT622ycj1OOlzDpRrZpzyfs5nSGiq9uhV5NGBWSv1
         2okB/hivA9evhja8dah5glFKijpfKGbHkB24+O5KemtPPTpYxcJ/Yjm+2Eie4UzPywY4
         YD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwSpeaXdLHTchfEjx9KLZnJiKDDSc5LTa0WBD62LxJ4=;
        b=cG/Tu6OJhfNZ7ZNJbNZ6KSwsIe7wuEDKVrfGWoVVslH00geh0hJpmEr1+RkzJGNNGE
         4GlYnRzZ42RP+ocfmvO/NVrFujpCXuZu+uwkmqt92Vkqtn7W+IcImr1iHJsfmGS4Xz3i
         engba9Umwce4PF0VgW4hYK+nCXOK3TTu/Rlt8DLrkvk2FqnltXdiX7NtdoLEdLouJHcm
         xI5kPIeuQhpSUvmH0hD50+SYZYkps3FBkQAnBZALuXmdUTyUd8jJ8oMfiKzJXo3XuOgy
         AQ9SVkWxljOZkbf1EFNbb10x8ZMa4dR7110wwlL41jCqHsXQPQ5LzHSwcBicY2tUmPzg
         tvOA==
X-Gm-Message-State: AOAM530o1t+Ki1OMhyviyv0KLM+Su35IXnenmx74gpZ18GbEqCa/Q4Hu
	EJSCGXeehVF4dhqjqGOv30v2J83ceLtPBlRv6qw=
X-Google-Smtp-Source: ABdhPJwePPAR2cPcId7BVRxpABuAZ25+3oQq0aj7A6ZJttmWgIoABHiyiMs+9/ybxDgsTLDpdWr4McUcOBSW3UfxSIk=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr15247076eds.352.1605533406090;
 Mon, 16 Nov 2020 05:30:06 -0800 (PST)
MIME-Version: 1.0
References: <1605548543-88442-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1605548543-88442-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 16 Nov 2020 08:29:55 -0500
Message-ID: <CADkTA4OJ325xQKJ+HjA8Yx05XQjGnbXF8tT_mdaCe-U7h7WBKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemtap: upgrade 4.3 -> 4.4
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000585b1f05b439602a"

--000000000000585b1f05b439602a
Content-Type: text/plain; charset="UTF-8"

systemtap is one of the packages that gives us trouble on upgrades
and on kernel upgrades.

There's an oe-selftest available for this, can you add the logs of having
run it into this commit ?

Bruce

On Mon, Nov 16, 2020 at 12:43 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc
> b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 56fa51d61e..ae735025b7 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,7 +1,7 @@
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -SRCREV = "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
> -PV = "4.3"
> +SRCREV = "988f439af39a359b4387963ca4633649866d8275"
> +PV = "4.4"
>
>  SRC_URI = "git://sourceware.org/git/systemtap.git \
>
> file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
> --
> 2.25.1
>
>
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000585b1f05b439602a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">systemtap is one of the packages that gives us trouble on upg=
rades</div><div class=3D"gmail_default" style=3D"font-size:small">and on ke=
rnel upgrades.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">There&#39;=
s an oe-selftest available=C2=A0for this, can you add the logs of having</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">run it into this =
commit ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Nov 16, 2020 at 12:43 AM zangrc &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=
=
=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fu=
jitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipe=
s-kernel/systemtap/systemtap_git.inc<br>
index 56fa51d61e..ae735025b7 100644<br>
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263&quot;<br>
-SRCREV =3D &quot;82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd&quot;<br>
-PV =3D &quot;4.3&quot;<br>
+SRCREV =3D &quot;988f439af39a359b4387963ca4633649866d8275&quot;<br>
+PV =3D &quot;4.4&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/systemt=
ap.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/systemtap.g=
it</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-let-configure=
-write-a-python-location-into-th.patch \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000585b1f05b439602a--

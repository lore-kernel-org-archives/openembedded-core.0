Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web12.6563.1601036791126990467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 05:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sGu90Pzs;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id p24so1266574vsf.8
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zG6MNzWeduIXnp8e7thcz3E1beoFTHhDyFL4RIHNGh0=;
        b=sGu90PzsuBqDFkmkYkdc2NjI0uNKs4anEZT0PfxD+Yi2cuJOnfnm8ZVY9MHRPEkRuE
         SOW9EiqXwiT66amuXuhYp4lVqIRSmJU1Zy0bM8WhryG6RXilLePbVQa/LN8d34z/QVwq
         2pxE85HQOAQEeYWpJavXIouZQm4xrDLHmJy9X5rhvNqELw/QMh4cjPD7ifD00BZKhToa
         O3vnLk7CryB41wMS/hnJyW6DVX5xn6Q6qa94FmlflWNe2qgjNJnXymdTHKdupfVhx69E
         qEiSfjG+2Vhuj0n0tKjP4+F5adIKKerl/LKDxRpzUxlGDsnxrPRjyYh1P3YoYLa667a2
         PIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zG6MNzWeduIXnp8e7thcz3E1beoFTHhDyFL4RIHNGh0=;
        b=S7xWj1oDCKPCjmbY3K6OBmDFOhZcvHGElDROOUBqcS/FpSQBVs++UFtwhR2ViuDGxn
         yGgEkloU78fpLOEx8ZHZi9AXN9i6S6hIdWgG8XpRV5HkV3HgDHPGgmNgGvP1JyfwAZBh
         /c+39rcf3OwE6fiYjYUZYu1Ie2JBZKAvZDuG4NyILgYf4tzCvBzRKe4Ejazf4xo3uoiZ
         /sZDuwV1VSotulXCia3aJ+0VukGY4I9R7xUeyCtJcfMtnEXy9/XJPeimElIqwuDYxRFG
         Vbqwk78djEgHQ+vNM+dQ55MAVqglLj/+Sj/EUJEoke+B5yNAHhTs3e0c64RtsYX8HihM
         SBJQ==
X-Gm-Message-State: AOAM5301O+kqdbmUxREPyHB3c+l3y3Cb3dydhS0MQPM8sDXKyMr5JlFP
	8qXIdpPdEIVMtjiXbGa01LwQQCCAPVpzNUw70Zs=
X-Google-Smtp-Source: ABdhPJyCF+82VRabL9h52Jd75H0rh13M0yEo17yRDnvWXqbSnK4EtD2Uid81wJOg4jbzWVWIcvizJTvdy7BDo4f6154=
X-Received: by 2002:a67:68d2:: with SMTP id d201mr2552991vsc.41.1601036789565;
 Fri, 25 Sep 2020 05:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <1601054877-37253-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1601054877-37253-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 25 Sep 2020 14:26:18 +0200
Message-ID: <CANNYZj-YbD5QyDeSeYT4tF-8FqxQMhRGAD6whL0kan34TOVS5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bind:upgrade 9.16.5 -> 9.16.7
To: Wang Mingyu <wangmy@cn.fujitsu.com>, Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001d4e8a05b0226d33"

--0000000000001d4e8a05b0226d33
Content-Type: text/plain; charset="UTF-8"

To improve readability of the commit subjects, please add a space after :

Like this:
bind: upgrade 9.16.5 -> 9.16.7

Alex

On Fri, 25 Sep 2020 at 07:28, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../0001-avoid-start-failure-with-bind-user.patch               | 0
>  .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
>  .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
>  .../bind/{bind-9.16.5 => bind-9.16.7}/bind9                     | 0
>  .../bind/{bind-9.16.5 => bind-9.16.7}/conf.patch                | 0
>  .../bind/{bind-9.16.5 => bind-9.16.7}/generate-rndc-key.sh      | 0
>  .../init.d-add-support-for-read-only-rootfs.patch               | 0
>  .../make-etc-initd-bind-stop-work.patch                         | 0
>  .../bind/{bind-9.16.5 => bind-9.16.7}/named.service             | 0
>  .../bind/{bind_9.16.5.bb => bind_9.16.7.bb}                     | 2 +-
>  10 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/0001-avoid-start-failure-with-bind-user.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/bind-ensure-searching-for-json-headers-searches-sysr.patch
> (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 => bind-9.16.7}/bind9
> (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/conf.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/generate-rndc-key.sh (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/init.d-add-support-for-read-only-rootfs.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/make-etc-initd-bind-stop-work.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.16.5 =>
> bind-9.16.7}/named.service (100%)
>  rename meta/recipes-connectivity/bind/{bind_9.16.5.bb => bind_9.16.7.bb}
> (98%)
>
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch
> b/meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch
> similarity index 100%
> rename from
> meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch
> rename to
> meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> b/meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> similarity index 100%
> rename from
> meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> rename to
> meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
> b/meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
> similarity index 100%
> rename from
> meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
> rename to
> meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind9
> b/meta/recipes-connectivity/bind/bind-9.16.7/bind9
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.16.5/bind9
> rename to meta/recipes-connectivity/bind/bind-9.16.7/bind9
> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
> b/meta/recipes-connectivity/bind/bind-9.16.7/conf.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
> rename to meta/recipes-connectivity/bind/bind-9.16.7/conf.patch
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
> b/meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
> rename to meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch
> b/meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch
> similarity index 100%
> rename from
> meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch
> rename to
> meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch
> b/meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch
> similarity index 100%
> rename from
> meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch
> rename to
> meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/named.service
> b/meta/recipes-connectivity/bind/bind-9.16.7/named.service
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.16.5/named.service
> rename to meta/recipes-connectivity/bind/bind-9.16.7/named.service
> diff --git a/meta/recipes-connectivity/bind/bind_9.16.5.bb
> b/meta/recipes-connectivity/bind/bind_9.16.7.bb
> similarity index 98%
> rename from meta/recipes-connectivity/bind/bind_9.16.5.bb
> rename to meta/recipes-connectivity/bind/bind_9.16.7.bb
> index eb263c2eda..5fc2c1d3cd 100644
> --- a/meta/recipes-connectivity/bind/bind_9.16.5.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.16.7.bb
> @@ -19,7 +19,7 @@ SRC_URI = "
> https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[sha256sum] =
> "6378b3e51fef11a8be4794dc48e8111ba92d211c0dfd129a0c296ed06a3dc075"
> +SRC_URI[sha256sum] =
> "9f7d1812ebbd26a699f62b6fa8522d5dec57e4bf43af0042a0d60d39ed8314d1"
>
>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>  # stay at 9.16 follow the ESV versions divisible by 4
> --
> 2.25.1
>
>
>
>
> 
>
>

--0000000000001d4e8a05b0226d33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To improve readability of the commit subjects, please=
 add a space after :</div><div><br></div><div>Like this:</div><div></div><d=
iv>bind: upgrade 9.16.5 -&gt; 9.16.7</div><div><br></div><div>Alex<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, 25 Sep 2020 at 07:28, Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.=
fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Zang Ruochen &lt;<a href=3D"mailto:=
zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a=
>&gt;<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.c=
om" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0001-avoid-start-failure-with-bind-user.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../0001-named-lwresd-V-and-start-log-hide-build-options.patch=C2=A0=
 | 0<br>
=C2=A0.../bind-ensure-searching-for-json-headers-searches-sysr.patch=C2=A0=
 | 0<br>
=C2=A0.../bind/{bind-9.16.5 =3D&gt; bind-9.16.7}/bind9=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../bind/{bind-9.16.5 =3D&gt; bind-9.16.7}/conf.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0.../bind/{bind-9.16.5 =3D&gt; bind-9.16.7}/generate-rndc-key.sh=C2=
=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0.../init.d-add-support-for-read-only-rootfs.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../make-etc-initd-bind-stop-work.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../bind/{bind-9.16.5 =3D&gt; bind-9.16.7}/named.service=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../bind/{<a href=3D"http://bind_9.16.5.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bind_9.16.5.bb</a> =3D&gt; <a href=3D"http://bind_9.16.7.bb" r=
el=3D"noreferrer" target=3D"_blank">bind_9.16.7.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A010 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/0001-avoid-start-failure-with-bind-user.patch (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/bind9 (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/conf.patch (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/generate-rndc-key.sh (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/init.d-add-support-for-read-only-rootfs.patch (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/make-etc-initd-bind-stop-work.patch (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{bind-9.16.5 =3D&gt; bind-9.16=
.7}/named.service (100%)<br>
=C2=A0rename meta/recipes-connectivity/bind/{<a href=3D"http://bind_9.16.5=
.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.16.5.bb</a> =3D&gt; <a hre=
f=3D"http://bind_9.16.7.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.16.=
7.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-f=
ailure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.7/00=
01-avoid-start-failure-with-bind-user.patch<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-fa=
ilure-with-bind-user.patch<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-fail=
ure-with-bind-user.patch<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-=
V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/b=
ind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V=
-and-start-log-hide-build-options.patch<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-a=
nd-start-log-hide-build-options.patch<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-search=
ing-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/b=
ind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searchi=
ng-for-json-headers-searches-sysr.patch<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching=
-for-json-headers-searches-sysr.patch<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind9 b/meta/recip=
es-connectivity/bind/bind-9.16.7/bind9<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/bind9<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/bind9<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch b/meta/=
recipes-connectivity/bind/bind-9.16.7/conf.patch<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/conf.patch<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/conf.patch<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.=
sh b/meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.s=
h<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh<=
br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support=
-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.7/in=
it.d-add-support-for-read-only-rootfs.patch<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-=
for-read-only-rootfs.patch<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-fo=
r-read-only-rootfs.patch<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bin=
d-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.7/make-etc-ini=
td-bind-stop-work.patch<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind=
-stop-work.patch<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-s=
top-work.patch<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/named.service b/me=
ta/recipes-connectivity/bind/bind-9.16.7/named.service<br>
similarity index 100%<br>
rename from meta/recipes-connectivity/bind/bind-9.16.5/named.service<br>
rename to meta/recipes-connectivity/bind/bind-9.16.7/named.service<br>
diff --git a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.5.=
bb" rel=3D"noreferrer" target=3D"_blank">bind_9.16.5.bb</a> b/meta/recipes-=
connectivity/bind/<a href=3D"http://bind_9.16.7.bb" rel=3D"noreferrer" targ=
et=3D"_blank">bind_9.16.7.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.5.b=
b" rel=3D"noreferrer" target=3D"_blank">bind_9.16.5.bb</a><br>
rename to meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">bind_9.16.7.bb</a><br>
index eb263c2eda..5fc2c1d3cd 100644<br>
--- a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">bind_9.16.5.bb</a><br>
+++ b/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">bind_9.16.7.bb</a><br>
@@ -19,7 +19,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bin=
d9/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-avoid-start-failure-=
with-bind-user.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;6378b3e51fef11a8be4794dc48e8111ba92d211c0dfd=
129a0c296ed06a3dc075&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9f7d1812ebbd26a699f62b6fa8522d5dec57e4bf43af=
0042a0d60d39ed8314d1&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bind=
9/" rel=3D"noreferrer" target=3D"_blank">https://ftp.isc.org/isc/bind9/</a>=
&quot;<br>
=C2=A0# stay at 9.16 follow the ESV versions divisible by 4<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001d4e8a05b0226d33--

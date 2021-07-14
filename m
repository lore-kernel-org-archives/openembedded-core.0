Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.6824.1626270340667122353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 06:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cIY2dcEb;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id q20so651424uaa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O9TcNfKVGiWpG2okqCTF8O+P3TWOVfTml50YM6l0VwI=;
        b=cIY2dcEb/2OGk9aETq40K9G99FI5lAhRMO8rLATcoAsAzOAzJ6D9v8I0w5YVS3dvKd
         qGxbQGVmDzJ+5gtGxdiVvG9QhPgRuLVeDWUeLX9Hx0H3gIUG3xM0KkpqpP8BA1sulLd7
         4ctYGhi3au6tND5/LEfCFqR5AhMFynk1luMOvP+yrkmHtFlnpEseaV+elJS4bdiL6PQo
         7NY3poLSjNUKXpN6gCnvPyElcq/4QwTS70hQ7mKxK3ToPs7RUUjQmgQ7p9r7LL3gtU/n
         3xsyuGyPV3MI+Gk9LqbsTYES303zQyORjizJtPyaVY4J6Cg1UFEaUSI7p+siWv9Pdzd9
         kgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O9TcNfKVGiWpG2okqCTF8O+P3TWOVfTml50YM6l0VwI=;
        b=WgTqPFsNiJZU2URUP3c1D5VgzHaAo9icGxqhdDCesZkqpvKdTn/gKw1lQi8N1UlmDe
         p6zrXcf1Ird5zxmkQWOdwkOKj5xEa5jrzRDZKIZsfOkjn+6xKj3BG/50fLOXj6W1GURO
         bVgrQDRJ0fHCgOOlUle3zgXg7ESXa4+lyNtJUxwmI4tHu/v1LB7KsF70K1GxCJTAK8HT
         Qv3MKQ5u9a/1MRMPcoc8l8GH5Z9Lutl6mQnDgy7oRcsrIAYGXnWkUdv4BOMQhybs9QOC
         JncoUdoFtJYk+nWNmssCI2xx1SZE+oPZ8dLEz8QbC0/ZjPKxl3Wz+lpWEI/FrkMMcRc2
         xLRQ==
X-Gm-Message-State: AOAM530oG5kkuzYny/BPeatFSLib+kbhfFEokatzyX7w5kiLHYiTtbWi
	VLD7dZNo0T4bc9/m7Alb50DrjvqtBrOpTXH4wFA=
X-Google-Smtp-Source: ABdhPJzAq6j5jeoabAcuyWkCMTSNDMwVM2cBaMMlRFzHnzAwkjOUm92ZAXIaxAUhWP4hjFVtYj3uvrvNOH7J/cHjs18=
X-Received: by 2002:ab0:5962:: with SMTP id o31mr14056508uad.89.1626270339796;
 Wed, 14 Jul 2021 06:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
In-Reply-To: <20210714134248.21366-1-JPEWhacker@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 14 Jul 2021 15:45:28 +0200
Message-ID: <CANNYZj8QESeodwNfdV1Ve4GzfW5tQkLTtNA5qac1jt09wW5OMA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e9906805c71591db"

--000000000000e9906805c71591db
Content-Type: text/plain; charset="UTF-8"

While I welcome the transition to zstd, I think the commit message needs to
be more descriptive. Needed by bitbake where and how? Is there some
patchset upcoming?

Alex

On Wed, 14 Jul 2021 at 15:42, Joshua Watt <JPEWhacker@gmail.com> wrote:

> Adds the command line compression tools which are needed by bitbake
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f451ba6a47..3801db7d42 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -484,12 +484,12 @@ HOSTTOOLS += " \
>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp
> comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr
> false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip
> gzip \
> -    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo
> mknod \
> +    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir
> mkfifo mknod \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> -    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> +    python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed
> seq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true
> uname \
> -    uniq wc wget which xargs \
> +    uniq wc wget which xargs zstd \
>  "
>
>  # Tools needed to run testimage runtime image testing
> --
> 2.32.0
>
>
> 
>
>

--000000000000e9906805c71591db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>While I welcome the transition to zstd, I think the c=
ommit message needs to be more descriptive. Needed by bitbake where and how=
? Is there some patchset upcoming?<br></div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, 14 Jul 2021 at 15:42, Joshua Watt &lt;<a href=3D"mailto:JPEWhack=
er@gmail.com">JPEWhacker@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Adds the command line compression tools w=
hich are needed by bitbake<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" tar=
get=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index f451ba6a47..3801db7d42 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -484,12 +484,12 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0[ ar as awk basename bash bzip2 cat chgrp chmod chown =
chrpath cmp comm cp cpio \<br>
=C2=A0 =C2=A0 =C2=A0cpp cut date dd diff diffstat dirname du echo egrep en=
v expand expr false \<br>
=C2=A0 =C2=A0 =C2=A0fgrep file find flock g++ gawk gcc getconf getopt git =
grep gunzip gzip \<br>
-=C2=A0 =C2=A0 head hostname iconv id install ld ldd ln ls make md5sum mkd=
ir mkfifo mknod \<br>
+=C2=A0 =C2=A0 head hostname iconv id install ld ldd ln ls lz4c make md5su=
m mkdir mkfifo mknod \<br>
=C2=A0 =C2=A0 =C2=A0mktemp mv nm objcopy objdump od patch perl pr printf p=
wd \<br>
-=C2=A0 =C2=A0 python3 ranlib readelf readlink realpath rm rmdir rpcgen se=
d seq sh \<br>
+=C2=A0 =C2=A0 python3 pzstd ranlib readelf readlink realpath rm rmdir rpc=
gen sed seq sh \<br>
=C2=A0 =C2=A0 =C2=A0sha1sum sha224sum sha256sum sha384sum sha512sum \<br>
=C2=A0 =C2=A0 =C2=A0sleep sort split stat strings strip tail tar tee test =
touch tr true uname \<br>
-=C2=A0 =C2=A0 uniq wc wget which xargs \<br>
+=C2=A0 =C2=A0 uniq wc wget which xargs zstd \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# Tools needed to run testimage runtime image testing<br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e9906805c71591db--

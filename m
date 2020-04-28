Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.887.1588097262462658439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 11:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cjVtCcF6;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id k8so18004508ejv.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZgnWi3GucAbg6fJEgv1aZlgOvvavorPzMAOaw2+QYs=;
        b=cjVtCcF604O1VCPulEqGq4WC+Bj5mUGI/+SwVgU2VWeZpQD3p5s46dy+/NkJDHmTZW
         +WehmtoY6XlbTBNvCQN0lmDwTbYGdE7j32Rb6tPU3hoIkOdiu6/BGTJ6CVGAwksoxWT6
         PWgi5Dfgn6z2d3p6E9YBTBuyWlkhACi9PSYzeABl+zZ6AlP6OLP+mtQ6BSdrEEN2e6u0
         vZCF4j3D07sgRk4I7G9EDEiQtMmxUDlOxJ6RsUp+I8tkm+J8bw/fSLAJabwyNQqBy3Fc
         vwFZGbRBFVtSF+DobDuZlihuamlhZrAoADKxalcYf2uU4OvGTNvJtwUhGdnjBjn8f7wf
         9lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZgnWi3GucAbg6fJEgv1aZlgOvvavorPzMAOaw2+QYs=;
        b=YjxovQDzWl8a86YQPPtqmHZWtFYoGDZgg2JaYx1UNUpenvrWqleUy5d40NMbWwyJ33
         rl3jU/PBEcWNtevuNHMcO7V/gZAdHb3GKTo00TSaA7IGdT6oNSmyNWdlRO5+znQQ+/bM
         4y1vgKry7KEB3seMo4aBmL6DN+f58EcQfB+cHs/CsclHlKcTfhJjcyHVcwincjojiaNO
         LZy97dklSvUe6J9r2XeDj9V9neTsRJKmnarmAeUmOWNMxnZwsnL+ajkE7/CBfanRcDJv
         mOajCA4K9+Qa6rIgUX91V0hL7a8d3sgSe2FVWYWC4kRYgnt2UoOM+GuTYbBHdlHJmzJx
         wqPg==
X-Gm-Message-State: AGi0PuaF3RAcbdsg5ImmDGw/Yt9rmtWEcMflIafgwriK8aOtNWu59A8Y
	4otM/sPIxeCW/POxrHf8j2TAtWBKj47qIM7oA3o=
X-Google-Smtp-Source: APiQypJZOrPBh5ezzbisHjOhQmuUwQ1S7gH1gS+AJwFsgyDeayFuS+/Cx2r3GvsJcX1if1EVxY1knZqyCpQ5M6f7rIo=
X-Received: by 2002:a17:906:1199:: with SMTP id n25mr26870651eja.30.1588097260801;
 Tue, 28 Apr 2020 11:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587931177.git.akuster808@gmail.com>
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 28 Apr 2020 20:07:29 +0200
Message-ID: <CA+chaQfuCTZYou7qcUagwBpMHS51KW2VT6yt2L1ugySLuQ7a_w@mail.gmail.com>
Subject: Re: [OE-core] [zeus 0/7] Merge request
To: akuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000019518905a45db573"

--00000000000019518905a45db573
Content-Type: text/plain; charset="UTF-8"

Hi,

can you please include:
https://lists.openembedded.org/g/openembedded-core/topic/zeus_patch_qemu_replace/73197049?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,80,73197049

or did I misunderstood your last reply in that thread?

On Tue, Apr 28, 2020 at 4:16 AM akuster <akuster808@gmail.com> wrote:

> Please consider these changes for zeus
> The following changes since commit
> 5ac98c776f9b77804a0ee812f47f3ecf593e432f:
>
>   kernelsrc.bbclass: Fix externalsrc support (2020-04-06 15:17:05 +0800)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next
>
> Adrian Bunk (1):
>   openssl: Upgrade 1.1.1d -> 1.1.1e
>
> Alexander Kanavin (1):
>   openssl: update to 1.1.1f
>
> Denys Dmytriyenko (1):
>   openssl: recommend cryptodev-module for corresponding PACKAGECONFIG
>
> Lee Chee Yang (2):
>   cve-check: CPE version '-' as all version
>   wic: align layer plugin path
>
> Ovidiu Panait (1):
>   inetutils: Use alternatives to avoid manpage conflict
>
> Richard Purdie (1):
>   pseudo: Ensure we use our own libsqlite
>
>  meta/classes/cve-check.bbclass                |   2 +-
>  .../inetutils/inetutils_1.9.4.bb              |   6 +-
>  .../openssl/openssl/CVE-2019-1551.patch       | 758 ------------------
>  .../{openssl_1.1.1d.bb => openssl_1.1.1f.bb}  |   6 +-
>  .../recipes-core/meta/cve-update-db-native.bb |   2 +-
>  meta/recipes-devtools/pseudo/pseudo.inc       |   2 +
>  scripts/lib/wic/help.py                       |   3 +-
>  scripts/lib/wic/pluginbase.py                 |  11 +-
>  8 files changed, 19 insertions(+), 771 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2019-1551.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1d.bb =>
> openssl_1.1.1f.bb} (97%)
>
> --
> 2.17.1
>
> 
>

--00000000000019518905a45db573
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>can you please include:</div><div><=
a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/zeus_pat=
ch_qemu_replace/73197049?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,80=
,73197049">https://lists.openembedded.org/g/openembedded-core/topic/zeus_pa=
tch_qemu_replace/73197049?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,8=
0,73197049</a><br></div><div><br></div><div>or did I misunderstood your las=
t reply in that thread?</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2020 at 4:16 AM akuster &lt;=
<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Please consider=
 these changes for zeus<br>
The following changes since commit 5ac98c776f9b77804a0ee812f47f3ecf593e432=
f:<br>
<br>
=C2=A0 kernelsrc.bbclass: Fix externalsrc support (2020-04-06 15:17:05 +08=
00)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded=
-core-contrib</a> stable/zeus-next<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/l=
og/?h=3Dstable/zeus-next" rel=3D"noreferrer" target=3D"_blank">http://cgit.=
openembedded.org/openembedded-core-contrib/log/?h=3Dstable/zeus-next</a><br=
>
<br>
Adrian Bunk (1):<br>
=C2=A0 openssl: Upgrade 1.1.1d -&gt; 1.1.1e<br>
<br>
Alexander Kanavin (1):<br>
=C2=A0 openssl: update to 1.1.1f<br>
<br>
Denys Dmytriyenko (1):<br>
=C2=A0 openssl: recommend cryptodev-module for corresponding PACKAGECONFIG=
<br>
<br>
Lee Chee Yang (2):<br>
=C2=A0 cve-check: CPE version &#39;-&#39; as all version<br>
=C2=A0 wic: align layer plugin path<br>
<br>
Ovidiu Panait (1):<br>
=C2=A0 inetutils: Use alternatives to avoid manpage conflict<br>
<br>
Richard Purdie (1):<br>
=C2=A0 pseudo: Ensure we use our own libsqlite<br>
<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../inetutils/<a href=3D"http://inetutils_1.9.4.bb" rel=3D"noreferre=
r" target=3D"_blank">inetutils_1.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../openssl/openssl/CVE-2019-1551.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
758 ------------------<br>
=C2=A0.../{<a href=3D"http://openssl_1.1.1d.bb" rel=3D"noreferrer" target=
=3D"_blank">openssl_1.1.1d.bb</a> =3D&gt; <a href=3D"http://openssl_1.1.1f=
.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1f.bb</a>}=C2=A0 |=C2=
=
=A0 =C2=A06 +-<br>
=C2=A0.../recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> |=C2=A0 =C2=
=A02 +-<br>
=C2=A0meta/recipes-devtools/pseudo/pseudo.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +<br>
=C2=A0scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0scripts/lib/wic/pluginbase.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
=C2=A08 files changed, 19 insertions(+), 771 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-201=
9-1551.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_=
1.1.1d.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a> =3D&g=
t; <a href=3D"http://openssl_1.1.1f.bb" rel=3D"noreferrer" target=3D"_blank=
">openssl_1.1.1f.bb</a>} (97%)<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--00000000000019518905a45db573--

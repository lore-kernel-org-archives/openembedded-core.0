Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5061BC46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 12:05:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.144896.1703851500618701511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 04:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQ4EeWs5;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e766937ddso4628383e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 04:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703851499; x=1704456299; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n7GZ/hpltvdKT6Cx3nLsNQ9xDZgMiUYpbZ9OTqNlHFM=;
        b=eQ4EeWs5oYuTK3fu00zMnJGJzQW5cR0rdaE+qOrumzouRf+nuJk/yn7+bive4De8ui
         DPPYDvX21bLr6PcguzNm0UQ4mUmBNRSLExFXZ62ML6SGyn5Q0rQXZ1+g07NfmaaEO0/h
         aoxRy+owhJGeeuQqOGlC/El3AeD7qOff7vf7aKlv5PGRJsDXftTuC1qSVbh7S63loWUn
         6HYb8dfKVWTN7t3ipFtNl+Xc8P3hwKkneikv0C5sHQk5MwnywmqlJdC5/lqRnfrJaxhu
         5qpp5iF80Nu/qBhRmSiQIsJ/DySH7ax1imUru5KqIb1I5E+V2lNyaIo7PK1V9/rotXlm
         IF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703851499; x=1704456299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7GZ/hpltvdKT6Cx3nLsNQ9xDZgMiUYpbZ9OTqNlHFM=;
        b=Uy6leEh2Uyvgn/1+k0ydy6kqsFWiI7FCemuU5IBj/t8/4IAuSl518RHLIJfqcDnaQ+
         KCjfd4TZgDJqcmfFnszCe7gpTxqNRjJbkWOZH4ikuIUSsl/H7iU9KXpvHaCQK4v+19Bk
         9MCnw28V0Xk9ieXbxPkidQDYythGXsyAGbwtpDq5T+Yvz8d6J13+p/PQJzzMZm7PKfIg
         NWtphsXMeMfhwWYU0kwt4r2Mb0Db5pVFRvWTuUbZGa0F67cL3h7iiXbar9iDtP/khYot
         Znq5rCVS9dhL39bnZXwBQezm0dexqUIEcVH4Wgpe14Lw4CKrFw0xqqFg+Z14+lSoHMZV
         CGrQ==
X-Gm-Message-State: AOJu0YyAJzcMtAJxVzNEZsOb63gEysxMex5080/HKaBFXyRn5vReKp2S
	lOPPedfd5kXNCl44kDdfyzPwVUBvRWJ4MOt7+fY=
X-Google-Smtp-Source: AGHT+IHJXZc2+mCab+z01S16nMUe32PbRPWVbVB6BiYtii1bzmDoHeunFrfJVmDlDSKU4AqWR5LkF4qiPR95oeW2lhs=
X-Received: by 2002:ac2:4c11:0:b0:50e:6ec3:3de9 with SMTP id
 t17-20020ac24c11000000b0050e6ec33de9mr4033431lfq.54.1703851498524; Fri, 29
 Dec 2023 04:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20231229114435.27810-1-alex.kiernan@gmail.com> <20231229114435.27810-4-alex.kiernan@gmail.com>
In-Reply-To: <20231229114435.27810-4-alex.kiernan@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Dec 2023 14:04:47 +0200
Message-ID: <CANNYZj8mZEE=6e4umfXWFKKyMwHfDm9r6wVuFp67qfnm+qZU4A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 03/10] meta-selftest: hello-rs: Simple rust
 test recipe
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051d579060da4d784"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 12:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193014

--00000000000051d579060da4d784
Content-Type: text/plain; charset="UTF-8"

Reproducibility exclusions should be listed in the test itself, so this
continues to be built in regular world builds (otherwise it may silently
regress).

Alex

On Fri 29. Dec 2023 at 13.44, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
> Changes in v4:
> - Mark hello-rs as EXCLUDE_FROM_WORLD as it's not reproducible
>
>  .../hello-rs/hello-rs-crates.inc              |  8 +++++++
>  .../hello-rs/0001-Greet-OE-Core.patch         | 24 +++++++++++++++++++
>  .../hello-rs/hello-rs_0.1.0.bb                | 22 +++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644
> meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
>  create mode 100644
> meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
>  create mode 100644 meta-selftest/recipes-extended/hello-rs/
> hello-rs_0.1.0.bb
>
> diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
> b/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
> new file mode 100644
> index 000000000000..9646482b2875
> --- /dev/null
> +++ b/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
> @@ -0,0 +1,8 @@
> +# Autogenerated with 'bitbake -c update_crates hello-rs'
> +
> +# from Cargo.lock
> +SRC_URI += " \
> +    crate://crates.io/figlet-rs/0.1.5 \
> +"
> +
> +SRC_URI[figlet-rs-0.1.5.sha256sum] =
> "4742a071cd9694fc86f9fa1a08fa3e53d40cc899d7ee532295da2d085639fbc5"
> diff --git
> a/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
> b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
> new file mode 100644
> index 000000000000..7569ccef7bbb
> --- /dev/null
> +++
> b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
> @@ -0,0 +1,24 @@
> +From 3aea1ece0ca6ac0bf0ffe42736827af22966f767 Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alexk@zuma.ai>
> +Date: Wed, 27 Dec 2023 09:55:48 +0000
> +Subject: [PATCH] Greet "OE-Core"
> +
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Upstream-Status: Inappropriate
> +---
> + src/main.rs | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/main.rs b/src/main.rs
> +index f4a310758b19..224eca65c38d 100644
> +--- a/src/main.rs
> ++++ b/src/main.rs
> +@@ -3,7 +3,7 @@ use hello_lib::greet;
> +
> + fn main() {
> +     let standard_font = FIGfont::standard().unwrap();
> +-    let greeting = greet(None);
> ++    let greeting = greet(Some("OE-Core"));
> +     let figure = standard_font.convert(&greeting);
> +     println!("{}", figure.unwrap());
> + }
> diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
> b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
> new file mode 100644
> index 000000000000..9a136f29788e
> --- /dev/null
> +++ b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Simple hello world example"
> +HOMEPAGE = "https://github.com/akiernan/hello-bin"
> +LICENSE = "Unlicense"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7246f848faa4e9c9fc0ea91122d6e680"
> +
> +SRC_URI = "git://
> github.com/akiernan/hello-bin.git;protocol=https;branch=main;subpath=rust
> \
> +           file://0001-Greet-OE-Core.patch \
> +           git://
> github.com/akiernan/hello-lib.git;protocol=https;branch=main;name=hello-lib;destsuffix=hello-lib;type=git-dependency
> \
> +          "
> +SRCREV = "d3d096eda182644868f8e7458dcfa538ff637db3"
> +
> +SRCREV_FORMAT .= "_hello-lib"
> +SRCREV_hello-lib = "59c84574e844617043cf337bc8fa537cf87ad8ae"
> +
> +S = "${WORKDIR}/rust"
> +
> +inherit cargo cargo-update-recipe-crates ptest-cargo
> +
> +# Remove this when the recipe is reproducible
> +EXCLUDE_FROM_WORLD = "1"
> +
> +require ${BPN}-crates.inc
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193006):
> https://lists.openembedded.org/g/openembedded-core/message/193006
> Mute This Topic: https://lists.openembedded.org/mt/103415636/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000051d579060da4d784
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reproducibility exclusions should be listed in the test i=
tself, so this continues to be built in regular world builds (otherwise it =
may silently regress).</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
lex=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri 29. Dec 2023 at 13.44, Alex Kiernan &lt;<a href=3D"m=
ailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)">Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.k=
iernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v4:<br>
- Mark hello-rs as EXCLUDE_FROM_WORLD as it&#39;s not reproducible<br>
<br>
=C2=A0.../hello-rs/hello-rs-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 +++++++<br>
=C2=A0.../hello-rs/0001-Greet-OE-Core.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 24 +++++++++++++++++++<br>
=C2=A0.../hello-rs/<a href=3D"http://hello-rs_0.1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">hello-rs_0.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 22 +++++++++++++++++<br>
=C2=A03 files changed, 54 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs-c=
rates.inc<br>
=C2=A0create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs/0=
001-Greet-OE-Core.patch<br>
=C2=A0create mode 100644 meta-selftest/recipes-extended/hello-rs/<a href=3D=
"http://hello-rs_0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">hello-rs_0.=
1.0.bb</a><br>
<br>
diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc b/=
meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc<br>
new file mode 100644<br>
index 000000000000..9646482b2875<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc<br>
@@ -0,0 +1,8 @@<br>
+# Autogenerated with &#39;bitbake -c update_crates hello-rs&#39;<br>
+<br>
+# from Cargo.lock<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/figlet-rs/0.1.5" rel=3D"=
noreferrer" target=3D"_blank">crates.io/figlet-rs/0.1.5</a> \<br>
+&quot;<br>
+<br>
+SRC_URI[figlet-rs-0.1.5.sha256sum] =3D &quot;4742a071cd9694fc86f9fa1a08fa3=
e53d40cc899d7ee532295da2d085639fbc5&quot;<br>
diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE=
-Core.patch b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-O=
E-Core.patch<br>
new file mode 100644<br>
index 000000000000..7569ccef7bbb<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.p=
atch<br>
@@ -0,0 +1,24 @@<br>
+From 3aea1ece0ca6ac0bf0ffe42736827af22966f767 Mon Sep 17 00:00:00 2001<br>
+From: Alex Kiernan &lt;<a href=3D"mailto:alexk@zuma.ai" target=3D"_blank">=
alexk@zuma.ai</a>&gt;<br>
+Date: Wed, 27 Dec 2023 09:55:48 +0000<br>
+Subject: [PATCH] Greet &quot;OE-Core&quot;<br>
+<br>
+Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" =
target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
+Upstream-Status: Inappropriate<br>
+---<br>
+ src/<a href=3D"http://main.rs" rel=3D"noreferrer" target=3D"_blank">main.=
rs</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/<a href=3D"http://main.rs" rel=3D"noreferrer" target=3D"_=
blank">main.rs</a> b/src/<a href=3D"http://main.rs" rel=3D"noreferrer" targ=
et=3D"_blank">main.rs</a><br>
+index f4a310758b19..224eca65c38d 100644<br>
+--- a/src/<a href=3D"http://main.rs" rel=3D"noreferrer" target=3D"_blank">=
main.rs</a><br>
++++ b/src/<a href=3D"http://main.rs" rel=3D"noreferrer" target=3D"_blank">=
main.rs</a><br>
+@@ -3,7 +3,7 @@ use hello_lib::greet;<br>
+ <br>
+ fn main() {<br>
+=C2=A0 =C2=A0 =C2=A0let standard_font =3D FIGfont::standard().unwrap();<br=
>
+-=C2=A0 =C2=A0 let greeting =3D greet(None);<br>
++=C2=A0 =C2=A0 let greeting =3D greet(Some(&quot;OE-Core&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0let figure =3D standard_font.convert(&amp;greeting);<b=
r>
+=C2=A0 =C2=A0 =C2=A0println!(&quot;{}&quot;, figure.unwrap());<br>
+ }<br>
diff --git a/meta-selftest/recipes-extended/hello-rs/<a href=3D"http://hell=
o-rs_0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">hello-rs_0.1.0.bb</a> b=
/meta-selftest/recipes-extended/hello-rs/<a href=3D"http://hello-rs_0.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">hello-rs_0.1.0.bb</a><br>
new file mode 100644<br>
index 000000000000..9a136f29788e<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-extended/hello-rs/<a href=3D"http://hello-rs_0.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">hello-rs_0.1.0.bb</a><br>
@@ -0,0 +1,22 @@<br>
+SUMMARY =3D &quot;Simple hello world example&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/akiernan/hello-bin" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/akiernan/hello-bin</a>=
&quot;<br>
+LICENSE =3D &quot;Unlicense&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7246f848faa4e9c9fc0ea91122=
d6e680&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/akiernan/hello-bin.gi=
t;protocol=3Dhttps;branch=3Dmain;subpath=3Drust" rel=3D"noreferrer" target=
=3D"_blank">github.com/akiernan/hello-bin.git;protocol=3Dhttps;branch=3Dmai=
n;subpath=3Drust</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Greet-OE-Core.patch \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/akiernan/hello-lib.git;protocol=3Dhttps;branch=3Dmain;name=3Dhello-lib;de=
stsuffix=3Dhello-lib;type=3Dgit-dependency" rel=3D"noreferrer" target=3D"_b=
lank">github.com/akiernan/hello-lib.git;protocol=3Dhttps;branch=3Dmain;name=
=3Dhello-lib;destsuffix=3Dhello-lib;type=3Dgit-dependency</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRCREV =3D &quot;d3d096eda182644868f8e7458dcfa538ff637db3&quot;<br>
+<br>
+SRCREV_FORMAT .=3D &quot;_hello-lib&quot;<br>
+SRCREV_hello-lib =3D &quot;59c84574e844617043cf337bc8fa537cf87ad8ae&quot;<=
br>
+<br>
+S =3D &quot;${WORKDIR}/rust&quot;<br>
+<br>
+inherit cargo cargo-update-recipe-crates ptest-cargo<br>
+<br>
+# Remove this when the recipe is reproducible<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
+<br>
+require ${BPN}-crates.inc<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193006): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193006" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193006</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103415636/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103415636/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000051d579060da4d784--


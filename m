Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25442C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:06:19 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web12.8831.1639649177976464278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JgU0vGQ2;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id o2so304550vkn.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UyVLvkUgql/Xo4Z6mnVKsRC6Jk2PS5C0G0RgMHhGiBU=;
        b=JgU0vGQ2tLwUPahYdTlbtNghCqFaoxO6AdaEGJvVYoVyGKW8Rj6TZFRvXI3xFKi4Mx
         wNrhxW8VV7UhzQNXbEGecOrA3wl97JUrBbun2j6Jswu0wRTdsMAzU1q8RYxKegyYbzKu
         ppp3OXyt/ZOqvJu1gb6KEHgASHRJZwrTdIkrKwcbpLqnMxRdtWJXAWIxVY17Fs4JWfFF
         7R1swj3irOmT3JGJ1Ikj+SGaT7KevfOM2UE9Gi+FRoYcWF0Pd3nx+CZdDjUKHykcLJin
         d7oFZHnxqZeoUQthgw96MUQl+77biZBvfMG1eKRN48JosU2XkEzKG1k0gBDflbJgPGj0
         nInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UyVLvkUgql/Xo4Z6mnVKsRC6Jk2PS5C0G0RgMHhGiBU=;
        b=Dpl/khIiu37BzOUXrCS6jGj6lnX/2OajCviIyF5jVtsOYbUGEZbXl1Sw33X4CSrCic
         rrrqhlvBnPN58wIvBxyXLHLxcNtHnULI6PQ7t0yw9cz8ScmHxaEd/6xyuP0adUzN2sze
         oDjTP5lTUvWogGzMX+iIiSaAo0nZ5NDb6C9MbxpiO3+eHMwMa3vki0PuEL5Kkli8QY28
         Sa8zrBIy79kLnRIkDz9RRay5VxM/4QX9m6/DImVF0h/6WxXMamBbVhdw1cNgHXqvU0wA
         RWjooU1mbq3/UWyT3f2JE/Ojai1GKX/iwFLIEB954VmEBv1v8+MnfwF3PkCMlcR9xCTk
         GmZA==
X-Gm-Message-State: AOAM5324CwqcdEbT8djg9B1NgEqn5Mfgy0N5j80uIRqpJ6AgSWgIV6nJ
	JDjUhTZ2PrrwpgFWYiFnGOTRxdGjLOtrhPZCMlg080FaDf+9wQ==
X-Google-Smtp-Source: 
 ABdhPJwy45uN7n25OtBAfk+4+oqtQ6StaBHwftTzJpiBLVj9W8orBVtMawILbru4tmoPD5fE/DKTjbKm3wmBDNP8eJ0=
X-Received: by 2002:a1f:c3c2:: with SMTP id t185mr1449253vkf.1.1639649177047;
 Thu, 16 Dec 2021 02:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20211216091940.GE5920@codepurple>
In-Reply-To: <20211216091940.GE5920@codepurple>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Dec 2021 11:06:05 +0100
Message-ID: 
 <CANNYZj8P_HUt_+UNM4nZee5bksj8LahQHgW+2Uzt5wSGdY4Oeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: fix arm64 link failures when building
 rust apps
To: "S. Lockwood-Childs" <sjl@vctlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c1170305d3409253"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 10:06:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159775

--000000000000c1170305d3409253
Content-Type: text/plain; charset="UTF-8"

Discussion in https://github.com/rust-lang/git2-rs/pull/759 doesn't exactly
fill one with confidence, but still, can this be handled and fixed in rust
upstream? Non-upstreamable patches for what is a common use case aren't a
good idea.

Alex

On Thu, 16 Dec 2021 at 10:19, S. Lockwood-Childs <sjl@vctlabs.com> wrote:

> Typical error when trying to build a rust app (for example, librsvg)
> for aarch64 targets looks like:
>   undefined references to `__aarch64_ldadd8_rel'
>
> The upstream rust commit
> "add target feature outline-atomics"
> 0f9f241aac21bc77fb9e757da18207abefdc841d
> has caused a number of such link failure regressions on platforms with
> aarch64
> toolchains that are not able to cope with -moutline-atomics flag. This
> includes
> musl toolchains [1] but some glibc toolchains also are not able to handle
> this
> flag [2,3]
>
> OE gcc-cross-aarch64 is currently one of the latter, but when it *is* able
> to
> handle outline-atomics this patch should go away, to take advantage of the
> reported performance benefit.
>
> [1] https://github.com/rust-lang/git2-rs/issues/706
> [2] https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738.html
> [3] https://bugzilla.redhat.com/show_bug.cgi?id=1830472
>
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  meta/recipes-devtools/rust/rust-target.inc    |  2 +
>  .../rust/rust-disable-outline-atomics.patch   | 50 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644
> meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
>
> diff --git a/meta/recipes-devtools/rust/rust-target.inc
> b/meta/recipes-devtools/rust/rust-target.inc
> index 3f637b3ba5..bac743f66d 100644
> --- a/meta/recipes-devtools/rust/rust-target.inc
> +++ b/meta/recipes-devtools/rust/rust-target.inc
> @@ -2,6 +2,8 @@ require rust.inc
>
>  DEPENDS += "rust-llvm (=${PV})"
>
> +SRC_URI += "file://rust-disable-outline-atomics.patch"
> +
>  # Otherwise we'll depend on what we provide
>  INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
>  # We don't need to depend on gcc-native because yocto assumes it exists
> diff --git
> a/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> new file mode 100644
> index 0000000000..fc99a06a6a
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> @@ -0,0 +1,50 @@
> +rust: fix arm64 link failures when building rust apps
> +
> +Typical error when trying to build a rust app looks like:
> +  undefined references to `__aarch64_ldadd8_rel'
> +
> +The upstream rust commit
> +"add target feature outline-atomics"
> 0f9f241aac21bc77fb9e757da18207abefdc841d
> +has caused a number of such link failure regressions on platforms with
> aarch64
> +toolchains that are not able to cope with -moutline-atomics flag. This
> includes
> +musl toolchains [1] but some glibc toolchains also are not able to handle
> this
> +flag [2,3]
> +
> +OE gcc-cross-aarch64 is currently one of the latter, but when it *is*
> able to
> +handle outline-atomics this patch should go away, to take advantage of the
> +reported performance benefit.
> +
> +[1] https://github.com/rust-lang/git2-rs/issues/706
> +[2] https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738.html
> +[3] https://bugzilla.redhat.com/show_bug.cgi?id=1830472
> +
> +Upstream-Status: Inappropriate [other]
> +
> +Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> +
> +diff --git a/compiler/rustc_codegen_llvm/src/llvm_util.rs
> b/compiler/rustc_codegen_llvm/src/llvm_util.rs
> +index c2136f161..ca221eb4a 100644
> +--- a/compiler/rustc_codegen_llvm/src/llvm_util.rs
> ++++ b/compiler/rustc_codegen_llvm/src/llvm_util.rs
> +@@ -416,13 +416,14 @@ pub fn llvm_global_features(sess: &Session) ->
> Vec<String> {
> +     // -Ctarget-features
> +     features.extend(sess.opts.cg
> .target_feature.split(',').flat_map(&filter));
> +
> +-    // FIXME: Move outline-atomics to target definition when earliest
> supported LLVM is 12.
> +-    if get_version() >= (12, 0, 0)
> +-        && sess.target.llvm_target.contains("aarch64-unknown-linux")
> +-        && sess.target.llvm_target != "aarch64-unknown-linux-musl"
> +-    {
> +-        features.push("+outline-atomics".to_string());
> +-    }
> ++//    // FIXME: Move outline-atomics to target definition when earliest
> supported LLVM is 12.
> ++//    if get_version() >= (12, 0, 0)
> ++//        && sess.target.llvm_target.contains("aarch64-unknown-linux")
> ++//        && sess.target.llvm_target != "aarch64-unknown-linux-musl"
> ++//    {
> ++//        features.push("+outline-atomics".to_string());
> ++//    }
> ++
> +
> +     features
> + }
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159774):
> https://lists.openembedded.org/g/openembedded-core/message/159774
> Mute This Topic: https://lists.openembedded.org/mt/87763768/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c1170305d3409253
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Discussion in <a href=3D"https://github.com/rust-lang=
/git2-rs/pull/759">https://github.com/rust-lang/git2-rs/pull/759</a> doesn&=
#39;t exactly fill one with confidence, but still, can this be handled and =
fixed in rust upstream? Non-upstreamable patches for what is a common use c=
ase aren&#39;t a good idea.</div><div><br></div><div>Alex<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
16 Dec 2021 at 10:19, S. Lockwood-Childs &lt;<a href=3D"mailto:sjl@vctlabs.=
com">sjl@vctlabs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Typical error when trying to build a rust app (for exam=
ple, librsvg)<br>
for aarch64 targets looks like:<br>
=C2=A0 undefined references to `__aarch64_ldadd8_rel&#39;<br>
<br>
The upstream rust commit<br>
&quot;add target feature outline-atomics&quot; 0f9f241aac21bc77fb9e757da182=
07abefdc841d<br>
has caused a number of such link failure regressions on platforms with aarc=
h64<br>
toolchains that are not able to cope with -moutline-atomics flag. This incl=
udes<br>
musl toolchains [1] but some glibc toolchains also are not able to handle t=
his<br>
flag [2,3]<br>
<br>
OE gcc-cross-aarch64 is currently one of the latter, but when it *is* able =
to<br>
handle outline-atomics this patch should go away, to take advantage of the<=
br>
reported performance benefit.<br>
<br>
[1] <a href=3D"https://github.com/rust-lang/git2-rs/issues/706" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/rust-lang/git2-rs/issues/706</=
a><br>
[2] <a href=3D"https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738.=
html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/gcc=
-bugs@gcc.gnu.org/msg661738.html</a><br>
[3] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1830472" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1830472</a><br>
<br>
Signed-off-by: S. Lockwood-Childs &lt;<a href=3D"mailto:sjl@vctlabs.com" ta=
rget=3D"_blank">sjl@vctlabs.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rust/rust-target.inc=C2=A0 =C2=A0 |=C2=A0 2 +<b=
r>
=C2=A0.../rust/rust-disable-outline-atomics.patch=C2=A0 =C2=A0| 50 ++++++++=
+++++++++++<br>
=C2=A02 files changed, 52 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/rust/rust-disable-outli=
ne-atomics.patch<br>
<br>
diff --git a/meta/recipes-devtools/rust/rust-target.inc b/meta/recipes-devt=
ools/rust/rust-target.inc<br>
index 3f637b3ba5..bac743f66d 100644<br>
--- a/meta/recipes-devtools/rust/rust-target.inc<br>
+++ b/meta/recipes-devtools/rust/rust-target.inc<br>
@@ -2,6 +2,8 @@ require rust.inc<br>
<br>
=C2=A0DEPENDS +=3D &quot;rust-llvm (=3D${PV})&quot;<br>
<br>
+SRC_URI +=3D &quot;file://rust-disable-outline-atomics.patch&quot;<br>
+<br>
=C2=A0# Otherwise we&#39;ll depend on what we provide<br>
=C2=A0INHIBIT_DEFAULT_RUST_DEPS:class-native =3D &quot;1&quot;<br>
=C2=A0# We don&#39;t need to depend on gcc-native because yocto assumes it =
exists<br>
diff --git a/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.p=
atch b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch<b=
r>
new file mode 100644<br>
index 0000000000..fc99a06a6a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch<br=
>
@@ -0,0 +1,50 @@<br>
+rust: fix arm64 link failures when building rust apps<br>
+<br>
+Typical error when trying to build a rust app looks like: <br>
+=C2=A0 undefined references to `__aarch64_ldadd8_rel&#39;<br>
+<br>
+The upstream rust commit <br>
+&quot;add target feature outline-atomics&quot; 0f9f241aac21bc77fb9e757da18=
207abefdc841d<br>
+has caused a number of such link failure regressions on platforms with aar=
ch64<br>
+toolchains that are not able to cope with -moutline-atomics flag. This inc=
ludes<br>
+musl toolchains [1] but some glibc toolchains also are not able to handle =
this<br>
+flag [2,3]<br>
+<br>
+OE gcc-cross-aarch64 is currently one of the latter, but when it *is* able=
 to<br>
+handle outline-atomics this patch should go away, to take advantage of the=
<br>
+reported performance benefit.<br>
+<br>
+[1] <a href=3D"https://github.com/rust-lang/git2-rs/issues/706" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/rust-lang/git2-rs/issues/706<=
/a><br>
+[2] <a href=3D"https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/gc=
c-bugs@gcc.gnu.org/msg661738.html</a><br>
+[3] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1830472" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1830472</a><br>
+<br>
+Upstream-Status: Inappropriate [other]<br>
+<br>
+Signed-off-by: S. Lockwood-Childs &lt;<a href=3D"mailto:sjl@vctlabs.com" t=
arget=3D"_blank">sjl@vctlabs.com</a>&gt;<br>
+<br>
+diff --git a/compiler/rustc_codegen_llvm/src/<a href=3D"http://llvm_util.r=
s" rel=3D"noreferrer" target=3D"_blank">llvm_util.rs</a> b/compiler/rustc_c=
odegen_llvm/src/<a href=3D"http://llvm_util.rs" rel=3D"noreferrer" target=
=3D"_blank">llvm_util.rs</a><br>
+index c2136f161..ca221eb4a 100644<br>
+--- a/compiler/rustc_codegen_llvm/src/<a href=3D"http://llvm_util.rs" rel=
=3D"noreferrer" target=3D"_blank">llvm_util.rs</a><br>
++++ b/compiler/rustc_codegen_llvm/src/<a href=3D"http://llvm_util.rs" rel=
=3D"noreferrer" target=3D"_blank">llvm_util.rs</a><br>
+@@ -416,13 +416,14 @@ pub fn llvm_global_features(sess: &amp;Session) -&gt=
; Vec&lt;String&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0// -Ctarget-features<br>
+=C2=A0 =C2=A0 =C2=A0features.extend(<a href=3D"http://sess.opts.cg" target=
=3D"_blank">sess.opts.cg</a>.target_feature.split(&#39;,&#39;).flat_map(&am=
p;filter));<br>
+ <br>
+-=C2=A0 =C2=A0 // FIXME: Move outline-atomics to target definition when ea=
rliest supported LLVM is 12.<br>
+-=C2=A0 =C2=A0 if get_version() &gt;=3D (12, 0, 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; sess.target.llvm_target.contains(&=
quot;aarch64-unknown-linux&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; sess.target.llvm_target !=3D &quot=
;aarch64-unknown-linux-musl&quot;<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 features.push(&quot;+outline-atomics&quot;.to=
_string());<br>
+-=C2=A0 =C2=A0 }<br>
++//=C2=A0 =C2=A0 // FIXME: Move outline-atomics to target definition when =
earliest supported LLVM is 12.<br>
++//=C2=A0 =C2=A0 if get_version() &gt;=3D (12, 0, 0)<br>
++//=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; sess.target.llvm_target.contains=
(&quot;aarch64-unknown-linux&quot;)<br>
++//=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; sess.target.llvm_target !=3D &qu=
ot;aarch64-unknown-linux-musl&quot;<br>
++//=C2=A0 =C2=A0 {<br>
++//=C2=A0 =C2=A0 =C2=A0 =C2=A0 features.push(&quot;+outline-atomics&quot;.=
to_string());<br>
++//=C2=A0 =C2=A0 }<br>
++<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0features<br>
+ }<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159774): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159774" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159774</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87763768/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87763768/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c1170305d3409253--


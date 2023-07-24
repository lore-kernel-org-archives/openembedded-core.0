Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7ECC001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 13:58:51 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.47914.1690207130806003424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 06:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=q1RWwVkn;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5221c6a2d3dso3229421a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 06:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690207129; x=1690811929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QN9GKPUvjT811KaON1ApC2INQmgoebTb8MhqCxHIOTg=;
        b=q1RWwVkn4wt13C5f4ReSltdKEG6uJF0wSTWbpD0kRxoPviSUQQLYva/ir2Zpc4FUU1
         6nQEw1Po47+CFoLn4cI4QkYME/P1iBESE8tLm5FLVOwr+MKHvQiRWEisHKnJf0KKi2Th
         outXKcf5TaHFzO99MKFt0AAHec2nsLkET6tOEzpVEQ1bI0rGGTEmWbelMpn8fwfz3QhS
         nvuFj16bYcA48dsPbfJIjxe3yCDYXloMcRsxkZ7UCJexnDfo3tAvEtDH00rLXt7gOps2
         TICMCLo/4nCSWa68NtEJQTtd8gxd7k9YW4l0W8DAekGWlv9bZ7WG8YZ9jDhpIrP1T1cG
         14xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207129; x=1690811929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN9GKPUvjT811KaON1ApC2INQmgoebTb8MhqCxHIOTg=;
        b=QAZsfaoYGyBnFbDkMYUm2YpdA0aGxr/wC2wtryA9TqDv0UmU9DHp2cElCtWIiT8oAT
         2xAxv/qDCyxMDXgatGDKYO8ssndQFQ7Y90qP4vqT6JfX8jzRh+ecTNkH3rIiW9Bihlxf
         cTGCQExzbI3fOGvlKBjKyhe/oOkiigR1D86h4bE5C2gkpcCJNwkvJ4HbEAiUbP/rX83H
         VOlkGfDZx94YOLmig4bExyZSXL0iLWCqvV6a6Qn9PQjY+J4OpvZ6nfssiux4rs+11b8g
         dgoq18sbskb3cGESKVc5R4swspFTD3EGK5bwxaINPKHEn1Vtt/LTocdwFiqAC3FdQxjF
         UJ2g==
X-Gm-Message-State: ABy/qLYlIOnjmuaJbH69ZVSELrQ/X34XtNpLgn3g54WuVW2nny5J/tDP
	qUoy55zOoPsIqE6eL4JteP5Xk6jMSMXbyZGjsiMMCOiE
X-Google-Smtp-Source: APBJJlHAzhk3xxO+JxRiPfB9RwJkaOdRvL/DTQgBJJuElcSNUqrNryoDWfcLvmslPBpQyaXUn8pkAwMw9FCXabIvIgs=
X-Received: by 2002:a05:6512:2084:b0:4fb:740a:81ae with SMTP id
 t4-20020a056512208400b004fb740a81aemr4349632lfr.16.1690190832344; Mon, 24 Jul
 2023 02:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <177391A172EF42E0.8989@lists.openembedded.org>
In-Reply-To: <177391A172EF42E0.8989@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 24 Jul 2023 11:27:00 +0200
Message-ID: <CA+cAkeqxqth7a1oAujjhkdid35rH3gMVx9XByEZcKySt_eMsxw@mail.gmail.com>
Subject: Re: [OE-core] About requirements on cross compiling rust package
To: frederic.martinsons@gmail.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000002a25d1060138380c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 13:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184790

--0000000000002a25d1060138380c
Content-Type: text/plain; charset="UTF-8"

Hello I make some advance on this and there is a drawback that I didn't
foreseen, in case of patched
git url (those set up by cargo_common_do_patch_path), the Cargo.lock file
must be modified
to remove source entry , hence not compatible with --frozen.

I put more info in comment YOCTO #15104
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=15104> for those
interested but for the moment, I cleaned
the Cargo.lock by myself before freezing it for the next build steps.

There is still the question about the fate of "rust-hello-world" recipe too
(which cannot
be built with --frozen flag without having a Cargo.lock file), I don't know
if I can suppress it
or if I need to create a Cargo.lock for it.

On Thu, 20 Jul 2023 at 14:00, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

> Hello list,
>
> In the course of YOCTO #15104
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=15104>  , I finally
> found the issue was due to a missing Cargo.lock file at the root of the
> project (which is pretty usual for a Rust project from git since Cargo.lock
> is only required when publishing on the crates registry).
>
> With a Cargo.lock correctly placed, the patch process made by
> cargo_common.bbclass works perfectly fine even with a virtual manifest.
>
> I often encountered issues that were in the end due to a missing
> Cargo.lock and I think we all agree on this list (I didn't crawl the mail
> archives, I talked from my memory) that this file is absolutely required
> when building a rust project under yocto.
> (especially for reproducible build)
>
> I'm currently testing a patch which will replace --offline cargo build
> flags with --frozen (which supersedes --offline mode since it prevents
> network access but also Cargo.lock to be present and up to date).
>
> I have two questions though:
>   1) rust-hello-world doesn't embed a Cargo.lock (and doesn't need to
> since it had zero dependencies) , considering that we now have a more
> "real" recipe (zvariant) that is used within selftest, would it be
> acceptable to suppress rust-hello-world ?
>   2) below is kind of message we will have when using --frozen with an
> absent Cargo.lock:
>
> | error: failed to get `glib` as a dependency of package `zvariant v3.12.0
> (/home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/git/zvariant)`
> |
> | Caused by:
> |   failed to load source for dependency `glib`
> |
> | Caused by:
> |   Unable to update https://github.com/gtk-rs/glib?rev=c9ee583cea0
> |
> | Caused by:
> |   failed to fetch into:
> /home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/cargo_home/git/db/glib-928cf7b282977403
> |
> | Caused by:
> |   attempting to update a git repository, but --frozen was specified
>
> I think it is not very clear that the root cause is a missing Cargo.lock ,
> so I'm wondering if a specific bitbake ops (do_compile_prepend) would not
> be  better to check for Cargo.lock and output an explicit message (it
> doesn't prevent to keep --frozen anyway). What do you think ?
>
> PS: I copied Randy as the maintainer of rust-hello-world but also  the
> ticket assignee.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184635):
> https://lists.openembedded.org/g/openembedded-core/message/184635
> Mute This Topic: https://lists.openembedded.org/mt/100254129/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002a25d1060138380c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello I make some advance on this and there is a drawback =
that I didn&#39;t foreseen, in case of patched<div>git url (those set up by=
 cargo_common_do_patch_path), the Cargo.lock file must be modified</div><di=
v>to remove source entry , hence not compatible=C2=A0with --frozen.</div><d=
iv><br></div><div>I put more info in comment=C2=A0<a href=3D"https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D15104" target=3D"_blank">YOCTO #15104=
</a>=C2=A0for those interested=C2=A0but for the moment, I cleaned</div><div=
>the Cargo.lock by myself before freezing it for the next build steps.</div=
><div><br></div><div>There is still the question about the fate of &quot;ru=
st-hello-world&quot; recipe too (which cannot=C2=A0</div><div>be built with=
 --frozen flag without having a Cargo.lock file), I don&#39;t know if I can=
 suppress it</div><div>or if I need to create a Cargo.lock for it.</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, 20 Jul 2023 at 14:00, Frederic Martinsons via <a href=3D"http://lists.=
openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;frederic=
.martinsons=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D=
"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello list,<div><=
br></div><div>In the course=C2=A0of=C2=A0<a href=3D"https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D15104" target=3D"_blank">YOCTO #15104</a>=C2=
=A0 , I finally found the issue was due to a missing Cargo.lock file at the=
 root of the project (which is pretty usual for a Rust project from git sin=
ce Cargo.lock is only required when publishing on the crates registry).=C2=
=A0</div><div><br></div><div>With a Cargo.lock correctly placed, the patch =
process made by cargo_common.bbclass works perfectly fine even with a virtu=
al manifest.</div><div><br></div><div>I often encountered issues that were =
in the end due to a missing Cargo.lock and I think we all agree on this lis=
t (I didn&#39;t crawl the mail archives, I talked from my memory) that this=
 file is absolutely required when building a rust project under yocto.</div=
><div>(especially for reproducible build)</div><div><br></div><div>I&#39;m =
currently testing a patch which will replace --offline cargo build flags wi=
th --frozen (which supersedes=C2=A0--offline mode since it prevents network=
 access but also Cargo.lock to be present and up to date).</div><div><br></=
div><div>I have two questions though:</div><div>=C2=A0 1) rust-hello-world =
doesn&#39;t embed a Cargo.lock (and doesn&#39;t need to since it had zero d=
ependencies) , considering that we now have a more &quot;real&quot; recipe =
(zvariant) that is used within selftest, would it be acceptable to suppress=
 rust-hello-world ?</div><div>=C2=A0 2) below is kind of message we will ha=
ve when using --frozen with an absent Cargo.lock:</div><div><br></div><div>=
| error: failed to get `glib` as a dependency of package `zvariant v3.12.0 =
(/home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/z=
bus/3.11.0-r0/git/zvariant)`<br>| <br>| Caused by:<br>| =C2=A0 failed to lo=
ad source for dependency `glib`<br>| <br>| Caused by:<br>| =C2=A0 Unable to=
 update <a href=3D"https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0" target=
=3D"_blank">https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0</a><br>| <br>|=
 Caused by:<br>| =C2=A0 failed to fetch into: /home/fmartinsons/TAPOS_build=
/build-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/cargo_home/git/d=
b/glib-928cf7b282977403<br>| <br>| Caused by:<br>| =C2=A0 attempting to upd=
ate a git repository, but --frozen was specified<br></div><div><br></div><d=
iv>I think it is not very clear that the root cause is a missing Cargo.lock=
 , so I&#39;m wondering if a specific bitbake ops (do_compile_prepend) woul=
d not be=C2=A0 better to check for Cargo.lock and output an explicit messag=
e (it doesn&#39;t prevent to keep --frozen anyway). What do you think ?</di=
v><div><br></div><div>PS: I copied Randy as the maintainer of rust-hello-wo=
rld but also=C2=A0 the ticket assignee.</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184635): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184635" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184635</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100254129/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100254129/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002a25d1060138380c--


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110F2C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 05:28:52 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.29467.1640237331169715345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 21:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IWmq7TNo;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id y23so7922875uay.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 21:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yct11iwRsxLUtlu8If+EqANLwUJEFlMo9LreLsAKpsM=;
        b=IWmq7TNorONS7qIwnWEHOFf9mz/lUEAEi6PtNjXk+XfKVCQ7zBbt2B8ha9KlieoESc
         Is3TdZMLZsHVeQgX1t6eAdYhp0xyJj67YdcWLy/iR4dWzovBgumftpjKyjwSXjV3t2l8
         e31EDTp4ZVOASZOC7ol8YDRyO5NDwVRy+mHKXrca6xOqrEzVPU7o3EoH6ZAUJuOrwOwJ
         dQDBN2HJ9wDVHaI5bOX3phezdBIEzc3uOBYkch8BORuzi3q8IccXMp3BFRTgj5OSS6QS
         yiWQ493CW/zX+Dx3UDw5K/X4fdKIE9RRxNbBv0OhuGmz3c6RM2vTdUjUZh9kjsOBCsZv
         wdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yct11iwRsxLUtlu8If+EqANLwUJEFlMo9LreLsAKpsM=;
        b=1HTxuZYvEUyGkk8oLmc6PzS19eoWBm02HGMKEu8lVb0AFBDXoPf0PrI2Hq0nCtxiLx
         1bwivivuD57wbKC08grD+P1xeBjq3RcQYbdO1vYryB5xMKLNXuVrYkfM5mZsugmrc5HN
         kB6QDixBUNlx0LimykgDLFaSlgGNMvSm0cwk9QE0kRUxkXuZqKI6wGVvtZNNoCBu/eNg
         GwmiwiEZ4obt6UYe+knxJUQmWOOKbAaV3Dv2qaLdkRBnA18qElUl9/C4Wnq7EoHLAqgg
         gGwP54u7CEVgQ+GDGp4pwGARIDPFLS1WnEF2gEtTzgK8/qnVcKZMhMYGey+qPg/Nayl+
         SVyg==
X-Gm-Message-State: AOAM530aGPAwJOmwbXy8k+o77mE61KKNuhtTQHTOiDHH+I7itg8wm4bv
	Cip8YaQZf4TKo7d5aj2yzphK0noj5OUgyndWHZo=
X-Google-Smtp-Source: 
 ABdhPJzq0Cc4sBbneTzfvQi59q+sRvkSlDRqYzgCRbsK0j964zB7BGaLvh9sEOzF+MyLT/Ceo1umYusEFWCgKsXEPqw=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr312381uah.22.1640237330255;
 Wed, 22 Dec 2021 21:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Dec 2021 08:28:39 +0300
Message-ID: 
 <CANNYZj-R_utpNfE7ySa4M+ZfKCgsSEAGaTW=v-kra7Z-W=4YBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006ad2a305d3c983bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 05:28:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159967

--0000000000006ad2a305d3c983bf
Content-Type: text/plain; charset="UTF-8"

Should there be tests for this? Would be good to check that the network is
indeed disabled in these tasks.

Alex

On Thu 23. Dec 2021 at 2.20, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Use the newly added nonetwork task flag to disable network access where
> possible in unpack/patch/configure/compile/install tasks.
>
> We can't disable networking in sstate tasks due to sstate downloads and
> also so we can report hash equivalence to the server.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass  | 4 ++++
>  meta/classes/patch.bbclass | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b709777f243..e4c6c983b59 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {
>      oe.reproducible.epochfile_write(source_date_epoch,
> d.getVar('SDE_FILE'), d)
>  }
>  do_unpack[postfuncs] += "create_source_date_epoch_stamp"
> +do_unpack[nonetwork] = "1"
>
>  def get_source_date_epoch_value(d):
>      return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
> @@ -358,6 +359,7 @@ base_do_configure() {
>                 echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
>         fi
>  }
> +do_configure[nonetwork] = "1"
>
>  addtask compile after do_configure
>  do_compile[dirs] = "${B}"
> @@ -368,11 +370,13 @@ base_do_compile() {
>                 bbnote "nothing to compile"
>         fi
>  }
> +do_compile[nonetwork] = "1"
>
>  addtask install after do_compile
>  do_install[dirs] = "${B}"
>  # Remove and re-create ${D} so that is it guaranteed to be empty
>  do_install[cleandirs] = "${D}"
> +do_install[nonetwork] = "1"
>
>  base_do_install() {
>         :
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 8de70254919..57aaf7c31d1 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>
>  addtask patch after do_unpack
>  do_patch[dirs] = "${WORKDIR}"
> +do_patch[nonetwork] = "1"
>  do_patch[depends] = "${PATCHDEPENDENCY}"
>
>  EXPORT_FUNCTIONS do_patch
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159965):
> https://lists.openembedded.org/g/openembedded-core/message/159965
> Mute This Topic: https://lists.openembedded.org/mt/87909311/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006ad2a305d3c983bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should there be tests for this? Would be good to check th=
at the network is indeed disabled in these tasks.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu 23. Dec 2021 at 2.20, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Use the newl=
y added nonetwork task flag to disable network access where<br>
possible in unpack/patch/configure/compile/install tasks.<br>
<br>
We can&#39;t disable networking in sstate tasks due to sstate downloads and=
<br>
also so we can report hash equivalence to the server.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/base.bbclass=C2=A0 | 4 ++++<br>
=C2=A0meta/classes/patch.bbclass | 1 +<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index b709777f243..e4c6c983b59 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {<br>
=C2=A0 =C2=A0 =C2=A0oe.reproducible.epochfile_write(source_date_epoch, d.ge=
tVar(&#39;SDE_FILE&#39;), d)<br>
=C2=A0}<br>
=C2=A0do_unpack[postfuncs] +=3D &quot;create_source_date_epoch_stamp&quot;<=
br>
+do_unpack[nonetwork] =3D &quot;1&quot;<br>
<br>
=C2=A0def get_source_date_epoch_value(d):<br>
=C2=A0 =C2=A0 =C2=A0return oe.reproducible.epochfile_read(d.getVar(&#39;SDE=
_FILE&#39;), d)<br>
@@ -358,6 +359,7 @@ base_do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo ${BB_TASKHASH}=
 &gt; ${CONFIGURESTAMPFILE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+do_configure[nonetwork] =3D &quot;1&quot;<br>
<br>
=C2=A0addtask compile after do_configure<br>
=C2=A0do_compile[dirs] =3D &quot;${B}&quot;<br>
@@ -368,11 +370,13 @@ base_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;nothin=
g to compile&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+do_compile[nonetwork] =3D &quot;1&quot;<br>
<br>
=C2=A0addtask install after do_compile<br>
=C2=A0do_install[dirs] =3D &quot;${B}&quot;<br>
=C2=A0# Remove and re-create ${D} so that is it guaranteed to be empty<br>
=C2=A0do_install[cleandirs] =3D &quot;${D}&quot;<br>
+do_install[nonetwork] =3D &quot;1&quot;<br>
<br>
=C2=A0base_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass<br>
index 8de70254919..57aaf7c31d1 100644<br>
--- a/meta/classes/patch.bbclass<br>
+++ b/meta/classes/patch.bbclass<br>
@@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] =3D &quot;PATCHRESOLVE&q=
uot;<br>
<br>
=C2=A0addtask patch after do_unpack<br>
=C2=A0do_patch[dirs] =3D &quot;${WORKDIR}&quot;<br>
+do_patch[nonetwork] =3D &quot;1&quot;<br>
=C2=A0do_patch[depends] =3D &quot;${PATCHDEPENDENCY}&quot;<br>
<br>
=C2=A0EXPORT_FUNCTIONS do_patch<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159965): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159965" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159965</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87909311/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87909311/1686489</a><br>
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

--0000000000006ad2a305d3c983bf--


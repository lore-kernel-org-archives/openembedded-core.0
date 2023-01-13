Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD25C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 15:39:06 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.90407.1673624338669556158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 07:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WMWYfVmx;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id i185so22593891vsc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 07:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AVA8Bu7fI44aq/l/7KKL+z+tftWunrv2frDN7fySkaE=;
        b=WMWYfVmxtvLdl4TpokgdnhPS7v8lRYBT9pTd6m8stzp+RAWfffOtbATg1mSKtFZ+2j
         +jCnxk4Hhesfm/P0Jd39TvUlFuV3KH+ETLi3kmiB1GOF/kQTc6dZvJhz1AAH34lsLkyx
         poLOJZZr/93BlKdhPc90jB/I2adRXXE5DdF7aP8JIG9zowZylIC7/7wfdm1+n7Q7GKZL
         vxpUKh/V/x9oE0ocyKbqiNmYei0UQS4YODvEX8KjDvd6ImHmwY5MsYcpuDRooqdWSUx3
         fsEovjxk0NB2bDzaXmSPpa4zCSCfKjbLV/sWKwICkHwYVqxjrWXCxhrZyH9sNdgvSarB
         CRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVA8Bu7fI44aq/l/7KKL+z+tftWunrv2frDN7fySkaE=;
        b=PzD5SFBbLjMvFbswbIX0YpdWAGUBAatyB5lr6nFUMBhBnetsCZJRL3jmDYHJmGWZ8Y
         rfH7UBXoDj8PglyFjV714cuReiVxAA7vFErARN8vttooM9qQnoud6GDcUcOrKJlB72F/
         1AIs/GbtkJ3ra/za02ard3/BFrLSPFjF73GdAV2kS/7ApHnLQO8rquXTAwNB8r0fR7k5
         AR5n5Lgcm5E0aopikSEVLDQ6Kkx1fWOyMU5EXvSM9j1CxZOWg8/1m4SawTyY/ZelGLkz
         cP5psB4EmZwUF1s89W4rrl3NGh1XQ20s570wYEkOiqRv/zf2P979x3xnR3XSf+aasgcE
         VVWw==
X-Gm-Message-State: AFqh2koLF+SlxRDlQgkbiQwBae07FZcdNIHrhq+jVyjUUgXoPaBpAck7
	BOfiVx50ojEy05I7i24JJniTDHoUeEMmo+f4aDDRIYeBLJG4Bg==
X-Google-Smtp-Source: AMrXdXukts/kxO9C6/NCsDO7khEnmii7bgigduOnbGgFKcMc7yw9aDW9+UmxdyohLspnzOqHNxz0PUd16Z2RQWnKS4A=
X-Received: by 2002:a05:6102:dca:b0:3ce:af78:6ae6 with SMTP id
 e10-20020a0561020dca00b003ceaf786ae6mr6143284vst.2.1673624337506; Fri, 13 Jan
 2023 07:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20221205045856.68662-1-Qi.Chen@windriver.com>
In-Reply-To: <20221205045856.68662-1-Qi.Chen@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 13 Jan 2023 15:38:46 +0000
Message-ID: <CANPvuRk7mWqqGWJ8M8Kh-S4CyHZgVQmjp5ROk2iRxco8r064FQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rm_work: adjust dependency to make
 do_rm_work_all depend on do_rm_work
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001fe4e805f22708dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 15:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175835

--0000000000001fe4e805f22708dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen,

Just for your information,
This patch introduces a regression that breaks the do_create_spdx tasks
when building with multiconfig machines.

I am investigating it more deeply and will come back with my findings.

Jose


Chen Qi <Qi.Chen@windriver.com> escreveu no dia segunda, 5/12/2022 =C3=A0(s=
)
04:59:

> For now, if we use rm_work and `bitbake core-image-minimal', some
> recipes' WORKDIRs are not cleaned up, e.g., makedevs-native.
>
> Adjust the dependency to make do_rm_work_all depend on do_rm_work
> to solve this problem.
>
> Below are the detailed explanation of why this would work.
>
> Without this patch, the dependency chain is like:
> [other deps] -> [do_rm_work] -+-> [do_build]
>                               |
> [do_rm_work_all] -------------+
>
> With this patch, the depedency chain is like:
> [other deps] -> [do_rm_work] -> [do_rm_work_all] -> [do_build]
>
> Such dependency chain adjustment fixes the issue because do_rm_work_all
> now depends on [other deps] and thus the [depends] of these [other deps].
> Take core-image-minimal as an example. Before this adjustment,
> do_rm_work_all does not have any relationship with do_rootfs, and we have
> do_rootfs[depends] +=3D "makedevs-native:do_populate_sysroot ..."
> This essentially prevents 'recrdeptask' setting of do_rm_work_all extend
> to makedevs-native. With this patch, the do_rm_work_all now depends
> on do_rm_work which in turn depends on do_rootfs, and so do_rm_work_all's
> recrdeptask could have effect on makedevs-native.
>
> With this patch, all built recipes WORKDIR will be cleaned up with
> a few expected exceptions such as kernel and qemu-helper-native.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/rm_work.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 4121a13279..1f28bc7187 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -180,7 +180,7 @@ python inject_rm_work() {
>          # other recipes and thus will typically run much later than
> completion of
>          # work in the recipe itself.
>          # In practice, addtask() here merely updates the dependencies.
> -        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
> +        bb.build.addtask('do_rm_work', 'do_rm_work_all do_build', '
> '.join(deps), d)
>
>      # Always update do_build_without_rm_work dependencies.
>      bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
> --
> 2.37.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174276):
> https://lists.openembedded.org/g/openembedded-core/message/174276
> Mute This Topic: https://lists.openembedded.org/mt/95462765/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001fe4e805f22708dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Chen,<div><br></div><div>Just for your information=
,</div><div>This patch introduces a regression=C2=A0that breaks the do_crea=
te_spdx tasks when building with multiconfig machines.<br></div><div><br>I =
am investigating it more deeply and will come back with my findings.<br><br=
>Jose<br><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.=
Chen@windriver.com</a>&gt; escreveu no dia segunda, 5/12/2022 =C3=A0(s) 04:=
59:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For now, if =
we use rm_work and `bitbake core-image-minimal&#39;, some<br>
recipes&#39; WORKDIRs are not cleaned up, e.g., makedevs-native.<br>
<br>
Adjust the dependency to make do_rm_work_all depend on do_rm_work<br>
to solve this problem.<br>
<br>
Below are the detailed explanation of why this would work.<br>
<br>
Without this patch, the dependency chain is like:<br>
[other deps] -&gt; [do_rm_work] -+-&gt; [do_build]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
[do_rm_work_all] -------------+<br>
<br>
With this patch, the depedency chain is like:<br>
[other deps] -&gt; [do_rm_work] -&gt; [do_rm_work_all] -&gt; [do_build]<br>
<br>
Such dependency chain adjustment fixes the issue because do_rm_work_all<br>
now depends on [other deps] and thus the [depends] of these [other deps].<b=
r>
Take core-image-minimal as an example. Before this adjustment,<br>
do_rm_work_all does not have any relationship with do_rootfs, and we have<b=
r>
do_rootfs[depends] +=3D &quot;makedevs-native:do_populate_sysroot ...&quot;=
<br>
This essentially prevents &#39;recrdeptask&#39; setting of do_rm_work_all e=
xtend<br>
to makedevs-native. With this patch, the do_rm_work_all now depends<br>
on do_rm_work which in turn depends on do_rootfs, and so do_rm_work_all&#39=
;s<br>
recrdeptask could have effect on makedevs-native.<br>
<br>
With this patch, all built recipes WORKDIR will be cleaned up with<br>
a few expected exceptions such as kernel and qemu-helper-native.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/rm_work.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass<br=
>
index 4121a13279..1f28bc7187 100644<br>
--- a/meta/classes/rm_work.bbclass<br>
+++ b/meta/classes/rm_work.bbclass<br>
@@ -180,7 +180,7 @@ python inject_rm_work() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# other recipes and thus will typically r=
un much later than completion of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# work in the recipe itself.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# In practice, addtask() here merely upda=
tes the dependencies.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_rm_work&#39;, &#39;do=
_build&#39;, &#39; &#39;.join(deps), d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_rm_work&#39;, &#39;do=
_rm_work_all do_build&#39;, &#39; &#39;.join(deps), d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Always update do_build_without_rm_work dependencies.<=
br>
=C2=A0 =C2=A0 =C2=A0bb.build.addtask(&#39;do_build_without_rm_work&#39;, &#=
39;&#39;, &#39; &#39;.join(deps), d)<br>
-- <br>
2.37.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174276): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174276" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174276</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95462765/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95462765/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--0000000000001fe4e805f22708dd--


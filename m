Return-Path: <anibal.limon@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADF9C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 19:36:52 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web09.30604.1639510611843092673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 11:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=R1/y7TlD;
 spf=pass (domain: linaro.org, ip: 209.85.219.171,
 mailfrom: anibal.limon@linaro.org)
Received: by mail-yb1-f171.google.com with SMTP id g17so48818088ybe.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N3bTMov9Q/qFiNIpqZpeJrn+0wcdzPSnSkGlgEaUrpQ=;
        b=R1/y7TlDs6YI8HIxQkilfJ0WOrIacX+v7gCCzHnD31Ql1y7azVEVq8RhYOPSCH6QDq
         PJIGoaf8wMO9dG5vksbLIQOqXJ+10QO5yJoa4tgnJvl9fq9KSNCbSA6RjPF/7T+0CN5n
         aLBanwI99LCfTf0I8ziyS0RWEz0UWhMs+jumFqG4hpzH4W5QJDLyS+5NjLbFJDo87Z8z
         hhrK5zSkiJTkBhOTE3g3cY9amPGp15tvP+7aaHhnJBU1GVHQQVdjxJX2JqzliE6ONxmK
         FpkHsIlxTHmAoOGYULosxOFb86YLWXoA+Ey6Fm1FVf/nJyB+DUnDYTluygpLUO4Z9TcE
         DcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3bTMov9Q/qFiNIpqZpeJrn+0wcdzPSnSkGlgEaUrpQ=;
        b=KlqPVQTh8Rj9dY9yF6H+rvJfpWkOhew4ngYg6JlAut7krEcuiC91V2L7qHKX2xl+Tf
         //z/4ToL+wEMO5ZCkKLQOdPqtRD7cZZ8qu65r09c8u3QqxO8i95GI86Ozp90Pr6EAIWs
         a4B3YY+1Z/fsR4iDV0qGrNzR5MgstN7a77IS8HLWQipzQDBNYkJz1fzwt/ywiMvCK5bD
         keWRIP5UGuN1tv7F56bAnOk4wETuzzVQbOrWQvXxzQ75z5QyqUIjWgt/FwX2H5QgHUX9
         63GyWOq+bdpc1ZT0XFQ8Twx8CkAvjW9EOhdRKjocY1yN7TbVvEfW0Jg0yC78UGqcOk4u
         17lQ==
X-Gm-Message-State: AOAM533Hz54dICsrn2flwTYfU7Fm+A2j42vkU8iKwpvsF51ot2oCRivB
	SppMvN4JmU7bsNw8kqY3D6mHWjwd+K1uxDRM4B92cg==
X-Google-Smtp-Source: 
 ABdhPJyZAj22ldWB3AQUmv4QFuI8rw2nSbHM6lL1yYBxEDMMGWCjdzFjV0sP7tiWMJ0+f1DmgTmh8CT8Mb1XyMDSaqc=
X-Received: by 2002:a05:6902:709:: with SMTP id
 k9mr1150962ybt.73.1639510611063;
 Tue, 14 Dec 2021 11:36:51 -0800 (PST)
MIME-Version: 1.0
References: <16BEE129ECE910F8.14236@lists.openembedded.org>
In-Reply-To: <16BEE129ECE910F8.14236@lists.openembedded.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Tue, 14 Dec 2021 13:36:40 -0600
Message-ID: 
 <CA+_AqisJEDx-EE6+4fuMQ62y+Fzc7sGA3EcHGRHQqis4Ro8wwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] lttng-modules: do not search in
 non-existing folder during install
To: anibal.limon@linaro.org
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com,
	richard.purdie@linuxfoundation.org, Andrey Zhizhikin <andrey.z@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009407bd05d3204f54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 19:36:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159706

--0000000000009407bd05d3204f54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Any update on push this to dunfell?,

I'm facing the issue,

https://ci.linaro.org/job/lt-qcom-openembedded-meta-qcom-premerge-dunfell/4=
6/MACHINE=3Ddragonboard-410c,TCLIBC=3Dglibc,label=3Ddocker-buster-amd64/con=
sole

Thanks in advance!,
Anibal

On Wed, 8 Dec 2021 at 14:21, Anibal Limon via lists.openembedded.org
<anibal.limon=3Dlinaro.org@lists.openembedded.org> wrote:

> From: Andrey Zhizhikin <andrey.z@gmail.com>
>
> When CONFIG_TRACEPOINTS is not enabled in kernel config - module
> compilation is skipped, which causes the ${D}/${nonarch_base_libdir} not
> to be created.
>
> This fails later in do_install:append() due to the fact that find
> command in executed for non-existing folder.
>
> Check for folder existence before find command in executed.
>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit de0aa1700ed4e6f04b0a233eb1f6d2ac598e7ed8)
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> index 3fdc8094e9..3145f0298c 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> @@ -39,7 +39,9 @@ EXTRA_OEMAKE +=3D "KERNELDIR=3D'${STAGING_KERNEL_DIR}'"
>
>  do_install_append() {
>         # Delete empty directories to avoid QA failures if no modules wer=
e
> built
> -       find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdi=
r
> {} \;
> +       if [ -d ${D}/${nonarch_base_libdir} ]; then
> +               find ${D}/${nonarch_base_libdir} -depth -type d -empty
> -exec rmdir {} \;
> +       fi
>  }
>
>  python do_package_prepend() {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159365):
> https://lists.openembedded.org/g/openembedded-core/message/159365
> Mute This Topic: https://lists.openembedded.org/mt/87597519/1276296
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> anibal.limon@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009407bd05d3204f54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Any update on push this to dunfell?=
,</div><div><br></div><div>I&#39;m facing the issue,=C2=A0</div><div><br></=
div><div><a href=3D"https://ci.linaro.org/job/lt-qcom-openembedded-meta-qco=
m-premerge-dunfell/46/MACHINE=3Ddragonboard-410c,TCLIBC=3Dglibc,label=3Ddoc=
ker-buster-amd64/console">https://ci.linaro.org/job/lt-qcom-openembedded-me=
ta-qcom-premerge-dunfell/46/MACHINE=3Ddragonboard-410c,TCLIBC=3Dglibc,label=
=3Ddocker-buster-amd64/console</a><br></div><div><br></div><div>Thanks in a=
dvance!,</div><div>Anibal</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 8 Dec 2021 at 14:21, Anibal Limon vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
anibal.limon=3D<a href=3D"mailto:linaro.org@lists.openembedded.org">linaro.=
org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Andrey Zhizhikin &lt;<a href=3D"mailto:andr=
ey.z@gmail.com" target=3D"_blank">andrey.z@gmail.com</a>&gt;<br>
<br>
When CONFIG_TRACEPOINTS is not enabled in kernel config - module<br>
compilation is skipped, which causes the ${D}/${nonarch_base_libdir} not<br=
>
to be created.<br>
<br>
This fails later in do_install:append() due to the fact that find<br>
command in executed for non-existing folder.<br>
<br>
Check for folder existence before find command in executed.<br>
<br>
Signed-off-by: Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com" t=
arget=3D"_blank">andrey.z@gmail.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit de0aa1700ed4e6f04b0a233eb1f6d2ac598e7ed8)<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.11.6.bb" =
rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.11.6.bb</a> | 4 +++-<b=
r>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.11=
.6.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.11.6.bb</a> b/m=
eta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.11.6.bb" rel=3D"=
noreferrer" target=3D"_blank">lttng-modules_2.11.6.bb</a><br>
index 3fdc8094e9..3145f0298c 100644<br>
--- a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.11.6.bb" =
rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.11.6.bb</a><br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.11.6.bb" =
rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.11.6.bb</a><br>
@@ -39,7 +39,9 @@ EXTRA_OEMAKE +=3D &quot;KERNELDIR=3D&#39;${STAGING_KERNEL=
_DIR}&#39;&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Delete empty directories to avoid QA failures=
 if no modules were built<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}/${nonarch_base_libdir} -depth -type d=
 -empty -exec rmdir {} \;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}/${nonarch_base_libdir} ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}/${nonarch=
_base_libdir} -depth -type d -empty -exec rmdir {} \;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0python do_package_prepend() {<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159365): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159365" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159365</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87597519/1276=
296" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87597519/1276296</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:anibal.limon@linaro.org" t=
arget=3D"_blank">anibal.limon@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009407bd05d3204f54--


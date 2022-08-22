Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F43C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:16:53 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.15023.1661152606371034450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f+XQTyoK;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: ernstp@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id d126so10161477vsd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mEHbs/uRmkrYMvYkXeaXoxh2qIYnYqrL6/EL6PzdpEk=;
        b=f+XQTyoKjxB5p2xZ3+hc2mXombR5IGYCs+hOAHmz8tcjmdnzV7lY1RIQj3xMa4BR0s
         mGkdpna09nJcAKCtErbbFi03R1ct3Osv0a7laOB04/yUYZCrwudODvNx96LfFxmm8B3x
         iMtEq/lV5ZPpfcPD6xxKI8LIZnWtv1qphVjd8oQqY+moep9KBpoVluip/kDcvED7f2Gw
         S/bPE/J90NLFotDfseS6OHkOQ2C9QL2K5XStz5n28GX/gMxbu3g5+7Vz+yJHZRdt3bWO
         ref7GqbiN+3iKH4XzcavfiFQww9BEDpKptFXsDbqTLH6Stz8pzj7EnZLtyJzu+GEyGXg
         O5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mEHbs/uRmkrYMvYkXeaXoxh2qIYnYqrL6/EL6PzdpEk=;
        b=MlhpejHxbbZCGGsbp1cpy6jEgbVHQpxZO8P8Z+8Xk+LPxm5pFT8Q3u4ZZt5tJeaPlx
         8NfeelBb0HxHjNeV4Mtcot13hXT0rYkPT2KMxBvQWgsvlo/gldi5NS/s+M8RnfKPXuSd
         zVeNn/jCX5r++y7lalx0mTO4FfD6ehFYzNJSspgU5m9/1hf4uP5lOLgWeTB7PPvsqY2n
         s2kBnrPoeEpLnPTz5sswYowkv073ZJIIKbXOeyzwnM12mYOBPlbXiHb+BGcHJ3d2spSh
         HI6G1I0UuxLzb2JHXtjw2CAc6+v9kGiZRqOJyTlH1/cOBH0lPdBgajzYoQLrGXmxmuxE
         Budg==
X-Gm-Message-State: ACgBeo2T+hzu+4jyTNWCfWQam6t6ZlneGuX1w1HXBAPwTG5YDysZTyVl
	eSGLIiz1HvdCyVsPzy6CEygfm+yIpnjp7Up9bmo=
X-Google-Smtp-Source: 
 AA6agR49tUbCHxklAauzA+nNkxdfmdjrqaZGbYBUhxjz2/SgwRsG3xN+Tfw1YgOMRC3J/+FuPcpB1QiQEcOq5YCVhuU=
X-Received: by 2002:a67:b70e:0:b0:38a:c321:175d with SMTP id
 h14-20020a67b70e000000b0038ac321175dmr6849650vsf.69.1661152605270; Mon, 22
 Aug 2022 00:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
In-Reply-To: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Mon, 22 Aug 2022 09:16:34 +0200
Message-ID: 
 <CAD=4a=Xuonh+4dw9gF52BPEhxccUvkeODnQ4TrYteOnW_sdrbA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore
 list
To: Wes Lindauer <wesley.lindauer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f4781005e6cf3add"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 07:16:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169660

--000000000000f4781005e6cf3add
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you have a compressed initrd for example this could give you a surprise,
so I'm not 100% sure about this.

/Regards

Den m=C3=A5n 22 aug. 2022 kl 07:00 skrev Wes Lindauer <wesley.lindauer@gmai=
l.com
>:

> It should not matter what xz/zstd parallelism and resource usage is set t=
o
> when determining hash signatures. This allows sharing more sstate across
> host machines with different CPU configurations.
>
> Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index dd2df8a552..d9eb1831ea 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -944,7 +944,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD
> BB_TASKHASH BBPATH BBSERVER DL_DI
>      BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot
> DEPLOY_DIR \
>      SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
>      SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE
> GIT_CEILING_DIRECTORIES \
> -    OMP_NUM_THREADS BB_CURRENTTASK"
> +    XZ_MEMLIMIT XZ_THREADS XZ_DEFAULTS ZSTD_THREADS OMP_NUM_THREADS
> BB_CURRENTTASK"
>  BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PAT=
HS
> BUILDHISTORY_DIR \
>      SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS
> RUST_TARGET_SYS"
>  BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME
> SSH_AGENT_PID \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169658):
> https://lists.openembedded.org/g/openembedded-core/message/169658
> Mute This Topic: https://lists.openembedded.org/mt/93175519/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f4781005e6cf3add
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">If you have a compressed initrd for example this could =
give you a surprise, so I&#39;m not 100% sure about this.<br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif">/Regards<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Den m=C3=A5n 22 aug. 2022 kl 07:00 skrev Wes Lind=
auer &lt;<a href=3D"mailto:wesley.lindauer@gmail.com">wesley.lindauer@gmail=
.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It=
 should not matter what xz/zstd parallelism and resource usage is set to<br=
>
when determining hash signatures. This allows sharing more sstate across<br=
>
host machines with different CPU configurations.<br>
<br>
Signed-off-by: Wes Lindauer &lt;<a href=3D"mailto:wesley.lindauer@gmail.com=
" target=3D"_blank">wesley.lindauer@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index dd2df8a552..d9eb1831ea 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -944,7 +944,7 @@ BB_HASHEXCLUDE_COMMON ?=3D &quot;TMPDIR FILE PATH PWD B=
B_TASKHASH BBPATH BBSERVER DL_DI<br>
=C2=A0 =C2=A0 =C2=A0BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recip=
e_sysroot DEPLOY_DIR \<br>
=C2=A0 =C2=A0 =C2=A0SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDAT=
A \<br>
=C2=A0 =C2=A0 =C2=A0SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_=
CEILING_DIRECTORIES \<br>
-=C2=A0 =C2=A0 OMP_NUM_THREADS BB_CURRENTTASK&quot;<br>
+=C2=A0 =C2=A0 XZ_MEMLIMIT XZ_THREADS XZ_DEFAULTS ZSTD_THREADS OMP_NUM_THRE=
ADS BB_CURRENTTASK&quot;<br>
=C2=A0BB_BASEHASH_IGNORE_VARS ?=3D &quot;${BB_HASHEXCLUDE_COMMON} PSEUDO_IG=
NORE_PATHS BUILDHISTORY_DIR \<br>
=C2=A0 =C2=A0 =C2=A0SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_S=
YS RUST_TARGET_SYS&quot;<br>
=C2=A0BB_HASHCONFIG_IGNORE_VARS ?=3D &quot;${BB_HASHEXCLUDE_COMMON} DATE TI=
ME SSH_AGENT_PID \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169658): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169658" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169658</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93175519/4947=
266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93175519/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f4781005e6cf3add--


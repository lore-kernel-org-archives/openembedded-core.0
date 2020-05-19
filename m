Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.3951.1589850446299680533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 18:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=csFlaLeE;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id s3so10412318eji.6
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 18:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ESbXVCgy0DnA0nPc2UKkl5nAUu6ayc+hlT4qhBPWq0g=;
        b=csFlaLeEPeoK9+bsUM5Zkqbqi2R90mvlto35VDq/SPv8MJSD5TfphMLyMMRQ3ENTwj
         s8RFVRt24VKMOq6AzMfcMJY0hslmGvbTC201tRzbEADsmoHP7UHh4WhVYkDzcMssL1Si
         4luQsuRzIcKYrhkL3aXBmpzkhCJhmiWtVycD1erIdpSpMd9tWRJ4M8Xg6fQGZDkLg5pI
         aMHIjFeeLWK7lMkL9QUizojDirTZ/S972ddcHN59AtD1OvZ6qeq3TVTzLfFPbtex5y+j
         UxD6RDQ9/wyCwL/LsBq0EB54pasauIOlt4gMlpup3+gR//KxvBXhZw4DBpVwT3OBWzjc
         Goqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ESbXVCgy0DnA0nPc2UKkl5nAUu6ayc+hlT4qhBPWq0g=;
        b=Dk1zOFULZIkrUBWjTxk7GpxSEJvSYUKWYCh4E4BYPCnuT+Y/NGwS4s3dTCn5Lgi2t4
         nmBdeioU4/kxiANMweeTHMlyqFqF905e9qOe+TD+rv0F0zHXB1i8hOqoxLENStcrFBw3
         2w96LiaE1SYYXIkfEKigr5FojvekGWqfEB7Chjq7a7X/mh+BGSa7iT2XsXWS+SkawrX/
         htV4040nUwacpxPu3NYzTbu1JjBj4mZqGjbu7GsRnw67QEUprgTk2Gtb1pfndYWh7zpP
         jcbNegzamrORFVqhSuve0ZDWS5MJxgIV2tAhWIynorco5sOS8gYCbOzbbEgAsrTv1Y3p
         l2aw==
X-Gm-Message-State: AOAM531tq47RbbLbNmB7TM4rilP560IgWHB6F30zT7Hh3fK6mrW6Buxw
	/0HM9YpW4gPayXZ4KmiEQdmsj7acp+1souMIp3w=
X-Google-Smtp-Source: ABdhPJx0tsXXPjA+INty6t21kdUtu6DpOIo68Kz4CGpabp2IYsbTtXT6yycUnOp2Un0bpNFsu1GFEE23YYHNeoe9ydA=
X-Received: by 2002:a17:907:420e:: with SMTP id oh22mr17158599ejb.320.1589850444898;
 Mon, 18 May 2020 18:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <1589882511-3446-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1589882511-3446-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 19 May 2020 03:07:13 +0200
Message-ID: <CA+chaQcqsTi8h+-U5Jw0f9y5L5abjaz5tJqG7dQVPRAJH2dzFg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] make-mod-scripts: Added ALLOW_EMPTY to fix dependence error.
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000003a3ff05a5f5e757"

--00000000000003a3ff05a5f5e757
Content-Type: text/plain; charset="UTF-8"

Set RDEPENDS_${PN}-dev to empty instead of installing useless empty
packages.

On Tue, May 19, 2020 at 3:02 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Error:
>  Problem: conflicting requests
>   - nothing provides make-mod-scripts = 1.0-r0 needed by
> make-mod-scripts-dev-1.0-r0
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 460e05a445..e6719af15a 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -25,3 +25,4 @@ do_configure() {
>                    -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR}
> scripts prepare
>
>  }
> +ALLOW_EMPTY_${PN} = "1"
> --
> 2.17.1
>
>
>
> 
>

--00000000000003a3ff05a5f5e757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Set RDEPENDS_${PN}-dev to empty instead of installing usel=
ess empty packages.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, May 19, 2020 at 3:02 AM zhengruoqin &lt;<a href=
=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Error:<=
br>
=C2=A0Problem: conflicting requests<br>
=C2=A0 - nothing provides make-mod-scripts =3D 1.0-r0 needed by make-mod-s=
cripts-dev-1.0-r0<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scri=
pts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a=
> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-m=
od-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.=
0.bb</a> b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-=
scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.b=
b</a><br>
index 460e05a445..e6719af15a 100644<br>
--- a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scri=
pts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a=
><br>
+++ b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scri=
pts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a=
><br>
@@ -25,3 +25,4 @@ do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-C ${=
STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} scripts prepare<br>
<br>
=C2=A0}<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000003a3ff05a5f5e757--

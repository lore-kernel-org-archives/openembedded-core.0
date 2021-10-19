Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C557C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 17:15:16 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.13123.1634663714883949914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 10:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qC53ATr8;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id t9so9092105lfd.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 10:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pvHg1SPE5ubG6JZCldDIf3ho5QPULsx/5TNN7a7QY64=;
        b=qC53ATr80xIc8te26SW8wIsdi54zajmj12IjrMNT/iA6+77BAgNNSeJwsWj00jhP/H
         UhQlQ5MNfl2ubK/RFzZW4joNRfTIMxy219JQFnzJvb9OvnVW0uUfLu7mmenRs9zkSgFp
         YSFCnXXfF0bHWVTxNGc7SZYko8am4HWhYWsZPhyU5UvXm9PjhO66EnBFWbIepsxPPOzA
         s159q19QsvZoJWM3JGmqgnp3uNyZw76ERt1jROoWMF7YL+NQ/uIin+UPIWMhkaq851PC
         nFprCOz9gh8CA6uK0YnKI/TSN0iVhfhH/Mmpvpbc0UZab+28dEPA8Gm5ZmgMiT9Yn6j3
         5Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pvHg1SPE5ubG6JZCldDIf3ho5QPULsx/5TNN7a7QY64=;
        b=LyDb/QbVnWGDWaVOZV1JVzbgbLQ8QlK7Zt2U1Lxt4gkbYKQvxn749U1sQDG+Iso8Xd
         92kajjJsB3FltmMjMgt7CQMDUhnknWgaPzhGF3+Og+CIpFRxTOCeVeEC1h3uBDLbc+rg
         mOL5VU2USnq09RM0fH22x+Z6cNUyw6Z7jjmSuoT2e5kS6CCi7IZ9KsP83RLQL4YAd6Vs
         CGOMY/xw+8b0FdIKPXHZXtD6TquDb45o9i2RKxvAz9YKoUnRHyFRGiRYALzDmfWvepGn
         nySxvfYpd86cR04kt87tqD5HbfT6J0xN9wYMh/7AZVzSqpDw1gyS0OI9tyaXpbCrgiWl
         TnFQ==
X-Gm-Message-State: AOAM5334UXU1xokcrAwpkEsWBDp0rri0GixOOoaX0L7W6qBV0aS8rcr9
	vGaRXF0vcsIFtxxl5/uAb1jfjy77aj5n7pbvZRQ=
X-Google-Smtp-Source: 
 ABdhPJzjhIa3sJPIVbtyfOOtMQfJFxpegRQyZ/Ibu+QCrzMqNotnj+Ak77aEmH0YDfL3qsL15U2Bany5c6UI9MVcSt8=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr6976673lff.95.1634663712862;
 Tue, 19 Oct 2021 10:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211019170321.18270-1-pkj@axis.com>
In-Reply-To: <20211019170321.18270-1-pkj@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 19 Oct 2021 18:15:01 +0100
Message-ID: 
 <CANPvuR=noMymOncORwNan6-D-DCkSKQDXYjjWR+8yhqx3JxY=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc.bbclass: Allow externalsrc to be
 extended with extra classes
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eebce005ceb7cda9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 17:15:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157191

--000000000000eebce005ceb7cda9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

require the class on the new one will do the same
and we don't need any changes for that
but I may not be seeing everything

require ${COREBASE}/meta/classes/externalsrc.bbclass

Jose

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia ter=C3=A7a=
,
19/10/2021 =C3=A0(s) 18:03:

> The EXTERNALSRC_EXTENSIONS variable holds a list of additional classes
> that will be inherited when externalsrc is inherited.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> We have had a local copy of this class for a long time since we need
> to make it suppport a local class when checking BBCLASSEXTEND. And
> now we wanted to add some more functionality that should be active
> when externalsrc is in use. So instead of forking the class even
> more, I thought it would be better to make the upstream class
> extendable. The solution was inspired by USERADDEXTENSION in
> useradd.bbclass.
>
>  meta/classes/externalsrc.bbclass | 5 +++++
>  meta/conf/documentation.conf     | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index abfe24bace..488d75760f 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -265,3 +265,8 @@ def srctree_configure_hash_files(d):
>      return ' '.join(out_items)
>
>  EXPORT_FUNCTIONS do_buildclean
> +
> +# Use the following to extend externalsrc with custom functionality
> +EXTERNALSRC_EXTENSIONS ??=3D ""
> +
> +inherit ${EXTERNALSRC_EXTENSIONS}
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 80ad8e10d5..6d5b734b02 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -160,6 +160,7 @@ EXTENDPE[doc] =3D "Used with file and pathnames to
> create a prefix for a recipe's
>  EXTENDPKGV[doc] =3D "The full package version specification as it appear=
s
> on the final packages produced by a recipe."
>  EXTERNALSRC[doc] =3D "If externalsrc.bbclass is inherited, this variable
> points to the source tree, which is outside of the OpenEmbedded build
> system."
>  EXTERNALSRC_BUILD[doc] =3D "If externalsrc.bbclass is inherited, this
> variable points to the directory in which the recipe's source code is
> built, which is outside of the OpenEmbedded build system."
> +EXTERNALSRC_EXTENSIONS[doc] =3D "A list of additional classes that will =
be
> inherited when externalsrc is inherited."
>  EXTRA_IMAGE_FEATURES[doc] =3D "The list of additional features to includ=
e
> in an image. Configure this variable in the conf/local.conf file in the
> Build Directory."
>  EXTRA_IMAGEDEPENDS[doc] =3D "A list of recipes to build that do not prov=
ide
> packages for installing into the root filesystem. Use this variable to li=
st
> recipes that are required to build the final image, but not needed in the
> root filesystem."
>  EXTRA_OECMAKE[doc] =3D "Additional cmake options."
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157190):
> https://lists.openembedded.org/g/openembedded-core/message/157190
> Mute This Topic: https://lists.openembedded.org/mt/86444902/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000eebce005ceb7cda9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter,<br><br>require the class on the=
 new one will do the same</div><div>and we don&#39;t need any changes for t=
hat</div><div dir=3D"ltr">but I may not be seeing everything</div><div dir=
=3D"ltr"><br><div class=3D"gmail_quote"></div>require ${COREBASE}/meta/clas=
ses/externalsrc.bbclass</div><div dir=3D"ltr"><br></div><div>Jose</div><div=
><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">pete=
r.kjellerstedt@axis.com</a>&gt; escreveu no dia ter=C3=A7a, 19/10/2021 =C3=
=A0(s) 18:03:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e EXTERNALSRC_EXTENSIONS variable holds a list of additional classes<br>
that will be inherited when externalsrc is inherited.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
<br>
We have had a local copy of this class for a long time since we need<br>
to make it suppport a local class when checking BBCLASSEXTEND. And<br>
now we wanted to add some more functionality that should be active<br>
when externalsrc is in use. So instead of forking the class even<br>
more, I thought it would be better to make the upstream class<br>
extendable. The solution was inspired by USERADDEXTENSION in<br>
useradd.bbclass.<br>
<br>
=C2=A0meta/classes/externalsrc.bbclass | 5 +++++<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A02 files changed, 6 insertions(+)<br>
<br>
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class<br>
index abfe24bace..488d75760f 100644<br>
--- a/meta/classes/externalsrc.bbclass<br>
+++ b/meta/classes/externalsrc.bbclass<br>
@@ -265,3 +265,8 @@ def srctree_configure_hash_files(d):<br>
=C2=A0 =C2=A0 =C2=A0return &#39; &#39;.join(out_items)<br>
<br>
=C2=A0EXPORT_FUNCTIONS do_buildclean<br>
+<br>
+# Use the following to extend externalsrc with custom functionality<br>
+EXTERNALSRC_EXTENSIONS ??=3D &quot;&quot;<br>
+<br>
+inherit ${EXTERNALSRC_EXTENSIONS}<br>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br=
>
index 80ad8e10d5..6d5b734b02 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -160,6 +160,7 @@ EXTENDPE[doc] =3D &quot;Used with file and pathnames to=
 create a prefix for a recipe&#39;s<br>
=C2=A0EXTENDPKGV[doc] =3D &quot;The full package version specification as i=
t appears on the final packages produced by a recipe.&quot;<br>
=C2=A0EXTERNALSRC[doc] =3D &quot;If externalsrc.bbclass is inherited, this =
variable points to the source tree, which is outside of the OpenEmbedded bu=
ild system.&quot;<br>
=C2=A0EXTERNALSRC_BUILD[doc] =3D &quot;If externalsrc.bbclass is inherited,=
 this variable points to the directory in which the recipe&#39;s source cod=
e is built, which is outside of the OpenEmbedded build system.&quot;<br>
+EXTERNALSRC_EXTENSIONS[doc] =3D &quot;A list of additional classes that wi=
ll be inherited when externalsrc is inherited.&quot;<br>
=C2=A0EXTRA_IMAGE_FEATURES[doc] =3D &quot;The list of additional features t=
o include in an image. Configure this variable in the conf/local.conf file =
in the Build Directory.&quot;<br>
=C2=A0EXTRA_IMAGEDEPENDS[doc] =3D &quot;A list of recipes to build that do =
not provide packages for installing into the root filesystem. Use this vari=
able to list recipes that are required to build the final image, but not ne=
eded in the root filesystem.&quot;<br>
=C2=A0EXTRA_OECMAKE[doc] =3D &quot;Additional cmake options.&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157190): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157190" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157190</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86444902/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86444902/5052612</a><br>
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
 Quaresma</div></div></div></div>

--000000000000eebce005ceb7cda9--


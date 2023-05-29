Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D676C77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 07:24:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.44659.1685345055434220624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 00:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cnqL4VNA;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so862561f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 00:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685345054; x=1687937054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ebIgsC4R8No5oLLgfS+CIsRk0LBZhJI58qj1+OnjUpc=;
        b=cnqL4VNAy8HwoKMPD6kvz6ajuXHTjuGQthf4ElGx6gxC9dLgMAAsl2UHCqOAdsJ/Qi
         IDSqBZyVa2M6nlblrMQRWbhIKhdwE8ji3OSfocYXZAOxcQqgrZUzahMjCfQAv7Z8QCoo
         JeBTR9rvHRvTeOtgov8wLP7Ca5ALwO7p/VLhWI8/NGmaKs0ei2KGNTz+d6mTfZ7xMb1G
         4Ut+CSnhl+FvNXoo/Zg7nGAGOz6WLAFrwAdGPDIYUtHom6sVIKhMZMUnILZm9dtMs2IC
         If0njyZVJFVEMOA76DZMVtYCUo3m2H4GPZwYi8nN3Przy1pKqIPdBfd6v8K68rDLLsXp
         WlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685345054; x=1687937054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebIgsC4R8No5oLLgfS+CIsRk0LBZhJI58qj1+OnjUpc=;
        b=Er7fJw1HX1wlBr3aM4nNyXpRs1yhEbEdNAOQtkV6D5StGxTF83kRaYeZq11QtJK7q3
         4jrjcr8RihkMhKAOIRMOdo4C0O4PUAtVbYmMYbUERC7/GfE1G4UX6GnYBt9DVQohmdUG
         yeFYOOdSuSt1/I6HurzuKQi03xXA+lUhG3htoA+cOfY0HDS1EMMJRfVB2xB14CKf93oF
         vZn9OadBtE3DSemWLVHojRhnApcdd1I0YiaqwCy3qbTn5Y1DEZRmYG/ROjoDYS6bF6eb
         hPJv0cpGuQgj/LUY5+mOUMnQVK8M7xdH94gHl8LMcgCY6rQf635ez7Kv+Fsol1Yp59ao
         z+wQ==
X-Gm-Message-State: AC+VfDzMWOHJgtdAyOyXOm8IgS/fbKi21Kv8A9kzBn9yblC8JDBKWm8t
	z9B0yU4h7vU4hGFPjz8/sQMtc2+U7A8N3lv6/JIrcM9Xy4A=
X-Google-Smtp-Source: ACHHUZ4BJJKOZF3T9wukHDl/oyJAD+1Htet6DUklXsfI+ipfHdwTKTKMEmyYpw33lJpdDbPgPv2/rKa74V2aLyFvHnI=
X-Received: by 2002:adf:f5c2:0:b0:307:a7c6:7875 with SMTP id
 k2-20020adff5c2000000b00307a7c67875mr8602463wrp.56.1685345053753; Mon, 29 May
 2023 00:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230528230347.915443-1-mhalstead@linuxfoundation.org>
In-Reply-To: <20230528230347.915443-1-mhalstead@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 29 May 2023 09:23:53 +0200
Message-ID: <CA+chaQfoY9SnFex4PSjEup6jBbhsPSi_CqX+zdiXRX5tLNvMMA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] uninative: Upgrade to 4.0 to include latest gcc 13.1.1
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000040c3a105fccff9e3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 07:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181853

--00000000000040c3a105fccff9e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Works on gentoo with 13.1.1_p20230520 which was failing before and seems to
work with 13.1.1_p20230527 as well (I did only a few builds since upgrade
this morning).

Thanks

Tested-By: Martin Jansa <Martin.Jansa@gmail.com>

On Mon, May 29, 2023 at 1:04=E2=80=AFAM Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/distro/include/yocto-uninative.inc
> b/meta/conf/distro/include/yocto-uninative.inc
> index f3c05b7e20..ad4816a1f3 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -7,9 +7,9 @@
>  #
>
>  UNINATIVE_MAXGLIBCVERSION =3D "2.37"
> -UNINATIVE_VERSION =3D "3.10"
> +UNINATIVE_VERSION =3D "4.0"
>
>  UNINATIVE_URL ?=3D "
> http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}=
/
> "
> -UNINATIVE_CHECKSUM[aarch64] ?=3D
> "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
> -UNINATIVE_CHECKSUM[i686] ?=3D
> "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
> -UNINATIVE_CHECKSUM[x86_64] ?=3D
> "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
> +UNINATIVE_CHECKSUM[aarch64] ?=3D
> "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
> +UNINATIVE_CHECKSUM[i686] ?=3D
> "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
> +UNINATIVE_CHECKSUM[x86_64] ?=3D
> "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181850):
> https://lists.openembedded.org/g/openembedded-core/message/181850
> Mute This Topic: https://lists.openembedded.org/mt/99190723/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/leave/8023125/3617156/=
1382001340/xyzzy
> [Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000040c3a105fccff9e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Works on gentoo with=C2=A013.1.1_p20230520 which was =
failing before and seems to work with=C2=A013.1.1_p20230527 as well (I did =
only a few builds since upgrade this morning).</div><div><br></div><div>Tha=
nks</div><div><br></div>Tested-By:=C2=A0Martin Jansa &lt;<a href=3D"mailto:=
Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 29, 2023=
 at 1:04=E2=80=AFAM Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxf=
oundation.org">mhalstead@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Michael Halstead=
 &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_blank">mha=
lstead@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/yocto-uninative.inc | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distr=
o/include/yocto-uninative.inc<br>
index f3c05b7e20..ad4816a1f3 100644<br>
--- a/meta/conf/distro/include/yocto-uninative.inc<br>
+++ b/meta/conf/distro/include/yocto-uninative.inc<br>
@@ -7,9 +7,9 @@<br>
=C2=A0#<br>
<br>
=C2=A0UNINATIVE_MAXGLIBCVERSION =3D &quot;2.37&quot;<br>
-UNINATIVE_VERSION =3D &quot;3.10&quot;<br>
+UNINATIVE_VERSION =3D &quot;4.0&quot;<br>
<br>
=C2=A0UNINATIVE_URL ?=3D &quot;<a href=3D"http://downloads.yoctoproject.org=
/releases/uninative/$%7BUNINATIVE_VERSION%7D/" rel=3D"noreferrer" target=3D=
"_blank">http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_V=
ERSION}/</a>&quot;<br>
-UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;b11f7dff0ff5e3c971f22e89a105efb0f8d=
2006fd71d1ea3e5da771e416b0e01&quot;<br>
-UNINATIVE_CHECKSUM[i686] ?=3D &quot;ad7daa7fca7693ca07eea5279f830333530171=
d357759b380954a25254edd8dd&quot;<br>
-UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;ce8ff7e3247da312fbf84008f415bc1b4d11=
3ac9fe4ec91581e4a20cd8b475d3&quot;<br>
+UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;7baa8418a302df52e00916193b0a04f3183=
56d9d2670c9a2bce3e966efefd738&quot;<br>
+UNINATIVE_CHECKSUM[i686] ?=3D &quot;83114d36883d43a521e280742b9849bf85d039=
b2f83d8e21d480659babe75ee8&quot;<br>
+UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;fd75b2a1a67a10f6b7d65afb7d0f3e71a63b=
0038e428f34dfe420bb37716558a&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181850): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181850" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181850</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99190723/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99190723/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
leave/8023125/3617156/1382001340/xyzzy" rel=3D"noreferrer" target=3D"_blank=
">https://lists.openembedded.org/g/openembedded-core/leave/8023125/3617156/=
1382001340/xyzzy</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_=
blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000040c3a105fccff9e3--


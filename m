Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD0EC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 16:18:10 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.48627.1681143483622546669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 09:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SYiEIHKw;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id a13so5172097ybl.11
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681143483; x=1683735483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KEgDDtNg/mPEz1h46eAmCnUExNvA191a45ub5BA1QLw=;
        b=SYiEIHKwscblwKtXdcE6u8fFyoB3Yi3cXcejvipMdrY8QSGpgHDiuH69e+2sTAAGVN
         Mv3R/LZdQiFeWP3KI8cTpJk6vIIrn4y69wRU87QDbSh2Xr+Wtji+sPxYHpjFZx9ml3Ot
         jYu0Xcpr9KbEV1q8bJp6wJKO3R+b9VfkPg04vOlw9hDrZOORSosLkWbJPpw5zxPh/4Zv
         nX+H1C0kn8hOicgdskwz/ij5qz4jRGKB38ubCpoTf4HnSHRJ7Pzk7LBN2w+HQvyVgivE
         oRkQ6CfLANvfCOrYQYVhv/rs6V7CL85lVROtRiMh2Bk7kGHNN1GZgS/LZNwe3g/A4ac7
         /uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681143483; x=1683735483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEgDDtNg/mPEz1h46eAmCnUExNvA191a45ub5BA1QLw=;
        b=drUSYDy4zDJdwWh58bS+XJMjXNqC9vqcdDWHE2c6aAPLCdRhEuyjcUa0tZky9vMSoM
         AOm6YzNtfw6gYbwSF9h9LNTCFvcJCxp2tgi4GOpPIx0IZLsrCydO04xrfTD0Enp6TNGb
         Afom5hFqPi2gpwfDniZ9wNHZtepUCYUPdq230Xl6b+4mXiDVy7FuUr0NomlrYEcEexj2
         OvkWdHRNJSqzOzU6HltUCjZbX6hMFq6CX+C/DY2BSmL4yOcQXbESmR6h9tbz9aiFVeFZ
         vHArEbSQImEEavWkrz8necCMy7pWnncuWC4fOU3c7mE+WhKSyGtKDMJwuPq6C79gsaVy
         g1yA==
X-Gm-Message-State: AAQBX9dUJ9AR5iT09c60HWBDmXRixYjHEDmAj9v+E9UfZH1nvdoMv1Af
	b/0Uad0QEJFSQq1jojhHw4EmkTav/PqQb+lo42Y=
X-Google-Smtp-Source: AKy350ZVlr2o4yBZEvZazBJbseaY8iSvLEZ+WEGdlge9VuN0JIfvuvJOOrcm2RTSrGSfBC6oe3GKWFolMBWhvq5x2og=
X-Received: by 2002:a25:dad3:0:b0:b77:e465:cb16 with SMTP id
 n202-20020a25dad3000000b00b77e465cb16mr7253115ybf.11.1681143482551; Mon, 10
 Apr 2023 09:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 10 Apr 2023 09:17:51 -0700
Message-ID: <CANx9H-AW=uze3x6nN94XW0B+nYXGQncG2e6mMafXjKUG1g62Tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 39.0.2 -> 40.0.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001814d405f8fdb855"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 16:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179891

--0000000000001814d405f8fdb855
Content-Type: text/plain; charset="UTF-8"

This must be upgraded lock step with python3-cryptography. I am
intentionally holding off on that until the 4.2 release is complete.

On Mon, Apr 10, 2023 at 2:37 AM wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...vectors_39.0.2.bb => python3-cryptography-vectors_40.0.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_39.0.2.bb =>
> python3-cryptography-vectors_40.0.1.bb} (90%)
>
> diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_39.0.2.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_40.0.1.bb
> similarity index 90%
> rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_39.0.2.bb
> rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_40.0.1.bb
> index 795e27f75b..aa305dd736 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_40.0.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
>  #       Upgrade both recipes at the same time
>
> -SRC_URI[sha256sum] =
> "a68f106f7a4322cf1e7ed51e3fc6d5c1e0b11d337ed918ec879e8afe0c2a5220"
> +SRC_URI[sha256sum] =
> "8460706b5b5d0ce4a85571ca3389cf88f700bb6a0c6133dc9fe0f5a2f5bda041"
>
>  PYPI_PACKAGE = "cryptography_vectors"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179873):
> https://lists.openembedded.org/g/openembedded-core/message/179873
> Mute This Topic: https://lists.openembedded.org/mt/98172280/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001814d405f8fdb855
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This must be upgraded lock step with python3-cryptography=
. I am intentionally holding off on that until the 4.2 release is complete.=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Apr 10, 2023 at 2:37 AM wangmy &lt;<a href=3D"mailto:wangmy@fu=
jitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/pyca/cryptography/blo=
b/main/CHANGELOG.rst</a><br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://vectors_39.0.2.bb" rel=3D"noreferrer" target=3D"=
_blank">vectors_39.0.2.bb</a> =3D&gt; <a href=3D"http://python3-cryptograph=
y-vectors_40.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogra=
phy-vectors_40.0.1.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-crypto=
graphy-vectors_39.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryp=
tography-vectors_39.0.2.bb</a> =3D&gt; <a href=3D"http://python3-cryptograp=
hy-vectors_40.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_40.0.1.bb</a>} (90%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy-vectors_39.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography-vectors_39.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"htt=
p://python3-cryptography-vectors_40.0.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-cryptography-vectors_40.0.1.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cryptogr=
aphy-vectors_39.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypto=
graphy-vectors_39.0.2.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cryptograp=
hy-vectors_40.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_40.0.1.bb</a><br>
index 795e27f75b..aa305dd736 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_39.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_39.0.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_40.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_40.0.1.bb</a><br>
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4fb=
6fae01f1d253ab91511e4 \<br>
=C2=A0# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a68f106f7a4322cf1e7ed51e3fc6d5c1e0b11d337ed91=
8ec879e8afe0c2a5220&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8460706b5b5d0ce4a85571ca3389cf88f700bb6a0c613=
3dc9fe0f5a2f5bda041&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179873): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179873" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179873</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98172280/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98172280/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001814d405f8fdb855--


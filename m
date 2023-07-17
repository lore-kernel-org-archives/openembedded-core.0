Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BF4EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:31:36 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.4483.1689586294970394298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZcwSNw4L;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-56fff21c2ebso42729227b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689586294; x=1692178294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8o93eajk0LzHjKeTLbKFCzUnGHsjuzOONTbXm4eJrII=;
        b=ZcwSNw4Li+SeTke6znhTjqoXR5ZXsYlEF0hFYN3Od3098WwgiuKIe+3YsTFlnEJmwB
         GmGAgH1jOAZGlsodyn4LmQwwzPWGDgtgGD8dxIDwIBYglF34D0nz81doX/bjeiip4dJH
         Ev+qZShriCWTunvan73g8R1vNr9pgW/seexaydW2YB2xqQZQX9JN8FoKmXlqa3LRm/57
         K1af+EYSkUHuc7v038on+HW/e4m7qIxiEDy+RsErbxu3/d+nGpyM6VfAKCVeXo8C8iG/
         ZHgCH+Grn19HH0xUcOUGVUsBcSSJeTeK6lMEKsNQJfoHzsix7D2dMnJh/hESdNKPWijk
         qAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689586294; x=1692178294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8o93eajk0LzHjKeTLbKFCzUnGHsjuzOONTbXm4eJrII=;
        b=PYPDq45+rpxauHqUoPY4W06jPYYM6RXS41CJxT3c6c/c5m9wzU13wn0B8uU+uHZQgO
         kFZ7htVqhMXAvArcGqWDMnNznbWach+IRJi7qEU9bfK2u9thzdzQLX9CESaRWrxT1lo7
         6GUH0sLnoWL3UdTJ0n/VxPXQ5+8eJKyWt7jdHbxyrDuH6sbluRNvZ1BjfldESM1QrHOS
         F0KtbLP87gDBXHo05et7c4EKS+JqbfocCKpVd/CByY81Ix4gD3Qu+zh0I+sOWopOgfqq
         +LRDFCMm1iLf+eYdTdwaKETRQmWw6R0BAZimQ/MQEtEHjyXGpqhvAcSxiZtfGizPPbbU
         F+zA==
X-Gm-Message-State: ABy/qLYlU9OrF1HWfR5qErqrZS8g2SIJRXAzz/XCmjTOTuJoZOvK7qvE
	o3mZme9cMa30lHa7pr4tZcMJ1arDknlxeRaZRfQ=
X-Google-Smtp-Source: APBJJlGs3h2rYQhNlFJhw3V0Rx8puwN1EfkFO+CzOD9i24Oav1CfAnSLMKmbsI9+UfFIGtVy2Mq7rXiv9Zb+HBqgHLQ=
X-Received: by 2002:a0d:c044:0:b0:577:18a8:b7f9 with SMTP id
 b65-20020a0dc044000000b0057718a8b7f9mr10495939ywd.40.1689586293966; Mon, 17
 Jul 2023 02:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com> <1689585025-23731-11-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1689585025-23731-11-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 17 Jul 2023 11:31:22 +0200
Message-ID: <CANx9H-C7wpapytvd1VSy=1npfZT853aapQhyBR0V+CUX3grz+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 41.0.1 -> 41.0.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000de8cc00600ab7612"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184457

--000000000000de8cc00600ab7612
Content-Type: text/plain; charset="UTF-8"

This CANNOT be upgraded without also upgrading python3-cryptography. Please
remove this recipe from your CI loop.

On Mon, Jul 17, 2023 at 11:10 AM wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> ==========
> -Fixed bugs in creating and parsing SSH certificates where critical options
>  with values were handled incorrectly. Certificates are now created
> correctly
>  and parsing accepts correct values as well as the previously generated
>  invalid forms with a warning. In the next release, support for parsing
> these
>  invalid forms will be removed.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...vectors_41.0.1.bb => python3-cryptography-vectors_41.0.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_41.0.1.bb =>
> python3-cryptography-vectors_41.0.2.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.1.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.2.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.1.bb
> rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.2.bb
> index 016620e710..52f2c35315 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
>  #       Upgrade both recipes at the same time
>
> -SRC_URI[sha256sum] =
> "23b08c39777ec7b2774a11f945d1746301b1e88ecff2e5326d7f50ea0f42d580"
> +SRC_URI[sha256sum] =
> "028dff94a8522ca818b11295ff12df55f348f33a193c0597ddfe8239e53d1582"
>
>  PYPI_PACKAGE = "cryptography_vectors"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184448):
> https://lists.openembedded.org/g/openembedded-core/message/184448
> Mute This Topic: https://lists.openembedded.org/mt/100191311/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000de8cc00600ab7612
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This CANNOT be upgraded without also upgrading python3-cr=
yptography. Please remove this recipe from your CI loop.</div><div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 17=
, 2023 at 11:10 AM wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@=
fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Wa=
ng Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangm=
y@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-Fixed bugs in creating and parsing SSH certificates where critical options=
<br>
=C2=A0with values were handled incorrectly. Certificates are now created co=
rrectly<br>
=C2=A0and parsing accepts correct values as well as the previously generate=
d<br>
=C2=A0invalid forms with a warning. In the next release, support for parsin=
g these<br>
=C2=A0invalid forms will be removed.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://vectors_41.0.1.bb" rel=3D"noreferrer" target=3D"=
_blank">vectors_41.0.1.bb</a> =3D&gt; <a href=3D"http://python3-cryptograph=
y-vectors_41.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogra=
phy-vectors_41.0.2.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-crypto=
graphy-vectors_41.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryp=
tography-vectors_41.0.1.bb</a> =3D&gt; <a href=3D"http://python3-cryptograp=
hy-vectors_41.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_41.0.2.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy-vectors_41.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography-vectors_41.0.1.bb</a> b/meta/recipes-devtools/python/<a href=3D"htt=
p://python3-cryptography-vectors_41.0.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-cryptography-vectors_41.0.2.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cryptogr=
aphy-vectors_41.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypto=
graphy-vectors_41.0.1.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cryptograp=
hy-vectors_41.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_41.0.2.bb</a><br>
index 016620e710..52f2c35315 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_41.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_41.0.1.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_41.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_41.0.2.bb</a><br>
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4fb=
6fae01f1d253ab91511e4 \<br>
=C2=A0# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
<br>
-SRC_URI[sha256sum] =3D &quot;23b08c39777ec7b2774a11f945d1746301b1e88ecff2e=
5326d7f50ea0f42d580&quot;<br>
+SRC_URI[sha256sum] =3D &quot;028dff94a8522ca818b11295ff12df55f348f33a193c0=
597ddfe8239e53d1582&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184448): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184448" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184448</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100191311/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100191311/924729</a><br>
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

--000000000000de8cc00600ab7612--


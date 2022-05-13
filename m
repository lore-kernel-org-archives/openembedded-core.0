Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E88C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 15:56:22 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.9978.1652457375808588648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 08:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jvEXKjdu;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id s11so6682485edy.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=WjuzfaY50cjP6pduo11U7SOvjk42Fv26BQUIXT7F2kY=;
        b=jvEXKjduuNKQ4RVCkpwVEAcHw2oixPRzU3ofdvVIQqd6SPof6WX2hN4I+uglqlXPHv
         qA7o//gDhU2Po88OGXoL7Iz6RZsmhp9pEUZdfixIsuwJbwO/GGRbAeUiWvuSC77hEqJd
         rgKEAVLlYJEgMe1Q/kyXkH+wodWMwgm2Z7oZiyekRwWzCBqU9IFrYuVtXa0BQTK2NgSQ
         1gpZUVn5RNdxmUZcKRUUceWWnB1eIbPoV7w+hrvHxQHtljlSvDyMbeyfnipR1O0zFVze
         3+QM84WxsClhWzg8vUCHg8r+PfFSCiAO9jkUPXBfklZsuNOgxYQxEmZR1e73mjRau7IZ
         PAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=WjuzfaY50cjP6pduo11U7SOvjk42Fv26BQUIXT7F2kY=;
        b=LqlrAx5vrdkqCTUB6y3xEw7k/yc9tewCJMb2YYwj47R0pTGsdeAL93UCC3Oja/jKmX
         fpSo7M0xenGGnsJ3Uh0ngxXu5QaEJfZC3fY9vTVPPqiItgNuppJq46/IIyJ6Slfg984L
         MXKKEUtJByxi5msgvUJs5cBwcw5K+Q3kldmla5QBALPnexHJfW86pT66jC4cJrZbPJTh
         9SM3gfZLqwtRVuDpk41QhgZzvx5UEMaLQd0O1tIo5P/S87qwIwsYhDRlei/3SY250Z5a
         Ea5Cj1B1a91U707CVDFHuk/I/vFw7Py1v/Rl7SNYo9nAErvx1KHafpxk3ImObf6FK2mP
         VmKg==
X-Gm-Message-State: AOAM531CP/RneVxdJKRHFoCEWF3Vc7WIadw6sejNXnGi6lNmiGIqO5VV
	YNnXwqZp88bv/q0N2iWdTIU=
X-Google-Smtp-Source: 
 ABdhPJysiyAenDX4Pt/xZIGo5w4GFGxxkooQofG4+jlvbbZKZJGVBs/Lmnz33W47r16vEbZC3PpJjQ==
X-Received: by 2002:a05:6402:51c8:b0:427:b374:6af4 with SMTP id
 r8-20020a05640251c800b00427b3746af4mr40925762edd.349.1652457374008;
        Fri, 13 May 2022 08:56:14 -0700 (PDT)
Received: from smtpclient.apple (host-87-5-19-80.retail.telecomitalia.it.
 [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 f15-20020a056402160f00b0042617ba63a6sm1114284edv.48.2022.05.13.08.56.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 May 2022 08:56:13 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
Message-Id: <98AF0B2F-EA7D-4ED4-9B92-F4CDAE9A2196@gmail.com>
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8E9F8C8B-EBC4-44CC-A978-9A23999DA3ED";
	protocol="application/pkcs7-signature";
	micalg=sha-256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [OE-core] [kirkstone][PATCH v2] openssl: minor security upgrade
 3.0.2 -> 3.0.3
Date: Fri, 13 May 2022 17:56:11 +0200
In-Reply-To: 
 <CAOSpxdZ4qjcbjsvB8v8P7YtUr=0HSxHnrcbxAkYZHkRVK9PGrg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Davide Gardenal <davide.gardenal@huawei.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
References: <20220513133521.904120-1-davide.gardenal@huawei.com>
 <CAOSpxdZ4qjcbjsvB8v8P7YtUr=0HSxHnrcbxAkYZHkRVK9PGrg@mail.gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 15:56:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165578


--Apple-Mail=_8E9F8C8B-EBC4-44CC-A978-9A23999DA3ED
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C42FA07E-0488-42D4-ABA3-938603D64442"


--Apple-Mail=_C42FA07E-0488-42D4-ABA3-938603D64442
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I see, I=E2=80=99m sorry but I haven=E2=80=99t checked master because =
I=E2=80=99m working on kirkstone right now, next time I=E2=80=99ll do =
it.

Davide

> Il giorno 13 mag 2022, alle ore 17:53, Steve Sakoman =
<steve@sakoman.com> ha scritto:
>=20
> On Fri, May 13, 2022 at 3:35 AM Davide Gardenal
> <davidegarde2000@gmail.com <mailto:davidegarde2000@gmail.com>> wrote:
>>=20
>> This minor version include fixes for several CVEs
>>=20
>> CVE: CVE-2022-1292
>> CVE: CVE-2022-1343
>> CVE: CVE-2022-1434
>> CVE: CVE-2022-1473
>>=20
>> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com =
<mailto:davide.gardenal@huawei.com>>
>> ---
>> Updates:
>> -v2 add kirkstone tag in the title
>=20
> Actually, since master is also at version 3.0.2 this patch will have
> to go to master first. I'll then backport it.
>=20
> In cases like this you should probably tag [master][kirkstone] so
> Richard and I both take notice.
>=20
> Steve
>=20
>> ---
>> .../openssl/{openssl_3.0.2.bb =3D> openssl_3.0.3.bb} | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> rename meta/recipes-connectivity/openssl/{openssl_3.0.2.bb =3D> =
openssl_3.0.3.bb} (99%)
>>=20
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb =
b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
>> similarity index 99%
>> rename from meta/recipes-connectivity/openssl/openssl_3.0.2.bb
>> rename to meta/recipes-connectivity/openssl/openssl_3.0.3.bb
>> index a809666aa7..fd88ae807d 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
>> @@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
>> file://environment.d-openssl.sh \
>> "
>>=20
>> -SRC_URI[sha256sum] =3D =
"98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e7ec09d6411dfdb63"
>> +SRC_URI[sha256sum] =3D =
"ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"
>>=20
>> inherit lib_package multilib_header multilib_script ptest perlnative
>> MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
>> --
>> 2.32.0
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165563): =
https://lists.openembedded.org/g/openembedded-core/message/165563 =
<https://lists.openembedded.org/g/openembedded-core/message/165563>
>> Mute This Topic: https://lists.openembedded.org/mt/91080703/3620601 =
<https://lists.openembedded.org/mt/91080703/3620601>
>> Group Owner: openembedded-core+owner@lists.openembedded.org =
<mailto:openembedded-core+owner@lists.openembedded.org>
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
<https://lists.openembedded.org/g/openembedded-core/unsub> =
[steve@sakoman.com <mailto:steve@sakoman.com>]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--Apple-Mail=_C42FA07E-0488-42D4-ABA3-938603D64442
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">I =
see, I=E2=80=99m sorry but I haven=E2=80=99t checked master because =
I=E2=80=99m working on kirkstone right now, next time I=E2=80=99ll do =
it.<div class=3D""><br class=3D""></div><div class=3D"">Davide<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Il giorno 13 mag 2022, alle ore 17:53, Steve Sakoman &lt;<a =
href=3D"mailto:steve@sakoman.com" class=3D"">steve@sakoman.com</a>&gt; =
ha scritto:</div><br class=3D"Apple-interchange-newline"><div =
class=3D""><meta charset=3D"UTF-8" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Fri, May 13, 2022 at 3:35 AM Davide Gardenal</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">&lt;</span><a =
href=3D"mailto:davidegarde2000@gmail.com" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">davidegarde2000@gmail.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">This minor version =
include fixes for several CVEs<br class=3D""><br class=3D"">CVE: =
CVE-2022-1292<br class=3D"">CVE: CVE-2022-1343<br class=3D"">CVE: =
CVE-2022-1434<br class=3D"">CVE: CVE-2022-1473<br class=3D""><br =
class=3D"">Signed-off-by: Davide Gardenal &lt;<a =
href=3D"mailto:davide.gardenal@huawei.com" =
class=3D"">davide.gardenal@huawei.com</a>&gt;<br class=3D"">---<br =
class=3D"">Updates:<br class=3D"">-v2 add kirkstone tag in the title<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Actually, since master is also at version 3.0.2 this patch =
will have</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">to go to =
master first. I'll then backport it.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">In cases like this you should probably tag =
[master][kirkstone] so</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Richard and I both take notice.</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Steve</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">---<br =
class=3D"">.../openssl/{openssl_3.0.2.bb =3D&gt; openssl_3.0.3.bb} | 2 =
+-<br class=3D"">1 file changed, 1 insertion(+), 1 deletion(-)<br =
class=3D"">rename meta/recipes-connectivity/openssl/{openssl_3.0.2.bb =
=3D&gt; openssl_3.0.3.bb} (99%)<br class=3D""><br class=3D"">diff --git =
a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb =
b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb<br =
class=3D"">similarity index 99%<br class=3D"">rename from =
meta/recipes-connectivity/openssl/openssl_3.0.2.bb<br class=3D"">rename =
to meta/recipes-connectivity/openssl/openssl_3.0.3.bb<br class=3D"">index =
a809666aa7..fd88ae807d 100644<br class=3D"">--- =
a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb<br class=3D"">+++ =
b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb<br class=3D"">@@ =
-18,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \<br class=3D""><a =
href=3D"file:///environment.d-openssl.sh" =
class=3D"">file://environment.d-openssl.sh</a> \<br class=3D"">"<br =
class=3D""><br class=3D"">-SRC_URI[sha256sum] =3D =
"98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e7ec09d6411dfdb63"<br =
class=3D"">+SRC_URI[sha256sum] =3D =
"ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"<br =
class=3D""><br class=3D"">inherit lib_package multilib_header =
multilib_script ptest perlnative<br class=3D"">MULTILIB_SCRIPTS =3D =
"${PN}-bin:${bindir}/c_rehash"<br class=3D"">--<br class=3D"">2.32.0<br =
class=3D""><br class=3D""><br class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-<br class=3D"">Links: You receive all messages sent to this =
group.<br class=3D"">View/Reply Online (#165563):<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://lists.openembedded.org/g/openembedded-core/message/165563"=
 =
class=3D"">https://lists.openembedded.org/g/openembedded-core/message/1655=
63</a><br class=3D"">Mute This Topic:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://lists.openembedded.org/mt/91080703/3620601" =
class=3D"">https://lists.openembedded.org/mt/91080703/3620601</a><br =
class=3D"">Group Owner:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:openembedded-core+owner@lists.openembedded.org" =
class=3D"">openembedded-core+owner@lists.openembedded.org</a><br =
class=3D"">Unsubscribe:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://lists.openembedded.org/g/openembedded-core/unsub" =
class=3D"">https://lists.openembedded.org/g/openembedded-core/unsub</a><sp=
an class=3D"Apple-converted-space">&nbsp;</span>[<a =
href=3D"mailto:steve@sakoman.com" class=3D"">steve@sakoman.com</a>]<br =
class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</blockquote></div=
></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_C42FA07E-0488-42D4-ABA3-938603D64442--

--Apple-Mail=_8E9F8C8B-EBC4-44CC-A978-9A23999DA3ED
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCDWEw
ggXsMIID1KADAgECAhAZua6DiHKYOdyCpz+O9+pLMA0GCSqGSIb3DQEBCwUAMIGBMQswCQYDVQQG
EwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UE
CgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IENBIEczMB4XDTIxMDcwOTA4NDU0N1oXDTIyMDcwOTA4NDU0N1owJDEiMCAGA1UEAwwZZGF2aWRl
Z2FyZGUyMDAwQGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAPOY6kcH
hhZIySmCFFosOe+SfI1xlKqhPlhXcx0EKmMYhQvI05SqOyJlvqOsouJffsGs/RQCjo4n+XiqlVbM
xAb4uLe8hQmTfNoDU8OOmod3SMANu5AshWZpvrS4lXR/RcF5bLmlOvr3NA0L0uivdfnZzuJxByZ4
VxTfp01c4KYxwR+OoSsRiJ73Bur9040YVA68PaMLaqGRPFhNBpWtjbUByv2prunNH2/ffam+2cF9
NMsWMA3bIj3jOjeiLlaFgA+s6T5qVAzP2u4iK+SkgBr2Y2SHZCaRWjL5kFySsw35iSYyh5rVN9iW
0RpRI57TY+x9bZhIDdjuk6QWEHJN1MMCAwEAAaOCAbowggG2MAwGA1UdEwEB/wQCMAAwHwYDVR0j
BBgwFoAUvpepqoS/gL8QU30JMvnhLjIbz3cwfgYIKwYBBQUHAQEEcjBwMDsGCCsGAQUFBzAChi9o
dHRwOi8vY2FjZXJ0LmFjdGFsaXMuaXQvY2VydHMvYWN0YWxpcy1hdXRjbGlnMzAxBggrBgEFBQcw
AYYlaHR0cDovL29jc3AwOS5hY3RhbGlzLml0L1ZBL0FVVEhDTC1HMzAkBgNVHREEHTAbgRlkYXZp
ZGVnYXJkZTIwMDBAZ21haWwuY29tMEcGA1UdIARAMD4wPAYGK4EfARgBMDIwMAYIKwYBBQUHAgEW
JGh0dHBzOi8vd3d3LmFjdGFsaXMuaXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggrBgEFBQcD
AgYIKwYBBQUHAwQwSAYDVR0fBEEwPzA9oDugOYY3aHR0cDovL2NybDA5LmFjdGFsaXMuaXQvUmVw
b3NpdG9yeS9BVVRIQ0wtRzMvZ2V0TGFzdENSTDAdBgNVHQ4EFgQUiqeY/IEM07oIVIos/ACCcr6P
njQwDgYDVR0PAQH/BAQDAgWgMA0GCSqGSIb3DQEBCwUAA4ICAQByXme/hneEsW30qwk9NtxPo0jU
XVCtXGFS8vxZbtyzIQCK/3mJYzkAYQndhqz0s7RP3l+J9MkDXp01vVJurlMcgRCmIDEo2NOak/D1
kNj4qNk8QMJmb+E+VKlB4dW9+vghAO1AQb16C5lGQ9QWW+g4cGk58+IXR58kYJe3e4Os1NNZbC1O
8vPo4coKAWlJrABqDmfqMz2WJhjV9xlRZNf7jii1I+qLOScc+l4tIPmBj1NRt4JRmEKrzVG80NHv
vl1Wwb2DcFV/SHWvZ25SZSmzkNiU/KKuFjQcJYxRl03sbBULug6kN5G19vFsv3ci9bM8FtVCMvb4
Mi0c+rsaJFNwh0M/cVdCAY6qvBEB2haT4+YMAGR7MAnAw3YPt8MIOf83dcSC4st6KKni6M6SQbcp
C0QLSnsmTPcUu6ORkcf+OPPa4caPuCwyrXje2GUsCk3u49k5PQTuTB7Ax4UYhFRkBYl0Lq/pwHUE
ewMztjvdnwEvhmKVAH0pcu0hXqMowR6Xn+oOKgaxkP57RrfF06fCLIGJgIeuPO1VT26SCYV0zkZW
OnGXp1BebVCkxeMe5BFtsRCzDlJc+qDSQhbDhTgxSN4OXcZZGSi2a3eFsW+yexIYBGPGhMrzhOk/
k37cYmTEZRztTrFhb/3OhSAIodd191esnTBcWbanuKWWQ2RXxjCCB20wggVVoAMCAQICEBcQPt49
ihy1ygZRk+fKQ2swDQYJKoZIhvcNAQELBQAwazELMAkGA1UEBhMCSVQxDjAMBgNVBAcMBU1pbGFu
MSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1ODUyMDk2NzEnMCUGA1UEAwweQWN0YWxpcyBB
dXRoZW50aWNhdGlvbiBSb290IENBMB4XDTIwMDcwNjA4NDU0N1oXDTMwMDkyMjExMjIwMlowgYEx
CzAJBgNVBAYTAklUMRAwDgYDVQQIDAdCZXJnYW1vMRkwFwYDVQQHDBBQb250ZSBTYW4gUGlldHJv
MRcwFQYDVQQKDA5BY3RhbGlzIFMucC5BLjEsMCoGA1UEAwwjQWN0YWxpcyBDbGllbnQgQXV0aGVu
dGljYXRpb24gQ0EgRzMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDt5oeWocGktu3C
QlX3Pw8PImBfE+CmQ4iGSZF5HBsvGlAP3EYB7va6OobMUWHvxA+ACHEpWq0YfNh6rRUlULOGcIpE
FtVf4nAiEvdQtiFQBmtWJSn3naoMHqpMvmwZ4lL0Xr1U9JHmTqkU3DuYcNNO3S+hYWDZpWQbeSGi
bNVeiJ4kY6JDh0fvqloK1BsuS3n2OgArPYGfAYtDjCvT2d+6Ym3kArHZjEcrZeBI+yVVnjPwbTSC
Kax8DtS2NP/CJ6RjpnRvuSwusRy84OdwdB71VKs1EDXj1ITcCWRZpkz+OhV6L8Zh+P0rmOSJF6Kd
HiaozfncURx4s54GFJNRGkx1DnCxcuL0NJMYG42/hrDYOjNv+oGWSEZO/CT3aaLSMB5wTbZKfcD1
R+tTanXD+5Gz5Mi15DTE7QH8naZjZxqqhyxL1KyuIgaVDxvQtPSjo5vTsoa09rn+Ui8ybHnvYO/a
/68OIQIHLGbUd2COnwm0TiZ3Jg/oYGxwnJPvU1nDXNcecWTIJvFF5qD2ppJH3HgJVVePUEOY1E4K
p3k0B8hdRdhMV5n+O6RCKCTFcZaESF8sELgdrqnCLPP1+rX7DA8pxZoX0/9Jk64EOsbfQyLIJlrr
ob2YS0Xlku6HisZ8qrHLhnkzF5y7O34xmatIp8oZ5c54QP+K5flnTYzWjuIxLwIDAQABo4IB9DCC
AfAwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRS2Ig6yJ94Zu2J83s4cJTJAgI20DBBBggr
BgEFBQcBAQQ1MDMwMQYIKwYBBQUHMAGGJWh0dHA6Ly9vY3NwMDUuYWN0YWxpcy5pdC9WQS9BVVRI
LVJPT1QwRQYDVR0gBD4wPDA6BgRVHSAAMDIwMAYIKwYBBQUHAgEWJGh0dHBzOi8vd3d3LmFjdGFs
aXMuaXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgeMGA1Ud
HwSB2zCB2DCBlqCBk6CBkIaBjWxkYXA6Ly9sZGFwMDUuYWN0YWxpcy5pdC9jbiUzZEFjdGFsaXMl
MjBBdXRoZW50aWNhdGlvbiUyMFJvb3QlMjBDQSxvJTNkQWN0YWxpcyUyMFMucC5BLiUyZjAzMzU4
NTIwOTY3LGMlM2RJVD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0O2JpbmFyeTA9oDugOYY3aHR0
cDovL2NybDA1LmFjdGFsaXMuaXQvUmVwb3NpdG9yeS9BVVRILVJPT1QvZ2V0TGFzdENSTDAdBgNV
HQ4EFgQUvpepqoS/gL8QU30JMvnhLjIbz3cwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUA
A4ICAQAmm+cbWQ10sxID6edV94SAhc1CwzthHFfHpuYS30gisWUfWpgp43Dg1XzG2in3VGV7XrzC
CGZh4JM/XQWp+4oxmyV42Qjz9vc8GRksgo6X2nYObPYZzQjda9wxsCB38i4G3H33w8lf9sFvl0xm
4ZXZ2s2bF/PdqvrK0ZgvF51+MoIPnli/wJBw3p72xbk5Sb1MneSO3tZ293WFzDmz7tuGU0PfytYU
kG7O6annGqbU1I6CA6QVKUqeFLPodSODAFqJ3pimKD0vX9MuuSa0QinH7CkiPtZMD0mpwwzIsnSs
3qOOl60tIZQOTc0I6lCe1LLhrz7Q75J6nNL9N5zVwZ1I3o2Lb8Dt7BA13VFuZvZIzapUGV83R7pm
SVaj1Bik1nJ/R393e6mwppsT140KDVLh4Oenywmp2VpBDuEj9RgICAO0sibv8n379LbO7ARa0kw9
y9pggFzN2PAX25b7w0n9m78kpv3z3vW65rs6wl7E8VEHNfv8+cnb81dxN3C51KElz+l31zchFTur
D5HFEpyEhzO/fMS5AkweRJIzwozxNs7OL/S/SVTpJLJL1ukZ1lnHHX0d3xCzRy/5HqfK3uiG22LP
B5+RjNDobPAjAz2BKMfkF/+v0pzn8mqqkopQaJzEAbLbMpgQYHRCjvrUxxwjJyUFb2Z+40UNtMF4
MTK7zTGCA4UwggOBAgEBMIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcG
A1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMM
I0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhAZua6DiHKYOdyCpz+O9+pLMA0G
CWCGSAFlAwQCAQUAoIIBvzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0yMjA1MTMxNTU2MTJaMC8GCSqGSIb3DQEJBDEiBCB5Uz20Zrv9YTqpBkvohbSTcPQjpHF1XCZ8
B+aDlC0OwjCBpwYJKwYBBAGCNxAEMYGZMIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVy
Z2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4x
LDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhAZua6DiHKYOdyC
pz+O9+pLMIGpBgsqhkiG9w0BCRACCzGBmaCBljCBgTELMAkGA1UEBhMCSVQxEDAOBgNVBAgMB0Jl
cmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoMDkFjdGFsaXMgUy5wLkEu
MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMwIQGbmug4hymDnc
gqc/jvfqSzANBgkqhkiG9w0BAQsFAASCAQCsNpYgQLbmhEbxD5pDy4LhnHsbzI/dR5JwdrXIMzk7
dxWdF4BHeXJi7XFCdtKEjy80s0pn6NxwWw2bdQ4HICsPsNa6nRT4A9pIoG98pjGB/wqhCz04EBuM
5iCCy6M4cZnvq8T2RA4SAX7yUUz371c+UEnVH45m8VvwxQVrOfDc+3OdgBDk6Bd+1/PvJX8XqAS3
aDzumMlYQPBhEVgbagIv6pJQm7goWvBVocf6l/AyxnKHKYudoaNMkclAfs8bMqrSDjYPlwgsLqDi
QcTO67v3NuKgZ9D1r8etdHQzHdV9Mp4uGSIHU6j68n+OQ8f+yMTOpkdgBTFymspEhRVMS4SAAAAA
AAAA
--Apple-Mail=_8E9F8C8B-EBC4-44CC-A978-9A23999DA3ED--


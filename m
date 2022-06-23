Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C88CC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 15:35:39 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9036.1655998532144167016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DhhGGQ7g;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k22so22061955wrd.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q+fns/pIPld3HWsn1Vn1wx6l6rcyqTCbGtg9NQBD+rg=;
        b=DhhGGQ7gFkWj3kXfqGsBbiXx6vbnhGmzwGqxrWkYbhxRrhujDAYPqQIKzLhqaEfFf9
         1r6e6IubVI0iwM7KymEl8hicVGUVADcYqOaLuWFaFntjQDW6Pfllm8Ek/4dfMZtdtFZg
         GhgQ83+lKzy5c+o/iQRNi50gvbsJ/PL9TQkUW1pyOlPGfjKp9hf15gvThbnDIabYQGKD
         ycP+MbDED1hvvKZV0VqCayp7z/O3s8gXGKFX0YzSOINvoxzbg6VhUE30Zv6qOzesY4MA
         gz/1eb8xlgohMDYEbTGJ1w3oZ5DNm2r5WHqiBoBbPyxcvCJfpDTP/dVQs160B3Xq7OjV
         yBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q+fns/pIPld3HWsn1Vn1wx6l6rcyqTCbGtg9NQBD+rg=;
        b=6MTAW+tpB8O/fgJ1gbkSTJ4kOu+by13dfAn7LPLv8fzsBuVSo0QbTsYyQqLct38R1a
         b8n0esCqR7S2R70R7XRCKH1mh8g6c0gZnRv8jxn+7IEiES2BpIvj/AoRn3PEgaN17kP8
         /D7hhAAHlxVb7O71BmAPyw5GPFCXxchDKPqDri4WdDPJjrJZGjuqsJuukjIr/hMxEBZs
         fR6+um54ljkLZVRK9cUweN1JcJ/1EitmCLW0jhpN+Viw0b+VqjyoEDsrsolAJ+VsnNjE
         VH41BxbNF/eJEEYcqqHAS/TQVPWPfPDMWk2w5KvDGDQA4Jwm/VaSp8R3/AmYhK8Nmejq
         8VqA==
X-Gm-Message-State: AJIora+rPrwI8Pqxc6usuAq5kR1k7iM15xZKoS+Prjx3KGzxumd8Zi9w
	myV2pdji3WrNVXI7RsNnglKiYWYoG4mopQtwQkY=
X-Google-Smtp-Source: 
 AGRyM1tDJ8cz9Jb4wboiVPQxI7DV4Arixg/sj0tvjCv4Gyt5vkU/oTKrZS6Qwe0LHRku4HZeiw5/7TP36h42SWUHLQk=
X-Received: by 2002:a5d:644e:0:b0:21b:9439:bae5 with SMTP id
 d14-20020a5d644e000000b0021b9439bae5mr8635338wrw.507.1655998530474; Thu, 23
 Jun 2022 08:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220621201637.1378306-1-alex@linutronix.de>
 <20220621201637.1378306-3-alex@linutronix.de>
 <CA+chaQeTdCQOxTs83z3_n43JPZ-f-YJupEtkLJQ1ezHVnnkicA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQeTdCQOxTs83z3_n43JPZ-f-YJupEtkLJQ1ezHVnnkicA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Jun 2022 17:35:09 +0200
Message-ID: 
 <CA+chaQeVU_aWk8k8nzJ8sci_0Xa30nexnBoo1uQT=qs1p9O6Jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/18] mesa: update 22.0.3 -> 22.1.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000028589405e21f34f1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 15:35:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167275

--00000000000028589405e21f34f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 5:27 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> On Tue, Jun 21, 2022 at 10:16 PM Alexander Kanavin <alex.kanavin@gmail.co=
m>
> wrote:
>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>  ...wkmsDRI2Extension-instead-of-driDRI2.patch | 113 ++++++++++++++++++
>>  .../{mesa-gl_22.0.3.bb =3D> mesa-gl_22.1.2.bb}  |   0
>>  meta/recipes-graphics/mesa/mesa.inc           |   3 +-
>>  .../mesa/{mesa_22.0.3.bb =3D> mesa_22.1.2.bb}   |   0
>>  4 files changed, 115 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDRI2Extension-=
instead-of-driDRI2.patch
>>  rename meta/recipes-graphics/mesa/{mesa-gl_22.0.3.bb =3D>
>> mesa-gl_22.1.2.bb} (100%)
>>  rename meta/recipes-graphics/mesa/{mesa_22.0.3.bb =3D> mesa_22.1.2.bb}
>> (100%)
>>
>
> FYI: in case more host systems are affected
>
> While building this, I've noticed
> WARNING: Failed to fetch URL
> https://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz, attempting
> MIRRORS if available
>
> log.do_fetch shows why:
>
> Resolving mesa.freedesktop.org... 147.75.198.156
> Connecting to mesa.freedesktop.org|147.75.198.156|:443... connected.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location: https://archive.mesa3d.org//mesa-22.1.2.tar.xz [following]
> --2022-06-23 12:29:58--  https://archive.mesa3d.org//mesa-22.1.2.tar.xz
> Resolving archive.mesa3d.org... 131.252.210.176,
> 2610:10:20:722:a800:ff:feda:470f
> Connecting to archive.mesa3d.org|131.252.210.176|:443... connected.
> ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 is not tru=
sted.
> ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 doesn't ha=
ve a known
> issuer.
>
> In browser it's considered valid certificate with issuer:
> Common Name (CN) R3
> Organization (O) Let's Encrypt
> Organizational Unit (OU) <Not Part Of Certificate>
>
> Do we need ca-certificates update? But I guess it's host issue (this was
> on gentoo with ca-certificates 20211016.3.79), on ubuntu 22.10 and debian
> 11.3 it works fine:
>
> Initiating SSL handshake.
> Handshake successful; connected socket 4 to SSL handle 0x000056094b80f8c0
> certificate:
>   subject: CN=3Darchive.mesa3d.org
>   issuer:  CN=3DR3,O=3DLet's Encrypt,C=3DUS
> X509 certificate successfully verified and matches host archive.mesa3d.or=
g
>
> and in OE built image with:
> meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
> I didn't get that far yet :)
>
> root@qemux86-64:~# wget
> https://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz
> Connecting to mesa.freedesktop.org (147.75.198.156:443)
> wget: note: TLS certificate validation not implemented
> Connecting to archive.mesa3d.org (131.252.210.176:443)
> wget: TLS error from peer (alert code 80): 80
> wget: error getting response: Connection reset by peer
>
> The --debug in gentoo wasn't showing the details about certificate just:
> Resolving archive.mesa3d.org... 131.252.210.176,
> 2610:10:20:722:a800:ff:feda:470f
> Caching archive.mesa3d.org =3D> 131.252.210.176
> 2610:10:20:722:a800:ff:feda:470f
> Connecting to archive.mesa3d.org|131.252.210.176|:443... connected.
> Created socket 4.
> Releasing 0x000055e5d4567460 (new refcount 1).
> ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 is not tru=
sted.
> ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 doesn't ha=
ve a known
> issuer.
>
> Then I've disabled gnutls support in wget and now net-misc/wget-1.21.3-r1
> works fine again (like in ubuntu/debian):
>
> Resolving archive.mesa3d.org... 131.252.210.176,
> 2610:10:20:722:a800:ff:feda:470f
> Caching archive.mesa3d.org =3D> 131.252.210.176
> 2610:10:20:722:a800:ff:feda:470f
> Connecting to archive.mesa3d.org|131.252.210.176|:443... connected.
> Created socket 4.
> Releasing 0x000055903f10ebd0 (new refcount 1).
> Initiating SSL handshake.
> Handshake successful; connected socket 4 to SSL handle 0x000055903f0f4e50
> certificate:
>   subject: CN=3Darchive.mesa3d.org
>   issuer:  CN=3DR3,O=3DLet's Encrypt,C=3DUS
> X509 certificate successfully verified and matches host archive.mesa3d.or=
g
>
> I'll check how gnutls USE flag affects this, just in case someone is
> seeing a lot of downloads from mirror, check your wget.
>

Looks like it's caused by https://gitlab.com/gnutls/gnutls/-/issues/1131
and  https://gitlab.com/gnutls/gnutls/-/issues/1335

mesa.freedesktop.org works but archive.mesa3d.org doesn't, gnutls-cli
better shows why:

$ gnutls-cli mesa.freedesktop.org
Processed 136 CA certificate(s).
Resolving 'mesa.freedesktop.org:443'...
Connecting to '147.75.198.156:443'...
- Certificate type: X.509
- Got a certificate list of 3 certificates.
- Certificate[0] info:
 - subject `CN=3Dpages.freedesktop.org', issuer `CN=3DR3,O=3DLet's Encrypt,=
C=3DUS',
serial 0x03a7a60e015c33d4ea520f1703fe373b4df3, RSA key 2048 bits, signed
using RSA-SHA256, activated `2022-06-05 04:00:39 UTC', expires `2022-09-03
04:00
:38 UTC', pin-sha256=3D"NjMC418mQlGvPW2NxT5dwc97mvcIpiITkEN2o0bzAsc=3D"
        Public Key ID:
                sha1:2cec883f93f73aba2709295790ca783cdf8de008

sha256:363302e35f264251af3d6d8dc53e5dc1cf7b9af708a62213904376a346f302c7
        Public Key PIN:
                pin-sha256:NjMC418mQlGvPW2NxT5dwc97mvcIpiITkEN2o0bzAsc=3D

- Certificate[1] info:
 - subject `CN=3DR3,O=3DLet's Encrypt,C=3DUS', issuer `CN=3DISRG Root X1,O=
=3DInternet
Security Research Group,C=3DUS', serial 0x00912b084acf0c18a753f6d62e25a75f5=
a,
RSA key 2048 bits, signed using RSA-SHA256, activated `2020-09-04 00:00:00
UT
C', expires `2025-09-15 16:00:00 UTC',
pin-sha256=3D"jQJTbIh0grw0/1TkHSumWb+Fs0Ggogr621gT3PvPKG0=3D"
- Certificate[2] info:
 - subject `CN=3DISRG Root X1,O=3DInternet Security Research Group,C=3DUS',
issuer `CN=3DDST Root CA X3,O=3DDigital Signature Trust Co.', serial
0x4001772137d4e942b8ee76aa3c640ab7, RSA key 4096 bits, signed using
RSA-SHA256, activated `202
1-01-20 19:14:03 UTC', expires `2024-09-30 18:14:03 UTC',
pin-sha256=3D"C5+lpZ7tcVwmwQIMcRtPbsQtWLABXhQzejna0wHFr8M=3D"
- Status: The certificate is trusted.
- Description:
(TLS1.3-X.509)-(ECDHE-SECP256R1)-(RSA-PSS-RSAE-SHA256)-(AES-256-GCM)
- Session ID:
2D:A2:CA:0F:A3:0F:F3:D3:BE:B8:79:10:53:28:A0:78:C3:F8:C6:C8:5A:A8:13:00:DF:=
E2:85:AF:61:26:49:36
- Options:
- Handshake was completed


$ gnutls-cli archive.mesa3d.org
Processed 136 CA certificate(s).
Resolving 'archive.mesa3d.org:443'...
Connecting to '131.252.210.176:443'...
- Certificate type: X.509
- Got a certificate list of 4 certificates.
- Certificate[0] info:
 - subject `CN=3Darchive.mesa3d.org', issuer `CN=3DR3,O=3DLet's Encrypt,C=
=3DUS',
serial 0x034b691f41ef93f5d205f6678f5e065a9975, RSA key 2048 bits, signed
using RSA-SHA256, activated `2022-05-05 00:25:27 UTC', expires `2022-08-03
00:25:26
 UTC', pin-sha256=3D"qg5rLg63UE4MvpjUZp40sqzqc4YJH3Fc3yv9EKQKkD0=3D"
        Public Key ID:
                sha1:8bbb9c1cef01c1ec2ae8c50bb720045e7a9427a2

sha256:aa0e6b2e0eb7504e0cbe98d4669e34b2acea7386091f715cdf2bfd10a40a903d
        Public Key PIN:
                pin-sha256:qg5rLg63UE4MvpjUZp40sqzqc4YJH3Fc3yv9EKQKkD0=3D

- Certificate[1] info:
 - subject `CN=3Darchive.mesa3d.org', issuer `CN=3DR3,O=3DLet's Encrypt,C=
=3DUS',
serial 0x034b691f41ef93f5d205f6678f5e065a9975, RSA key 2048 bits, signed
using RSA-SHA256, activated `2022-05-05 00:25:27 UTC', expires `2022-08-03
00:25:26
 UTC', pin-sha256=3D"qg5rLg63UE4MvpjUZp40sqzqc4YJH3Fc3yv9EKQKkD0=3D"
- Certificate[2] info:
 - subject `CN=3DR3,O=3DLet's Encrypt,C=3DUS', issuer `CN=3DISRG Root X1,O=
=3DInternet
Security Research Group,C=3DUS', serial 0x00912b084acf0c18a753f6d62e25a75f5=
a,
RSA key 2048 bits, signed using RSA-SHA256, activated `2020-09-04 00:00:00
UT
C', expires `2025-09-15 16:00:00 UTC',
pin-sha256=3D"jQJTbIh0grw0/1TkHSumWb+Fs0Ggogr621gT3PvPKG0=3D"
- Certificate[3] info:
 - subject `CN=3DISRG Root X1,O=3DInternet Security Research Group,C=3DUS',
issuer `CN=3DDST Root CA X3,O=3DDigital Signature Trust Co.', serial
0x4001772137d4e942b8ee76aa3c640ab7, RSA key 4096 bits, signed using
RSA-SHA256, activated `202
1-01-20 19:14:03 UTC', expires `2024-09-30 18:14:03 UTC',
pin-sha256=3D"C5+lpZ7tcVwmwQIMcRtPbsQtWLABXhQzejna0wHFr8M=3D"
- Status: The certificate is NOT trusted. The certificate issuer is
unknown.
*** PKI verification of server certificate failed...
*** Fatal error: Error in the certificate.

--00000000000028589405e21f34f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 23, 2022 at 5:27 PM Martin Ja=
nsa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jun 21, 2=
022 at 10:16 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sig=
ned-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0...wkmsDRI2Extension-instead-of-driDRI2.patch | 113 +++++++++++++++++=
+<br>
=C2=A0.../{<a href=3D"http://mesa-gl_22.0.3.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa-gl_22.0.3.bb</a> =3D&gt; <a href=3D"http://mesa-gl_22.1.2.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.1.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A00<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_22.0.3.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_22.0.3.bb</a> =3D&gt; <a href=3D"http://mesa_22.1.2.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_22.1.2.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A04 files changed, 115 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-swrast_kms-u=
se-swkmsDRI2Extension-instead-of-driDRI2.patch<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_22.0.3.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.0.3.bb</a> =3D&gt; <a hr=
ef=3D"http://mesa-gl_22.1.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa-g=
l_22.1.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_22.0.3.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_22.0.3.bb</a> =3D&gt; <a href=3D"=
http://mesa_22.1.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa_22.1.2.bb<=
/a>} (100%)<br></blockquote><div><br></div><div>FYI: in case more host syst=
ems are affected</div><div><br></div><div>While building this, I&#39;ve not=
iced</div><div>WARNING: Failed to fetch URL <a href=3D"https://mesa.freedes=
ktop.org/archive/mesa-22.1.2.tar.xz" target=3D"_blank">https://mesa.freedes=
ktop.org/archive/mesa-22.1.2.tar.xz</a>, attempting MIRRORS if available</d=
iv><div><br></div><div>log.do_fetch shows why:</div><div><br></div><div>Res=
olving mesa.freedesktop.org... 147.75.198.156<br>Connecting to <a href=3D"h=
ttp://mesa.freedesktop.org" target=3D"_blank">mesa.freedesktop.org</a>|147.=
75.198.156|:443... connected.<br>HTTP request sent, awaiting response... 30=
1 Moved Permanently<br>Location: <a href=3D"https://archive.mesa3d.org//mes=
a-22.1.2.tar.xz" target=3D"_blank">https://archive.mesa3d.org//mesa-22.1.2.=
tar.xz</a> [following]<br>--2022-06-23 12:29:58-- =C2=A0<a href=3D"https://=
archive.mesa3d.org//mesa-22.1.2.tar.xz" target=3D"_blank">https://archive.m=
esa3d.org//mesa-22.1.2.tar.xz</a><br>Resolving archive.mesa3d.org... 131.25=
2.210.176, 2610:10:20:722:a800:ff:feda:470f<br>Connecting to <a href=3D"htt=
p://archive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a>|131.252.21=
0.176|:443... connected.<br>ERROR: The certificate of =E2=80=98<a href=3D"h=
ttp://archive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a>=E2=80=99=
 is not trusted.<br>ERROR: The certificate of =E2=80=98<a href=3D"http://ar=
chive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a>=E2=80=99 doesn&#=
39;t have a known issuer.<br></div><div><br></div><div>In browser it&#39;s =
considered valid certificate with issuer:</div><div>Common Name (CN)	R3<br>=
Organization (O)	Let&#39;s Encrypt<br>Organizational Unit (OU)	&lt;Not Part=
 Of Certificate&gt;<br></div><div><br></div><div>Do we need ca-certificates=
 update? But I guess it&#39;s host issue (this was on gentoo with ca-certif=
icates 20211016.3.79), on ubuntu 22.10 and debian 11.3 it works fine:</div>=
<div><br></div><div>Initiating SSL handshake.<br>Handshake successful; conn=
ected socket 4 to SSL handle 0x000056094b80f8c0<br>certificate:<br>=C2=A0 s=
ubject: CN=3D<a href=3D"http://archive.mesa3d.org" target=3D"_blank">archiv=
e.mesa3d.org</a><br>=C2=A0 issuer: =C2=A0CN=3DR3,O=3DLet&#39;s Encrypt,C=3D=
US<br>X509 certificate successfully verified and matches host <a href=3D"ht=
tp://archive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a><br></div>=
<div><br></div><div>and in OE built image with:</div><div>meta/recipes-supp=
ort/ca-certificates/<a href=3D"http://ca-certificates_20211016.bb" target=
=3D"_blank">ca-certificates_20211016.bb</a></div><div>I didn&#39;t get that=
 far yet :)</div><div><br></div><div>root@qemux86-64:~# wget <a href=3D"htt=
ps://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz" target=3D"_blank">htt=
ps://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz</a><br>Connecting to <=
a href=3D"http://mesa.freedesktop.org" target=3D"_blank">mesa.freedesktop.o=
rg</a> (<a href=3D"http://147.75.198.156:443" target=3D"_blank">147.75.198.=
156:443</a>)<br>wget: note: TLS certificate validation not implemented<br>C=
onnecting to <a href=3D"http://archive.mesa3d.org" target=3D"_blank">archiv=
e.mesa3d.org</a> (<a href=3D"http://131.252.210.176:443" target=3D"_blank">=
131.252.210.176:443</a>)<br>wget: TLS error from peer (alert code 80): 80<b=
r>wget: error getting response: Connection reset by peer<br></div><div><br>=
</div><div>The --debug in gentoo wasn&#39;t showing the details about certi=
ficate just:</div><div>Resolving archive.mesa3d.org... 131.252.210.176, 261=
0:10:20:722:a800:ff:feda:470f<br>Caching <a href=3D"http://archive.mesa3d.o=
rg" target=3D"_blank">archive.mesa3d.org</a> =3D&gt; 131.252.210.176 2610:1=
0:20:722:a800:ff:feda:470f<br>Connecting to <a href=3D"http://archive.mesa3=
d.org" target=3D"_blank">archive.mesa3d.org</a>|131.252.210.176|:443... con=
nected.<br>Created socket 4.<br>Releasing 0x000055e5d4567460 (new refcount =
1).<br>ERROR: The certificate of =E2=80=98<a href=3D"http://archive.mesa3d.=
org" target=3D"_blank">archive.mesa3d.org</a>=E2=80=99 is not trusted.<br>E=
RROR: The certificate of =E2=80=98<a href=3D"http://archive.mesa3d.org" tar=
get=3D"_blank">archive.mesa3d.org</a>=E2=80=99 doesn&#39;t have a known iss=
uer.<br></div><div><br></div><div>Then I&#39;ve disabled gnutls support in =
wget and now=C2=A0net-misc/wget-1.21.3-r1 works fine again (like in ubuntu/=
debian):</div><div><br></div><div>Resolving archive.mesa3d.org... 131.252.2=
10.176, 2610:10:20:722:a800:ff:feda:470f<br>Caching <a href=3D"http://archi=
ve.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a> =3D&gt; 131.252.210=
.176 2610:10:20:722:a800:ff:feda:470f<br>Connecting to <a href=3D"http://ar=
chive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a>|131.252.210.176|=
:443... connected.<br>Created socket 4.<br>Releasing 0x000055903f10ebd0 (ne=
w refcount 1).<br>Initiating SSL handshake.<br>Handshake successful; connec=
ted socket 4 to SSL handle 0x000055903f0f4e50<br>certificate:<br>=C2=A0 sub=
ject: CN=3D<a href=3D"http://archive.mesa3d.org" target=3D"_blank">archive.=
mesa3d.org</a><br>=C2=A0 issuer: =C2=A0CN=3DR3,O=3DLet&#39;s Encrypt,C=3DUS=
<br>X509 certificate successfully verified and matches host <a href=3D"http=
://archive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a><br></div><d=
iv><br></div><div>I&#39;ll check how gnutls USE flag affects this, just in =
case someone is seeing a lot of downloads from mirror, check your wget.</di=
v></div></div></blockquote><div><br></div><div>Looks like it&#39;s caused b=
y=C2=A0<a href=3D"https://gitlab.com/gnutls/gnutls/-/issues/1131">https://g=
itlab.com/gnutls/gnutls/-/issues/1131</a> and=C2=A0=C2=A0<a href=3D"https:/=
/gitlab.com/gnutls/gnutls/-/issues/1335">https://gitlab.com/gnutls/gnutls/-=
/issues/1335</a></div><div><br></div><div><a href=3D"http://mesa.freedeskto=
p.org">mesa.freedesktop.org</a> works but=C2=A0<a href=3D"http://archive.me=
sa3d.org">archive.mesa3d.org</a> doesn&#39;t, gnutls-cli better shows why:<=
br></div><div><br></div><div>$ gnutls-cli <a href=3D"http://mesa.freedeskto=
p.org">mesa.freedesktop.org</a><br>Processed 136 CA certificate(s).<br>Reso=
lving &#39;mesa.freedesktop.org:443&#39;...<br>Connecting to &#39;147.75.19=
8.156:443&#39;...<br>- Certificate type: X.509<br>- Got a certificate list =
of 3 certificates.<br>- Certificate[0] info:<br>=C2=A0- subject `CN=3D<a hr=
ef=3D"http://pages.freedesktop.org">pages.freedesktop.org</a>&#39;, issuer =
`CN=3DR3,O=3DLet&#39;s Encrypt,C=3DUS&#39;, serial 0x03a7a60e015c33d4ea520f=
1703fe373b4df3, RSA key 2048 bits, signed using RSA-SHA256, activated `2022=
-06-05 04:00:39 UTC&#39;, expires `2022-09-03 04:00<br>:38 UTC&#39;, pin-sh=
a256=3D&quot;NjMC418mQlGvPW2NxT5dwc97mvcIpiITkEN2o0bzAsc=3D&quot;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Public Key ID:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sha1:2cec883f93f73aba2709295790ca783cdf8de008<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sha256:363302e35f26425=
1af3d6d8dc53e5dc1cf7b9af708a62213904376a346f302c7<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Public Key PIN:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pin-sha256:NjMC418mQlGvPW2NxT5dwc97mvcIpiITkEN2o0bzAsc=3D<br><br>- C=
ertificate[1] info:<br>=C2=A0- subject `CN=3DR3,O=3DLet&#39;s Encrypt,C=3DU=
S&#39;, issuer `CN=3DISRG Root X1,O=3DInternet Security Research Group,C=3D=
US&#39;, serial 0x00912b084acf0c18a753f6d62e25a75f5a, RSA key 2048 bits, si=
gned using RSA-SHA256, activated `2020-09-04 00:00:00 UT<br>C&#39;, expires=
 `2025-09-15 16:00:00 UTC&#39;, pin-sha256=3D&quot;jQJTbIh0grw0/1TkHSumWb+F=
s0Ggogr621gT3PvPKG0=3D&quot;<br>- Certificate[2] info:<br>=C2=A0- subject `=
CN=3DISRG Root X1,O=3DInternet Security Research Group,C=3DUS&#39;, issuer =
`CN=3DDST Root CA X3,O=3DDigital Signature Trust Co.&#39;, serial 0x4001772=
137d4e942b8ee76aa3c640ab7, RSA key 4096 bits, signed using RSA-SHA256, acti=
vated `202<br>1-01-20 19:14:03 UTC&#39;, expires `2024-09-30 18:14:03 UTC&#=
39;, pin-sha256=3D&quot;C5+lpZ7tcVwmwQIMcRtPbsQtWLABXhQzejna0wHFr8M=3D&quot=
;<br>- Status: The certificate is trusted. <br>- Description: (TLS1.3-X.509=
)-(ECDHE-SECP256R1)-(RSA-PSS-RSAE-SHA256)-(AES-256-GCM)<br>- Session ID: 2D=
:A2:CA:0F:A3:0F:F3:D3:BE:B8:79:10:53:28:A0:78:C3:F8:C6:C8:5A:A8:13:00:DF:E2=
:85:AF:61:26:49:36<br>- Options:<br>- Handshake was completed<br></div><div=
><br></div><div><br></div><div>$ gnutls-cli <a href=3D"http://archive.mesa3=
d.org">archive.mesa3d.org</a><br>Processed 136 CA certificate(s).<br>Resolv=
ing &#39;archive.mesa3d.org:443&#39;...<br>Connecting to &#39;131.252.210.1=
76:443&#39;...<br>- Certificate type: X.509<br>- Got a certificate list of =
4 certificates.<br>- Certificate[0] info:<br>=C2=A0- subject `CN=3D<a href=
=3D"http://archive.mesa3d.org">archive.mesa3d.org</a>&#39;, issuer `CN=3DR3=
,O=3DLet&#39;s Encrypt,C=3DUS&#39;, serial 0x034b691f41ef93f5d205f6678f5e06=
5a9975, RSA key 2048 bits, signed using RSA-SHA256, activated `2022-05-05 0=
0:25:27 UTC&#39;, expires `2022-08-03 00:25:26<br>=C2=A0UTC&#39;, pin-sha25=
6=3D&quot;qg5rLg63UE4MvpjUZp40sqzqc4YJH3Fc3yv9EKQKkD0=3D&quot;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Public Key ID:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sha1:8bbb9c1cef01c1ec2ae8c50bb720045e7a9427a2<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sha256:aa0e6b2e0eb7504=
e0cbe98d4669e34b2acea7386091f715cdf2bfd10a40a903d<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Public Key PIN:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pin-sha256:qg5rLg63UE4MvpjUZp40sqzqc4YJH3Fc3yv9EKQKkD0=3D<br><br>- C=
ertificate[1] info:<br>=C2=A0- subject `CN=3D<a href=3D"http://archive.mesa=
3d.org">archive.mesa3d.org</a>&#39;, issuer `CN=3DR3,O=3DLet&#39;s Encrypt,=
C=3DUS&#39;, serial 0x034b691f41ef93f5d205f6678f5e065a9975, RSA key 2048 bi=
ts, signed using RSA-SHA256, activated `2022-05-05 00:25:27 UTC&#39;, expir=
es `2022-08-03 00:25:26<br>=C2=A0UTC&#39;, pin-sha256=3D&quot;qg5rLg63UE4Mv=
pjUZp40sqzqc4YJH3Fc3yv9EKQKkD0=3D&quot;<br>- Certificate[2] info:<br>=C2=A0=
- subject `CN=3DR3,O=3DLet&#39;s Encrypt,C=3DUS&#39;, issuer `CN=3DISRG Roo=
t X1,O=3DInternet Security Research Group,C=3DUS&#39;, serial 0x00912b084ac=
f0c18a753f6d62e25a75f5a, RSA key 2048 bits, signed using RSA-SHA256, activa=
ted `2020-09-04 00:00:00 UT<br>C&#39;, expires `2025-09-15 16:00:00 UTC&#39=
;, pin-sha256=3D&quot;jQJTbIh0grw0/1TkHSumWb+Fs0Ggogr621gT3PvPKG0=3D&quot;<=
br>- Certificate[3] info:<br>=C2=A0- subject `CN=3DISRG Root X1,O=3DInterne=
t Security Research Group,C=3DUS&#39;, issuer `CN=3DDST Root CA X3,O=3DDigi=
tal Signature Trust Co.&#39;, serial 0x4001772137d4e942b8ee76aa3c640ab7, RS=
A key 4096 bits, signed using RSA-SHA256, activated `202<br>1-01-20 19:14:0=
3 UTC&#39;, expires `2024-09-30 18:14:03 UTC&#39;, pin-sha256=3D&quot;C5+lp=
Z7tcVwmwQIMcRtPbsQtWLABXhQzejna0wHFr8M=3D&quot;<br>- Status: The certificat=
e is NOT trusted. The certificate issuer is unknown. <br>*** PKI verificati=
on of server certificate failed...<br>*** Fatal error: Error in the certifi=
cate.<br></div></div></div>

--00000000000028589405e21f34f1--


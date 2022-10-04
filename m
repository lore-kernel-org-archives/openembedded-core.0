Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D3FC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 22:52:30 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.17442.1664923948771771029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 15:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i6wR7Dww;
 spf=pass (domain: gmail.com, ip: 209.85.167.178,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id w70so1739066oie.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 15:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:in-reply-to:to:references:date:subject:mime-version:from
         :from:to:cc:subject:date;
        bh=yY6NNuQRjpDWrEpZ7oPz1rg0jtFyf/rrW73tqrjOj38=;
        b=i6wR7DwwmBNdDkQcdyK0gLyIYizmzaihIapinouQe0Z2zkj7cB4EHoGpzopJJA7qqH
         f1zMP+iQQJ4FerDpow+i+fb7JrN5KfndOgVlo54XrbRimc0n3eN4LRTm/FbjIDafRFTS
         yI5ichU/9CbxwUReKDXy7tPdV0FDA3cQI8WoHe/TeHaI8xxmNgoXdoSIqNz2Tz7EHm3s
         04KKk3ckZaRLk7tLoYCOrqZAlu/jcknNL4EsZ99BPDVuhLC+pozkD9xcGDo7j72qXvqG
         gYuiB+fj0h36ykDVUVJnWchOOv+p19TUok+qSj9sU/FXBKa7on5tEFMyqap/PW0QWTpb
         Mh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:in-reply-to:to:references:date:subject:mime-version:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yY6NNuQRjpDWrEpZ7oPz1rg0jtFyf/rrW73tqrjOj38=;
        b=2Xbxd2eX01jVN5gX/NmWEEt3DRFVDiZw6SQ+qkoD1NollVPOsU671taxOpe2l/DCEw
         AFVjrqUXSz5pQA0235Sd4u8EK8m6gj3omHLBG4+sxvlpZF4qyizLKapYGgemPyDV18VO
         F6g+FDkx6fjo/VaZp3nsFACI8FFY+WEBlPgNmECL0/J973XBswXacytogJpVEEZkFSMc
         k/SzUMNOHkxcBDqfwP5X6xBCyZxQxzOcmXAhPx79E6ojOF3/06k/F+UYcIVcEchYnU7K
         cxKVMrIv3WYZl3yFpf3lIDG9ST62hZ4dg4qJztvFWzcan3pv6Ql1vecZ8LPdqX+AnCb+
         USzA==
X-Gm-Message-State: ACrzQf02BMiCbbowZ1/nm/PEzt9StsH4Jkp+oNcfLBIRbvy1PV/j6nPT
	WNEUvtrvsDBS8w/rU+LGxUn7Q77f+ds=
X-Google-Smtp-Source: 
 AMsMyM6NOrK6Pzg6cU6XXSNW3bBMT4k6sjgxHwdezZvvTyvxanDGD/+t2JnjL105A9oIWSnoyyxptw==
X-Received: by 2002:a05:6808:d54:b0:350:9cc4:ad35 with SMTP id
 w20-20020a0568080d5400b003509cc4ad35mr866556oik.177.1664923947867;
        Tue, 04 Oct 2022 15:52:27 -0700 (PDT)
Received: from smtpclient.apple ([187.105.4.40])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a05683010ca00b0065742df07e2sm3358085oto.26.2022.10.04.15.52.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Oct 2022 15:52:27 -0700 (PDT)
From: Devendra Tewari <devendra.tewari@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4D2AF6D2-8C0D-44B5-A79A-EE1C316894AB"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.92\))
Subject: Re: [PATCH] libcamera: Bump SRCREV and add libyaml to DEPENDS
Date: Tue, 4 Oct 2022 19:52:13 -0300
References: <20221004224630.29185-1-devendra.tewari@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <20221004224630.29185-1-devendra.tewari@gmail.com>
Message-Id: <1D1F4027-9022-437F-B2F3-F7024710A944@gmail.com>
X-Mailer: Apple Mail (2.3731.200.92)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 22:52:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171436


--Apple-Mail=_4D2AF6D2-8C0D-44B5-A79A-EE1C316894AB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Please ignore it here. I=E2=80=99ve submitted it to =
openembedded-devel@lists.openembedded.org =
<mailto:openembedded-devel@lists.openembedded.org>.

> On 4 Oct 2022, at 19:46, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
>=20
> Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
> ---
> meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb =
b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> index 0b9f3f7a5d6..2d3f5e94937 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> @@ -12,13 +12,13 @@ SRC_URI =3D " \
>         =
git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps;branch=3D=
master \
> "
>=20
> -SRCREV =3D "acf8d028edda0a59b10e15962c2606137a4940af"
> +SRCREV =3D "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
>=20
> PV =3D "202105+git${SRCPV}"
>=20
> S =3D "${WORKDIR}/git"
>=20
> -DEPENDS =3D "python3-pyyaml-native python3-jinja2-native =
python3-ply-native python3-jinja2-native udev gnutls boost =
chrpath-native libevent"
> +DEPENDS =3D "python3-pyyaml-native python3-jinja2-native =
python3-ply-native python3-jinja2-native udev gnutls boost =
chrpath-native libevent libyaml"
> DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase =
qtbase-native', '', d)}"
>=20
> PACKAGES =3D+ "${PN}-gst"
> --=20
> 2.37.3
>=20


--Apple-Mail=_4D2AF6D2-8C0D-44B5-A79A-EE1C316894AB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Please ignore =
it here. I=E2=80=99ve submitted it to <a =
href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-dev=
el@lists.openembedded.org</a>.<br><div><br><blockquote =
type=3D"cite"><div>On 4 Oct 2022, at 19:46, Devendra Tewari =
&lt;devendra.tewari@gmail.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>Signed-off-by: Devendra =
Tewari &lt;devendra.tewari@gmail.com&gt;<br>---<br> =
meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--<br> 1 =
file changed, 2 insertions(+), 2 deletions(-)<br><br>diff --git =
a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb =
b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb<br>index =
0b9f3f7a5d6..2d3f5e94937 100644<br>--- =
a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb<br>+++ =
b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb<br>@@ -12,13 =
+12,13 @@ SRC_URI =3D " \<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;git://git.libcamera.org/li=
bcamera/libcamera.git;protocol=3Dhttps;branch=3Dmaster \<br> =
"<br><br>-SRCREV =3D =
"acf8d028edda0a59b10e15962c2606137a4940af"<br>+SRCREV =3D =
"ed591e705c451d0ce14988ae96829a31a2ae2f9a"<br><br> PV =3D =
"202105+git${SRCPV}"<br><br> S =3D "${WORKDIR}/git"<br><br>-DEPENDS =3D =
"python3-pyyaml-native python3-jinja2-native python3-ply-native =
python3-jinja2-native udev gnutls boost chrpath-native =
libevent"<br>+DEPENDS =3D "python3-pyyaml-native python3-jinja2-native =
python3-ply-native python3-jinja2-native udev gnutls boost =
chrpath-native libevent libyaml"<br> DEPENDS +=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', =
'', d)}"<br><br> PACKAGES =3D+ "${PN}-gst"<br>-- =
<br>2.37.3<br><br></div></div></blockquote></div><br></body></html>=

--Apple-Mail=_4D2AF6D2-8C0D-44B5-A79A-EE1C316894AB--


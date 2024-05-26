Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5CAC25B75
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 16:27:47 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.9835.1716740861540701002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 09:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=aoZ/RMDY;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 3D6091EA4
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 18:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1716740860;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	l=7984; bh=WB10dO2tQfWUTj3L/bojBu5aIzLBVhsOneMhVqi5chQ=;
	b=aoZ/RMDYDGAm7qPUTT2/xZQ8gRIXcTBIrYi0/pUpeghiqs+7vwyNg1cX9yFMyE5E
	lC6sQoo5XZ8TMVpKsbuw1yTnttZgmYH1Q8Zf8/cHw37EsDzPGCTLlBRRsUcR1/WwA4+
	xASO2ndlG61MRG5aRl45+5FlQUoh9H+4dgS1SkXM5YTW2fT8FygzzDEgZHYEUCfMrze
	oHVbSAMz2Pvwb2OhZQIl4bdstBIEi46ySDoencvG0FnEajZUglUiXRfRBtK4dfCRKTh
	zCtvMb68N7xa9C8YXTOMoyEKcaN3xqbX4eBgDc+za2igolEiywMxkL01P7zdrvs6dqw
	+k+dXNxypA==
Received: by smtp.mailfence.com with ESMTPSA
          for <openembedded-core@lists.openembedded.org> ; Sun, 26 May 2024 18:27:37 +0200 (CEST)
Message-ID: <bcc3be88f4301bede40b0f656dfedf930f37a5ad.camel@redrectangle.org>
Subject: Re: [OE-core] [PATCH] curl: Update to 8.8.0
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2024 09:27:31 -0700
In-Reply-To: <17D31517C8C8D80B.11721@lists.openembedded.org>
References: <17D31517C8C8D80B.11721@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 16:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199885

On Sun, 2024-05-26 at 08:57 -0700, Robert Joslyn via
lists.openembedded.org wrote:
> From: Robert Joslyn <robert.joslyn@redrectangle.org>
>=20
> Remove backported patch that is upsteam in this version. Disable test
> 1481 since it requires --libcurl option that is disabled by default.
>=20
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
> =C2=A0...41aadf4adf4f6aeb3f4c0ab489bb89610c36.patch | 64 ----------------=
-
> --
> =C2=A0meta/recipes-support/curl/curl/disable-tests=C2=A0 |=C2=A0 1 +
> =C2=A0.../curl/{curl_8.7.1.bb =3D> curl_8.8.0.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 +-
> =C2=A03 files changed, 2 insertions(+), 67 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-
> support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch
> =C2=A0rename meta/recipes-support/curl/{curl_8.7.1.bb =3D> curl_8.8.0.bb}
> (97%)
>=20
> diff --git a/meta/recipes-
> support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch
> b/meta/recipes-
> support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch
> deleted file mode 100644
> index 98f7db93e8..0000000000
> --- a/meta/recipes-
> support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 721941aadf4adf4f6aeb3f4c0ab489bb89610c36 Mon Sep 17 00:00:00
> 2001
> -From: Stefan Eissing <stefan@eissing.org>
> -Date: Mon, 1 Apr 2024 15:41:18 +0200
> -Subject: [PATCH] http: with chunked POST forced, disable length
> check on read
> - callback
> -
> -- when an application forces HTTP/1.1 chunked transfer encoding
> -=C2=A0 by setting the corresponding header and instructs curl to use
> -=C2=A0 the CURLOPT_READFUNCTION, disregard any POST length information.
> -- this establishes backward compatibility with previous curl
> versions
> -
> -Applications are encouraged to not force "chunked", but rather
> -set length information for a POST. By setting -1, curl will
> -auto-select chunked on HTTP/1.1 and work properly on other HTTP
> -versions.
> -
> -Reported-by: Jeff King
> -Fixes #13229
> -Closes #13257
> -Upstream-Status: Backport
> ----
> - lib/http.c | 22 ++++++++++++++++++++--
> - 1 file changed, 20 insertions(+), 2 deletions(-)
> -
> -diff --git a/lib/http.c b/lib/http.c
> -index 92c04e69cd8373..a764d3c4403c39 100644
> ---- a/lib/http.c
> -+++ b/lib/http.c
> -@@ -2046,8 +2046,19 @@ static CURLcode set_reader(struct Curl_easy
> *data, Curl_HttpReq httpreq)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D Curl_creader=
_set_null(data);
> -=C2=A0=C2=A0=C2=A0=C2=A0 }
> --=C2=A0=C2=A0=C2=A0 else { /* we read the bytes from the callback */
> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D Curl_creader_set_fread(data, =
postsize);
> -+=C2=A0=C2=A0=C2=A0 else {
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* we read the bytes from the callback. =
In case "chunked"
> encoding
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is forced by the application, we=
 disregard `postsize`.
> This is
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * a backward compatibility decisio=
n to earlier versions
> where
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * chunking disregarded this. See i=
ssue #13229. */
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool chunked =3D FALSE;
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *ptr =3D Curl_checkheaders(data, ST=
RCONST("Transfer-
> Encoding"));
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if(ptr) {
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Some kind of TE is reques=
ted, check if 'chunked' is
> chosen */
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chunked =3D Curl_comparehead=
er(ptr, STRCONST("Transfer-
> Encoding:"),
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
RCONST("chunked"));
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D Curl_creader_set_fread(data, =
chunked? -1 :
> postsize);
> -=C2=A0=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0=C2=A0 return result;
> -=20
> -@@ -2115,6 +2126,13 @@ CURLcode Curl_http_req_set_reader(struct
> Curl_easy *data,
> -=C2=A0=C2=A0=C2=A0=C2=A0 data->req.upload_chunky =3D
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Curl_compareheader(ptr,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 STRCONST("Transfer-Encoding:"),
> STRCONST("chunked"));
> -+=C2=A0=C2=A0=C2=A0 if(data->req.upload_chunky &&
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Curl_use_http_1_1plus(data, data->=
conn) &&
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (data->conn->httpversion >=3D 20))=
 {
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 infof(data, "suppressing chunked t=
ransfer encoding on
> connection "
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "using HTTP version 2 or higher");
> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->req.upload_chunky =3D FALSE;
> -+=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0 }
> -=C2=A0=C2=A0 else {
> -=C2=A0=C2=A0=C2=A0=C2=A0 curl_off_t req_clen =3D Curl_creader_total_leng=
th(data);
> diff --git a/meta/recipes-support/curl/curl/disable-tests
> b/meta/recipes-support/curl/curl/disable-tests
> index 259576fd01..c4aa7783a1 100644
> --- a/meta/recipes-support/curl/curl/disable-tests
> +++ b/meta/recipes-support/curl/curl/disable-tests
> @@ -39,3 +39,4 @@
> =C2=A01404
> =C2=A01405
> =C2=A01465
> +1481
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-
> support/curl/curl_8.8.0.bb
> similarity index 97%
> rename from meta/recipes-support/curl/curl_8.7.1.bb
> rename to meta/recipes-support/curl/curl_8.8.0.bb
> index 23b7c50a86..b932594159 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.8.0.bb
> @@ -11,12 +11,11 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Deed2e5088e1ac619c9a1c747da291d75"
> =C2=A0
> =C2=A0SRC_URI =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 https://curl.se/download/${BP}.tar.xz=C2=A0\
> -=C2=A0=C2=A0=C2=A0 file://721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch=
=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0 file://run-ptest=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0 file://disable-tests=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0 file://no-test-timeout.patch=C2=A0\
> =C2=A0"
> -SRC_URI[sha256sum] =3D
> "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
> +SRC_URI[sha256sum] =3D
> "0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd1cd08791d12551d4400"
> =C2=A0
> =C2=A0# Curl has used many names over the years...
> =C2=A0CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl
> libcurl:libcurl daniel_stenberg:curl"
> @@ -73,7 +72,6 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-
> zstd,zstd"
> =C2=A0
> =C2=A0EXTRA_OECONF =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 --disable-libcurl-option \
> -=C2=A0=C2=A0=C2=A0 --disable-ntlm-wb \
> =C2=A0=C2=A0=C2=A0=C2=A0 --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-ce=
rtificates.crt \
> =C2=A0=C2=A0=C2=A0=C2=A0 --without-libpsl \
> =C2=A0=C2=A0=C2=A0=C2=A0 --enable-optimize \
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199883):
> https://lists.openembedded.org/g/openembedded-core/message/199883
> Mute This Topic: https://lists.openembedded.org/mt/106315879/1348415
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> robert.joslyn@redrectangle.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

I forgot to mention in my commit message why --disable-ntlm-wb was
removed. Upstream dropped support for it and removed the option. Sent a
v2.

Thanks,
Robert


Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C46106F2E3
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:50:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43032.1774511407250209205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 00:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2dDamz0K;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb439299so5797845e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 00:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774511406; x=1775116206; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlOx45cd77UBVBj+ARoPBaK5KizairlJFXO1w2CFcLE=;
        b=2dDamz0KLuBFQ3NqkQN9M25MkfUFJ5MfGhNAsA8ALte6yGex/7BXUA+9uj9jeyM3X3
         PUxyven677O0GGDAMPTrGU//Dv0W0DcvfIFW0QpAbXBjFhKPLw3oTcvXhYIDi3nZAQ++
         XzxTBB15eAJvl9i4TnsximJGyLJ0BpeXGWZa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511406; x=1775116206;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LlOx45cd77UBVBj+ARoPBaK5KizairlJFXO1w2CFcLE=;
        b=gVUcE5+YV+NexFM845fdnxFzAuQ0WQfbBJb3KkprgoSdeRxQLPPa6WfPVKaGcsNjlS
         4cdm7XMB8C5poc5WNEVaalQps7IOrpOW66h73epOdbrr7/NempZo5v3LT73Kg64Ct99t
         eWfdsvGBmG2mi6T7ixHwX4/qwuh03T0UUlyIiBQ+Qxz2dAjKSovKah81sLUP65cbP0DK
         9N3DsIMu8vOC1QUXqFbztX4GRejkcukAlmtzuzlntz0R9o8ACvofMO1RHVqgeGV2rUMt
         KkNOEd7qXPDRpgnvyWPha7rZFk+Ch8W7d7dFibNZnhLFFuk0oVk5znXhJbihv0D1WLnA
         AG3g==
X-Forwarded-Encrypted: i=1; AJvYcCXzzKb+k4gfa8OwoH5vOI5tVYvP0F456l9S5mPcjQV4xltAsEJqJHAI3hLOW7cvsid/rn7cPtAuL8VCaXu3A3P8Cw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBsx7qNPQeN96gWysk8lXJaQBO47ih9SbFRBsHhjNag1OD2l06
	Pd9AmoSF6pdlI9+VJ8XfSLoj+6q17NMJg35lmIhF3E9MkDqOb1HRQA5KhwsxiSG+oWM=
X-Gm-Gg: ATEYQzzE+TEwqax+4f9FvkPCZLqNmIsAVI4jqANd4vdBejzyHgE85zjt08tOPAAnWP5
	aLW0BtnusTClYwenA1oM7HMHVZgJxKiXTBDeuilwvNHzCh7eILRAwRG+TemhjyRyJrcsEfPt4Vv
	CiHloFK6SQyKIGCyJd9wsrZIyYkrH/KivEhE6Dh2Q/gAYHgisrXvWnqMXPVVLGKzEjCKkCnT8GJ
	fjdc+48esiu4E6rpwdfjinMySmraHEZKIY7sdqtKfk4hChFL7cpU9/0ckq+9zo4+db6QUFLKpZg
	Lf0jx31sIHDvfwSBNbHNVVsuGaT61s9VKBGyhoLtnrLY6gDqZPXISwXXMKYe8zu8QlzAfic07Hf
	egEMcxtKK+4Bo9OkuWq3AQ1/I6vhDVZd/unU+sr1Xsx+K0GiuZhJJJbPPdGV1VvBusUuH9EIn02
	O+bNr/Wh2VNWy8LWXPU6tYsaWcH/3qwk6uPL6lwsrhut/GxwxSBMpLU2oBLS2hL+n82AtB/e+A1
	2ugEWqjiihoAg==
X-Received: by 2002:a05:600c:8707:b0:486:f8d6:5dea with SMTP id 5b1f17b1804b1-48716046e04mr104226165e9.19.1774511405472;
        Thu, 26 Mar 2026 00:50:05 -0700 (PDT)
Received: from localhost (2a02-8440-2604-524d-4245-6912-4f2b-5145.rev.sfr.net. [2a02:8440:2604:524d:4245:6912:4f2b:5145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d38a5fsm12364255e9.12.2026.03.26.00.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 00:50:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 08:50:04 +0100
Message-Id: <DHCJSL7RSNAM.1749P0YEYG30D@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2][PATCH] curl: fix CVE-2026-3783
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260326044809.2004530-4-sudumbha@cisco.com>
In-Reply-To: <20260326044809.2004530-4-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233953

On Thu Mar 26, 2026 at 5:48 AM CET, Sudhir Dumbhare -X (sudumbha - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1] as referenced in [2]
> which is mentioned in [3]:
>
> [1] https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877e613e62e=
d35bddc
> [2] https://curl.se/docs/CVE-2026-3783.html
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-3783
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---

Hello,

Sending a patch with "[PATCH 1/2]" means this is a first patch of a
series of 2. I can't find the 2/2. Is it missing or the numbering of
your 3 recent curl patches was somehow buggy?

Regards,

>  .../curl/curl/CVE-2026-3783.patch             | 159 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 160 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-3783.patch
> new file mode 100644
> index 0000000000..02c2d51eb6
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
> @@ -0,0 +1,159 @@
> +From 11c36846187d96ef72abc6aeb5784c002cb212fe Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 6 Mar 2026 23:13:07 +0100
> +Subject: [PATCH] http: only send bearer if auth is allowed
> +
> +Verify with test 2006
> +
> +Closes #20843
> +
> +CVE: CVE-2026-3783
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/e3d7401a3=
2a46516c9e5ee877e613e62ed35bddc]
> +
> +Backport Changes:
> +- in tests/data/Makefile.inc: added test2006 to TESTCASES, adjusted for
> +  this version.
> +  The TESTCASES in tests/data/Makefile.am was introduced curl-8_10_0 by
> +  this commit;
> +  https://github.com/curl/curl/commit/f5b826532f2c564ef240df0ba2f3287d52=
1df711
> +
> +(cherry picked from commit e3d7401a32a46516c9e5ee877e613e62ed35bddc)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + lib/http.c              |  1 +
> + tests/data/Makefile.inc |  2 +-
> + tests/data/test2006     | 98 +++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 100 insertions(+), 1 deletion(-)
> + create mode 100644 tests/data/test2006
> +
> +diff --git a/lib/http.c b/lib/http.c
> +index a764d3c440..3ab6d21b0f 100644
> +--- a/lib/http.c
> ++++ b/lib/http.c
> +@@ -673,6 +673,7 @@ output_auth_headers(struct Curl_easy *data,
> +   if(authstatus->picked =3D=3D CURLAUTH_BEARER) {
> +     /* Bearer */
> +     if((!proxy && data->set.str[STRING_BEARER] &&
> ++       Curl_auth_allowed_to_host(data) &&
> +         !Curl_checkheaders(data, STRCONST("Authorization")))) {
> +       auth =3D "Bearer";
> +       result =3D http_output_bearer(data);
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index 4c2cd52999..9fb92742ee 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -230,7 +230,7 @@ test1941 test1942 test1943 test1944 test1945 test194=
6 test1947 test1948 \
> + test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
> + test1970 test1971 test1972 test1973 test1974 test1975 \
> + \
> +-test2000 test2001 test2002 test2003 test2004 test2005 \
> ++test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
> + \
> +                                                                test2023=
 \
> + test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031=
 \
> +diff --git a/tests/data/test2006 b/tests/data/test2006
> +new file mode 100644
> +index 0000000000..200d30a7ce
> +--- /dev/null
> ++++ b/tests/data/test2006
> +@@ -0,0 +1,98 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++netrc
> ++HTTP
> ++</keywords>
> ++</info>
> ++# Server-side
> ++<reply>
> ++<data crlf=3D"headers">
> ++HTTP/1.1 301 Follow this you fool
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 6
> ++Connection: close
> ++Location: http://b.com/%TESTNUMBER0002
> ++
> ++-foo-
> ++</data>
> ++
> ++<data2 crlf=3D"headers">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 7
> ++Connection: close
> ++
> ++target
> ++</data2>
> ++
> ++<datacheck crlf=3D"headers">
> ++HTTP/1.1 301 Follow this you fool
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 6
> ++Connection: close
> ++Location: http://b.com/%TESTNUMBER0002
> ++
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 7
> ++Connection: close
> ++
> ++target
> ++</datacheck>
> ++</reply>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<features>
> ++proxy
> ++</features>
> ++<name>
> ++.netrc default with redirect plus oauth2-bearer
> ++</name>
> ++<command>
> ++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER --oauth2-bearer SECRET_TO=
KEN -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
> ++</command>
> ++<file name=3D"%LOGDIR/netrc%TESTNUMBER" >
> ++default login testuser password testpass
> ++</file>
> ++</client>
> ++
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET http://a.com/ HTTP/1.1
> ++Host: a.com
> ++Authorization: Bearer SECRET_TOKEN
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://b.com/%TESTNUMBER0002 HTTP/1.1
> ++Host: b.com
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +--
> +2.44.1
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index e2f6f8472f..07e532721f 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -34,6 +34,7 @@ SRC_URI =3D " \
>      file://CVE-2025-15224.patch \
>      file://CVE-2026-1965_p1.patch \
>      file://CVE-2026-1965_p2.patch \
> +    file://CVE-2026-3783.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS



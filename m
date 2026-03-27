Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE3310F287C
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 23:23:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1507.1774653781634622763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 16:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Sjn1nz0P;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-487035181a7so16507455e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774653780; x=1775258580; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kRsIqvsEACXN2BHrEIMgCqFkJfSDtCSz1a3sBHtgGE=;
        b=Sjn1nz0P8Tia8MYgCCmGaQHzFo4PkHqbkRqqsBvHUSgnp4SPPn1btzJnbYVLPbuB4c
         dHat1EPwBHbragQ4e0Hr0IcQjNaGqiEBYQg6iC8U9obp+RSbigoKvhP7U9apA3nfLLQC
         isPAZ7xgI/CvIu4StGMkKJlNfwHndlQp2W8ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653780; x=1775258580;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kRsIqvsEACXN2BHrEIMgCqFkJfSDtCSz1a3sBHtgGE=;
        b=F5vkg/aBtBSjs6oMdvoizpcNdMRY9QD+mSylEHSOHAA/JqRqSDebgPF3wJibyKp1lh
         ulkFfEdGhpF5IMzrnKmne9VOHcutmvJobd4DYu/QQeiIOjRpBUTkByL6NevEZzgfiaDw
         kfQcdV/63m8L5TKUw0Uhx7acV7E3D2rFN3qjefmpvyirLh7xIQ277Kds/pygZy5Ma52Q
         QirYxAR597aaKQi2GYl+YVvGZDFHtS8iXCUTklhGSWKt7VG3Y/8pfyY7+/co9luRarqW
         EjX7wqAWpeR5h1Fm4sakFsQrsTZ4fLUHdA+9GxaLKqWBC3qztwj67tYW3C/kYUGhjAJi
         RLeg==
X-Forwarded-Encrypted: i=1; AJvYcCUrYtZG9eifbU3WqzMB1p8GhCpjnV/BHwyU31SnOhyi/syOeBB+itPFFbg9HWJQUEuZ8CNBX2KrUxk57UHR7aIuLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfdnG6VHxNn/m+x5TE7zg8HNBdn+hiD5SpqCwEmRNsQdD2VM+5
	fKyQjMAGmiMwCsFoL7bT7DOLAk2Ul3SPxEgztZF4kZ3CmX1HgL8O7M5PqSfgD6zNrvY=
X-Gm-Gg: ATEYQzye5b+l0wwxvSmmRKOZh+FAlWojkQEpHGZpPuCGowFh+Ph01+Dvh5RMuXRKkKG
	K5rG3GvNSY2RbPxolbQRORYjAY1tXa7bB+CDK+rDKOfg8JStg4EfpI/rxPcv/05FIB4YDCjKv2L
	81nBErCXQokDqWjKCZjVDZUjWbpe62iTam0VMUORLyToFnKQv0cqcl0lPJMjP5CGkOFvHQCd7vA
	vIujrL71HH/DXcYNTk7MZjILvqDGBZMgDY5zpHLBD8MF1cRVnjZNqWKwbK+O3W711x5W5DB8NH+
	5+8m2PCmjjNJulYKfx8V+wijaMNzWQ5VVV2xZRNft1vfyh9Eb+CJuK1BFxEFWHBDF1juSR8UZfj
	rrsWhyX6TiZL0pESSsE/z38mPn6nLPGb+TTpOFyV3wKd5/j4TCgi3RiXC2MpWeO9qk9ah7NbQzv
	DTsEVn21vCnFMD7pWcU8faG9a9CKRS8ZpHQBh60LjVpJxhklklIcUtaAHun5AL/yfrLbOCNHAKs
	oDKmsltyRT+2UQ=
X-Received: by 2002:a05:600c:c178:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-48727ef0c19mr70849865e9.11.1774653779830;
        Fri, 27 Mar 2026 16:22:59 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm112333925e9.6.2026.03.27.16.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 16:22:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 00:22:59 +0100
Message-Id: <DHDY9F8XP2QC.1FPKRXZ97INT7@smile.fr>
Subject: Re: [OE-core][scarthgap][patch 1/2] python3-pyopenssl: Fix
 CVE-2026-27448
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260325072340.112787-1-vanusuri@mvista.com>
In-Reply-To: <20260325072340.112787-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 23:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234111

On Wed Mar 25, 2026 at 8:23 AM CET, Vijay Anusuri via lists.openembedded.or=
g wrote:
> Pick patch mentioned in NVD
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-27448
> [2] https://ubuntu.com/security/CVE-2026-27448
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hello,

As far as I can tell, this CVE also applies to whinlatter. You need to
send the fix there before I can take it for scarthgap and kirkstone.

That also applies to the 2/2 patch.

Regards,


>  .../python3-pyopenssl/CVE-2026-27448.patch    | 124 ++++++++++++++++++
>  .../python/python3-pyopenssl_24.0.0.bb        |   4 +
>  2 files changed, 128 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-20=
26-27448.patch
>
> diff --git a/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-2744=
8.patch b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.pat=
ch
> new file mode 100644
> index 0000000000..87f46b4cb0
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
> @@ -0,0 +1,124 @@
> +From d41a814759a9fb49584ca8ab3f7295de49a85aa0 Mon Sep 17 00:00:00 2001
> +From: Alex Gaynor <alex.gaynor@gmail.com>
> +Date: Mon, 16 Feb 2026 21:04:37 -0500
> +Subject: [PATCH] Handle exceptions in set_tlsext_servername_callback cal=
lbacks
> + (#1478)
> +
> +When the servername callback raises an exception, call sys.excepthook
> +with the exception info and return SSL_TLSEXT_ERR_ALERT_FATAL to abort
> +the handshake. Previously, exceptions would propagate uncaught through
> +the CFFI callback boundary.
> +
> +https://claude.ai/code/session_01P7y1XmWkdtC5UcmZwGDvGi
> +
> +Co-authored-by: Claude <noreply@anthropic.com>
> +
> +Upstream-Status: Backport [https://github.com/pyca/pyopenssl/commit/d41a=
814759a9fb49584ca8ab3f7295de49a85aa0]
> +CVE: CVE-2026-27448
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + CHANGELOG.rst      |  1 +
> + src/OpenSSL/SSL.py |  7 ++++++-
> + tests/test_ssl.py  | 50 ++++++++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 57 insertions(+), 1 deletion(-)
> +
> +diff --git a/CHANGELOG.rst b/CHANGELOG.rst
> +index 6e23770..12e60e4 100644
> +--- a/CHANGELOG.rst
> ++++ b/CHANGELOG.rst
> +@@ -18,6 +18,7 @@ Changes:
> +=20
> + - Added ``OpenSSL.SSL.Connection.get_selected_srtp_profile`` to determi=
ne which SRTP profile was negotiated.
> +   `#1279 <https://github.com/pyca/pyopenssl/pull/1279>`_.
> ++- ``Context.set_tlsext_servername_callback`` now handles exceptions rai=
sed in the callback by calling ``sys.excepthook`` and returning a fatal TLS=
 alert. Previously, exceptions were silently swallowed and the handshake wo=
uld proceed as if the callback had succeeded.
> +=20
> + 23.3.0 (2023-10-25)
> + -------------------
> +diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
> +index 4db5240..a6263c4 100644
> +--- a/src/OpenSSL/SSL.py
> ++++ b/src/OpenSSL/SSL.py
> +@@ -1,5 +1,6 @@
> + import os
> + import socket
> ++import sys
> + import typing
> + from errno import errorcode
> + from functools import partial, wraps
> +@@ -1567,7 +1568,11 @@ class Context:
> +=20
> +         @wraps(callback)
> +         def wrapper(ssl, alert, arg):
> +-            callback(Connection._reverse_mapping[ssl])
> ++            try:
> ++                callback(Connection._reverse_mapping[ssl])
> ++            except Exception:
> ++                sys.excepthook(*sys.exc_info())
> ++                return _lib.SSL_TLSEXT_ERR_ALERT_FATAL
> +             return 0
> +=20
> +         self._tlsext_servername_callback =3D _ffi.callback(
> +diff --git a/tests/test_ssl.py b/tests/test_ssl.py
> +index ca5bf83..55489b9 100644
> +--- a/tests/test_ssl.py
> ++++ b/tests/test_ssl.py
> +@@ -1855,6 +1855,56 @@ class TestServerNameCallback:
> +=20
> +         assert args =3D=3D [(server, b"foo1.example.com")]
> +=20
> ++    def test_servername_callback_exception(
> ++        self, monkeypatch: pytest.MonkeyPatch
> ++    ) -> None:
> ++        """
> ++        When the callback passed to `Context.set_tlsext_servername_call=
back`
> ++        raises an exception, ``sys.excepthook`` is called with the exce=
ption
> ++        and the handshake fails with an ``Error``.
> ++        """
> ++        exc =3D TypeError("server name callback failed")
> ++
> ++        def servername(conn: Connection) -> None:
> ++            raise exc
> ++
> ++        excepthook_calls: list[
> ++            tuple[type[BaseException], BaseException, object]
> ++        ] =3D []
> ++
> ++        def custom_excepthook(
> ++            exc_type: type[BaseException],
> ++            exc_value: BaseException,
> ++            exc_tb: object,
> ++        ) -> None:
> ++            excepthook_calls.append((exc_type, exc_value, exc_tb))
> ++
> ++        context =3D Context(SSLv23_METHOD)
> ++        context.set_tlsext_servername_callback(servername)
> ++
> ++        # Necessary to actually accept the connection
> ++        context.use_privatekey(load_privatekey(FILETYPE_PEM, server_key=
_pem))
> ++        context.use_certificate(
> ++            load_certificate(FILETYPE_PEM, server_cert_pem)
> ++        )
> ++
> ++        # Do a little connection to trigger the logic
> ++        server =3D Connection(context, None)
> ++        server.set_accept_state()
> ++
> ++        client =3D Connection(Context(SSLv23_METHOD), None)
> ++        client.set_connect_state()
> ++        client.set_tlsext_host_name(b"foo1.example.com")
> ++
> ++        monkeypatch.setattr(sys, "excepthook", custom_excepthook)
> ++        with pytest.raises(Error):
> ++            interact_in_memory(server, client)
> ++
> ++        assert len(excepthook_calls) =3D=3D 1
> ++        assert excepthook_calls[0][0] is TypeError
> ++        assert excepthook_calls[0][1] is exc
> ++        assert excepthook_calls[0][2] is not None
> ++
> +=20
> + class TestApplicationLayerProtoNegotiation:
> +     """
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/m=
eta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
> index 116f214bfa..bc0b568a46 100644
> --- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
> @@ -10,6 +10,10 @@ SRC_URI[sha256sum] =3D "6aa33039a93fffa4563e655b61d113=
64d01264be8ccb49906101e02a33
>  PYPI_PACKAGE =3D "pyOpenSSL"
>  inherit pypi setuptools3
> =20
> +SRC_URI +=3D " \
> +    file://CVE-2026-27448.patch \
> +"
> +
>  PACKAGES =3D+ "${PN}-tests"
>  FILES:${PN}-tests =3D "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/tes=
t"
> =20


--=20
Yoann Congal
Smile ECS



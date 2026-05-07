Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4336CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 21:23:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6513.1778189015340885180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 14:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vj395uiZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ba840146so11952915e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 14:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778189014; x=1778793814; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVoh+Fo20olxITI83YD/qZiz+5tHwNyBanZUH9nGTMw=;
        b=vj395uiZqiOh9+dx0Y1XtIP0BbX1TSqcCrWTfEffL4YUwvCC3CTwjYq/hxQZdRzy63
         QG52N6hQdpwtvjoOtcxaR/E71pzF8gE0JQB40hE+D9l2NDHsgwVNF4wdn76Vkeqx1TGr
         wM9NXAvjN2P0CvZOe2/zTrTHmJ60LfxWaegGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778189014; x=1778793814;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tVoh+Fo20olxITI83YD/qZiz+5tHwNyBanZUH9nGTMw=;
        b=V8GHLUWRmhz1JKuMN9QJrvk4yMxnUl8zuZm8wbXiZs7P0TWv99SmEvslZgFllGYpBd
         bi8tQiXfndR+UORlhWmbmRwAagFkkN6uPBO83eHdERDKZ7q3VvZWkgdZh6TH3o6N3Vb9
         YZam4dQYvnTB90LUbtXEwt48V/c0tUilqWETy1Ko+uRpzK2VDVJTugldjFQRYC+jwIaC
         tuWrRld7MXI8rE/PP6h34oXeXHrn64ejesGNbUzVt/k78x4vmhluPGepr+oCEGUmQTCp
         8DDwKNk0qCuVYtDeh67JpvuaFM8m8zq61wfCdUXEvuf3TouN1dh3515Y1sQA3a1fp03w
         zHJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rFtDYYWFlVKSUJ3iopdsrHz3QqJCIL9ZWsa5BIwtncSRBZn1U5E1UJ32hGD18iyPAEl02DBTVtk8YtY/HNC1RBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcNlRVarPD6/cpRMRLE0GeIjilCHZ0hIt5V9CdRZ40QH9PiNY7
	hjhsrN4rIH1INzsgz0qteTihfg/ANBBvMG5Ry3Ft4zZScmqiXmIpDCby0yvGEK/s9Gs=
X-Gm-Gg: AeBDiesC/A94ifIIpKjVDadE4qpLZZpqK9AJ/rO1Gon9Tjm0LLKOPBsxAovuGAVXYmR
	f9P10Ktzv46qnr62nP7937NAiSvo+1f+Hm9c2BCsvTugzckJqhcPKjH6BIRihoAjOhNRc38OtHB
	SAcX75g8GO/zf5Uk+1wJyjZeGml99pswvVCtiW6K33wIHihA016i7UNvXWDWTA29TzUbQf3BQM5
	YqDpra1AlydXgWkhp+DS++LaxLVFPcwJ/pETez+ZuRT1mI8ciJp+L0u7GuPhTckkGYRMJDWwK7E
	vY4pL7Gekgt+lUhPYQHXNu49vIunPOkc4rWZuJ2b2noqfsiMQwNG2uo6YXKl92e4g6OUs48ZzVH
	jZHO1D1HVf+2BW9iyC3X9KI2q0XNc4uInsvG0+V7CfLHy/K3RL57KB5lZUTH13h7hLEJMvMNsw8
	L5EbVIcxk739Oli00WVp93jzp2JIwLkBgc4h/2s46FGCdxncIuW0si90WGzkf1tYntLIZGtzw77
	vZ8mxm86Cvz8ZU=
X-Received: by 2002:a05:600c:628e:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48e60a32224mr54505625e9.0.1778189013458;
        Thu, 07 May 2026 14:23:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53907e8asm145949195e9.13.2026.05.07.14.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 14:23:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 23:23:32 +0200
Message-Id: <DICREB2KCQE5.1CG9GFJ7EB6AF@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] python3: fix for CVE-2026-1502
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260429091256.301317-1-hprajapati@mvista.com>
In-Reply-To: <20260429091256.301317-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 21:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236622

On Wed Apr 29, 2026 at 11:12 AM CEST, Hitendra Prajapati via lists.openembe=
dded.org wrote:
> Pick patch from [1] also mentioned at NVD report in [2]
>
> [1] https://github.com/python/cpython/commit/05ed7ce7ae9e17c23a04085b2539=
fe6d6d3cef69
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-1502
> [3] https://security-tracker.debian.org/tracker/CVE-2026-1502
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

As fas as I can tell, this patch is also needed on master and wrynose.
I can't merge here until this is fixed on those branches.

Can you send a patch to fix this on these branches and then, ping back here=
?

Thanks!

>  .../python/python3/CVE-2026-1502.patch        | 113 ++++++++++++++++++
>  .../python/python3_3.12.13.bb                 |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-1502.pa=
tch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-1502.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-1502.patch
> new file mode 100644
> index 0000000000..be6a8379a8
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-1502.patch
> @@ -0,0 +1,113 @@
> +From 05ed7ce7ae9e17c23a04085b2539fe6d6d3cef69 Mon Sep 17 00:00:00 2001
> +From: Seth Larson <seth@python.org>
> +Date: Fri, 10 Apr 2026 10:21:42 -0500
> +Subject: [PATCH] gh-146211: Reject CR/LF in HTTP tunnel request headers
> + (#146212)
> +
> +Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
> +
> +CVE: CVE-2026-1502
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/05ed=
7ce7ae9e17c23a04085b2539fe6d6d3cef69]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + Lib/http/client.py                            | 11 ++++-
> + Lib/test/test_httplib.py                      | 45 +++++++++++++++++++
> + ...-03-20-09-29-42.gh-issue-146211.PQVbs7.rst |  2 +
> + 3 files changed, 57 insertions(+), 1 deletion(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-iss=
ue-146211.PQVbs7.rst
> +
> +diff --git a/Lib/http/client.py b/Lib/http/client.py
> +index 70451d6..7db4807 100644
> +--- a/Lib/http/client.py
> ++++ b/Lib/http/client.py
> +@@ -972,13 +972,22 @@ class HTTPConnection:
> +         return ip
> +=20
> +     def _tunnel(self):
> ++        if _contains_disallowed_url_pchar_re.search(self._tunnel_host):
> ++            raise ValueError('Tunnel host can\'t contain control charac=
ters %r'
> ++                             % (self._tunnel_host,))
> +         connect =3D b"CONNECT %s:%d %s\r\n" % (
> +             self._wrap_ipv6(self._tunnel_host.encode("idna")),
> +             self._tunnel_port,
> +             self._http_vsn_str.encode("ascii"))
> +         headers =3D [connect]
> +         for header, value in self._tunnel_headers.items():
> +-            headers.append(f"{header}: {value}\r\n".encode("latin-1"))
> ++            header_bytes =3D header.encode("latin-1")
> ++            value_bytes =3D value.encode("latin-1")
> ++            if not _is_legal_header_name(header_bytes):
> ++                raise ValueError('Invalid header name %r' % (header_byt=
es,))
> ++            if _is_illegal_header_value(value_bytes):
> ++                raise ValueError('Invalid header value %r' % (value_byt=
es,))
> ++            headers.append(b"%s: %s\r\n" % (header_bytes, value_bytes))
> +         headers.append(b"\r\n")
> +         # Making a single send() call instead of one per line encourage=
s
> +         # the host OS to use a more optimal packet size instead of
> +diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
> +index e46dac0..e027d93 100644
> +--- a/Lib/test/test_httplib.py
> ++++ b/Lib/test/test_httplib.py
> +@@ -369,6 +369,51 @@ class HeaderTests(TestCase):
> +                 with self.assertRaisesRegex(ValueError, 'Invalid header=
'):
> +                     conn.putheader(name, value)
> +=20
> ++    def test_invalid_tunnel_headers(self):
> ++        cases =3D (
> ++            ('Invalid\r\nName', 'ValidValue'),
> ++            ('Invalid\rName', 'ValidValue'),
> ++            ('Invalid\nName', 'ValidValue'),
> ++            ('\r\nInvalidName', 'ValidValue'),
> ++            ('\rInvalidName', 'ValidValue'),
> ++            ('\nInvalidName', 'ValidValue'),
> ++            (' InvalidName', 'ValidValue'),
> ++            ('\tInvalidName', 'ValidValue'),
> ++            ('Invalid:Name', 'ValidValue'),
> ++            (':InvalidName', 'ValidValue'),
> ++            ('ValidName', 'Invalid\r\nValue'),
> ++            ('ValidName', 'Invalid\rValue'),
> ++            ('ValidName', 'Invalid\nValue'),
> ++            ('ValidName', 'InvalidValue\r\n'),
> ++            ('ValidName', 'InvalidValue\r'),
> ++            ('ValidName', 'InvalidValue\n'),
> ++        )
> ++        for name, value in cases:
> ++            with self.subTest((name, value)):
> ++                conn =3D client.HTTPConnection('example.com')
> ++                conn.set_tunnel('tunnel', headers=3D{
> ++                    name: value
> ++                })
> ++                conn.sock =3D FakeSocket('')
> ++                with self.assertRaisesRegex(ValueError, 'Invalid header=
'):
> ++                    conn._tunnel()  # Called in .connect()
> ++
> ++    def test_invalid_tunnel_host(self):
> ++        cases =3D (
> ++            'invalid\r.host',
> ++            '\ninvalid.host',
> ++            'invalid.host\r\n',
> ++            'invalid.host\x00',
> ++            'invalid host',
> ++        )
> ++        for tunnel_host in cases:
> ++            with self.subTest(tunnel_host):
> ++                conn =3D client.HTTPConnection('example.com')
> ++                conn.set_tunnel(tunnel_host)
> ++                conn.sock =3D FakeSocket('')
> ++                with self.assertRaisesRegex(ValueError, 'Tunnel host ca=
n\'t contain control characters'):
> ++                    conn._tunnel()  # Called in .connect()
> ++
> +     def test_headers_debuglevel(self):
> +         body =3D (
> +             b'HTTP/1.1 200 OK\r\n'
> +diff --git a/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-1462=
11.PQVbs7.rst b/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-1462=
11.PQVbs7.rst
> +new file mode 100644
> +index 0000000..4993633
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVb=
s7.rst
> +@@ -0,0 +1,2 @@
> ++Reject CR/LF characters in tunnel request headers for the
> ++HTTPConnection.set_tunnel() method.
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recip=
es-devtools/python/python3_3.12.13.bb
> index 5fa25235fe..da7e3c604e 100644
> --- a/meta/recipes-devtools/python/python3_3.12.13.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.13.bb
> @@ -34,6 +34,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>  	   file://0001-test_deadlock-skip-problematic-test.patch \
>  	   file://0001-test_active_children-skip-problematic-test.patch \
>             file://0001-test_readline-skip-limited-history-test.patch \
> +           file://CVE-2026-1502.patch \
>             "
> =20
>  SRC_URI:append:class-native =3D " \


--=20
Yoann Congal
Smile ECS



Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4404.1793739023097503161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=LXCncJRm;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917aca1aee5so928166d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 12:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793739022; x=1794343822; darn=lists.openembedded.org;
        h=in-reply-to:references:to:subject:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei04PK5T3TEUjKuAdyCYpszEdirGTAy8DtnN2/QNO+w=;
        b=LXCncJRmbEFAc5AJLyg23xroa3/WySVIkQPrRfs2LnkRTysjx3/+JXbAHZZPn14jMe
         aoLtfnX8e3reFzxrvVyv7Lz4ZVIIFnh41qw4/VQonyls8P9aRuGs7CCv2ategdt5ow36
         RAWGae6ZDdr0kEftt6cECnZsA8qrcs6pCqP5sEMd0CPA57XEEYxUMlk3poqk5XUFdi2e
         RQSWTBFElvsID8jtfjLlIS6hauu+fKeOjUUnJc1w/61CTb3+4Gc7zqaHSt3Gm0iG8Q7q
         dsKmCXNffazsg8iV0iEtEEtaTuaUa0mVzVgtyCj+VxfsukXrY5/1jGUtasGMiFJjke35
         Pzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739022; x=1794343822;
        h=in-reply-to:references:to:subject:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ei04PK5T3TEUjKuAdyCYpszEdirGTAy8DtnN2/QNO+w=;
        b=NF5N31m8KqhbPYVLZeBzmXBIFK2/Dx3jqdOyhvfau0jFf70VTWAVMRmVt1NPsG46QY
         VXQuCn1AnjEAD+8qaTx9bmdt17+O3FXcs4THOms7wjuVhJKV31hNCQ9wyvm6O6VA52fY
         8EYooeJzdEIk/BuZ+F6VWHCsyMqtnu2ZBmEpYvKQWjSixxWHVsVck7SB6ekkNVoYQbAB
         I5CEsL5wyGwoQwISMiatqw2lvTBsN5+gqvq+NSVPAH+EhcZPT1MJt+IHVXHAGthnybMQ
         2FZDHag/8OoTU9hoO7C1BRBl23Dlc9QMN26byu2wBlkHZuufIIijqUN59bOiOdQuv9SP
         yLlA==
X-Forwarded-Encrypted: i=1; AKwUvBz37EFRHKtTehI5h2e9CNXAcBYSnGZxpaxHgxT6LPOtpmfEPQ64o1Z2cIfDaIZdl+eSIeEXt2AmH2/X/ZAJyDgUGQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8vzQLf8GTX1sFF93pay9nrJ0Vymyv7CNhO4peeG0fHDpRLixIC
	+cD+5++7nm7pX/1PDDt6vhs+hStToqMZYIX9vmL1IA/fyoHn4hy5x82irYBHcQhPArT1MwAzuh1
	2kr7N
X-Gm-Gg: AYBFou0jtuIUvx4QxsIyT2tawcq7HX5JYylszNuATVIYcniYmEHwnNF4zd7MZgUogHV
	6vAM7/zsaOlJikwKjkjaDdWHn64KPBfHF/cGF7xLdRs1tUHk1dCGQA/H0bnAc+gdmK3FOUFc2VY
	osXX/xN3yRnFlGHfHUNzO+5NntXN472TL/ntBwAMkdFfXpacOsvMDwWpq//cXcukGvRn1Zrui47
	X1zIaaxCZ95mBzm2txhUWb5NmIb6D8V3IPj2oZClPKI4buRcCGhhWWYazLOCI6l6vtpXsIwzJQN
	64dwq0Ot+sECZ3+jDETeidVEvaxv8cNZGTdq7kejRnlw75mxgKSKNs/Hltw3V4WuMMToBgv+DVz
	WS8aUAJPmL7V1EKBHu658Wu4kLntLGc4xKd0eCOe1VNkpu0wgNfM1emPiTiie1ljjkxWWwLLPBK
	3Aqr6N9MvHxosCaYOGJef6s99jiz58/XpPdrsk1fC7U0zZ1Zo1oyMFf4T4EV8H57+BSxBEVur24
	i1NmSlnJMhO5zkqjmQzZjrqEsKUTP3gVFl0omIE4257kA61tAbF9iqNxDWG7zTccf2mdasdXmum
	1CGxbtBHjphTTYrPK0amFpzO14ksbWWutCjtlFTMnySNto7do6rbsw9a5DrTwVA2
X-Received: by 2002:a05:6214:1c0a:b0:91c:9259:bc27 with SMTP id 6a1803df08f44-91ca4b84b3cmr234314236d6.47.1793739021399;
        Tue, 03 Nov 2026 12:50:21 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfdfb5fsm510216d6.16.2026.11.03.12.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 12:50:20 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 03 Nov 2026 15:50:18 -0500
Message-Id: <DMLVEXD46FYX.3D2U16C6F63AY@baylibre.com>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [PATCH v2 2/5] python3-uvloop: enable ptest
To: <tim.orling@konsulko.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261103193829.1806542-4-tim.orling@konsulko.com>
In-Reply-To: <20261103193829.1806542-4-tim.orling@konsulko.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 21:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249298

On Tue Nov 3, 2026 at 2:38 PM EST, tim.orling wrote:
> From: Tim Orling <tim.orling@konsulko.com>
>
> The sdist ships the test suite. run-ptest deselects:
> * tests that conflict with pytest's output capture;
> * tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,
>   which bypasses uvloop's preexec_fn fork hook;
> * DNS tests that wait for resolver timeouts without network access,
>   which took the suite from 1 to 10 minutes over tap without NAT;
> * on riscv64 only, TLS stress tests, the issue39 deadlock check and a
>   socket cancellation test, whose fixed timeouts are too short for qemu
>   without KVM.
>
> .flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and
> mypy are missing.
>
> Tested with core-image-ptest-python3-uvloop on qemux86-64. It takes
> over 30 seconds, so add it to PTESTS_SLOW.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Changes in v2:
> - Skip 13 timing sensitive tests on riscv64 only, covering the
>   qemuriscv64 AutoBuilder failures plus their counterparts in the other
>   event loop class and test_socket_cancel_sock_sendall, found in 10 runs
>   under load (stress-ng)
> - Build the -k expression in a loop to fix patchtest's line length check
> - Drop the test counts from the commit message
>
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../python/python3-uvloop/run-ptest           | 50 +++++++++++++++++++
>  .../python/python3-uvloop_0.22.1.bb           | 27 +++++++++-
>  3 files changed, 76 insertions(+), 2 deletions(-)
>  create mode 100755 meta/recipes-devtools/python/python3-uvloop/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index bef45bb4d5..50b971bace 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -154,6 +154,7 @@ PTESTS_SLOW =3D "\
>      python3-click \
>      python3-cryptography \
>      python3-numpy \
> +    python3-uvloop \
>      python3-xmltodict \
>      strace \
>      tar \
> diff --git a/meta/recipes-devtools/python/python3-uvloop/run-ptest b/meta=
/recipes-devtools/python/python3-uvloop/run-ptest
> new file mode 100755
> index 0000000000..0cb9a26b88
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-uvloop/run-ptest
> @@ -0,0 +1,50 @@
> +#!/bin/sh
> +# test_process_streams_redirect: replaces the stdout/stderr fds, which
> +# conflicts with pytest's output capture.
> +# test_process_preexec_fn_{1,2}, Test_UV_DNS test_getaddrinfo_{8,9}: lib=
uv
> +# 1.53.0 spawns with posix_spawn(), so preexec_fn never runs, and an emp=
ty
> +# host gives EAI_NODATA.
> +# test_getaddrinfo_{1,2,3,5,6,11}, Test_AIO_DNS test_getaddrinfo_{8,9}: =
each
> +# DNS lookup waits for the resolver timeout without network access.
> +# --deselect matches a node id prefix, so -k handles 1, 2 and 11.
> +# riscv64: qemu runs without KVM there, too slow for the fixed timeouts =
in
> +# the TLS stress tests, the issue39 deadlock check (signal.alarm(5)) and
> +# test_socket_cancel_sock_sendall, which must cancel within 0.2s.
> +SLOW=3D""
> +if [ "$(uname -m)" =3D "riscv64" ]; then
> +    SLOW=3D"
> +        --deselect=3Dtests/test_tcp.py::Test_UV_TCPSSL::test_create_conn=
ection_ssl_1
> +        --deselect=3Dtests/test_tcp.py::Test_UV_TCPSSL::test_create_serv=
er_ssl_over_ssl
> +        --deselect=3Dtests/test_tcp.py::Test_UV_TCPSSL::test_renegotiati=
on
> +        --deselect=3Dtests/test_tcp.py::Test_AIO_TCPSSL::test_create_con=
nection_ssl_1
> +        --deselect=3Dtests/test_tcp.py::Test_AIO_TCPSSL::test_create_ser=
ver_ssl_over_ssl
> +        --deselect=3Dtests/test_tcp.py::Test_AIO_TCPSSL::test_renegotiat=
ion
> +        --deselect=3Dtests/test_unix.py::Test_UV_UnixSSL::test_create_un=
ix_connection_ssl_1
> +        --deselect=3Dtests/test_unix.py::Test_UV_UnixSSL::test_create_un=
ix_server_ssl_1
> +        --deselect=3Dtests/test_unix.py::Test_AIO_UnixSSL::test_create_u=
nix_connection_ssl_1
> +        --deselect=3Dtests/test_unix.py::Test_AIO_UnixSSL::test_create_u=
nix_server_ssl_1
> +        --deselect=3Dtests/test_regr1.py::TestIssue39Regr::test_issue39_=
regression
> +        --deselect=3Dtests/test_sockets.py::TestUVSockets::test_socket_c=
ancel_sock_sendall
> +        --deselect=3Dtests/test_sockets.py::TestAIOSockets::test_socket_=
cancel_sock_sendall
> +    "
> +fi
> +KEEP=3D"not (test_getaddrinfo_1 or test_getaddrinfo_2)"

This 'KEEP' variable name seems misleading given that it's using 'not' to a=
void
running those two test cases, but then gets built up in a loop. I think it'=
d be
better to just add them with --deselect like the others, even if it ends up
being more verbose.

> +for n in 10 12 13 14 15 16 17 18 19 20 21 22; do
> +    KEEP=3D"$KEEP or test_getaddrinfo_$n"
> +done
> +pytest --automake $SLOW \
> +    -k "$KEEP" \
> +    --deselect=3Dtests/test_process.py::Test_UV_Process::test_process_st=
reams_redirect \
> +    --deselect=3Dtests/test_process.py::Test_AIO_Process::test_process_s=
treams_redirect \
> +    --deselect=3Dtests/test_process.py::Test_UV_Process::test_process_pr=
eexec_fn_1 \
> +    --deselect=3Dtests/test_process.py::Test_UV_Process::test_process_pr=
eexec_fn_2 \
> +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_3 \
> +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_5 \
> +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_6 \
> +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_8 \
> +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_9 \
> +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_3 \
> +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_5 \
> +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_6 \
> +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_8 \
> +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_9

I wonder if we could keep this list inside the recipe file itself, similar =
to
how python3's recipe uses SKIPPED_TESTS with various appends? That example =
uses
unittest instead of pytest, but it should be possible to pass the list. May=
be
I'm wrong.

Trevor

> diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb b/meta=
/recipes-devtools/python/python3-uvloop_0.22.1.bb
> index 887c262ae7..39b6a2602a 100644
> --- a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
> +++ b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
> @@ -7,11 +7,34 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-APACHE;md5=3Dbb927=
39ddad0a2811957bd98bdb90474 \
> =20
>  DEPENDS +=3D "libuv python3-wheel-native"
> =20
> -SRC_URI +=3D "file://0001-setup.cfg-use-system-libuv.patch"
> +SRC_URI +=3D "\
> +    file://0001-setup.cfg-use-system-libuv.patch \
> +    file://run-ptest \
> +"
>  SRC_URI[sha256sum] =3D "6c84bae345b9147082b17371e3dd5d42775bddce91f88549=
9017f4607fdaf39f"
> =20
> -inherit pypi python_setuptools_build_meta cython
> +inherit pypi python_setuptools_build_meta cython ptest-python-pytest
> =20
>  RDEPENDS:${PN} =3D "python3-asyncio"
> =20
> +RDEPENDS:${PN}-ptest +=3D "\
> +    python3-ctypes \
> +    python3-io \
> +    python3-logging \
> +    python3-math \
> +    python3-multiprocessing \
> +    python3-netclient \
> +    python3-numbers \
> +    python3-pickle \
> +    python3-pprint \
> +    python3-psutil \
> +    python3-pyopenssl \
> +    python3-threading \
> +"
> +
> +do_install_ptest:append() {
> +    # test_sourcecode needs these to skip cleanly when flake8 and mypy a=
re missing
> +    install -m 0644 ${S}/.flake8 ${S}/mypy.ini ${D}${PTEST_PATH}/
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"



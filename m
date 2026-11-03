Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.348.1793740733663380697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 13:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z5ESxbP5;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfa686881fso3586519e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 13:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793740731; cv=none;
        d=google.com; s=arc-20260327;
        b=iK3w7bSZenAZLwUzr7S+fWgLe1esNRVKP08myhZj/tZyYSQ0MHun6efikzdjtHln3P
         9R2tX89JazdN5Apn7aCuy++rvCm1l6ZZ7Pp4ruYmVKnnGRudjBP/2ngklyNU4zgE6H62
         eW7oAUC7LZu0vEa0VqHsJPVUJu5fcI+XZXe6jgsJa9vUp+cgCQ8ZCnWg18GCxTg9ZrGZ
         iisgftsW7Utq6MxIuyOJSaR/Oe2AbVd5yNK9iWJNP3jYgWQ5iEQA/WvQdR8sGeyRCLgz
         5duTZ5wtpYR3j6Vw/W7uEbOqAujL8hf7orKwRPAHrL9AoAUDpN/xbM4ntoWl4LOU64Li
         5kZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iTRcs7n6pelQol+TMxHjxpsVxExj0O3+x3SAtP0q5qE=;
        fh=dxkKDQZQ+CHn/rmh2vNj/3U1A1Uhz38ZfcQXLvif9Bk=;
        b=oFFELCVooKcRYHZ8/rRjl6bdD5q0JOS4JIOEFgEBz+daqCzya+wwRQSF2VpUs2obRz
         8BbDUHCKVXFGPkh1cRqIH0TRAvtDAqnEiyDj7i0MPkRfPzExx76ccD5GOjTvzIysoVqL
         CYrhicJ0VUo6oO3tuHLobY+MFWcwdwzxKvYTRvw+SyDaSsH9Lc3Y/qtnMmYcCXgvwMmW
         PhoGW6rPMt8lUlB8iS3TV3GhWWXEak4nflvN2mFojmxZdRH2XhLrZROSW+UqM8gY60HK
         MbdHTm3Cb8gZRzauWbQuK49Ypky9+1irZ5+UseeoLF5r3lbca2TikyyQR3mTFdIvH6nh
         WhQg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793740731; x=1794345531; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTRcs7n6pelQol+TMxHjxpsVxExj0O3+x3SAtP0q5qE=;
        b=z5ESxbP5BPXYwvOM4CggujfAys5/hXk1sE4840QIcGyPk/7dIYodaSRGuN5/qdq3D/
         2MrHJQlY2b+BIAZKiGdW1Gp8Y+V2JGjfMmLLXvIyB23aMUNXy05B5JXg7zHSeMTn6rtD
         JTWpdHOM3XJs28WrxLIei5SnqKwlbrGRtS73MTb6nmU6uPEpzuY+hKZsEkO3vrH4XGY1
         EylUNRFLIzESaxbincHJdABXaojmUG4r6CmD7ChP9EQ/Gt6nhUWQs55NN8GYqh06hl2H
         T4fvQkEcErfwPriY4S8GpCZKtoVoOOt+3QUhnTiC+EgA05mWgitwbFvLH/n6yU9q34JZ
         B7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740731; x=1794345531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iTRcs7n6pelQol+TMxHjxpsVxExj0O3+x3SAtP0q5qE=;
        b=rgudHbsRu+7hA3H1J6An8ZcmvDmkIeQ7awruOgwImathSDk8WpHwVdl+X+lffWeDJ4
         LuEUgGU9/iF1OF0z0+44aNpwi1EmGgi1tdmx0dGxSgWSPOe1XELLdfLeaDlY80z2Pw8s
         ox3E1JdkEY6molUbQjQsbuc+N9fm7GmIJtaYsaJmc5OuX5P/Ku3G/76XKJ0Vya3eSGHp
         mdOzbV+/4Ax15Bu9rdMdynsl+5kxtWw9aXrMWOlxIIznGYNN/BWD0ae7rC8aj3+re5tB
         z5JtHmCyGDCipazwu5mK6UF2lygs7mviP3mqIknG+VVRCPoSigZoBzCWgO6DNGYXwOk7
         ZkBg==
X-Forwarded-Encrypted: i=1; AKwUvByhclkeiOQ7nb1fcDF7wGlG1trM0RvO1X06IY6bQjDEsYFHueyfHZ7GJwURaGW/ILuyFQjQ1km6zwi4ZinZjGqCsQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9/rxN0Tv3kkC8gkZxSZfuJ7rQPlqMhL8tLUi2cMx9LeMVS7rms
	GzMK8fLfOLMf9wbaetD0uNem46g9JpKDVHAff1mRT0ww7NrTZgQbvCtvBs5idroh9lCaLNrslzu
	Ne0xvgY7EaUpr3p9KcpfqUtrrekPEPAs=
X-Gm-Gg: AYBFou0yV+MXFd8kMCGj86zC0NIImnpamy/irZONSJ8C42EycPDHBfkeTvOMC5YDDja
	5mZgAigT4DrtSnD48PPJn9i7ZIhdObAq+eNusoJL0MYLRvR7F2A7QleQM5v+3T/E/qw9+oO6e9O
	pme/KwOAr7jmKAIu2xXQKtq+ptxOpJmxHG9HoTOhjcBd1q2CYA1EmRDsXv8+2qpa2roW8FEYg8b
	S0efMach8CadOT73UhmXfVCmWYltuiF4kr7dRdvophtk/BvNu6Azr/DQ6DukZ0riqU8GivqEPnA
	VKam5oTWxEtCAYyzvOYAekoEfAYpRH3xLN9vrPQOkrWDr0uKGmEH0L1Uf2Yitej8aEOfDK6GP91
	00IzVTN+F8Edk7RCsBIHN2G/UW2nufeHnmRyg
X-Received: by 2002:a05:6512:a94:b0:5bf:b246:87a2 with SMTP id
 2adb3069b0e04-5bfd957b610mr4930887e87.10.1793740730902; Tue, 03 Nov 2026
 13:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261103193829.1806542-4-tim.orling@konsulko.com> <DMLVEXD46FYX.3D2U16C6F63AY@baylibre.com>
In-Reply-To: <DMLVEXD46FYX.3D2U16C6F63AY@baylibre.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 3 Nov 2026 13:18:38 -0800
X-Gm-Features: AclHuK_mUVlqp7TAkUeJUnsXl-dZWcsO6WaCHJ3tuM1lAxV9hAyMcYwoTo6P2MM
Message-ID: <CANx9H-C3ZkaZkTdk_OP4E1=kGGCMsDgqq+=NdxMB+gt8AXvBnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/5] python3-uvloop: enable ptest
To: tgamblin@baylibre.com
Cc: tim.orling@konsulko.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000015ae3e065f65cfd9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 21:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249299

--00000000000015ae3e065f65cfd9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:07=E2=80=AFPM Trevor Gamblin via openembedded-core
<tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:

> On Tue Nov 3, 2026 at 2:38 PM EST, tim.orling wrote:
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > The sdist ships the test suite. run-ptest deselects:
> > * tests that conflict with pytest's output capture;
> > * tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,
> >   which bypasses uvloop's preexec_fn fork hook;
> > * DNS tests that wait for resolver timeouts without network access,
> >   which took the suite from 1 to 10 minutes over tap without NAT;
> > * on riscv64 only, TLS stress tests, the issue39 deadlock check and a
> >   socket cancellation test, whose fixed timeouts are too short for qemu
> >   without KVM.
> >
> > .flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and
> > mypy are missing.
> >
> > Tested with core-image-ptest-python3-uvloop on qemux86-64. It takes
> > over 30 seconds, so add it to PTESTS_SLOW.
> >
> > AI-Generated: Uses Claude Code (Claude Opus 5.5)
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > Changes in v2:
> > - Skip 13 timing sensitive tests on riscv64 only, covering the
> >   qemuriscv64 AutoBuilder failures plus their counterparts in the other
> >   event loop class and test_socket_cancel_sock_sendall, found in 10 run=
s
> >   under load (stress-ng)
> > - Build the -k expression in a loop to fix patchtest's line length chec=
k
> > - Drop the test counts from the commit message
> >
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  .../python/python3-uvloop/run-ptest           | 50 +++++++++++++++++++
> >  .../python/python3-uvloop_0.22.1.bb           | 27 +++++++++-
> >  3 files changed, 76 insertions(+), 2 deletions(-)
> >  create mode 100755 meta/recipes-devtools/python/python3-uvloop/run-pte=
st
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> > index bef45bb4d5..50b971bace 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -154,6 +154,7 @@ PTESTS_SLOW =3D "\
> >      python3-click \
> >      python3-cryptography \
> >      python3-numpy \
> > +    python3-uvloop \
> >      python3-xmltodict \
> >      strace \
> >      tar \
> > diff --git a/meta/recipes-devtools/python/python3-uvloop/run-ptest
> b/meta/recipes-devtools/python/python3-uvloop/run-ptest
> > new file mode 100755
> > index 0000000000..0cb9a26b88
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-uvloop/run-ptest
> > @@ -0,0 +1,50 @@
> > +#!/bin/sh
> > +# test_process_streams_redirect: replaces the stdout/stderr fds, which
> > +# conflicts with pytest's output capture.
> > +# test_process_preexec_fn_{1,2}, Test_UV_DNS test_getaddrinfo_{8,9}:
> libuv
> > +# 1.53.0 spawns with posix_spawn(), so preexec_fn never runs, and an
> empty
> > +# host gives EAI_NODATA.
> > +# test_getaddrinfo_{1,2,3,5,6,11}, Test_AIO_DNS test_getaddrinfo_{8,9}=
:
> each
> > +# DNS lookup waits for the resolver timeout without network access.
> > +# --deselect matches a node id prefix, so -k handles 1, 2 and 11.
> > +# riscv64: qemu runs without KVM there, too slow for the fixed timeout=
s
> in
> > +# the TLS stress tests, the issue39 deadlock check (signal.alarm(5)) a=
nd
> > +# test_socket_cancel_sock_sendall, which must cancel within 0.2s.
> > +SLOW=3D""
> > +if [ "$(uname -m)" =3D "riscv64" ]; then
> > +    SLOW=3D"
> > +
> --deselect=3Dtests/test_tcp.py::Test_UV_TCPSSL::test_create_connection_ss=
l_1
> > +
> --deselect=3Dtests/test_tcp.py::Test_UV_TCPSSL::test_create_server_ssl_ov=
er_ssl
> > +        --deselect=3Dtests/test_tcp.py::Test_UV_TCPSSL::test_renegotia=
tion
> > +
> --deselect=3Dtests/test_tcp.py::Test_AIO_TCPSSL::test_create_connection_s=
sl_1
> > +
> --deselect=3Dtests/test_tcp.py::Test_AIO_TCPSSL::test_create_server_ssl_o=
ver_ssl
> > +
> --deselect=3Dtests/test_tcp.py::Test_AIO_TCPSSL::test_renegotiation
> > +
> --deselect=3Dtests/test_unix.py::Test_UV_UnixSSL::test_create_unix_connec=
tion_ssl_1
> > +
> --deselect=3Dtests/test_unix.py::Test_UV_UnixSSL::test_create_unix_server=
_ssl_1
> > +
> --deselect=3Dtests/test_unix.py::Test_AIO_UnixSSL::test_create_unix_conne=
ction_ssl_1
> > +
> --deselect=3Dtests/test_unix.py::Test_AIO_UnixSSL::test_create_unix_serve=
r_ssl_1
> > +
> --deselect=3Dtests/test_regr1.py::TestIssue39Regr::test_issue39_regressio=
n
> > +
> --deselect=3Dtests/test_sockets.py::TestUVSockets::test_socket_cancel_soc=
k_sendall
> > +
> --deselect=3Dtests/test_sockets.py::TestAIOSockets::test_socket_cancel_so=
ck_sendall
> > +    "
> > +fi
> > +KEEP=3D"not (test_getaddrinfo_1 or test_getaddrinfo_2)"
>
> This 'KEEP' variable name seems misleading given that it's using 'not' to
> avoid
> running those two test cases, but then gets built up in a loop. I think
> it'd be
> better to just add them with --deselect like the others, even if it ends =
up
> being more verbose.
>
> > +for n in 10 12 13 14 15 16 17 18 19 20 21 22; do
> > +    KEEP=3D"$KEEP or test_getaddrinfo_$n"
> > +done
> > +pytest --automake $SLOW \
> > +    -k "$KEEP" \
> > +
> --deselect=3Dtests/test_process.py::Test_UV_Process::test_process_streams=
_redirect
> \
> > +
> --deselect=3Dtests/test_process.py::Test_AIO_Process::test_process_stream=
s_redirect
> \
> > +
> --deselect=3Dtests/test_process.py::Test_UV_Process::test_process_preexec=
_fn_1
> \
> > +
> --deselect=3Dtests/test_process.py::Test_UV_Process::test_process_preexec=
_fn_2
> \
> > +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_3 \
> > +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_5 \
> > +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_6 \
> > +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_8 \
> > +    --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getaddrinfo_9 \
> > +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_3 \
> > +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_5 \
> > +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_6 \
> > +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_8 \
> > +    --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_9
>
> I wonder if we could keep this list inside the recipe file itself, simila=
r
> to
> how python3's recipe uses SKIPPED_TESTS with various appends? That exampl=
e
> uses
> unittest instead of pytest, but it should be possible to pass the list.
> Maybe
> I'm wrong.
>

Good points that honestly I was not aware of previously. I am working on a
SKIPPED_TESTS v3.

Thank you for the review!

--Tim


>
> Trevor
>
> > diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
> b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
> > index 887c262ae7..39b6a2602a 100644
> > --- a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
> > +++ b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
> > @@ -7,11 +7,34 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE-APACHE;md5=3Dbb92739ddad0a2811957bd98bdb90474 \
> >
> >  DEPENDS +=3D "libuv python3-wheel-native"
> >
> > -SRC_URI +=3D "file://0001-setup.cfg-use-system-libuv.patch"
> > +SRC_URI +=3D "\
> > +    file://0001-setup.cfg-use-system-libuv.patch \
> > +    file://run-ptest \
> > +"
> >  SRC_URI[sha256sum] =3D
> "6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f"
> >
> > -inherit pypi python_setuptools_build_meta cython
> > +inherit pypi python_setuptools_build_meta cython ptest-python-pytest
> >
> >  RDEPENDS:${PN} =3D "python3-asyncio"
> >
> > +RDEPENDS:${PN}-ptest +=3D "\
> > +    python3-ctypes \
> > +    python3-io \
> > +    python3-logging \
> > +    python3-math \
> > +    python3-multiprocessing \
> > +    python3-netclient \
> > +    python3-numbers \
> > +    python3-pickle \
> > +    python3-pprint \
> > +    python3-psutil \
> > +    python3-pyopenssl \
> > +    python3-threading \
> > +"
> > +
> > +do_install_ptest:append() {
> > +    # test_sourcecode needs these to skip cleanly when flake8 and mypy
> are missing
> > +    install -m 0644 ${S}/.flake8 ${S}/mypy.ini ${D}${PTEST_PATH}/
> > +}
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249298):
> https://lists.openembedded.org/g/openembedded-core/message/249298
> Mute This Topic: https://lists.openembedded.org/mt/122082304/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000015ae3e065f65cfd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, =
2026 at 1:07=E2=80=AFPM Trevor Gamblin via openembedded-core &lt;tgamblin=
=3D<a href=3D"mailto:baylibre.com@lists.openembedded.org">baylibre.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue Nov 3, 2026 at 2:38 PM EST, tim.orling wrote:<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; The sdist ships the test suite. run-ptest deselects:<br>
&gt; * tests that conflict with pytest&#39;s output capture;<br>
&gt; * tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,<b=
r>
&gt;=C2=A0 =C2=A0which bypasses uvloop&#39;s preexec_fn fork hook;<br>
&gt; * DNS tests that wait for resolver timeouts without network access,<br=
>
&gt;=C2=A0 =C2=A0which took the suite from 1 to 10 minutes over tap without=
 NAT;<br>
&gt; * on riscv64 only, TLS stress tests, the issue39 deadlock check and a<=
br>
&gt;=C2=A0 =C2=A0socket cancellation test, whose fixed timeouts are too sho=
rt for qemu<br>
&gt;=C2=A0 =C2=A0without KVM.<br>
&gt;<br>
&gt; .flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and<=
br>
&gt; mypy are missing.<br>
&gt;<br>
&gt; Tested with core-image-ptest-python3-uvloop on qemux86-64. It takes<br=
>
&gt; over 30 seconds, so add it to PTESTS_SLOW.<br>
&gt;<br>
&gt; AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt; - Skip 13 timing sensitive tests on riscv64 only, covering the<br>
&gt;=C2=A0 =C2=A0qemuriscv64 AutoBuilder failures plus their counterparts i=
n the other<br>
&gt;=C2=A0 =C2=A0event loop class and test_socket_cancel_sock_sendall, foun=
d in 10 runs<br>
&gt;=C2=A0 =C2=A0under load (stress-ng)<br>
&gt; - Build the -k expression in a loop to fix patchtest&#39;s line length=
 check<br>
&gt; - Drop the test counts from the commit message<br>
&gt;<br>
&gt;=C2=A0 .../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt;=C2=A0 .../python/python3-uvloop/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 50 +++++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-uvloop_0.22.1.bb" rel=3D"no=
referrer" target=3D"_blank">python3-uvloop_0.22.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++++++-<br>
&gt;=C2=A0 3 files changed, 76 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100755 meta/recipes-devtools/python/python3-uvloop/r=
un-ptest<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/co=
nf/distro/include/ptest-packagelists.inc<br>
&gt; index bef45bb4d5..50b971bace 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -154,6 +154,7 @@ PTESTS_SLOW =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-click \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-cryptography \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-numpy \<br>
&gt; +=C2=A0 =C2=A0 python3-uvloop \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-xmltodict \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 strace \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tar \<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-uvloop/run-ptest b/m=
eta/recipes-devtools/python/python3-uvloop/run-ptest<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..0cb9a26b88<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-uvloop/run-ptest<br>
&gt; @@ -0,0 +1,50 @@<br>
&gt; +#!/bin/sh<br>
&gt; +# test_process_streams_redirect: replaces the stdout/stderr fds, whic=
h<br>
&gt; +# conflicts with pytest&#39;s output capture.<br>
&gt; +# test_process_preexec_fn_{1,2}, Test_UV_DNS test_getaddrinfo_{8,9}: =
libuv<br>
&gt; +# 1.53.0 spawns with posix_spawn(), so preexec_fn never runs, and an =
empty<br>
&gt; +# host gives EAI_NODATA.<br>
&gt; +# test_getaddrinfo_{1,2,3,5,6,11}, Test_AIO_DNS test_getaddrinfo_{8,9=
}: each<br>
&gt; +# DNS lookup waits for the resolver timeout without network access.<b=
r>
&gt; +# --deselect matches a node id prefix, so -k handles 1, 2 and 11.<br>
&gt; +# riscv64: qemu runs without KVM there, too slow for the fixed timeou=
ts in<br>
&gt; +# the TLS stress tests, the issue39 deadlock check (signal.alarm(5)) =
and<br>
&gt; +# test_socket_cancel_sock_sendall, which must cancel within 0.2s.<br>
&gt; +SLOW=3D&quot;&quot;<br>
&gt; +if [ &quot;$(uname -m)&quot; =3D &quot;riscv64&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 SLOW=3D&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_tcp.py::Test_UV_T=
CPSSL::test_create_connection_ssl_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_tcp.py::Test_UV_T=
CPSSL::test_create_server_ssl_over_ssl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_tcp.py::Test_UV_T=
CPSSL::test_renegotiation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_tcp.py::Test_AIO_=
TCPSSL::test_create_connection_ssl_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_tcp.py::Test_AIO_=
TCPSSL::test_create_server_ssl_over_ssl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_tcp.py::Test_AIO_=
TCPSSL::test_renegotiation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_unix.py::Test_UV_=
UnixSSL::test_create_unix_connection_ssl_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_unix.py::Test_UV_=
UnixSSL::test_create_unix_server_ssl_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_unix.py::Test_AIO=
_UnixSSL::test_create_unix_connection_ssl_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_unix.py::Test_AIO=
_UnixSSL::test_create_unix_server_ssl_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_regr1.py::TestIss=
ue39Regr::test_issue39_regression<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_sockets.py::TestU=
VSockets::test_socket_cancel_sock_sendall<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --deselect=3Dtests/test_sockets.py::TestA=
IOSockets::test_socket_cancel_sock_sendall<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +fi<br>
&gt; +KEEP=3D&quot;not (test_getaddrinfo_1 or test_getaddrinfo_2)&quot;<br>
<br>
This &#39;KEEP&#39; variable name seems misleading given that it&#39;s usin=
g &#39;not&#39; to avoid<br>
running those two test cases, but then gets built up in a loop. I think it&=
#39;d be<br>
better to just add them with --deselect like the others, even if it ends up=
<br>
being more verbose.<br>
<br>
&gt; +for n in 10 12 13 14 15 16 17 18 19 20 21 22; do<br>
&gt; +=C2=A0 =C2=A0 KEEP=3D&quot;$KEEP or test_getaddrinfo_$n&quot;<br>
&gt; +done<br>
&gt; +pytest --automake $SLOW \<br>
&gt; +=C2=A0 =C2=A0 -k &quot;$KEEP&quot; \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_process.py::Test_UV_Process::te=
st_process_streams_redirect \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_process.py::Test_AIO_Process::t=
est_process_streams_redirect \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_process.py::Test_UV_Process::te=
st_process_preexec_fn_1 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_process.py::Test_UV_Process::te=
st_process_preexec_fn_2 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getad=
drinfo_3 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getad=
drinfo_5 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getad=
drinfo_6 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getad=
drinfo_8 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_UV_DNS::test_getad=
drinfo_9 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_geta=
ddrinfo_3 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_geta=
ddrinfo_5 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_geta=
ddrinfo_6 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_geta=
ddrinfo_8 \<br>
&gt; +=C2=A0 =C2=A0 --deselect=3Dtests/test_dns.py::Test_AIO_DNS::test_geta=
ddrinfo_9<br>
<br>
I wonder if we could keep this list inside the recipe file itself, similar =
to<br>
how python3&#39;s recipe uses SKIPPED_TESTS with various appends? That exam=
ple uses<br>
unittest instead of pytest, but it should be possible to pass the list. May=
be<br>
I&#39;m wrong.<br></blockquote><div><br>Good points that=C2=A0honestly=C2=
=A0I was not aware of previously. I am working on a SKIPPED_TESTS v3.</div>=
<div><br></div><div>Thank you for the review!</div><div><br></div><div>--Ti=
m</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Trevor<br>
<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-uv=
loop_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uvloop_0.22.1.=
bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-uvloop_0.22=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uvloop_0.22.1.bb</a><br=
>
&gt; index 887c262ae7..39b6a2602a 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-uvloop_0.=
22.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uvloop_0.22.1.bb</a><=
br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-uvloop_0.=
22.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-uvloop_0.22.1.bb</a><=
br>
&gt; @@ -7,11 +7,34 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE-APACHE;md5=
=3Dbb92739ddad0a2811957bd98bdb90474 \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS +=3D &quot;libuv python3-wheel-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI +=3D &quot;file://0001-setup.cfg-use-system-libuv.patch&quot;=
<br>
&gt; +SRC_URI +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 file://0001-setup.cfg-use-system-libuv.patch \<br>
&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt; +&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;6c84bae345b9147082b17371e3dd5d42775=
bddce91f885499017f4607fdaf39f&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit pypi python_setuptools_build_meta cython<br>
&gt; +inherit pypi python_setuptools_build_meta cython ptest-python-pytest<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;python3-asyncio&quot;<br>
&gt;=C2=A0 <br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 python3-ctypes \<br>
&gt; +=C2=A0 =C2=A0 python3-io \<br>
&gt; +=C2=A0 =C2=A0 python3-logging \<br>
&gt; +=C2=A0 =C2=A0 python3-math \<br>
&gt; +=C2=A0 =C2=A0 python3-multiprocessing \<br>
&gt; +=C2=A0 =C2=A0 python3-netclient \<br>
&gt; +=C2=A0 =C2=A0 python3-numbers \<br>
&gt; +=C2=A0 =C2=A0 python3-pickle \<br>
&gt; +=C2=A0 =C2=A0 python3-pprint \<br>
&gt; +=C2=A0 =C2=A0 python3-psutil \<br>
&gt; +=C2=A0 =C2=A0 python3-pyopenssl \<br>
&gt; +=C2=A0 =C2=A0 python3-threading \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_install_ptest:append() {<br>
&gt; +=C2=A0 =C2=A0 # test_sourcecode needs these to skip cleanly when flak=
e8 and mypy are missing<br>
&gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/.flake8 ${S}/mypy.ini ${D}${PTEST_=
PATH}/<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249298): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249298" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249298</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122082304/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/122082304/924729</a><br>
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

--00000000000015ae3e065f65cfd9--

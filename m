Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B553560BB5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 12:50:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s144so14237180wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/EtG1/TAP+uvVK7X5fYYob2Ob9NOppDHntZQdvJo+9s=;
	b=MZr7UrxKlXnVD0a4Pnk9PQHkbijkT8stB0xBwSnf6JgyfgVUdHrskUZpZMtOXbilUq
	WwR4Rwvalk8cIJKOEJkDqYPFdhA/3VRaCHLE7oAdCwtw8FAYyVyuUa7ESbJeU6L5MMLk
	KqI2FcoKnLYWHUtMBFiXl57CQjKYrJu7ZK39ONLZjul9MAhrTqGU10OM0PIjy+vWAR+i
	W2Yp0KLNo9kGEH9zUJRMfNUZQ++azHzNbk9bmQzC5tq7RLUgOGG9W4z7hI9IhACElH7y
	hXk6DVykFVoW65G5yxnyHHa8lDkn9ZSkARzzLA1IgkSnnN1CfnqcrbSMpXa++UPtZuii
	q1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/EtG1/TAP+uvVK7X5fYYob2Ob9NOppDHntZQdvJo+9s=;
	b=H6TpUJ1e2qvxVBB/WmUaQyu8F/ipvfBONZpzQ3Wx5hL0SPjU4JWgK8lrlMxTZjAwTo
	aedL+6yQ1w5ia9fbt+onmDrkmWtuBu7C6SjZtPMkZc9rq50D+U5zQAm6OI2VKadoA4Zf
	0xsipFgBFwzBYqC8RcPosX/BRejQemXnX9mSlTDFOHKGMuG9yBun/uCk4aX/0w2J5v6D
	ZAzECNe7dyyHMzyRF2OwjWlmM4DPA/KW2yzz+95WGwYC0ZtO+sLVaOTYsNPchpO9zQO5
	oA0nXERpG7onLhavw/G++euwx5BQuoRtyS1MVOwoIWSH6yQPqqDtWlrvvkuGEbn4UmTW
	DoKg==
X-Gm-Message-State: APjAAAW0W9vLneyso07w51ZLAuqZl3fgSsa2VTWX/I17BQzr+pa6K7eh
	FeB/wKCTcHryDP4ktjaxN8PS35Qy
X-Google-Smtp-Source: APXvYqwZMWTgtcekhMw58RXU7EPb/rUIzLSLUiGPsXMXgvWny+U7B0ADWbTIr+QdF9x1HVm8+6Gq6A==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr29056927wme.30.1580734258933; 
	Mon, 03 Feb 2020 04:50:58 -0800 (PST)
Received: from ?IPv6:2a01:598:8880:13fd:ac61:8308:77b8:cfa6?
	([2a01:598:8880:13fd:ac61:8308:77b8:cfa6])
	by smtp.gmail.com with ESMTPSA id
	o7sm22855639wmh.11.2020.02.03.04.50.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2020 04:50:58 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20200203091406.37643-1-kai.kang@windriver.com>
Date: Mon, 3 Feb 2020 13:50:57 +0100
Message-Id: <B90E2425-D2BC-411A-B3CF-E3B31614A8DE@gmail.com>
References: <20200203091406.37643-1-kai.kang@windriver.com>
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ifupdown: add ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Feb 2020 12:50:59 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I think a build configuration for this also needs to be enabled and tested a=
s explained in the email thread from the bug (in magefeatures.py from selfte=
st I think). Otherwise this wouldn=E2=80=99t be built or checked anywhere.

Alex

> On 3 Feb 2020, at 10.14, <kai.kang@windriver.com> <kai.kang@windriver.com>=
 wrote:
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Add ptest for ifupdown with its own test cases.
>=20
> [Yocto #13736]
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> meta/recipes-core/ifupdown/files/run-ptest    |  4 ++
> .../ifupdown/files/tweak-ptest-script.patch   | 49 +++++++++++++++++++
> meta/recipes-core/ifupdown/ifupdown_0.8.35.bb | 10 +++-
> 3 files changed, 62 insertions(+), 1 deletion(-)
> create mode 100644 meta/recipes-core/ifupdown/files/run-ptest
> create mode 100644 meta/recipes-core/ifupdown/files/tweak-ptest-script.pat=
ch
>=20
> diff --git a/meta/recipes-core/ifupdown/files/run-ptest b/meta/recipes-cor=
e/ifupdown/files/run-ptest
> new file mode 100644
> index 0000000000..8694042392
> --- /dev/null
> +++ b/meta/recipes-core/ifupdown/files/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +CURDIR=3D$(dirname `readlink -f $0`)
> +cd $CURDIR/tests && ./testbuild-linux
> diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/m=
eta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> new file mode 100644
> index 0000000000..d7600cf243
> --- /dev/null
> +++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> @@ -0,0 +1,49 @@
> +Tweak tests of ifupdown to make it work with oe-core ptest framework.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +diff --git a/tests/testbuild-linux b/tests/testbuild-linux
> +index 1181ea0..d5c1814 100755
> +--- a/tests/testbuild-linux
> ++++ b/tests/testbuild-linux
> +@@ -1,6 +1,7 @@
> + #!/bin/sh -e
> +=20
> +-dir=3Dtests/linux
> ++curdir=3D$(dirname `readlink -f $0`)
> ++dir=3D$curdir/linux
> +=20
> + result=3Dtrue
> + for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
> +@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 1=
8; do
> +         echo "Testcase $test: $args"
> +=20
> +    exitcode=3D0
> +-        ./ifup -v --no-act-commands --force -i $dir/testcase.$test --sta=
te-dir=3D$dir/state.$test $args \
> ++        ifup -v --no-act-commands --force -i $dir/testcase.$test --state=
-dir=3D$dir/state.$test $args \
> +                 >$dir/up-res-out.$test 2>$dir/up-res-err.$test || exitco=
de=3D$?
> +=20
> +         (echo "exit code: $exitcode";
> +@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 1=
8; do
> +          echo "=3D=3D=3D=3Dstderr=3D=3D=3D=3D"; cat $dir/up-res-err.$tes=
t) > $dir/up-res.$test
> +=20
> +    exitcode=3D0
> +-        ./ifdown -v --no-act-commands --force -i $dir/testcase.$test --s=
tate-dir=3D$dir/state.$test $args \
> ++        ifdown -v --no-act-commands --force -i $dir/testcase.$test --sta=
te-dir=3D$dir/state.$test $args \
> +                >$dir/down-res-out.$test 2>$dir/down-res-err.$test || exi=
tcode=3D$?
> +=20
> +         (echo "exit code: $exitcode";
> +@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 1=
8; do
> +          echo "=3D=3D=3D=3Dstderr=3D=3D=3D=3D"; cat $dir/down-res-err.$t=
est) > $dir/down-res.$test
> +=20
> +         if diff -ub $dir/up.$test $dir/up-res.$test && diff -ub $dir/dow=
n.$test $dir/down-res.$test; then
> +-                echo "(okay)"
> ++                echo "PASS: $test"
> +         else
> +-                echo "(failed)"
> ++                echo "FAIL: $test"
> +                 result=3Dfalse
> +         fi
> +         echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
> diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-=
core/ifupdown/ifupdown_0.8.35.bb
> index 0de97fe372..53cb971d33 100644
> --- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
> @@ -11,13 +11,15 @@ SRC_URI =3D "git://salsa.debian.org/debian/ifupdown.gi=
t;protocol=3Dhttps \
>            file://99_network \
>            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
>            file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.pa=
tch \
> +           file://run-ptest \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak=
-ptest-script.patch', '', d)} \
>            "
> SRCREV =3D "4af76318cfc57f8e4a44d357104188666213bd4b"
>=20
> S =3D "${WORKDIR}/git"
>=20
>=20
> -inherit update-alternatives
> +inherit ptest update-alternatives
>=20
> do_compile () {
>    chmod a+rx *.pl *.sh
> @@ -40,6 +42,12 @@ do_install () {
>    cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
> }
>=20
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/tests/testbuild-linux ${D}${PTEST_PATH}/tests/
> +    cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/
> +}
> +
> ALTERNATIVE_PRIORITY =3D "100"
> ALTERNATIVE_${PN} =3D "ifup ifdown"
>=20
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


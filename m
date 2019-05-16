Return-Path: <oobitots@cisco.com>
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0327DEA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3174; q=dns/txt; s=iport;
	t=1557995531; x=1559205131;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=Aljy9XKSvpHjGJeeqENxEMHKiymDk92Vq8fFcCIUnpo=;
	b=cFmfGYKZko1qYsmKkjurxwVwjearJIayAfkm8L1FKjpoegIK0DLIFfIx
	VF6DUAZQ6m1U1AgtA2l/5jzL3r+eyq8vvNX/gWf29heoA0CG7N4vYVM82
	jYe9GoAYXjo/539m4LjvonIuXxnN2eAhziGM1C8WjHcAsEz9MhCR5up0h w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BAAACwHt1c/5BdJa1kHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUgYBAQsBghBpVDAoCpcOgSVomFOBewkBAQEMAQEfEAEBhECCLSM1CA4?=
	=?us-ascii?q?BAwEBBAEBAgEEbR0LhUsBBToRAT0CAQgYHhAyJQIEEwiDG4IKrFGDfwGGNYE?=
	=?us-ascii?q?zAYtOF4F/gRGDEj6ERIViBKdZCQIdgWyGIYw1I5VujDSVCgIRFYEwIQE1gVd?=
	=?us-ascii?q?wFYMnCYITFo4fQTEBj02BIQEB?=
X-IronPort-AV: E=Sophos;i="5.60,476,1549929600"; d="scan'208";a="273466269"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	16 May 2019 08:32:10 +0000
Received: from XCH-ALN-010.cisco.com (xch-aln-010.cisco.com [173.36.7.20])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id x4G8WA3E017791
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:32:10 GMT
Received: from xch-rcd-007.cisco.com (173.37.102.17) by XCH-ALN-010.cisco.com
	(173.36.7.20) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 16 May 2019 03:32:09 -0500
Received: from xch-rcd-007.cisco.com ([173.37.102.17]) by
	XCH-RCD-007.cisco.com ([173.37.102.17]) with mapi id 15.00.1473.003;
	Thu, 16 May 2019 03:32:09 -0500
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kexec-tools: Fix compilation with clang
Thread-Index: AQHU9Gk9aB2rYyJCzk6QwFBovLEDEQ==
Date: Thu, 16 May 2019 08:32:09 +0000
Message-ID: <a06cf453e2f54afbb2a1ccdaf325179f@XCH-RCD-007.cisco.com>
References: <20190416152935.25062-1-oobitots@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.63.15.143]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.20, xch-aln-010.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Subject: Re: [PATCH] kexec-tools: Fix compilation with clang
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
X-List-Received-Date: Thu, 16 May 2019 08:32:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any comments?=0A=
=0A=
Regards,=0A=
Oleksiy=0A=
=0A=
On 16.04.19 18:29, Oleksiy Obitotskyy wrote:=0A=
> clang assembler do not understand some directives e.g.=0A=
>=0A=
> ../kexec-tools-2.0.17/purgatory/arch/i386/entry32-16.S:23:2: error: unkno=
wn directive=0A=
> .arch i386=0A=
> ^ ../kexec-tools-2.0.17/purgatory/arch/i386/entry32-16.S:115:11: error: u=
nknown token in expression=0A=
> ljmp %cs:*(realdest - entry16)=0A=
> ^=0A=
>=0A=
> Force external assembler for purgatory and tests.=0A=
>=0A=
> Upstream-Status: Pending=0A=
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>=0A=
> ---=0A=
>  ..._64-Makefile-fix-assemble-with-clang.patch | 23 +++++++++++++++++++=
=0A=
>  .../kexec/kexec-tools_2.0.19.bb               |  2 ++=0A=
>  2 files changed, 25 insertions(+)=0A=
>  create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-=
x86_64-Makefile-fix-assemble-with-clang.patch=0A=
>=0A=
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-=
Makefile-fix-assemble-with-clang.patch b/meta/recipes-kernel/kexec/kexec-to=
ols/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch=0A=
> new file mode 100644=0A=
> index 0000000000..13f247982a=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefil=
e-fix-assemble-with-clang.patch=0A=
> @@ -0,0 +1,23 @@=0A=
> +--- a/purgatory/Makefile	2019-03-05 07:47:03.190429822 -0800=0A=
> ++++ b/purgatory/Makefile	2019-03-05 07:42:52.167623612 -0800=0A=
> +@@ -31,6 +31,9 @@ include $(srcdir)/purgatory/arch/x86_64/=0A=
> + =0A=
> + PURGATORY_SRCS+=3D$($(ARCH)_PURGATORY_SRCS)=0A=
> + =0A=
> ++PURGATORY_EXTRA_CFLAGS +=3D -no-integrated-as=0A=
> ++$(ARCH)_PURGATORY_EXTRA_CFLAGS +=3D -no-integrated-as=0A=
> ++=0A=
> + PURGATORY_OBJS =3D $(call objify, $(PURGATORY_SRCS)) purgatory/sha256.o=
=0A=
> + PURGATORY_DEPS =3D $(call depify, $(PURGATORY_OBJS))=0A=
> + =0A=
> +--- a/kexec_test/Makefile	2019-03-05 07:45:14.757353575 -0800=0A=
> ++++ b/kexec_test/Makefile	2019-03-05 07:45:57.567173264 -0800=0A=
> +@@ -17,6 +17,8 @@ endif=0A=
> + =0A=
> + ifeq ($(BUILD_KEXEC_TEST),yes)=0A=
> + =0A=
> ++CPPFLAGS +=3D -no-integrated-as=0A=
> ++=0A=
> + KEXEC_TEST_OBJS =3D $(call objify, $(KEXEC_TEST_SRCS))=0A=
> + KEXEC_TEST_DEPS =3D $(call depify, $(KEXEC_TEST_OBJS))=0A=
> + =0A=
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recip=
es-kernel/kexec/kexec-tools_2.0.19.bb=0A=
> index f65cd9f106..c229097d5b 100644=0A=
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb=0A=
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb=0A=
> @@ -20,6 +20,8 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/kex=
ec/kexec-tools-${PV}.tar.gz=0A=
>             file://0001-Disable-PIE-during-link.patch \=0A=
>             "=0A=
>  =0A=
> +SRC_URI_append_toolchain-clang =3D " file://0001-purgatory-x86_64-Makefi=
le-fix-assemble-with-clang.patch"=0A=
> +=0A=
>  SRC_URI[md5sum] =3D "052458f0a35c2a3b0d2302caa3318e9f"=0A=
>  SRC_URI[sha256sum] =3D "913c8dee918e5855a4ba60d609371390978144b4c8d15d64=
46ca0057b7bc5e58"=0A=
>  =0A=
=0A=


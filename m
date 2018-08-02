Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C486560557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 08:21:57 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id o11-v6so1462998wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 01:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=XsbRRgvlaDzUDmL0arR1zZCr7VmzXBxeONIssO2OPwo=;
	b=d1cafOZpleEDZK3zxLtnL0XH41KY1fWCuNobyOb6mqDGXgvec4Jp7pFm/c0a8I5CPL
	JcCz3/uFK9MgWczXBuZpAlfKb6p9rF5m0y6mW9kN4Nnr3uyhJ8040a0Ff9UHcTSQnan7
	8iaxBH5tzGXpvGLSD8ZqZfpBih5B0G5sOOW3ScPg1zMAbsRvyyuw13gtCgeA1QmYvgLs
	VqAWjjGFkg26TPHMqQN2im6y5QlRnlEH3nD+dt8qS3ls/bbdfP/2BrAdB0oEBVXd62a8
	vywGithnzQMXL7T44OJcdqsEflzA5BaIRhfv4+YiZgBa7tSUAXPIcSfCWJmTTdxXqcQt
	uP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=XsbRRgvlaDzUDmL0arR1zZCr7VmzXBxeONIssO2OPwo=;
	b=ZBbGmbnNSWJ+1DdBtydXqsfrNAMgnML0XfATwtIWKtZlElccnzVWlCRl4JGQlvtsBY
	jjg+nKCIwH//Eh7YJtniJ+7uJddJeeXbw0GQ4CCsYyVhwjwbolUdevBeYrrRWxsk5O9z
	GHHY0bQY5Yshg7cYGt/sKG3mbOJheRpMIl+bZZvg/IKqshebp8ajGaECF2QIZyNngbQv
	QOEWLkUUOfmawQ/Ld5j+U3iCeH8jBmcYJyG/z/61d52doHOQVZ4uvvZnzXlgaaRs2/Ya
	e+dhq/H+nLFoGpfx/VPkdPncdQ1iEB0Pc3cBuCaXrDcT87rhQKE3I8YPydOp7XUWHnSm
	+8NA==
X-Gm-Message-State: AOUpUlEsvU3o3bp1T7blkR8LOwPacOViVe0rn83a4H18NVZF5QHbMmTQ
	7nI0C8/2cUerW6gcNCK+HrIi/c4u
X-Google-Smtp-Source: AAOMgpf6DTLk24H2po68dC44raIPlalUd+mblEIeXIkYJf3RcsTmmEVJHLwOy7a+9V+e63wtcrpEoQ==
X-Received: by 2002:a1c:ec86:: with SMTP id h6-v6mr1221573wmi.53.1533198118342;
	Thu, 02 Aug 2018 01:21:58 -0700 (PDT)
Received: from [10.42.8.249] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	v124-v6sm1169259wma.18.2018.08.02.01.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Aug 2018 01:21:57 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <33B9AF0C-D9AF-4714-B28C-F45A66E398E7@gmail.com>
Date: Thu, 2 Aug 2018 10:21:56 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.9.1)
Subject: [PATCH 2/2] libxml-parser-perl: fix "...contains bad RPATH"
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
X-List-Received-Date: Thu, 02 Aug 2018 08:21:58 -0000
X-Groupsio-MsgNum: 114227
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5AAAA5FA-54AC-4606-814F-ABDD56035630";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_5AAAA5FA-54AC-4606-814F-ABDD56035630
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The perl distribution "XML-Parser" relies for configuration
on the tooling of Devel::CheckLib - which is not aware of
sysroot locations nor of reasonable compiler/link definitions
from outside.

This causes

    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA Issue: package =
libxml-parser-perl contains bad RPATH =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/recipe=
-sysroot/usr/lib in file =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packag=
es-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parse=
r/Expat/Expat.so
    package libxml-parser-perl contains bad RPATH =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/recipe=
-sysroot/usr/lib in file =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packag=
es-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parse=
r/Expat/Expat.so [rpaths]
    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA run found fatal =
errors. Please consider fixing them.
    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: Function failed: =
do_package_qa

It's strongly encouraged to the maintainer @toddr to rework the
toolchain for up to date environments.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb =
b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index c5e0ae6769..2ca8d506f4 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -19,7 +19,11 @@ inherit cpan ptest-perl
 # fix up sub MakeMaker project as arguments don't get propagated though
 # see https://rt.cpan.org/Public/Bug/Display.html?id=3D28632
 do_configure_append() {
-	sed 's:--sysroot=3D.*\(\s\|$\):--sysroot=3D${STAGING_DIR_TARGET} =
:g' -i Makefile Expat/Makefile
+	sed -E \
+	    -e 's:--sysroot=3D.*\(\s\|$\):--sysroot=3D${STAGING_DIR_TARGET=
} :g' \
+	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' =
\
+	    -e 's:LD_RUN_PATH ?=3D ?"?[^"]*"?::g' \
+	    -i Makefile Expat/Makefile
 	sed 's:^FULL_AR =3D .*:FULL_AR =3D ${AR}:g' -i Expat/Makefile
 	# make sure these two do not build in parallel
 	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i =
Expat/Makefile
--
2.17.1

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_5AAAA5FA-54AC-4606-814F-ABDD56035630
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAltivyQACgkQRJmWrtzl
Cp388BAArJfL93lW8F+mrE9D6xGRJ952lMgcV69InbiyeLxZUVDMzZvIZy0ymrOE
zMVoZGhSB2hTUwmtaLMR0OaLAjj5izkDjTdRcyuX9yeCP0P5vFGEEKcI8Nk5vokU
T2ATK9s/E9chcm0zy+q86fDIvQ2kMkdt9uQPh6rP9tELjmW/DE4QiuRelu8M41k3
r6PCZn4pB09LNfZSDrs88EM1uwcWVyCUCvvw50BpTvSGjakAO914Ei3EwxRrbJc1
RWz77E2IbwUmod5hP84j+/9RcvWVDo4uVq/FZTroPQoalWTakqG6k5p6blWGMCmX
UYeQ6a3WBgpaYf51WOWf9bTrXVGKAg8nDnux4AiPesWqMGvVlz6GwIaQ80sOHNzx
iL/+OJ7QEDd6IN6/LEX2jMUigoxwUXHtIQ6Dujg+yOcOXCWElIuemPFRwOIEOv6V
Eft4v74O/pbH2niqLRvfih7SRXezOX5reYddu9RIhW2F3Z9uQ8GQ1YFVY5rqlrXa
7I5YKkRXOwHMy7Az2SOqK8Q3cHFk/iT5POFQZpoOHqXEKbh++AC7uahmnjttbxai
JYjgJhoOWqFXBOi0kefojXmjxfIZxIbh3gChUHmoMTmEQG8IQxpU7p2jEjzkiSOM
3KqHS4WawEhWtp1wEwIcppWSzSDA2wfyaIr+Q9q4mtmC25gaGow=
=EAHH
-----END PGP SIGNATURE-----

--Apple-Mail=_5AAAA5FA-54AC-4606-814F-ABDD56035630--

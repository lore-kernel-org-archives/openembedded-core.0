Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 557A37F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:34 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b9so24792642pgk.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=semGvceRmDuX7FntPOWH59mK7Gl9kwubptYYf2tvmJc=;
	b=gxxPoITgQGfnX0NV8xbrcENNw+mLwjITTH1uzoYAiMCfd8hv+wKHKm1CtOdCDukK5l
	5qGz5ECr3ATKX/9wLm1gR/KQp7EW9G0ilsSL6jQYiV4+48Kf2OhALQdxDePW43y9QMW0
	wjgmeH38DoPQTn4i0VsLkEQ4on7nTpCpaAH+HrWIakhwFPGS9m6vnPoqsTvVZRaAW/CJ
	y3kq2MLuL9VCvbxBsRg3QWWg85hiIJQguwj3wmo/P/EQISyxNLmATzeWs/O8jJwn2fiw
	hR9mO18aC7Vl/M0RXD/+uY/5v7LJwJb7YH8oBCeroFdYT8MX/QSb8x19mGIFPo8DGwng
	xWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=semGvceRmDuX7FntPOWH59mK7Gl9kwubptYYf2tvmJc=;
	b=R7951BhqyKJgnE0D4cNDl9hRWrp9kU5T1Wn4Emqzg9Dnk9HHInMYeGBRZIyMmBbI4R
	Z42dcEJdkRec4K7JV0CiP0P27/YRmcnOq9kvfKVRvCVnbNY6HVEeSJMqTuyJCB3h3g5h
	0AjqaoNIMG7qqpZoJDSYXNQIxeT0YpmHpQdeLedjIlwPOjRDB7CwrI71dvxKOKh4Ndif
	JzJ5liDByaOwwVUTm4NVuiHC6MEjIvn9vTBIXIIYJyMr0aVNr3pE+5I7OD6l2qjBzFMI
	IagyaTpDRbKPqKbC2ucMVGC+6ocA3bidiwQ8EpdtPc4OWYeNunoofthqygIa5b69XbfP
	1KZg==
X-Gm-Message-State: APjAAAX4pI8RnfS96sjnRL+E4b8F87irpkNBLpwZmfhtyMEtRv8h2fvK
	JlRu3Jhl7BbXRZjg35l3F0Pttb+TxSU=
X-Google-Smtp-Source: APXvYqx4uxMXR3+Yb16LKSJ2g1WkXv/KoJd6Olm0Dz2jFUI3qzPSRyQltb7p1AID0JGBHEO4u3jg1A==
X-Received: by 2002:a63:3409:: with SMTP id b9mr102435911pga.320.1578155195286;
	Sat, 04 Jan 2020 08:26:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:05 -0800
Message-Id: <df689f9fc4a76491f9611b94287f3f17d146ba1c.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 24/29] python3: RDEPEND on libgcc
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:34 -0000

From: Joshua Watt <jpewhacker@gmail.com>

=help>
List-Subscribe:
 <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
 <mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Sender: openembedded-core-bounces@lists.openembedded.org
Errors-To: openembedded-core-bounces@lists.openembedded.org
X-Virus-Scanned: clamav-milter 0.101.4 at dan
X-Virus-Status: Clean
X-Evolution-Source: 1525863794.3857.16@hex
Content-Transfer-Encoding: 8bit

Python uses features of glibc that require it to dynamically load (i.e.
dlopen()) libgcc_s at runtime. However, since this isn't a link time
dependency, it doesn't get picked up automatically by bitbake so
manually add it to RDEPENDS.

There is an outstanding bug in Python to make it explicitly link against
libgcc at link time which would remove the need for this. See:
https://bugs.python.org/issue37395

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df107f3a149b1e88d9f869e7ff87950ccf5aaee0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index d3706cdf64..407c5a2bd9 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -322,6 +322,8 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
+RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1



Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id F2BD77E692
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:48 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id t16so1646746pfe.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vt3k/KwEIzIPAWv/ah4tguWFDOLXf7/zEaeyrWZUM1k=;
	b=biJVI56j7A69wXCFg7ImR6JDruA1f7IiY71TvpNkKy7Htyf7hAR3UXpYEjFcgkIehl
	3odTSUezUrqqyonc/2ZvMySe2p4k89kf0UoyPhyid0sToIfnCAPPky2x+G96wVh6LXt3
	QNF6ikbviCSejgCiZAT8/R//iU4mUcRqRIcDuY1vt5AJ6Om2IME9/uxJHrRSfEpQlI5o
	BmeXWRnE+Ec1dyyaBi/Gq66JfjTYehBkr6b49qjVxF6Nq9qGspRUeEipGT8UxJKL6Rsx
	oJEPIrh4HUO0zaO8AM6G4rs7v7e2elIFUOKZdknLPUe+gq4RQq+iB1icuKqTaTb4oPp6
	g3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vt3k/KwEIzIPAWv/ah4tguWFDOLXf7/zEaeyrWZUM1k=;
	b=T6T2HVOrzfyU1T1gljBdLPVI5/pQPrytiOgWNniOnXZavDjEeaK/awlSuNFTHyoxJC
	O+utW7wmqSyzKYy92YepDSX++yfju5yg+lqkAy3mb/3xENKC2waVBsQNWjwDTT55VKaZ
	dimOoyNeRyAzYHk5DFU9sghUqbmfzjaCKiidH0856++vUozQHFdC/hzweM85fGPzQWOI
	082nWDezJEHjoWB7G0iSg1LRpJG6O1Etvo3iz9TSgITJTjrOKOPfKnYv/M/22og4T170
	ofhR+tbWs7a8L7ug1i1PrlEX904IZlEagvMbDesjFjMsuS2Pxujagg4sCUcC1tbK/4vT
	M0Cw==
X-Gm-Message-State: APjAAAUDQnujxbMoL4ygoOLQNNQGYjNm23qLh5a4Z/pHovjp/fa0sSYG
	cQaMvHvQ+Bbbmd73hWJdy2PywggL31k=
X-Google-Smtp-Source: APXvYqzwlODGSBE2esHB/tymnig0sWLqvNmPJ8x6qlcnSmwQOJU9WmPwoxcKR40E8BsmNybA9Yy8sg==
X-Received: by 2002:a17:90a:206a:: with SMTP id n97mr86565pjc.10.1561568029773;
	Wed, 26 Jun 2019 09:53:49 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:16 -0700
Message-Id: <4e40da53851c550f1a38eff5737d4b69c8cd0afb.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 15/25] go: update to minor update 1.11.10
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:49 -0000

From: Armin Kuster <akuster@mvista.com>

Source: golang.org
MR: 97548,
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/issues?q=milestone%3AGo1.11.5
ChangeID: 54377c454f038a41bf35dd447a784e3e66db6268
Description:

Bug fix updates only
https://golang.org/doc/devel/release.html#go1.11

Fixes:
Affects <= 1.11.6
CVE-2019-6486
CVE-2019-9741

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/go/go-1.11.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/go/go-1.11.inc
index d03e26c..401e71f 100644
--- a/meta/recipes-devtools/go/go-1.11.inc
+++ b/meta/recipes-devtools/go/go-1.11.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.11"
-GO_MINOR = ".4"
+GO_MINOR = ".10"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "a77697673215be465d1b583680ef2318"
-SRC_URI[main.sha256sum] = "4cfd42720a6b1e79a8024895fa6607b69972e8e32446df76d6ce79801bbadb15"
+SRC_URI[main.md5sum] = "f2d2e44b9954b827daa8ad4d936a7a82"
+SRC_URI[main.sha256sum] = "df27e96a9d1d362c46ecd975f1faa56b8c300f5c529074e9ea79bdd885493c1b"
-- 
2.7.4



Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id AFED574DA6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:42 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 82-v6so16446259pge.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9j1gxdZD9kdGLhTEa2htQCbYO69/4Mz88479tDh3cig=;
	b=oQI/umFIWLXTrvjXR/K0w5jSIuvkBWo0J6tus9IDa+JdLMG/JZ1yXpaD2JOAxj3h8Z
	m7CGzCbQV+HfcwUDZyyVU4bT727Z6VnBBwNmFJyPeV5yac386Wql0xzu7WX9Fdm7GNgE
	7senCVFkfQ1ulK0D5bqXKElohSWCbPTjX/MpeymIRM3xqKA5Y37STeXoB54nPzSpRPIP
	IDCKH8PMzCcuUr/X254noGQXPzgAK4Fa9dpfE91WOyoIvkIRWWviDNQ1sboZAd3UMhlL
	MoCUy+zehT48VRFfdzlx+NQwTzoZ/YwCtAnsOrZEfkB9goY7hNOt0Lm7949LcMIMmWNr
	6x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9j1gxdZD9kdGLhTEa2htQCbYO69/4Mz88479tDh3cig=;
	b=a4oDfrJ4eSi1T//rvBebcC1VSFI1IjEz8knlq/OG1/XfmPxTN+uOsoSA4tN4Mcz0/3
	2vTTl3TByXc8iMUNq/LbIRWSIV0bTChwCJTAcvA3x5ZV5Lfk1Rq2IzCYMp8e+0r0aC7/
	o7rNxM8Ql1jYySxQoCz9zY47ZMfTaDV9+JUE5n2tKb+6wL9WdAA4spBLa7TR5d1DZeUB
	+xl+UrcR0GSaKo6QedU7LcZzvmraLowYtNyYIGVQXJ4YpYczDCJctEtDHbd3xYdZUX/r
	vBgT9Za5CByLkS+JjxNcBYHL+xRRt0m2e3OyGdUCW6Zq++gIaOB7V4W5nvr8FFKMmWCD
	GU6g==
X-Gm-Message-State: ALQs6tBZDM+QxRA9+7/ntCnDOycAHMVt4/ycC51CZBdC5jEIenAJiVab
	eV3RHOLU+fWnDQPKUXGcg9yn1g==
X-Google-Smtp-Source: AB8JxZprTdvB9vFax3VsXULBXxG9Y8SvSNiey8855GO7i4A5I4v5weE84OE2tn+vP3XbJwgmoncCUA==
X-Received: by 2002:a63:a84f:: with SMTP id
	i15-v6mr24092687pgp.367.1525479283707; 
	Fri, 04 May 2018 17:14:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:12 -0700
Message-Id: <2102ede34551334c34fe9333ea069e9ef1730bfd.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 18/27] perl: Account for libnsl being dropped from glibc
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
X-List-Received-Date: Sat, 05 May 2018 00:14:42 -0000

-lnsl needs to be removed even on glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 53a426289a..6b16689386 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -145,7 +145,6 @@ do_configure() {
                        -e "s,\(i_fcntl=\)'undef',\1'define',g" \
                        -e "s,\(h_fcntl=\)'false',\1'true',g" \
                        -e "s,-fstack-protector,-fno-stack-protector,g" \
-                       -e "s,-lnsl,,g" \
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
@@ -158,6 +157,7 @@ do_configure() {
                -e "s,@BASELIBDIR@,${base_libdir},g" \
                -e "s,@EXECPREFIX@,${exec_prefix},g" \
                -e 's,@USRBIN@,${bindir},g' \
+               -e "s,-lnsl,,g" \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
 	case "${TARGET_ARCH}" in
-- 
2.17.0



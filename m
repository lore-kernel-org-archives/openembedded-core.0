Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3703D78F3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:50:54 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b11-v6so1055036pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B9hpBtS8JJ0ZQbrNYWQsxxKN/p2a+ucuMaTKJYHRus8=;
	b=jPrkeIDPG/N8LHGfigd6V/f+ZCTccBvQDElxGA6cjBxHg0wxRy3UfeB89s51S5EdS4
	cA8/YRc64H+lcL8qkNhkPmbvs+2M7rtJPdHB4vHqO62m3dwHSCQRakINz96c4Odm7BhF
	x6cz7KR8xm+aXtdbhI1+NmQmBb5xo2TkFy0zYUjKnQrsPPSkajmm2SpWdtAfP6byq/BX
	weCFbuH1cPmODz9gWQ67C3bM7slYMfAVzKUxatZAljmiGviSNrx9qNbW5BxVDdJXSqLo
	e23WYcoKbD5iMZ+uF2ByRLTFMsw5XHPegor3/vNCrshOnF7PoTLb+39Xd0/4z+yV8dOL
	TC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B9hpBtS8JJ0ZQbrNYWQsxxKN/p2a+ucuMaTKJYHRus8=;
	b=do/Yd+Dawh6fbFD546VDjjNOCFXxw/n1BOgPBz5/GTeaO0V+7jyK8kO3bpTYCR1A3V
	ePNWoC7TZHNHIkbgIIX4Ew1ogiLLV5tLj0liqIPa65NSfvDIg9eV2+7BhMaSHWziz+Qw
	JHBTO8J1nEarO85LsbDlnzXUswJdabT0+utaEAYLS54ao3iWvYFDiq/iRBpcTIr/QDDV
	k6I7DlZKMoqgG0JYpYma5XHaQUbf7G7lC9cqamj3HY475UdKy32npkJjwBiQE8y6Gg+T
	qZyiqHSDiS9viYVarec5IN+ojKVmbyuEfOpHlTXbVP/wLCJfumq4F0OsTqpcNNz64D3t
	lP4w==
X-Gm-Message-State: APzg51B18gIuF4b3JG5WHzTDqwdWFbumcPIiWtYjdlz5+hDm6awypspk
	S3lJAZ4ycGwEozKTBkidvO+Cu5mq
X-Google-Smtp-Source: ANB0VdZ8sfrG+boZB3pSjmggvzz0l2TwK7aWprE0fIDW8DcSozGcFtVj4EWAomOpZfuZgTld7myzwA==
X-Received: by 2002:a63:a5c:: with SMTP id
	z28-v6mr2411840pgk.209.1535478655130; 
	Tue, 28 Aug 2018 10:50:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	g184-v6sm3330295pgc.22.2018.08.28.10.50.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 10:50:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 10:50:40 -0700
Message-Id: <62f7c23173a051958c2cf6e8d7a4fce9bd0ef279.1535478536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535478536.git.raj.khem@gmail.com>
References: <cover.1535478536.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] gpgme: Inherit distutils3-base
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
X-List-Received-Date: Tue, 28 Aug 2018 17:50:54 -0000

its building a module therefore its important to provide correct cross
build environment, distutils3-base automatically inherits python3native
this is seen when using clang where it tried to link with gcc since the
environment falls back to builtin LDSHARED variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.11.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
index 151fc03f55..ac9fccf133 100644
--- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
@@ -48,8 +48,8 @@ LANGUAGES ?= "${DEFAULT_LANGUAGES}"
 LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
 LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
 
-PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
-PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
+PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' distutils-base', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' distutils3-base', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
-- 
2.18.0



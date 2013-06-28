Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id B6D8A6AF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:32 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so2724240pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=i1J6LFts+fyH7YSMuLsIyTFtlSDEiA8zo30AFBCA2E4=;
	b=BKsfs6Z2W7/Nj21PMcAjWTDtjtXa1ojmY8hiJxggsIK+Lbfo82zy9yaqeZ2aTMJoJo
	fWsJB3t8sp1s0OgilPB2eGZC4ryRuZLBH0XEq6346V5A6wa6FCBkDJaB8Ikz9R7ar1iy
	p7wP29IAXFPY/dfKI+hcxBTj7P9dXbJ2yugnm1tVDhYBbgaodgM4Z1xn9d/Rfxg2xMOX
	uK2xt74EjQJDAZrYeMIzLH0ZXMM3RTljWDttb12lRi+feoaoF4cqXyqiiIFF6c/Vq15H
	9FdCZ2KBnGQA7eRJ9i0sEd1ujXDg+KtXZy3Bz58C2KTf6y0UPMWmIdo5RD4oE4fXKA2Z
	bsng==
X-Received: by 10.66.162.102 with SMTP id xz6mr13611416pab.0.1372457073987;
	Fri, 28 Jun 2013 15:04:33 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.33 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:53 -0700
Message-Id: <83fd00797ab95d678d838e5a54b95a188dbeaa80.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 08/24] setuptools3.bbclass: Remove useless multiline comment
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/setuptools3.bbclass |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index 601c0f6..40c18c8 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -6,5 +6,3 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
-
-#    --single-version-externally-managed \
-- 
1.7.9.5



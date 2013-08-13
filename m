Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 396A16AE6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:11:07 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so3944340eak.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 03:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kI04uphKR7Eh2F1h0Okw/psKVuhfyDzTTDK+fHFuT2U=;
	b=m0SrrOpLuzENtNpxTL7ULFipLpCAyIZmhJfk5ksKaDwRWfpOhoov6+zIyCJVqw0j1D
	dCekyrxO9G3/SXsu8XPKMtlu6QQjo6UVi7mre10dPC8BYGJ1WK2nOdIx/l5PsOpznw02
	gnuvLgozyHZ5K7YeCgsrZBsvrDnfjKXks4gW2exi4Yj01ufJNjgDi7Ui3s7ZvqWIJI5U
	gYYSk9qh26i9PBC3VxjD6ocSDtHeUSlo7qNJccxCMCEVqs7LkNQxVvghUbmXS8mt/AXr
	ZvhLXyjOgZebJGdKU29b2LWRhuugPW7ka16IwvVG2tPFuR+JGo9Z8RKl4Fq4nBhsVxO9
	PgYw==
X-Gm-Message-State: ALoCoQnYYDtBTs1NqoswaQ+3rU7Tcm6h2urY1AAU5SK1J60q4ntF6mRa+xcjar1QdYfZbrbnAJLC
X-Received: by 10.14.114.68 with SMTP id b44mr2105666eeh.60.1376388667270;
	Tue, 13 Aug 2013 03:11:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t6sm65098119eel.12.2013.08.13.03.11.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 03:11:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 11:10:59 +0100
Message-Id: <df9d47860ec90d7f77ece202832af3a65103b7cb.1376388241.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1376388241.git.ross.burton@intel.com>
References: <cover.1376388241.git.ross.burton@intel.com>
In-Reply-To: <cover.1376388241.git.ross.burton@intel.com>
References: <cover.1376388241.git.ross.burton@intel.com>
Subject: [PATCH 1/2] bitbake.conf: define WORKDIR in terms of BASE_WORKDIR
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
X-List-Received-Date: Tue, 13 Aug 2013 10:11:07 -0000

To make it easier to move WORKDIR, define it using the new variable
BASE_WORKDIR, which is the root of the work directory.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 07eb473..9e2696b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -338,8 +338,8 @@ HGDIR = "${CO_DIR}/hg"
 STAMPS_DIR ?= "${TMPDIR}/stamps"
 STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
-WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
+BASE_WORKDIR ?= "${TMPDIR}/work"
+WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
-- 
1.7.10.4



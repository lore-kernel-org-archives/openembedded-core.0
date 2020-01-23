Return-Path: <danismostlikely@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 340947FDA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 21:45:24 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id u10so2269059qvi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=C1vXqmPddkIi8taf+JB5WNo5R0FPFFlvMSJ0R2X3NZ4=;
	b=Ia83I/WH22WtriH3v5A2O5OrbgZ6J0xHEHnEYuRW7rTtpFddWI8KNl557MPapQMOhG
	Zqx+tEnfNSP1YEv3s3VZ4vPg6OCs7tgAxw/Fckr9WyeHfqWF/olfN1KYGG5i5hFCyGT1
	BmmHZgcco2VU0KdyyLDeDpM0EKWEo9FZsTH9UddG3dPoNadn5+Bjd4k2wi1IFo3JydW+
	BcqTpTQrX7PwhLtW66dWKL++Abz8FOloo4oCJqc+qqXH4aZ9OZH8sULPp2jinHlx8qNV
	TvqVFwNuacvPKoqENUwKRG+W3//DeazGThDlpGhawOnERwOEAr+RqX+/Q817e/pp3aw0
	qjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C1vXqmPddkIi8taf+JB5WNo5R0FPFFlvMSJ0R2X3NZ4=;
	b=pGyzPNT8aHKQNwGTXe8/rDMtLD+N3XrwBwYjgtJRQ1EIj9mppgBgbZzfC8e6plG1/e
	49bFdfsH4p7Ery8BjQNf1pmhMTFJ7sBStHq37GLKfIDLQ510RrsGO1FwRMf7Wbl1sXte
	McXY6O2kJl9BgvDRNibcubxaTG9UpedQrvYHiX5U9eWaAurDrlB3BznGQM7xK2UisryT
	NdT5JmvY1QMDtVch8v8KxlDwXS9RiuGDIwG0oGPwH3nRtvkMvvRcwxt0I63IBx0bNXLU
	mWRczu6H2+RvMf3R3xJnhLTFMtEICh3S1K9h/sLbBwNDCsUCDLufxk8t+XMuNycKMY6/
	9sFA==
X-Gm-Message-State: APjAAAU05Nqtj3me2D4jzizsSwzGF7/j4fAz4AKqHiAx67JFLOTn1KCQ
	GHMYMI31M5y7kRC7q+VRNmWpaKaq
X-Google-Smtp-Source: APXvYqzH6jybq0g/0SaPVX1UkNbFVQBsQ2k8T9xYIJ7iRzOsd9hu5874KV2oTH3MKVEbIxtyz4vMag==
X-Received: by 2002:ad4:53a5:: with SMTP id j5mr18798180qvv.239.1579815924815; 
	Thu, 23 Jan 2020 13:45:24 -0800 (PST)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	d25sm1706243qkk.77.2020.01.23.13.45.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 13:45:23 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 15:44:43 -0600
Message-Id: <20200123214443.1431756-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123214443.1431756-1-danismostlikely@gmail.com>
References: <20200123203037.693694-1-danismostlikely@gmail.com>
	<20200123214443.1431756-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] buildhistory: Allow customising buildhistory tags
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
X-List-Received-Date: Thu, 23 Jan 2020 21:45:24 -0000
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Allow setting custom buildhistory tag prefixes. This allows multiple
build directories to share one buildhistory git repository with multiple
worktrees.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/buildhistory.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index affdf272d7..eb7295570d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -40,6 +40,7 @@ BUILDHISTORY_SDK_FILES ?= "conf/local.conf conf/bblayers.conf conf/auto.conf con
 BUILDHISTORY_COMMIT ?= "1"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
+BUILDHISTORY_TAG ?= "build"
 
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
 # We want to avoid influencing the signatures of sstate tasks - first the function itself:
@@ -824,9 +825,9 @@ END
 		if [ ! -e .git ] ; then
 			git init -q
 		else
-			git tag -f build-minus-3 build-minus-2 > /dev/null 2>&1 || true
-			git tag -f build-minus-2 build-minus-1 > /dev/null 2>&1 || true
-			git tag -f build-minus-1 > /dev/null 2>&1 || true
+			git tag -f ${BUILDHISTORY_TAG}-minus-3 ${BUILDHISTORY_TAG}-minus-2 > /dev/null 2>&1 || true
+			git tag -f ${BUILDHISTORY_TAG}-minus-2 ${BUILDHISTORY_TAG}-minus-1 > /dev/null 2>&1 || true
+			git tag -f ${BUILDHISTORY_TAG}-minus-1 > /dev/null 2>&1 || true
 		fi
 
 		check_git_config
-- 
2.24.1



Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5F960556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:00:11 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so4699645wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2aK+OtV3yty9VIMX8MTAfcqQwp/ismeCdO01rWWRxrw=;
	b=cQM408dKg8RqvW1jcI9EgOzNu4CHYaRXKt9AndNt0ej43syoFCmCccWUYwc1zijV0r
	4EwcKNi9sner04gO+pbUf25KE/yOorhLya4R9kcIsAi3xQmudBNOSnHb7FLJFPxZnlX0
	Sxn0nBjleT6bw+TbtZSeb9N3qeQ+InCKNnnST9rCHMtXVisMylEnw/diuWgKonBsjQTf
	8vqnzdImJJDCQuT97ePLXnuyQPkgXqqrPxeEuD8tMxrTOg7IzBTYVk5TLcEUB+2mGMB8
	3m0L0Ex25riHb4u12W3E2zCwOy96DC2hAbMbVtUMpYVRJ8R7BUKEAylRnElH3mhfcgwP
	8igw==
X-Received: by 10.180.8.98 with SMTP id q2mr10079638wia.80.1423807212627;
	Thu, 12 Feb 2015 22:00:12 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id u9sm8547638wjy.37.2015.02.12.22.00.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 22:00:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 06:59:51 +0100
Message-Id: <1423807195-7087-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] libassuan: add native build
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
X-List-Received-Date: Fri, 13 Feb 2015 06:00:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libassuan-native is required for gpgme-native - introduced in next patch

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/libassuan/libassuan_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libassuan/libassuan_2.2.0.bb b/meta/recipes-support/libassuan/libassuan_2.2.0.bb
index 5fc8b8c..d3a61cc 100644
--- a/meta/recipes-support/libassuan/libassuan_2.2.0.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.2.0.bb
@@ -24,3 +24,5 @@ do_configure_prepend () {
 	# Else these could be used in prefernce to those in aclocal-copy
 	rm -f ${S}/m4/*.m4
 }
+
+BBCLASSEXTEND = "native"
-- 
1.9.3



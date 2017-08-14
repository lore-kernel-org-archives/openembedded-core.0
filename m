Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C8CDE77A61
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 08:33:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so13625393wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ik8xhbFj1eWuCYmHk6se85V2mv1p8DT6+g49I0lWRn8=;
	b=Fecc222Cfz4cSZvjRB2Dz67bhG0P1j26rlMu3AJKIXjTjS7p3IwNPTO5uPttxuCNYu
	IxwukpmeYrtabpU5tKWzxcT70RTf6LGbPdUYzkFn2eMGg32lMYiKShIoacklSrt+AVwb
	dxkSVMh8KbwBCx0Lh1zfZk3TuEJDn+ceFY0HputIjfVET8JUzqCEFdw9QJ5hnlf7R6LT
	HLN/tUvDxCJDuKVyN4P2QsxNYyZ66FSMqAga+XBihtbW0fd3dhSIqcmyOZ89vCISeKnS
	BpwGOtetlikTXx10SQFDntfqD47qMyySZQQOqSPx7qefPJ0VphrWrQmzdqF/pyLTshAs
	bMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ik8xhbFj1eWuCYmHk6se85V2mv1p8DT6+g49I0lWRn8=;
	b=hQDg+8CGbgMPwkRTWcmIEocLMbOJO9M0271zW6H2KAxIRYHRVSr6n3psI9F7u3J7Sy
	XYW010mzZGTVtYUn1Tn6p0d0UojbbBuk0TaF1BdOb1f2SwH/zDM1evKTrq1UYp9Y1Rf0
	qZDBf0if7Z7nDO8iAEP4Ci0/3tVOs+t2N3cOrNbemj3jacTudQn2UKfqwAqqe57bnyBa
	sf8XXgcVH7bqP8iJDFf8lEQm5zmFtpbsLWO6ggOd2/zzmtM+cM5FCR1Gv7iPx0THeAlJ
	bkf1aHRFT508QEXtGVYOZsLmi95FU2lx8QLaDZ2CMGHJ2AVmLKPVTa0QaAXbpZ7ZgDBh
	ww4Q==
X-Gm-Message-State: AHYfb5ieXFN38fo1kghi8NG3zEJzQK7ua/FDw7s1CZ5GCp6TL5wzvOzM
	k+WDj37/6OxgSnwj
X-Received: by 10.80.195.193 with SMTP id i1mr23458406edf.241.1502699586406;
	Mon, 14 Aug 2017 01:33:06 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.240])
	by smtp.gmail.com with ESMTPSA id s3sm4784652edb.28.2017.08.14.01.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 01:33:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:32:59 +0200
Message-Id: <1502699579-30366-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] packagefeed-stability.bbclass: change a bb.plain to bb.note
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
X-List-Received-Date: Mon, 14 Aug 2017 08:33:06 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

I could see dozens of "Copying packages for recipe..." messages on the
console during a image build, this is sort of annoying. I would like
them to be dumped into the task log instead, so I can get a cleaner
console and would not miss real important messages.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/packagefeed-stability.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index c0e9be5..4837779 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -189,7 +189,7 @@ def package_compare_impl(pkgtype, d):
 
     # Remove all the old files and copy again if docopy
     if docopy:
-        bb.plain('Copying packages for recipe %s' % pn)
+        bb.note('Copying packages for recipe %s' % pn)
         pcmanifest = os.path.join(prepath, d.expand('pkg-compare-manifest-${MULTIMACH_TARGET_SYS}-${PN}'))
         try:
             with open(pcmanifest, 'r') as f:
-- 
2.7.4



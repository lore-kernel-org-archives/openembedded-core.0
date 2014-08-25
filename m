Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id A3EC06ACBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:47:05 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so22335921pad.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KQukv1TDZyU+vX/Wqp60tCl2X3c2nnqE+J8yg5ThrQo=;
	b=Th1hjkBW4Fw9uIde5bwsHN/e/6xGVU9Ok50dkqgYtcZf9Gf/YZrAOMeO2fVgWledC6
	txJkE9xLbjteTnkjutWu5tMMTvlN5hf7EgedgvNNc9b5OsR9pwKj5+bDdymvkORhYTfN
	rLMqAt59+RT5IIJjK7ajZeQA/aOApg2kCjCye7m2ET8X6U1t+yyNCarLDheEi4VtHzhX
	dMXm0O+ldYbQAGFcSftUKzr09fJHHfmuqZjgCk6gLkJzm3huBtqvngwsw8KOYnL+UYu0
	t5HM6xFAuYjCXpln2YqDcXPLGG1+rbchVkAggSB1Y3cxmTKXYXFkfRFXK3idHNmF/pXd
	07ag==
X-Received: by 10.66.97.99 with SMTP id dz3mr32237084pab.71.1409006826897;
	Mon, 25 Aug 2014 15:47:06 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id j5sm1513440pdp.9.2014.08.25.15.47.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 15:47:05 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:46:56 -0700
Message-Id: <ef9b349c3b2f16c96a386054212baebdd9722c1b.1409006757.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409006757.git.chris_larson@mentor.com>
References: <cover.1409006757.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409006757.git.chris_larson@mentor.com>
References: <cover.1409006757.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] sanity: handle both \n and \n in mirror vars
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
X-List-Received-Date: Mon, 25 Aug 2014 22:47:08 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index dbcc26b..7cfc4be 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -759,7 +759,7 @@ def check_sanity_everybuild(status, d):
         'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn://', \
         'bzr://', 'cvs://']
     for mir_type in mir_types:
-        mirros = (d.getVar(mir_type, True) or '').split('\\n')
+        mirros = (d.getVar(mir_type, True) or '').replace('\\n', '\n').split('\n')
         for mir in mirros:
             mir_list = mir.split()
             # Should be two members.
-- 
1.8.3.4



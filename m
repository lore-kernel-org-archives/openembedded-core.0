Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 959497F848
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:47 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k1so278277pgg.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=duxQDG8OK/jynCSpyBfTGHs7wKcqkXYCfCD9PLM05Gk=;
	b=eP/vcaOHAWTVfhLw5xikAKFZvsO6tbMzQpucFaCzjxEoj1J0uaJ2/9SMPlMLXZcoyy
	4HRbOvetVJI5Ty4/Wnr6YlGPl5Kc5tlbMre7KjQMt0oXa8c+qp9oCF/Lg6CRhmDjI0Qe
	+2X+qvwdpOOUwZSLfLlpzXEu51qoZh7y59yirfffCsTNPP8pq9XjxZz8HChyJe+Uj0qx
	Z55fIQkctxx8/F1gydg5wxPTqfw6oyZGlYZi9EkVd6MQyZSuUpcX82Ni9qI8Pkq+U40Q
	mwBOnfUKfK+w/OhuSBVr0W7o1uCc32cNVPOIYnMTeMGogA8j7VHrWKtDvClumygvvUoa
	noow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=duxQDG8OK/jynCSpyBfTGHs7wKcqkXYCfCD9PLM05Gk=;
	b=IkinO9itlHUbA/1OoeDgxBWx3CFvn9jEKuJDdVN0GbV0dNEohr3ZN0TRmIgr4B9Ypn
	+XYwW8CsuQT4wxbMTPwqkqgAlT5M5eZH9eM5mwGLfk6SYPPOJ5WvaCXgBLo8AoyYFVDf
	Pi2b04cZcLXSSmlRgox2rUQNjxjATvFfp92Pg82mEO77X6vw0RMomiyuD7fOipU2LDo8
	ja0oPuOfMwVMeDt1S//lKn8sVBkpBD1Dbv8Ido5mXijsZE8mukOJ4Qcw50Dc7IxnQUuO
	vqQKmQjQ6IMiHfSWE6NepQeWBKzpG5RkkBdrA0xQN5qm+UICsNyNklSlFgiFblqHAaW2
	soMQ==
X-Gm-Message-State: APjAAAVlj9eMvM+TGYwRmg4t+lniDja5vMX32pil1X1XnOhkUeelM59x
	7HYNF/wPLB3f4v1VjDUeiRbQ2NEr
X-Google-Smtp-Source: APXvYqxoCclPChUZd9AEPvss6ZZoATnhPny8pgozt9pr2iSFiQVVAk9pL8jsIvN8RLwUN6761Q1b3g==
X-Received: by 2002:a62:1c8:: with SMTP id 191mr5189345pfb.152.1573659168586; 
	Wed, 13 Nov 2019 07:32:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:05 -0800
Message-Id: <6b5cadd1a5822641285946f7e2ad56e294658621.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 23/31] cve-check: failure to parse versions should be more visible
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:48 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f87bcc9..1c8b222 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -222,7 +222,7 @@ def check_cves(d, patched_cves):
                             to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
                             to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
                             to_append_start = False
                     else:
@@ -233,7 +233,7 @@ def check_cves(d, patched_cves):
                             to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
                             to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
                             to_append_end = False
                     else:
-- 
2.7.4



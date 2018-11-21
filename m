Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCA56C513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 13:57:43 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c14so164434wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 05:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qgCIqcsEjYV4uAm4mWiyuCqT8pQx7/icecLnny08uJs=;
	b=l4Pn24aNgKIDAHBwhsGr1XR9n4ZtDnGFc409X7T+erXuNObfyEYcOHVxKuraJ2VYp6
	+Goo7yAi5D9/jJb5lkGbpUy5Szn5qMWk+12O8S4wtF8+Rx4egZKp/TzKpsgGwce/5HyV
	bq11yhES3TEXpkc5HtnFH+VcsgkUwI06igVe99TsLJKb9kpT7+rdUs3C+xkMAD2JDqUD
	6QdKc8wMdCO7N8OTGoDVPfCrkwirnHaJyXdq7eeiBqQrC7CkmPseChe1utf9Mgr8DhDM
	55alREi8BX/WhsTr2lqAV/z95yJ3SPf7EJ9suWx7Y3aTXUCkwBI2soeLX4nhtW+gFWQc
	ifFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qgCIqcsEjYV4uAm4mWiyuCqT8pQx7/icecLnny08uJs=;
	b=uCUlvzb9aKRlKvkt/AtMd3UFj/b6nwsWLBR2eeOR1zL2aHjXHk7OyZ3p7veeVQDGbm
	j1bfbmcNK85CH4/tB2bh3KkkMPox1uh59T4FSg4zJLNjPM46Ee1/9XfGwOs6/j8JytSc
	wnC9cg6w/RxHB5iasIQ5f9c/7g3qEdV2rQ8KX7Lky0LfvXDxUV/iqEPjIYMLGd2C18dG
	F6JA2aeakb79D71V4iWE0yw3vAvtbjY66llx1cTTjAJDYPdberLXFeRVkVfbLdwCi4X7
	1iOsUUSWDTTTyFqrKFmwmrTsFIIJJV6bbbWymWvqzYucxjgsOJRjJhk9xmFmHNQnJzkm
	PGWg==
X-Gm-Message-State: AA+aEWYP7ck5B1KccMPUQGu+uyU83dHmQc+979V7JMOVZv+FsU9cvtd9
	vmXknBZks7KDd1paYQFECJPnijNt
X-Google-Smtp-Source: AFSGD/X/bMCJlpNfbmTVV6KfLax0J1m5zSV1e3ZVUO3gC8LJwQndWbeX6NKOQHHAGK4tlpw8UYPjMg==
X-Received: by 2002:adf:bc02:: with SMTP id s2mr5728257wrg.255.1542808663576; 
	Wed, 21 Nov 2018 05:57:43 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o8sm11203560wrx.15.2018.11.21.05.57.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 05:57:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 14:57:27 +0100
Message-Id: <20181121135727.115509-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121135727.115509-1-alex.kanavin@gmail.com>
References: <20181121135727.115509-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/7] package_manager.py: fix the message used to catch failing postinsts from dnf
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
X-List-Received-Date: Wed, 21 Nov 2018 13:57:43 -0000

Latest dnf versions have tweaked it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 02cf2b76218..392fe7e3724 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -864,7 +864,7 @@ class RpmPM(PackageManager):
 
         failed_scriptlets_pkgnames = collections.OrderedDict()
         for line in output.splitlines():
-            if line.startswith("Non-fatal POSTIN scriptlet failure in rpm package"):
+            if line.startswith("Error in POSTIN scriptlet in rpm package"):
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
-- 
2.17.1



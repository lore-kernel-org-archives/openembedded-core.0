Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 09B737806E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:46 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u36so8711470pgn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j8j2vwmPrTcQyuEyDj6yKz3FUPqEvDTaa3vIjhP++QQ=;
	b=eDcUsxXYWw8YycnptpTOoNbMLVwi9pkLhmXEFl5uzReF2Vuqa5BTlZnvDm0I4CxJY2
	kxIuP6+CkTfPmjzK7TS6D+JQdkBOZrGRQa2OfkYAwp6WARcMNU2AGAm5HSHZdYyEPf1V
	ADglZOimXEI3WrfU8V3AsJ+y2G8JdteCyigcXOPdUs6csxJd4C9TW1P0rnYmXXvm5vBW
	EV4UTvWgXbLGuUzEP53C55dbRgOK47oKcK3b0HgesFm69+cDWmf6ZhTGKPRLyBC+GvEw
	Hh5wrUENJUXxAW4iZ0pi/41SLRQZKjXuns4qlYJGeadU5SZdf150tVQpZVmlEofVXXsA
	wPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j8j2vwmPrTcQyuEyDj6yKz3FUPqEvDTaa3vIjhP++QQ=;
	b=Jq0yq3Rj7gKFQvdxc8h0nHTuTmpQUwKtoBS9EAvKoBTgSVjjSUBEi/CuKC4b9tjVrm
	Xy26+YAyvudKilrkOh4VljmC7YujLfA/dhave/weTXah9LD9Vg4eopEQMqLrmC/G0zTe
	d/y10HtC5nUXuxubGd53l6Fy4RpvBrkVsDVLjQvIJb99PRNLv96Ob7BKyxP53sJZ2llp
	pP3gp/ZLmxzGelWTUA2QuSMTTTL4wCccwX9nMyBCEvdNqlaU+JyOPvaP2MLpBHSHK2Wc
	Hg4eOe22/8Ntt78Zcv0il8Oc7mZZ2nLXMV9oii7omJ6jc1w1YZNhqWnsw654GuKRnvHc
	9LpQ==
X-Gm-Message-State: AKS2vOw+mRDNoilrHsc4wEm0q1WXfEypJdloBamgoOu0htyR94Pw3T8h
	ejdqsVJvMQj4NR1W
X-Received: by 10.99.120.69 with SMTP id t66mr11240137pgc.237.1498665887585;
	Wed, 28 Jun 2017 09:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:20 -0700
Message-Id: <24240b4da9f37a030a301b209d3a09d0e505c6f2.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 07/10] valgrind: Remove -no-pie from cflags
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:47 -0000

It has been moved to distro security include file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index a81adc31d6..888b132ec7 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -73,8 +73,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # which fixes build path issue in DWARF.
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
-CFLAGS += "-no-pie"
-
 def get_mcpu(d):
     for arg in (d.getVar('TUNE_CCARGS') or '').split():
         if arg.startswith('-mcpu='):
-- 
2.13.2



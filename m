Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB5D4783C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:52 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id s66so499637pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e90r7N2D0mPTwcdBq7bVCyf6fUmFuk1PvAjnZMeewWQ=;
	b=RTIArWM85S8FZXGujywZX4QaWvtgLXA47R7kNhxJgH2tpzGi4FUnzgyMIFIUl68/oE
	wig0tvxw2cwOmuoZcHc/4qP+CjasCoAi/AOG6GnfzVEH9RsxeBdt5NDZ7FltewlXxv6h
	Kx8ETpZKo5e7jG331G4m174FKvCNy3dubgEYb8tDL1X/32zaca8ueq72sLZruNnQc9Fd
	FTHN+/GpEwGXGSLp/Mmhbxjq0GBS2pyiGx5iXC9v+Pjr+lcaxF5/MF8e1TUd9e4PSI7p
	pZr23NLfC3x66CQ3pp290QdjqWcFB8Fp8Vv+Gc4cOXAUcYi533Yu5eWDcjTPwWbSDBFT
	Q8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e90r7N2D0mPTwcdBq7bVCyf6fUmFuk1PvAjnZMeewWQ=;
	b=ChYUeWKktSGYgD6G2kAcD7FWrbFvNkqFk6AI28nbU0yJClUJxKb50dbjL5fkM/U1A2
	B0qK8nSldVA60YvSzOa/MLRTOsI1PdE2yHSgznco6JujC/Yx+zS+hDp03Z5pGKL7zK+h
	Q3ypnSvyAFrgTCtT+LbmpeqAK64TE7ze86pZ6fYXA0D12D6jtyJyxBBkVN5HFgTvztdY
	e3fff02fcby6D6dFN2XdJkD+Y3HtKD7ow9K4dfRU2lG0s+QW10dvpoiB6VJDgoPney2H
	w00EVEkUfd0Q6oR79B6clneJoaIhMVbYX5TTg6MITrEWENMtoB1dEXQkqNVIEK2HhHLV
	K8Mw==
X-Gm-Message-State: AKS2vOza3t6FRVltqLJdl/9Jq0J3yLUosSVj1EWlKAc/BKP3P+4ZKwBp
	gFIs9R27iYkdkdKo
X-Received: by 10.99.161.25 with SMTP id b25mr633207pgf.26.1497453833568;
	Wed, 14 Jun 2017 08:23:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:29 -0700
Message-Id: <479041378c1cad9534e3bac14cb261d2b0aebccd.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 10/10] valgrind: Remove -no-pie from cflags
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:53 -0000

It has been moved to distro security include file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index d7b6d77000..65e9563291 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -74,7 +74,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
 CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
-CFLAGS += "-no-pie"
 
 def get_mcpu(d):
     for arg in (d.getVar('TUNE_CCARGS') or '').split():
-- 
2.13.1



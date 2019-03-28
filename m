Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7444A60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 10:20:22 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id g3so18650709wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MOmETW3hwU9c7KpAvklVCFma9iHgug+UevDF5CwIew4=;
	b=Zo2xHMJetsSBB5n1GrqhfKqkzfcP492cvyG96XrFvL4qu5P/3sq7x+FBinme/kBcNY
	xSw5MUg+PhwwPgU3mBAAj5ea7Pd17bH0MJSxJeAneAijYjmg9GP6AqlI7sc+eXmnabZZ
	Jkf4QKnrfLnb9hU/9uj9Bf+9RrhVrRLa2DMUa2h+sPeJdXWbTz596/MRS5TOBUG+cfct
	G8Kjmd1sDfWBPEF/hMFs87Mhtcd31PhizY6PcJba/G2weEhjUZzWbiRbWcDo7NMD1ocD
	x2xbT9fHj2+fIcFvNe8hNnXqmj2fdXJRfe2h9aQET0Armz9tQJZDeebsY23FinzhVTIo
	HtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MOmETW3hwU9c7KpAvklVCFma9iHgug+UevDF5CwIew4=;
	b=LOkJbgvQHcEJeXq/6eQNgYZ1O6PCAbtZUuZCNke8LI2BkCWN3VFwggWWf3o7qSQeXJ
	tLfkAH6nDjY8kR4CAt0l3apagPJm+ZT4pTLo54MVonKk+NBouHVCpOn3eOopIoJdbMN1
	IiX+HLNlaz1d8vusnlK0FvbL2Hmno7qphvHa4SCpBXSpn54QOtyrBeVMsLFLtWEFblN2
	uy1SKUc35lLEwituQSgYcMjbwBDu5u+JOHUoYWYI873HgRanD4QedW1xJOdGryRtvqLK
	P/pbr0MZ64H1z+m0wPJrQzreJojerkEiZY0Gcti+IrNYpIipq3yxBF/SnWkk/jPvVTKB
	aqLg==
X-Gm-Message-State: APjAAAUETjrjmhx3SPcG7vPQXKituX24iG/pZ8yYsLJcZNn/sPjMd9ZH
	Nah5MplUzqIjPTLZVxBHbl4g+vw+YeM=
X-Google-Smtp-Source: APXvYqxQO7D9HQASDzQQwNocB8y3QMeCTiPmOp66qqS7k1WFFtSmKknylJ164BBkn6Y0TyHpv8a7CA==
X-Received: by 2002:adf:e889:: with SMTP id d9mr2698015wrm.162.1553768422853; 
	Thu, 28 Mar 2019 03:20:22 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	([2a04:cec0:1083:9625:11a2:46f1:124a:8a32])
	by smtp.gmail.com with ESMTPSA id
	b204sm3598518wmh.29.2019.03.28.03.20.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Mar 2019 03:20:22 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com,
	texier.pj2@gmail.com
Date: Thu, 28 Mar 2019 11:20:17 +0100
Message-Id: <1553768417-9355-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] Systemd: Add pattern matching support to PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Mar 2019 10:20:22 -0000

libpcre2 is needed to enable grep option to journalctl.

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---

Changes in v3:
- Reformat commit message

Changes in v2:
- Fix false case option


 meta/recipes-core/systemd/systemd_241.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index a12b9ab..bfbfc81 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
+PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
 PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode"
-- 
2.7.4



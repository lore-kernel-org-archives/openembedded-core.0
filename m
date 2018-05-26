Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9A571C9B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 May 2018 01:18:15 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id 15-v6so7975266otn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 18:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0l34wZeg+OHtTGzqo8rOiI3nQrxgbDIHGhPjk2Sabss=;
	b=ODM0SCYrykuKNNN0vPn5ctHuz9FkJhzUFjSyejhc7XIdBjDHEE2A1d3UMD8csttmXv
	vtqldTOI1TUJMVxGEa4I37m20bg+opsy+7d4A+p1/fbkorlKAxsdivjIX75MQZXqkrdF
	o949CzKuVdLBBrh3TGNBK1QpTuHcpygo+inSyKIbbphXbHCzZK/WDCCOhQW5U5EbS7i9
	p64gBpY63cuuAIcMmsoiheivuol7Qf6D8eX5odgg1+1Zcw5DI+EyKCyLspxezRO8wLIO
	oVypAZx2kpZhtHS/NMJQoK87Q0eTIj1npgapNHMGhZZ71OwbnJ6KXRxtnGYKh8U234dc
	RXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0l34wZeg+OHtTGzqo8rOiI3nQrxgbDIHGhPjk2Sabss=;
	b=hd71fnJcRFOGcS59ywz8oFZQOHUJkPj+BmME4J1ymwVHV5YgOT9GHaPO570RR7QR03
	HA4NDtue86tZgkW/7UartYR/Wxxn15P1RjwNLsG8j/YIAZGrBYwP7IxO39o/wrPHKotU
	qFQgg4szYt2O1eQOPmytZBpcbJpjrnjaGBcAtQbjXVItdbR2vHy0jRMZieSLwrMYe3WU
	8fc5YoU4T6EpnfCqtOI81LVH0isi9LYQaovfUJlIzJ9Yn6LcPD/OTNqkJ2FwLmK/fQVx
	SrlqkRPwHrDtdieH8G4UP1OmQon+Lh7tNL9X7dqCy8CaaQ5LFA5uFPgHt2RV3vwPLjgv
	fI3A==
X-Gm-Message-State: ALKqPwfDmTxzFebTmZ8xHpm1H7Je/mATfCqsEE8t1J8z+Xl+aSgmtz0W
	W/kqEQjszOVcO3TAdcno39yuxg==
X-Google-Smtp-Source: ADUXVKIDNmvhTW5kbgpE9szYzuAZou5UPDrb7Q4cqHHSYRiFmrAkIFMgGnsqpMz9rJBTHvCIQPVXyA==
X-Received: by 2002:a9d:5508:: with SMTP id
	l8-v6mr2771430oth.159.1527297496613; 
	Fri, 25 May 2018 18:18:16 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n50-v6sm15726144otb.14.2018.05.25.18.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 18:18:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 18:18:07 -0700
Message-Id: <1527297488-19530-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527297488-19530-1-git-send-email-armccurdy@gmail.com>
References: <1527297488-19530-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] bitbake.conf: drop obsolete commented out value for TARGET_LDFLAGS
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
X-List-Received-Date: Sat, 26 May 2018 01:18:16 -0000

The commented out value for TARGET_LDFLAGS dates back to the switch
to sysroot enabled toolchains in 2007 and is now obsolete.

  http://git.openembedded.org/openembedded-core/commit/?id=ba2e1f4d933c37b372d6749d64614f2510ee9d7b

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6ecf78b..15f6da7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -587,9 +587,6 @@ TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
 export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
-#export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
-#                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
-#                         -Wl,-O1"
 
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
-- 
1.9.1



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id DBFCF7DEC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:28 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y3so7781838wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7bJ9j593n3NTDlhsrvmCd3AwG1JEaJIQfPDmZSsy25w=;
	b=ipo7VQ+fEqYHKndlCD6lwtaz76XV6Rh/AIrkIxjmQs91uVcOMloEJC2emzaOiE01Kn
	aZXTRw7qoMR3EuoanDtxBuyk7Aia9RIBI8N6+0hjPhByK25w5632yyfjdx2pUMGPV+t1
	1lPIEw2r+J3IKsDarRL4M0PIrphdirwqsovxH0P78Ej/QPnFs23Awg88F1XBfAhVHCBD
	66aM/q7c2SKfUgGUYGbc8cRFLQ/yioxHiILsvqYyv3QSL4a973p42TU3OzLgFsZUiJx1
	wEeBZYiAB6LOpgHYkKFM7VkM1o/lLT+CXBiO/0S/3jlChYmBDEutVG6sCa4lWQ4CDgcL
	JPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7bJ9j593n3NTDlhsrvmCd3AwG1JEaJIQfPDmZSsy25w=;
	b=L9YGYVZSIQijwIktRKbuOI/rJYta9vXnPifXP8wV794CDr++C4YOaQYCFZZM5nUh6O
	jEPe7Gl+bysvUUqOb8hcbYutRj0AK/674JTyjDrWUFACEUHVa8uw+1Jw4JIXpIXV7n5/
	rGXGzUynsQ1EWChRCI1T6aaZ0JANb5ZL+xE5iQl6+Ptnm6Pdzhoa7Dc8yQnwxvejh/BN
	7CKoFXaWKWohyky5/wtZ4V4mEoulbsAIeN300ojZpF0vG40pp9LvFz925VwiLcoLhyQr
	PayTgC2V0anCGGwaPI4e/xt4JnzmHj5WZWcdDjnuKMktf6oMHnfsZY+xaa2UWCV1LCr3
	4JyQ==
X-Gm-Message-State: APjAAAXC9Z57pZsnO1mNVLGKtU0Udd3UcAcYXUE+jJxO29aK05QZAI6P
	OCmvWjhkXNV1Zk20vYsMnIDmMCjH
X-Google-Smtp-Source: APXvYqy7y7BGlopJcl7sjRluXmSje85MvJ4koyXSeQXC+X0xoBaph/+UwIX9buCYhpBemVZ6N/Uqfw==
X-Received: by 2002:a1c:96d3:: with SMTP id y202mr3297155wmd.139.1558116749576;
	Fri, 17 May 2019 11:12:29 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:50 +0200
Message-Id: <20190517181151.44001-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 36/37] dnf: upgrade 4.2.2 -> 4.2.6
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
X-List-Received-Date: Fri, 17 May 2019 18:12:30 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.6.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.6.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.6.bb
index c77773332c1..769aa001707 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
+SRCREV = "30fa5051fc26f9866a271fbdb768d3c2524706d5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1



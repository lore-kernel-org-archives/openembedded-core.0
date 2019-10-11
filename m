Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id BD4C87F5A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:15 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j18so11555348wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YrYiPgaUJ1Rz59/CJeu7hCjlVgTQkkLLwbjXz6dDU0U=;
	b=QW9cxmwyLhWvKoUpK3+dklWZ8hzObPDooy8XY5JYn9oDCBxEcemFSXW7wUxkBisZfS
	vgtdgq8KhjqiePSRQAWYeE/MM/ETkP6ug6REukjPebChDrRnCw59CVTHm6vDTLBIgETQ
	T/e5djJiVKjqsjIUcuy/JW0xLJeD1Vw0YzsJiPKnpIalRQLkLfYzouTO3yVCcPluM+p1
	G6UR6Wr9Pfww9KHdoHu6eGcuw23eYC6b4FnKQCiZbzufJdsDxRwdjBJXALQ+JmsKPWDA
	8gbp6QTaZDypvbGjx8K/BRHC1kJAUR/2rVcnsoUfwV5Rkm2obovgylBd0tI3JfvpjOQc
	PYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YrYiPgaUJ1Rz59/CJeu7hCjlVgTQkkLLwbjXz6dDU0U=;
	b=qK+DyRsA2m3il0bDnGj9t862hQ+UolYv7uB3jeqFWfVYRmPBHKleGXXpTm3l3R/S2O
	jQmKwomtRauNM/fFz/50EZ8KQm7QnYmzYMvxuN2AayJIYCe8Nw6b51aBflZGkEFa3TWq
	5Jg6C10KeQrrr9ejH4k8qPkcRlrg0vQkCgwfplSC6cyzsNx2JopW03Nl9e47OhOL6xBS
	wmMNcVScqb1KaYsRuN/SVMg4KclL5dQGml1SIjFzkaFBlER6jpQcSripGtpSG4PLg0VS
	2xmcAcMzjjYFXazLHNA0BPeNtkx6N2FDQqgPX56Uplg3DgHbj5nc+gAsT+B3ZM9JSk7i
	99Kw==
X-Gm-Message-State: APjAAAVW0Ddy0qz/jD4pCRd1PPWbFZVYCtI6ZuUyl2fRsBh0io+U7Qe1
	pd31IJJUXe20e5MQB3vffw1mKsVw
X-Google-Smtp-Source: APXvYqw75+TWIDzYL60f57okKPGyBJpZ/OuseCKiKyfCitgSBLitHxhzkJlKa9kM0R6PQORIxlDHig==
X-Received: by 2002:adf:80d1:: with SMTP id 75mr12096051wrl.253.1570794496548; 
	Fri, 11 Oct 2019 04:48:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:54 +0200
Message-Id: <20191011114754.91740-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/19] createrepo-c: upgrade to 0.15.1
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:17 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.15.0.bb => createrepo-c_0.15.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.15.0.bb => createrepo-c_0.15.1.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.1.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.15.1.bb
index dc1b851b2d7..797db738f47 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "2077ba104eae04bb819e9e0c906c8c835b62e7a6"
+SRCREV = "bc67f19ed09593e3886ebeee2391e9d51cc3439f"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



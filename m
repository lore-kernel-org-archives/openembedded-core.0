Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id E8DD27F22D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:10:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id h195so7192883pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ocdpli9FrHsVpdhi0O6w8zl6unT0eJuML9+qGCFMfsU=;
	b=vINHhAk6x63GDsjU28kmsceprvc9vIDiuDR8/bjIzlcCUlkXXMjYFpS1hxeCOAlIu+
	W4LZkfDXxlh4dJhUZcuo1ER65pcKvuYQBrm/4kSk7kOTzohp36UcJWt2NMbFT8F2iP0d
	6eWAfGyY4ShwfWq3pomSXCG5z3GQOV04ZuOfLuCFgXYyAL1eJj150aasnR731+0bwUkJ
	aGeZYYw+T9gOyQWH0VZNWt+0Zx1+kwoXtUO1ZqL0w058e2yf4/FlNUQFkDd3BpfRnbEy
	4HvdkMRKlbqvqloJf8/HwEGwVQOqitOqr7wltZt7O3Lq7k3Fvl7yznCjmCf8wevCJvfq
	efRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ocdpli9FrHsVpdhi0O6w8zl6unT0eJuML9+qGCFMfsU=;
	b=b7IomYVZWwIV2m+TA3scFnJ0Yvzb35/zZc8sNbHVBii8Kb982XcjShlLKrho+ZaUZH
	yJS9fnGxTgmt3o8DTDCKCYArjIsyJJpjOCUSPa9x7duGb1fT9up3BPqIdDUgB3AtBmks
	D2iqnpa/E8krqch/zPZKxdNSBtzDBr2teEUM3UMwDmkqmcTGAj/Opjmhy2PzZxenSQC4
	RFK4OPuxkhLUNPfRS5kqhrAtFXOytF8EqPMc8pX8JLaMuzu+GeJzjKsSG2eolo26oHO6
	REbv0K5GuuvDKAGGMAC9ADw9HvJJ42zI/g5JGGIG5PAYxr8EMTzLImnMWQ8cfgx25LRX
	yszQ==
X-Gm-Message-State: APjAAAV0h+nqPNsmYcdUXQ7YmljEXhIfBq5GUKl8MC6AF3/CBSOPs8Kp
	8NpPIJWNUvfB9zbZVmt50ZTunl9Dq14=
X-Google-Smtp-Source: APXvYqyMwTgUf9K/Yfosm2NGdoT+2sDVcmjHQbgbBIvTHtuFTMSQuidaLWIYzQ5N7rszI2gSjVBjgQ==
X-Received: by 2002:a65:5342:: with SMTP id w2mr35842308pgr.261.1567620625634; 
	Wed, 04 Sep 2019 11:10:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	i9sm18764688pgg.38.2019.09.04.11.10.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 11:10:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 11:10:09 -0700
Message-Id: <20190904181009.8374-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190904181009.8374-1-raj.khem@gmail.com>
References: <20190904181009.8374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3native: export PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Wed, 04 Sep 2019 18:10:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/python3native.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index a3acaf61bb..b056378f69 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -9,6 +9,9 @@ DEPENDS_append = " python3-native "
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_BINABI}"
+export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_BINABI}"
+
 export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 
 # suppress host user's site-packages dirs.
-- 
2.23.0



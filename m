Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5946460D72
	for <openembedded-core@openembedded.org>;
	Fri, 31 Jan 2020 00:28:03 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y5so2345820pfb.11
	for <openembedded-core@openembedded.org>;
	Thu, 30 Jan 2020 16:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hcu/vHg89xqqxJQJW/4wJ+q/WdDzyPernSiveNb0a8M=;
	b=NJfYwj2G6tKwnwF1CZsDiyqdnjePd2eDCphOXqSvxN473XqNLrvFffpTLeXFfkylB3
	TEs2sml5q6el859IHcXJx3f08fktfuMjuBnV6aMxscVvBp7TVT6ERDy0vPB4H3RLj7Ec
	AnNRO6Ub9n6mhXe/MY91ARh31R996xYwnUmfT7FrH90iI/Bn0P4URUoQrHmRj7RDPy5/
	5O1aZdHqho5uUWonxf/Kw3T0vWZ69UuvxxhWDjYuz025CxEO4Ni+3CTBYkcafKLv+NYe
	h1Ttdz6zSqP1TFtNKUwgelHMkRsu8Zt9gDeCRcoyb62Eap7pYnej8SG/DEDY1Nrz4WS6
	6f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hcu/vHg89xqqxJQJW/4wJ+q/WdDzyPernSiveNb0a8M=;
	b=XydT2TibBprvLwG14mKYQrb54m2BdnzDL1f1I+OKFklOVLZBup22LdzMYgcuh1AqVC
	55SD22wentCTCHwH2xEI86XBJuJlTNTQOH9dSYGFC794Sj4ux93w79IOAvCuD/P99d1P
	B5sGmY1KEXvBnI7KNguuLSeU3unUFLlCJsehHrJ7sTXBcoBgwWxFYhhT4jjYWI2dZfsb
	5ri1pdTyAJxSC4EG7gbkf8dkv9b6C1aadHj/Nwbs7KfwmTrwukKinK9SJe7RmrerhUsz
	kqjCMHU4BugUXv7Xldr/onKGqHXmCjqt+yHo0t5pfsY5dtuhZlNMbVmAPjUuQT9eUDjF
	CZ5A==
X-Gm-Message-State: APjAAAXkNVFGaA346ytFRvgNB1UA3m2G4riwx+7+z7HaaoNiUGTg5JaJ
	i+hiP8aGBZg9jWCTuBq3w5s9kjDG
X-Google-Smtp-Source: APXvYqzy8WMC+JhCrIQlIIPaSjItd43DdFEfzmeqOtsMxT9ABlV1gkZ9XxTZpO9/xKJ1fE/yPTQFdg==
X-Received: by 2002:a62:d10b:: with SMTP id z11mr7447397pfg.67.1580430484159; 
	Thu, 30 Jan 2020 16:28:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9979:cdb6:7624:d076])
	by smtp.gmail.com with ESMTPSA id
	j28sm7949306pgb.36.2020.01.30.16.28.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jan 2020 16:28:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 30 Jan 2020 16:28:01 -0800
Message-Id: <20200131002801.31570-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131002801.31570-1-akuster808@gmail.com>
References: <20200131002801.31570-1-akuster808@gmail.com>
Subject: [PATCH 2/2] parselogs: remove mpc8315e-rdb from errors
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
X-List-Received-Date: Fri, 31 Jan 2020 00:31:09 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index b7c7b30adf..9dafb89b03 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -185,11 +185,6 @@ ignore_errors = {
         'Failed to make EGL context current',
         'glamor initialization failed',
         ] + common_errors,
-    'mpc8315e-rdb' : [
-        'of_irq_parse_pci: failed with',
-        'Fatal server error:',
-        'Server terminated with error',
-        ] + common_errors,
 }
 
 log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]
-- 
2.17.1



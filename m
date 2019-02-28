Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id D2D157CCE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:37:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id o17so22012500wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/RK/DHFdbxFXMq3Xn7pH9lodKgQCNvMbxAK/ATWxOaE=;
	b=VyLmQYrNN/dddUsv0l97K2LRf1aXpsPBUNL5GjvrZenMtMQeq5BM4CqhwggQGlZsV8
	Lq1pjUEa/BUHld2OA9r6s3AUuP5Lqk9YnjxVLb2h8h7Mhc4Vs2ulxHV9Yv+c7IQjgxU7
	DLpjCLMh5TH9+mhS5gOuNhRS/xKAykpJ2Ex/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/RK/DHFdbxFXMq3Xn7pH9lodKgQCNvMbxAK/ATWxOaE=;
	b=pKw9O4f4OAK1qLNHpnW9Av9H7wPtccSqwTUqm8SqJMhMmmBDgyLRkyyS8hBwg62PyO
	nZu6nPIEwU9xTHVAzpBaEtv/Ek+vR4uaMF6U8YrrN+W0Fxm57sTVzflQ27yg9Kqu+rJZ
	AjhlmajwEGJEwb014BG7yEjCnu1ZdWdjGO5lWC0fpZLyjnKN0az+kFzfVvo59twv5o0X
	udY48IVyCOcF46hMaR2XSEAlVG5MOcrQm+bLSrNk4VN3JbiyyAHRiEmQwlw5UhOVExef
	E5wa0hjh+1yPwxazahFX5DcuYRsku8Cex1hQkgvKc8X2lJdyd6K5wsyl4AhYoKOtz7pu
	DOQg==
X-Gm-Message-State: APjAAAWh0trc0yeq0bZpSnwhdz/3oJALHX05QR0mvBjaobY2+GaWMWzh
	x1ItBfK67R97mtTPt+fB+wpndWMUkxc=
X-Google-Smtp-Source: APXvYqzYlPLkvwlG7klNhhKdtYYHyNOA2jK+vDgvyu5JlL3mBlskVitfd7vS2KtdUO3AerHxVPm5Xw==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr6202269wrn.268.1551361025285; 
	Thu, 28 Feb 2019 05:37:05 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k203sm4461214wmf.44.2019.02.28.05.37.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:37:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 13:37:01 +0000
Message-Id: <20190228133702.22445-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228133702.22445-1-richard.purdie@linuxfoundation.org>
References: <20190228133702.22445-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] oeqa/oetest: Drop unused import
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
X-List-Received-Date: Thu, 28 Feb 2019 13:37:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/oetest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index f7171260e74..f0423af66c4 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -7,7 +7,7 @@
 
 # It also has some helper functions and it's responsible for actually starting the tests
 
-import os, re, mmap, sys
+import os, re, sys
 import unittest
 import inspect
 import subprocess
-- 
2.20.1



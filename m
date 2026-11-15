Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4375.1794732554563772704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S+uyfo60;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so932704f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732553; x=1795337353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DDzpaod2tpr+xRjXxtEkl7Whr1Pi8UlTc8/bpsFLjM=;
        b=S+uyfo6056Dbo1EuDCJKZvzH6Jzcf0jyFuxIhhiwfzrY9z4/BZR244quKQ9JA4Ca4b
         5o/25KRiv6rgKbaTPq/kxWUwMwq142Y/ly8sUWl4k7fzciquvUum7zU2VpE9Qyc7deGq
         C0xFMLsHeTBG9uEpGw1s4EiZkI94H4NyNNlS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732553; x=1795337353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4DDzpaod2tpr+xRjXxtEkl7Whr1Pi8UlTc8/bpsFLjM=;
        b=J5EDvFHimr1CrmwEDq5gu+fEJoa/rrB9l4C5R5qyXFBKHuvblvZI9gM2W0MKBcP7EA
         k7yNMX408apIA5ygHCBI+nVbjXSWe9nvw1ba8lEh0kHkPcl1Q+7gjm63Dpq68EN0ii0W
         mC+wjNTXjRAhXEni7E2nNqcOxftc0WMFUUrpFzcjIkTglyKEIp44d+6kCqbTAro48Pdc
         kv6oYANRZKtfgXfF35fwXFGWjSS+ccg44g9M7cX1F+5+KV+gIvvNJ0pDr6qYR53OJ9m4
         4Mq+2H6KgnOJ+aDiDBHY99deOs9R/bzyUyHu819T4bPbhOzztcS/J3nMbxq3THHAyso3
         YkWw==
X-Gm-Message-State: APuU4Z+/aCf+C+XPew8b7DufvAEhrFsyf3/boFsYf4HPiT+YEgqO/S1H
	+c3t1LfCMUn/S8LS0v94TgaM3PUgW4Bla9OSJdhmBGEyw2AA7wNxvb+RqQp1BBD7xhqoretuXE6
	/j5d4Az4=
X-Gm-Gg: AYBFou21YKKwShMKnqM+IFU+EgZX4uIwY1w/32ZPAAg8NF0icLkx/CawPSKtUH1dUJn
	UG3EwwLgYAX0Xf0vofe9Nye5IzcsWR0PMCKnl4sVdenEPx2IaUYcIBt519y7LOQ/7Lnmg57pSjo
	Zbt8e3FYlgX0EJa0ClTGnfSPKzzsOUZJ31LnHb0xnIGWvt/8Z+6AQygrfYJRAorKeYd6IYj8XQ9
	ZF9mtV96qmVfvj+DV1QJwtD1BZvjfa5EYbdOx2Uf98UDxmCPUkdWotm8Seklgnofb3eKGvW57fj
	SSXD45Lnsyh/ebAjIyn4/2Gkaompr8ncM1RBaCedQ09hg0VxzrKvzUeTfTH28h2GXaNsLGScTdb
	duK5ovg1fsiCfwP+qVKF5xKCQWZb4oMX4TfskZlzNbYEvp6Y72tP4QpIU1tBHxF/8hggYB37Csj
	vXo3A5eBHWhPeKqzaJ8/dU470stttTvS/tcPDGWv/JZJ7bE4deOPNb8pnuir6o0gnw67YjXTQDi
	ZwnTlYUOSeghzzj8+3oDUuPdkggv7hBdinGZhgPPw1TwKnzGTW87g/bCIyIFPMyq00fTkujt/vL
	WIomJS+b/iIJGKeRVUtacIbcSr1RrUAt3VM/uyPr16pZW/i7tgwQmQLIyg==
X-Received: by 2002:a5d:584c:0:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-49c7325b837mr17553840f8f.50.1794732552845;
        Sun, 15 Nov 2026 00:49:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/41] oeqa/selftest/manifest: Remove broken/unused code
Date: Sun, 15 Nov 2026 08:48:18 +0000
Message-ID: <20261115084845.701136-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250246
Content-Type: text/plain; charset="utf-8"

The code was using a broken comparison operator. We always
set target anyway, so drop the broken code rather than fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/manifest.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 73d262bb43b..ba9106d6cd4 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -40,8 +40,7 @@ class VerifyManifest(OESelftestTestCase):
 
     #this will possibly move from here
     @classmethod
-    def get_dir_from_bb_var(self, bb_var, target = None):
-        target == self.buildtarget if target == None else target
+    def get_dir_from_bb_var(self, bb_var, target):
         directory = get_bb_var(bb_var, target);
         if not directory or not os.path.isdir(directory):
             self.logger.debug("{}: {} points to {} when target = {}"\

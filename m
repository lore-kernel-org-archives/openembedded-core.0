Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A7DB47FCA3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 19:00:08 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n11so31355269iom.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 11:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4/Ud70LQs2+PE2VYMdOK1CrY5JMJhzCWM+CAHkvzT+U=;
	b=YlrvaO/Hd3ttQeplE+eGTlYcSDM/pThsmiNVc7w1u15s4gRiKnrLNFq4HFwoRArRFo
	tRgJp8CS2Kjs6mF2/FcE/SsvUeIOikNS9t8/Oq0JsYlNZxcQQZIQZaN08giyujTnjg99
	R4SBKyDkRHaVBRTTw/hc1Tr0flBkEcMKICALtZAEOzRKxfV5R2PZUUQWZtWWOOexryZw
	zhoS5XufeXcc+b8mPbGWpouwPo2rh4dOqPunPs7OJdZWF+QXxez9Cu2mnikxywMqIYnl
	H7GwnMSybHINvTEf9HHO0M3eEDPXwI0K2XsVh7m9FDtoZ4U988HCPOWzIs4L2lKjRVC5
	I0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4/Ud70LQs2+PE2VYMdOK1CrY5JMJhzCWM+CAHkvzT+U=;
	b=DHwmmqye/1Q3HUQ/L5g9f/nzpuFTcnhQwgqykBdhqVQvgfuxscpUFwD6YgXRmPraUY
	e6DvBQ+0Gu8OlaPOwybyzog1ts6NcB+JZSQ49vF/wIRpEqA9MAhVsOwNXKhSYuBC/6I1
	9Hq31XWRQjT30BD1bnxsZx2P8SSwAPvbpPZVnWVP+hVz1aFivyOslDb9h4MECU/1Maza
	mUfsS+gdLaT30A4e4BTxhG1zsUksuTx4GDc+B9c1b3pbf3HTmzbT0HUCL291v1ivs/7z
	kzb5e2feTt0IRse8WVS923qUvyWK2dZCb9LWOovSPrKYgBwtjh6E/qG2jZUaovSm0SUa
	AenA==
X-Gm-Message-State: APjAAAUB8EbytOirBpzkeVw7XOCglHQlmcBN7JQK2HyyyCDGMOQKDgrP
	9kNO7zS7sUKVlN6eKNxFCtVto74D
X-Google-Smtp-Source: APXvYqzjDHd/JVzunYZQHRMzuIGm4qqNGyX+QaLLk8xvQhs2+98Fe5K9N27QcXGD7dCS1A/aJ7weQQ==
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr36724337ioh.219.1579460409398;
	Sun, 19 Jan 2020 11:00:09 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x77sm10726714ilk.34.2020.01.19.11.00.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 11:00:08 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 12:59:58 -0600
Message-Id: <20200119185959.406212-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200119185959.406212-1-JPEWhacker@gmail.com>
References: <20200119185959.406212-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] oeqa: reproducible: Fix extra data reporting
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
X-List-Received-Date: Sun, 19 Jan 2020 19:00:08 -0000
Content-Transfer-Encoding: 8bit

A typo was preventing the extra data about the reproducible build from
being reported in the test results

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index b7484f3e10e..c00b92d2e90 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -95,12 +95,12 @@ class ReproducibleTests(OESelftestTestCase):
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
 
-        self.extrasresults = {}
-        self.extrasresults.setdefault('reproducible.rawlogs', {})['log'] = ''
-        self.extrasresults.setdefault('reproducible', {}).setdefault('files', {})
+        self.extraresults = {}
+        self.extraresults.setdefault('reproducible.rawlogs', {})['log'] = ''
+        self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
 
     def append_to_log(self, msg):
-        self.extrasresults['reproducible.rawlogs']['log'] += msg
+        self.extraresults['reproducible.rawlogs']['log'] += msg
 
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
         result = PackageCompareResults()
@@ -127,7 +127,7 @@ class ReproducibleTests(OESelftestTestCase):
         return result
 
     def write_package_list(self, package_class, name, packages):
-        self.extrasresults['reproducible']['files'].setdefault(package_class, {})[name] = [
+        self.extraresults['reproducible']['files'].setdefault(package_class, {})[name] = [
                 {'reference': p.reference, 'test': p.test} for p in packages]
 
     def copy_file(self, source, dest):
-- 
2.24.1



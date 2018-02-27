Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF1996007A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 22:47:59 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id h23so1047984iob.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 14:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8XPYZFYPwUjEHPA6mVPOIhU/SlYVjjxfwtqenoVpNa4=;
	b=mM1UvSfffWr3ihJq4EqsLt0OI1z1T3KPj83LVvWJ5V/e9YvwBy4xLkhLkCIJIYnyG3
	8xTIOvThdaPZ1ZoZRPn3OMDd8V0KlbDSkS4FO/wZMZyx1Onmsmt+qj4Qb+pzcCvCdcG4
	C6PrI8PJnv0UuJ5fURbRlyixKPB9hko+QjdXNqNnzV2mLV6pYEUC8CPoJiusBVXCI2E7
	aBqzbe7h/dQ8GvuxcEVj78yPwS2FDoCReuWS+83YuSzoW4nQ5IiezTUKlpMklO3zCTTI
	s54nyAFmurZEw8WmI4dd22WLNiON2qPOPLiASSrm6H911/ZwGnqKU3SQ+TkwAKQEQAIe
	ElJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8XPYZFYPwUjEHPA6mVPOIhU/SlYVjjxfwtqenoVpNa4=;
	b=uf3mO4XcGjvA5iqgER+xHRn5ued8Y0OpqDKRs3TW3v9g4Y+WnrzY/4QWQqfNTZu0PE
	z1xj+bG8i91qtsy6KjJdcxuxpnnB1lOn3p6Rdg0E2GZpyrCl25EBmIy863bWFq8T95wg
	MwL2Zv1n0xfFqsK8BT8GUswpI+9/eL0aAQ8Vfiln/Q9t7L4xKC0YWF3FuTOPDf11cr1V
	VJObtPg+D878IvEiqkj6z62UFFx/+e0BGgzhG4oSETZTgCq1gdO5u8r6KEIpfjOoXJbb
	RCe8e/7rIjmPtGnrSVfnhsMAEgHQTLdzhMY9YM+M3NJRfAj3b6iHsqpuB0QH4rJhywRT
	8hkg==
X-Gm-Message-State: APf1xPB18Go0hDEwxYbFkM0UypwactLuEaYrPd84kql8I0fAoOwhZBKn
	oNRvgyGVz9c9Jz41h53WL4F2gz9k
X-Google-Smtp-Source: AH8x226JW/V3CgjG3iAx2yQq+IVjY8q7KysjzGbfABpL6a8Q9MuoFBmReW64JLErRJtymZ/s4+3LJQ==
X-Received: by 10.107.185.86 with SMTP id j83mr18201587iof.305.1519771680634; 
	Tue, 27 Feb 2018 14:48:00 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r137sm373612ita.23.2018.02.27.14.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 14:48:00 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 16:47:51 -0600
Message-Id: <20180227224753.30881-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227224753.30881-1-JPEWhacker@gmail.com>
References: <20180227224753.30881-1-JPEWhacker@gmail.com>
Subject: [RFC 1/3] sstatesig: Add recipe wildcard
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
X-List-Received-Date: Tue, 27 Feb 2018 22:47:59 -0000

The special string "*" on the left hand side of the dependency
specification matches all recipes except the one on the right hand side.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 6be9d32133a..418c1ca3cc7 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -37,6 +37,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     if "%s->%s" % (recipename, depname) in siggen.saferecipedeps:
         return False
 
+    # Check for special wildcard
+    if "*->%s" % depname in siggen.saferecipedeps and recipename != depname:
+        return False
+
     # Don't change native/cross/nativesdk recipe dependencies any further
     if isNative(recipename) or isCross(recipename) or isNativeSDK(recipename):
         return True
-- 
2.14.3



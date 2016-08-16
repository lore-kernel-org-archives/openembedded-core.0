Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E36C175CF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 18:48:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so3553679qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=EUL8vnhzrGIWEWsDVOBSPvOdZ03eDjDO9fstFuEBI9w=;
	b=WGcf1qb9EyZiSB2cvkHMWK1RwxkPLzbRyn5OJz0fMPqQmAdLqUyL94vnaLOg5QcABj
	x6JLZ1ZXH+MOO8HiCZia9Hy0FzoEP0YLB9TqpwN8chUdAHdHk5r0M0cx/bFoh1hQPJT+
	3nwl7gKVT/fn6IVBpjEoUlPyy786x54KWH39Vuji/ol7WvrJd35W04pW6HLZdCWxFIbQ
	1Z+GqIeYT7mpZxtPUhmKSqXoVdrtE1Dn8M4M6oQ+SdI5bHxseiGNmP1LkeXP0wMjaNqC
	v6R53l1CcsO+D/OKibjWA5yC6EtMJCuYrZfasRxIIJQDtwkuCc+vGCwfey9/O5AUmzrb
	mDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=EUL8vnhzrGIWEWsDVOBSPvOdZ03eDjDO9fstFuEBI9w=;
	b=CmVxijJvSv1HoW8PBZ1F0JA/Bp6ORvROqrIFOCrUnx5AbGP9tTl22n3PvJzjRxXo0y
	+vtG6zsvouHbQGptyrp8bgp9n3N2q/bIVqSoUrrjR/3Lbkp9yldS+MEaLLjnVdu1bm36
	omcK2jatw/hQyA3FaQV+RuRG+M/JWSJNgUKpTbFwDwz9KNtw0PBqsuYBjEkOY6T5xwIi
	FgVHK5EKGILyEr80Mk0JdDl89Qxzjx6lzudUkgs7jvZ3Vg/6Xk/nQwpCGD8XDZu1ElJL
	IKBR0cWyy2aOWiSnSaWBD0Vkst/gMO5fjmjn6otVtnLP1eid+lEVxzODMZanlSVGQL2e
	Rtxw==
X-Gm-Message-State: AEkoouvEWZ8EbtNLibtILnqa/zs54z9X3IlkVb2enKIdX4KXa6X2YTCJ6bRO20tvX+eM2g==
X-Received: by 10.237.54.34 with SMTP id e31mr39358638qtb.132.1471373290959;
	Tue, 16 Aug 2016 11:48:10 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	b142sm14498350qkc.43.2016.08.16.11.48.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 11:48:09 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 15:47:29 -0300
Message-Id: <1471373249-323-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471373249-323-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471373249-323-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] python3-native: Extend python3-native rproviders
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
X-List-Received-Date: Tue, 16 Aug 2016 18:48:11 -0000

Add the following modules to RPROVIDES:

  - python3-email-native
  - python3-io-native
  - python3-json-native
  - python3-lang-native
  - python3-misc-native
  - python3-netclient-native
  - python3-netserver-native
  - python3-numbers-native
  - python3-pkgutil-native
  - python3-pprint-native
  - python3-re-native
  - python3-shell-native
  - python3-subprocess-native
  - python3-threading-native
  - python3-unittest-native

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/python/python3-native_3.5.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index 3334cba..594f15c 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -46,9 +46,23 @@ RPROVIDES += " \
     python3-compression-native \
     python3-core-native \
     python3-distutils-native \
+    python3-email-native \
     python3-importlib-native \
     python3-io-native \
+    python3-json-native \
+    python3-lang-native \
+    python3-misc-native \
+    python3-netclient-native \
+    python3-netserver-native \
+    python3-numbers-native \
+    python3-pkgutil-native \
+    python3-pprint-native \
+    python3-re-native \
+    python3-shell-native \
+    python3-subprocess-native \
     python3-textutils-native \
+    python3-threading-native \
+    python3-unittest-native \
 "
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
-- 
2.1.4



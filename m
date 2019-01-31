Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 834536B519
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 19:16:38 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id l10so3178522lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 11:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=/L7NWYMtLZSROh5P64ApTtymkhvUHM+58xGPjaqa1Pc=;
	b=iJ06AhoM0zrvvPE0t0iuytITreNFHZkRlGXuPewMxQU1ROERfKGfNMEviVkGDoaY8z
	Zme0qyHTQRc5W444e9H5U/Ym2seFk6tZmYWpgqc/AzIYm9w2OIRPh+9WSbTzrLi7DY4L
	YQyMvNOd5WvDU6UL/gVionACRzim4AEhuLAe7rKUZbNE/qCiAiJ7y3FC3vRsxRP2sPas
	BUkNzXquMvIv0d1/r4HN1Y0dOXRUMFcJYOVKG9EUvUEm9s90Cbg/IMp81+AnN+VdFgBK
	pizhmRrx4gWm34++0FTD/uzH1TWvutG0ZF5525Cuj4bcvohqwJRgtsiweCegCz3t1go+
	OIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/L7NWYMtLZSROh5P64ApTtymkhvUHM+58xGPjaqa1Pc=;
	b=PoOSFH/r6xjyUBmRBYQcCj6tVwoUjdQLgwf+EpffW7d9/ioh7hpHh6dFBzoDlc53KV
	X/uxwSuGYItJlVRTdFbMogz+psOJjTb19ZUzdXYTyBbKTRDMgvtkhXcSN+7/TDscDi5l
	9PBcZQsFf4PEydPao5NL3ZY4Je4lFk9TYVJmJp7Sj+0y63s0T5MVnLpTFhbdbLKz3hgm
	rvQ8GHi6zNLA5UcutfTU6i09skE4Gya86esW+zLZUD9ukW4Cc3t2v7c/6sBuVHVX68YJ
	nowLoM0PtcZJuYRRr4+9/sNr6BRUs3tL2h7DF/3OMDdrJCgvDOgsll5EYkjl/7eEFm2H
	OQ8A==
X-Gm-Message-State: AJcUukc5MVuFYkbj9nNTv7e+YbIunM4bh3hTMzKoDm8PBiScTe7Y2S2C
	WTdWaBCZdH8w3lI6B4nea1wm/ePsMPU=
X-Google-Smtp-Source: ALg8bN7560/niz9dVOM+qV1Vf7Z0nxFCHxJGueyYfk8fa/TJBpQlio2bhSzvhoKjlOM4BvEsdgUQ7w==
X-Received: by 2002:a19:4ed9:: with SMTP id u86mr28956092lfk.78.1548962198677; 
	Thu, 31 Jan 2019 11:16:38 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	z7-v6sm902491lji.42.2019.01.31.11.16.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 11:16:37 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 19:15:32 +0000
Message-Id: <20190131191532.5445-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.18.1
Subject: [PATCH] base-passwd: Add kvm group
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
X-List-Received-Date: Thu, 31 Jan 2019 19:16:38 -0000

Fixes the following warning when starting eudev:

  udevd[<pid>]: specified group 'kvm' unknown

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../base-passwd/base-passwd/kvm.patch         | 23 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/kvm.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
new file mode 100644
index 0000000000..113d5151e7
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
@@ -0,0 +1,23 @@
+From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
+From: Jacob Kroon <jacob.kroon@gmail.com>
+Date: Wed, 30 Jan 2019 04:53:48 +0000
+Subject: [PATCH] Add kvm group
+
+Upstream-Status: Pending
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index cea9d60..5b62284 100644
+--- a/group.master
++++ b/group.master
+@@ -34,6 +34,7 @@ utmp:*:43:
+ video:*:44:
+ sasl:*:45:
+ plugdev:*:46:
++kvm:*:47:
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index c6be1c1d08..d1aab09181 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -12,7 +12,8 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://noshadow.patch \
            file://input.patch \
            file://disable-docs.patch \
-          "
+           file://kvm.patch \
+           "
 
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
 SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
-- 
2.18.1



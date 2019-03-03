Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 316B86C4D8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 16:53:45 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g19so2294960edp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 08:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=p/PaBg+A58OqazmlRLB/qKVAuvyF++a4UwOH4lwGLHY=;
	b=f3KAxDI1yA5yuPB0crwpKcoJSCZjVODofF16lG7N61ufrXaYzzXsHg5ss8znsCPSpD
	TVydB36Hv+WheQuY9mSl36HmgyZKw397umvGMxdlKOYRINFhOk19DODnp8Bdl6X1TdrJ
	Qzf/3FTCnIiViH8ZJr1qAuGr+/Qn+QyZV418s26vdAsr8zrOS4F3e7Oc6ViUoksTzIbA
	xZPCOEQazjn8QXbXWidUQ8/5QY1Bn7MDbTGD0y8Etz4sVcpV2VbLtd1/Wuclpw8ha2lF
	0P0lSsla1mcXpjb5P1b5n5TMLGm6Ri4UUnTT4unwuVfguF8fbObYlBLIIcz1mtqOMb2A
	TRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p/PaBg+A58OqazmlRLB/qKVAuvyF++a4UwOH4lwGLHY=;
	b=A/5k8yxvDW7xbYEMnG/AAGoEjPR5Nd1ZStcCi1NXoD8aU+cet6cavJCUgNr1JPSH66
	1L5UgSizzQjSEZYFs/y85ari+URVo2Lys+DtG+F3XXWQz6wAF0E9d1+DTW+mdnMTS3rT
	G8Jo2y6NH0IcUQi9OSbAh1I/xDnRe6fONHpQWwe7yYMwbH9HOtOlvEC2ULUuNdB5ZGNl
	I+bjx3+/KOMPmyBwkGTIxSo1zCGtXYUdWX7gFHz8O47/aviOQNztnrXw3TSqq5N4oEKd
	+TXKWny4Oj7oMmmvmyzCXmYaNwjg+05R2OPQZSNdPsf7rDY9QrskHe9RQV8m4lyurGIc
	jbug==
X-Gm-Message-State: APjAAAWR6c5E/ZYZTGjYaSyv+EGUzVZuhwy3czWXGNOSMklF2t2ln1Kh
	1PFGkFTc//507bqpb5q97H/fCOgYngQ=
X-Google-Smtp-Source: APXvYqw+PKwif5LyCKDCptTpt5kSsu2hpAYTbYnNSU8HVww/kYOGFQJadEKJKM9SlSRUg0rhip2dpA==
X-Received: by 2002:a17:906:4044:: with SMTP id
	y4mr9895696ejj.93.1551632026316; 
	Sun, 03 Mar 2019 08:53:46 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f10sm1356498edb.60.2019.03.03.08.53.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 08:53:45 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 17:52:42 +0100
Message-Id: <20190303165242.14424-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] qemu-native: add dependency on dtc-native
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
X-List-Received-Date: Sun, 03 Mar 2019 16:53:46 -0000

This fixes the following build error:

../loader-fit.c:30:10: fatal error: libfdt.h: No such file or directory

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
index c8acff8e19..e3efd873ca 100644
--- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
@@ -1,6 +1,6 @@
 BPN = "qemu"
 
-DEPENDS = "glib-2.0-native zlib-native"
+DEPENDS = "glib-2.0-native zlib-native dtc-native"
 
 require qemu-native.inc
 
-- 
2.17.1



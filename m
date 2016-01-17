Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4438F76988
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:40 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id e65so142596913pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kVdjeDweEZYylummDV5yASn6+05siiSqJMKX3ppQPNc=;
	b=CIqgAiSRe+IzZsqNLD+4PXltYeI/cSsZeJ19tX/t4rMWDXtLGueoc6f70wm6h8Wewd
	0zFMYEqFWTnHEfMvuvjP3DefDXJME3ABa/n/4re6gqrspGgekLNTz1AZ+SobwOwYVRwI
	LKyJTi5ZSG/44ETBQ5+EDPPUkLFMw+hsdclkq2QYO0C2rKXVT0jYst5tr8EUFYrt7mjx
	zUgWm7oZKDnKt6UtaAJnoh6Ez1Oy/ntM5XC1NQG7Ok2zxH6KH1+cDmlQakWsg4MbK/RS
	vn1hSRyStOhLNQiHNyvnNugW7/iAUV81/expoE9Zv5D7q83jQWjsSsq5ZfDsdNyUXj/D
	fkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kVdjeDweEZYylummDV5yASn6+05siiSqJMKX3ppQPNc=;
	b=PQE78ENnGdSaYMcsZ3K+eVqzgL0AW7+KHbc8gWSi44TUaxfL6y0j42P/qakYKvfcS6
	4oTFjBjYboaSpEyl5DHIiwZq5Wokd904WzGb6fsJXCO3k/2WOxBF7qaUIqQHcIdWy6P+
	kiZ6LT4apHpwz0FKooUJV6dasq3fduxQvUCP7d/Aj1wNMd9Pzg76MwR1uB72gHecSEz7
	jEvnBB6A+oSkNIB216qI179DME0Pov1IzSFsQAB9U6+Ule6WRELE1NrFMFeZkOQyJW0l
	KAHeOLbmF2mjmqb0ZSYqHFG8wXfnCfWw+fwkwa3ruFskyk+L7xJz6N/QuWQ7pNMUl5pU
	m6zQ==
X-Gm-Message-State: AG10YOQIRaluWf26vuxpjXhMqR2KEkYl5pEndY8xA+ZbgbiS9PhpjjICIdwwJjhkSZWlRw==
X-Received: by 10.98.14.69 with SMTP id w66mr8132335pfi.144.1453030662046;
	Sun, 17 Jan 2016 03:37:42 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:19 -0800
Message-Id: <f5732efb9292257dc6952a7a379c1c9aff618aa5.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 46/73] nfs-utils: Disable tcp-wrappers for musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:41 -0000

Doesnt build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
index 2e0c8b1..ea00656 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
@@ -64,6 +64,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                "
 
 PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 
-- 
2.7.0



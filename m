Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7867F376
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 19:45:32 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q139so3594963pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 12:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VT05qZSRzz8WMjPfePjZIec4TvKU50+piBZWf5l/jUs=;
	b=BzsPmkCsTeNKpNXXEmgPFlzbsB3kz1lbX1OkqX73qoRdqhe9uDxCinCNvXoaDvQpZK
	RaqhyLNZCQNWS8Y62EA+9PoBCQ72LhHSEpt55nSQhobyE4PCIljPgMYTwpCuiRSWdrWr
	hjLYJLLfjiGS4+q4vtQrCKsjk/e7nZAVggdEmYBAb7+Sv7XGMH4eIxY6zwnSku65wmHr
	DmcOn87AJuSvkI51TbpY4N4HxjUwdHJpHCRqxB8oNMu4MXq6a0rTL09Eyfk+309dgQrJ
	umRDTf4T4GfDlMlB/6AXYM44h5v2Q907JSuKuHCLtVONNYULlQ5QSnYOYDEOKCLaDm4M
	T7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VT05qZSRzz8WMjPfePjZIec4TvKU50+piBZWf5l/jUs=;
	b=OSRzFDMqK63H8IIvW6TPBUrm1xy0aPeCk4cTyoB2V4QH9sJ3SgDsBvET05nFKKZ6f4
	IJKHH7ctR8I0FgcVE6ih/wR9YEEejCL5NPGhNvHDtqZ8k8aP0leVWqd3j9jCxZZCD+xO
	GcTw1J69FbZu1brqTTfh6zqmtmIlhq5Au+DT5NeBVIkcD1Nv91VD8mcS6d/KBcONUk5o
	K1XUpCdKGINWM2K5/5KcOgELeX03VEQBPU8MBD4J8/x8GOLgjxf+Jk/pAt+LFbx8nikl
	3PB3+i4VWHyyTGlwwTqcwdiCV/i4gbREmQHUedKHa1SH9ONSi1aS82VvFZN3w0poL7NP
	hluA==
X-Gm-Message-State: APjAAAXo2/EuZ70MQjSFFUWhY112q2LcoCX/+/Xy3r3LxC2izoHAs7Sd
	GqLN4sS/4G6ue6uyOnM/FsRzWvAK
X-Google-Smtp-Source: APXvYqzi8sBJv1L3Bx0HGAnclXn4Q/jApkg9rxv2u9wNy/+W7RR+jtu/CfqV94e43hdYsYH/mAdXyg==
X-Received: by 2002:a63:6fcf:: with SMTP id k198mr9124926pgc.276.1565984733106;
	Fri, 16 Aug 2019 12:45:33 -0700 (PDT)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	o35sm5537333pgm.29.2019.08.16.12.45.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 12:45:32 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:44:03 -0400
Message-Id: <20190816194405.12751-4-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190816194405.12751-1-wesley.lindauer@gmail.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
Subject: [PATCH 4/6] sudo: Fix BSD license file checksum
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
X-List-Received-Date: Fri, 16 Aug 2019 19:45:32 -0000

BSD license files must include the copyright notice.
---
 meta/recipes-extended/sudo/sudo.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 90f2039bb8..15075bcefd 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -6,12 +6,12 @@ SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=6c76b73603ac7763ab0516ebfbe67b42 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=4a162fc04b86b03f5632180fe6076cda \
-                    file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
+                    file://lib/util/reallocarray.c;beginline=3;endline=15;md5=b47f1f85a12f05a0744cd8b1b6f41a0d \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
-                    file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
-                    file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
+                    file://lib/util/getcwd.c;beginline=2;endline=27;md5=09068a19b4f6b6f0a0958655bfe98b63 \
+                    file://lib/util/glob.c;beginline=2;endline=31;md5=1f2f771c35fb0658d567a7824007e56d \
+                    file://lib/util/snprintf.c;beginline=3;endline=33;md5=63e48e1b992bce749a19dd9b2256e9a0 \
+                    file://include/sudo_queue.h;beginline=2;endline=27;md5=082b138b72ba3e568a13a25c3bf254dc \
                     file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a \
                     file://lib/util/arc4random.c;beginline=3;endline=20;md5=15bdc89c1b003fa4d7353e6296ebfd68 \
                     file://lib/util/arc4random_uniform.c;beginline=3;endline=17;md5=31e630ac814d692fd0ab7a942659b46f \
-- 
2.14.5



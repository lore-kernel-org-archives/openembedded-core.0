Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCBE7FA3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 02:01:22 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 193so3613051pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 18:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QfVdiLnHvJzwrGXuL3f7e2tFUx2dOGVNSRgAvvQKePY=;
	b=YyRqSuLTHHpDOklE93wDew9sJ0PhXIt06dUOCE76lrbDGKdCWbYkd14vb9ag5hsHXz
	zERI7GetlA0/XVQm8/tGbsZWXwfTJS0uXyQyxVLZlsecQww0I0h55vwMHxizbxBPrt6q
	8fAtUygEAEx+N4D1LWoY4ki31E7ydEcQ+SQClMuoiejm8QeXNWa0Tdk0qpD/u3WCs3lu
	8MMvc5BUMHsLyRtX0FPxj2YNOEUEcxBjCBuFjkQS2ZgC4LQzvOByFG/6qaX1eXBISx2U
	co6bkEM4hzRIZBT9rUBLSyXyzBnCC4hUIhg9eW8dLP2VGAnicTlwZemgrRHbQOclNKCh
	MFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QfVdiLnHvJzwrGXuL3f7e2tFUx2dOGVNSRgAvvQKePY=;
	b=kpDu3/oFVXSDVgum+TE9IhTAza9DiZ/5vBsAcCyjLsbzGuR2w4flon/+uUFZSUYlvv
	l4JBIKzqdJSjWXe/ndhMcEHamwS8PZ+WLd19+gNUIPzSee8K/3Zbp7T6D6ea4OcnrHIi
	mH2LyvjiwYvgweI1xFp6DKqpAYr58/1BcYU5DNxVB9yJhYVSOueHKA8sDOHyQfzjFj6T
	1sZAdVD6m+DfyiQgwrcaDV3o92Q7jBkqc5sHoFkYcdGquorr13jQhfoNareBtyJhtFIt
	Xyo/4ZewI4Ys2zoAIjYND+lDxcrWo8QZTvczRY8Ztjnn/aIZlVbJ5dBIfUaoSvshlAjQ
	79zQ==
X-Gm-Message-State: APjAAAVU4ir4rcgrt11wub8LK3386Wyf6s7vndAsyxjjALD9YRdOpMKw
	6OcLh4I7D8y0XqD6rXJaucav2Nk2Y/Y=
X-Google-Smtp-Source: APXvYqwrsw0j5WYLJJsutykUgGxPsfMPv3Qvtn6Y6eLV6eDz8t7Q2fKBeZpWSxEXgswmjHYwoVKU7g==
X-Received: by 2002:a63:29c2:: with SMTP id p185mr8459749pgp.39.1573178483471; 
	Thu, 07 Nov 2019 18:01:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	x2sm4113994pfn.167.2019.11.07.18.01.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 18:01:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 18:01:02 -0800
Message-Id: <20191108020102.757861-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] libnsl2: Update to latest master
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
X-List-Received-Date: Fri, 08 Nov 2019 02:01:23 -0000
Content-Transfer-Encoding: 8bit

Get following patches

Detect recursive lock between yp_all() and do_ypcall()
Detect recursive NIS calls

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index c3a24face1..28c84af7ad 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "libtirpc"
 
 PV = "1.2.0+git${SRCPV}"
 
-SRCREV = "37c5ffe3038d42e9fa9ed232ad2cbca4d8f14681"
+SRCREV = "4a062cf4180d99371198951e4ea5b4550efd58a3"
 
 SRC_URI = "git://github.com/thkukuk/libnsl \
           "
-- 
2.24.0



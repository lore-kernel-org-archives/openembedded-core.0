Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60E896BBF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 12:17:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p4so11910733wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rbe5E17omXX7+3z0cLYE1c7KNTITU3OFz2LaKYqn3bM=;
	b=IxBiNnPTht3+ZwBwSuzRQ+9YoRcnc3FKkWsrrdmL4boQOKvhVanuJksSuxZ3SHqISq
	H90SxUBytcrs0nZueSTZFogxnOkY3gINxnUBuInhJ28jmFEyQ6WEVoXQLcNqDA6COVvC
	4nyjWCTXsh7E2TVgF+QBfEO+wbp2z1bnQdd6AnjYHngQedWrQ928YAIIRTeoDAtlzUUU
	BeAaTElxWXvZ0XSw/rmzpvJooUsQwYAkvNI4XgwvduyDroH5LTF8sEBe+MG0zUKebVTB
	U7saQb1fzyJUz2eYquNZNChf8juoQyDkKoDhUeGO5+A4UvEmq912wmgZ8NbFeLjH8LwV
	RH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rbe5E17omXX7+3z0cLYE1c7KNTITU3OFz2LaKYqn3bM=;
	b=b/87zw14aW1mOjlGP7nDUYVUflMWTaVYY9/r0PNZXeYFlvFTC4sLDPYL+AuLT7G2gs
	6vuTp4vW4Sgxd5tpXIeGsxEOJhAB5H7J+mrqujeDGIApbdkZ6oRWsI0zFRjj5+4HfyWK
	USyoltCBViI5epeYLYvCYPge2ThvDkwrbg28Dmg9kOl/HjrH/KTwUIPO+5bIoV5a/v+5
	VyUP2tCvD3o73boPpXzYRKDI5RiE8hEM0cpuyfIbru0qaiYRjZ5Y913B9DuzuR7v/66R
	rY5agMnDWdUiXPjDWB3iok9lfFVk2twTbKk1QOoy08FcqyxmOQv+w8CfX5vwomWvtD8d
	sHQw==
X-Gm-Message-State: AA+aEWZLRsr5XzF9JZeLHN/ao9YOREGsAG8oPmOE1GsJWqb3LI/LDQz7
	62vfJaMTBZAZ4GNl4K6XBp2fwuJS
X-Google-Smtp-Source: AFSGD/U3UA3hkRf/Ktdln818jIDA6CrtDDEgceUydOEYuAQH5ey1aSazLogxXjSN9WMF+SoTaLgQxg==
X-Received: by 2002:adf:bc02:: with SMTP id s2mr13418735wrg.255.1543839439676; 
	Mon, 03 Dec 2018 04:17:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	125-v6sm9019501wmr.22.2018.12.03.04.17.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 04:17:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 13:17:10 +0100
Message-Id: <20181203121710.36010-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181203121710.36010-1-alex.kanavin@gmail.com>
References: <20181203121710.36010-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] gobject-introspection.bbclass: add libdir to XDG_DATA_DIRS
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
X-List-Received-Date: Mon, 03 Dec 2018 12:17:19 -0000

Otherwise .gir files installed in the sysroot will not be found when multilib is in use
(multilib configurations use libdir rather than datadir).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/gobject-introspection.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index a323c1fc876..4ceb0c68b12 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -25,7 +25,7 @@ DEPENDS_append_class-native = " gobject-introspection-native"
 DEPENDS_append_class-nativesdk = " gobject-introspection-native"
 
 # This is used by introspection tools to find .gir includes
-export XDG_DATA_DIRS = "${STAGING_DATADIR}"
+export XDG_DATA_DIRS = "${STAGING_DATADIR}:${STAGING_LIBDIR}"
 
 do_configure_prepend_class-target () {
     # introspection.m4 pre-packaged with upstream tarballs does not yet
-- 
2.17.1



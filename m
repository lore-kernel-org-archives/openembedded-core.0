Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id AF24F7C5DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id b11so3704623wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=kMBxJGiZeQRjvLWbqx+BwR3On+zSYTq0Z8b9ZBsLTppiaOpeE4jY+y/xkeuURL2NsE
	dxFbIqVEO/VySoEkyu9U4TrQP9hsyWn0/6HWXmY1jvASoN/CNwqHdMWbyD3wUVaw9IP2
	qh3hEowgLUYUHERZTEMe/v03knjIO52qSUxkyESRt62fYhvi6lkzmdAzEBQUSgVR2edl
	LvAMj9QQNSZI4hutLw9/9OGEYGHEe0XsxHteOpOzAiVqbkjd7YcnfEtjLf+LPtJKXJB2
	qcNlKltW3z/fLcWuXog96zdhmi8E/W8kboyZ7hR+AH+5b9GLl69bmIy0mmaaF9j2nvl+
	42YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NxZvp+ChsdE3xEez1g19uz+efPo6j3TgearBPtjxncQ=;
	b=VG8nR2qwZdyWRPNdy0kuYkcAN239xv76T5V4PeJGx+X1Mz58veC7La72g7HmorJ3QB
	MIWFIEQHnIH+k+oeI4gWWChJhauCHMsevorRqsQ+gz50yy8V7zQQ60GxszVwuXSJWau2
	B9lQ6pR+rXVepS5T8DLpSddv0k8nK/0t/V2oi0XR7ew/95Q8P/sMYVEwx9OlrUfMemHg
	fPpkGwHG6Nj66hVRYvYJyO6Vcye3+LBckj9mfK4Sodt3Gy1x8oKjcf545CbFD0ILLfOO
	k0TGvubeEMU5ZI4maQ9PceL19qlBeaEl2oXGRH2nsA7ckOy0CWniHmXGnh6JJhhDP6U5
	1xOw==
X-Gm-Message-State: AHQUAuaeLbEkowbS1dTc5bq3AfchVRYcIt4uOkGufOH17Q4BlnxFZbTy
	t06hs+/zbfKZhAXpbsZhE8e+iQA0
X-Google-Smtp-Source: AHgI3IZ4bnuxzxkqStP4+WYFW/ai8oHNGT4lZHqTVufMmFus7HecPBYGEdDUxDdyHlX40yLBnONh6Q==
X-Received: by 2002:a05:600c:2113:: with SMTP id
	u19mr2500351wml.14.1549637166102; 
	Fri, 08 Feb 2019 06:46:06 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:47 +0100
Message-Id: <6e3cb0144d6441b5f768e897f47d577cefce822a.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 06/12] qemu: add a gettext-native dependency to gtk option
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:06 -0000

xgettext/msgmerge is used during do_install() when gtk is enabled:
https://github.com/qemu/qemu/blob/master/Makefile#L743

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dccf9dcb00c..b80b9e131a1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -87,7 +87,7 @@ PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
+PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte gettext-native"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
-- 
2.17.1



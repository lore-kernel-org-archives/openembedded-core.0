Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 09FA27CE8F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:49 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a22so2202493pgg.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1A61YyoFm60T6f+77rm1NnuoEnh68HK3ppAGQc8C5Ig=;
	b=FrSyhspo0lbfdvYbj45qWxFWLF7aWyY8aCSiua0FZDaDJB5hvRsirO8WzGWkqxua9W
	oLT/InYGTpvRTAmcZ2nXCBnLQIV+Gv+3JFNCcHOoAhH9lNWc+iCs+G4Oxi0EZC8Tn3jG
	9QMXHuFEEZn7cTlod3ri5af8xTjY8cjP2ItZBMIOPwICRtjEewbhPDIKCsoHJbnR+4ft
	YaerdETsi8wLlw3e224gWQMqwII9mBGGc9KoAwfFp3Ic/NRc+UIRle5QqibP5zT+q/nj
	LIAdiCIvAP+p79+3Jo/hb/4v9624CEPXxWBkE2YhOGL8Xsq9L2cPYWY7SjeO3Q46fhcW
	VQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1A61YyoFm60T6f+77rm1NnuoEnh68HK3ppAGQc8C5Ig=;
	b=HuDHB1+CcxiQGGD0VPIZxfjAxFNHExxlfGYoCoXGjbKJdTvyunotvdjsuqPfzbJkGn
	WjZjSejNryi7tP2vgHXruuQTYYIJcCmJP5tybZ/BoahW7P4MqZICR4eBSABLMJzhDwex
	QlngP7iHvNumgDXwT2lyhDOVQwevKh1i+dlhjUdLTKK24C1ei9o/Y0lKxXcn3yPbeY7B
	OtqqZ9Sv3xZsjEugTbec8pFgPHBjJXVzWwjXYJeXiU8Pzbpmf0f0fjykg2kl5XS0tsy9
	QIT0Nn+zuRmGHtgdDZsk8TjYoKj5b3tV6tvm07WIFHTKbjdK2XnvsuC6ulWO5EqaIHz3
	5n0A==
X-Gm-Message-State: APjAAAW4UBvECC++NesueTs8YzeR6Jm0gSr7X9emWmFXMmoynXLYlM0Q
	Z/gwWTaGPIsgwZ4jAZetZJ5jyAOy
X-Google-Smtp-Source: APXvYqykZeaNEVfghwL3+cpVbzWhHbi538fs8AVHMFxTCck0i51cOisWlOoowlFJRXIhKWPcdepaaQ==
X-Received: by 2002:a62:be08:: with SMTP id l8mr28899575pff.162.1552241270945; 
	Sun, 10 Mar 2019 11:07:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:39 -0700
Message-Id: <1552241263-26116-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 08/12] kexec-tools: update 2.0.19
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:50 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../kexec/{kexec-tools_2.0.18.bb => kexec-tools_2.0.19.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.18.bb => kexec-tools_2.0.19.bb} (95%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.18.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
similarity index 95%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.18.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
index b06c343..f65cd9f 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.18.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
@@ -20,8 +20,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-Disable-PIE-during-link.patch \
            "
 
-SRC_URI[md5sum] = "43845327af54b002aaebd5b8076c7bd7"
-SRC_URI[sha256sum] = "594ac13ea437c70b0d5f0eaf5075b93422b05c23c2a5e21991d2442bbd202d86"
+SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
+SRC_URI[sha256sum] = "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4



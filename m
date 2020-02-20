Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7967B613AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 23:48:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id s144so3911168wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=19MYFCeVH+MlK8hgWPNwnP2dYml6Yx/AvKXSWzYQhlM=;
	b=ELXIxjKlai6nSjdgiGr84HLcA0fnKrEVMylY4KfJu6adkNxi+j/L8ZacpiZQs2LOPh
	Qi6CT5nrEnTFb2eLpvxKOE+9s7GPSRgLjn5ADSWUz1vvAU9tS1I3l4UagvpQUv44zOwq
	pJnaueczRKDIgCVPyAkDOD9aDKZvPmS/ALd79agCZubVRIdi1IV8D2J6h1IRbedap+qi
	bXyrjopGLUgVsMyo46CSb9PUr5YQ3IvpteJe1IKAXVyyv2fo9K8XNqCEbvFc/x1NACEA
	FUQYvIoDXY6EM+K9sME6F22zdDiIeT+XJUH/4c9+40A/8fTcQBUgAyhIR6Q3QAkUG2Zh
	yW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=19MYFCeVH+MlK8hgWPNwnP2dYml6Yx/AvKXSWzYQhlM=;
	b=uj0LBNSGpSSXjEimtIFqwdXlNFW5fALK+mFrwp6OSrxi/+pYQdYKkwF6hIBG/sbQWW
	vGSRQItVaBJoiR/AT/6G4tiqMFLMZRdSQilBzs3WWtD0tB//Ih6m5kO6Ils/sxWQpL6l
	pzOOj2Pp6Jj3gC6NJDxXyMIhaWUUYjzbjWEnaFSzbdVj1YE3hhfaynvxHxcUpZgSzTMX
	buegbM/4SzUjtVsWx1dGmWkHgc2uIw6ccjPXbRI6QoRGIlcCuNKz3ZAwLPTR7dG8NqAI
	BeeoEU0QaRT49qHyOY0fUOP3v2l/iAxUuq/zpcLlnWpPFv1QjLaGjKmCZXiS4blrwgdO
	RZ6Q==
X-Gm-Message-State: APjAAAU3cdnxSK6UbOHP88HaQlS81KdtqwUl0AFSIZk/spWDjw2XEvDg
	BzjQi5OQ0j30BhlUV+Ap+XekBhgu
X-Google-Smtp-Source: APXvYqwKc8NktTuMo3S+AZMbK39ocFe1QBxdBAm5zy5D9TgdYQBG55ASwU/WK3vojvgWPdPJVq+OBQ==
X-Received: by 2002:a1c:610a:: with SMTP id v10mr6750793wmb.44.1582242531019; 
	Thu, 20 Feb 2020 15:48:51 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F063D08DABBBE70F130126B.dip0.t-ipconnect.de.
	[2003:f0:7f06:3d08:dabb:be70:f130:126b])
	by smtp.gmail.com with ESMTPSA id
	a198sm1185361wme.12.2020.02.20.15.48.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 15:48:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 00:48:29 +0100
Message-Id: <20200220234829.12306-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200220234829.12306-1-schnitzeltony@gmail.com>
References: <20200220234829.12306-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][master-next] webkitgtk: enable gobject-introspection for armv7ve - it builds without issues
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
X-List-Received-Date: Thu, 20 Feb 2020 23:48:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Maybe armv7a can be re-enabled either but due to limited resources there is no
chance for me to test.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index fa109446d1..a1dba73c51 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -127,7 +127,6 @@ ARM_INSTRUCTION_SET_armv7ve = "thumb"
 # qemu: uncaught target signal 11 (Segmentation fault) - core dumped
 # Segmentation fault
 GI_DATA_ENABLED_armv7a = "False"
-GI_DATA_ENABLED_armv7ve = "False"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
-- 
2.21.0



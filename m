Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6002C7F83A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:37:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 6so3986275wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 03:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=adKDbDR3kXb66FjvO3rxmDHkBR09hmvnsAyfV7T3pUk=;
	b=wwImvBAqzSGQDlPK3QaIR7oV+aJQZxcEBTL8IgAhrneEmoTB3Rw+P5LZvKdmPpkmeC
	dJpAyl8WgQ8NDJc1BVayVLkAa3Zey4OUSRky0Q03rWI5WmgWEeh3G0uSwHWNyLAUvHON
	eD/GZ6qRbyDTIFGlj0sy1VIsi7Zg/Qk50Q4imiIIbyijlTwW6USYlDvXIE0aFaJkU5/Y
	yCdwU2LTUJDsVCmh4ioqG7XWVypZt/CVoMb+Rh0TFUrTDa/iGPUVH40Hi5LR2aE0Uc8b
	D+C6S7WeCJVio3j65r0VmYVPFmCj5vrYrKvqzhdTS4CqPcIPXbuQ6P1lWFoSJ62zkv9U
	cC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=adKDbDR3kXb66FjvO3rxmDHkBR09hmvnsAyfV7T3pUk=;
	b=m2WTfib9FIDsg0j9tB/bNULxTXs2vlo6nQxmOktbKWY8ndM4k7lPGu8RsLbHpjvhwv
	K1hap9xszA4UWzl6UQT8wr+rAvWoQnn8WNUm4gQWFuzPuTTrJ/3UIxpYm4WNTRxaJa3R
	Y6xZc9mYO2T0YtBA5v7ySnS29IXMVt7zLsvyn2+/Qud5Cwp9HS9jofOiC1IhcmEGvShm
	289aTX3T/VRmk5i/btbUAgHMeXZ6tQ/N4KIpyeLL4tiFwW2tQlewvvTXMEJg0f7gqYkr
	sEHZKHCBAmZQVEpBaDj7Zht8jYXvDdPvoXgexPwDwIRwvERD/DHtvjLPeoLFF/VmvwG2
	3WlA==
X-Gm-Message-State: APjAAAVz1tD0Os+cIjdT4RhEtcy+pmjVkKSEB/FshvH5fjzZ6heySt/Y
	kicQIv9HDwZ/O3lKPeYATBHEdtCT5K8=
X-Google-Smtp-Source: APXvYqzlSNJa5Ac2sIhdY3ittCYzPnQpVANqdnG3wbHhL2DqoKGN35M033bZNTDVBk+A7RO+T1cDIA==
X-Received: by 2002:a7b:ca51:: with SMTP id m17mr1666454wml.110.1572431855372; 
	Wed, 30 Oct 2019 03:37:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id h3sm1980519wrt.88.2019.10.30.03.37.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Oct 2019 03:37:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2019 10:37:32 +0000
Message-Id: <20191030103732.18655-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gst-examples: rename so PV is in filename
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
X-List-Received-Date: Wed, 30 Oct 2019 10:37:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/{gst-examples_git.bb => gst-examples_1.16.0.bb}    | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_git.bb => gst-examples_1.16.0.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gst-examples_git.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
index f2a3afbbfe3..e83ea8cb790 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            "
 
 SRCREV = "d953c127c1146b50d5676618299933950685dcd7"
-PV = "1.16.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1



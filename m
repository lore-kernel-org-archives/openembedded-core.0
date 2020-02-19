Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id C2DC1613C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a5so2011096wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RKvjMN9ULfLYHW3UUEj4e6uYPxjam7/SribAph5jaSE=;
	b=c7sOAVXBiAuZN53mfoumxC/39752nQQziEA/QOtvbZ/TzizhcwkzBQw52HJnhJD+Qz
	KdBIR3BvCWBavgERlFV44jiRjoPisC+Dt6epk0tuaibSd9rXQpSdB4ZVAb/+aDzpRh5R
	HcjUpnmPxdjaPrUQOUoWN202vY8g7vtlVwZj/KcmFavmWOMEO7HYMrdr+DEaWeKGBq9D
	4yYx5E8iGhNPjjqxw3sRmQfzohYwQXMFZR+9lh+CYIu5Rq+bme1/us+aklylMANdu5iV
	yVCXukrvGSc5MaQEO+zUBtwbaXmENWBhpiOj5WLdgOJPtGwbU12nM6wTdNhRYymq0T5I
	Wu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RKvjMN9ULfLYHW3UUEj4e6uYPxjam7/SribAph5jaSE=;
	b=b+IrCjBdD8ttzbW/INjTfXrY01Vj7LqBsoVacZ94bHQ4BU7KLHz6XB/EDsQ7kPCo1y
	HaScerxR1vMullNUd85wYOCX5jiszRfo/PP+ifnAdwmJL/KUBWxzAmWmFNHWvL87VKRH
	N/cNVKxrsETxuULkASV67BT5LCkTldMWrz+PltTa6jYMiL1kxnocFQZfOnkalLhCNmVU
	SzgdTmvJvQraZT0y4aG4WacBJytNf/4L1vWl7Y4vVEWm93AeAUUIkx1X1XmEOGpox+LT
	FuJkr+LVgptl5GuIQpMpBM/4j+WYsfUA3rFPG3njiPpk39dLM36WwaqQn3Nk5GcLx4qj
	jCCw==
X-Gm-Message-State: APjAAAVwbUUzp2xSlpvG5Tx60su6R5a+67yg8yrNB1f5XUxlgRQK/YWj
	FGS1rgziC88Vfz3NUrlmiPPcxjxo
X-Google-Smtp-Source: APXvYqwiM60fwSsIlPar6cBFbWltGWmipp9I6H4RI7IMOOvzFhivT7gr2BndLaub+oPvU2Asusb2Og==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr12385028wml.83.1582141702251; 
	Wed, 19 Feb 2020 11:48:22 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:46 +0100
Message-Id: <20200219194752.7967-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] createrepo-c: upgrade 0.15.5 -> 0.15.7
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.15.5.bb => createrepo-c_0.15.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.15.5.bb => createrepo-c_0.15.7.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.5.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.15.5.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
index 9b6c89c348..c6a53ffece 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.5.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "db3a2da68842efd8a8f69c40a222dfb15bb1f4fe"
+SRCREV = "4ab6b56b8b718396386982afba4ade297c14d91a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.0



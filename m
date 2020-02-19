Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20F2D6142A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so1949780wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kpgivxzAzqvuwpkC3sT/WI9bchzFxeCgkw00JgBdEQU=;
	b=s8wQvODwvHQOFT1jJcHjiI2fIvwPaL1iAFr0MyT8UPzAsENiD8lYejhXPA38ZNSlJq
	eC2KSJDXQfaObq+nhHyA9OGJl6leFRGd7xa5VUo1j/9hx2oaYmvGJJDzw8VrWy1IDN0x
	TTdTchUcRz6sAQmA0+MyA8qguCOvk+VAcR24MewMS0HExnS306b1sgG8PnqNhFbvDe6o
	e/8HV1a1VyhoTy7ef23rU6o29ptwDjjO+CpJg7rwYS6vRJvoSv7EdUScPfmU0nwUbT3X
	4Bgp2BKeWED7FxFBWy9IjWYP4nRpseYkmWXX1IET5cI9x+ut1+ribIg0HlSyrTq8SNYV
	q7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kpgivxzAzqvuwpkC3sT/WI9bchzFxeCgkw00JgBdEQU=;
	b=fOXt3/ToHcRHZHZRnvC07pbmfgMEkGCg/Eek+fQtOLPO8h8zlkEzH/aJHfXh1hM61x
	Tb/2sVx50cjEv1MryzsjrPuWILJbE6oM5eMbgjlONfhLA2Mgz6ZvbyReyG0HwZFYFC4O
	smu4jImrxDLBxWQHK2UCPp2GS7is4HJXfyPyQyP7QvSY3YXdozRNbYe8Z+GBAh7pvPql
	6FKFY7HrRSphM3luskwxKWE7QpP0Wz6v7FXqeukcI4zIff5j58pREqf3AAw2GtfQeu+b
	mV3wl8uQSoLj2jYwpcmCfBt4GzggZK5mSanyP29mlY5lp3nctMvjNp9lPtxxS1b6lBbg
	gasA==
X-Gm-Message-State: APjAAAXI6umlGvFQMG+zeSpDv3FzXiNr6uBV98i5hBTyX9CYXKOkI+Rx
	m25m41VnisUTTPEmYS2oWGGPGbiw
X-Google-Smtp-Source: APXvYqyxybfY5ETCL/Dv3uewaQNBf+/6dFTU7hhw9V7GC4BU65kvtA/A3E6+DJqGL+MCv+1dDF9ykA==
X-Received: by 2002:adf:82c7:: with SMTP id 65mr10811966wrc.374.1582141705578; 
	Wed, 19 Feb 2020 11:48:25 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:50 +0100
Message-Id: <20200219194752.7967-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] p11-kit: upgrade 0.23.18.1 -> 0.23.20
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../p11-kit/{p11-kit_0.23.18.1.bb => p11-kit_0.23.20.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.18.1.bb => p11-kit_0.23.20.bb} (93%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
similarity index 93%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
index 19895ec269..26833ef431 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
@@ -9,7 +9,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "b0ebe7555c291808db29377ba79cb8326301f0a6"
+SRCREV = "762cdaa2cd5c5ec09cc844f9a6bdc551c7f6c8ed"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.25.0



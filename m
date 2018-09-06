Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C28C7961D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:48 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f38-v6so8480978edd.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EH6CLnnnGG6wUG2tzq7oSfLDeOw2/MXbeW6Gez80WBE=;
	b=Hqj3UvKQWQqj0bAWOgjM+NHaUK/76JiY/ECQwQfDcmcTEssVcidBwOD40yyLEoHz5E
	veHY40eE6sCSiHBCxkThCP2DSUDxbhSIhYGPQWL+yvS/v8WPi6G0eBRMdhwdify/vhdy
	FGKuiKKPALJqPE4qdnC2zMQcqABdcdE/+ylxbFioRjLNzBiXgVfHO/BK/SznL4T60QUi
	oJ89MkiEISglSnu6BGmCZjXiYDBU9nNAw5eaHFWfxQ+Gp09Um/0h/rneO10ngT0OcreU
	bxGbznbd+20nTy5DgpIZdvk0t3XZcmNVK/OfrYY6JlbjpXUhEhK4b/ThuCZZIgukUdTK
	oW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EH6CLnnnGG6wUG2tzq7oSfLDeOw2/MXbeW6Gez80WBE=;
	b=GdwLux+YdzrJUFeKftEqSrs7eNs5hp7OprgKKHeEScI9mypKvbRuttvAR4RzCBU3FF
	UViWzWbGVneOSMmyFWUOD7MQ3guMnVmYiC0fP/1TwFbztRyfOqMh6OUNvq5e9nNflcRO
	KvSHy1kolYZZ3CSudXFvmj9929mvWwpmEBgeIx8niMcL/+GPQRuceYaTSDmMkMKzz+sL
	P3g5u7ZPm9oXv5/Q6CvDzjOV8FWnadte1sUaRrp6fbB3RuL6ZOkFT4otHCdof/iHenVW
	F9DkhkLtDTAy213RJo/oYIhDcljxBgR7qPTVcc9zMmeMBv4WtSA+2h5jgCrQEH3d6P9J
	0Yyw==
X-Gm-Message-State: APzg51BxEyGBU2TqDsXWEXnCudD0lXTK+XlvpF3jwmriUp8eI+KR61iT
	GAmB8QvHvxaUdJV2+2XyEnK2U9QEL0w=
X-Google-Smtp-Source: ANB0VdaN0X795FpKS+JxrGytHeBK7ImHdskuEsNhBJZ4grcQpAG/IxdeEHN957siurGrLrGAuXvzHw==
X-Received: by 2002:a50:eb96:: with SMTP id
	y22-v6mr2907794edr.38.1536230448762; 
	Thu, 06 Sep 2018 03:40:48 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:25 +0200
Message-Id: <1536230436-30342-10-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 10/21] iso-codes: update to 4.1
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:49 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/iso-codes/{iso-codes_3.79.bb => iso-codes_4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.79.bb => iso-codes_4.1.bb} (92%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.79.bb b/meta/recipes-support/iso-codes/iso-codes_4.1.bb
similarity index 92%
rename from meta/recipes-support/iso-codes/iso-codes_3.79.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.1.bb
index 68d8fdc..1761ded 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.79.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
-SRCREV = "c1d5dd96b33cb815ebc21d2708bc045b1545249d"
+SRCREV = "164802d5fd8c7a8167816fd86a62b286680619f0"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.7.4



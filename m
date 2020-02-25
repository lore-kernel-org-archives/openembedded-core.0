Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA4276089C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so7248918wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9Pg+IMtuPpXCDMICfnGXQBGNOw2R7hfOANjYhxA1UW0=;
	b=G2dpGSM6a2wo4oUzR5pbpF0MRm8zmfoMrCxv0du7dszxFGRxmmwWgYXtU9iLo2BuWz
	IpayIjCvbcNYFR9bLzXT89MP2t1DAMSufoxOmYl97kYyvoztq2hRs2G6AipREfFS5S5x
	Nh67AzJ3jRYJiMA330zev5t0L8TovjBmlu8uFBaHrBgYs/ioF6ZLF1TeWKfCvWN1zs/m
	IsLbbEK6sHK6ORCGfkNb2EnoUEwGZ+ftoNTsuWfMtTpAViE7aHeAu83CoQ2WSm6be1uD
	FGBRKzsGfTSH9zfB3kfx16BNOSkigTS0gQkIM/rwE8/tbGfQnZJoZXVJqZvT+zwPBUrH
	yNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9Pg+IMtuPpXCDMICfnGXQBGNOw2R7hfOANjYhxA1UW0=;
	b=dQ1AFbuzbawKiQ4Bqka6zJtpnqkOAN3SEFE+RRhRnttvaH9VvmzVQyGDA0x9tBnMhU
	jdO8mI2Unj510iWS2In+fDJXeCFhaUq1xwLN/czLoP6uOTH1zOicRR97QuJe0KIo+XEC
	/r2cT3rGOruLIRhoz9gHKMMft5+4w69Rgz4f2Fxy7PhMYjHK6FpRueR1ZdmNxIGY0VdI
	MIFT8dumbEoRnvf2ktYVemDrQl8iJIyIvss1DwaPOYVrRa7n0r0wbH9IAxX6s2bNSLqz
	8WMxoBR6p3ojPtoxpuGex5GuX3x9VCa8DIEckOGQxYuJbTGweMPsGdij3ULAzUCTHzSK
	FYPA==
X-Gm-Message-State: APjAAAUGF03EwxA7sh8V1ogzS5nrhGoLqmcihhAWaZBRicVwhdTwlOWT
	ldRC5bUYiqan1arZYbReSNskcOya
X-Google-Smtp-Source: APXvYqySbjRrsS2ZwzoquqlbxZr2i/XyEl4SAFxXwJsoenfvF+FWPIqPPgEe0Mej5RHTNkqoAUwOhg==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr530001wrn.363.1582656847137;
	Tue, 25 Feb 2020 10:54:07 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:25 +0100
Message-Id: <20200225185335.19326-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] libarchive: upgrade 3.4.1 -> 3.4.2
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libarchive/{libarchive_3.4.1.bb => libarchive_3.4.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.4.1.bb => libarchive_3.4.2.bb} (93%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.1.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
similarity index 93%
rename from meta/recipes-extended/libarchive/libarchive_3.4.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index 2d33dd80ab..c3edb573e7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -33,8 +33,8 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "59bff5ee6216cbb76c8354f6dd6f5a5a"
-SRC_URI[sha256sum] = "fcf87f3ad8db2e4f74f32526dee62dd1fb9894782b0a503a89c9d7a70a235191"
+SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
+SRC_URI[sha256sum] = "b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.25.0



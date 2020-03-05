Return-Path: <jpuhlman@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id D9E0D61170
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:05:50 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id j14so3940982otq.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/Tck01bZje/BhRIMgDRBW8jg+iXadsB1yaMkvyZ79zA=;
	b=hHTAqgyB6san3FvpaWkt65xTT2m95btMtHIotVxooImYklx7rXIEHBuhR9/DZupAZo
	pPwzgFlJEH+t9TJmWJsGChGB3jYZyyRyV6QOPzxrYPc7xAElK3huVI4GZpOf47pLmmq0
	8lavBx90PxSJ8/sS3SyOhNZTBlPjak0SD3I6X0CkX6ws86Lm3oA0qX3voLHo6H3H1l/t
	nTREO2CNyvXdK8GuJI+plZI8rcC0O2Gf/thrHB5+tnUJm834x5b69rs9aY5Hxa77pfJQ
	Burk+55VcemDezDbHZ5qcUbs6SrePoJbbOCpbhZHk0Xafmv35FE48OtnPrHomTSxIce9
	Aljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=/Tck01bZje/BhRIMgDRBW8jg+iXadsB1yaMkvyZ79zA=;
	b=XlScSMeTf4WRNy20TF74LryaFpf1LBiMKiRQdhtwP9cynlO0duyxlXH3oyAVhd1zk6
	NzAvpIjbWeR3HnKAPKLNujEl86gSpan7lZMUKqH/7W/XefOs1cMHE+5KvbOBdugWP67h
	x7MFXPt31jrhi3DJ82AFCPt+VNa0FO9UqgZlojy+jsimZDS3r55Q01XhZTvQABgwVUKX
	62kaYituUQrhfgs08uknMs5o1dhYVLU0o/pvQje61HohNsdBH3g8RGAdnnvYu53WyMmJ
	2kK+2YRjXB3GqIwBWvHZpuqG9y7GRKkLKCUmql6fMZ9m+hjB80m7W/O1/5t7PBi8YXbz
	kXIg==
X-Gm-Message-State: ANhLgQ2d7OEbj1NPjMCaKhNq/2/zEEkfJmc2eXqyX1tvT+BDx62OsNsh
	egxHcQe0MQTn3ox39K7MgLiddETClpQ=
X-Google-Smtp-Source: ADFU+vuxIcsjo2qsKoYmco2sXY9L0nQq1Q4RTMbd/i0X6OzBOiJZCsrCYWBSbrOUHuYB6WyNVGG21A==
X-Received: by 2002:a05:6830:110:: with SMTP id
	i16mr4229898otp.189.1583366751312; 
	Wed, 04 Mar 2020 16:05:51 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id 67sm9424977oid.30.2020.03.04.16.05.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 16:05:50 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id DA92F2A07BB; Wed,  4 Mar 2020 16:05:49 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 16:05:48 -0800
Message-Id: <20200305000548.6357-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gdbm-native: disable readline for the native package.
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
X-List-Received-Date: Thu, 05 Mar 2020 00:05:51 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

---
 meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 5326184181..52e35c8c2e 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -20,6 +20,8 @@ DEPENDS_class-native += "readline"
 # Needed for dbm python module
 EXTRA_OECONF = "-enable-libgdbm-compat"
 
+EXTRA_OECONF_class-native = "--without-readline"
+
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
-- 
2.20.1



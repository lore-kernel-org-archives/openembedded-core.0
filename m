Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC3DC60F32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:49:17 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 3so2600371pff.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y6wKP18rCQvOBHwlIFPLrO/Dochw8wkQEv42UeoZZss=;
	b=gPWZRTpkVM94F3UVtfNJrtaxnSLSNKdjq4dKF3NOKhGvUSmH7NWoEGzILhnLvInQ9c
	zzFta+yXsdQDV2lsesmSU+PHgbEG3cXGMVFiAv/lfYRaWviOD94WY/7XzI4LIBsUDXti
	lNDqRKPcXUhlxEOchYtjVibBEHWKXJzLa6DkLhJ9a/lm5+QTEOqFGtvt0wbneSnaA2hf
	X5mlRQ2K9XJCbsbVgqM1VaYHWOjKRF8i1H6kuVpZocH0PAILvK7T2yN1sxh8Y/ZH7Wvk
	Pb0+SkH70jQGsfB13hY/F2R5jpME/jLniae5kKAw45WM1Oxg8Jkm37g5/ufKZdBgC4+F
	KNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y6wKP18rCQvOBHwlIFPLrO/Dochw8wkQEv42UeoZZss=;
	b=CYPyCSSZffMSeNAdWIlxi7xSbU6GZoA2FmThEL+1P5j43NM0FUTTQbMh+37sDIe9QO
	OoHyj9s7643hqGQ2U5/pguWMPBXbQErl4wfWL6JF0MSa82EENn/8T8TiN/1lAsGQmnhR
	EDUTC80UMf4ljUzPN7TvWIejzhGbMs36eGgIzsKGXFRBPMpXET9WJ+9dzu8I11eTup9b
	fwYzbUQUM28F1JfqQfE7eUhYxihfI6brJU/y3cn35Mb9gvXIiRQIOcyPh0Shx0lI4mMC
	2W2tUeeijW+7TrjNRWR+YY5i8cMA4/HEm1VFmKvpdYfILUYFaAGm4/zATGccIxiH+i1I
	2wJA==
X-Gm-Message-State: ANhLgQ0bbr/RiMpQpPOCijrxN/gztJ7WONKxuFepQLGjdf5Igxb/MhZa
	y83HzxG8/U+mBGHr5/dvrKZTYKqw
X-Google-Smtp-Source: ADFU+vtZmeDWsR3lvc6t9uTrOmIK3GJ72FmUOTo3enEO7smR9l88BRxdgxzEQUbONHfoXP6IuFDHxA==
X-Received: by 2002:aa7:98c9:: with SMTP id e9mr1019022pfm.204.1584384558876; 
	Mon, 16 Mar 2020 11:49:18 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c201sm632455pfc.73.2020.03.16.11.49.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Mar 2020 11:49:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 11:48:59 -0700
Message-Id: <20200316184859.11635-5-armccurdy@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200316184859.11635-1-armccurdy@gmail.com>
References: <20200316184859.11635-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] qemuarmv5.conf: drop stray comment including tune-arm1136jf-s.inc
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
X-List-Received-Date: Mon, 16 Mar 2020 18:49:18 -0000
Content-Transfer-Encoding: 8bit

An old comment which appears to have been checked in by accident as
part of an unrelated change:

  https://git.openembedded.org/openembedded-core/commit/?id=e9ebcc4c19a624f76051c0a25d9ecf6ac4afb257

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/qemuarmv5.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 7f72048065..e7f24fe1ea 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -4,7 +4,6 @@
 
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-arm926ejs.inc
-#require conf/machine/include/tune-arm1136jf-s.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
-- 
2.24.0



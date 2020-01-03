Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 627247FAA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 07:21:29 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k3so23054228pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2020 23:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=47uzPT2KskqpfZ8ZsriWnUM2P+1So51mDSiXXVuoPp0=;
	b=pIWjfT89nzmxKoHZ8iNtEnT1IdoY3PoM3FIL6qjR37mQx5w6E2oXcnfLcIVP6ofuMq
	UtiVhsj1a3CyDdp+HCzJ3CRddH0dEHTQ2vSAdbN4U4X9CbeIfy2S+QNDTLdY4MlvZblc
	5i77P7DbQGWcXmwzcVRrX/trZ/jQGqn5+RxLltoFRkYI7hX7JoqjhwDq4vxq8OwDtqjl
	/tpHFHc2VIAC/Yd79Bpb09pnCrzV02LXclTxSEMg4YZV5+LV5xkl0Os26Us72hAgkm7I
	j6IDaozm9EpkI9eI2I5rE+lp1HpsOJB5/OBh2K3h3TTxDcMY877bCUbLHC5xXPRGGO2h
	DcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=47uzPT2KskqpfZ8ZsriWnUM2P+1So51mDSiXXVuoPp0=;
	b=q72ppltJc3rjSuNjpyEDBGkBjsD+S/I1aNkH8RpGxLvD/+09l1b2t9yu//okeRHnV6
	lz88bDCQauXFo0/RUZDAeZoPOokkJFOLXkVZHhb7IfRQt6bmU8mo0Hrtq0KeCyCj6L4K
	7BzVNBmusvOthIsQ0nM+07+nMR/griuPZBEw1eqLNvrJ+f75b1dpcxd0DuAbigdEScFx
	22fiLDghzAWpJ3TY4bdw1X1AFkd5YhiE2Kzf+NDDUPNsNKoT7VkVg+MDa5j6t8bS5YZF
	ev2krP4S6aYSUXR6EbQLZmLwMSeNONjr7IDXJ8V09cuabRdNui9NRVX+ED6ZMTXS/0KG
	6tDA==
X-Gm-Message-State: APjAAAX0TTKfGYIDNDEr6WTDd8Yvk0CkHpFeSNzdEw7QHm0RCthq4pm9
	7hS67CXsR5aIvmoLb3KMXJ/Tzr4DGnQ=
X-Google-Smtp-Source: APXvYqxZU4TCLticy0pehRK47dGOTCwN0cJtAEabq0usrIf6zgB53qwMUgc56iM6Qqmc/gAi+MS5fw==
X-Received: by 2002:a63:1a08:: with SMTP id a8mr70707865pga.425.1578036090157; 
	Thu, 02 Jan 2020 23:21:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	i66sm35163470pfg.85.2020.01.02.23.21.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 23:21:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jan 2020 23:21:23 -0800
Message-Id: <f8e251c9d729cabcb7f9eb0ee536c6a894e58e87.1578035913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578035913.git.raj.khem@gmail.com>
References: <cover.1578035913.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags
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
X-List-Received-Date: Fri, 03 Jan 2020 07:21:29 -0000
Content-Transfer-Encoding: 8bit

This is needed for 64bit time_t support on 32bit architectures
see [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 8badbbb40a..22f8214ba3 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -18,6 +18,7 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
 #USE_NLS ?= "no"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
+TARGET_CC_ARCH += "-D__USE_TIME_BITS64"
 
 IMAGE_LINGUAS = ""
 
-- 
2.24.1



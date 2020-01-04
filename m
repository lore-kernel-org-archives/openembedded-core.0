Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id A5C8D7F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:30 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 4so24903693pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j1zQy3N/aKB07eXNIb7TfqE2gNTIT2AHseKItqLruz8=;
	b=t/5e0ftMSJoiVDwfif+GcUHGQfzOYJPI33c66SGIu0v+eWAU2B9rFdpIsCjJHRK8kU
	vqbs9dKS0lU8o+mc99t2vyHob/8c59Vpv3fcUo00MIuzC9yAjmdy0+yKXQa4CTuCafME
	g51oJ+7R49A4QgJISbMFAykZPSIVQEqbsjiSnSNPoZ5pG70IxKZ7LjQCPXJSmXLcuH7B
	PTwwZEQA0pSTeY5IVFcciwWYV8bn7Z+bTPaMZxNQIDc9o8bOYd14pfFGgqwEcMN+Njfh
	eV1BSs46EUoYY+IfZ9CHsZrfucwnjemtcVouBCnA8YH/JhINxtvhDQ/ZeUxoTnbn/HXD
	/tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j1zQy3N/aKB07eXNIb7TfqE2gNTIT2AHseKItqLruz8=;
	b=j2GnDXElCEBFih1sHcc3fT14sncU5nMJnxRTS3VHQYfS1aWhAht9ZGCgIotQFFF11b
	aKBv0OXtDcB/jGAeI0GRDJ808UY82wLkBF2yXUtlZ5DEeaeyqjaTH/n0EvC0qMxF8Cd0
	94WaS91af5Tzg8tl8Cdyl40atxn0YUCo8/prwKA0ZvfHxjxcW1X9sw+XCebK6ktsY6IF
	AhRUyp/CmhZJLYz8O9XTe8r6VIyXzjvOiTbK1iDm3/pG4f3R2A8mjV+VDky7Fh/5+dFJ
	eHxhc8dqpveVCfEW1jmyMRzgHSuu8RjMXoGP4L+Ibrc5NrCxVEYngM7bo+J5XG1R5B3k
	ht4w==
X-Gm-Message-State: APjAAAUhqL902LRRq7K/FTtlL2loG1G7UBqAiQ0c0exsch3uwBixtpdC
	5XL3khOqcFYL0xyliDPJbhT5Qet4fc4=
X-Google-Smtp-Source: APXvYqzErvIhPrpuvTN2i2uK91wmfMvVYMwVJZdw/Q46D+Hr7nCc9ukD7Vx7W604BERdcAvXCtwnXg==
X-Received: by 2002:a62:197:: with SMTP id 145mr99805510pfb.188.1578155191834; 
	Sat, 04 Jan 2020 08:26:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:01 -0800
Message-Id: <bc187434886b918b216b344c5a80d69383dc6773.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 20/29] reproducible_build_simple: inherit podfix
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:31 -0000

From: Ross Burton <ross.burton@intel.com>

When doing reproducible builds inherit podfix to remove the possibility
of differing Perl versions causing manpages to change.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dc43edab4787906f2c9f51e51bf78d1dc966286)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/reproducible_build_simple.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
index 8a60deef3d..d0842f0f90 100644
--- a/meta/classes/reproducible_build_simple.bbclass
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -8,3 +8,4 @@ export SOURCE_DATE_EPOCH ??= "1520598896"
 
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
 
+inherit podfix
-- 
2.17.1



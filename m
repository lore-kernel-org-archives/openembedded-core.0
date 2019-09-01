Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id DC1E37F424
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:28 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id w11so5446433plp.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q6q20kcbclYsy3wAcIU4/lPSMGZUUuwjVOB4ay7R/50=;
	b=kwX4c4O6xEcmaUqsmyyjsqyjkDTqE71B85Tko0UpS+7M/ScBMqFoDvs1G4kjl+pgQk
	AWn2CHgbTdCVAo05vDiljlCIY7F4WBTrQ6AdBImNqtJ2qi3yOfEHSEbf9fKFqEbswbla
	p2qIq83fSdCAtCLM7MAD4HrZ3q/oSYcgPBa/J3DV4NdqmY0TXrPmreneVFAp5zQyexXG
	7KKyqYFLRtmWGeAHwfGGye7oeyr68afAxWTh8WB5rpFtQ0z3A4zC5INU1MjPCHCWeLDu
	yYBOoYELas/2a7Dnsvxib3wg28LS3vb4FglBOBkqlCLyh4hicH0bRJorNX9yojwkoVkS
	Mqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q6q20kcbclYsy3wAcIU4/lPSMGZUUuwjVOB4ay7R/50=;
	b=TmwdI0UxPt8so0s+62QGjkrP9KZ4Rfny4T+5d1OvlSSFfas6Vb9MHkJa3wINp00rAW
	wrwq7EEH6YHgT6yDHDSzZK0ilTnmu71JXGJUE2OIVMkywmRSnU3QEKwuGLEA0jw8nOQm
	qy+A2VAQ/ErM6B5Qw5nRbNH/VsOSQ1Kg1/f/IoyvBZYaUHKnzVYevT2pkjBRc97bDX9v
	GXfRq+3EbbEguG5VRWru8WBZNy55bDwvm9GM029RBFY4Vzt6Z8oA4MqsG+Qvi0qBtV7h
	zfXHNuuVPIp+3FYVBxBM7cBmHFukwvcR8UMfSBPPd4xCWobdtANzHH2e0WQ5H5JlUphi
	JbGA==
X-Gm-Message-State: APjAAAXCSoWIBzCgggBpMiKF2hy/cFPd+vr3M4QZPKTKV03fGYKLYGDT
	R5sHV94jgNgZW6IW3TW1h9QWEGrK
X-Google-Smtp-Source: APXvYqwvyh+VUo24KpZGRVyyG/VWyuiL3od+wrq1kiMV0sDGxQ3IAiXNmOcJ8bCRnDesmkKsFOIrvA==
X-Received: by 2002:a17:902:e592:: with SMTP id
	cl18mr25309358plb.291.1567348589930; 
	Sun, 01 Sep 2019 07:36:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:43 -0700
Message-Id: <b129fe2da471b904a2c06391d2a2fc41f2ab4e8b.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 05/43] glibc: CVE-2018-20796 is same as CVE-2019-9169
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:29 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:
https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34141
https://www.securityfocus.com/bid/107160

(From OE-Core rev: 7e90506534ed2a70680382cf28614f02fdb98409)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
index bc40361..cf3744b 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2019-9169
+CVE: CVE-2018-20796
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-- 
2.7.4



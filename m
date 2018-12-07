Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91A846C4B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 12:10:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a18so4334545wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 04:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mou6pzPqTUoF5qyyKsKwEpwaJbqjgr5DEVmBvY5D+Fs=;
	b=c5YddBDgQF2uWacr4qUc7XbeK79QFZXUHlB496OncequX1t6WDtiaOrKkv0P54wJdA
	ZeXfofqFx+Ipe7wemUkc7YPdlrCV3AUpXf7R1nOaeEbDPGNiYEfxyq1nXckfwVT9Aizx
	20ND9Vx9aITdmQFIeiA0neYVIaUEWg0PIogc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mou6pzPqTUoF5qyyKsKwEpwaJbqjgr5DEVmBvY5D+Fs=;
	b=nHUHbQ1abHiC3XodM46xpw+DKm85tqUATmRIJ6Fg06QgFbzxRMw4+SQxjV5k9PyUKz
	aprd3HhcvEz2GFhmwTxsknd2riEUi8cEN+K2YydUUpoi6wSvaqt+br9d9BatJoadtKP0
	Cub3Dbu+V7Qbn8F5QOsSzVmbUxQvG2uL4r7Fu0PN1vLKbd5zu2LqeyFQjjeZ8acnOllK
	8Zhyg3IHyAfAZQU+QbaMKCqq4NdB9n7UxiEnoSDWCzegaDCB2ZVSaBckzTBbwBAyUIok
	A5ZxpPJCRxvQgHBCJopczdJXjz0awvIkLBCT1F2aOx5Mrau8YOAMcuhy8t6CKG+3Qpsl
	xtDQ==
X-Gm-Message-State: AA+aEWYxQ15u1l0d9xvJcy2PJODHr09pmnROMXFdI2bMo9CsL0t+v/0d
	mzsBCUvcEu+UsgxhyUQwZwbai4ewWj0=
X-Google-Smtp-Source: AFSGD/Uk8W9ys/TduHUXJFbsZjozSDlXsJU3FSIPSv8pcgaFhY4zFKlPJXHtQSLqo8aL9xLRmRPnpA==
X-Received: by 2002:a1c:5702:: with SMTP id l2mr2190101wmb.31.1544184623023;
	Fri, 07 Dec 2018 04:10:23 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q9sm2454464wrp.0.2018.12.07.04.10.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 04:10:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 12:10:21 +0000
Message-Id: <20181207121021.11707-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: Cleanup deprecated function usage
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
X-List-Received-Date: Fri, 07 Dec 2018 12:10:22 -0000
Content-Transfer-Encoding: 8bit

This function was moved in bitbake a long time ago, use the
preferred version to avoid a Deprecation warning.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index dcf20078831..64800623545 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -199,9 +199,9 @@ ASSUME_PROVIDED = "\
 # Package default variables.
 ##################################################################
 
-PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
-PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
-PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
+PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
+PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
+PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
 PE = ""
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE}_'][int(d.getVar('PE') or 0) > 0]}"
-- 
2.19.1



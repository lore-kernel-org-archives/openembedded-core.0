Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9038960268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 09:47:04 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so2862982wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 01:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4JY+j9lRd6ryyQpTEyajGdmoxqanjL/TeqPUB1eskE4=;
	b=jHiBFZTxAfRS9RIKj53QQey3Q4PS7mgedTUWE6PscHa0vpqWgBzQrTjvtLkTLhl2Vm
	w9vnkA2SUYHQ2jJk4m6iogq4DGxZBsDrfO6Q0dIW1Pty8j4L0WrVeVMqbJJx/Tp0SOen
	1CLb6hNmmeHrkamMV72vXdYyXWlVPzo20A8xFyjSUzqkpt6q+Libb9mJkiOxnR3+f8hw
	s+7YuowMbeK88VFahsz45z5Rc/eT2p7n42BbvqUsJdJmbIoT4BpR0JuobOaR1U3Erb9W
	w+u0ghN2c0piQibI1CTmm8c9WkCTpSeRNb/tvvzsB97ZKQjb10hZZOsT+NnxvptWTi70
	Zunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4JY+j9lRd6ryyQpTEyajGdmoxqanjL/TeqPUB1eskE4=;
	b=S2JSfW6A7v2gZDl5kURM2xxd5mQuWrtLroT0ubhOG9JjqVnsKlJjZiqvQd8T9cVoPd
	0CIX3M3KaCKXDON/3lUxnCSkkef/2lfRSm8fRPzBPqMWVv/zr1sbMUW5cwOdjODwPo8X
	EnKCtYb1cnueVfHSQmhMf390o4wxv25s0SMGpoADkdVQTysGxSI4oOC94RmdiX/Zck7c
	J56o5AqOipRj66FeDPicfyyURvuHr9by0XjQuTHLvX8RrSe16NSvBImoWFZZ+dPLU9jD
	BwSyQMqSLDTK3BeNSmH0CX1qMxt7auIzIhx+ckdFCjWev+ZGPCJtDT7hMGVxBYuh+hqA
	zu6g==
X-Gm-Message-State: AKaTC02KQlAbnOcCTWuKWNZmplKabfS0hvd/z1l6/tEO2XU8YjVKsSX0iFk2lxL7gBhhXA==
X-Received: by 10.194.100.225 with SMTP id fb1mr1431065wjb.128.1479980825211; 
	Thu, 24 Nov 2016 01:47:05 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	g184sm7278302wme.23.2016.11.24.01.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 01:47:04 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 10:46:09 +0100
Message-Id: <20161124094609.30386-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] slang: Disable parallel make install
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
X-List-Received-Date: Thu, 24 Nov 2016 09:47:05 -0000

Installation task fails if run in parallel. This case happens if we
define PARALLEL_MAKEINST to a different value of PARALLEL_MAKE.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-extended/slang/slang_2.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/slang/slang_2.3.0.bb b/meta/recipes-extended/slang/slang_2.3.0.bb
index 52b2a63..d5967d2 100644
--- a/meta/recipes-extended/slang/slang_2.3.0.bb
+++ b/meta/recipes-extended/slang/slang_2.3.0.bb
@@ -53,5 +53,6 @@ do_install() {
 FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 
 PARALLEL_MAKE = ""
+PARALLEL_MAKEINST = ""
 
 BBCLASSEXTEND = "native"
-- 
2.10.2



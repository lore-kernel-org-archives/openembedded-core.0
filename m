Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8A07D130
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id v14so11568114lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=//EOlrMefdwS6QeIrqr+eCHGsE4K4KBsaV2PvZvtXGE=;
	b=W0Gb8x2145qRw6XGZ+Ngn+ElblyQLekCh8bPNpMPGXHLDm5dNpohjNWcbpuw79iHhh
	2GzU8NUiLMjHcWbepyUtHbonOuZ9YG5nAtM7bQfvHUusvQTDuZ3fi5FRUDY0o8uzGv21
	Uh9+7GuXDrZ9j4tvmZDPO44Do4mjNWp+kEvt/d4Fwv+F+G7RVSU+9OSTTCOs314gice+
	Nn9TwuxkWH0IGmaDYrLwhRPSR8zhzDXl2uogxTdxZmPOtZzrIYPxzyTCu2LI8/U97ouY
	xzVspjnfowsYt03ZP1velSFqrcN2uhV3Ykp2Qf0jNszsAFX42bm07/uPDdBVWd4P6ihb
	aS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=//EOlrMefdwS6QeIrqr+eCHGsE4K4KBsaV2PvZvtXGE=;
	b=om7YV+GAE9c7P7V2fZYXzM0QZ7ynCmWE2hlzSvJGGad+Zgad3HfbUPH2sc0aDfkDCg
	/+WRgeDxpqfUiAsRoN2kXuBcpWLqP2ZFT1ejxu2QJ30AZm713HcadMNeGOJeF8hC4V9h
	adO1yb1kVqs3O36U4q/S6x03YNU+1LyODumFSGB7SQRY5MxcHltULm8xPZvszSWiBp7a
	9txDJq4Cy5qm6/lbRYuAaksieQdjYyI9CWT7BZUnssyIkQ2PU7CBjRmggEoQ72/fBaX2
	3VF/viGGF7/HdiXk7bVpBrNhDfbjJFX1ONcr7q7d8RiMszzGoZCPtqJj/SGUXGnZ/lxb
	EiBw==
X-Gm-Message-State: APjAAAUCJECYUX0b7ZCk78pmgyhxWBN2rWM79HxdK6jQZNYkowlwHcfG
	nKFMbpR/mNNe/i6XaJxEnRccZ7cy
X-Google-Smtp-Source: APXvYqxW7rH2NDLjxXM3dDy3B47P7gLJDGyodjkHMQfb+a2nh0lJIdCVdZrtG/2kXc2KcfYLDl8Ljg==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr18783456lfm.7.1553695773515; 
	Wed, 27 Mar 2019 07:09:33 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:20 +0100
Message-Id: <20190327140922.109867-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327140922.109867-1-alex.kanavin@gmail.com>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/8] binutils: fix upstream version check
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:33 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 74239868151..15406441241 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -14,6 +14,11 @@ def binutils_branch_version(d):
     pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
+# Actual upstream version is 2.32 (without the .0), so we have to set
+# UPSTREAM_VERSION_UNKNOWN to avoid the version check failure. The line can
+# be removed when a new version of binutils is released (if the PV is then
+# correctly set to match the upstream version tag).
+UPSTREAM_VERSION_UNKNOWN = "1"
 PV = "2.32.0"
 BINUPV = "${@binutils_branch_version(d)}"
 #BRANCH = "binutils-${BINUPV}-branch"
-- 
2.17.1



Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 56F7474E5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 20:37:41 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id v7-v6so549309pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TxVe/gz8GCofMJk7+GYgOD72pzj2Rxd8WSN+vbMKZYM=;
	b=qyg66JO6Pp2NHNubfww1Ldfgk7NdsOrVY7Gxe8wejx4w4ixJIgeIMCauHEzHluYIbV
	2U9fjcLNPjM2bkTDElV1KwQ/SfbZLLNaxxbZjL7BrBkd+JMRpQxy5RvHrxWh2jxfRFNQ
	W2RfQGPSHCY/Ns5QVykcWnFMRhitXqwJiNcaVVXW/6QYVLyquVrIafcO62mDX+KlCbMt
	ceem/oPrvVNAP0LHVRTPvJqsXlGM+fQIuHsHFcX/XyWKk4lP/DC5wKxOW1swNUAkAj3M
	obx3WyV0ZvDpOH7jmZORxoj4nwguPoPYT4BkTD21vedh9tdpMyUE8enGb4XE4FA1PXiE
	huDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TxVe/gz8GCofMJk7+GYgOD72pzj2Rxd8WSN+vbMKZYM=;
	b=IdTfV4RMgRsFldIWgi7RFI4rFDwuXvmD005hrq5264zvJX7/TWNStYGUDD6ZbBkXI9
	lyh1aOoR0nvgWNnvWQbJauaPB329wJxoGWLlgOKbK7py0KTxhQ82OEiELrxWwbfJw+RM
	WO4K+9xYa4S3L9mKHUt/YKQ65SVU9NkdSJSB+mfqRN3xl7tqQIsxsCEBhAn/CJoNy7eI
	VJBAujorWN1WtNzr4HaKNKlRxURf7AGQZSejHLVpPahdwsIXDq/G33ZIw/ZH7zaKLxP0
	+Jc5IGBsZq83TVKXkKzVX70mQADItWkBWZ+hvvNaTU6F2D3bUp0xyjZMd3fH9PzPbjkY
	loIw==
X-Gm-Message-State: ALKqPwdgPyLFMFsH8wJrksk+Pq9cWyIVguSA/71Dgmih5AJdtRBgfldb
	FxXYzKC/GJ/RPFVxxNfdYu6fRg==
X-Google-Smtp-Source: AB8JxZpdPlgYrC6sCiniV3V1XEpUgNfv7eMxm0z2I6ZGgrPjyCa3i396beEXJOMis6ixtwPalG3yAg==
X-Received: by 2002:a63:b108:: with SMTP id
	r8-v6mr13465611pgf.438.1526416663009; 
	Tue, 15 May 2018 13:37:43 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a3-v6sm818566pgw.14.2018.05.15.13.37.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 May 2018 13:37:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 13:37:23 -0700
Message-Id: <1526416645-4896-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526416645-4896-1-git-send-email-armccurdy@gmail.com>
References: <1526416645-4896-1-git-send-email-armccurdy@gmail.com>
Subject: [morty][PATCH 1/3] upstream-version-is-even.bbclass: ensure that the full version is matched.
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
X-List-Received-Date: Tue, 15 May 2018 20:37:42 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Previously 4.3.2.1 would match as 3.2.1.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b066910f64ba964a8a0bb452925591eed1e16940)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/upstream-version-is-even.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
index 89556ed..99714cb 100644
--- a/meta/classes/upstream-version-is-even.bbclass
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -2,4 +2,4 @@
 # accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
 # This scheme is used by Gnome and a number of other projects
 # to signify stable releases vs development releases.
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
1.9.1



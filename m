Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C8AD660851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 20:30:06 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g23so12229675pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ym+DpxP+jpHK4UL4+KbbDRnGD6LknJ5zo8cAajKG/jY=;
	b=a0zmlF03/e+0snUADzXRRzKflF+au8zuNr+YYBmhb+Nsrf8k3nM/4/XLKJV4IbAR3B
	dHwuXHUD2OVq0Iiol967m7Z0V1f07gSp6vyjsHfYdXp5AbftbAzLMkr0ztC7w2L+TbSG
	8O8icluF+7rt2HeGCum8lpr9SGlnltL5y+0w3z3pfwRthTeSzPNJT+17XtIJbSRLsi4F
	uq3/lPUJHjRDPJA713OeBawYGUjZq/15PXmIu/aWmYA+T0qNH6PXmtxHLovJvklB3rgS
	2NYuiw1cayE2N9JthKnZ/ZqIS0M0loI5vSCaje5Kmw886PoVG57DEXEHaVHEr4wFmPAx
	MtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ym+DpxP+jpHK4UL4+KbbDRnGD6LknJ5zo8cAajKG/jY=;
	b=Rys2vQGVAqq8dfTnGQqusqEkcWcPZvGAPz0Z9bD5m1qaj/pJovg/eW5uR2vXF1jftm
	Nz9j2kPZ4J7yI20dnpvQyeK30vjt5QS3wns3CjuwYFOklYLLFyC8N959e3bJA90yhBVr
	tr3W1ISUy0C5/d/SjX9YzJw9QSzeEn630VxTJDL96YwBF6Q7TZ2sSLvDf8IMtqAiAB7O
	KnpWSjSniwoAykrcndBIscPUJXX2B0GE7Tk4A6XljpFYIwIy0V8ZRvN8rYn2pfoSOCpJ
	Vx2/CF8pP+6BeqfUIH9smDmTYg1qmnKCFKR3lwvR/1QNcMGawIxVdeiDn0o5EDMk/8yk
	NQFQ==
X-Gm-Message-State: AN3rC/5Rc+pEtb9PfO5bXIMtcoP7FCrxAxAW1XUmXid08nQmiwcwNBrb
	G4IAW1XzacjZbw==
X-Received: by 10.99.105.133 with SMTP id e127mr13798349pgc.104.1492461008592; 
	Mon, 17 Apr 2017 13:30:08 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id 2sm19722670pfs.85.2017.04.17.13.30.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 13:30:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 13:30:02 -0700
Message-Id: <1492461002-15817-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] devupstream.bbclass: minor typo fix
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
X-List-Received-Date: Mon, 17 Apr 2017 20:30:08 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/devupstream.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index 7d4113f..7780c54 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -1,6 +1,6 @@
 # Class for use in BBCLASSEXTEND to make it easier to have a single recipe that
 # can build both stable tarballs and snapshots from upstream source
-# repoistories.
+# repositories.
 #
 # Usage:
 # BBCLASSEXTEND = "devupstream:target"
-- 
1.9.1



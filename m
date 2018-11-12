Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9DA6C262
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 20:48:03 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 848FF24E0822;
	Mon, 12 Nov 2018 12:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542055684; bh=LW7+BkOi5b6ParAHIME4cNjBhaps1nAxy8UZKDI/2Dk=;
	h=From:To:Cc:Subject:Date:From;
	b=ie4YkEZ/36s6jBUssWIzampfsf53LHItc3RXX9nQAuWliMAg/QhDzt6i2MDgNY0SP
	p9CpxgVibhLq1RI5DQ3QQNyxTGk0pT0tlAy/AiwQ8HREztAB4igrKIOJNLdMMK4zUV
	pGg9XIU78syohy8qGIyHpjrLqwVNmii9TLXaW3fRMpUmDjZz0KU6sJSFScULad/7jm
	taeYNa2okMmzX2wXJ0jhq4ESYvrfXf9x+URVoBDa2ni4MUdRsI5bSRA+ofqSTqabLy
	/S3Tk+8xsNTWJJFjY9K+l14L+5D09SE4c2KYI87hW7GBixETATSnRrxGBRAgaIHHKm
	FncJg/UmZRbtA==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id B4E1057C8;
	Mon, 12 Nov 2018 12:48:02 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2018 23:48:00 +0300
Message-Id: <20181112204800.5229-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] tcf-agent: Disable architecture-specific features for ARC
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
X-List-Received-Date: Mon, 12 Nov 2018 20:48:04 -0000

There's no support of architecture-specific features for ARC
in tcf-agent, so disable non-generic stuff for now.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index d901c18c39..b4bd4ca63c 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -41,6 +41,7 @@ LCL_STOP_SERVICES = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
 
 # These features don't compile for several cases.
 #
+CFLAGS_append_arc = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_mips = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_mips64 = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_libc-musl = " ${LCL_STOP_SERVICES}"
-- 
2.16.2



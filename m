Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4630A617AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 01:44:52 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id e16so4317037qcx.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 17:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=Z/sVBQ4JjsUGe5oTPExHzDO8tcXXF1wdeFYao4eazq4=;
	b=UTLX0rvKi+pEZY9X+XWeLpxMoTe67wG15bF1T9Vdq6tZujX/i+/mHpyalM62Axx6dl
	Ki4ArffADwjKrG7tWU62SVIekyelUNsrorABsP+NePzMKTtzNLhd/pSrg7RhSCb1Tksb
	TCPwXP9MmVPrPCDkxAIhdkVHta12GFi1QoMABoPHjiZulRYC9pFkkRqSY9boRi8b6Y9g
	2+NBtDB6tUuO4zUcrEYPP6zVAYm80brb4trJp6BIswtLHfGTR7QcAg0EkVlcy7r+sWrQ
	XHl3twzrdaGlxHsda82TXitir8rD4piIp5yVjT3NkZLVUM4QEMDRwFpB/owLSvUNoBBZ
	IMWg==
X-Received: by 10.224.171.196 with SMTP id i4mr37659216qaz.38.1387244691414;
	Mon, 16 Dec 2013 17:44:51 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.90.230.254])
	by mx.google.com with ESMTPSA id hb2sm46051007qeb.6.2013.12.16.17.44.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 17:44:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 3A1B917643E61; Mon, 16 Dec 2013 23:44:40 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Dec 2013 23:44:37 -0200
Message-Id: <1387244677-8112-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] pointercal-xinput: Mark as SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Tue, 17 Dec 2013 01:44:53 -0000

When including xinput-calibrator, in commit "xinput-calibrator: move
it from meta-oe to oe-core" the pointercal-xinput has not been added
to the SIGGEN_EXCLUDERECIPES_ABISAFE. This changes adds it to the
meta/conf/layer.conf's file list.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index e249a6a..758a92b 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -24,6 +24,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   formfactor \
   xserver-xf86-config \
   pointercal \
+  pointercal-xinput \
   base-files \
   keymaps \
   udev-extraconf \
-- 
1.8.4.3



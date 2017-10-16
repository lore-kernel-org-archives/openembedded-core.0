Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3FEE171B45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 17:37:39 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n89so8679300pfk.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pwAEbihuR7Uw2b45C4J4gogQH+49PQqGZWjUCY4ZP2M=;
	b=rhLifNJilzBdeiDyM/FO0WdXAb7BFzL8uoANSpV4b3tbWu1RdiXFHm47eblFSG9TgN
	HCFYhM6X2QFrdOt8bTjeI7q9Ty7yGtCq9t8TGGuf/1qWyLDsxiijWyJ4IeaFjj0oubv9
	njlqKTRiW12j4ZIDQj/nQMRSPfMFpvp/ZNq1toSnsYsSn0Vja+a6Q2kufS4n6E5JTWkh
	3ISV5Xvr+4SLmqvbMx2mN0X7Bd1SSm35pQaAj/TIDbfAQ2AE49N9zbrAiSOn7O+1XuaG
	9v3pPNENRyrfihC2dlJ9KXSKmtHyhUcMv84jUW6162orRRpv9RWMAEHDTOHQxpp/vpsV
	+v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pwAEbihuR7Uw2b45C4J4gogQH+49PQqGZWjUCY4ZP2M=;
	b=QHY1ZBxmLpjCJsFDyzG9nf8xzHqorBvkZWguhUdDN0QKgYdbFi6ugB2Pz3mkDToKp2
	/07k4TmvdCNXaXENKFyQ2/u6jdgEPTQDedhSXOmt/KFzzg7Nxy91mI4aYQ+SMkZL7fLr
	QsO2RP9mB+NAjN0SeGqF1uGFpFBIRSNvdHK42uyiiGR38DXl+/+A9p5Gc4jqYlHQC9JT
	pbkQ1Np6X6TNjHlXv77uKXJCtwMuoAwVDczR9/lQB4TeaP/+IDA2aCILJ15XHTIPAGiS
	GOHzloIIrw71urAeR5i/YItDaF+fG8S9Vm8g8nq5xHozzBNVo44t1RLWMyjYTtrVIAG4
	mGvQ==
X-Gm-Message-State: AMCzsaXKA9RJM4Ka++S8criByEKc40gdhJ74m36qW0h0cwCTnJ0+69yp
	ee68rojDwXHyprVzeQqESBxecg==
X-Google-Smtp-Source: ABhQp+Qdprjd9fyshbGTIKkHo7tULOlT69kBZtvJCcO5Nyu0xHqb9TfNyt2byrWa28eX4mZdSbH/lQ==
X-Received: by 10.84.129.1 with SMTP id 1mr433273plb.40.1508175461062;
	Mon, 16 Oct 2017 10:37:41 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n29sm14059586pgf.44.2017.10.16.10.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 10:37:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Oct 2017 10:37:34 -0700
Message-Id: <1508175454-27413-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] feature-arm-vfp.inc: drop unnecessary extra space from TUNE_CCARGS
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
X-List-Received-Date: Mon, 16 Oct 2017 17:37:40 -0000

The trailing space added to TUNE_CCARGS when appending -mfpu=XXX is
unnecessary and leads to a double space in the final value.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 667b609..7ae7456 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -5,8 +5,8 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
-TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
+TUNE_CCARGS  .= "${@ (' -mfpu=%s' % d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'       % d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') != '') else '' }"
-- 
1.9.1



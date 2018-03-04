Return-Path: <adi@adirat.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA6578A82
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:41:31 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id f14so15283845wre.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=adirat-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sVGdixCWHXMUTmQ4Sk/FO7MkNSGNN2hwVseSyoQ0QFo=;
	b=tkYkZOXcc7vUPrBD6bj28P6s1lj0ZAYFkhqv5rjS7ryznm6Mzgnn5Sx8Yuk+lgDpVo
	MoZxadm90eqlAt+NVaykt+knSCCRsXP4eI7zE3qPXyo8UT0zQ37tiNpdTY0KY60KdGDO
	OBTuern1RXK4JKb2Slh2Ism+BhqTs+g+Msa6oeDZiNHwvSAeFCgtEYmNZdB3CEMdAh4V
	zVKdR4+eyncgN5N+adbu7BfPSikFMgflcC4zmwIzI+lqcCoavZ4uJz6fZsjo+PTb8DfW
	RfBUD6to+Z5u1Ria1ukDkwk7uGJux8ef7efY+/tAks6hbUK4xKPtwEFwcSLvie024uh/
	LNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sVGdixCWHXMUTmQ4Sk/FO7MkNSGNN2hwVseSyoQ0QFo=;
	b=srOLVHZoxhITxzf4IacriLiQqddVeQYfPGPHQlfP7Cu0Mwyi8xcnc+CS8HylKB1Sov
	f6kTx0dF1o1Z7qjP5Q4yFej4zC1uh1BD9k74izvoANYm3QQ39ahVTpDJf7PAusoiXrIp
	OpF0EMi6iqqdIMM2Pqnge3q4lP77EBvxhOOsAsub2loWw418Paolh8cfX38QKSM5TM89
	L5NTB9mNK0jBLMvdTllvOt68T84z5hxMsSDHvPj0tV0EsyrMYTnzTx8SRw0YURNTmBYQ
	cmvUZijE3T4bPlv/gTuQu2jhmzn5fw44U/Y2lYRBoKYjYSvi5qwzYL7kWRd8qyy2F8cC
	JQFA==
X-Gm-Message-State: APf1xPBHFsd2jUnBo9UCtEbv53hYUIDakUD1n7nJ14J+zZSqaL0kUNXt
	10Tx0l+Oz8BEFaYt7dHDC+yrpZSv
X-Google-Smtp-Source: AG47ELtZPXnY+fVTf8yCuFw8pWUZeDKBeiJqEg9O9R0MqDWVkJc6t+0/JcgweTns/sj6tdtewTM5+A==
X-Received: by 10.223.158.69 with SMTP id v5mr10859077wre.142.1520199691829;
	Sun, 04 Mar 2018 13:41:31 -0800 (PST)
Received: from adiPC.lan ([2a02:2f0e:190:12a9:eaa7:71e2:972d:878b])
	by smtp.gmail.com with ESMTPSA id
	d27sm14004355wrd.60.2018.03.04.13.41.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:41:30 -0800 (PST)
From: Ioan-Adrian Ratiu <adi@adirat.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 01:41:07 +0200
Message-Id: <20180304234108.12711-1-adi@adirat.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH v2 1/2] dtc: add rdepends_${PN}-misc = diffutils
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
X-List-Received-Date: Sun, 04 Mar 2018 21:41:31 -0000

Needed by dtdiff which calls `diff` to display its result.

Signed-off-by: Ioan-Adrian Ratiu <adi@adirat.com>
---
 meta/recipes-kernel/dtc/dtc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index d259c57e8d..9a90d44041 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -22,4 +22,4 @@ do_install () {
 PACKAGES =+ "${PN}-misc"
 FILES_${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
 
-RDEPENDS_${PN}-misc += "bash"
+RDEPENDS_${PN}-misc += "bash diffutils"
-- 
2.16.2



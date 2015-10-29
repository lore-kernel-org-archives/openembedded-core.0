Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 87B0276E3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 21:01:41 +0000 (UTC)
Received: by pasz6 with SMTP id z6so51008811pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/x4n3h4avyyPHkNPq3JbknHRCYmRs537Ql2+b8kZg9c=;
	b=R4ZMUfoaevU6bdXGcTJ62FXXCSw+553HyEf6i6wrQn54Babo4dQR1OQjcybjteyZQO
	o3dcI1LrcLJiqSdtjS7h0jzUqYk91ks5/AcfIir8fIFfdyV8hOkRTHsJFLlYy2qTvvrF
	WhgBC7rJRL1T8YLJYOIdvYKiEVos9MRq+SYkln0wYI9d0R3HN3fuNXUUzvAn2rXMJjAB
	VlggEbaO+1wbSWtQVHIxEnn1g6S2Sj4wvadrTBRYeq7jNEy+QBjUH6lEGxwJ/0BWSRQX
	ZRuV+IrTfahyLtQRSpHIVbNcRnjAEgIvjSPgYYiWioHg7fVNsIVH5owCU/9tcHEN+5rx
	7gzA==
X-Received: by 10.66.253.232 with SMTP id ad8mr4133701pad.21.1446152501682;
	Thu, 29 Oct 2015 14:01:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	es4sm3991578pbc.42.2015.10.29.14.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 14:01:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2015 14:01:35 -0700
Message-Id: <1446152495-5451-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] lsof: don't export EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 29 Oct 2015 21:01:41 -0000

EXTRA_OEMAKE is private to OE and shouldn't be exported to
the lsof build.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/lsof/lsof_4.89.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index 9b7de9a..0e9d071 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -44,7 +44,8 @@ do_configure () {
 
 export I = "${STAGING_INCDIR}"
 export L = "${STAGING_INCDIR}"
-export EXTRA_OEMAKE = ""
+
+EXTRA_OEMAKE = ""
 
 do_compile () {
 	oe_runmake 'CC=${CC}' 'CFGL=${LDFLAGS} -L./lib -llsof' 'DEBUG=' 'INCL=${CFLAGS}'
-- 
1.9.1



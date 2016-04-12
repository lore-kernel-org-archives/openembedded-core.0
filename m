Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDD46FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 18:25:35 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id k3so1903206pav.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=xJeG8fUFH2aYym5J4Io1ZxBCYD7d0aMMbirYzM5ujzw=;
	b=B8dgqmTeBHdJ5mlpMjZ8PgLAOGKKGFoLjEhoCa+SHy5IJ8ZaCrvcDFxvEAjKOsEvzW
	4dqxpSNeNt3sAqk0s15NRX2tsbr4rRcUX5znTmywy7H/am2iIK0vAzYNyzQA86GY36tk
	cWH/m9CBJZx2BhL8/evuZmMr+Oue7jBKRyGFEia98Vkf6TtEmYdOCEcIc30kMOufrbGx
	rzV800uZt48BAuw/QMrDz0SZxZVHdxEPNCpR5eeoVTb/Kj/JkJxymL9KzVz5Owd9n58I
	2VbMLU66cnJ1X4KOAxbhaKO59UUdIUrXOp16nDM+Y520cR8K8KCejagjH4AAQ1KNJRMM
	mysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xJeG8fUFH2aYym5J4Io1ZxBCYD7d0aMMbirYzM5ujzw=;
	b=lXnOOCtfxYCo/p+/M2evd2xIQp6AU5Zm0ULVTNTLRSXquOnyweO4SwVc72r1dL/b11
	i9uW/VSq7YqFISzeQehskjr+aMsbwPRtzpdNjPhN0DyvfSrfut45U82Rdp1lQ9yli4tr
	E+/x7KpRgcdH8TOR3nT6voLaMPIz5mCpMv9Qi27tAem0Tyz0qtHZcqA1kM2Q5WPr6+GM
	fAz1AOpNGoZ0PDxdTiLqB/ungAeDNooAdvkdZc/aGxVxHqJHo9LrCAPQ1NSmrFw1o5Ox
	lI4L3Fp10M4b5KUNV05Wo34y1KhvvFo3M7x1Q1xQHsu7pKBASFUNwuLY1xX2zYeNy7Qv
	+MRQ==
X-Gm-Message-State: AOPr4FXX5dW6zYNuiAqYjPwQQho+mDod9OgpXKsh/5hmWz3AcTZiqw+L/x15GV1oneZ2VA==
X-Received: by 10.66.241.106 with SMTP id wh10mr6662530pac.130.1460485536609; 
	Tue, 12 Apr 2016 11:25:36 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	ud5sm45385274pac.11.2016.04.12.11.25.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Apr 2016 11:25:36 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 12:25:30 -0600
Message-Id: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/3] sysvinit: make lastb.1 an alternative
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
X-List-Received-Date: Tue, 12 Apr 2016 18:25:36 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

util-linux has an alternative for it. Add it to sysvinit too.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 0f0df85..884857a 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -53,9 +53,10 @@ ALTERNATIVE_LINK_NAME[pidof] = "${base_bindir}/pidof"
 ALTERNATIVE_${PN}-sulogin = "sulogin"
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 
-ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
+ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
+ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
 ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
-- 
2.8.1



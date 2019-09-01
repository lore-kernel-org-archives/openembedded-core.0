Return-Path: <jacob.kroon@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3CEFA7EC9B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 05:54:11 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y91so927889ede.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 22:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0YSBa8HQ1xpEbOGqC4hlj/jopomeuhOcSlqXJ1lj5pw=;
	b=pKDhAegQ7Rh9D0iL8EkTho+gcITHaHHvrIR0RHLVOz2/8r6J89HBTSDptWF1Va2xPz
	jBYRgXmes/tk9zEs1CBxHX/nQEuYQ4x9uiKh4bI3PWHOWxtHPsS65JValWxpCMjMjTjv
	0D8s/qqrSA3hXRFdcht3jG1F5ZqZ6pSPV3a58NqSe4SC28CAQXCPVz9OMR9x1fUWom13
	qPHFd+pB5Ja8QfMcSM55d0xXxoyuXTAN2m+OeAVvOFaQx+CVHsdpeSZYkYwGD6Tp1ZvH
	Rc/D0I6daGil8rt3y/P2SaqThspjJ6NtCbIpp6hTVwmTJ9u3fbZqpjpw14gaaiXBQ6or
	RbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0YSBa8HQ1xpEbOGqC4hlj/jopomeuhOcSlqXJ1lj5pw=;
	b=FE7m+FLE7AenvHeaMXLOzr2c9q+evCWlYGsdaZk57bgNuY7U0Ma8Ff+eOk6dD6jUsR
	sXa8xeD16cQqYxTHCuwpvyAJ6Q8iHMJmh7SnKMjtsv0M5LpNu+gyINFZ1UYwsyRUMekk
	KwuCUmX14o7gdzyMfPSVutQ57TwL0vH0b7/vRP66GYCdo6Ud2EJWZoxMMrykL06+2/vI
	qbUgPerc74d5+EPKowtP7/J2Y8AZp0SFObgAwaMKvWehieVBTgw5qQPDJX8umoXBtyjK
	deM9A8aDz/1qaryppn9ZIZAKT+gb4fWqGEjvgpraRKJ/w5j/eMC1gIUNG2pRViVWe1yZ
	8llQ==
X-Gm-Message-State: APjAAAV0pqLcZWkh8DvhdRkltw78D/RDU+F6kyuKELKaoKp6FoY2aSRZ
	yvBKZujhSZCd9EW6Inx/dORKDBu3
X-Google-Smtp-Source: APXvYqwxxgauKWUHKHwUEzeSaL0IOjbPBqqkAzJboaMUC3XNU2EqV1ljoNBD0tuaE+LZGgs4kjGlew==
X-Received: by 2002:a17:907:10c2:: with SMTP id
	rv2mr6573189ejb.305.1567317251738; 
	Sat, 31 Aug 2019 22:54:11 -0700 (PDT)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id x17sm451549ejw.36.2019.08.31.22.54.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 31 Aug 2019 22:54:10 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:53:56 +0200
Message-Id: <20190901055356.13669-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] rm_work: Remove redundant 'after' in addtask statement
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
X-List-Received-Date: Sun, 01 Sep 2019 05:54:12 -0000
Content-Transfer-Encoding: 8bit

Introduced in commit b3de5d5795767a4b8c331fa5040166e7e410eeec.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/rm_work.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I considered adding a warning to bitbake when the 'after'/'before'
groups are empty, but decided not to, thinking it might be useful to be
able to pass variables that could potentially evaluate to nothing.

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index c478f4a187..a6bd3f719f 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -121,7 +121,7 @@ do_rm_work_all () {
 }
 do_rm_work_all[recrdeptask] = "do_rm_work"
 do_rm_work_all[noexec] = "1"
-addtask rm_work_all after before do_build
+addtask rm_work_all before do_build
 
 do_populate_sdk[postfuncs] += "rm_work_populatesdk"
 rm_work_populatesdk () {
-- 
2.21.0



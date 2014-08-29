Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3916FE64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 21:15:14 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id cm18so2655081qab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 14:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=x3cQzDRRHlUYW4fp2XCWNHKcbD0nM/ZjzGtmmS/3D2o=;
	b=MXV6I7ob3O/EZKK+SYKrtwewaQuhwaQFZgvSQI3zPxlhsyNtzr5E+EpkN78cL3RWH8
	F4CVv/+eTmGuYJDj5AHGByIUaNqdK6LsP5DWvQHCcuTlDKlOXLxXa1vK/lKatHyWTQxw
	kl5jU6vn5FBclcg9bx4sYaVcIAnLQwvGVy9stCV9+oeIO6VN+PF2gjSgl06d0bZoci6j
	2OZiSN3ek+4fIXFDaOSVpmCHqH7+eD9qWwQq1RwdzH2DmQ26xgTc74bOxFrJMmILQ3pi
	UPh9DgevF26zOAyr+2em0scdajPUC4NJQqZv/8ycbmZWVWnEPI7q4Qq1U2CPrRlmftZY
	lvwQ==
MIME-Version: 1.0
X-Received: by 10.224.8.1 with SMTP id f1mr21755133qaf.89.1409346915743; Fri,
	29 Aug 2014 14:15:15 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Fri, 29 Aug 2014 14:15:15 -0700 (PDT)
Date: Fri, 29 Aug 2014 15:15:15 -0600
Message-ID: <CACS+7ZTxKqSpJCqaD5Wjw18Ru5aJojJiXqOcoMU90YuLAfYdXA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] rpcbind: Make user's home directory /
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
X-List-Received-Date: Fri, 29 Aug 2014 21:15:24 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
index 89e567b..4a5562b 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
@@ -40,7 +40,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 inherit useradd

 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home \
+USERADD_PARAM_${PN} = "--system --no-create-home --home-dir / \
                        --shell /bin/false --user-group rpc"

 EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc"
-- 
1.9.3


Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 759327E093
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 15:24:17 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id q24so5597956plr.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lJ7iB77HC4ezTdGxTD5wjOUkbSu9SaTnYjd6z3frq8Q=;
	b=uHD8DCfNfc58gJ5hIF1bswaY/9QqyCNouQngv+wlqBAXr9Rbf/P6VEGY9Hny28L31T
	0Caf6zx7eE4AGoMSbYpTbSoE4DXizY7LLYOrID4JYTkLStZoPcqjbhU/WiL31O81qTJ9
	dWJv27JF4wxC1Se02Yqq8dVxynxmEcKce9uHhUvPiWv7s11yP9bdtHWeLj+B3Z/A493G
	coo6i1ZQSP5fZdTwim40CY4GVp1zmQ+BxIM3nax46mF3C9aWD3fmM/P+va1fR7H4R4YT
	gjElYN3iADLe+wb4gFoWNBl8MJ3q+592gWfkdrD0jT7rFlnmm0aouj6vLuLeIo69LMGL
	Luxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lJ7iB77HC4ezTdGxTD5wjOUkbSu9SaTnYjd6z3frq8Q=;
	b=mGI3MuwymIGsNQojIcQJs3MIvcoQb+hnRubUunelM+kIAaN7oo+RucLbsyYj0IFmUH
	KjOajXZvruTAiFcQfyZEDXt9RvGwl39me59tOKSVT01xGuSMHXOQ9Yb7bCcLYXwAqUvA
	e7r8N+X5OOWeWk4sEgzFWGCysMSJsNHvtF/myjDxQlUYsMTElBHMoFb3bA3e0fmskzps
	6txRF2DvG2z0hubwbddVCUKo/D1yoUrc4ZZJH5ixDWscBEioXjFyedFnYPwS+wvR/x0Z
	zI2sPJBTOp1W0yW+3que0clt51qCAWZP8zVojSTKxNERy3Nzd9aH5vRng8g6/fpMUxXy
	/l8Q==
X-Gm-Message-State: APjAAAV4gAxS4lYymuJdGXI/wI2uLCF6yX8MzCMZB7bXzlxWxM/AhWCm
	/mrr9tzQxFlG/FDBi/Y4/JpJ8vUCaE8=
X-Google-Smtp-Source: APXvYqzaJa6P/PDmxi6we/BdmmfAIn6QRIQgXIoYfpPbArJd6Zs5ZndydkHGdsnHdbYA22G3AeNyGg==
X-Received: by 2002:a17:902:be09:: with SMTP id
	r9mr25879480pls.105.1570375458393; 
	Sun, 06 Oct 2019 08:24:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	v1sm10586425pjd.22.2019.10.06.08.24.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Oct 2019 08:24:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 08:24:07 -0700
Message-Id: <dd12859eb7bd9897ee582f6c6ef5c57d34bc28aa.1570375187.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570375187.git.akuster808@gmail.com>
References: <cover.1570375187.git.akuster808@gmail.com>
Subject: [warrior] 7/8] systemd: update SRCREV for systemd v241-stable
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
X-List-Received-Date: Sun, 06 Oct 2019 15:24:17 -0000

From: Jan Klare <jan.klare@bisdn.de>

Currently systemd 241 does break for kernels 5.2+ with the error described here:
* https://github.com/systemd/systemd/issues/12784

The issue has been fixed in master and will be fixed in the release 243. The
necessary patches have been backported to systemd/systemd-stable in the branch
v241-stable, but currently in warrior an old version of that branch is pulled
in.

This patch updates the SRCREV to the latest commit from that branch and
therefore pulls in the needed fix to run systemd 241 on 5.2+ kernels.

Signed-off-by: Jan Klare <jan.klare@bisdn.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 5bd88ed..2b9c291 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
+SRCREV = "511646b8ac5c82f210b16920044465756913d238"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.7.4



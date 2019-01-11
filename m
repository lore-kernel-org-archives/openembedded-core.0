Return-Path: <richard@nod.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 361667C144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 16:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id C555E18011B30;
	Fri, 11 Jan 2019 17:06:08 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 17:05:59 +0100
Message-Id: <20190111160559.27939-1-richard@nod.at>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH] poky: add OpenSUSE LEAP 15.0 to SANITY_TESTED_DISTROS
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
X-List-Received-Date: Fri, 11 Jan 2019 16:06:09 -0000
Content-Transfer-Encoding: quoted-printable

All my build systems (and containers) run LEAP 15.0.
So far everything worked fine, let's get rid of the warning. :-)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 meta-poky/conf/distro/poky.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky=
.conf
index f5de8f2335d1..d560ed3a3fa3 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -73,6 +73,7 @@ SANITY_TESTED_DISTROS ?=3D " \
             debian-8 \n \
             debian-9 \n \
             opensuse-42.3 \n \
+            opensuseleap-15.0 \n \
             "
 #
 # OELAYOUT_ABI allows us to notify users when the format of TMPDIR chang=
es in
--=20
2.16.4



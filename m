Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5198FC001B5
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 5.mo583.mail-out.ovh.net (5.mo583.mail-out.ovh.net [87.98.173.103])
 by mx.groups.io with SMTP id smtpd.web11.9575.1698792486266342744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.173.103, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.4.44])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id A73A4286F7
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 20E481FD81;
	Tue, 31 Oct 2023 22:48:04 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id IFA7BCSEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:04 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S00279673c1a-39ee-4dee-9e50-738efde9d513,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 06/12] README.SPDX3: add file
Date: Tue, 31 Oct 2023 23:47:27 +0100
Message-ID: <20231031224733.367227-7-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9521735514312859101
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefgfeeiveeifeekveefueelkeegueeitdettdevgfehheevlefhveevhedvudenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189882

From: Marta Rybczynska <marta.rybczynska@syslinbit.com>

Add a specific readme for SPDX3 with open questions and other notes
related to the PoC.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 README.SPDX3 | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 README.SPDX3

diff --git a/README.SPDX3 b/README.SPDX3
new file mode 100644
index 0000000000..73f67c2857
--- /dev/null
+++ b/README.SPDX3
@@ -0,0 +1,45 @@
+This repository contains the Proof-of-Concept code for SPDX3 support
+in the Yocto Project.
+
+What does the code include:
+* The SPDX3 generation with JSON-LD serialization, still using .json ext=
ension
+* Implementations of the core, and software profiles
+
+Here are the known limitations:
+* At the time of writing this code, the SPDX3 specification is still und=
ergoing
+  changes. Especially, the root element has not been yet decided. Becaus=
e of
+  that, the code might require changes when the final specification is
+  released.
+
+* Some parts of the SPDX3 require clarifications. Current issues:
+  - Software.Package.homepage is sometiemes also called homePage: need t=
o
+    confirm spelling
+  - Core.Relationship.from needs special care in Python as it conflicts
+    with a built-in
+  - should suppliedBy be serialized by an array or as a single string?
+  - In examples, SpdxDocument has an attribute namespace. It does not in=
 the
+    documentation
+  - what is the equivalent of the documentNamespace that was in 2.2?
+
+* SPDX3 introduces modular model, where content depends on the profile u=
sed.
+  The configuration of profiles to generate needs to be reworked. Today,
+  generation is gated by variables shared with SPDX2.2 code like
+  SPDX_INCLUDE_SOURCES. In SPDX3 it could be done by enabling specific
+  profiles and variables like SPDX3_ENABLE_LICENSING or SPDX3_ENABLE_SEC=
URITY.
+
+* The implementation includes data similar to the YP SPDX 2.2 content. S=
PDX 3.0
+  has additional profiles and fields that did not exist in the earier ve=
rsion.
+  The project needs a discussion on what is useful to include in the YP =
SPDX.
+  Additional profiles and classes might be implemented to carry that dat=
a.
+
+* The security profile implementation has been prototyped. However, some=
 part
+  of the needed data is necessary from the cve-check database (for examp=
le:
+  CVSS). Obtaining the information is possible, but will require depende=
ncy on
+  the cve-check to download the database, then refactoring of the cve-ch=
eck
+  database accesses so that they can be done from other classes while ke=
eping
+  correct locks. Also, VulnAssessmentRelationship requires classificatio=
n
+  of fixes as "Fixed", "NotAffected", while YP cve-check has only one ca=
tegory
+  for both. At the moment of writing this, there is a patch on the ML.
+
+* SPDX 3.0 cannot be validate yet with pyspdxtools. The default SPDX ver=
sion is
+  set to 2.2.
\ No newline at end of file
--=20
2.42.0



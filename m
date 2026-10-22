Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.529.1792680262379141560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 07:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=LwUxeyoR;
 spf=pass (domain: ericsson.com, ip: 40.107.159.13, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qT076FcmsdlQLzskjr9Y7+DE2RrwFWunZ5IjLaccQeSnQXzmUIZe/SAzzw6A6wXprzCMKk1kETdGCWJTVq9DsoLlkHUhWyLz2C2YlKFIHzdwpjCT/F4l372dc7tfzWEHOTsB+DvItM6mm2sJkyb13cwfw45TpV+X8fnVbWqEU8fSphpgx7fPV177F8q7xH/wpm2p8IHESOxeF+S0iYjmraOvyxvM3IR4HsyKTptZF5diout0dDUz44jSujNQjIkRopMigvkP6p/Oh0Fb1pT+95REszt9JqeGV2aA43CNxVE7eV3o/V8fq4phFv7L8SlhF88Ohe8A1qFd42ZJLtVLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZMmmk9TsgKkLB6pD7lFE0806NVR+dLklUkDATGAioo=;
 b=mdKgKMaeww1hDFPAqqF0DsaKxmdk6T61k2X6ibpVjsgHNhMHa9ZjixgpcqTRXePFr1Czatu+P3wdg68Pf4NrwGfRTLbRcjU0JDlMxBYidXo8Q1Ub+3/Uuu6IF/armDlu0O8tXo7tdInZ57L0sBZXA1B8NU0zeX0/pItQn480+f+1wGlj2CPZhvJKR+8lBs61ywqOMolMyvBApeUdmxXCuuS2A9ndGmTeGWxnCco1QkT+D4y+kFRbGIkGf+tbJfMljy2pu0HN2P62vduwN/J/PrWOmd27pWNcA2sLywbmsUDPP5MrcUn54XHlF5I1mnnaB5bvQ0wodS9GGWe95Kvb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZMmmk9TsgKkLB6pD7lFE0806NVR+dLklUkDATGAioo=;
 b=LwUxeyoRyjaPPrttx47rezUfKJo3RCqfZqogRjGQ/Ra81fXtWd2WKuCXPt200ol1o6wrg3RiWVLsxEapzTqZFI2Ue4LYiernKUc6RaNZe0FIozYQcoEHkoT0KngghswNwoG7obpWoO8G2acA6U3hDnOeBHQZU5rsUC0iqRn9lTo92XjeyklCBC969Xihe8RHniylC50A7RgaodTpNb6XwHYaVax6IvnibpOWRx8XR2bTwl9RBNLfxW6A/VG85lyx7TfJjCNZzYIgvRq96Y/AQxXCCDO1BNBmtVdya+xehgqTIRp4M/TvGdrcbqCuUlFHxqqK3gm8Yij0n4gyTqo4YQ==
Received: from AS9PR06CA0043.eurprd06.prod.outlook.com (2603:10a6:20b:463::19)
 by AM9PR07MB7828.eurprd07.prod.outlook.com (2603:10a6:20b:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 14:44:16 +0000
Received: from CPH1EPF00000526.eurprd05.prod.outlook.com
 (2603:10a6:20b:463:cafe::10) by AS9PR06CA0043.outlook.office365.com
 (2603:10a6:20b:463::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 14:44:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 CPH1EPF00000526.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 14:44:15 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 22 Oct 2026 16:44:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 2E5C44020B42;
	Thu, 22 Oct 2026 16:44:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id F262070722D6; Thu, 22 Oct 2026 16:44:14 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/2] devtool: upgrade: flag badly formed changelogs in metadata
Date: Thu, 22 Oct 2026 16:44:12 +0200
Message-ID: <20261022144413.1690870-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022144413.1690870-1-daniel.turull@ericsson.com>
References: <20261022144413.1690870-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000526:EE_|AM9PR07MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: caed29d4-077b-4a6e-72f1-08df304af22d
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|261009223027099003|10067099003|261021121427099003|6133799003|56012099006|22082099003|18002099003|3023799007|261021123027099003|11063799006;
X-Microsoft-Antispam-Message-Info: aUbdsx7KtJnGp6A98cttRhMTkxEZBmEhTL0bYElA+vWkRK8v1x7a6u4brIoRzB5n5u/sN21tBVtTlWyNwx39eCqSWX4YlrR67uXMebBsgn5/94QKtMw9vA4Ln+omLS3F1LOSJnGUa2G/384XOlM1C6LbpIyWyzQox8jElEH95I1ph9i7qLdRzUendR5zf+RBI0uHVb6voTEdtJv1eWlInwYkihFA46qdkctI8bailFbFs/fXjJCR/Wpj5hAZ439TH9/G2K9zqh3FESB6G1NaYwV+4gcUqUb+KvW6tuf1eymcVB551iDwJA8JX2BzX0qNs4JzKow4QQ21pQB4CQAsRpxgwv3Yj9BVySOndfZgtJrkfcG6pKQAVEosXXSNE1+ixhu5fXzScUcJdBMdQeNBf0x0VpGWSkgEhEMy3058NNzSqOWP0invq86TJ70250yJDGxrhMHbPraoS2kqkMmHLceQ0TMm+1NRKhuAZNyLipVWnfLVIr2O+kDQ7iD2qlx7H8nB6f449dCQ6JqfuopiwvrJG9n8Xse0huATNLk6pSVbaSv5Q1iI6OAcbKb1JasOzTDDxu/HF98Vma8Cuo07N/mSVJFWCTDxpqNGyceNr1ZaMMcae2gEgMgSC5H5yffAwoCCTfAnNH6KrUvL7YGbIIA6hUXOhG0thtJrlAFEcARzd9miT0Yrjla0FxTqOaA20L8LclllLjgsU30Cbnj2Pw==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(261009223027099003)(10067099003)(261021121427099003)(6133799003)(56012099006)(22082099003)(18002099003)(3023799007)(261021123027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AYkolFkmu5KBqYLorB9/Q1ysB/4Drw0Pkh7GTucfqfTeASAjwnDGXG6o4bLxNkX24J3ushlTz+8rTiXw9xXLz+I3yzmOiXk7QJhqN1aViQJsjcABw9Ct68PhFeNlOQyKsWumfXWWIG2TSQrwioklsHeJ6uy5fdrS7gprxElcz3a3V492iJVdZ8ZFkemUzBBqrNNfsx7gy++EUUfVopow12OP+6sncDr3R4kfmwjiWDXTWt3HswCOz0cMRrSc1L0DN9V36HgB1QGxdU8GtwSAcfRUFda9P8UYp143dHhod2O2ZeHtsMevTjcJOexu8xTbDh0VPeXkTo2h2gIqa4XZ36IQhqrwAyN4CkHWFb9Coy3Ja+0ShF+Lo/mZ0ZHqGA/mK78tjhcnhaOeJnciFhQvzHY3g7HoIeQQFNP+jBkqCyq08bptVY/rRDe+qW7vzG4E
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 14:44:15.8251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caed29d4-077b-4a6e-72f1-08df304af22d
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF00000526.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 14:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248447
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Some upstream changelogs are badly formed for use in a commit
message: whole release notes documents, raw git log dumps or markup
banners. Whether that is the case is a property of the recipe, so let
recipe metadata say so rather than each consumer keeping its own list.

Add RECIPE_UPGRADE_CHANGELOG_SKIP, a space separated list of recipe
names (BPN). For listed recipes 'devtool upgrade' still extracts
the changelog as before, but sets "changelog_skip": true in the
changelogs/<pn>.json metadata so that tools such as AUH can leave it
out of the commit message.

Extend the devtool upgrade selftest to check the new key.

Assisted-by: kiro:claude-opus-5.5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  7 +++++--
 scripts/lib/devtool/upgrade.py          | 10 ++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index b848623a6e7..6156ad9840b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2339,7 +2339,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         except:
             self.skip("Git user.name and user.email must be set")
=20
-    def _check_changelog(self, recipe, oldrecipefile, old_ver=3DNone, new_=
ver=3DNone):
+    def _check_changelog(self, recipe, oldrecipefile, old_ver=3DNone, new_=
ver=3DNone, changelog_skip=3DFalse):
         """Compare extracted changelog against reference data."""
         changelog_ref =3D oldrecipefile + '.changelog'
         self.assertExists(changelog_ref, 'Changelog reference file must ex=
ist for %s' % recipe)
@@ -2366,6 +2366,7 @@ class DevtoolUpgradeTests(DevtoolBase):
             if new_ver:
                 self.assertEqual(metadata.get('new_version'), new_ver)
             self.assertEqual(metadata.get('changelog_file'), '%s.txt' % re=
cipe)
+            self.assertEqual(metadata.get('changelog_skip'), changelog_ski=
p)
=20
     def test_devtool_upgrade(self):
         # Check preconditions
@@ -2383,6 +2384,8 @@ class DevtoolUpgradeTests(DevtoolBase):
         oldrecipefile =3D get_bb_var('FILE', recipe)
         tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
         self.track_for_cleanup(tempdir)
+        # Flag the changelog as badly formed; checked in the JSON metadata=
 below
+        self.append_config('RECIPE_UPGRADE_CHANGELOG_SKIP =3D "%s"' % reci=
pe)
         # Check that recipe is not already under devtool control
         result =3D runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
@@ -2407,7 +2410,7 @@ class DevtoolUpgradeTests(DevtoolBase):
             newlines =3D f.readlines()
         self.assertEqual(desiredlines, newlines)
         # Check changelog
-        self._check_changelog(recipe, oldrecipefile, old_version, version)
+        self._check_changelog(recipe, oldrecipefile, old_version, version,=
 changelog_skip=3DTrue)
         # Check devtool reset recipe
         result =3D runCmd('devtool reset %s -n' % recipe)
         result =3D runCmd('devtool status')
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index ba7348664fd..6cec34d2d5a 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -695,7 +695,8 @@ def _cleanup_changelog(content):
     return _join_single_line_paragraphs(text)
=20
=20
-def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):
+def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source,
+                       changelog_skip=3DFalse):
     """Extract changelog between old and new version using devtool git tag=
s."""
     changelog_content =3D None
     changelog_fname =3D None
@@ -803,6 +804,9 @@ def _extract_changelog(srctree, pn, old_ver, new_ver, o=
ld_tag, new_tag, workspac
         'new_version': new_ver,
         'changelog_file': os.path.basename(changelog_path),
         'changelog_source': changelog_fname.split(', ') if changelog_fname=
 else None,
+        # Hint from RECIPE_UPGRADE_CHANGELOG_SKIP: changelog is badly form=
ed
+        # for use in a commit message
+        'changelog_skip': changelog_skip,
     }
     metadata_path =3D os.path.join(changelog_dir, '%s.json' % pn)
     with open(metadata_path, 'w') as f:
@@ -898,9 +902,11 @@ def upgrade(args, config, basepath, workspace):
         is_git =3D old_srcrev is not None
         newpv =3D args.version or rd.getVar('PV')
         new_tag =3D 'devtool-base-new' if is_git else 'devtool-base-%s' % =
newpv
+        changelog_skip =3D rd.getVar('BPN') in (rd.getVar('RECIPE_UPGRADE_=
CHANGELOG_SKIP') or '').split()
         changelog_file =3D _extract_changelog(srctree, pn, old_ver, newpv,
                                             'devtool-base', new_tag,
-                                            config.workspace_path, is_git)
+                                            config.workspace_path, is_git,
+                                            changelog_skip)
         if changelog_file:
             logger.info('Changelog extracted to %s' % changelog_file)
             metadata_file =3D os.path.join(os.path.dirname(changelog_file)=
, '%s.json' % pn)

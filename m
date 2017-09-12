Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 3614 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Sep 2017 00:37:46 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0088.outbound.protection.outlook.com [104.47.38.88])
	by mail.openembedded.org (Postfix) with ESMTP id F31D7783D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 00:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=yLsQNvb6g6ihd0cvTGxjBs3Yh/P7wPBLM0/h/pmi6JE=;
	b=qzFtBip4CHh1YEgmh7UQ1S3vvoeDP6/TxE2nP75Avc1n9855DioIuhJBVKU1REmP8qZXbZPepYGn6MwXLawMHoLrVB5pVzwTV6j9ezeLY3PIi7yd0QoqJ6warzi9Z7p3a6F7P7MALkc8eVH/lNLVmK88cLxBwmlrqO9GfLCzGUg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.35.12; Tue, 12 Sep 2017 21:03:34 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 14:03:20 -0700
Message-Id: <20170912210320.9728-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR09CA0001.namprd09.prod.outlook.com (10.173.97.11) To
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85b2057a-77a3-4886-e6be-08d4fa21bba5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	3:72SeBPVNIqHtFntZD6/v/5cBJg1mXlF3LdN3yiC2RgZRZ5vdrT0u7ZFOOxiGIbzgkPnp/S8brMV/XAuyVrW8+jeQpkcI0GP8otgUu4KjwBnL0b1Y2FpK+WTc8oF38zxSn3WtpscfMV+OvIoWiifFSB8kyPCTCMrOYIScNDX084UUeXqa0x25KtA4i+FfQh6O/2POVlYcN7vBRVDpee5lUHKq2D+mwXh9q4wxGzo45wcgFOXCn4DY0aat9sYwI1qA;
	25:KODiEqllzUPKUy2p8UaRAwqQJNYrKMOq2oc4Oq/CHxqxZWEdda/xpU3lxgNiyCRss/91STr/dy2KB7yAz13OUXuzdeGKluagMrk0+Ar5g/4B29tEwRNl//qhEWDAKTob/Rg5Rt7PJ7mC/JhbHp4BcRZDsYQPgVlc5wtdhw4JXJniVNzBG0o2DQVTDibbEC/PskuMMXmoqKWPVU2wDBZy+QTiHQ8yembmrbHLEFC1WXHdKlYR1zjV/8Cg2VA5jnjcmHnd04okBnNQCfc+qoY3FXrSVD5OcHUHkhZ/G3+SF4aey57AuuNnFtQsYDefv5uXtNqSt7ktk+I2o180A49ohg==;
	31:BrtXEXWy3I95WDGkSBm+qsmwor0ZleFh8FnskehnX1HtWJMZwORzuZZrm8+hBadXFzipclUPjbQJ6dKN+Feom+6Mj3f8e8l6Ueuvs4rH0ppu7O2m74Ni+JCIlWuA8vxZZhE3JkxbTtisxfvVIKpArQhlbpGioOzUhFGZLKq83bf2K4AvH/OKcZm5FJWgoOFxDrAhwSHimwbSRL+e5bHSEEa3bmu6WQeOA+B8z57w1b0=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2931:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	20:CzJlt67aebc9DNMosbVxxkcdvgMVNetWV+kiAxPFcdaglgVdsF7jd2aC2sUyDIC+HEKOYSBRjaXfmLjekbtKSB2W3+hsB8fNT1wjhOGvNf6IAZLdZaMD8OWNrRklHBBWodqwH0d9LxSrHxFSsOs9iIbdkgDSdwPuieCDdCc5bT1qbTgQOH9oOGt8zlzmaBDt7bdYrUPsYhVkFoauRupX1CqtDdFNx0Eram0CPYLaeW9EI3Lh8VQawIiQq0n6aBLO/O6ADDNqJruDgrZ3QdLKgx3S+zVUeq6Xaqw20zCysY+TqdsrCgG8yojMwhFl5l6eaucvjZgS+djHfGOs/OZDsh0oGYcG67NnLxf+LN5fXzk0eGl8tX9ugz3dtFOsweZhLPyvctPxbExArf/xQAuN7/UpiI7lioqm78sdTSv9kQc=;
	4:LmeotD/f6nHo0cih2nZ+AqonbC9MNVfLv1FE8CwUZpykazblCjH440BLXcJBGk9Q80fnl5WMugXGnPWlbtOPKFELaNqr5b2S3PIvqQN2rkOJudUaxhKiMY1NFKvbvxqcCyKgUJ17oTrWwRX9cfCvjn52jv0XRQuqkBmH2uiaZoVNws6STRqhIFaFhlpoFEYz/AziEKxkFw1CPTJ9t5UZ2wEXIJfLc5K8UquZlOFuz+kmi1+dO8LColOPncOm/4O9
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2931A67A4BAAFCE1FD494772AB690@BN6PR0101MB2931.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(6041248)(20161123560025)(20161123564025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2931; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2931; 
X-Forefront-PRVS: 042857DBB5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(366002)(376002)(39830400002)(199003)(189002)(5003940100001)(2906002)(50986999)(81166006)(8676002)(81156014)(105586002)(53936002)(2361001)(2351001)(33646002)(106356001)(8936002)(54906002)(25786009)(110136004)(6486002)(4326008)(39060400002)(16526017)(6916009)(48376002)(107886003)(305945005)(50466002)(7736002)(50226002)(5660300001)(68736007)(6116002)(36756003)(189998001)(47776003)(66066001)(101416001)(6666003)(478600001)(97736004)(86362001)(316002)(1076002)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2931;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2931;
	23:GOhvq7CEAnw97H/upel0fjPl4REAnF1NbCUhGor?=
	=?us-ascii?Q?7DoNx6CROQO8jdSHQQEu6iYGyGPFafxCIXMHbSVhKX5d0uMG+uzOU2U5dldh?=
	=?us-ascii?Q?W8zYfS9QJDWy5X/KE312uUfa4F0CLMmdKTyuw2Yi0H4uHCDjUcdf3Uzo1xVw?=
	=?us-ascii?Q?LDNHWc59FFzETqUF99AJljwCQuqPTh+8rCuohEQCpPJzyy0KPLECmLNNepCR?=
	=?us-ascii?Q?WeJvksf+FbnvC2EfjDV5VwkeUg3Lcbqfd+fZ9BSSrTfxYeGD2KrgPyluFWFq?=
	=?us-ascii?Q?e0APumfPPhgU9ZNQ35gZWZWMRdgTOd3IeYE1BpTmPKE0wQgHoRnKOcqFF5Cb?=
	=?us-ascii?Q?QPCXMoyOntCT6a6N61XFclP5PLFjjFeyGQO9g1cOr9E2EKkZ7Don0IQPCRER?=
	=?us-ascii?Q?E0uvOsw2CF5oPbEblGizEmKR2lAsGXlQvlGypFPXuUb99LqbCtPKeJCY5eKR?=
	=?us-ascii?Q?ED78P/CWtax+Dt0ypGqmrp31WkGfUHtkM03TfdVDeY2qs8+Q8l9ICpIP2UB9?=
	=?us-ascii?Q?EvTx+gEDP4BKTH/kuLTkwed3wosFQATpIXciTNIiWl6gInWBZsKu9RitSVbg?=
	=?us-ascii?Q?oupeVbAV06ez/cmoRACpfBhmVUUg68XRVsbAY61TFmhF3v6Z8dTBtT10YeUq?=
	=?us-ascii?Q?Shk/BZKYJBLskDHtO3wpmPhLFs9ukjgKT/OIVLzeQL9IDT4+gJXaaROXfce6?=
	=?us-ascii?Q?PPbrjtLokYyrhHaeF3jx4sqhZsIHwKSboSsTn21f1A6ECeWg4Fkk3rVrSlA0?=
	=?us-ascii?Q?2r1VgcqN5iUfRq/+bZ9eG9ylUGpGkzCagkxfxhGMwbotRAJSE3OYBoCpJugF?=
	=?us-ascii?Q?9aGrA5wtckbJXzictxEBZBi0oIpkMBsuVE4Gme/rAs2n4CP8JvjgdYCpix9B?=
	=?us-ascii?Q?bmriDwWIC/NBTwxFf16jvUNXfHNHk3yjB13BvupQNBLH/iBbv8lek2uYFDBM?=
	=?us-ascii?Q?QWE0cohEEUhvheyBvaQG8blDhUb1fIqOUcr8xfMrIuSAUCNsF6ZqQ5D6/f1l?=
	=?us-ascii?Q?YUCcK4XfFy3dRnW294CkpUU4Vreo/VJ2UtdM/1Yowm8Uy/+Ag6gT/s78yfPq?=
	=?us-ascii?Q?p7dcSLi6c+3XVSlKNx90QSJswo4oe9PQBaJ9gHZwi4yuECaihmkKOD4dIj2U?=
	=?us-ascii?Q?6m6QzN9t98r7xs6UjXaBb6LTckNln1iFJ?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	6:WoOoqcCNJyT0fKG7VaV7pTsix2N7P5f9QPCvdD3vFXIVdc3xaEgwbqxEQTfOz4dn1ehpYl+spmt13KEexSvH42j+oBkKVI5Y8HHCVojqso9p9QHooMbzwHSuX65GRD7wL5WuxKWc/4PFgVS6rTKRO7JpbP55kgbbqw7Bzb2AdMKg4uZHZMeKksPQhh/oh7kfBhhNu+9RQwwRCPqZS5v1NFIqiaICoOf1crtEKAfqtlyt+CR+d2t2jZGj4Y09U/ujxYZmkQe8KKLgmc00g0vg+coCrDUAbdluojdycfGm7WbA/q1aGEVm8B3ing6+jilEHiZQsNKVR5vB0Z6mqKysJg==;
	5:AlBhW4dJ79ZO5wP8k/r0GucDzx83oWTqm2Db/RoYSPF7Kc6BpasN7cp3SfETtyssJACTfg3Gytwb357IjZJvnxeOhWSaDY+yFDw2UfkIwi12B4Gu80yOvk+ugkZZnLo98SCGx1Gc1C7HPDJhs1w+Cw==;
	24:M3MFLqgilSk14RJEPCkxyAcbm3QZeO8GWzyZUouozRNdGgSBDPqyNPfT5Z7zQxJxgFuzuWWNQm7SHGv/M1gtR8im1Mm79yA+J2QkpAAHImQ=;
	7:dXeiFJ3YAklIuALMRatzIksY/a0aTlq1r+W7hM9LQLmaHP74cjrjMrh8fEAidep0LOz8TPKPT5R6i25sduDq2U2E1p/YdKLxHeO/+Jei1LvHrzPAxTwqynQvAyCO1/s73RTYke5iRMKZYi1FSKgirNAHxGFH1qKummjuJO1RdFcTCi1ZPFsiwVeZrT9eyPV8BSNzYiRBekHhw0hHNrJGKmMGOdkxJ+bnDC6l0wzf5K8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2017 21:03:34.9377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2931
Subject: [PATCH] python*native.bbclass: suppress user site dirs
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
X-List-Received-Date: Wed, 13 Sep 2017 00:37:47 -0000
Content-Type: text/plain

Currently, $HOME/.local is being added into sys.path for the native
Python, causing subtle host contamination. Suppress this by exporting
PYTHONNOUSERSITE = "1" as documented in PEP 370.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/python3native.bbclass | 3 +++
 meta/classes/pythonnative.bbclass  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index ef468b3fde..89665efee8 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -9,5 +9,8 @@ DEPENDS_append = " ${PYTHON_PN}-native "
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+# suppress host user's site-packages dirs.
+export PYTHONNOUSERSITE = "1"
+
 # autoconf macros will use their internal default preference otherwise
 export PYTHON
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index 4e0381b568..4cc8b2769c 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -12,5 +12,8 @@ DEPENDS_append = " ${PYTHON_PN}-native "
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+# suppress host user's site-packages dirs.
+export PYTHONNOUSERSITE = "1"
+
 # autoconf macros will use their internal default preference otherwise
 export PYTHON
-- 
2.11.0



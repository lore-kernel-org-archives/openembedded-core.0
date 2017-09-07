Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 150966 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Sep 2017 03:26:43 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0104.outbound.protection.outlook.com [104.47.34.104])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFE377D30
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AkPVOga6zlJ4xB3q4MCJXBLiSpzWonEwJhiFkVlSkFs=;
	b=GsU4Mu9fP1XzDfdhaJDB+/ZTwl1tKyb37o9WYGLiMNG2k5FgeGmNeHDjHchTiPrARJWQ7LfOctTn8ItZ300qiDa1QeZmnpOkz21vezBE/mA9Nd2cIPWza7642gj5FgZChMdOWD/p/YaIrcND0b1Hwfeis+VdO3S/f7SRZA1XwIk=
Received: from CY4PR03CA0091.namprd03.prod.outlook.com (10.171.242.160) by
	CY1PR03MB1469.namprd03.prod.outlook.com (10.163.17.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Thu, 7 Sep 2017 03:26:44 +0000
Received: from BY2FFO11FD041.protection.gbl (2a01:111:f400:7c0c::102) by
	CY4PR03CA0091.outlook.office365.com (2603:10b6:910:4d::32) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Thu, 7 Sep 2017 03:26:44 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD041.mail.protection.outlook.com (10.1.14.226) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Thu, 7 Sep 2017 03:26:43 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v873QeeD029354; Wed, 6 Sep 2017 20:26:41 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Sep 2017 11:26:36 +0800
Message-ID: <1504754796-19813-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(5660300001)(8936002)(106466001)(105606002)(189998001)(110136004)(2351001)(2906002)(42882006)(6916009)(77096006)(54906002)(6666003)(8656003)(85426001)(97736004)(50986999)(53936002)(47776003)(4326008)(305945005)(50226002)(626005)(68736007)(5003940100001)(104016004)(36756003)(50466002)(356003)(8676002)(81156014)(81166006)(508600001)(48376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR03MB1469;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD041;
	1:VeIdggYTQKXuHA/aIwhCZ3WGfeSWKYkowW263LnLGr3CLZwLkX0vU0xx/IPIQb/uUDQL2OSo/nR62QfxCR7aJ4b4bMZswhGRuXWK/tB8HBXpuZaXSX+lIjrVMdUhSbDk
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf067886-1332-476d-6b5b-08d4f5a04362
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR03MB1469; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1469;
	3:KMuyGePaRlccF16wvEaWNBWG/j65a98qerYPcTRVQ2chnD63c+jp5iFx5/CkqnqEfuq1wsTtxbt/Ym4Sy9OamYa3jQG9T1KN9gDMyIEur/+haxmyksykN/8E4jedd+7+g7d5YMpDB7jOxi87b1vFnMesEAzFj14vF97ZBPnsCQwbUeahALA+WBVLChI6Wu6CHTraVHGJPccfeclzAQBKGP1tDwwCw1YRfWnL3sFLfcEsaK0157eCsYg+hQ29Q2HC6/1T53Y5Fw8CRaDVw/1+326jD2Ell0On4LJaBOCopLWQ8MUjVZnw66QXHr2j4raUMPnvjfWbintH4oMLD+R8fEkDtmEhgQ4DRaLd9vEikps=;
	25:zXd63C+IViK8Hj1htW2Jwwd+M2cmidTNIfuMkzPbZbi7v3hhNV2gyeGjn/IUhICOC/Ot7q0UdlDM/3VoLlFfIoC/UrM4yrAvS4J4Kb2Hg4SPsx4FlJaf3a/GXJ5O1FyGsFBQryWF0EnTyrEaLaYp1xIHrBzAFJNQP4b/cD1LCtjoGwWUEvZt0GBPRe7FXn7hkXMSJSo9QJRSqXnHbTiAJmQtnYvqGnHQD61e1QMrGAkRmiE7mJRaURkZGRG7apJ+au+YoJwZn5co6YQ6Cc3CxTw+vdMq3AoNxeexcmK4mj00p8pAgm+AqzbQiiU4ngWzYDdhXbGmXimut3on3yJhFQ==
X-MS-TrafficTypeDiagnostic: CY1PR03MB1469:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1469;
	31:rCGLlz3u+lc0Bp+4gSRaIijyCL4+n/g8KVTNIR9VLERdjFe5LT6rn3weyNUojvWQNhg7q7X/xwPkuKQGwLs7jZRg9Y+mYgajrK6YQVZWnzOI7shQNaNqInFet7JUY2beHizwGGNQdgjfLd5MPs6jkdLCufYR0qJV3faEqQCgmvxHc3fxepw1sgPPDg5zLYw3ccY/AsUpU9PBFeOuVcWmQRvgI26mhGTTxavnUQEZfpQ=;
	20:P0+tk+/g1tpPBg2tos4GsnQO6DDjfVfOX4GfKjLRcKWHJgXdD8VEm1/A5z5iJGGDqE2AuouXN9kGbsv3Yp0Yar7nVulEOzbV/snoFhS7GzJomfRTRAkmDWNl8j4jWIEPg/5Px4iECd/m4osz2nbGQcTGfFR7eRPtOPbrR/L9pLOjfeSIqAoCZer6Udc/urZ0s+rWsd769oZwsfjxunJufiuQE1AapsG829NNcvDX0j/+lu/Bmw6IjbNTO7knQA11xfuEVmmyPcufzD1VATdUxwJWwTb5aG3sMC/U8lyotSwXGLThK8uIQVCQwRt5a1/BSP/4DzO5zkxYvSbHL7MhFU+k6gr846ExrAXDb8kcBJhUImiY0bQO3BPIhpPXTG+ejKngTubgU/f1qrmKmkB6gocHe9ZXzl6P4EcA+UKnp6FNycqro2zJ5pCf4OfVE6bEMggOOlyHUSY2P79WphXmVaDm3yRNjORNdcosYB8qCCLBkjWVhtTBfz2CMg/sFl0hydWMWvkISBKg8Wd2h2feauVE2OWbewb5MNIRbPO/Ih9BTzvnKdgIgUJX1isEVedvWRliH+nTW10QmnlRkBXt3VO2kN7tqw26eNp0bgmvDI4=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <CY1PR03MB1469ACA5FB8F3DC8F57DD90D84940@CY1PR03MB1469.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(6055026)(6041248)(20161123555025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123564025)(20161123558100)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR03MB1469; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR03MB1469; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1469;
	4:b924wlz3qFqeJhGbHASuYf5QgN4v44QCN9GxiQqsjFU4UvulKdAI+ebCLaZV7QieQY68Ask8wHCaqymfoNcGhPZeLft6CaRsxOcIuAud8J9hY5UX5QZwGmZDknqF9LpPnMHvIKYq+58hUX7rAiYkMgFMl8aMCPnnfkeWANManmlk+JZTC+sltl82lmhKhYD8UNaxBg091CaepSrgzSI0NPqHQNoEEmkl7MoKUf7qum2sPKZEycWfhAcVq8vKNjtAwfUop1tvIQbbEu09OzdrVhBgmeoxquhXMGjCREqkM2A=
X-Forefront-PRVS: 04238CD941
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB1469;
	23:xdoG+cPUVDL+2tGjkVh4srGnKIb6rbG2AWJ9J4cIR?=
	=?us-ascii?Q?dspLJWQuQ34HQDlMcR1nwhB7xsOh4bqgKm62vzfDiczjhHqgco/+EozvzGta?=
	=?us-ascii?Q?F+759a+PDbv5uUgQQisnd8DzpvhSnZw7urpTlJYjWigOzZ5Oi2vHsRVym5gX?=
	=?us-ascii?Q?k6b4iau2cxhBvNaYstrD3digMILub+hXYJzBDHwx0BULZ1SfxdTHvSxWiRwK?=
	=?us-ascii?Q?ZtZBC7wrPDX8AKkP4QMxh5lCm4re6IFA4pLEiPkwdHPNURehOyGSY0Ael+Ko?=
	=?us-ascii?Q?lB+/ShIx6QSMGDKyV2U45RBVcUhbfpguP+No/jbAunIO5LN7O1A/M5/v4IrC?=
	=?us-ascii?Q?6oIxD/0HckQLBInsegNpvY+qwvgAVCqD0WSURESiBtfOuLroOlXLXLddYbYt?=
	=?us-ascii?Q?t6JXRGYhQC3hPRSJVgkHUSG4UNnAV8Move91O4LVxIg0U+J2z1159gpd+S8A?=
	=?us-ascii?Q?9zeTd4Y4wMvnfwAjcGbOT6awds0veFaetUQ7K3uwQ5OU4hu/8xvNa90uLy1s?=
	=?us-ascii?Q?a+nuhM3ooq5kUwcxaRta6ymwGH5UoNIChFMhBzTfHdHX1vAdLOS2MEKuZpyI?=
	=?us-ascii?Q?3wsO77SlWdyYxXEAU98tavjdEfFYmMeuajsQwtE7DPdP7IIfpJ/ebhg69Qy6?=
	=?us-ascii?Q?+h52kRpqLAxAJ6gtyMjcJ6ygvWht4ULwnEwcR/scUfFW863Fl2v2dg1p3sCv?=
	=?us-ascii?Q?adFamQJiN7laO8vxyMZkVXzp7jVx8BLzlv+HhvcXJr5DBfUc0kEBwGnVe+2m?=
	=?us-ascii?Q?LORL5pooDPk7nFqa+VjmV17hSkmIYdqRruTc7bDBaQTs0AgfPz4ZiKh6K5Hj?=
	=?us-ascii?Q?umrUUhucI5s/l8ITAR6ITUd0S49+SKyKSZ8irvDPzNzLaCXuhsLiNtPdyJRp?=
	=?us-ascii?Q?v5ZlkPX79i6LV6RH2yBPkeXCaDNf2WtsOc1UnkLY4V7zkU99MrkQ2fjS5DSI?=
	=?us-ascii?Q?1r14EYL0rfzozr3aCw0pZ3O5zPzQFc8DAICHHKwI/PtWqKGfaPSTlBSFBOjo?=
	=?us-ascii?Q?dLdcBGW0Ez1mhO2r3JxtSAj?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1469;
	6:/lw+09fuQPhrKwNoOmKbMaKdlyEi9QpBamWvzjgvfTK/W1N9tNuDOEVs9rw2nlrzAK97/qTM0u8k5+ZHm1UiiRoONWL/FCv8Ny7YTTS8W4eAb35mHjkuyZMiCaKk1oOowLtRjzrM6mSWi3dCoU8Ov6JRPk4CWs+1cS1ZJ1Dgk7oVKrHJ+x0uKzSKANmTIKbrCNic4ji5LifeunCBLApuBf3ktyUqldXZvk1/nLOGMVG6dpx6mDToF8kfQXmxql7rvuW5hnqza4HUDvh+EZWQ5x/WP2+axiQsIn8JDzp2RrVtlS1HaV4PoKt/CDm80yBW8KjyUnfXwAPMiAOloiw4Tg==;
	5:U4b3Z9bH8zHAsrNnU7cAacXmdba5qkp24yrvG0v+n5f4/3lC5tZ7hOUHj7SRAUisreiKMNLiGyaEquRbnL3o9A+cNyORZ8SM28YcbMjSJ+0S38bD/M+jpgYttmxDxv0bxluv8DG/KwGaODrrzZM1gQ==;
	24:nrq4JIa4CKFhnmw+KRLWBDTAQgscUzoVP9joj/wkw+Attl+HKWGm2gDSr+B8N8rtygf/2eSBuR5xcff/VpGS6k/E6VrA3fg+yrMPeBhVcJg=;
	7:BsFw9zkSnaSy0EEg3t6KAv0UaXk6Rf5VnegjxsOWFlRNGYVojSZ/d+I2cfPCiwThd/6KKzhEKxM1wz12GFdWitE0Rl/a4LrIhVq7UGZDKKizrM17IGbIzayMuVFRTwpTa1lSq7l9nNpzBCknRE8IA5IXFmiSeMC4fJ8YHNoQXjBHw47uo9QQWBRqgzbF4iuQlXuHgynDolMwKl3XwdQzF62Odv5Wgd04kowkskrKrY4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2017 03:26:43.8306 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB1469
Cc: chunrong.guo@nxp.com
Subject: [PATCH] glibc: do the multilib_header magic also for bits/pthreadtypes-arch.h
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
X-List-Received-Date: Thu, 07 Sep 2017 03:26:44 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Otherwise it will cause conflicts in mutlilib setting, as it
varies from one machine to another.

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a291148..df3db2c 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -138,7 +138,7 @@ do_install_append_armeb () {
 do_install_armmultilib () {
 
 	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
-	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
+	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
-- 
1.9.0



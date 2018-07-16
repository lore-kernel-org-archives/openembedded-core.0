Return-Path: <prvs=72899bf67=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 676A678860
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531775270; x=1563311270;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=tl2SBOSdp94JwaZhl7gQFTynd9LVcDw91Wwh42ncGP0=;
	b=e4swfHHBZ+7kJ/lNYChhSY8aOnv1sPQ6S4Ix2Z9fEfnsd4kgXT+ERvp2
	dl3imtPi1CS8lOPoMJqhDI1I9TqDBe02uRZ3AsSGNPAGXC9BOYsWKS9HR
	L8Udm3pp31PvXAAwDfADZaldBI9DbAUc73cYm9UjsQ11FMO0BK0LyXPs+
	fdc2r2X5PDIL/Oh/lRzLgiNa8tUAkEA0A/DlxbiO2caGkhkE1+dbUO33m
	/TvdQYUW2A1p5I4R8T0UX2bxpHzeLdvQaDONXoVet4LNA3YOwkQMGCG4j
	RTtxqKs2Mdy5RJ88H+7qKaST8hmB9Cq/KAws/ZbQeizKQsB2Pec5XOSw3 g==;
X-IronPort-AV: E=Sophos;i="5.51,363,1526313600"; d="scan'208";a="84124842"
Received: from mail-dm3nam03lp0020.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.20])
	by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2018 05:07:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D36NmEsKCYlqpXAyk2yNQT4mIGKKQjR09OJzzLeDChI=;
	b=Iw/qb3iYU2JGwzJA8tLpbT0m2T1myvfiFelNze4NWCgoM0WAXiFCirE+lalzX4N2IY6HQMRgVGkeeUk5GBobG0QegfSwsZlRa+kuvwFVdPJ2MUOPeM2fU/XAuEy07awt5ItCHUXjDJ1/nIjb3KYbv0oYzm9rvNeW5kFUCz79seE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	BN6PR04MB0388.namprd04.prod.outlook.com (2603:10b6:404:91::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Mon, 16 Jul 2018 21:07:42 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 14:07:31 -0700
Message-Id: <20180716210731.22173-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::14) To BN6PR04MB0388.namprd04.prod.outlook.com
	(2603:10b6:404:91::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e9377e-b666-4953-a8ad-08d5eb602c30
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0388; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	3:zbQo6TqmpfFdlJVxqmhtTiaIe2y0qzVKYujmwFPIjEFOejbm8Xg+4Hb4YXN+PsLiqIMCqa4GEywZCIM0x5j4JMuA3vlUMTpjv8j7DIXcAGvwSf0Od138FYubGcsIEN7WGI46a8R4istJPjxfjc54BygFvtNgN/bHnqFD2kSqoe+J2PTtBzJYyChg/bGBFNnFeVvJ8o8zXIcyLFNOQC6QzaR4xntHZUtotF/qRlmsLgx3TCvNhIMqxnfnahR+MG8x;
	25:F6Ozdx1rMJDbq0ZLt6+hatFd6CMFyCQEJ1ASt2wzdV5R8zwRNGeGbqts3gs4ioBhQfTDSc3ZoJWPSqiEqhn23fvaVVy1WqhN2HmlnDXHu1I2tn34NJbjN5s0bVlGcPRFAUcSDf3T38LzUN2zifVU1ML9R2UUftmRuV+iLt88TrBk/+pd9FgA/9v5av2JxJxIfJShuZ057qf2nwUOyD5WjOXtNHiqhrFXKg4LbEREuI13tW3PZ/Q8y5cfhjhTPRU1vFBnefAeamB1Lx0eiZPxzFX3Xx4Y4R7dqiqyinBVq9hHfvXC4hj7CpF3vCaFUKt+sbp8C6qnxoXC0azD41OCEg==;
	31:TLXYILx6B412+7VGCNzcD0FKr+L+VDFGLbZdTX2w2aNJ0Y+vXWWOUEVrAOc1x4MOtuz8wJu7myF6/TihhP32NNWFQB1WC/7Y9B6Jm/BQnq4m0uJheuRre/fAssSX0HaPkKUX1qVMgm9Uv9PTR/lt6Ih9t7K4zcn5UPtHNXM2lUm9D25/lxJoa9yqo3VxOODwFv8LLM7BsOM5BMPRozqHzgL4tbhaFJA0YHGdAIOQJDk=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0388:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	20:0Uht5dMV6O4AMJzdzj0eE7a87O+cru8hdOOLAtP5pw1AFoMO2puU/S7+slisqfsdP0tEutQ3jUSIDUVssBXdnjFkgwn00g8Lqw+BsnsJIlW6mQtwjK85osO2r3DA1llCWh1i8ZnHYWqLKCgcznnxnTPB6YkAxshn2CSMiDYkg90prmIdB6ifxwdzaCOzredQ1vpJZ9dOrxmJkMUYuUS13xlSHh/N/duY22V6qivrfHTTO7KTkc6Fh3RD8uLQfRDYzyoGmbluA/KlBNNWyB+fqsjeLT3sNtOZIA6RW+8/M4BdhlbeU3M4w+CbssFAZvBMnqNazzpMfSW3gM3Hif/Cs1Ijpz+UXd43laczfNcB/n/T1D7BG22kptEGREnZsivlM6Zxr67XyPwrNZ0LVWyeWySgmy9azRUaHXgAqvtbCVvVlbRyiFvWgTIETcYNfnzPuSzqCe5MIPnI20Wr00CofijgJogtsfIlLwtedMiBPeHouG+GR4V28xqlabJXEQx2;
	4:msVKuq2DZHBHoESj+AgXmOpYid5Y3bo4N4tBvSxlGpnyD0K+G66eQ4gUucM1TDf8wthWBXzPfVscaq/YGf1cFNKS5Lyqgm+1sDKLwLXmx6Z+5s/xS9L4b9hi5/ieC0CQD9g6EmhuPpOIhlTwAXuiNa5byb76Jzr20jT9/IfDDGfCV/h1+x36K7IdkmLevoLJjLwfcrUfkn2IFvSO5JVemgCYNEK4itk16SrJSeo2lH1kte3713MRUA4Ym4K/C+k9J6tqWeYTXdgN3fbSnAUK9SNyZvm+WZzmUNFKVukDEOY/taYImkDz/gd1fUTBdBVz4mZkSL9Tjd5fDBjwi+GAWgBiKmBygfczG7pILirCFfF9g5BLh0twwhYIxsrlEV8a
X-Microsoft-Antispam-PRVS: <BN6PR04MB03881A6082A4D71FDA44AE98905D0@BN6PR04MB0388.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(73538370219878)(84791874153150); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231311)(2232096)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:BN6PR04MB0388; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0388; 
X-Forefront-PRVS: 073515755F
X-Forefront-Antispam-Report: SFV:SPM;
	SFS:(10019020)(979002)(396003)(39860400002)(376002)(366004)(346002)(136003)(189003)(199004)(305945005)(47776003)(105586002)(4326008)(14444005)(97736004)(25786009)(2906002)(39060400002)(50466002)(106356001)(72206003)(53936002)(48376002)(6916009)(6666003)(50226002)(6116002)(2361001)(5660300001)(26005)(1857600001)(68736007)(6512007)(386003)(6486002)(36756003)(6306002)(16526019)(186003)(6506007)(7736002)(8936002)(51416003)(16586007)(66066001)(316002)(52116002)(8676002)(3846002)(2351001)(81166006)(81156014)(486006)(44832011)(1076002)(476003)(478600001)(86362001)(2616005)(956004)(59010400001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1501; SCL:5; SRVR:BN6PR04MB0388;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0388;
	23:pTFZ7osBVdwi38vRHLfWRyvNRYayk9KtJZA3c6vgl?=
	=?us-ascii?Q?qPYqyA6wltqzX9j4oeTUDcHGDBIvSt30Z4NqPmIPAu5+pp7q6XuTAFk9pX04?=
	=?us-ascii?Q?fy1QcBVSGvZyKmDzqZoD/mnWWvzh9VDG4ljmymViLAYuTKMxYWrAyEMHNNkb?=
	=?us-ascii?Q?UN1t1zljraue6krSXGBHdgtZyEgKQid2QML1OxLzapK0vRO24W1OjFFtRSce?=
	=?us-ascii?Q?LhruIHq44gCZbLj1QR4QwBw+rzR5USZHJXXAKhFlhetO7X52pKW8dYOs1So7?=
	=?us-ascii?Q?1RU+6oWZrlP1M5KdMlYod2RHhI0ILb//EWWdV8CIyZ+Eqvk9hydRb/aTrenp?=
	=?us-ascii?Q?7OyGL0HddJxfbgigTiOYGk/sCJw4rwfkCXleacfg29py2zxtG0CkSvOu0Vfq?=
	=?us-ascii?Q?3/FtIvfUbde1DbTLWqmK2KEQaDzGqDxn24R5kbj+hU7DkX+5M2xDu+7I1lbX?=
	=?us-ascii?Q?o0Kf1tfUOa8hQCjvN40amqgq/IBzZcZBN7rW0uzg1VbbpjVkF5lbTlxrwovy?=
	=?us-ascii?Q?nlMY3piXEWEtlb0JuECp6c/pc13Ui3UToUJM/CxeQ44jLC+W+/0wST5eYNZO?=
	=?us-ascii?Q?JxMNotA5qZ4N+ZOk+jeLGq0KemoK+K4g6Vz/dDor1wmw/Gx+IyeANCslBZt0?=
	=?us-ascii?Q?N8vked+8WSxgm03qQ3H+mmVAuHy1l1KWXJKb6dgnVosFiGJZc0KYdq5LtzV5?=
	=?us-ascii?Q?0K82PmmR7JIZaYZSRbrhVw7Zz2DpxN2yvbst4jBNIwpbb+i4fM0Og+kU4vsv?=
	=?us-ascii?Q?4K7Xnm5TWC/D37Op4L69I1Zax82MxdvqpO8cpTCtNY3MXG+5DCTs4W/oAMJ5?=
	=?us-ascii?Q?okbrgE6+z/RgL17O49DS2fEwHkFpUvVFMHCZvJXqZ0+Zx6MDTyt+WttNpRUF?=
	=?us-ascii?Q?nRWqAYktSfm8V8UWEGKvfM1bkhAc9bDsnLCYzJSm2q4X45P7MM+b3ILwDWkX?=
	=?us-ascii?Q?v+OG8wC3c2hitLWE0IR53oKp2E2ImQ/Tq34iBMJEIQaA7vxGpf5QGXqFHVM8?=
	=?us-ascii?Q?zjuVvE67ISfVDaBH38QYWIWHKvSHBnJjCEHHoDZAK8UKht4m4Pc8Bfuicpk0?=
	=?us-ascii?Q?W6rKIcglubuAfD1kk0231q8GrK3W6DbaXo+moQruse723eqXk1wGDM7KCpr3?=
	=?us-ascii?Q?PzH6b3rCFKmblo2AwUTRyPF9pFkaqcCBhOHV1gm4QF7DtjqYBljMqlZtGLhy?=
	=?us-ascii?Q?G+9iJxdYFNKStIJIwv1J5v+Sx2xu4T6igOSjlBsMO942QlKAy4gH+FgmfrhK?=
	=?us-ascii?Q?kvSQSl5rKXx7Nme9B1sAbBc8j86JI7Hisp9OTEsCqofFtMT4p7cgCeSGPmeg?=
	=?us-ascii?Q?u0i4jXm4uw3pEACyHgxPH2OsmVB+CxUzHQ31DCqyqcPa4J972vtI+c7tcSze?=
	=?us-ascii?Q?FY8gOr1AtapMFWhR7756S2LpUjMfXjNGjFzKW1iFRYZgo3t+UHtcr0KX/p7r?=
	=?us-ascii?Q?kg79oDYxxeaZiAs/63Wbz/Stp19zfynM0VWTa3XDw9EeBhat1Iu?=
X-Microsoft-Antispam-Message-Info: Me/2lR65e5MrjzlFCBXqb5IJK+y/LqLolbYzkj4SHRxkH9FB+6RXyQNbbLZHD76QmTfsNuYYYQltkEcb9qvxm9YKSO1+hznCVePZH5TF+gArA4fn6p4c/oavI47V7XvEMTsGrG2vcCI8QbzwcsY/avB9pt3DMyc6wqg/MY83zogwPIpqhwsAlm1+L57AvHuCs/TkUgEJIKA6KB/ixcMuZdZpMmeqG0BM1fAAwyZBy7xl2J9vPb1ypIIPWvkXg4LpknVFWvzXdNyq2TKaEqsBRaNaCb2R3sfh9a0C/ZknagoQgkYdhfy7gs6Ut2n27hvUPo+UfmyGVfoPSHPQEjYm5K5mMK95CEvm14bK1HUJXGIj35lJfvFfveQ+/hMFY2Hg9gueDNiLzoWTjOadUBmx2NG4ifa0hCG6Eywk5AhOKwQebqY4CIZNG/f3lZXiLSfwQoNzbMJEotZsh2tPbE0pFXk3ATxqVRHRmcz2WavVFfzatenIAG9a7zNKvvUwKDID0sxritNhzeMBUKVPBp10Wp+MOub3aSbJ6R9tySS/TZhEgaAmaCiEvDwJBDaMuNYbNtsSjcDPaJAm6dPKYvgMRLtStn+q5YI5Z8iuxpVKKtlFJbU8ZcyzjwqdZQoavIG2CyItKruaP2bN3FvjVfykpv1Sezw5fLOYjRzbYB5HabQY3VWTGLQ8T11FpyfCR2to+6hzWMEUCR/EHMFdGwx6cg==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	6:oQxQkATAtwHLp96ypV6FNGdfvReSEw5EktyApqkEXySM0+bjWL3QLS5gJcZOhYPuzuAgqVY7rXwao7h64yko/6D6HlHUuDPuatMSvnj/P0c7xvchbBMyuICn4YH9X51vBnppXbkwA3+jZKlG07nb9JqSRohzyol2c0qWf5z5bapTFHnWieNWK63hkw4hwq5hZnbS5//5Pjt3lIFQKHB9qLBvMWeA2zBskYZATpZdZoTfb8ZuqF63VknqSX0F7mL1VFcnnwyxWI7i29RIdc63iZEQMHL2X2+s8q2nVe30TYmX1fgUwkHNHdcDokNlngKe40YPHopunNC/Qhk2RkOotzeN8Fzvfjkc7pNJtfMVbdOq6CQW7ztmzqI2REqk59gGn5k7qVH0B5bWcOI20Kw2bEWHw0F6zrXQprtROwKq7Q3qN5UXPrZYUGWEC6McJ2lkqkgKUiuj8undgbNieko9t/IkGfyDTvoX+OaOZ+JJzd75fFk2gvaMkOtop/q0qvA2;
	5:U02802xh0Hms6uweKCcilDsMSt/yWd1O/jGhLS/u40SSqgJtVQ0L3Vx5unPdQPMAH+FZQrC1ItQvcuwTG4Wwee1JbSHMooNytQTH/A8sv2unlkWHKHjvmv0sHTZySfUgOAi2EGoxObN3D0IrqnyL4cTlncBYocQUVDp/Dlx9GQo=;
	24:TvBx1NWvaEpVeQnP3b+V9pFMH8EUxYvA/zzFq7rSGFF2oP4Ho3dTeR851aEaB2vyAvXOXwFa7Au1iBcby+o0tA==
SpamDiagnosticOutput: 1:22
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0388;
	7:F3AV0kFxIzonbw9wqzzIWPLLFUIRSkWMKPRG4TkX9fRL7ZkWkXjeKD0xCP5P5DKNnNjsBW7kcqrH8EGpfBPySFIa7s4J/WTj4ty9WOJypVQ8tGn3/VpyfLMe9MkUFGF6atXhzxA/o/n503nEQ7eONrXZ+ZKjZDtttmdUTQLaNGhZeiHGI5YWhZZFcsLjndYT86lLST42ckdK9rfx0Tm+jJocOGhSLjNlPzQecob/Fs9F38dN8tW4/9odJAT/HRCj;
	20:n1tmS1sE0UZSL33vQ9CY6Tn3wGN3dmyd3puvYWTWdCEf0RYguzWkC33IlnkGdlSgQKAYu+S13sY1Teh9zzU+2qplcdm3vOfn7lEOUJ+qEzrrG4pnZ4ouGPxWtaIjahEDEXKo+LdfLBdGmVxfsc6Jr5jJGUTNRe3//ead1malE10=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2018 21:07:42.9013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e9377e-b666-4953-a8ad-08d5eb602c30
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0388
Subject: [PATCH] ndctl: Add the NDCTL package
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
X-List-Received-Date: Mon, 16 Jul 2018 21:07:47 -0000
Content-Type: text/plain

Add the NDCTL package (the libnvdimm utility library). This is based
on the work from the meta-luv layer with a version bump.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/ndctl/ndctl_git.bb | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/ndctl/ndctl_git.bb

diff --git a/meta/recipes-core/ndctl/ndctl_git.bb b/meta/recipes-core/ndctl/ndctl_git.bb
new file mode 100644
index 0000000000..3bf54e74bf
--- /dev/null
+++ b/meta/recipes-core/ndctl/ndctl_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "libnvdimm utility library"
+DESCRIPTION = "Utility library for managing the libnvdimm \
+(non-volatile memory device) sub-system in the Linux kernel. \
+The LIBNVDIMM subsystem provides support for three types of \
+NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
+simultaneously support both PMEM and BLK mode access."
+HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
+
+inherit autotools-brokensep pkgconfig module-base
+
+SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
+SRC_URI = "git://github.com/pmem/ndctl.git"
+
+DEPENDS = "virtual/kernel kmod udev json-c"
+
+PV = "v61+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
+
+do_configure_prepend() {
+    ${S}/autogen.sh
+}
+
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 755 ${WORKDIR}/ndctl_runner ${D}${bindir}
+}
+
+COMPATIBLE_HOST='(x86_64).*'
+
+FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
-- 
2.17.1



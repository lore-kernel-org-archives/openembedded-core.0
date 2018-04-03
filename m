Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 35797 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Apr 2018 05:21:27 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0076.outbound.protection.outlook.com [104.47.2.76])
	by mail.openembedded.org (Postfix) with ESMTP id 6A20E74851
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 05:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uCrVBs1auS1yyir1OXhFC9+KJ4r9wdRoXxVi74LHF04=;
	b=jzQ/97sp6PxxaPYNXA5uCWKcdcDp1Xnfghp3j42+U4HV1TAY22pQnpnXynzI8aCzNN6Dju1R574wjozJSk5Jpe++jMVzHWHH+bg+NkxbOB/xUvmlN7KEBQd6eBRlSQ9uQFDBDOQWrR3h3iiJYj+6iKPv8HcNRdrS5weB7qmkE6s=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2818.eurprd04.prod.outlook.com (2603:10a6:203:99::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.653.12;
	Tue, 3 Apr 2018 13:52:12 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 08:51:15 -0500
Message-Id: <1522763475-16001-2-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522763475-16001-1-git-send-email-tom.hochstein@nxp.com>
References: <1522763475-16001-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: DM5PR07CA0036.namprd07.prod.outlook.com
	(2603:10b6:3:16::22) To AM5PR0402MB2818.eurprd04.prod.outlook.com
	(2603:10a6:203:99::9)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd543362-04ca-481f-cd29-08d5996a1a89
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0402MB2818; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	3:DCaVI/eenx79WJhSnAZ69qM16Es7S60D9FaexAVp/0bejA//EUGHZFpeeIt11o8LseUZsaILAbmmJ6xJslN32HJLbqXMg9VWjiR8zBWf7LiiDx0aNER/30GtOYJeR1hnIpn74lf0Z49fOpo8GFGl/y8wYyNBvMUuNZElTzNzXzJJHCaanUWjMJdKxVrqI31qhtNauGvCzG4V9Q8xSuHmPvvitQvsJgOtr7+AvOi9UwH6qlbrfs0E91NcWrlxk/Xl;
	25:hvU+nLReyeNUaqshFQb9CRy1ZIfX9OOWcMYBuk/S9R41J9oX7gzyEcdATscwGi8DHxqpkLGvxAxX4jkixSjpcTujoLELdw8A4gXqX/MwV5E7KQtjeTLSbxZP3cZLarSKjfqwiJcJGWBsLyPQsQO/XBQnuekwasxQCiAo5hO4BZ6Tvt4Q6ygjWel/FZnHXfYyEweJmrBEkWWbekxz2HNsldE2esjXyBv0KdXbQ0WaKFxwQCljgXpe+9NgzNj7Z7AxQsfWJt6xh/eTFNSv5D7l/o7NCj9mFUWYKpmD1GBBrT1k+D/+spPRFJ4sW5A4PBga4W38S+HeqJM2saMI9VR4ag==;
	31:9kyTrih2iWgZhwEet4h2qAniuRXOTa5hiPApc2JNVLZWL3QF4Tvq1piwZqUiHNL0nV0XXkkm2/FDZQHd+no9qi+VjWDV7FALg/wi8ewJD7Vd7P6lGPsz7SV0/r0/ggw806Z+Rm6lEm1rQcEiHHywZO4KOAA4ytamBZJetxmPRruEKG2tHlVjwrbkTlgIuKeRLuNoicQ3+3fcR4oKBS/2bqsLsm7YSRWTvmfe9cbKezQ=
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2818:
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	20:uAVk7R8aH+61UjofYTyUu4E3Lpo0J91Cb5I6uj5dAuinXyIkOuOvQrlAf6r5Tm/WX1o5p3PiJjX8WMQNB6DyYKslVw7MxI/Ah82FZANpdlwnCQn+OddLNjZsW1O29DzMQJfacDVxcAo8qeLhdL++lychgk5/7l3Ok6RxqKvIhPXpER4OrBwkJ5l0i6mABCXItFT/QMkNy7WSk1OWpCkcAYSZ1hwMT6yGwsb35c6Ax0PPfE9SvRj9M1CoTUTtpnLgd35h13i9QxZoG4E1yYFOi1/ejYDDJm4FMsZZKMPGpRKVssb+jExTFOYSmEeP99BTr3ZXF1+5tgFC0hdwj7lcgZfUf0ZivyStCY1rOEPIe1tsWI3Un086nh2pKxOrT1BR+EjDrtGOHsAAv/4IMlUjczBEdCGk2lP2yLtfdFaIVG0JzLDp+Fij/xVxHInPR7SzcezSw3GwwMZkm4J63wFjzjvUix2wY3cVG+c4+tixp5dxTP2QqOJoykLBOKM7GGIG;
	4:nd3hd74aJm55IlbKyjDZx0HvVKE0gK8TuDreV5d9ysWc2FE59HHkfjH7+HPVE4eXQuTB8MVAhR0ePMOvIn1ncW1jGoiTaNH+4MUeHyFJG4b6BZG3fkVzRloH0MX7oi6AGoaKQaD+84AmRu73w36fjRwmQqXS7T08s8iIpXDN4XL1y37TrnaHqBUXwjvhRMk2lU3Qo7MNCeeMv4tJ4DUWlV+9KiCEPJmXYD39kpjYYOHKkUi7DhSOfDXe2Hdg0/21bRM5yilp6yDX4j/EdaMt07yrjV7MrLFSR16U2r5M7nPoEige/tY1wFNViCTKLvlh
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2818587006A3D30AD97EC4A5E2A50@AM5PR0402MB2818.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:AM5PR0402MB2818; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2818; 
X-Forefront-PRVS: 0631F0BC3D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(39380400002)(376002)(366004)(346002)(199004)(189003)(50226002)(25786009)(47776003)(105586002)(6512007)(6916009)(2906002)(305945005)(7736002)(66066001)(53936002)(48376002)(50466002)(36756003)(478600001)(97736004)(2361001)(106356001)(2351001)(4326008)(81166006)(81156014)(186003)(51416003)(8676002)(8936002)(52116002)(76176011)(16526019)(26005)(6116002)(3846002)(446003)(11346002)(956004)(476003)(486005)(486005)(6486002)(316002)(6506007)(5660300001)(386003)(2616005)(16586007)(86362001)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2818;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2818;
	23:x1C9vyXHPaNYH0eSwW1AHjiWcb+4wQ3HcS0q2Xs?=
	=?us-ascii?Q?y2cLQuipz/vulhCqroLxncvsmiejNL1NnWgnMXZrbYTMHZowkKFbovAp79eJ?=
	=?us-ascii?Q?oQKtVGNmpH2MQWViPZxOujWH78ioub2Q2eou0GGlQE8QnXWbsGsXLi9wYjiY?=
	=?us-ascii?Q?hTvb/JFqyf5UYVIQ9ZTFdyKf/Izu7mHGyfh7pD81EaiPawVLuphZ3wBb4SBM?=
	=?us-ascii?Q?idWQ+vIV62OOfXVS1DKaSo+bCFLpzRdAvw2tBWix7e2BdoHuKOXaHPc+Obsh?=
	=?us-ascii?Q?F+uNZuMk/j9ODOzh+tDCOV7E7OtAg7849oVs+Me1eLmMgd6Rd8hJQHtIT0Pq?=
	=?us-ascii?Q?TWEcIJuSiuS/Nd/ohVYzB1LhEuANSixrvXfeGBBOVlznio1acP3TF9wdxChT?=
	=?us-ascii?Q?eTtWXtAt0p2Ec0THU8NeWuHl7U1N68Yj4Ec23jvREVUvjyRVZsqbAjUloG2p?=
	=?us-ascii?Q?zMyZ8Vv/2AVhLWM9wAxQ0qqSXXHJpAD0ic1d6boKgVhuhaG+6wsUOmhrSijU?=
	=?us-ascii?Q?nHX7SeHN0JXc9f6LhOYefeWRu8EJ8hTlT3fEL4qrKOVv7fYSvShz0yX2LfnX?=
	=?us-ascii?Q?3zz3s9ur/HjhsSbBvGZ9GNkfI2of0FhR/S/mj8imkOaIoyq9C/ecHfluqs1Y?=
	=?us-ascii?Q?pVcoQaMWs/PuhKB1W8uDE96L0aFimO0cbk+8Ns5s2AkWuF0ihNsI/OrVKiKV?=
	=?us-ascii?Q?bSHr1q+stQFLFHUXnCCotkTx5pfO3Dn8OmtZXvjnD9TlSae97CKi1OkFiY26?=
	=?us-ascii?Q?7wBY0ED4fCmO6GDh1NagU2j0OMz6GL2iWaW5eKbwNbbTkPXqiKKMoDorG9s2?=
	=?us-ascii?Q?6Kub9hpr9nQPwzmCYzQQ08hTBL5tzjNV3fm2wA+CUgjiY/I7a9GwXC9wIWtZ?=
	=?us-ascii?Q?NgWQerbrIZ8a0beJ9uZmO5siYED/+9oQ4f9oJbBTR+Bw6aSOC3SWOBOcCaja?=
	=?us-ascii?Q?ZADQq35jIT5U06L95S0FneX2blzMENJdvUMNmFY6Ny216rz7OUExecGjQBrE?=
	=?us-ascii?Q?jAdBD0PuyPkPCFwerXJkxb8ZXaP50v1Yd9gBU0mhDfRVVNA48Dsqj/khPa7W?=
	=?us-ascii?Q?pdbjdKAMAPp2BA+GDGq+x8C3JHxjobsdyl6DvnUEk3UfQZyZrl3JmQRDfcY+?=
	=?us-ascii?Q?Q9ydm9Q/S59ksEXPOnf4JR+PCrrjSdh0yTW2ZPR3OtKrTjg1nqBTJ4HagpSi?=
	=?us-ascii?Q?gZkZSHFxd7b4cXxyJKpa+8PhVcElxA+9Q9PCD?=
X-Microsoft-Antispam-Message-Info: CCQrhqZ/ExDa3xRW8fELPJj08w5WIHQM80m3/lwvFxUOyNhTZ0OzPgsT/oX7TuBLhmkwP92RWHEw4bRlY6p0oEQOXWYNXI0wnsSddzHna/wHo0xyH1BfTgc9pVPQWm6vvuk63Ex1PB0iJLaqaDKd28quG2qRPVgrG7St2pRMgAWooYlQZ5YIPNuT2EYtgjOq
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	6:NzwxAW5sxVnHhOwj/01yClIB9BnJgyK/WLCVOb12APeBGOe+nspXpe3NFACM9UwEsbbUZeKLpGGEfyq6OQBrG/bL1NvqNJVvvPF8Q/nV9U1w9CIQB0Uua2ZUxpo1IM5bs6DvHFzYZOwYdhUDkJDMHbIau5uTbp2zLIQ9SI/2uzTe9UNlKVxyPjaKGJHIGhdSMod+dcCkWh7e6mMeOvQyYJTHQdwA2sHKfB+EZT/u6yAywNqcDhaIhx0sjT6gXHGzcjfWo6Z+Ybn1a4gotNdKSMRYzytaB5ILVjh4DZvX9f8nFnZ9X+flRH748q8XHFNssFEGYh4NQgKLUxPpiFFaetg6pYsmX89xMtROrgutkwpjoTIpQauv+WApcaIV/X+5SgX0DvzKhGumzHDXqYmjFFt3vZ8EuKc8m//YwXMaRd6Tfw4GqnkT4j3vMUuD8feUI369Qi54+aPVZGNOM1FOKw==;
	5:Q4hnamJEJRtUASpfdnIpNWCHJkW7sXSL7d+fYgvEoP7ouHQnno/icVAzeDhKHRmvMjBMlJNzebz7WNI1p6Gt+bFovX1KvD6U3a02RhOesYfnMRnnc7ssEfDIS6EoPV/IkbRhVygz6K64HWReoQqOR7ZuxdF5jdRG1U+Q5USrgmA=;
	24:yGEC8xRZm+ZyocOQjRKjuQmfBLOw8petk6Icq6QflLmszafBhgXXuyV8qhzEiefs4EWvcA4i91USVZ3uoFyXN8XiEkzAy/efM7iDGYc2hMo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	7:R7s/NHXJXqEYkw6DFWNNBwiSlQpwWxZV9t/pi8sihopzwOSrX0h4ovW7Ngj835RUIMDFvV20dVOreMLs1ngAdJ0xF6EoZeKtSQ8TAy7MrH0qKewV8DF4toqaoFH/fqxu9ufh26L1pjhZd14LETCGjjDRMyo3vJhKQ3NueHCk1q3f02DS7/L0EA07kp6Ml9ijZOzKPsBcM6gJcz80MS2H/NuV6admQoCwCkYvqA5w8w+sJwKhwMP1YJHQIFjiPfAt
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2018 13:52:12.7833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd543362-04ca-481f-cd29-08d5996a1a89
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2818
Subject: [PATCH 2/2] archiver: Fix archive for linked kernel source
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
X-List-Received-Date: Wed, 04 Apr 2018 05:21:29 -0000
Content-Type: text/plain

When archiving a kernel, if S is ${WORKDIR}/git, then
${WORKDIR}/git is in fact a soft link into work-shared,
and the archive contains just the soft link. Fix by
archiving the real directory.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/classes/archiver.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index c107615..31c9b7e 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -277,6 +277,11 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     if (d.getVar('SRC_URI') == ""):
         return
 
+    # For the kernel archive, srcdir may just be a link to the
+    # work-shared location. Use os.path.realpath to make sure
+    # that we archive the actual directory and not just the link.
+    srcdir = os.path.realpath(srcdir)
+
     bb.utils.mkdirhier(ar_outdir)
     if suffix:
         filename = '%s-%s.tar.gz' % (d.getVar('PF'), suffix)
-- 
2.7.4



Return-Path: <junzhu@nxp.com>
X-Greylist: delayed 4643 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Jun 2017 03:55:27 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0041.outbound.protection.outlook.com [104.47.32.41])
	by mail.openembedded.org (Postfix) with ESMTP id 41A4777D81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 03:55:27 +0000 (UTC)
Received: from BN3PR03CA0067.namprd03.prod.outlook.com (10.167.1.155) by
	CY4PR03MB3269.namprd03.prod.outlook.com (10.171.246.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Thu, 29 Jun 2017 02:23:59 +0000
Received: from BN1BFFO11FD032.protection.gbl (2a01:111:f400:7c10::1:133) by
	BN3PR03CA0067.outlook.office365.com (2a01:111:e400:7a4d::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1220.11 via
	Frontend Transport; Thu, 29 Jun 2017 02:23:59 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD032.mail.protection.outlook.com (10.58.144.95) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1199.9
	via Frontend Transport; Thu, 29 Jun 2017 02:23:59 +0000
Received: from localhost.localdomain (shlinux21.ap.freescale.net
	[10.192.224.10])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v5T2Nu6q008384; Wed, 28 Jun 2017 19:23:57 -0700
From: Jun Zhu <junzhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jun 2017 10:14:55 +0800
Message-ID: <1498702495-22043-1-git-send-email-junzhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131431766393006756;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39840400002)(39860400002)(39380400002)(39410400002)(39450400003)(39400400002)(39850400002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(9170700003)(6916009)(8656002)(47776003)(50466002)(5660300001)(48376002)(356003)(85426001)(38730400002)(110136004)(49486002)(105606002)(53936002)(86362001)(2906002)(50226002)(8936002)(305945005)(2351001)(104016004)(4326008)(106466001)(50986999)(36756003)(189998001)(33646002)(5003940100001)(8676002)(77096006)(81166006)(498600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB3269;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1BFFO11FD032;
	1:d2OSvWBjCZv+igVBa7ELDZSXtEBIBmvJsi4NcNOXF?=
	=?us-ascii?Q?NoqnbnIAxjc6fN/XuTCXj+xuWkORx7Q4bZPXMni/AT5vv2Hb+XiEuyGZ82hX?=
	=?us-ascii?Q?NA+eC1arXPSFWcDkcniBsiO4ikkxxHVQKqL57MWE0ka7DOl35dOrAMFXV27O?=
	=?us-ascii?Q?HcbSsN/13SN+8WszlxPH2m5da6wYdyQ0iEIR7AsmK/B33a1EwV5Jzd0H/ccZ?=
	=?us-ascii?Q?UtjtARflO2o374BNEDIjuY4g7rfp7MvzLpp5EErSBroTDsmYj1nVw8Aw4XM/?=
	=?us-ascii?Q?wGEZuPI3otVQrGACTy2U5kyPXPNqdHYhVEazFHj2TxEkeDRmrQm4M80pvqc9?=
	=?us-ascii?Q?9i409QA+Wl2PNTgZ0dA3X2a+XSA1jiufvDkFVy2D+rSEYAD4O+Il04NSwUzb?=
	=?us-ascii?Q?FfB0P0bSBSBWWYOijSVGJAJaAgjPbnhc3LQX+eZCSXAUrJdZOugypDkOWTIC?=
	=?us-ascii?Q?0Zqfe5zWCJUPP5nQCS1EE+V6k5Jfcj+LLoFt4sXpU+ZkZKmA1c5jP+wcfyoY?=
	=?us-ascii?Q?w//gQ0aKHI1rVOPfa4nZE5biiymH9hWXOmoXjfbGPlDm5yxBwWk5bnik6mQ4?=
	=?us-ascii?Q?lKwOyRL74KtRiAmBh1FjOIKjWqNaeU2xmfkVof6qDZHCFfO/VfBmeNIiv+j4?=
	=?us-ascii?Q?qZA+q7aZ4xhSjW5UrRPxiBi4rJQuxl0cO/8AxG2v3/oLlSLwPY20t0lTtuW8?=
	=?us-ascii?Q?JP6ps9XdBnvISsrS3OpLc1AIrKZ8X8T2qdwCOb/uXavJzobsQIOkMjAJnRhS?=
	=?us-ascii?Q?EGpU7e4QNvAJhqDsWgP73YLeAVaGRl3Z5KY3P0cUU1mCrfclP0AJnKBaLUaA?=
	=?us-ascii?Q?G5RkNJ4j/53FUarg8rFFM5go44aDvHhfcasF8Gd6n+cxJntVp3ECrxtdX7/O?=
	=?us-ascii?Q?hgebCvDYN2iB2cWR1IHpRq6ddnOzwHOK1GtxJ2TEvTQ++NuR6c1Kc/B81sJQ?=
	=?us-ascii?Q?Qi+7XaXIsAXiCyboV9I/1loF2XhmxCMtZLoUg1AAQJ0MxkHqbmLTWExT8v7R?=
	=?us-ascii?Q?OiKK/xeG7udURt+tCUbCxOWWP7vhDOo5dK8zBhB3z0mexLogpCs06nVPTD3U?=
	=?us-ascii?Q?U7Q9dg=3D?=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44478cdf-a172-44cb-4944-08d4be95e683
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR03MB3269; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3269;
	3:PXJQv02zD3f4/t4ZlL+NaWd+CnJ0V0JO9yAhBgYF0DU0fggThxoTlVpvmGnIoWu0GFkXRjbxqQFOHtKcwKlBIGT8e3D3oH/zw2/BJ6tiorJV8rcZ+tq/P5jkug1JGQ+lEdH/nm8xlT9yChGQ4vARaXLSxAMUoEJYZgfad45YWiwPGlPcTGRofY+SidIbJJb3+HIYK3Fs7QIRtmGVlZzZY7NYDvsN/sTSQO0LNWaXEUgIOL+QgL7vZ1rIN8z/BcOs5oVdJEYngM9gYsONnNmYdOnw+/exO5LjXYLDnuLP5D8CViKd6orFGSguxRDkZexdWL+kRRWfLHhAzt0xn2b4EESVkzNWxRSBGrnj7ZS+f2e5NDrH9BJgNJqciEc4yg+EPSaeZ4G3G4gsdkms8Zf8Ew5ZQe2YzrqDtDoPm2ysA3luXRAT3AyeRx7P9FF77oAtSRzD5gv4eHOMoGDAMBr5Wny+RpQXBEZJMIXhqfjgaShn+UhmsGOQXwzznlglm+Et9bc9Yn3sSh59xcXSNaWEmsLgzg/WUIjzwyPLdVY/uVMBehhdwea4OVLR0Xzzx9LPqOslYWWvqRaiDGE4bKXcGcXaSecK3pk3xL5izvcAy/thoDUSHBoQ0ofg7XIn7E0FGD7xT/v9bnXIsbDpNniB/GwpH8eBgz27NOCDnvdtx3Jz0v4yHXtfyH7hxs5NSWmOMPEegfUCpYGvLRMreFyij8XajzHfFQbIt1ruTtTG1fBmnWCbmQCs9z57tYkdTuvOiwpWxodvqA+0cNWjUAmxyHgcbnupvdf8lsg7P1IUPFf7xAKvNxkyrdMzcrCHz/yCg++iBVbLfLB6m5ZnzJKA4A==
X-MS-TrafficTypeDiagnostic: CY4PR03MB3269:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3269;
	25:wnBgrvNLlKtE/3kSmgSUtv8+TRgD3TI0omaV6yzSHBwYscXY9FAoKYAY0VkgHQR77qIqgJjSf8vQhgR8bvNgNCBjoJJtZy5ppWMulWncGnJi/DuMtwQJMIByiu4QEixd3fCVSyJik/tjcF2qYgBu/JhEb3o4OycUIRz19xt6BNUoaBULXPeaHRnEXYl18wqOXe4rBhcO5YqP6b2kPcrFJHL9cAsWat8MArZbhGxiV8x4x1c5NB/6iu9tl0DoIvhHV5QgiS6Dx+hI78gTU0ESsg73AJn4Giqs/I7Uauk8JI3bSfLTlT3s3FVNaEoM7huN2LmbIdxARGH6+e/LZo1QY4MtGrnZ9Wt0Eri7NQNZxPa+uRCfNC9f6R0iN64/dHhxUz+cyPIKIGEbEwZJS6S4cy1h23UtJvFC0N0xCGnIW1kukrVVLvpgoCdxwz4HWVquEOChj3+08aFrm2j9jUUOSdFV/qda0Q0RWgKGKH3thnRSYL8/Tzf7YFLiGfpltadqSRv0BT0Ih8kn4pEjCnjeAr3mfPk+36oDLNcK6xnj2kL7nqcX5QxAoBXj/Jl/3nNt1mEywy3ggO2VOFRiHkVc6/c1GyTsbFoV8+w3AOwaD8bwXNFtMAdHkbA8TAyhRDvlMgwySKKiiQgmXH70/SvtBzvLiW2uK5PW10pEPMqeVrNvPeS0IUPHXKtjlT99/Bz/ldJ2bwp/SdhASW/2rxIAjA2QHe0AFC+2FvnN09mejJAjNVwVfyU4vrs4bFI8lg3zgUQj28WWOMpgO+lePX+6fxGcqqkhX6mq8hLEqVbj73CTumwCEDeSbhohaQQ8b2vl5U8adGa3u5Kx8iXn4Ekb1q9URWjvHbfriYMHEyotRR0FEjw2B1IRkTVj6PrjlpLtVTCp5W06K5IV8B1JtzhoIPEJ42HZSlDYcs67ehNKHYI=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3269;
	31:OaFbaETxPu6T+6FbL3aIl9s3+9ApKH9FMC4cZKKW8ndqtxYroKhV7RTEAZKteI5+mD6Fo+Y1QU7fGx4pWfOViaKWwjARTCA6pPhx+d1ibEp4e4Vqy3sx3e0xZD2uDHXsEiJvWA5XWjxWG5kkYKWLRXTZTjHL00MAIviI4X14uhe3oxLfmPMwBSwjd+n9T8+I6KXKbUSzn5RknCYOVNfN8q7FGVO77SA6QtFwfTqcuRjbwKvRFTPT0Iuhm7ixFp56kE4fwgEmQcUVFqOjwFcofaYt76jEYuAUlPc7xoRfJx7U6wuSHbtliXj91auz+IjMhlDc9zfhiORzpuHrVAR+MUu8ia1E8Ew4g+GivsMRQiN9QTkhaUz/DG5SAejrbtw+BNwskKK6QJae73Kc3/1YUhVCYwKNe700o3Q9bLZ9S8XDOvrS6vbDSA7nXCtQWbGSi2a1GrRkygUuPrERdLvUNH/EpQVfbC+/Z9dp8MNywYfb2KC+t57Txq4ukyomjpiPo5v+3lPKdRkmja4qci6FQt3uFnzGa/a5+RzshXx1wPU2PGnx9pzFkzZm7v4UySDCczDjhj0mB7GoONljGakvqOv85tuWI/sdQZ9fqPBLKzWGoqfp2IfM2HKIgvoSNpV2XzDSueZrr2+jfUrZZ/HXN2O1kn/fRYg6LoPFlvuzYHTfJffI/IH4fPP64SdbhTPhCcGZDbaZEYo7BUrkbJUaqQ==
X-Microsoft-Antispam-PRVS: <CY4PR03MB32699C3D4DD28BE620D09DCAC5D20@CY4PR03MB3269.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(185117386973197)(148574349560750); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6096035)(20161123559100)(20161123556025)(20161123563025)(201703131430075)(201703131433075)(201703131441075)(201703131448075)(201703161259150)(20161123561025)(20161123565025)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR03MB3269; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR03MB3269; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB3269;
	4:GKuYu92IcokJ5sw8sTUgNzlkjV+z3iMhJHr4/AghIA?=
	=?us-ascii?Q?lBuQ/LnJMGS0s2a8D9DsHsdSD4Y4z65Udeg6wP5FlTbnAxpFbE4FGLvPwKFE?=
	=?us-ascii?Q?xuw59eOXnpReJhZF+pe96XRJBAvIiV+xawW0DKzVGJ69tjfnZAVY6gYpOhnY?=
	=?us-ascii?Q?vqLyshkvYA9/5lU+syaHtRawuSEJjbstFGD3iArtI5DPuH/uHsUWybKjMxcE?=
	=?us-ascii?Q?HM+3ixDRAzY+2JLvQL6a7kOiRtbJqr1Mktmz7nSDmHTksAe4N6ZDliRMsbrX?=
	=?us-ascii?Q?KIpm//lx1Z6x8MzKmNKylJFTelShEBusAgAuAejVRHVkGWref+nOztrXK8gc?=
	=?us-ascii?Q?YQzUssAv/jnrooPTsxkFSmmTR9nC8j2yAwO5AoQ2Why6W0zk4g/mAOjKRrSF?=
	=?us-ascii?Q?EZQEzBJ2F0byZc5mdBsnmsl1rra1uzX4QVa1lWArvguXng/cfQBDFn7vHFwY?=
	=?us-ascii?Q?hNKuG8aSRGtveuhE26s1nYHdMbMdmWMaz1CWLkyjBWN3E/MESIyJR8FbyuUW?=
	=?us-ascii?Q?Ao+OQjs0yYKOcMdS9LRVuY5DbmdSm8pIpy2NxBjSzEWxqBkAm54yJJwr0GlL?=
	=?us-ascii?Q?mvqp5mr7nDgg+2f+xs8Xg+W5WHsA21vlGzG6v4S/uecdbERZizZcanRjxGml?=
	=?us-ascii?Q?gzMdsJCRsKxz1s9j83LjSKSgl/gQmpF5CdIR1BZ/kiluMtsytL8PS7+yloXA?=
	=?us-ascii?Q?QB8Q9M4vp04K7F8arcazJwWXbU1kfx7isdpUhOar+ZWHuvfafEpT6SaqAzz4?=
	=?us-ascii?Q?hSJU3gTyk7ddbLrt952Wvo0pakspp4izk29liWAK9XhTBwFQpY1s1qkN/JnL?=
	=?us-ascii?Q?fV9MrbQpVdx00mM2qd08TVGBFeubh9ZR7v/YVC4e2MndziT/qtQR4fLSft1U?=
	=?us-ascii?Q?j0thystr7VNwhDb0FC5Dc4GEwBQMCrCaCbSuVg2TFrBoOko2nRhD8fbiErXg?=
	=?us-ascii?Q?Q7xwRgEhsSC3JD1ST+Dens2e/JfSZMtCY+wEvrGBM0TKpgnf953FVvXw6unM?=
	=?us-ascii?Q?z1dQpwUfKDTSM8ngsWn558PlPD4e2LZKEqcFcufAY7y/qZ1UnLc7FlDB7pwW?=
	=?us-ascii?Q?W4a9Ro5v+nzgM7CCjeXK64DClJYbY+9ChMDCujye/iMGUfAeD3ZWf1IDFMkK?=
	=?us-ascii?Q?DrlQZpDjl3nsU+loP9Gs3B3xEUtrPsVFWO7NSnqWf8g85jHjQCs90DaRFEO8?=
	=?us-ascii?Q?5ZCuel1neRM5Zk57IuhvFH7G3oHYu5JS4kJ+zZONKYfTKOGtkSBM2IOId1wQ?=
	=?us-ascii?Q?h/xSdrrbR+FPMUdnIwvBT8VcQL7MZetMMcWM1G/00JkyeYjC+7EQmwJ4JKt2?=
	=?us-ascii?Q?b6bgxmfc24/nhocJMW5cQl7fAVrT8GD2OYRykQmuIB?=
X-Forefront-PRVS: 0353563E2B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB3269;
	23:yk3KaaqGVOBM+lukg9U7Z+h30BFXYRv1cXc615Ix5?=
	=?us-ascii?Q?3N6oCclpNp++07NZrsGe0CroO3DZ/huD/SM8ne3dNUzBQCooGKhmxfS6xja9?=
	=?us-ascii?Q?dBfAGuyx7SGWohkRyf2mhynkscYWKwaUAIILlzCCZcP37julOYKzQZUzV9aF?=
	=?us-ascii?Q?CVyjY4h7vJNKGTfh8lAZTgskHeax8ywGxe9Oh1ABUWJlvN+T/8ZWzrDpo0PD?=
	=?us-ascii?Q?K/jJ8CeWPE2zhHECEOdJkRSZp1eA1INIr7jZAgKkvreHr5KtOp05whiTXpd8?=
	=?us-ascii?Q?C37w/j1f/wSNrajgOiZVXn2dPywI/rgvzUD4bnwqMjTGpmRsy9KN/Zp0V4D/?=
	=?us-ascii?Q?NS5pJrIQpwrjsrSVj39uH14zCPgMttQ525O6nCBwUM23EcHPfTjOvcQsaObh?=
	=?us-ascii?Q?IsLroQ58cfmecBZyaN1F8NovCMZlzd9hBzlXgjIksP5QrzGh2X7mQo6dgboH?=
	=?us-ascii?Q?JmszGzRMCbMGT9zH0wAkHjIsvIdS/dMZoI3PfL6Aw0FYEmPwAEJDINwAiVor?=
	=?us-ascii?Q?86GMNw/ITPnIOGZTCWrSI1DBmxJsQjvUFPMVA+JiIhQubazAspWPyrdJBDHE?=
	=?us-ascii?Q?DjEg3nMO2mOa4yyEPTR+zCF3ukbNVWLI0EaY1erznyUBmXoOL+8VbJwQrxrI?=
	=?us-ascii?Q?IBdpzYmany6rLR4ItlyASdts1HIv8/YdQ0iNKBUR2ivsktifURy4AVHHb+Yl?=
	=?us-ascii?Q?trrKg0ECeUPuvWAkakRzJQ+clUPMYTRs3rEaZjz3DVjYT62Bd+Sf1qonzDTW?=
	=?us-ascii?Q?Y4DsM46ZXk+AtNFADMSiH0lEk1nEcFDhC+XwXoP6ooI0QsDuUxZd/8hbzmf6?=
	=?us-ascii?Q?j9WjJ/jDX8LO5bbbgamx6mft13YvHZdtAp1z/zHltw0IM8RupIidw6K+5zv8?=
	=?us-ascii?Q?c45F9rlxB03UtHhapA2hST3sLCiNzFRfdoQ2X5mKe4aKp/NVh2p+yyOzNULg?=
	=?us-ascii?Q?mbjwrLC04JtUZfAiu/SB2wKm57lrt9CDRLp+k4rTdfWrfYSXSb7FHzsryQkQ?=
	=?us-ascii?Q?/Se2q2ETliKy8KB5280+hStFT2W1z95eaBWD00zQ5bAhP+OPJe2tp867cduu?=
	=?us-ascii?Q?vFw5CbK9cQF7n2+MmF+bu4yY3Zcpjx2oM+q13PJaBt/RqSvX82r+7odAeOHF?=
	=?us-ascii?Q?+8K1HVtqj+pw9znuA6Qt9Z7eOfbKNrtcv2RBNhNajappQ598MzalYNJXtls+?=
	=?us-ascii?Q?pBVk5VCH70+3As=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB3269;
	6:fOsRUNOMQdhRFOXgOxoQ/NKL3ZK+yid57X3cs9Igt2?=
	=?us-ascii?Q?uqzVWHfqDq+Psj62GwGYDEmN79kzNaHDZ3iuXxFuzUY6FpAVW3iC8GUMAdT+?=
	=?us-ascii?Q?iHbPp9+yTpwHc2nSZXosH5xrhWZa0ZdKw8bUIAf2KKtXNmmiKXy6/YpWhy7y?=
	=?us-ascii?Q?dDMDsr7q0hQ8x/PBEFAF/gCaZMo0XjMhxxgHSNtBbGw3van874twNajtFUmb?=
	=?us-ascii?Q?ugI4UoGd/mY3iEagyCS+TsIBNqVrbblCvx6jW+4JgH5JQxsy6mCsy5YbOy20?=
	=?us-ascii?Q?lu6a2E8UccGV8DBIqo7kYMMklALvxVAiY0nEVODNrIko4Gh/GwSqTZPy1Vj6?=
	=?us-ascii?Q?nOOh9U3Wp2F9BrX/ptTD8IVCBJZowr4cPqiZGIxJI5xqRCzW+2g+r0TCL57d?=
	=?us-ascii?Q?IPOTwiNePN7jAt4lBAyOCx1tZVnzPsxV7zAU9RDsjP+TFdqQfMIC2wr4ItQC?=
	=?us-ascii?Q?7RmqTziZbkm0b/ZE7cioMM++CCY7EmZ6QIVPJRSdTTjAJ5NTgAQUnTmm8R66?=
	=?us-ascii?Q?TL0ffe3x7PigPg5tLBOJPDFipxKH0OMmbi7aEeIX8jvY0ekweN3U0+hoP7g4?=
	=?us-ascii?Q?5PuVy0MUA8yqZD8e9p9aqWQ6inJrsFfIjl5dSndt4dILkg2W47OZO03mVaes?=
	=?us-ascii?Q?ScfT95Hr59grAcJWLoJvpwqYy6Ruj7n2VUweupQc8PUW/NA2TEnZAyhQ8wZZ?=
	=?us-ascii?Q?/vylIRlSiq9fadkcXXbrqeq1ouKnIH3vMtebR3UWpp36FGnyiZdAncPfi6+E?=
	=?us-ascii?Q?MLkrivaENE67VPdlq//4YeZlCNRn5ysG+AjAzo3q0beLARYzeHe6zx1vXbXY?=
	=?us-ascii?Q?9iUHhPeulu2Mj7/1mCdi1+FFoFKFmBUIl9rp+A8W24ph6f2tcNZIV5RGZst3?=
	=?us-ascii?Q?jVbua+WRgqkIr4UEanzynwjERORSkoga1D134x/4QrxuUkfo5he1bnO0MvxV?=
	=?us-ascii?Q?y3TQjTt5QRr441D+qiMBYv8fq0n5ZMrlYRiDKIdQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3269;
	5:XwAoQ5y8OkWWBIUIM2MvCfgKl3ErjNYThNry+NMrY0CsxfohXVzQhPkNTou79yIJ9VxHzeTmp2Z72h9BdW8Chg4td6YqLZBOuVIhY6BcNIQPTOl1z9XLbdq9c6ND/dpM0TZD4kv0ZLIO+9Vj/VkhLSSJwhVTHwAxwNovXprZXv2DzKVvOjydY4k1nm3cj9ZJRkdZwp66SgZlFGfACFhPPGwu1BqE6Ja0107GOsew8Jxp4dD0RwFzuh2ehbgNg6NjAUrTUGx0FpSka8AYf8kunxJDxLI8WSnWM1+vCwUnp0j/Uc2ji3H5ZNBGbWRo9hB4Q9+O8FjLYCDTJ6Sp+Pghm4koqLY0PshtsXsyOp2gR3FDFTXhWTQ8fKa09PMviT7TclZgzMDYIH0yv6Wlod6yFLBRs66/OWco+rIbCn5k27btOMmTZGoDz9S3hI+NvsPeImkqRX2faev/c2KNU/pLXFgFIW4bgyKxVZ2Hd+SNd3dDCpXs+wcDl3JGuPQOz7a1AbpAktWBf+om3AJbvqexhQ==;
	24:UCbKaEOuPqUndVWRaYUBQN7H2fIioLYnRQR7KaXaWh/Sj+J1JtiVFzTiRbD/jcg9A7gpbwn/WrIUS3TzAySIet27x7su3JFcXSBkOnveKww=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB3269;
	7:WPMyg3erZYjm9cg+jhE9qaARte0PMXz5zNC0oXxGu1h38dfDXytjWNJhWXAheprIBAVeLkVPvVE5AYYGBRZ6+XdxCn+ghySUQeI75pIiyufx0ZYoEGGczNTm+M1zjIJhxELj1KebIIBFmYV1M6nNUXewiJya2znDr4Pmpr8OOK19JwQRCBq/1vPi1lXHbdytbpnO4lm9tlTWB4TgqoPBfowCl/uJjSoftVJZQa37TOr1OFYWogBMUlYYmA1PRC3kdHHuA0cxhu5I80yrD+86C75euIqi3Hty+zp0AH3My74KW2bFvwHHmRa3vI9QxXOUPx0xslfe0e/ikV1MEb69eiwD/oz2VmJ2EgkTf+dlkvxP2YFMvRPy0o/ke7bL4ZKduFDnTWodNmh/kujj9qiFBDhJOS+VElZ3y4XDi/M4AZOhh0WSleaCGsoRj/05Ax7VY+IPOncAKNEjc5KyLQ2RG967oXxbRbbK8gGRw/aeISZMrY6+3uewgSTXhYhtlTGkybw8rfhXKxkplzrzvF9sZQmVcEN6OKTUEtBAU7dtJYaE1+4cKXegGNAvVCCFifNgu11wxO3cYkdsaXOCmcSomliQu+RBZc8i4LeK3fYSCL+neWdxUgKt1qVzFSL6XfUvSVvn3kh4/P68FBvLHQJiVVhtUDXKbuDHYDuaaNxB4BM0nSB0phjL7qrxgC/voM/lj/oQiLlzRDdryyCuFXEJsBbQ64d2yc0erZBdwGtRRH6akrIk0BgLnRhTdqeDL3cuidDnF7zoTKlhEQRvMArXMyLzmfmEFO6i9wHolZCN50c=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2017 02:23:59.1134 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3269
Cc: Jun Zhu <junzhu@nxp.com>
Subject: [poky][Patch v2] bluez: Correct the timer count for bcm43xx firmware download
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
X-List-Received-Date: Thu, 29 Jun 2017 03:55:28 -0000
Content-Type: text/plain

bcm43xx failed as time out for firmware downloading.
The root cause is that it need wait 50ms to download firmware,
but the value of 50us is set to the timer.

Signed-off-by: Jun Zhu <junzhu@nxp.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 ...cm43xx-fix-the-delay-timer-for-firmware-d.patch | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 01ade7d..2c10479 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -27,6 +27,7 @@ SRC_URI = "\
     file://run-ptest \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+    file://0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
new file mode 100644
index 0000000..7bd5bbc
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
@@ -0,0 +1,36 @@
+From 3b341fb421ef61db7782bf1314ec693828467de9 Mon Sep 17 00:00:00 2001
+From: Andy Duan <fugang.duan@nxp.com>
+Date: Wed, 23 Nov 2016 17:12:12 +0800
+Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware download
+
+From the log in .bcm43xx_load_firmware():
+        /* Wait 50ms to let the firmware placed in download mode */
+        nanosleep(&tm_mode, NULL);
+
+But timespec tm_mode is real is 50us. Correct the delayed timer count.
+
+Upstream-Status: Pending
+
+Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
+---
+ tools/hciattach_bcm43xx.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/hciattach_bcm43xx.c b/tools/hciattach_bcm43xx.c
+index 81f38cb..ac1b3c1 100644
+--- a/tools/hciattach_bcm43xx.c
++++ b/tools/hciattach_bcm43xx.c
+@@ -228,8 +228,8 @@ static int bcm43xx_set_speed(int fd, struct termios *ti, uint32_t speed)
+ static int bcm43xx_load_firmware(int fd, const char *fw)
+ {
+ 	unsigned char cmd[] = { HCI_COMMAND_PKT, 0x2e, 0xfc, 0x00 };
+-	struct timespec tm_mode = { 0, 50000 };
+-	struct timespec tm_ready = { 0, 2000000 };
++	struct timespec tm_mode = { 0, 50000000 };
++	struct timespec tm_ready = { 0, 200000000 };
+ 	unsigned char resp[CC_MIN_SIZE];
+ 	unsigned char tx_buf[1024];
+ 	int len, fd_fw, n;
+-- 
+1.9.1
+
-- 
2.7.4



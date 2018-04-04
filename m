Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0088.outbound.protection.outlook.com [104.47.2.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4464474A4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+FGeeA0zPKvVOI9N5SEb5kQiogsjC76htK6lIPXkrFY=;
	b=j4zKODss34NZnOw3OnqicQkRGeA+MbeN5RTk+9FsX+o1WgPt267nbPtxtO4l2GK4Kxmi789IqH5Pqphn9SJxk1lj1hif0RCg1bbOjN/C1x0Nw75gig4A/7iAuiOVQIKoJkJ7oZf/E79LK5dnN+SIVO6SdvzVPjyqePQyYZeZn/4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2819.eurprd04.prod.outlook.com (2603:10a6:203:99::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.653.12;
	Wed, 4 Apr 2018 19:26:19 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:25:35 -0500
Message-Id: <1522869935-31522-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: BYAPR07CA0033.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::46) To AM5PR0402MB2819.eurprd04.prod.outlook.com
	(2603:10a6:203:99::10)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0331be1-aaeb-4a7f-d315-08d59a61f226
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0402MB2819; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	3:VXjmeim0tVkVQT3Hnn6uJe7seS809tlOmzcP0ZLUZ47QHW3vjWKsiBFa7csxfdNpTEiqaK29gQrtMqcmRSuU4Ih6EGl7XME84jfapd+A0Vt+YBgPZZvFzuTEOZ7+0owEYBxyDuey/Dt0Y6R6rsEBPli/yN5eHshgPDAaIWb5Fyt1JJwY8UjjP2nBCDqNUj8yTsSev1UAyhW6XueG/21XG+oVBRQMdg62tVETl7F7Xt709uLgO9oDcnAxNtVfGgft;
	25:w3T/YZvWm0SO4qJnMG6mqXnln2PKEfCwIIVhzzsvI5K9rKn3nnt9fruIHUQOhocNnEzNqFSO/0xddWoQh0ofgpgQxMEAgdaeXbU4dG5LewPmSWpXD5dW3zAIY5SmOZTtjgh9UPZtBKw3M992txsIGaR+mD/BkVuCgBgQU782xjqFIoEgrzMZoZ4W6TPQZAlP+B+Y4fW4ypeI8Vrr0BtvRBweWQohcuUmTM6pUH6mbRqA/RRDwUDJ51BnW8E3BxsqAMnrCMLc/q125u2YxmycZxTYETonRGupdA3eSdu1bGAsAZbTs6BmsUhXAOrcfEk7h8G5feX29rfbxZ4ClzSDHw==;
	31:A1vUIiKO9ZJT+fyEu3k1OZd3NFvofF9kIahRu8f2hsm9F3cddUAK61+QCriQgfTdoMhFGkVTO+z87Insgl1Q1J2j1ilGDJm4jin9koxW3j1gAjAYUNtzcBvIzC7QpBJ2xogs7+zSRZPJ6XNRHLcgIfIPLJz8Df+jpxEMzSI/PqOFVTV6w2fO+8SbYFprbxj0E/tZVSiOCJ/R/MxcWlj4or5hIC1niMpTBh+VtGBIyOo=
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2819:
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	20:NoLK6iw+9AIzintj1PMw1dfCkvgNi0BR9Yp3lX0GDP+q/PRMG/Wm4eTqi3Qy0xzhpUyABcatP6Mx49ZUsenche9uFmQ7MONDwJBMXWpa9F41yI0Q4mfr4ajjhH2TEsJP74tC3Jlasp4mmwnf/FLEKctwdK+4+c/h1oTYKZLvX7uoCT8xPV8n79FMdv+fQm9kI00iWAXF960UaLNPtJAztIKbf10v7s28j2OvBgTwQDB6yLPTcbxX3LZe55vlXtwdt9C2x9AdbqEQvnPO8FQomvLbtsLJfu6OJXkytSmKEbZD7f4rCWKXYHntBFhHbpczSSmfVQ/iaWcBybSlcadEd0EPLgAQhb5yAaAEPILtWsJhFx8dmOu9BT1WKWT7bI8Wvj/8wtqGCvypLUftj5xvheH+XaZDkAgwWV997pZDu7AFGXoyVBy7l4BMk8kLdh+TbvO3kwUedlkJgZUtGWTubAEo9aILDtcdtPzzJ5+eClLOy5RmPip/gmBKxDqiVd4Q;
	4:cbpiexsIuzkw0xXSF+nMtDzepBNolrbuZ0ySuUpKiAFK0IPNMfwhcIvJEqEB+XAjHdI8Bze1U/4xABu1NrKQ0MnaHMtXGLFL4j7PP5yTI2Rc9yi21mGFrpMkGZp0AOgI9iZOp9bgS4VvsooPoyA61k1ReFF+DPOQIj0nO92TouohP+kdLYSPT6dMjuW9nLW9dFFm6Inp4p6VtXGlap7RxuUXw5JCFt7MQ5EJkkgBD4d96Pcl4bMleU5go3SYfuuZg8gdfZmYVwnZ8W0+KXGlI5Ly89i4b4Oedj+t457uiyfRTDlXfbTftjcewfQPwdeK
X-Microsoft-Antispam-PRVS: <AM5PR0402MB281991358F235C84EBE1E905E2A40@AM5PR0402MB2819.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231221)(944501327)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:AM5PR0402MB2819; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2819; 
X-Forefront-PRVS: 0632519F33
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(396003)(346002)(39380400002)(39860400002)(189003)(199004)(5660300001)(51416003)(106356001)(68736007)(52116002)(8676002)(6486002)(81156014)(36756003)(81166006)(97736004)(105586002)(6916009)(476003)(8936002)(316002)(50226002)(86362001)(386003)(1857600001)(6506007)(6666003)(956004)(16586007)(2616005)(3846002)(25786009)(6116002)(2351001)(2361001)(478600001)(186003)(48376002)(4326008)(7736002)(50466002)(2906002)(26005)(16526019)(66066001)(53936002)(47776003)(486006)(6512007)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2819;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2819;
	23:WMEhdJ4b84XSOgAVuK0sijzcFWBYXrq0T5uVD0R?=
	=?us-ascii?Q?rvWpSEjjt31TxbrTIohueL8slGHlhbxLMek14+921tdDx9oGGAT7fxnO5EH2?=
	=?us-ascii?Q?GuyOvWvTBTp35/KuvWpmuAWhhmPP/JWJZvpoEyD1YulsFvOBBQai65zH/Gue?=
	=?us-ascii?Q?K9BAVyEV9Ug/bRuePSW4QTWDVC7qgzCOrxLX0JxuUsRVof98euu2d38BA6zk?=
	=?us-ascii?Q?aEBby9p518ldBLcuKawfVZt+qseW5jquKGMw6BHLPKxeSA96kyMWJWbwYf72?=
	=?us-ascii?Q?bv/Qa1xDXiHOTk27ZLUnjIWypFYZOLKCk3IZvXW6LEwHyV+y3R3nsraqm296?=
	=?us-ascii?Q?PUjhFiRWOlgwzxM7rLymu2KDrDgqbXyjg2Qliz1cqOgZ+mZwRZ+lWxCnIiO/?=
	=?us-ascii?Q?IzQ2lC/hnrLTTg0D9YKQnL3Cx1GxuEYign/VJuylBTIk7FPUrGS+H4WDAn9l?=
	=?us-ascii?Q?6aK5Xe7Rum+B5x55gFRX8qYQMr4hhbSqh0yNecePmduRJdQhhuP5GjnxWNiF?=
	=?us-ascii?Q?iFTnp8m470fDmpG/rMamPhTHznsI1eqa0dVCZ1WyQiv6wIOPmXhd+s5k94FF?=
	=?us-ascii?Q?zVMTS77HvG4hmEnGoSZtCiB/By6oqVRd4WGF3XifnA5ajnjmHl+mrhL+UB+R?=
	=?us-ascii?Q?fDVgnkJu1JDKzVcUhM6X6hla69ovNeSg8t1TN/dpq19dGAZrbFuzKJ3NLrM7?=
	=?us-ascii?Q?BQNtQl2HeN6MQMozxVNO1qJS9iGVn0zhu0jvTi8yW4i/eywuz8SWr1Gpva9O?=
	=?us-ascii?Q?42FKijhWSK7atB2PvO7q8yrRCP7+lHwCgFo3xJDgZQm3mSHw88tunWGJzx/O?=
	=?us-ascii?Q?/wnqakiaTeQyTu5xPrIJtMcY2cVvHeafWzukOP1QH2Y0Rf/NZ26n7jnXBqWs?=
	=?us-ascii?Q?/Vk3VM6R3GtsSkxo24Ey9itNi9ohSNm1CKlbjyAHQGaWPd2mWUhYCRBw/ooa?=
	=?us-ascii?Q?mDS+3S48yYFlxHsDDCo+1f29IGEVWJv9qwPu/GO5nhHO78ZlFKBps7AKXodv?=
	=?us-ascii?Q?hK+8UbQdu1lHhTrkSVwRvmKUJwfexBZ+SFq8RJhV5HdTPEG1ET96mmslXa2m?=
	=?us-ascii?Q?Rq2CUGq3i6I36atH9MaVFXa3/7PY/85xL7wvvG8LrCWwNpr+xU50JzFW7BrQ?=
	=?us-ascii?Q?DJGmPXcEBke4FhtGhzDFfVquwIg1FGGny2yK4cs5DOfHsU9wnG6juz1tKDUE?=
	=?us-ascii?Q?P7bn3tURwECAzG9U=3D?=
X-Microsoft-Antispam-Message-Info: jfFe0vIxu+troT8hdbZxDNDT3I5waKTkwfA7i8RUpZoxzzT2lfKhiSpPRAR51vmIxHZ3ZN0QGmT7kPVbw82HtNbw96dBTWdO43uuH4UG6nRitoCvu0BFdedPipDhw9kBCInNRyq068yqfcDnlHTT+PioIvdv1LOKEu/xcTLnrlG4PO+MwHhdNIUvtGl+Nlh6
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	6:xAw+5SSRT/dWw09lCLINvukqjRcnn//DoXhCHWJm73eQdf98bjdOA9NbfVHbjo3j/hwif8k2R/qyEeIDemCVCzis2s5BlpQE1gUyGaxYgm6oHz0XorXV1SIH8FL9y4kWzUo11MtFh7+KZA4DHLUbORdFtM3ehjjv3hkkMeSQ42MCG+BBS9uFXggbF0X8GeFV6Nnh6osmWFM3qAFwkhuSeBkuLWfQdyN/PVwzqmxkBWDEpoOe2T/bBwHh6YUFojoJdCx+ZJaiw19sbAjqJU5mz036cTxjUaGnahFbWUlCM3IQvSJHamwLGcgOeNI13HK8jpRqnp+cBr0BFmF/DDRYASDsaNu7UVPeppDz6sXvDtOGdaFHDmxytNdzrIzMP6LHFP8NWuiK9wHMpV4Nq/O87L5h2uG+GoFn8MyIA2O8mieegjtXKQ6oY6+cn6qOip9w/1lNTvkrdtWn/5XaQRyZNQ==;
	5:9CS1nDHfbA45LewVeHCyGAUg9xNfP34UKpooM5QBYPVxBeZYhvUzgrhNFTKSkdDUL4V/1jUUIu0cWkwqpmB2tVTG+bK54ZsZ/5reQFZ9+dQqDEEnAanmFw7U032A0U6jvNYaU9XyWABA42NQHBkGlxINtPdEZ/Fw0q4dbrrdwk4=;
	24:J7hv7CZOyBQ3vupPTFphlMCjbDcIRcaM3R9J/VlNmCn7j5rsN5AZzg8iZdUTlH52XQshHEvXt4daT1hhpOM7Nj5cuQbXNLknAZch9GhUE5Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	7:w5CC4nvb168TDQBB/WeZj6Fa3NV5+xBt+DigtKrLH8gCRlvrmGKgH26Owja/QFGNwGtFhz9HxO+B0u3xQWcEdWKM/rE1N5twqRyn3Pkf7uIU8xClBFU/GJ9zwqK4SHSAsHV2aky7cIM8sq+NcEScd2afHA6iJJ2PwVFDHnMFdtO75Q+f0adhAbU90MlQczwOhaATCc+1+Pf83Oqrq/fk/Q1qNfu0Dqnn8eF1qv64BFLpucfEWN99ljc9NoJcBYyt
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2018 19:26:19.9960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0331be1-aaeb-4a7f-d315-08d59a61f226
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2819
Subject: [PATCH] python3: Add recommended modules to nativesdk install
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
X-List-Received-Date: Wed, 04 Apr 2018 21:01:28 -0000
Content-Type: text/plain

The python3 installation in the SDK did not include the minimum set
of modules.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index d458d32..f893b84 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -211,6 +211,7 @@ py_package_preprocess () {
 
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
+RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
-- 
2.7.4



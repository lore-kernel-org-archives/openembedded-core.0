Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0040.outbound.protection.outlook.com [104.47.42.40])
	by mail.openembedded.org (Postfix) with ESMTP id 11D1F74E40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 23:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6ZtL3n6tnowfyXrR/vtpIbdVzDRhBeFafTzAR76nZaY=;
	b=oOWhXKVzzCev1Pbn6Q+PNpReoFGoYVEB0dzLnh2I5fsKx8DddFKZ/4rwfiig7EAwLlV6bQVzWCg9I4Z8vVJ/ejsTgABh+mt3ZknlhtLgW2g4bbRpKYaOlbW9NEmHQEajCiTvZygNOjVuYVGGr110XmRYBhkfljgsA4vw6XVMcKU=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:42 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:04 -0700
Message-Id: <20180530231407.19759-5-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180530231407.19759-1-mkelly@xevo.com>
References: <20180530231407.19759-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR15CA0072.namprd15.prod.outlook.com
	(2603:10b6:301:4c::34) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:aKfZ2vVyPuzDkNyEiyU+pRnHeefPPBBt4xJRgdQhHdpPuthdrnZrUYUz+xgRu9QsF/iV25iJstYostMJ5QlIgBwxAC0fl3HNqo4KUNQQxBSa0sb1NaMWCf6nBhvrCvI7Xn3k4DRcObVuuWzrEpH6IUXh3oUM0+L36MZ06YYGRNaQR8iZq2A8epksPKiyY7twS4AyjpFoTz25u07CO21GEM9n3kB5Ah6xFWB7dsMf2JSME5pTDl/VJd0LBckRrafr;
	25:X8bK5R6YdlvazS+vzn/AH2HGEGRJ+YCtJ44hkCjpNRyA1nI/Vua1vKYpCTHmcvxDCBCATLnwBsBjONz6XcqJoyb2SZdVzOU2fghZPRjgVEF0E9pMCn5eEjc8wbyiv0BWKHrIzK21VjLCH350Yt2rM2d91fIQMpGxUTG4X5lYyqr1rs6GBsrQpzd02x2BRy7meNZpEpUgPdmJjvTNcUkY5LMO3SVjQUMOGxRnP2BRRFGh4O8tRsTISuosLj3GNLCcY4p1XNQVxd7YwRJSFDzYnTDt+ehtL/abYUcMozRum496MxX+raHAhsXB3fCT8wGA8pv6SokYTqKawD4wakNHQQ==;
	31:dltNBygvzbnvTbuvzR++xNgijef3bi1dBMXiROR+iBMeZvO1ulcjCobeBLllp2CIQMEqA6VJZn2TtrPeCPkP9lyKmN5BboNqkdZILOEsb5AbzG9cF5tenGMigMkxv3Hs6dMtOq/QBtEf/5Amk6xaDg0YXkrnZlv9uLzXuqJPdCo4IulRkjkYaSg/d7BYCzj6thtDeOQh67PZPzTSuJtzlJKYWQ0FzONiin9ISRSbioA=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:zKZ1tespSuNSqPXotUJLtUht+67sT8VdxBaMdcvbltKdHQ/2nNbwYNTFLA7ZpET1NxTQJLCoIKZJ59uXTbodkZlB5UITNzvXRkTFn+M2S09hYWfxnnAnGogTzc1wal0tG2m5AYuglZlKvLTUGhnxlbWMhMGPkxigI6nyxgD/FL+46IPessswOvdYXMpSk/z7bHS7jGH2jJ05ciqQybDchK8Z4/COe5+RHPOn3EuB8uzEQqXDvXxAKWNeu61J87L1Up4Hujr4U5W1n60WkHsGmSyiBov+xlJL07Ul2olq1wla5ix7pS4JhwQiSqS646juYbQzNLUGh3xk3A+QgM3DUIFSS/J1vimFkFqTa+ZnLdg/q1ceT5jNsJzSqMeiJ3nyF7A5sx7B81rwWUTPIi8zI9GVxkPnZq976bvsqTbWaF1oI6pFiOgjwPBvNSjV4DfK9xH2HxzuMTqk6VlV01+erG+2/Yltnv5X8Ay4U3ECZpXvma7XMiT1fyPMTBqp/s+X;
	4:kfsTIMIgKU1sHcrA+zlQh3yRbrMdMa5AzSWiW3tDVXm5/GJ3kiLJrOBbce6FB7mcVy8zQVepqz4BGUX4OkY3lSm/644wdT3jroGPCkgIqxwlHIcmiSUzcWV3BrKacS0KzFdYx1p0Q0OP5qGcchaZMDzwmaIwm+6TB4yWlg1JULB7FXyLE18w5ZR8RMe0cAsB6iVKL8A39gal+8fUx9zAjMrRS8zhHkusB/RybQMP+Elz0njpWJXaADb9j0Q0y1XTSuO74BBtRjZftXL5pIIeeg==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34193586BC8A4892BDC37FFEAB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(199004)(189003)(11346002)(1076002)(486006)(36756003)(16526019)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(6666003)(107886003)(76176011)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(446003)(106356001)(105586002)(97736004)(2351001)(2361001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:wF3RV2MZREF3lhjt6TUT6tSUJ+/5yUd3KeGW5cI?=
	=?us-ascii?Q?5x2KeAhbOuRk4CElClbzKxUZDahaE6QTwIL7EkrkIKmWKopT5xziaLFG0NxM?=
	=?us-ascii?Q?pBoIYZuHpYLUOsQGa20e5qKE6ouM7K00yxMVz78DOus161KSmoeBnh9o3NnN?=
	=?us-ascii?Q?J3qD7WxZ/QQ7jzubyg7t4cK52saRtjeWMklYJLumCH9lgjx7iSoFtVsm7Jr4?=
	=?us-ascii?Q?iUw/5cnX7t/yfqudoq0EfFWUAjO5vozs5HKbt3J8XcJeaNTH3fJ/jlGqTwa+?=
	=?us-ascii?Q?qM8p+uZ+6sT5Z6M5FWMq4wwPV+5DsHlv1ZjXW540ZqgjINWas8KdHZduD26w?=
	=?us-ascii?Q?nj3hHLmunysbgYi65It6NrK6eP/xUtJNkiGsXtY+HBKcDAG6Bfff8HwxwcaE?=
	=?us-ascii?Q?vMzjIyuMfI+7badvhwVOm+24IItWW0Khr58YDNKAt6OJdPHAtVFuVNaB3jPz?=
	=?us-ascii?Q?gVHTDrVjaFZ/squtaRDeldM774k4zf3SBoOn5Pj+27uTPNP6h1uW+RvUruo3?=
	=?us-ascii?Q?BrHd9V9Lv2YBxRF02BKovwJsujV54zR6dko+LMCHG+/Ia/cSlAx5cjXNIdb6?=
	=?us-ascii?Q?4yz0kuLImpZmYkvzI/OHmxwsxfkF0QSv/x4Q7KIlv4kJQGBTbnIxyzfTtLEW?=
	=?us-ascii?Q?OWWDsFoy5ixWwFh5o2ASzs+sJN3RZb5ClxzysF2H6JrSlN0fFSZr6AcSj7ey?=
	=?us-ascii?Q?GQzLuO5Yeo/QCExiDvlJBliyRW87pC7Iv5qyrPVPzJkYVwCuzh6sCWJAHcZG?=
	=?us-ascii?Q?jkph9nLMc4H810DRIyuEPFF5evdCTm4lKYxmrti8xyZR1VLqcGNIR0SveU8E?=
	=?us-ascii?Q?efj5tWRuiRZLGhLdaDIABXCiwTRq2wepFygR1W5WDGOYYMlQi3m2J4trhr5F?=
	=?us-ascii?Q?FfCJ+xD0EJegFfAwTxLaVtZ69VAMmjDQGFcv/1TtWWUfqbIl5iaMW622bvV+?=
	=?us-ascii?Q?xqH1mhmINq3otmct4ZweIr6oLmqFExRvKJlKimirNJxgag2ZLP4QyhSf9XGf?=
	=?us-ascii?Q?ot65CFE9HKl1R3nC0ZuUAdtBGbgRa6bmvFCpiQBp696FdK8SXSWc8kDWlf4a?=
	=?us-ascii?Q?/uTvCDmXs4iAVR2rKGUU+cXoVOyr+FjkQBYTEHo9HH24PIaULwfKSa060qfD?=
	=?us-ascii?Q?ZDByOuirxwluaE96WFRTdUePXLCIEn5AIYAbCUJnF5xNwD44QORZAPkKOCqN?=
	=?us-ascii?Q?o4rdLS+7Lla+EZIY5cnqaNjZvZCSV53SpsMwUcFQ2sZav3lJ+6Ud2BpcJxec?=
	=?us-ascii?Q?j4hFPMrJ1C9TOOc637ap7W4VrsgZDI+r/txf1O9uJMFBE3/orTJwqPnap3Nr?=
	=?us-ascii?Q?tGw=3D=3D?=
X-Microsoft-Antispam-Message-Info: Ei/djhvBQyPqwSZYUY4yWLDtyK9uI9KV/lElZpDxdrmbB2GdalK5eu4ZhjBrWrBAwzacLp1AwVAjreVC/J+z8Bt3XlFZyIUbkv1RA75FXvg43tiYA6YHnMUiCpR/YF8c6KNAhKidUb5JqYkwt3xLI+hc7KMBwPCFLq9a3v3W/r0wqjG3bdKZ8kJIILFcyGYg
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:gBFTz2p2SW9uKzWgZLlI4aWEB7fsE0mNK8cD8WW5Ff8E3Qc5HiDLV95FVgfUCfPS2hVTF+DbdsTbFlgKHKaq2fL3+EIDzJdpKuZffjF7pOtl/xaKWXgS1nlMW/4ht6D+urHPnerBgvSj9+BlafDayfw6XQTJXMFTw7wUNPZI0s0zcr34r5gnwEQPLrhlWPOcAfNNf0U1CGzXHgn3juAzUS1g352Gzep0t1KoGc6Zsveun0YACKSpRE69h5xvlhN/QXTlrpuH1Wp+l65C+PxbDuaoSniR6RDGd6scaC48ne49llUBbWtqZzJck9SJs6XISshM6IwajY79sFFWLBWGZlJOsNc+VZ5BhnPzEZrB/35ympDPvknTSeOFVGF3rodfBzL88D9QhWsHoyh00JnlJW3fEfZz365faQqNUsLIvXKgz2C/oMwo3LRHmP2T6+vWDavskhFgO1RhLQwhVqPz2Q==;
	5:SIdu8V/qo5NpI0bNvHo70LlNR/6nmAKTJCWrp6Y6fVgyhGRtLCFgbSvcfT/BHpeEKyzt6EzzP8H2Rszw6CsS7nkBm9KmOkBGfkRZmDwq9GWC6ZhvCBJ0+6+inv0nDUc9RkCmlG1IjmAS5I4zNGp8/tYfbhiH5C/dO/C0a+ZRQic=;
	24:I5sy32oNJMV7+1pia0zkQVcDYbo49yBQbDhvye95kZUv8bCsHZTVBcXkW94bvOc8ac1ljiVwAK7cSTBo2JFmBWZJfTVuXHk9IpC4kqn11N0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:7BShWxMTNCcnudWSNl8EXEFyU6dkbA4s7FzZwtT7fJlih2i/xTR4E6REst+6/9HadT+QYqjsngjT8C35QmIesInZ+FFivmRvnnRGHCgBNTTdDjoc0QB+FZpZaRtj2sSsU7ybUhtaocbGSxL5nAb4T/FQpGjblnD/Hk48eNKzWZwptcxgWn/c5QbbVp5R7zxb7ohfRH0jnarksB0p66sFK2O7cvnnjag5khPL9H88y6M4+uylktp4fdZ66+1OTRnq
X-MS-Office365-Filtering-Correlation-Id: 17fe9da7-ca00-4e9c-8b51-08d5c6832042
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:42.6571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fe9da7-ca00-4e9c-8b51-08d5c6832042
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 4/7] toolchain-shar-extract: print post-relocate error
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
X-List-Received-Date: Wed, 30 May 2018 23:29:09 -0000
Content-Type: text/plain

Currently, if a post-relocate script fails, it fails silently. We should
be louder about this, as it likely indicates a broken SDK.

Print a message if a post-relocate script fails.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index cbba07838a..ae7bbef034 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -126,6 +126,11 @@ toolchain_create_post_relocate_script() {
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
     for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
         \$s "\$1"
+        status=\$?
+        if [ \$status != 0 ]; then
+            echo "post-relocate command \"\$s \$1\" failed with status \$status" >&2
+            exit \$status
+        fi
     done
     rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
 fi
-- 
2.11.0



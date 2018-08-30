Return-Path: <prvs=773e51b5e=Alistair.Francis@wdc.com>
X-Greylist: delayed 379 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Aug 2018 23:58:17 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id E0E1575264
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 23:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1535673506; x=1567209506;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=qbTzUpNowBqSfclHYpCwXW6Y1qKnCiPYfOZkODPFwQs=;
	b=VOqF6k7kvNhdSKX/54mk8VEdMFTgYknAiChg6Ya5LBzRSyjmb1IdlVte
	rMtnAqTajyRJfYiDJafLl+PNoKpfnoyYGgq08xuAxXidxF+b/dWGag7Rb
	UOb1wRKpyLJmv8jWSU6bkWxNTjvb8ERwp+6aXeU4eTeXoac1WdRtBAxHN
	ZS7UcQuYK7SzOPpbN4CGrB/HxFyosJ9C+M4f3FiCyv6DEb1G21VWdWPlW
	VXXFsPVIPYsejLtDhaMYHIuGjYwz+Q4SIKab9yE3vAZH+sOhKky+WOpsa
	UNWy40tCgbsnOS4o5Xx0Vsa+pSe175kHY6HWU/SS6wxLQzHSbVfJGcwj4 w==;
X-IronPort-AV: E=Sophos;i="5.53,309,1531756800"; d="scan'208";a="186246297"
Received: from mail-by2nam05lp0240.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.240])
	by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2018 07:52:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=t167EZzLINN4vFnEcizYuFWaLDkYQgfdQdpX3BIX7Dg=;
	b=GJJsn+68OId59SMyT+NE7wnVrCBjyNwHB6kM7rFJcwtueDWh113mfUZp6EXRuVmolM3Hoyy1aal6kkRG7AlupRknfUJBJWPnGEwNLSPeewFRpY3BD0tS7wl0wntH/XBFFx0haYss0TdRuRwS4aquvH8s2JBoibx+NFs+sO0gLdA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.250) by
	CY4PR04MB0392.namprd04.prod.outlook.com (2603:10b6:903:b1::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1101.14; Thu, 30 Aug 2018 23:51:56 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 16:51:31 -0700
Message-Id: <20180830235131.18881-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.250]
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
	(2603:1096:4:40::18) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b1::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 736eb553-f25d-408c-f205-08d60ed392cc
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0392; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	3:QLgaPWCBHO+b7MQGi+GjZJ/ifp7bj+APYOan8S20RWqZr0bZqFRyqcNiIRo9B2DR2fTjPRNYr0j/PYyDCn5PS1CZfWZRthy9zFaa6/RU63tZ5pw2y4aWpRedo0aG7ZjlKUx39e3OlXbG1Xv9caTbWKsiYdbHgp7jcXSF6Uhgg+rvIggYNEvcPpaLbNua+r1LWk4Jq05wuDsiiQyoHV+6fQROXxfIVKne4mdLtslTObYZlPNSCJyoXmyNQKttdsdw;
	25:5wgTJ1enIxsUwDHd//utMRi/E2Xc4n7+U64+CvUv3ZyfatPbMT18JDGIEWQX7cdHZ/SiYIBfDY8PzmaC5m4AbNt0bAe/8YYs5W+jhnfeyBWNo32c/fTd2xbcmuTyvioXMJ/z917WFGMdSpS9MpqvadVfNtK1TIx0LZcZXsYpIZpKqpKdHCmU6juOpccFBm2r6uwwfSkRDklm+QrZOE28MsUO6sX+NlMQGehaDdx+jevf7B/K84hnlpmNTsvFBzVXMpFdRpsz4NWfmJZ+a+hZC4Q94dXO8OyDwyfp/nxoakdGx4VVr3L0KH6FLL4I2/b+u8zv/c/Gib8xtgHWDhEwEQ==;
	31:8CCNZqy2RSp/OYnktEzFuUoSazfiszL+Xtppv1Cn6+gEGJvnMLoEaTd7Y12BFx8o8wzU+l/6PvzPqAf8lITzi1xAh4sVW+GkPDuZAQGRzeieYlBqUem+5NG8fz4TeCXm4hrRUXOryTBKK0j15rW4iGybngr0E1cP+6M2mTY35BbsyrZUZDzvCO61Lke9FXa217ypBTyI3SqSBuvfGBFkfWbD7PJgipgHHP1ifU/eDIg=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0392:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	20:78S4UbLZuUSI+iZrghU1bxeqtA1qrUHdM8Van9LEe7s1gkGCGKYo1pRorJ/lxKdakz9rOxURQFG9EvqvO2DVWcwVAJ0F5y50wKNoXA8V6tXGEujTwUbkMb43QoL9RwoOdFzZhxqdlOMWDeIWeFOMxHSyM5qZmyW6BRYaTxR33sJ3zGK54/MIi6TNed7n2KBkL2DYrVoq+l4XID+xPcs88opzRBAiYxZTRw+mioINJPLZvtcQLPCXiBsph8m42UCVSmAbguaVYTsyHnpkgqZ25UZxCIFjLlRof3h5BzH667l+FGi9WJb/eZrOniW/APKIqLDMAV+fa+NI1QK8vVGyiRDEoVUg8o3lgviejZiloLEUW4DKG1efNkAvv+fTWvjerlIkz8rvLwvNkqkF1jC8ZvR5XxjhPEl9m4NGm4bVGD2bqIFL6icpWrvM8T1Yd86mgTXD2S7tnnMphx8+waIf8d8b0Pu3M3sQJ24wDbYcA/PKudFi5s3NbpnAWnyyQ+k5;
	4:hy00UPlDXrx5uZY3X/WP4TomUbtlpjidwIK/MKV5MnKhXhtAUAx4ScaOmOQ/ufeMXdbQM5fYJQtVGgwkEWBHwaFwPJx8oneg2yqlkU7IPTCq5vI9Q45WeRNq1om064oGCjVrcqRt1ZWaXWDJqJBzVes/H8vZvavhfzUYdIdGMxWNY5bLl7Kq6/vcxIxg8C52e7CVnu6nFBGK8i2CAhMv2C7JDPzCQZfpmz8vRAKqBjdZ4j6pST2VTYQEkKicE9+6sBDxN1srtdFAy48WGGcROPDI+Vz07ftTVVgMp4ro4XUW+0ZQ7iwIGeKlAS6Ja+atu6U36jfeCCUplLXIaa5jSbV2GTiQ+d+M3ooAmWgYtmo=
X-Microsoft-Antispam-PRVS: <CY4PR04MB0392B272597E57E84E11BCDA90080@CY4PR04MB0392.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699016);
	SRVR:CY4PR04MB0392; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0392; 
X-Forefront-PRVS: 07807C55DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(979002)(366004)(376002)(136003)(396003)(39860400002)(346002)(199004)(189003)(316002)(50226002)(6916009)(6666003)(8936002)(2361001)(2906002)(16586007)(86362001)(6486002)(51416003)(52116002)(68736007)(97736004)(39060400002)(5660300001)(66066001)(47776003)(36756003)(478600001)(7736002)(72206003)(305945005)(8676002)(386003)(48376002)(50466002)(1076002)(105586002)(106356001)(4326008)(3846002)(6116002)(2351001)(6306002)(25786009)(2616005)(476003)(956004)(6506007)(486006)(14444005)(6512007)(1857600001)(44832011)(53936002)(81156014)(81166006)(26005)(16526019)(186003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0392;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0392;
	23:tzSWDtl93LY8l87nLviLE/bx13oUYpwMxGIT7CiCa?=
	=?us-ascii?Q?n4UfGFyQ3AYFwwRUlKhZd+QgUXLmgDrj6wVPzQA2prbbrzcf1aWj7w+DFnrd?=
	=?us-ascii?Q?W5GpVNgC/KeNuHajYRNYu5mtmE8chq6VT6fbYik9oLNNws2q9+v/yAX9ZM84?=
	=?us-ascii?Q?n8eplGNGv3+MsV5WHzT+TPc4xeBIuOCmxSIKeeVlqdJef9xCQOuwAsRzP7Z1?=
	=?us-ascii?Q?L5VYLueQxaRWlccR0vl6Qy3Z2nC5VyTnNELbBME8bdZuQxG+9ub4dy1EO5Fy?=
	=?us-ascii?Q?B3Y17bMawVASbJgpErK/Maumtu0/khWJPRH8Yg/Bjyzsxe64BzBOMLg8Cucg?=
	=?us-ascii?Q?6VwOQ7ISnnIiHMXqngAzpWhME+gIvB7zf3IeffSx0JfJ/CwJjbX7juAApLsD?=
	=?us-ascii?Q?mg5pNzblyIDRFN/w7NPdoPBROUmtZdX66V8EnbZWALBPRlmFW7OMw9zyuwQU?=
	=?us-ascii?Q?9dOMOruEsbfJO59selRkHDN1c+gOpdld8DlQBf0HQQji66H1Qcl6h3gxafF6?=
	=?us-ascii?Q?CtG2sWKhPznqGhjEEQodGH+UENRqiqlW58lOiJ/8S5XaziQRpcsjPcLcGxTY?=
	=?us-ascii?Q?onUpoyf/9cUUQt1xjuGxVUAotdcVmpRLPMs6uMSViZ8vh15Pf3TllJNbrczY?=
	=?us-ascii?Q?axz8sNHheYBArf705ga4z8o/reShaasTpSavRRUYnPk6Ot+iiJ23xWmXBtQC?=
	=?us-ascii?Q?EZFvQUyNA0ivSJcgLLRYslCWtIdmSI+bNW0T10p/95OyR0MSanTlwzqe31R3?=
	=?us-ascii?Q?lh9Q7bOgVxa2iLbLgxDqgvBfrFl6sZpc24LneyNdzfbJ7ByTN08p58S2prSf?=
	=?us-ascii?Q?RggeyqoHY14JsKjQcg9DBZe+UodnhMs5IaRxeATfBLQLWC/uaDInisV7Lj4Z?=
	=?us-ascii?Q?11wnBPlmG7uZTGPoA/bgc8+gQY5H3nNDIv6lnBU8JjpFEZROFWL9nlLlgciB?=
	=?us-ascii?Q?1HvJFp2psvenRdiho/uuW1gxU+svXW4ZonN6XQGl9aWOcNplas/VTqDZL7ht?=
	=?us-ascii?Q?ZCGYruOtX8e90tUgXWR+Swk36C1+gZDyA1GWwVaCpdlWaaTFxYDbKNURZoCq?=
	=?us-ascii?Q?7r0DdnFu4OUVcOJHzF4wWp8MZkvvzULwsCWJ5Ru9w7qFb3BKByydFj3ee1aJ?=
	=?us-ascii?Q?Q7fn/fMVu89C7FsUFYrSkHJUZ7/kAMnBVmSwL5kFR/mn2l2hAdBVk73+tmvf?=
	=?us-ascii?Q?N+q0lODhU9s81HsDSNG8r2CPD7SJIgU2DyXMMkWW2rM08rWn/doH5++NRa6d?=
	=?us-ascii?Q?4HMt9VbJqW/SHRSZndVIlzPOV1+WhwjqGf6GN8uNNdaEQf1hbbHrl6mMaNJj?=
	=?us-ascii?Q?9bDNBvR6IB+M0d8WAKWFpN4ecNnxftXwO0VS7iZevlzAqHj83GwQc81O+v2K?=
	=?us-ascii?Q?UwmMqDeFQbp15KvGDFb7Q5NJ43XmkyEdnfuOpYbDUsxVjmm?=
X-Microsoft-Antispam-Message-Info: nXenV+LSG5VBnwfodAbRi0TKLy8K0AvPr8R7YNy/4mqIMGw3oOOWdk6NLmhX+4jXXBWy1dinBniu+6AcjEQeOTFmEreYYyd2uL1CJMwgmJ6zbbBpl4EVNP1GkcomKEBFugr0BAY0XTNOVbA/Lx9w4yaNnlZOWveiev/AmEyhoez53rvsl953LL0uRVEd+EmRzsX+LEphkaEgqqqsL+IOpbUDKnn8OjwoJ3E9iA+rX0qkJ7uC8JfraeS3ouz/HSDU8NxjETfr89AIxqbTLY4i/MeDc85ekGFyYasRPWh5ilrjhOrPJYAWbvYp/xTWoV4bg3tlnBMbRWKX9ZMA7tkTpM1wObtxBx8VzRXWcZm5A9s=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	6:NV/4TrNh/4MHwbg+OjLHqXPArkXWJsISMspHaj4i8pGFRFRJfMAdl1lXMAtBJSwsvKXn1pGhHMZoR9fOo1vplCukam2I3Ci2BI97UF+GB3zbjYQMh3TqwDUaS7XT7bMFZJhZgAEFNp0GqPQ+wkixbXWwAOZJhmXQMJpVHZqpu2hAp90rtpgbUb2IDAih+TuXtZyw445nBLvCWgpPnHHAFoe0WAajSIYXP5dkX7VWWvwiodb+p0lLXVmKraIUCByvD+6NyRtFHvQPj+/uuKTqgDCl+wNzjS0npsSaLYrJRk0FAWTvPSJTk1qH1zIgk/Mql3jsHUDfzECSJAFq0SCeHbVg9d7IRbHkJMbQQz3oozKQUHGfJNncVH+isoZ2tsxOVNjCERJ3kmnXiXzWgWlSPnoOzvZ654VCcaDRpnVVFmDUiqtvJsb5HsEfA2rrFk97myUrXhGaSPd6Tz0X+frIYQ==;
	5:JUoqkc9YgZMR/azviAz2iuhAw/o7rCG7K4lK9divMLrGikldzSyH3k2814L4oxjWcTcktF2dfx+VvT3/8nJvNKFmTkNG3pM3boUhIxgdVvvZY55CIRoIwWROjCGNbGEIJBxhLQS/4nUstnnEoUJL2EH+oAmj3hdK1b2sIrk+CKc=;
	7:n3mrXd1oZBEGCJcIy2EVcH3UD7wrZTxCxcFxkYg/Vp0gsO2f2A+NvFlrQZwQN7hJAIAw8dO3H8X3IuNE5GWkYOR9H09O6IFkRuVSdQHevHKsM9Rb+AZrKrtMbvGEivTS5CiWDq0jOjXZaUSs3OlOhJP9SlfxZXaLpftr4VW798nGRf6/NYGlBXe3OxpRwqU2dltXi6GLmhjWvRXXaBPu2asSXKo7ZKieUTPC1US8qfBjB0XvNkiKtEQ744/T06A4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2018 23:51:56.4546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736eb553-f25d-408c-f205-08d60ed392cc
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0392
Subject: [PATCH] gdb: Add bison-native dependency
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
X-List-Received-Date: Thu, 30 Aug 2018 23:58:18 -0000
Content-Type: text/plain

This fixes RISC-V GDB cross compile configure failure on missing bison.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 039577b8e2..05bda5a7f5 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -1,7 +1,7 @@
 SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 SECTION = "devel"
-DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST}"
+DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
-- 
2.17.1



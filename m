Return-Path: <prvs=683e62043=Alistair.Francis@wdc.com>
X-Greylist: delayed 563 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Jun 2018 22:24:43 UTC
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id CF77D7508A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1527891885; x=1559427885;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version;
	bh=cHdundN9zEjVvPq3Px2jMPFcxkJ2KLgHPPilzkZqp9c=;
	b=ZXE6YUNEgKe+ACpRi/ouHFsAtMx6u6MZIBwmAErU8miPevV+lYJMlmZ1
	Ut9ns+H8HLELgnaTDHARE3CA9y0CL1L/37atwhihmbiEr7NH+2muZveuQ
	WiNuV9pxRGWxmg9tyh4RhKAMyAH4vgCH7o03XI21TvwCMB3R3pBI73yYc
	2R9u+Kg78PbIoBSEeJ7mYxK9mhz40J2qR7wBkV5FMHbJ/1s0NGJEPoFYo
	nZm7JwZEkgX3FKE7TblAIE7/flr/tu+z/GYmZI0+692IWhMV8Ib2ghLRF
	W15+6EWlWBDeLaZUx5IMEyis1ZjVhJi4+5LaYUB864fcygwbasYG9RJwv w==;
X-IronPort-AV: E=Sophos;i="5.49,467,1520870400"; d="scan'208";a="79854346"
Received: from mail-co1nam03lp0019.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([216.32.181.19])
	by ob1.hgst.iphmx.com with ESMTP; 02 Jun 2018 06:15:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pN1+mijNaCy5P1jiol7Wam0ppnF65z0iwEXoZKqpgMM=;
	b=YpbpeGiCKIOUFIGr+VHGHvdWpIcZfqDvIK/h1XFnuFN9iY3fE3Sf7ZgqPJNCh/x8hs8dTixqN1bbeNrHZ1gu/SlWCo6jIbGiuzPuARQxL1xuV4Na15skBIs6RCqtA/0yUMUkzy5lSkafhkmTOLVXfzunpDkZ/JcXMrqfYu5K2VE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	CY4PR04MB0392.namprd04.prod.outlook.com (2603:10b6:903:b1::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 22:15:20 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 15:14:36 -0700
Message-Id: <20180601221436.27162-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180601221436.27162-1-alistair.francis@wdc.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::19) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b1::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0392; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	3:D812qbgDJ5txdI2Xthn/FbJOb47TV5GiKXxyLDtMb2NJqEpQOw2RfDX+a2LYJvzYaaPxmvMLihCjZr1WCGKSLhczThbJTMoFH8YHT/zDhWHZok3d5sfP48MbzygCKZov7B4Z3AaNNSbRVTEgGVpegKa3faoeICmgkA+fX00jZOCBaDKMGn+H9AnvS8Scd6GdB1978oXB0ufcTzBOKFG4SSnWj1zNeWDh8J8Xm9s3OhCS+DJIoc7hC23ouxhOqhMi;
	25:qAH999Bi59qbQOJZ01Edmhh8gt3DYwPAJOnZVhnEW8HWbf5wl1VFmgsFEt3JRXKpUvvYLnvHU4/BbpUjxSgM4NE3fAKdLCVaHrCaKEAr1+bqEIq41csl+eC+yaUwjBWwN/07OnBDjlw379LWln7yxQlhNm76VeaLB5agWSW4NiZnji+XDX3EaPVg0kezgFkUJUkDK3WDSBXAGt8RZQJMryP7BHiwuq7+HOYLSJ6U29LEn8tOSOGbTm2lqm/RtL/keANGpZ/F+qUzYGc2oW5fN9RtyQ1rBEZ+enwEoznG4pjyS12BWRfuTFuPNHQb37ego7HaZk75pMxHu/g30WpQdA==;
	31:hv4+5TIbphXBbY3sbpsnajabIVAnDtwAGoTH/vvqnQX2TPTv0KJu2DzsEG99VAbO+or0e/jQFAkvC/qu2qN0NEBq4MhTwF1QLjX7K+mblhDC/81OiKPYGy6S8cKfXTzFIQKR5U2bySGSHiwlwJcqHyfpB96Ia64vjtGWb+3CC/sPQrThoOOqRdt8C7vkL67B5Ikaf9kHA1FwhMEDXVqgd4g+uIUDgTnZK6Y38T4XhjM=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0392:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	20:U7Wf79dfL3LiXINBR6mGqldjbZzeMnc7kZNefAbzeLcTcxyerjW34ru2Movr3sv54iyB7HmtWDARBDSjN2qBs3a4cdvIxpS1TN0HNv5fXT+2RNX39reWgaNK+GbJ/1+0isK0jeFvC8ZH6QCin1mZuHVLRvjouSv8kI2Z7ym1f7TkRS6jEvRr+yXjIAeFOfBTjzpGOQtoVHmuYUgulhbk/8qoU+10lDvL2RGy9v1+90Jzu0ePCje9Icnxr9CvZfazc6v3S7o+8UdTrkES8MuGI3qCmvuKphek4PFW66W5i6S5gc0NvoRoblXECQlM7D/0QNTKvoFCA9Y17EEpWPz9l813wEfY1SG1DqK8SYBYhMUGBHdc7Uc6s4WHvg9GXfrss3o91W0UrsfTRZk2/NrQQRHDtkK4TjE0hZBuUrTR6d69QtJ6pijHc4YHiAdQI/ee9NYhanUT0zY7CFkjjUMDfvaaiSSDHQZbVXAzSg6YGtACq5MIHUrqLoyH8osV/m4S;
	4:XeFLrCHvBq+O0ZXnhMR+04rdybV+FxTkGSlAZlt5dKTGoKJ/+lmWRqZ8u8xNhUkBxyccF3U3M0fpK58WLdGC55tJmcAGn2sLeh8w7a61PthftlAlqu0sHW6BWztNdlgZyATgH2OtDv7OKnMXfudpmT1ETt+fpEciWymZNiknEiZFCFt4tKLxFPmQR159uRcncVgXCeWnLv2eplQbW1D72bNHR+JsYteWQX4xkOoBBfwZQ9xQx2TLLNG9m/LS6WNxg/EtYaj8I0GY9Kd2cV2HWg==
X-Microsoft-Antispam-PRVS: <CY4PR04MB0392D0AA06344F84A1B8B0DD90620@CY4PR04MB0392.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR04MB0392; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0392; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(376002)(39860400002)(396003)(366004)(346002)(189003)(199004)(81166006)(81156014)(386003)(48376002)(59450400001)(50466002)(50226002)(2361001)(8676002)(2351001)(6506007)(6486002)(305945005)(39060400002)(7736002)(86362001)(6666003)(6512007)(575784001)(8936002)(51416003)(26005)(53936002)(36756003)(478600001)(3846002)(6116002)(52116002)(1076002)(6916009)(76176011)(16526019)(186003)(44832011)(4326008)(106356001)(105586002)(97736004)(5660300001)(2616005)(2906002)(446003)(316002)(68736007)(66066001)(25786009)(956004)(11346002)(486006)(72206003)(476003)(16586007)(47776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0392;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0392;
	23:jaDbvZpXkSXm/exiOzjkfps/PS7TFJf8hOchEltIv?=
	=?us-ascii?Q?jPqDx3FtEqLt010jScIUmnZcEKZ0YH3DNFdbtRYkW9oW+R+sRGJJD+kMGtjY?=
	=?us-ascii?Q?voNLDDvHFit5nTq9jY4WN3kP9fo6LKBxk9LXFwDH0kwmPpY1e8fQgVbk2DzF?=
	=?us-ascii?Q?MygnupD9fKtpiGyVsfql46RN48cJ6PBySFrGtGiXKd+V7ZlCMYaJ+u7l7jzl?=
	=?us-ascii?Q?qHsetxWYG52XBvfb5PKUx9TUykSq3s5J7JyTzG9znYHQsKDrkh6SOy8LjTLa?=
	=?us-ascii?Q?kz5w46TZzCoB/gjGXVKv4r9jx+YIrhuyLQeP9xafODSiRkcvaJk9KHUVft0L?=
	=?us-ascii?Q?Yy0jzZ/Hq+BEazN7Isojig+lAaGWTFNJhJ/mUN9LCy23nJxOKFpq0d96F7Kc?=
	=?us-ascii?Q?qt3ykrwGUYuB7P9IUuTC3F2dZWnSW1yar1HzZ+1orX4kcSOL5/M1zp6DtaER?=
	=?us-ascii?Q?EKbux0vemUEC/CSXZ/hd5OphD/Jm+SWfVaqFF01tHH5YFcpMHZ69Xsa1/UI+?=
	=?us-ascii?Q?DJ7TKbqIT7m8fwBgtX67UBUorHxJeUYmiPasBW7mE0zQPpMni2Q20h9OsBfb?=
	=?us-ascii?Q?Ndkrf0nm2Bm0YSyprOnKEob83xEK64z6QVAKAkvOWXgUf/wPgoejO6Zf98Xn?=
	=?us-ascii?Q?3AlaooZxR6mSoInEPRQHS4jG7sjPWLjFmX9KlwY84XcndVjEMeqy6j2vdHPm?=
	=?us-ascii?Q?afxXDqgKiSSQm1L429a2THsWOu3FzMYQB1vumAtw9d5LufBcWW8UOIbvENMf?=
	=?us-ascii?Q?HS2JdVYIxlAS+KgmRx35I5GY/ppLrqiSh2PwDxFECnUHXLfOmYppY7FROH7q?=
	=?us-ascii?Q?FRr9NfZXH+iguB6wYsT9qROEvbkhVVlKeL2Mc8pyK9TiNVemL7LmQUVRSRQx?=
	=?us-ascii?Q?fcNnebNvXkTn+Peb+vJhYzwVEN2diTdccPfWgEqK1fg8cPrgkheuOT+YErn8?=
	=?us-ascii?Q?48gfS/UFbKwLF0mwZQFXTXHqudkD0r6TbSwJqwMjMBHx5cOtVCh/2vk1yUv/?=
	=?us-ascii?Q?xz3DQk/Eaz/Fjf2w7oKOvg3QtG/kNx+cr6G50MvIq79VAN3yMWhFd6D+uBMo?=
	=?us-ascii?Q?te4oiWuFqLTMNrpNFUQP7EtZA9J0G+PrqPL1ACGCNFPB9q2KjBz0ZErmdMU1?=
	=?us-ascii?Q?ZCOiADHBlJzbVlp20cNhFz3acE3rTRya69LPE/ECEyHzPUnEalvvf45ZgYyT?=
	=?us-ascii?Q?G7HuUMXf9j9xj8QDde8m076JwnizrUWQYGd5Hl6etVfW9PfpMlYM7HSsv4zX?=
	=?us-ascii?Q?lMhlDltyEg3B9/ec0WWAwjGxVGUYXy+2beAaLgJOlkpJwelV9ALC4dDepYlW?=
	=?us-ascii?Q?73RhB/O57RFzTDC9VOZfCa3+Fj6ma/7mYvZZVmHGVsT5zkCiJ+RNcgy//MTL?=
	=?us-ascii?Q?L7UKg=3D=3D?=
X-Microsoft-Antispam-Message-Info: 7IAsJHY28KLrkf7+43qqk760/pIQ8OO0Jqmu5/HtlRJy4Ul6J3VrA/1mbkKjEcuUfJet9aCzfNqIkLgyH4LakBg8NkW8PNsDKim4IwHixXo612j4K2Y7dFRG3VLvIa1yZjGCw/4t3RpDhhdLzNBCIXh6jkgWUvVb+mXR2PKy5sW3d0T7eNBKyY7p2p/qd06E
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	6:nAU5RBMwGWDKsUYp54uhei+BAtFJvrqm8sbqe29hHlppLFLa8TXqPYzXv1Awnf1NpRyoNqlqzh6Buftw7VjFlgxqb4Z4Ny8IagFcZKQhx7fhWj2GFj0fQV8UBu4Udbg8znhd+eaWQZH/DwnHJQzzkln4xLeBPiu44ZNiooLJZlWHIVDqt0KUszPzN5GnjAWdhczG3lvVa5XVFoSegq1Dh5321+6Wax+3FpgDOxTR5fKahF4sbvDHFmrOSeMxfeKN2mh9dSWFezk/Ab3KbhTG74+llfE6gsaMxb7iF8pUpiU3oSz+lW91AUwBz2mZ2gDWZS+I/AbOhu8FiEHTS3qQ3BFyhhajGdkemPv2EzjdY5H3mGRJ2e5ygWGzw/pwlwqSG12p8nfMfqQZi1EeYoD27j9SMzI1mgiayDoGibQYw5KGaZ7ccPsjQ8sP9ZMOjlBEYEMCVc+Ek4MsYaYgk79v1w==;
	5:FCanXHITStv4xpGJSILOx+tq5RZa0HTZIByGr+qoEiP4cQt9XMeyk1T97nFZXo2OfMZ5pGoS+4Mf5jhI1CFkxQoL3FOj2NkkGToUIUXPA6qCDhslEkWmW3GS0zNT8ZjCq/nLkhBcjWBa3zjmwQ1Z+S6WPbEtmqHmLYr5oWh8+NQ=;
	24:eeIjugaSNzJ/mxj2hoBXWSDPrlIv05ol2SwevbLDM+ztauQlNrsDnCUzSLdcm3eYC8g0m4G+8e6TrUlT2GxvuUWsOY2tjkFNa91UomPt7SY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	7:/TqrcrM9UuIZ004NpFKB+w92tyd5kkbaG2YHp0briKDtWBw3Doubt+x8mrI4+miQtjtX1N7myPoDJlTiZezydREDXH4jd3A9ITRWygxQ6esvcglnR4p1P0IseZ6ZeQY6i00ZK5yryZZn2Rmz6JzkZ9EDWcE/EvyTvOSC7TxR8alL7HWU70BgFqMIfM6eDVg3yRtFHqo4dkHGr1bQkEI+Pjh91ye6XZcVhyQk4r4SplpjytgtSSNdLnOYXIE2CUCl;
	20:DtfEiss0nseflSXefRo4igB0sOQjaCpXxxzMdMQs5rio06PQqlr2EG+22HGS8yqkUbZbef69H6BbBbhp2+yQl4efUBPex1a/JFBRfcXh0+RtE+j7CzCNlx1Qq7XXm3yzHFJ2b0BlE9zLr/KbL4KY7jMSEgNIhY+ZK0s9nHA38us=
X-MS-Office365-Filtering-Correlation-Id: ba48708c-4045-4878-2ade-08d5c80d2a0b
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 22:15:20.6596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba48708c-4045-4878-2ade-08d5c80d2a0b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0392
Subject: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Fri, 01 Jun 2018 22:24:44 -0000
Content-Type: text/plain

atk requires xgettext to compile, specify it as a dependency.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-support/atk/atk_2.28.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
index 657c69d576..1198005804 100644
--- a/meta/recipes-support/atk/atk_2.28.1.bb
+++ b/meta/recipes-support/atk/atk_2.28.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
                     file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 gettext-native"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
-- 
2.17.0



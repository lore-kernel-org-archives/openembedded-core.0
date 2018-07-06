Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0135.outbound.protection.outlook.com [104.47.2.135])
	by mail.openembedded.org (Postfix) with ESMTP id 9F71B78A00
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mDn87gWRM85ARV88+ERa8HhoMeyIYp/P5BuuHpJ6nQk=;
	b=fVIzWQDuuFCtJoITHcuuf5ZgES1rzTebK6Vaj0c9SrfSJ3fEgLgFBCRKpaEw4RZUl2iHuO3px5ioLcS9MhS7ColB+sS2ikgXc5BNTi0QhDSExVSRjDv8Ct8gZB/YlsciB/vaBCKpTDr+HxY0ItmTUlu2+zvDLtLn7yjT10plGLs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e5::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.930.18;
	Fri, 6 Jul 2018 07:48:45 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 09:48:36 +0200
Message-Id: <20180706074836.29687-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180705205544.24546-1-rasmus.villemoes@prevas.dk>
References: <20180705205544.24546-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: VI1PR07CA0226.eurprd07.prod.outlook.com
	(2603:10a6:802:58::29) To VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e5::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8b337ab-e986-487d-350e-08d5e314e71b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	3:IaepxwBnrBJnjMPQmGCkfi615cm1GyRs4FRpFmdzu9BiLKWtOlaZfDQeYI1aAyqTWBNkzl2K2YbeosHtVD8J/xIsyo/NbgwLpUbjxmZXsjNvIIUYBtl4ihDX/mfBmpMQ6e/qRSJOomgnvIPx9JB7TdRaisq2SzCFpU0snUcZkT28BtrHMGudkGPgOK82Sj853OQifwZrsKjcb2E7di+lPxKVutF7ApGaxcPnyhjniAnQgZSgcDS9kD4TsQdfeaMZ;
	25:npTI6k2NV5DemWxvff9DkhYImoEmH6L/1+n56R5fCyXdPjcAFAsswOCnSGYAl6U+Wt/p+iq3ibqPjZaVdY8J9+rj9qRxrBWDJo8N0/whVIpPXDVLrWxbhn0grHuuea5y8H3+xwG7Nla9UbrDQzmSECAsmEXJYljicfonOneLAwi3XAu5fwl3LgL3LrNvgClIhZB70uVBf69H7C7lFXlH7KMN6CXKSr4e6pNZ1FQyMulG0futbclTLSNmLT9gybJmIAkTR/DnTFby/BstcbqTJ/omsdMQBONIlUEutHXSRcOF5hTMBU8Cfh8bMrNRWJqynwv7lph0SN+oRHyB/MDSLQ==;
	31:n0QGuIW53TzV+jli3Tii+MHZANUfKmgGSIyh+oZei2TahNzkPshiXuwC1dwa2T6LTZJWPUqw28dIzeC7dopwNy0TwBGAOnnABEUR3n01J9Gh3Q9C+9pqeytWFkGkqVvM6Xo3vYDohDLhg1KYxSDPiEyVgJICBpY1wSf6VHIYzWKl2xdkxdX8sKM1R2kkiypiWIkFLFgCX2GaJOjTEQ9bjBqEI4fNhLhspisPRg8i9J8=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1342:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1342CB7AFFD8BC41D47BE9CC8A470@VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231291)(944501410)(52105095)(3002001)(10201501046)(93006095)(149027)(150027)(6041310)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1342; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	4:VYgofrV2IkOAAVMWrXKLOV4c380/8Y5BLgcm0qhqB2RqUpVRkHy7jp4dyN4kYy9g3+zz2rmwy7pj9Ck7NcAhtX24E3dNmCUJxiFPbjVV0mckj1UnpbVXp4OsBDDU9BILH805U3VV2RUKTW9ookgAeMzQZ+GXOCyqCA5X8w0sXgRIyDddq4cACOcwlgqTCo9/I5+b6bnakHLPZWxay0vEz4MNnedTuWNpAIYHhsrbb67zGdsYV1LNMrkUOfs7qvML9Ekpb3+7AoYVPI9XnuJD5A==
X-Forefront-PRVS: 0725D9E8D0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(346002)(39840400004)(396003)(376002)(189003)(199004)(47776003)(54906003)(478600001)(66066001)(76176011)(386003)(6506007)(6916009)(14444005)(316002)(69596002)(6666003)(97736004)(5660300001)(486006)(42882007)(956004)(53936002)(26005)(72206003)(16526019)(186003)(16586007)(44832011)(51416003)(446003)(11346002)(476003)(2616005)(107886003)(8676002)(81166006)(2906002)(1076002)(6116002)(53416004)(68736007)(25786009)(81156014)(8936002)(4326008)(105586002)(52116002)(7736002)(3846002)(305945005)(39060400002)(106356001)(2361001)(48376002)(6512007)(50466002)(50226002)(36756003)(74482002)(6486002)(2351001)(8976002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1342;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR1001MB1342;
	23:bakmrizvEFzVd7+St3hQCMMBTIGaYDPU3NT6nss?=
	=?us-ascii?Q?eSOuu2II1MeZipiITRZYeU753LwMxu4L9XpEoSAsuP0ka+i0/uFU3ai+zU0N?=
	=?us-ascii?Q?S2T7BC0vu1B8pQ+86RlWbTl7WFo2yu3rN6sEfOSz8GNGKKnfqoz2BxXD0vQx?=
	=?us-ascii?Q?dDO+4JaYVRuNqd3ZPlp9WgWUkkUfL088UiHxDdt5vGCs2+4m6WwUBxSpRF/Z?=
	=?us-ascii?Q?RmJpBUNTQwqCc3o9hJGBz6OxPZZ9BRsw08g/d9HklnowCMhsJT97en/0PLwt?=
	=?us-ascii?Q?LDZWPAfaZtjZrkx7h7tdOvdtGVs7jFG9hleTJuJEbnslvmDUtd7EtHkUblPW?=
	=?us-ascii?Q?iw20sw0Y3KLSLFz9kkS4OsdmBhN3ifcTTxtaJEsv8UlqdjskuQGPHMH+x9F9?=
	=?us-ascii?Q?uTFHa33dRFhkb594c/GoGJ4jGOMg3rGWUuyvfzC9G+2WqKvWUpwwhedX7JRi?=
	=?us-ascii?Q?nQ4fLUYRIfJSyGrlPiiQ3BLPPXBNIz3v9RqOiSrW6vMsN/1g2KX5+jXYd+op?=
	=?us-ascii?Q?HjQU4qMQvLJps/LqdlzOQ+xo8cpMAFswrmUQJCTFaJ+z9PmLD55ianV/1q/O?=
	=?us-ascii?Q?vRp1eQ7RSHTBpeAwiACFh9tZSekCEWzYyBI0IdDOpDVApicka2O6L7tVC1rY?=
	=?us-ascii?Q?O8oLcQeD/BUfMfJspCdpGBnaUEge8d+lbeQGfvCko3eYkh3lxY5lyaMY3+7q?=
	=?us-ascii?Q?X1qsZ0g2xV6aFbnf62VsO2dwJYI/22RbpScrnaanaHOomiC8I9yQ2nMjeGbT?=
	=?us-ascii?Q?jnZZIVmLivASl+XntsulmpDe/D+fTAmFcX8Z7Lu/kYS2PRxamIrInbiS1vHs?=
	=?us-ascii?Q?N9bOD5Ve9WBzMG92gnfK3RTbn/WTaMaYDGtd6f3IJFEBYsrsPAg4VKxMwUiY?=
	=?us-ascii?Q?EWKLrgv3iShsnGj0GWoyhR+7rpale+DQaTExDClRrr5t5Sn5kberi/LQiBi7?=
	=?us-ascii?Q?IQnC5qSS87KW7d8mgCe7dR1hPAJ/FzPxdtJSzpDCGQJPUq/DQCiTw5kdFg7D?=
	=?us-ascii?Q?jW1OSOb9cA0CoxqiELCLcxOXrfff2u/hsesCev7dzwJhNcGWDl/8hMQvqzJW?=
	=?us-ascii?Q?uDo2ClogXRrECNC7jdVOO86nzKXFuKKj+aVIIWDP2R4GTy8/RjhZvj92kMJv?=
	=?us-ascii?Q?byD26jGTrcw0KkFbI07N8yElD0AjMCt+OVHoF4HH8FEUw2NZIVzezkGkyjw8?=
	=?us-ascii?Q?0X9yJ03r9En1FZ3iU0p6+aSukABtsGC8F5vrV0PtFp54nuP9qunKVdcCoEDr?=
	=?us-ascii?Q?j57KdZ7+l+yJtcdDtzRvBDD+xzOqW1FXGO1f/E2ct7Rx9KGeSbUTiqQeTbDR?=
	=?us-ascii?Q?3BHtw701zVc6ZZqXJJEN77pwyW3gQXcftiP34eAeBwhFTaByvCbNSAyp7HMH?=
	=?us-ascii?Q?uWt2XakyXpNmKyKPmcbfCSQoXNL7cgHmtO3ASu4B9V2KKv5iJD3O+DokhqHD?=
	=?us-ascii?Q?hHhX357/DyeM8noP6o4LBafS2qlkX6dw=3D?=
X-Microsoft-Antispam-Message-Info: aAX1gasgXDF3cGL7cMwhMkvoklh8L7/l8cjaAndCeK30sv0Bo7sZlD1Ft9T9V/TOpX/mjCUyE6zAI5zuoZjKLLse5WrOthxgl1TZ7pUEpv8WWVV0tketuLpHCPcQsWEDuoku1gYPCcYPKULlGCUqevuMQND+9eKVa9MhT4/IW30KB+mteQsYyH0lereyKCyowKd22sQuXrD2w7ssaqRaGh5nUfM0+5O2W+H/pSvD6/QnPV+Kbg258OP1nk6Sx5kpq6iuBQ6zKMyNmuNAuu5G0nfvOtrHFTI6sDmUklm6UpvFWzR/DdA8sDZfM53y9ZllT4RFFyLuc8NhFd4iP7QVheEVp+E3Gwl4/tX8rc9QoHU=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	6:PK7E/k/WS93kSsYeOq/BILFIBiON+AVyrywtWMn92SVobUrebh3H8RIFdbl8NPAjFm6vmgdlLVhVSdUNDc7OCrE2NbD7+cbKlmsZTj3fIYOni4jJnt9Jkf9mb3UXsHYNQ/9DNfs1uzAD4Dghf69Uu9ODTtyyYxdJdBLUU4ab5xlml6QQXBbJLQF0OBf3NYQQaEidIrrjv5zeySzvnGp8CxE+C/PwydNGLlqTOEho7qCPWqiQoP//upz1JpHbmX14amQ3DPo0Y9XaiotCTPK5DaQlOhJuHjgv46wWSYdYzSMnOA4bqyjmLtPC88IJ0beQRhZu6FtYnbMY1/t1IjKKkAQAM6h7/PptvbyZXg0JeWtBT0EmWppDnrYdmHrOhnyEGxtBCRMT2RselZMbO8d7DdD6Jmj5xDotIL0DM09jlJBPqmmwDPWO1peC74A+VyeQH3JrIfBtCakP9VIThXBR5Q==;
	5:z5/eUz+PSawzqB3I8t1UhKsYtTB65kVMVNDhhMlfOEsvKuGIpUAnfE60X0+frzAMWnSg7Mt4LKVti+lMGu3YtHsl5QaspNuwEiVlLyKJv/+cMHl4lWi1u8ShZt2Vp3mMwuZx4CqLo9jSRcWLeff2rj6PybGAL6iO/2tPJM/jISA=;
	24:Xow08hKBfhvf3EKBI0Odl9oY6IlM4mrvgaOWXEl50mWPstrrnjz67lmKG9dL7lsmLyOQS71DS78hhU9ZJLPRzNcrJ8NJqZY5R1MYQKZT+cE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	7:G5BNqXQIZmp2PZtyUUW3M42Zagu6bKjJvNwbGsr5UWijkHSmnBSuMM5spFg7nw3cZfv+o+vnAXoip8O5y+S7m81RqFjLYinqvDJu2IrwHfXs5kwZsdaIaXYgR3pTljAkBkMwqHXkM+lNbC+7aMJfdAzZxsgVuMApKGiXa4Ag3kFiJnqB09jyCUfakQ14FZS4ErqoxjRPn2uNUreJr3bpqhWynMiUNuaQYhuaZgj7hcrYrl/TQbt42JKIH1vsIdJJ
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2018 07:48:45.5839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b337ab-e986-487d-350e-08d5e314e71b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1342
Subject: [PATCH v2] perf: disable parallelism for 'make clean'
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
X-List-Received-Date: Fri, 06 Jul 2018 11:23:03 -0000
Content-Type: text/plain

Whenever perf got rebuilt, I was consistently getting errors such as

| find: '[...]/perf/1.0-r9/perf-1.0/plugin_mac80211.so': No such file or directory
| find: '[...]/perf/1.0-r9/perf-1.0/plugin_mac80211.so': No such file or directory
| find: find: '[...]/perf/1.0-r9/perf-1.0/libtraceevent.a''[...]/perf/1.0-r9/perf-1.0/libtraceevent.a': No such file or directory: No such file or directory
|
[...]
| find: cannot delete '/mnt/xfs/devel/pil/yocto/tmp-glibc/work/wandboard-oe-linux-gnueabi/perf/1.0-r9/perf-1.0/util/.pstack.o.cmd': No such file or directory

breaking the whole build. The root cause seems to be that the implicit
'make clean' done during do_configure ends up running in parallel, and
thus multiple find commands attempt to stat and/or delete the same
file.

A patch disabling parallelism for the clean target has been ack'ed
upstream (lkml.kernel.org/r/20180705134955.GB3686@krava), but it should
be harmless to pass JOBS=1 even with a fixed kernel. This can be removed
if and when all relevant -stable kernels have that patch.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
v2: Pass JOBS=1 rather than sed-patching tools/perf/Makefile.

 meta/recipes-kernel/perf/perf.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 51f5597eb9..90bbed25c7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -97,6 +97,13 @@ EXTRA_OEMAKE += "\
     'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
+# During do_configure, we might run a 'make clean'. That often breaks
+# when done in parallel, so disable parallelism for do_configure. Note
+# that it has to be done this way rather than by passing -j1, since
+# perf's build system by default ignores any -j argument, but does
+# honour a JOBS variable.
+EXTRA_OEMAKE_append_task-configure = " JOBS=1"
+
 PERF_SRC ?= "Makefile \
              include \
              tools/arch \
-- 
2.16.4



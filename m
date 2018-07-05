Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0095.outbound.protection.outlook.com [104.47.2.95])
	by mail.openembedded.org (Postfix) with ESMTP id 2004E76094
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 21:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UdIb7y8joWvsD/C9Ek6AkYZprMXp8ZRA+fKb01ClJTU=;
	b=H+uPM6cL5JaRrmU4BAPGghDqEn53tPEN34EuIbXOAV9DtzIiUwUfv7LF8ykuY2r5e5Jto5ntUbyc6E6N/nWB+5dLqI3voDcnrNTBIUIjsPLy2dxQJBvcJXGlINOHOPgVQRuZTd6dM80Nn3NfgtDLHNnb8Aw4V3JclgpJ4c8wl0M=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.waoo.dk (5.186.127.251) by
	VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e5::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.930.18;
	Thu, 5 Jul 2018 20:55:53 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 22:55:44 +0200
Message-Id: <20180705205544.24546-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-Originating-IP: [5.186.127.251]
X-ClientProxiedBy: DB6P195CA0022.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::32)
	To VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e5::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625c7a2c-78d7-4cab-0ac0-08d5e2b9b2b7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	3:qzsppTOAjdWi3q6qFCejatuoQa+lNc+MV0PLUEo93q582sMGISQGCLZjojOwJUl1w0Dlahk6HfCy5gXOqNytMSUDIoY4VV2Lq3DnfHF9r8tLgdVejBs+P6dwg1LaUgb04zxn9IHa+BOkxjcSbLRTlRoYTeaKLstOGAdDiI4FEzI9549xmOZg61EV8x0f/mURLrD0ke1gWgosjy5qFq7X1w8m3fyI7OOlyRarL1L7DOs+dG/MRE5t3nicnM904Nwf;
	25:dFBUG9DDLy78WxMtZ/IJ3rReb3cLImjxpRYmzwD5KzSmzDnuVki1XbuiiFNfOr/P8dRQnfqM3Ep1MI9OK60aI6mXqO5tNccMrr1KMB88jGlEi6Dcwtsidf2wygMc0a2DYwL0iDdR56OjbSeZH4Fy101tQUw7juHSh0VeaCFrB6N7TkBu0jrjyFkgtLIuxEvgO7r10DpqVuQEJAPgMClwQ1HRWUUChmAb8EPIteo19xTOLD2uOxeSOIp7hvDkgEY4scQXi4T9bH1EzrManyud3eOQC0VIZ2DX+9GR0Sdfgk4bgZ4zCY3aWWHAawXCLaeY4bxECqi28B7u5WnkEcJP7Q==;
	31:LDjRpuCJepcQF8OBGNE9LIEOSjiBLWaQ7l30QLVPr1A0wg7GJZ78Nc74k546A/vYmb/cs+3k/xT3agIZ8p6ZfmMLs7VN0ZPX4z2qk263ZlkcOwOPYoabQqpMXt0omH5GUDYyISej38jiG9dJBKa4xJChP0WOgDaFXavrEPy6DDmUUOE6VBXZWpyGhCQYfeoD2q7oYEStmmwvMIQB49PygzJdOEtpf8M6C+sIGKVOnRg=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1342:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB134248A9533DB6978962DA4B8A400@VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(10201501046)(93006095)(3002001)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1342; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	4:rDPJa+zxvWhdGW/Et2UKNPSeL9DibVaQ5V2mr/brQvAIzuazPOiLkHFApoFr/MbhwFsuogh8g/Q4uatX7BCUoN+fVRAVzu+tFdArrAehLezvqAZrUZ9wiBnI/qsM10mDNRVtEbDGMyPoefGSN4juHkIH5NeRGqMU/zIn4wSAMXbTc7MNRJqB+DBiMC3xQosk1/KPb4qEquJUZK/2moHA7z5hp3PmdmnsdAgU+lcDvnsLDLbyx+U6SzGOFRL8EBdGLCAlMydRiDvJOujkuhminQ==
X-Forefront-PRVS: 0724FCD4CD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(376002)(39850400004)(136003)(366004)(189003)(199004)(106356001)(2361001)(4326008)(105586002)(107886003)(305945005)(7736002)(3846002)(8936002)(6116002)(2906002)(1076002)(81166006)(8676002)(81156014)(68736007)(25786009)(53416004)(8976002)(50226002)(36756003)(74482002)(50466002)(2351001)(6486002)(48376002)(71446004)(6512007)(6916009)(97736004)(5660300001)(6666003)(69596002)(66066001)(47776003)(6506007)(386003)(14444005)(316002)(16586007)(44832011)(51416003)(956004)(478600001)(476003)(2616005)(52116002)(486006)(1857600001)(186003)(26005)(72206003)(16526019)(42882007)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1342;
	H:prevas-ravi.waoo.dk; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR1001MB1342;
	23:bATOZY28D1Xh7YnWOC5ppmUavTEZDZd721NthTa?=
	=?us-ascii?Q?D8FQI6nA6NO5NpcO7ggy5vJYG2MP8zZlMvmIPhbnUenSr5fYWiLVSahhGerH?=
	=?us-ascii?Q?ht3OL9Xmpnq267Gux1Is3NpUW56fmLp0PvlzBDY/TFlVurwGmxGsYFn+8rnv?=
	=?us-ascii?Q?S2Vqp3f7fQd3/CLCicJEDQYkyiw1d00f4gHATL8Gv6KrcatpcbuVxyKjedW2?=
	=?us-ascii?Q?OrU6+kMt37bsUXJcEroWNnoVKkCFYwCsWpYCOAR4jrMNPGd1QfRK/qOukSyz?=
	=?us-ascii?Q?GCVJLgf4+tQIlXGNaaks3nAGD/AANmrpqgYNEP5Zn+aBj3EzucZw85MTGZJb?=
	=?us-ascii?Q?YWbgpLweWl3weqP0r5491SW0LzMlEYQpk6O2OtbrOLkm+dBCXWb1pMMKSDA0?=
	=?us-ascii?Q?/apVpFkDX1wJq4oK6scKAGc/mwxCDUTg7X0U27Yha4nsweXUKdPpQzgMHrK4?=
	=?us-ascii?Q?VkN8rj8LUKKDsShSW/Tx6yVu6+vt4LmI4aGli709rv/atxwAVCui10Oub/3z?=
	=?us-ascii?Q?7M9HbcxXxHuqhmkpo4CTW+zgxHT5q7J/RXAbdsYswo5PQk7dHXCCoiQeAqCV?=
	=?us-ascii?Q?mK2a/46lTwb2PMmQ4K6bkt+2INUU+Hf9NSGTIbLqmRVYHMcw+V/+2DYpPRTK?=
	=?us-ascii?Q?xGxFzDMxaxvKjE75i3p+KCT4Jo3Tdr0TWJlZU11wngFalApMQrb5ReodODnj?=
	=?us-ascii?Q?8BaESxKxhx1ar1b2dhO78IPPyOnwywjQYNAhNs8N/CRXKFRCnOpB1XzO+l4q?=
	=?us-ascii?Q?YvhWQAQR8xhIUUxTCSvKM/hd5LrL3EBXRNe1f+HA4YF9v+vBgm35Bj3eYKRl?=
	=?us-ascii?Q?WywmKkniHJS+kai69I5bXU4ik/A+ZzQrkehzAPDbo+59lBrwoN1+X3+jDWuW?=
	=?us-ascii?Q?HFwuMjfTQm+UJvkvAs4EhrOt3ST6mWBxldUES13jbb4+koquRwOw59rS+SHa?=
	=?us-ascii?Q?i2Bhp+rY60ENYHvyONqMvaIdp+Xe0SwiBCGUBtPPm2IWZYzStvTNjKeGPzTp?=
	=?us-ascii?Q?0CL8aPVm2DIOWWchWkGIyPBIrSubahOzTEFXWDZv6yceNNF47KDgYcbhrPdt?=
	=?us-ascii?Q?10ry2ZJUdB7/Tgpdmo7T052+piVNiZg6Cu0PKNOgot+Q7LOnOj1hVRlmh4od?=
	=?us-ascii?Q?a080pdNa/Mh02q5SQynmSZHJLaxnT1EHqV1F4AK8+7pmajCchRKzpnvmPGKO?=
	=?us-ascii?Q?vNcec+ogAAY+RTJmfQunH6FrurtkepXek7Q1a3CFAClnrGUR9dIJ0e9TUSiD?=
	=?us-ascii?Q?4L5S+xCtvI2QNZoEZjPN9q+JNaQldnrcBlHGuSrmsHR/O8UmmifdFxj00vGb?=
	=?us-ascii?Q?JNbgtETU6CbWuxSRrIaMh8GkwenoDPE4/uTp5KuehM963Kd8+VgCXWklYY3a?=
	=?us-ascii?Q?t4dS9rt2NK9R0y8f9LqgyN9S/apA=3D?=
X-Microsoft-Antispam-Message-Info: d5RD+KgEfjljE/8xASIx+ATLZpQgYYFxgTozjR3W9G0xNt9h5pR81qY4c7IOGy5YlSzzF9MW/42YustBrkG4oycsWioko44VDTGxV8pMOORMhhVZ/ucfpmnN5o2AzMDQBCr47K7H69vlYU+h7FygFx6rSlHFBO/5PD4Ju2hL1QidjbgXV3/OZyFwColStC2qubvRNG2UWksccvYtTzxr4Q1gMu7h/uZtJbEbVtTJNQ8NY29hgIm7Tgm7apk80/80gsEKpetzInJ7oDNhXw89WmouXu7Te1PaudwJ9YJ+a3hi6m44ZEFqrdVkzDuGEkumAs7dFfWdZqq2bECC7husUGerIJVxDPuSvUDI7SFe/E8=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	6:M4/QdTwOM92QOMYVdIKNwwYCc+vrtOiL2xLXXK85DW3aUViVtbh9VaM4iVbb2JjMXUu/IfQqAU2yl+Rf1BQ0gE1BqTFJMGWdeKrXzvk+at3tVSc1B8bmyvFfNa7PGuiDGGgc0bCoczUs/VwpJBMowjzPEnximsBRFcBIjJd1Mgdwdp2lrdHTLdj/yTT8j3Z7DHtFvUyUYFCMQvO9BR96o5EvapkBUWF1RE0VKCay3EN7wzO8a8JjRJGaUdgk1oKI9c+rKK8iDQWkrUibW8tKt/N6hHK/+tuQATpPc1eN345Jxs2ZxUFsIiaUlxqezNxa+AXK1qC/Fl8Q8wCUOfq8aVeCLnrzWW/ceb6ta7DUOVsuGdzyF2ejSNMTKAC6krokjs14TO/5FMwWCLL3YDvuwIulWmfEpaNYj2OJ5fbjTfdrGONVyrMl7+4dh5CXRpiVNHhoiFTWxsAWkXVOEy1GQA==;
	5:NvXyq7su50ukicqoB3D57zPb/FWhQE95TPkCtWFASpcCKfaPcW7D4o31EbO3A32bf/g8dJX2c/IVJaS0GrgUrDMK7sGLi2TDjQGswQhD+gMNK5PU7NdCJWLEw1i0csBIzQ/4ohC04h6gLXFjQMAQtlRFYtNRclQF4xVLcfOcfZM=;
	24:i2kiim08+ExIuoPW7TPfyT5BkPxzD2ANc7YINYt2jDAEz8U12VpoueegRQrj3tFLQfNI4r5Wx0X6GmURmaGX090VBe/sChhVlVYBaID80uU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	7:RsjYGCQiMxbhNLLxI3D7Ar8QKfm48/QB031R+gjDfU/nsbwdOzgRHrR0lj2XyyVbcpNW1vJl9SLCdhaX0+E3mY3PB8iBT8q/r53kQWhRfJhEI7po7i1txGcWGiVGE3nrcIpjIctnihLdlvE9xU+kCeyq5gs0vIsCnkVLVMEELIL3bv4mMFqdWs13aQPBWF7a8nkLw/9hcXJFTmQ3XMAsql55F5rglxYIXY4Zxb7h1F0+nFa8fyW2BVD7T/vIBxU5
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2018 20:55:53.4210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625c7a2c-78d7-4cab-0ac0-08d5e2b9b2b7
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1342
Subject: [PATCH] perf: disable parallelism for 'make clean'
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
X-List-Received-Date: Thu, 05 Jul 2018 21:29:24 -0000
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

This patch of tools/perf/Makefile has been ack'ed
upstream (lkml.kernel.org/r/20180705134955.GB3686@krava). Since the sed
script matches exactly the lines

clean:
	$(make)

it should be harmless to have this even with a fixed kernel, and it can
be removed if and when all relevant -stable kernels have it.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-kernel/perf/perf.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 51f5597eb9..1cf2666ee5 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -145,6 +145,11 @@ python copy_perf_source_from_kernel() {
             bb.utils.copyfile(src, dest)
 }
 
+do_configure[prefuncs] += "disable_clean_parallelism"
+disable_clean_parallelism () {
+	sed -i '/^clean:$/{n;s/^\t\$(make)$/\t\$(make) -j1/}' ${S}/tools/perf/Makefile
+}
+
 do_configure_prepend () {
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
-- 
2.16.4



Return-Path: <prvs=722272e76=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 581CF7541E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 00:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531181087; x=1562717087;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=MwsVwQi4bkDGKQcSsxtYQGtYnm+9j5prgQ+sB7GDyag=;
	b=CILbGc+RdRHpmUDuzx/JqjbhO5OGFBza9p8M9NwjmxzNFLi3EmbU8qO6
	DDOUA4Tkg4GJ6ed0d5O6kXbTXujYBGAA061IMHOcB9kkj9lMWWBFxSpsx
	eD2D8raEKI/i49NF63sDKt6xL3gTnqe2SaZeA+90mxv9N5rczbb+RYm/j
	ZhNz13skAEw1m8/lkECBdfW1rtJ4jt3FK7bb3xVJbGRyETwyCULq4UQQ6
	EDFhnMB4yPmv7L0ZZmLpb7KpfQlLbW0P/WP6p96B3pMBw8onDKXmjd/cu
	1Mbbo/vFCOCih9MzIuNJlS+XSMzyCl46o53D/O/o6zSauRKof5ZkeP+3X g==;
X-IronPort-AV: E=Sophos;i="5.51,332,1526313600"; d="scan'208";a="84858236"
Received: from mail-dm3nam03lp0020.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.20])
	by ob1.hgst.iphmx.com with ESMTP; 10 Jul 2018 08:04:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wbo1hiTkQS3IYoItqy7aTzkAAAsBchgZj4orXhRs0gc=;
	b=KCO4uXYiNFyfsQybPsDc+sJvxClBT3+8Ekon5zMVEiFY9CbV/TLcCU5OhLySZhvAjqkeaqunEkDWh3f6ibgUe5iwGrK3vuzSwSfo7o0NVIQ3+/v4KyHN8wLic1P6eHEdUdm8dl1V3kYHlEdlas4GRk2mxtVJlN2MAREoaTpf8dQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0395.namprd04.prod.outlook.com (2603:10b6:3:9d::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.20; Tue, 10 Jul 2018 00:04:42 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 17:04:33 -0700
Message-Id: <20180710000433.18224-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO1PR15CA0059.namprd15.prod.outlook.com
	(2603:10b6:101:1f::27) To DM5PR04MB0395.namprd04.prod.outlook.com
	(2603:10b6:3:9d::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1306db30-5c08-4a8b-e0c5-08d5e5f8bd30
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0395; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	3:CiwSKmW3+IsOMXYY7+2RP8MpYJgikuLh27L6OFY+k5xvRXJKJ6xaGVhjZ9FAdFVZk5ar3mOTnBZXIRikBatxVgQeExeYPoLXj/zFQcbGK6jhScZscATfKivwrFhqI1Ve5+PZqDZrzuP1LkiMoaj/Y8hnT0Iyqd/sBW43XGLMvLr0Iu54IrQIiqgHUbN9RASaH+1sZPbYYkP8Djn5ugDcNSaEvhwrIsTdRU9MoVoSn2SMT6hCxg3BDyS9nsyJwA+E;
	25:CHdtmtxkFIS3dBjlwSyBnW+pPneOMuiyk85wS/VySqriuj30ob0eY6AF9yj1/CZNsiCSIxKoPu9/Fmb32RRsgsh9I6RWtws9FPqN9h+rLebCyNH0z9XxnHa1NPKMFokSTzDILSthK+CFYNyC7JLbmzD2tClGHKIJs/IZV8lCfaDBYXJH+cYAq9gfIf0j/AjcNh8undbSMjOt9+03didGKLDdN9UM3qy1jSzdkt9VkrXldsBzi1FSORCEMVj5wkF7k7Z57plHhb8db3ttWIHt3lfJF7RQ0DbZ8/x2pNsoUREcZoQdrm0FYXrtTApK89oDbYl+q2htXbcnxuVcJYhzUw==;
	31:Tfzq8sVMAnkHDUp3a9v06yluy3hT9f/MPSnoCVFYrZFdALUOXNW4GvKY5zzp47A4s2DZYGM4+FTZsiMyH2sdI30jik0EWWzhZqKCeMhdg9lYPlc5SJwbUPk6GiSjLZGAAxsMkBkO2258MnuhSDJrx4F/TgtAlId57q2E6AKRqoWNbxdLjyExq1ivacJv0lphYmNbcDeyEfZ740dU8iiLxUWc6HEy1eqYLY17vs1b7RU=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0395:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	20:eonIYO74969j3WTb/ybu3+dTPkDGPUVhG1wQVaR9wxRQrif5pfWBWaqLsAyEMGYKNNV+dm8h1nFb/aqtjhPhogYUqP3U4ypjKhlirnUnK+bqKM0mPWxzAy2JCjWir3C5S/7kVSEHDgOjDT4UxxrSzQHhERD2Z9+V8/BXN5u1eUDbdvGl+aLpfmUo36X6RRXZKTip0rgG0uRZWzqTamwb1nVzm8Ka/HShzRyUnJplW+q6UIKPKCJfvong685W47Eyo6zJxyqE5fGwD1OQywqlDqlihaMKCi2oPjklnWu8yKpN+V453Tfk98CUGSSApTXmZeNiFR/X7/Qmpx9Gchqysd66KjgQGD+QopnhHpNGeC13UAut6ECjC+9chXTTMZRR0fViKV1YwzqNYu5yTXhaZDa7A/sYEhwG6xXxl8gg+I6iFUsNYTPf+2DOzJDGCUaSruU/F/dPYe/zzMN/pbDvzCIciI5OExftVQhIFguqB+cE/oKSfwWiZvVBzj0w7pb4;
	4:P3ycLDerlz+g6hpxyqqz3tjQYetRZQixM1DKobWqNcm8RY7s8VwMneIR4H92h/y1pyFIiTe4X8CzbcIwi5WiA5DxKKqWvQCRgDELZjcRAxBIFDsFel3dIVCjUlDH7wSx7+k3cbqmEFdma1dJDGqbqtn6IXwDDw0jGkA2EjrqMsWcQH0S2bS1FkAfaAtoKoA5r24bo8hQA5jmMQrnZDvxdVik3UQDdjRpaFgfmkMnxaRJhUw26z7Or/CZfgrO0964iRx8LmLHwxJ2C+bmvMKn8Q==
X-Microsoft-Antispam-PRVS: <DM5PR04MB03956B3045EF7C8F16E0A098905B0@DM5PR04MB0395.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0395; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0395; 
X-Forefront-PRVS: 0729050452
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(376002)(136003)(366004)(39860400002)(199004)(189003)(50226002)(575784001)(48376002)(51416003)(47776003)(52116002)(305945005)(8936002)(7736002)(105586002)(8676002)(478600001)(68736007)(106356001)(25786009)(1076002)(14444005)(36756003)(6512007)(186003)(6306002)(2361001)(72206003)(81166006)(5660300001)(81156014)(86362001)(50466002)(66066001)(53376002)(2616005)(956004)(386003)(53936002)(44832011)(16586007)(39060400002)(6916009)(316002)(2906002)(26005)(6666003)(4326008)(476003)(16526019)(486006)(6116002)(3846002)(97736004)(2351001)(1857600001)(6506007)(6486002)(2004002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0395;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0395;
	23:lC5NJbLAMVlj/VOdtcofS4Ygl9UmakU+PbuIssuqg?=
	=?us-ascii?Q?BPON1f01o+PDkS4+t2xrQSxhzXFNs9qKciW7xBrTZq3gPF/rgO9MY4eoSfHD?=
	=?us-ascii?Q?zhO5h+IUTBlEIe05q2z6XRm1oZP2zL2+YU9BzH17kH23Bwmws2pgFPJXskUz?=
	=?us-ascii?Q?qzrENFxwiX7o0aSTEwShwq6Cy+8w84TWKV2NX39Do4avzkFkczXGgN6YjVFV?=
	=?us-ascii?Q?fGXtC3y16sYtgAtbGAKhS/DXPUq1jKXEi4c/N1TxkpVn42D7Dsl9ySn+dRz4?=
	=?us-ascii?Q?xyGGi2B38FCkPFvOe/44vuUcFu3GMcywSIoXgPXvXD/wYCN1zl7CIsQrrUw2?=
	=?us-ascii?Q?k2cij2OdE0cxUx7YE0K4uSxJLATYg+93VcS6gv/XoFRmpZj6gOHa7PiSU7F/?=
	=?us-ascii?Q?t99ZncQugJolpNPn6r7g8l+Kygo3oYxuWsREKf8PMGYoJKEwZet2b55h3Zhq?=
	=?us-ascii?Q?fPPjthn9Co5mZran+n3dY2nupEj3jYvhLEFdxKYSnwcl+udVIT/WN12WfTd/?=
	=?us-ascii?Q?qaTf1E1ynnVoEEJ1oCHXwWAZCNZrMSQXbO9R1HVm+3bCU+ZxcSBOjmOv0p9U?=
	=?us-ascii?Q?Hr6U5SlLsH6b0WJutXeppEp44H+yfTaV9I35m4BmobTtsp5XQtHVm7qyRodT?=
	=?us-ascii?Q?1W4ZWF8ljy2IylT8ti9IKianVmd1OSsJ3rimHzLeEQGvb2uk752w4uXlsNZG?=
	=?us-ascii?Q?jf/o7Sw4tK98wZ56A2W/6O+pYUacgAIcas0u/2Z+PPfsy0UyEOWxWF6oqL7t?=
	=?us-ascii?Q?VgxjRQ165c6PvjSgbpweweXx5UXP7fQB6iR71j1GaqyD/cnQuReuKaXD8P4W?=
	=?us-ascii?Q?myxpoUfQbDuTG0JFLatjtYlgFZ/A63qlAOkUR+9UUfwKkldlgznT+vUaBuR2?=
	=?us-ascii?Q?U3qo50CRtKIgaiv5cJZF7G3zLeFSmZHyO7Xonpes4mE+gSde8rs0UzwOb9Kt?=
	=?us-ascii?Q?rjFYMtfBT7YyfiTGv6YkbhSTEZHqUlkxzclxJJid9THS6Dv0jKx82bqUbKmv?=
	=?us-ascii?Q?5eeXnmp9+cm+ATptaiCpFQum3a9qrcROhVCuQpIhLpAYIAwTgP18SQaHsVn4?=
	=?us-ascii?Q?kgnsscGtA2FxeRFWSQ3/jaHYyqGAJO4Bp5YRZFCQUA3X9M2oqCl1VOAqfUrf?=
	=?us-ascii?Q?4HIJhNGXxTP+owKGk5xDnhGRchDBcDrNYlXjxMH+AxMihzEjaMKMqK6QMq5u?=
	=?us-ascii?Q?IkWCgosHsniRGEzcqqSMXAy4iN/A0zbVx/qgvFxn3kivKJezoIeH5FicGO3a?=
	=?us-ascii?Q?NobsFGnjEROqmLV7HanTpBmqK/xlV7GJii45/VwWFOSj8GcZ9hbXNG1FXPow?=
	=?us-ascii?Q?yTSXoD0L/wLurlq6PoSSk76ozFeMKRgaJ1R7Bj7mGzWCxCZfoJhuGisfwPYw?=
	=?us-ascii?Q?QmYxA=3D=3D?=
X-Microsoft-Antispam-Message-Info: 0nHfHQYg30YWFT+XcAXiOKcBD8DwyOb5ldoLg7GBZV9buTWAIEgPYOljqIjmTw8xLck69L2DoVlpA2sYyyWrhcy+6YxfePrIfF3RnVjpBcPK1sJfOgwexFZ72hNzQAK/xFN6Qe9Fz8eCvCn/7GdAHkCbpVIFjkQT0v5SlWSaQIgpgLeClU5aKYAKDplHLCQWK2Dt4N3UZ9QHsMT3JquH+jZRVAGfqRxHzjx0++DFRKOPJuuEuvYgE47n5bNF90aXERN/EMG9SszIGT89dnj36A7ONYxXQcXz4SXAkG/2Jpq0G+c2BfjIwJ+bY5ZHccJ34aTVUTaOBrSSOG8LtT2vqBsnXzWuQqAEsypSQhkYyNY=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	6:xQZEutuMoUIA95C009IHEWsB70x3h7XG03Mz9yIhI6plu/OT5G9BIsgbeBhL6SnXz1UdMfBAEyq6ta2AyOKu//EzLdvNE6BCcUWsacEGiEie8s6xEiEC8gzLJGbRbMTy5qS5tR+QrHsdHJoR5kyD0FntwlQF7oFTBRiy9Gm5QJ+pCIU3PgjLzrXKDv8BjoNNpFdGPKh94zX7fjJGTadivPjsPWJBvflF8xRPViffRcsjU+Z8UqLLdKi0NnC8YgJOS9PwIkGe1vslmBDKJBjkb7adU637Rj2GNEupBTLab6AObyR349CHuDi1XR9kzMS3Or8tW+BgVI1ANxcFh/MDYqGEhm8z5jhMES0aGwAb1UEHEi807GA6B/e5CJkqT0akXqf+4ZWXq6ZilSgfAjgBbhIyOcJfXozxnSRg++HHynK+UlnqTqP9igzfYmnMrQT8iRIZMpn8dJyoPaRhow3hfA==;
	5:8SDyOE4rPliRmT0gvAG3ngbsvXOgLVAB6guk5K7Nzu18VDUHlrKLAmjEwgV9UlG4Kt7zByCpD6DwzOKH8vqHR29FaOtqVknYOCxazE8XAxwkr5sdW13wV+fTbenw8tMV/21D3/G94hi/BJsDio1wuzFslsKX9PsCtowkhxAYHnQ=;
	24:BjTx103reBKdnV+K76rvbpcS+xaOlALHIXFbeSqAZ/5my1RWBDcysb6ElAWrY09qQohP5Ul8nb1H7hIZaReRDlZRYAyP686NClUKqyvY+Fo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	7:NuVMo3A2GAUqa/dU+exbKrWZbiVBbzjqBUBu/cv8/wvD4qTJVFh9/YG3m9CSPqHpqJoRvXctss8Ox5NKUIOcNbwZ6f1UulVyCCq1w0lQZ61GGa5YNs55JzK94f4qVsn8KmdOvMUovXBhvwQn33N8ZXGU2LZL+nq141OCa6MKsySV5uAASG+MNZiVEmsAJNn+Exr/WOulGBktQLkPPvvIyXvzrVld5yBLSybGW+7Ge38vbJoMdo2MwsoHremZpBxz;
	20:DUVr2xmvcfWJ1df05HQzJDvPGc+iMllRz62DnuN8hV1u73pcp+taNUCT5o4gBOhpDnTevvjAfUAntSa8HWRxvNN+6CAHxISE7SGQRz1snpfFvuC4NvIvkqTV/DTf3OFjeYwwAUVx2kd9oYt5h/AL6gETromUc2I1Cfub2nQhKt8=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2018 00:04:42.8487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1306db30-5c08-4a8b-e0c5-08d5e5f8bd30
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0395
Subject: [PATCH] [meta] liburcu: Add RISC-V support
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
X-List-Received-Date: Tue, 10 Jul 2018 00:04:45 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...-support-for-the-RISC-V-architecture.patch | 157 ++++++++++++++++++
 .../recipes-support/liburcu/liburcu_0.10.1.bb |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch

diff --git a/meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch b/meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch
new file mode 100644
index 0000000000..b026782bd5
--- /dev/null
+++ b/meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch
@@ -0,0 +1,157 @@
+From fdfad81006c2c964781b616f0a75578507be809c Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 21 Mar 2018 17:38:41 -0400
+Subject: [PATCH] Add support for the RISC-V architecture
+
+Tested in QEMU 2.12.0-rc0, requires --disable-compiler-tls to go
+through the benchmarks reliably.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+---
+ configure.ac                 |  1 +
+ include/Makefile.am          |  2 ++
+ include/urcu/arch/riscv.h    | 49 ++++++++++++++++++++++++++++++++++++++++++++
+ include/urcu/uatomic/riscv.h | 44 +++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 96 insertions(+)
+ create mode 100644 include/urcu/arch/riscv.h
+ create mode 100644 include/urcu/uatomic/riscv.h
+
+diff --git a/configure.ac b/configure.ac
+index d0b4a9ac..9145081a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -151,6 +151,7 @@ AS_CASE([$host_cpu],
+ 	[tile*], [ARCHTYPE="tile"],
+ 	[hppa*], [ARCHTYPE="hppa"],
+ 	[m68k], [ARCHTYPE="m68k"],
++	[riscv*], [ARCHTYPE="riscv"],
+ 	[ARCHTYPE="unknown"]
+ )
+ 
+diff --git a/include/Makefile.am b/include/Makefile.am
+index dcdf304b..36667b43 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -27,6 +27,7 @@ EXTRA_DIST = urcu/arch/aarch64.h \
+ 	urcu/arch/mips.h \
+ 	urcu/arch/nios2.h \
+ 	urcu/arch/ppc.h \
++	urcu/arch/riscv.h \
+ 	urcu/arch/s390.h \
+ 	urcu/arch/sparc64.h \
+ 	urcu/arch/tile.h \
+@@ -43,6 +44,7 @@ EXTRA_DIST = urcu/arch/aarch64.h \
+ 	urcu/uatomic/mips.h \
+ 	urcu/uatomic/nios2.h \
+ 	urcu/uatomic/ppc.h \
++	urcu/uatomic/riscv.h \
+ 	urcu/uatomic/s390.h \
+ 	urcu/uatomic/sparc64.h \
+ 	urcu/uatomic/tile.h \
+diff --git a/include/urcu/arch/riscv.h b/include/urcu/arch/riscv.h
+new file mode 100644
+index 00000000..1fd7d62b
+--- /dev/null
++++ b/include/urcu/arch/riscv.h
+@@ -0,0 +1,49 @@
++#ifndef _URCU_ARCH_RISCV_H
++#define _URCU_ARCH_RISCV_H
++
++/*
++ * arch/riscv.h: definitions for the RISC-V architecture
++ *
++ * Copyright (c) 2018 Michael Jeanson <mjeanson@efficios.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
++ */
++
++#include <urcu/compiler.h>
++#include <urcu/config.h>
++#include <urcu/syscall-compat.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#include <stdlib.h>
++#include <sys/time.h>
++
++/*
++ * On Linux, define the membarrier system call number if not yet available in
++ * the system headers.
++ */
++#if (defined(__linux__) && !defined(__NR_membarrier))
++#define __NR_membarrier		283
++#endif
++
++#ifdef __cplusplus
++}
++#endif
++
++#include <urcu/arch/generic.h>
++
++#endif /* _URCU_ARCH_RISCV_H */
+diff --git a/include/urcu/uatomic/riscv.h b/include/urcu/uatomic/riscv.h
+new file mode 100644
+index 00000000..a6700e17
+--- /dev/null
++++ b/include/urcu/uatomic/riscv.h
+@@ -0,0 +1,44 @@
++/*
++ * Atomic exchange operations for the RISC-V architecture. Let GCC do it.
++ *
++ * Copyright (c) 2018 Michael Jeanson <mjeanson@efficios.com>
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a copy
++ * of this software and associated documentation files (the "Software"), to
++ * deal in the Software without restriction, including without limitation the
++ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
++ * sell copies of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be included in
++ * all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++ * IN THE SOFTWARE.
++ */
++
++#ifndef _URCU_ARCH_UATOMIC_RISCV_H
++#define _URCU_ARCH_UATOMIC_RISCV_H
++
++#include <urcu/compiler.h>
++#include <urcu/system.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#define UATOMIC_HAS_ATOMIC_BYTE
++#define UATOMIC_HAS_ATOMIC_SHORT
++
++#ifdef __cplusplus
++}
++#endif
++
++#include <urcu/uatomic/generic.h>
++
++#endif /* _URCU_ARCH_UATOMIC_RISCV_H */
diff --git a/meta/recipes-support/liburcu/liburcu_0.10.1.bb b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
index 9d5b28b33d..5eb91e144b 100644
--- a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
                     file://include/urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://Add-support-for-the-RISC-V-architecture.patch \
            "
 
 SRC_URI[md5sum] = "281a2f92fdc39c40ad6b76f6631fdbd7"
-- 
2.17.1



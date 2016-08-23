Return-Path: <mubin.usman.sayyed@xilinx.com>
X-Greylist: delayed 2634 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Aug 2016 09:48:04 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0084.outbound.protection.outlook.com [104.47.38.84])
	by mail.openembedded.org (Postfix) with ESMTP id DCD3D755F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tYRB2MFY9OsXrnzuRl8UbC61Acl1vY9US+cXGDBnPvU=;
	b=l3FK22nT3V5hUG1sStKoJZLiTcArp1n+PleNS4K/h0Ut/FTmsPQ+nR4kYe33JND/OG2obrsBVs4oDv3Q7Op35PkyjAwT2/X8/Svw0ga/kmutJjMM0TNnc22Pf+A5MpbedXFBKFQiSvH+JETkuMAHIIrO5lB3he8+Jmop1Jy8JAA=
Received: from BY2PR02CA0017.namprd02.prod.outlook.com (10.242.32.17) by
	BY2PR02MB1621.namprd02.prod.outlook.com (10.163.26.155) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.557.21; Tue, 23 Aug 2016 09:48:01 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BY2PR02CA0017.outlook.office365.com
	(2a01:111:e400:2c2a::17) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.557.21 via
	Frontend Transport; Tue, 23 Aug 2016 09:48:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 23 Aug 2016 09:48:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60559
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8JF-0001ls-LY
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:53 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8JE-0000qd-2S
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:52 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7N9lfaj008069; Tue, 23 Aug 2016 02:47:41 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bc8J3-0000of-76; Tue, 23 Aug 2016 02:47:41 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id 2F3BE2CE077D; Tue, 23 Aug 2016 15:17:40 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 15:17:29 +0530
Message-ID: <1471945649-3164-4-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
References: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(107886002)(110136002)(189998001)(42186005)(103686003)(36756003)(50466002)(86362001)(47776003)(575784001)(19580405001)(7846002)(48376002)(76176999)(229853001)(11100500001)(63266004)(50986999)(92566002)(36386004)(8676002)(45336002)(5660300001)(46386002)(81166006)(52956003)(2950100001)(586003)(19580395003)(15975445007)(356003)(5003940100001)(305945005)(8936002)(81156014)(450100001)(50226002)(33646002)(4326007)(2906002)(2351001)(4001430100002)(87936001)(90966002)(106466001)(626004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1621; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT035;
	1:bQHjEHTZPe0dgJePTkTXsCu+h1moflmYRb9lvKhFmG6U8RsUPhF8cyeP8HaSSF5tYx8/y5TfwHWpq0xF78D+4Ki0L7M5+w2rMGTc9gBJ1hMuS1MXLp8mClV1HdcdfqeUNSJel0rFBdnkrP2Z2S8ueNuDzV6QGRepSBzLZOpk1YyYMUGP1APjKh0/HMc+pj626KBrb+yrFJ6v6k8BSEB+YCvqKa+PPm1zH6Ca8uGFgul2k8fOhJIv/qGiSFbR8PYLgCESUiqXIi9UV3JMt2G9HRwhgRWFJFEygjjfJzQojuwkXurkAJLYw6UYldcIPWb0o3xVXHxeGk2WTSbtbs5oGwoHqGy4helvlcOlgxCiPpFLOAYoEQRGipig9aGcSZec3SHMXXodlv5zIUzp0jTKck8KPxWJe8uMaZVLREg+sVFTfvCbXtooh/L1HqrHwHEfOP+miCFVywG0qJu2RkOJdLMKOY6tIbnFkybKlF7kF7gvfPCibXzI9sF2shrLauXW7g14c1DduSpeJkeis72HP+/tXzJthLv1uJ+UCBCEmWmgydJDtXpZZe0LQljptsXK
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c0571503-d882-423d-2f8d-08d3cb3a92dc
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1621;
	2:ZAVIV+jZhB9dNNyTm6x8KAVNNa6qaX3GEtOqQNlmMkDeqBVWDzDGloHvXNH+5DTLBSswkb2KTRzSPF34wyLLtRX6MfoFjwIs2VYGHWItK5qkwgHSgP3V3uKm7p34ejCGJnpe4ju2D8Zeu7JnL61Lly89TbB/aYhngx1Az9zH3gnGX2/dIAFM2E3jFvy5sokM;
	3:MPMSgJNf/kzcKtOirTzeCW0vSSuqXyW05T92Jjw3gKZ1evR49zJ872moWhjQhUcVkWgrPlQ/w1sZnu4EOk8KxqqRO/Yj6qhYaiSI+F8YIvPZ6addKrD9UK2sxIoTqLn/fRqp+nvi0C94PVA6aZ8jtA7FQHWQXwjJJLWFL0atsjVeTUKdx3DDne2rpZp4SWMDV2MyT+kaFFlUDaNhLllg1teENf9lzt3k5tdUu9RE8mgkdl8646RS5nEFQqhulnCCVCSmwGG973Juyox0SJWKGg==;
	25:mSrKnlgTI2VH6KTzda6UnJXXHnaE5yiRZZS4QUybsw9tiSid8o6GfHfL7+czPbpI0mYclptoLH8P7JBXzvBKR2r32B7BYrijycuBr8abWIrkWcUyAc/8pkdktwiXfaw3/Mn9h0y+wChz9Qd+PWoJgZeeYkj2sgJ/KmgHY0uTzcAHbwuHFX2Fi7SohRj0RTh3xxRYysqa3+D427bASUpqgK1tdm3XTlYU9mcjhY+RqMMpfk9swAkOCP3IJ3RX9o0ZMzhu0UCuRYdU5owbTYs/MombCav6mZ4iXKvQr3z9ggRIWKEB0hdvDAUy4nhyRbzkZhl5YzBu2NGgo6HaFnrWGBhPfMn4e8Pj7VscoqVI7/nAUwz5YG/BMNSjMe2cs1uNDQ0bKO2PhgaAMdoUTu/7YbnpWZ63qCIxYuY2+YX3Fc8=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY2PR02MB1621; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1621;
	31:z4dBKeSomsW3KsTEuOID5MpMApHMZNDK8hV9NbEQX4rk1m0Ax97feRv5dhOQAHQFxST5+Z2c9DmcW1JAFMAbBATp/Rdr47zEGKBhZvXar2QBmvddBHWbj4GIhTzpVRFMoIA9ZvH+zAeP7/6D1LCv+EhkxBsoxfDNaQPj5Dc6kSNwmdCaDhXAvDZV4UKa7IyMeNhaauXhoyH/bEUdJc4bwHN1hCs89CVob1Th1O8WI6M=;
	20:bnfbx/tv/tmHZNT7gjqAGBDuZ/f8BzFIi6FAt88FYXjZhOYyhFCeqtUwh+zS+zgQLJNh9zHh63CpoPU7dnvkfNwgzmmWqQo26SEtFX28ijOqCc9S2mEiO4O++p2PI3yE5BsvCobIqCkaQjPf8K5O2MjKIbv3pfWNHGkfPDSxDGrz4jqKWoZp0dPFCTy/apYn5IXi8angMRRB1CO+nKWMyp2+Hc7A0TsGWq1qUwEdRN9hhcrAJ5nTjsVW1t10j9L++CQVsj4zUE3yVCoIIuHJeEYdw5imFOm1aeYZaIIqOUgjZeeQ8+2LLLKa6WqObG05f63QkOBiFRAl30gFUu3DAGGluBvSx9QBJStH3elqGVSIxmy2Yf5c9h7gn0+WvqkP+fNH+JKZlG6gHtiir9sIYnK7rm2eD8g3sVkhO4gD+2Ce41OgvAhlOVMJcXCRNbHmJWpU5GUtLNSZtZfv1zwgQ9nOcBb4oGxQbFwzfQ8glCddPEUqCIvxP8GgeXeOw0YW
X-Microsoft-Antispam-PRVS: <BY2PR02MB16210694345FED8D292F1C57BDEB0@BY2PR02MB1621.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BY2PR02MB1621; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1621; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1621;
	4:LlnnCegDNxJigy68RLGvH8gGYI7pgEIY0TEz5ytUN55dWTyJomkKfORjemIkf2ZFLVjvTyEKk3+c6PKcbq+mkeIvdF5gmRGq77yTD23JG7K1WPvQi2Aqm4/HdjWHxtDDg7CjyutF96GdRFGLACHToW09MCUA4mOsfaD1hIlGUAmbMAyRf+MMVrHsVteoqv04HdoRq6+Q/MUqJm6ddQI2+hslIEJFEb764X9pH/o9lM5rg9d+K6SsA3fSmIMQPQyj5ZtjNZxDb09CUQyKQ0fX/++6N+0b0octD/CzCF52lQ1W0mnYdUA5wiMxbHO6uViRdPv7wKhA7hLa5ny6Qyk4ygp76eEcD+Rq5iejbWfNL/MnQFswYhBKjEToKYNzye0fR1VaNX/5zIO/zk1W+UbwAG9I9oBUh/r7qge5TKGOxqTIik7Rqyu437qiWW7ftMwRj0Sjcsr3M47jy81gU7srtVAtQ8LX5rA/q29bo5eqmqyS6kwuUE0ZH0dx7dAdg6b0NhA/rifIiM80G5Uu3ZVSNNNHu9pwHFrW3hrY4gdCVJE=
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1621;
	23:Lfto5z0rghSeWl6g6WA0lNVkcYYIdWKt1W4/rPySA?=
	=?us-ascii?Q?3sD80Nl5Vva6xVkC9nkAM8B1I/cUDcMMGgs4Heul77ZLfOi7zRC3NZGRLvkP?=
	=?us-ascii?Q?D78Q1D2bfoxZxveTOZnLTbq/qkYtB42SP9FyrQRMyOS/BHCxBgnul1aRYDx2?=
	=?us-ascii?Q?QqUXGgORNwW+MeG1G07BwTQjgqHc/zSBHYVRUOMmEWpcJ29HOFu23Z7NxvlT?=
	=?us-ascii?Q?BYc9+2OmjqTc7b1YxyxFpw1jm9fqWfIK/QpUc3EMrszgtXwQKW+KXIyA7dgP?=
	=?us-ascii?Q?SX6khuHsD1xobmJC46YCOazAB2HXuJMlbYqOsS3UJ/ommvbHDnThMhJ5DgJ+?=
	=?us-ascii?Q?73KBOmMpEVIkO8x8+0a1nVGkna2vUM3iyjvqgdPsusiFY35tKuUih4uo8a95?=
	=?us-ascii?Q?d9ndZSygi2R7e3EkY7YFftdKxkKcICrfoxbsVmGIHXZ4tU/eaN2xlluduOWD?=
	=?us-ascii?Q?nlrr7M+tUVDVmdvJLRiTwZbNGoq3nkUqGMUUyOhD1cU49+g8ovrC4aZzanCw?=
	=?us-ascii?Q?rpKg4sfTq3pul4eJZoI+j3VmgukWR6mtANaPXtySC4oMBS1/5Lkxrd7mgBef?=
	=?us-ascii?Q?tdNhJJePXIFURhAnrCSQiUxnGfN6NwgE6SdWE+twbn9f4EraIRwZ3V0rbsD0?=
	=?us-ascii?Q?D2DkXu1otop/YKphAbfNMl8Jy+W4qYrVKc22vdD5rGbyA7Jxb+Syg+5RpIBK?=
	=?us-ascii?Q?Kf8/fTTNe0KpoopzgwO4RcjTu8JhuFa5KMS3dxlOch6ePxwvqhZeUfQfa5b5?=
	=?us-ascii?Q?oMLXMBg7x1dYkEVghygf/mCg2+uXQDA56UxW3Y3ppMVrg+DP8JdwxQDJbLg3?=
	=?us-ascii?Q?0/tzAnyKFvNawgMcxxDrxgbU296c2Nvw7okcdN3dBNKZYHMYPDgfe8z1bXTf?=
	=?us-ascii?Q?wu1ZBB+p84qx42YZoAc2625b/Vgzg38cZ4CIC2Kl3eZNJ1091xVmudNVBZ4r?=
	=?us-ascii?Q?onsHgVz/DkbVeBo6nok4zgzwaBk3ZdeKZhJMXVjuLBEXmH4OMvjrU7DQITW9?=
	=?us-ascii?Q?1j+RBmwmHaORZ6joDE9r5vVmsGDhsFT74BKpDoel4aW6SW2CJRYaiYFJbI2o?=
	=?us-ascii?Q?gJrTybOTCv0Q82wi1YLaoMOuFQ8BuOVwWGfHbdPwzYzGKXzgb/+S7NDdXkak?=
	=?us-ascii?Q?gLVmVfxhekf9/eNY/co1S1WXTqe6KtqSRbOUlTbAD0Meo1tgVakJ5HEdd9Ba?=
	=?us-ascii?Q?6ak7SRc530mmO187YLTv6kAOGnameWD/765EPL+pcHlbZ4TStZ7TeR1P9Bel?=
	=?us-ascii?Q?0pPC9a67cnNOnrcWZpuPePvYYs6FElqx8qRNhNjaj1aQ28Oq/NKrJZmP/jCg?=
	=?us-ascii?Q?eHl36dXUK/hJuHoox5OFic=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1621;
	6:EGxSOyYI1+DYILqzlV/aMmm1XSo8aG0x09lwqoM0g7VJiYrV8ymcIkMetkQH6kWSy9pto2rYUNTRQb7fXJcaMJz+cbJWeUSskhrSOYBCt3Jb/vx5skBHIfKemxFcgDrFKk9ZzqQDiVs/or801SlRE5xAav4ZpBWsNKZ6WxO9AqLWDos6DQz0W2Fg0fGLzap8dHdEe9cqNKHiGeR5McffuchAESXX6VS/v9s0C3zH8mQOhSslcRPeDzZ0VFHWo6lvi+JctgwCGX1BTBksiUldCPd0ssTiw35mQnTkV7EMaREdPLPGPY/aN8j8HCVAr2nl/D0dD8DyqWxaC9/acvUi+Q==;
	5:NFeRjLw8kpQUqLUMmIzGzsIX2Yhxdm2udZVDDycl+wtaU+mR+Nb/nGxJaIJZeyG4jpzbGH89C4J/+uxbSqbFe/ruDZN8CrogycbHnLYN9ynPRAdVrYprXY4bU0fWmH4l7yKpZT2y03k1lAUmrkoFdA==;
	24:dNC6dD1NHJ3TJ6GscIRIbAvlzS62BSLlwf9z161wK8W0bubpDfctbCQqOEoqzt/8BXqjRbkqfFwiuZ4sKZNj14cTnRqDy92n0L/COl5uDc0=;
	7:/aRbKVolctX8/uo5c2qlWi4BINuvNCCfBa8aURvmyerLlCiPXbYTnLkMnkkRTg9Jt07/rzk6dsuqGmBjcDSr76eXp+XGpPPQnaVAUVHlmuLnLUHmJ1z3OlmHd9Hm/s/zeaqs1RYPYMjqoh38tcb1+vR9fFZ3KY5xBWhytCesG+0R8zrGGaN1ltrSaoBJN7WYLwMVQ4CwaeVeHGx5GH+qPZnBxL9OHcW1ZBskS6E5c3aiY1J51gZdl+WHuxLTtPw9
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 09:48:02.0254 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1621
Cc: Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [master] [PATCH 3/3] benchmarks:Added recipe for linpack
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
X-List-Received-Date: Tue, 23 Aug 2016 09:48:05 -0000
Content-Type: text/plain

This patch adds recipe for linpack benchmarks.
linpack benchmarks measures the CPU's floating point computing power.

Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
---
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb

diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
new file mode 100644
index 0000000..b136358
--- /dev/null
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point computing power"
+HOMEPAGE = "https://en.wikipedia.org/wiki/LINPACK_benchmarks"
+SECTION = "benchmark/tests"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
+
+SRC_URI = "http://ftp4.se.freebsd.org/pub/misc/linpacknew.c"
+SRC_URI[md5sum] = "11aec219fc065a4aa54b9aed3b2c6f47"
+SRC_URI[sha256sum] = "e21ab7b04732189b550070f346970db9686d2f33a5d0a1a3a03c4dc50f7af14c"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} -O -o linpack linpacknew.c -lm
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 linpack ${D}${bindir}
+}
+
-- 
1.9.1



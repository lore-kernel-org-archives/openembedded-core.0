Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 16004 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Mar 2017 20:41:32 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0040.outbound.protection.outlook.com [104.47.41.40])
	by mail.openembedded.org (Postfix) with ESMTP id 96E2271A54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 20:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UX92BjnRArrCQwGxyjTlLNiYST3RsYMQ0bkEjynVM7U=;
	b=4DheJWPinEhxxzFrBFpKA7lnFpUqmdm8QElNpR7zq3HEzKWXEBeM+dXbOfrnpfOIXmCQ6Ntbt6SPidYmiv5SkuVAEN3PDdw6UeGfwMaOQH+lUWtupeeGPzPwtbwuSMlPaJ3S3HRM33w20Pdsa5oyPfurRe3DZYEzcG1qYCLDnsE=
Received: from DM5PR02CA0069.namprd02.prod.outlook.com (10.168.192.31) by
	BY2PR0201MB0760.namprd02.prod.outlook.com (10.160.125.13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.961.17; Fri, 24 Mar 2017 20:41:33 +0000
Received: from CY1NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by DM5PR02CA0069.outlook.office365.com
	(2603:10b6:3:39::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14 via
	Frontend Transport; Fri, 24 Mar 2017 20:41:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT029.mail.protection.outlook.com (10.152.75.143) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Fri, 24 Mar 2017 20:41:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crW1b-0000mD-Qp; Fri, 24 Mar 2017 13:41:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crW1b-0007Sm-Mu; Fri, 24 Mar 2017 13:41:31 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v2OKfLLD009613; Fri, 24 Mar 2017 13:41:21 -0700
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crW1R-0007Ot-6X; Fri, 24 Mar 2017 13:41:21 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>
Date: Fri, 24 Mar 2017 13:38:58 -0700
Message-ID: <20170324203858.27464-2-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170324203858.27464-1-alistair.francis@xilinx.com>
References: <20170324203858.27464-1-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22962.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39840400002)(39860400002)(39410400002)(39850400002)(2980300002)(438002)(199003)(189002)(9170700003)(5660300001)(38730400002)(107886003)(5003940100001)(77096006)(54906002)(9786002)(47776003)(33646002)(50226002)(2201001)(356003)(48376002)(81166006)(76176999)(1076002)(189998001)(8676002)(50466002)(8936002)(50986999)(106466001)(6666003)(2906002)(36756003)(39060400002)(2950100002)(36386004)(4326008)(305945005)(63266004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB0760;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:ovrnspm; A:1; MX:1;
	PTR:unknown-60-83.xilinx.com; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT029;
	1:d0Z6b6sZ/aC36XJzKMJC5qNc6jkqSc3EG05iu5YeCqt/S6HVAqggikh0rXbkfqHatgvGOcZzA5alYlDikh5+9mNxRL+6QObE77ziQ9UzwbbEXCN461+JSiaVO1zZCvyP8tfu/g2zjq4cNDsXEErun0GmoECVNW0T/D6ciTKBDfChjGEBaCorZ2yPiS12ocg0vud1CE/HzwhTGQXNpHwGfuCMhwTzMHuoC1eoC6d6gyJfsURj6zhmTpHEKP32fIHDIwhlPzMA0fAMzQRpMaJceu8/qsq8RDkqoZ5tOPCMsVQ67fdIZstbBAomWOAI8T998/Md0aRTYNOF7oQjkNavZi35uQ4hquOfC+TQmTgwr0Xpwqors3toigNAXWHCKJO5JNakfOaLor5chX0CMjU9YMBlBJdGMILoI6lXYcOjlhP6yox8621QwzDvdV4rwgJsiE8Fut4bCMLjc9WTw//qtwgZYm+VrkIK4Xa7kEwES8SmE4S8YDVzrjB+US51ZzLny7FYB4iJ0/Z1EpDW/iEM2DkzUZp+x8/jhqTdrPa9/1mwIFlTjFDewNQsoSPHdPXYAMYHaAAUFxb2pWpXuKixNydjmRBSAVPliqBj9c/Qv/MFT2S+x4XrYx8Guo+GpWsB
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 72476d92-027d-4000-0c19-08d472f62850
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(2017030254075); SRVR:BY2PR0201MB0760;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	3:Lb1o+VRd1dU56gnyUBgKnd3taNK45Hw+1Ot9plV/FxCtmYG8ITDqgPfRx+YiqGAMgkBYgAegnZ+noZvXR0rqY7Y628Tpa2EPsNpQK4u1lnglfTgyOwhohgnZGfsSrRGNzUKGXYKIr0lSYK0Tj3sYMN1bJb5LOz7fSUBarKjxtxamAbiajxQv/j8YjRhNiA2lMPnU7S3CCzt3rkOfcnO2rHv4fXRqmTEqTpq+CVbVI8bF/1G0qHA09yQs0S4DesO5ditTsQQ/G/Jq+JNBk9KY3DkaJe4OS7fJuB5jACcRBTvuRwqAl7DHlPLnSQsmMH4kS5vZVHvW5JrfNsSQRTQj645GaJtz88ilBCg2otGn/IFnOxw45Y5USZ/xSZ11etWSA5zHDr4TJG5L+ZJzRoIEqDP3YrrKotazCq7YQAOBih8=;
	25:Zsp5w1y4s7398QAEw45Rd5C7g6SmeNl6C+gfuu+3Lnof/7AOADxtCtCNI1HXs4ETlQmHcmU0Rxvayae44zmWsSMU8yKX3+39sbWUiZZF4WgSOfoAMFmV12zIE1MkjJMZg30j+6Nb7qvsUjBX7u35s/jhcqyySLhPFAu6Hr8O0ZCv0fYU4cfjMNtNI0sVhR1pB+GvutVuKLt6tUbqa7cDo+IFYvNYt6oLIopF848aMV8Q4f/pbgNpvfu/etbeNe24ckSDpo2DJHm6e1fDUF0EvYiyRvZ7Jm1eKQv2TXmU5A85JIBODwCVXwVE3KrQO5IlyBQBfH4u1xfXyXkWjerNK+m5lJGIQP1BxqnyPmEHEnJ2LfvrdGeaAgfLUwHp35zLbTo6n8HbSkVAQfP3gQ9PyOeYpNHmN+K/jXHOhhBSmzCGMwSCyEXXiTtsDQuojtAWNFaLGdDUKUgaGMd4aeONfQ==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	31:LefN9YeLZD9/eF40WorCkJ7zOAlY0C0kT5iOc07zXaWzaN8uxAsBufXVh2gzkuSUxlIuk5EyLzUaNlCG5WGPBpWHne7Y5ccDNM7pXwslyz15tS5xGRX9OQ6hyWHQgwIzxh+46YajKvYWxWaZ0OqUES856uMSG2aKKXcgNNM8vp1u2Q/PkuyZ5KkVmTGEgMo5oepO3zshxkryrinYi17U9LHkcbmWzyQ5Cs6+keL30Xno0j0qmPks4ByB1cxmboNyENOLxkdltm5nWHEw7MGQvA==;
	20:I+plEzIJLKhSw0zRMeb2+PbB5j5fE6AqRlQXuhk8Pbu1eIWKNg39i2ah6wA0p+VC1qkqkwh51m3+fINpHVVedeuEi5lVuP3BxReaLrF4LxHoJdYB0FVX6u1yYml08XPnMEyw7RlLhTNjxl8+wjZQeaKmTlriB4rboGHbbKlBNpfwobwtTI2cnxpsUMz/3+si7mRaPBwIlUd3CCAwgUR3zRYFzOiaPetcKrkZuy/u5GEM+waJFiJ14VJBVeTI6LIET3BXeRQofWqRPBxoahVI6jggJFTXVeC/xhfnexmGeAbIZI8qS6lRIbz93BKegGrulqRUP/9afW0YHnbb25ywsCabbFxBGtcnzBQyIWzewN48dsHHHlpB+KVVVoqhIyfXvkh594IRGfVeIVpEE1WI/WfEGe/fuJl4lSo3xUA3qy+8Oyn949wJqxTBByC7mlqc/IVxiMiVzH4VhVyoXU2mrLD3xos+sVPUdpkkyEd+sAIoUarp4qANgZ24eGyLY2ma
X-Microsoft-Antispam-PRVS: <BY2PR0201MB076075D21016C0C032B47025DC3E0@BY2PR0201MB0760.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(127540120423786)(21532816269658); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13018025)(13017025)(8121501046)(5005006)(13023025)(13024025)(13015025)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123560025)(20161123555025)(20161123564025)(20161123558025)(6072148);
	SRVR:BY2PR0201MB0760; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0201MB0760; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	4:2PDNwTt9JzDucKk8OtyrPf8R1zL05nW6fvxss2VEK+T9ME5o26/VDJr2pE/LOWwE2IbiutglHkNxIZbgvRPbwqtDx3JDTepVwOMtLv3TNB1sc0jjjailhhEN0OzN9a3RxsR8knlkyzN96ChgIlZRgw0Vu85wEsniPqxgEIOdRfYb83nsr44oAD9HqT7i3Lr50EQL3vHF52wORiWqGB7cdheS7Lp+6mYiEfJLZugIaKVtBVcg+TmQKM1LuY4ob/IMwWBzBgTKv56XqO+vtTc/bWrbdWJfWVCiq27JfCSIeL79saXJbW44Iur4M5ZC3bxv2dWpTHC5xZbN7tcCN6v8Lm8Rw9dyabTSHqoIr29McbVA0iitTowhKiKXykrH6LXQOw3m0om144HId2X18QhW9HoohhWYKl4TXLe2lsDgB32T7vipXv2oJzcCWGJQ0SLfICwzenrY+yIbDs6uAnpO43GDi9kByqy8DId7OYgLneBqX7zZShdMoRnhRCxTNhXlMcDe+wV4LZzfRTIe6kPL4DadeF8u7sQDzQCNpV+miKzCncVQFmxFh4j5Rf8OHUB3zpksTMa2F1Q0Y7vR6XWSD+C93Rw9bcGGLsobKvD5a0c41uKPUUZkNiO/nWaXZ45ipEgrEXEuRVuuSLQT5b4sIjvzmnrrXFqJvAZnD3DqpkukqPh/yCPoux0w2p+nJXaz6tCcc/YA2EHoegSit2mlnnhBgMmMAmpxmefWaNke+oTt68MYGwRNu9bOJW7BuSkAoozMRDBvk0XAmkBOx7SFiprR6Azi64AfSMVO0W5G/4xn9JTvSQiUMWzs3wC9UAB5ycMge0Wm7OjDb3PnNnV9Qg==
X-Forefront-PRVS: 0256C18696
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0201MB0760;
	23:iL/NxhyUpQrEFmkQyeDPXV8EIChKz5dFefwI2/J?=
	=?us-ascii?Q?ypwuAi9efE/Cxp7CVI2EkrKUmf5FwziQN+ogKvdLYMEeVmk6dmpCGHkOBC1v?=
	=?us-ascii?Q?BSy1hVqtAkiIzGqOhddKNUJ7raT12sClpSLBRCGB5ipllqCEf2W33z5kh2oz?=
	=?us-ascii?Q?hyNpDZmAstY6KwpaSx1UXTOBiLcwMKyLy4kANZ2CRCoQsRj7Q9IxnuO5rdRs?=
	=?us-ascii?Q?unTmEt4LQXPjmz1hzpLQOQ42YW9rP5b37DfN17oEGNXf/clwUyWsIqvurVVV?=
	=?us-ascii?Q?krQJbHyTixSGtOcv1BU9hqZuaviNrQXgD7A4zywReiU0apdKHzXMnM9UExaL?=
	=?us-ascii?Q?vkqJupo8uEdEzoocHq8laKX5Wt1EoZ0r7wCcml4u3anLV/S/CijlQm5iWNC8?=
	=?us-ascii?Q?b8cybvjo+cxPVPJM8vg9jECNEoyJxXt55yIBigDTM7cazooCU4ihuq88p1oT?=
	=?us-ascii?Q?1rdgYZWa+HeTtwKu6AdcU4Iq8BNl0cP18EaX2Ah+BAYZKXoDkfGxoPFrREeS?=
	=?us-ascii?Q?bnZvlRqC1qaopOz3IpvpE622Hsl0cM8FKXu9tLALFgdQLy/jypuF+OQlYW7j?=
	=?us-ascii?Q?b88VHXBRpUI6pNObcKeqXIy9A7ibo1yAORq6RpHclesE7yzYg+k3PdHOwbgz?=
	=?us-ascii?Q?hnQbQv/QnLdA8Xze+fUnAlRtU9c+vVpjhoQ5Zmll1bE0JZDvwvhCqmnTBNHw?=
	=?us-ascii?Q?+XDVXLAnijUM0NlSwyKUxy4o6r6+gOteglqu3eBfgLRo/D8UPSaq67H9GnXa?=
	=?us-ascii?Q?mHjAqw7WralPYZAKn6YbuE/mY0soNqiFsahbX8O8Q4qsbPfnQhMYr+/2TZa5?=
	=?us-ascii?Q?OFY0BZMCeoTPdoOvhuNE5GEquQh82LtaP+HwiqVdfWIjC20ZinjxuzF4ezgP?=
	=?us-ascii?Q?SFXU9hynd2zi9ZGeuBg2xgDk1VXPSteUgaWh/iX+svriTHnmX1w7ak1h6Fil?=
	=?us-ascii?Q?4LBcLhGb7lPcW/WgNt0DGwQZABrKlsxNplwRcIuXpub6iiLAOad1BK0jVFic?=
	=?us-ascii?Q?L6bYg++htS1U4IhNu5Lu4YiiV8EekIaUcVtITpxGXgr+DbySdleDETlg8ndk?=
	=?us-ascii?Q?OF/P7ackuLuUtJtY/l+3++Qd7Tie9?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	6:fAUZkB8bAMYHqOfKfx3OjmYPSt/JVMtE0cZJhek2YDRTaVdM+V+3uFOeH7JZti7Ktl/m+SK9Eq5R2xo5FsRx36d/RuGThFObV9qzGLj/Ztke0j8LZWc/mgJZceIQZ9k5uDjItpap6i4oXxkLNXbiW4zIDIHr4p2oDbqs3ixDRjyD4lCSvCA3C4rrWXXkci3oKqC/ROBl88lRggZdGHvTJYDLpnWc30OCppZbxtMPItXS1TOlIDiHGPNTtqj+rtuwIOnxUNuQneI0pndjk3TWhQI8wFvohZwDGSSMF20BXjAvrEU99XIyGs9zpa7DwpUUh+ZFGzSIYL7nA0KJXehGg7tHLoL/NaxrKFpMfbexj5B3jlJgH33dw+vWOPzBBVUiOf5oxigA7l/s/4cjFgJDwk+6fys5j+SsBLGju+W757I=;
	5:oEJbGrmfePyhUIQtG1eknpqL9VABERZTYLesW6FD8A1fGp1io/cyrbo4JDdu1XvV551b8CFtAni1dqbA9W9EPE+cQupVo93SAwiq5b/kX3P3gX0GXIYk1cf/whY5vFv6qlSVBRKexTf5OUYD/wwiHQ==;
	24:dOksOSxaV4aI3ql2/Vhs8IgAUQYSWUFGnFcoRx0IEEFiErpapT0rp1C9N9xo8SWmTCDzSPwsh/59MHuov9WEDl1iLoTpMu2AwLqhgA6Fubo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB0760;
	7:4xY9KBjx2WZKmA3ljA8dWLzzDy3e2erJE39djJ+/YNuSmM0Vy+6KOIxcR8O3sdDh/UwrDEfwmM3S/hhyzGgCtET6nah8/ISArMw5HJIAduCv/sF+Ih/45snPvF16JPTbJgHv8NswPtycKzmUwx7tu7mlMgXMha6yK/Hlyy+ncl0mjPvVkq+KIpICjAfhAW0uIvLKscYY56X4A4VFkgS3S7EJ9IzaHzyIPadmKALy1y0M92koxT+IGTWAx0OpDO1RgRqLZ+lIf0QKRxso0/iEDhZdaLoncIiMhURAWfDHWRvAWr/Mde8XVajM0exyYGbmlP7Vn/hQoifWLJAp5crumQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2017 20:41:32.6188 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB0760
Subject: [PATCH v2 2/2] runqemu: Add a background command option
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
X-List-Received-Date: Fri, 24 Mar 2017 20:41:34 -0000
Content-Type: text/plain

This allows callers to specify commands that should be run in the background
while running QEMU. This can be specified by assigning the commands to the
'QB_BACKGROUND_COMMAND' varialbe in the machine conf.

This is useful for starting automated debugging instances, automated
testing instances (using QMP) or other servers/clients that QEMU can
connect to.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index f76d976..b5cc56a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1118,6 +1118,13 @@ class BaseConfig(object):
                 kernel_opts += " -dtb %s" % self.dtb
         else:
             kernel_opts = ""
+        background_cmd = self.get('QB_BACKGROUND_COMMAND')
+
+        if background_cmd:
+            logger.info('Running in the background %s' % background_cmd)
+            if subprocess.call(background_cmd + ' &', shell=True) != 0:
+                raise Exception('Failed to run %s' % cmd)
+
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         logger.info('Running %s' % cmd)
         if subprocess.call(cmd, shell=True) != 0:
-- 
2.9.3



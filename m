Return-Path: <carol.zhu@nxp.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0082.outbound.protection.outlook.com [104.47.42.82])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB2471D5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:28:34 +0000 (UTC)
Received: from BN6PR03CA0087.namprd03.prod.outlook.com (10.164.122.153) by
	CY1PR0301MB0907.namprd03.prod.outlook.com (10.160.165.18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Mon, 15 May 2017 08:54:03 +0000
Received: from BN1BFFO11FD022.protection.gbl (2a01:111:f400:7c10::1:119) by
	BN6PR03CA0087.outlook.office365.com (2603:10b6:405:6f::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16 via
	Frontend Transport; Mon, 15 May 2017 08:54:02 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD022.mail.protection.outlook.com (10.58.144.85) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Mon, 15 May 2017 08:54:02 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4F8s0Gq005326; Mon, 15 May 2017 01:54:01 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 16:52:32 +0800
Message-ID: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131393120427989861;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(39400400002)(39410400002)(39380400002)(39450400003)(39850400002)(39840400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(189998001)(305945005)(498600001)(47776003)(110136004)(38730400002)(53936002)(5003940100001)(5660300001)(50986999)(6916009)(6666003)(8676002)(81166006)(104016004)(356003)(8936002)(230783001)(50226002)(2906002)(105606002)(85426001)(86362001)(33646002)(50466002)(36756003)(8656002)(4326008)(77096006)(48376002)(2351001)(106466001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0907;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD022;
	1:zHT72Zh4LxhJt7kx0yHp0BcFS1IPL4nVdBO/2FdNnKpfUPkm1XxUV2AIxl0k+4OFQegaVS3R3llDA00zMpf5frSYVicJ6Ph5z1n1JVCzOv3wYOb3MvK5eVimcdWedkwMBeyL9C0krHADn+ZfOiA+I73LfDvANAoD2lwqqUnLsRrq2MELBFAkHRoTwTO1ynMmbjANai4rFyglEAsq/MCkS6tc7mYtEb73zxxlflbk+qbjeurtQQWary2jdxYUOeVvD9NYqAUygA3VQcC8G+d8pOJqZz9c/juYzCHy0Cu7NB/Is8GJaX9aQRUQUWxEmsX4qBoUaDfzcTuRbQhjnv8+AqCQGA152Fz9RUz5MKsYMCpx7zcSOy9U5rYYUNCNGbpR0qTSlpLGk5jIK+hU/3nDCFkXuCHyWDIZpPMulFkKAvy9jnHGjSU7kIql+URDMBDNSWXkCwQpmfjxUehU5a87ofe6c7M5VIDAET54kfTrwubz1W9LBUOee3LklDfvX604C4ioYwdbxc5OX+n2w+Sk4ACC8U4Jpf9Yv3WdE7Q0IqKTjKhPDKzszWVwTPyvMrXvcqY6jG34tU4En0cUsNrEXZHadlP1lz/aX1lsbhCJ5q6n9+/zxmnXF4pO51Y26Uc+JhcOv0TvNIq8kvxoxGljF4bQYWOusgfFDoKtgg55PvqKJn1qZIo3gRUc7c/G+xzCxvX5modYUoOMhdBbvNBJTxe3AdUFSNWMuDx339/f9ms=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e29762-effc-4653-fa05-08d49b6fef7e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY1PR0301MB0907; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	3:jVTfbUoDaYjubYWCgiRDT2Arn9ImRucLCIFxTE3jaTJC9CW8k5T0Q2OJMAbkp0BIH3Lfo0jOoqw9LsrQAxPZmvW0NYQdl/Coo/fenALQt+BRw4YTp/01df4MU7dpKyqu148MS8QSMbLbd24ERjgrFOUNZh9aFqJJGtncJExkYcnYTHXP9hAvhvmd13hwbIOMBzt/UADd1o5T2lClvJzl7L5VUdAc5f4uwC2Rqy+HvY6u51wKjeP1mneyl9+Pd3kmY85eze0qofNwk4uEkRCbkePsYfSUpZL9c5rmFPOO5/lkVGLZaHYPada5uPY5Fx5whutMmckLMnZ4XeTm9oHsVBqzZgIkihEf3794La5UBUlcOe6cIUyNNarQZZ38oIu3MiGMTvMvkad4K/qyPehavqJEPJf6xLPRfphuj6WGTUYdWzLRCxIoFjbv0ZD5/2Y/;
	25:DaqTOR1lD+y03dnm27hI2Gm+UBhiwmNBuZHC67vGRfpUZPAH+hj3hpMOyI0sjqSkA7kODtwZRpAVgmDYxyO/gn18Kc23FQGXsFGqhkAtG6M52iUUaSV8IWTLRLeErxfn190Iw1eurVVK3i4yR5xjqsYA1kHW4CVDez7mh8kLOznuVzWqjQ1Fapc9A4eNVjggat5W7btFJo5iSeQHEYI1YQS8ASqXJz6rf67I+5LItZf9c5dnILN6t4NYX8KfOO+FyQdb5eiiSfYX+yuZDmQFL/67uoMuOAH1x74WvYNrigR3xJ8FV8I68tpGF9Ccic1Onsr/aRC2eWgkLdRYcrJcoOqLfziNUPGuRnXynXopMvzntAEbhBcyj6lfPqQ/dHmwK8vAy8v+fUOTXmd5O6UdWg5rPUD9xxPSea24Q7/E158Sq+I5lZuw5D+oT8XfrJ6CpVl9eSKDFWuk1RWppSvGkA==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	31:cF3m0XsZzG5+mcfoFtdx2dU/7dgIY432mwiLZBhHryDoyHTnxGqeNRWJxnRBvlU/qGW4yOuLZmEeoFLnsD4/ZFc894a+hWIUREWMK5cOlMTDTswV1GyjNEl6rUsT8HPmcLww9RKzI+YkST66QR+zqiyqTvtHdWFScu+pcktK2jvSmkrHyUG6NuaQ04SucY+p05dwDpz8n2UahcoxgVLL+wfJEpZrCqpLgc5KurbSB9BB1M9AyaHYj+3Mq7fzbRVAgXnntF4jHShgBq7Cw2w+iA==
X-Microsoft-Antispam-PRVS: <CY1PR0301MB0907F0F5805620030A368C2EE9E10@CY1PR0301MB0907.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(5005006)(13024025)(13015025)(13017025)(13023025)(13018025)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6055026)(6096035)(20161123563025)(20161123559100)(20161123561025)(20161123565025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123556025);
	SRVR:CY1PR0301MB0907; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0907; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	4:9tTDlPwkM2EgoGrwkGoTrE8I1vLW783xhF5bQmspVqATWD+n1lx0qjmsdeG5MPaRuX2JfLCyyFS2RmjZeh/H+JXfKhYuqtgJWMnhc5SgxYYs53VQrhq+gdcfJlv4OwLM9bOSlp6J5mvQsTn9/GKw9jgB5+CIIqFxjpYX/NqyWw2/Ae2vmffCLHiRD69eTdkAGm6IVsLzC6IdsKGjNAXUTaKel8kMv/EOdnpxhOtAENcT2r60xCQB4abGvwLtVtBo3DjH2dICxzdyjcnKFFJ2U8cW09z3Pn6AjAnnNSQ5+QOfcrXuLyH4C68TcKJ6eOugJGE0vjiglxA5INnD5eogkRR2pWVJRNt3m9T7zSu2Yo4/TqCvwq1et9NLEgvXHPLEARDYCn507rmZz7MdM0lb6u8BvFU334Je/EjlXozWNxUjkAEnlmJMZ+yYLc2dd1YzCVQh6KIrOnEXgXePcCBdlI1cZdrpkH3rKef+3gQoaKC9pFVtl+Sxiz6f6WoV1c8l7IR1nLj0AAbYz+5PW95inTGCN//izeWf1yCzMtM4eevzwiSSrNEiPhjAg2d6u5sAyRCNIIGqLsz2oJX/Z/PMe6JSvDtGXYIuT3OzXOMYKB3LIBVaE8t+QnfWvpjMfUio+k4luSiV07ADwn7mNJ2MTkfnPvOAeGwC8KvdaTnCfPfo1Q+atziCBgmhT7OhvNNIoUbSLNrOM8OtDMh0TDGc4qv38yEpp/6dvfMLLRwOMdgd6dh9GstKqeLiMYgR583U58OCO1fltBdGb4Fop8OEu14HpxH7Q7eNgWN8PzY/Qa5mEeHh74Yi7n1BQ6gGoB+Lm3TRxqxL/yF+CjZ7OkkXxijrilcqf1PsP4bCKyV+933W53NoYqDw/gEa6jlvgLuaMDHj4yJeIGdMheXRoGAQFpnisk8y8U6bxImdFGxZT9Q=
X-Forefront-PRVS: 0308EE423E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0907;
	23:jQL3lcpNgLnSiI5zxVxYmb7TE77Au65voet3pKm?=
	=?us-ascii?Q?u7QddD03Ss/9r3bEod7ROeu3xWkV3I7PznR6ZMf/Mki4zke/2ywxoFeW9j8L?=
	=?us-ascii?Q?rirhIoRF4zUHIqxn6bPEThCCCaEmg5TsO87EwdWVCCzfnVm0b1a3IK9bMQQB?=
	=?us-ascii?Q?s6RU9xYmtcplrZSyRvePtS1iJZj9f+6RxpsyV7O9LmwUaLF3f1X0Z8/nL/Zy?=
	=?us-ascii?Q?efnkzj+TbFvcoPXAUOKrIrUNBoSatdpOXZ1bexdtQTPXJCOrSd5WORSDhqWm?=
	=?us-ascii?Q?4ERS2qf/FOHs9SPyW9X22YTP2dJsJEPGjgkRY5wQpHKKBit5y6kzFwWMm0qs?=
	=?us-ascii?Q?3T5FEMjSZXGbCRznTW/riJC0LThhd9CkO8BpEX8UXivlWUclvu8lRQwA3ebT?=
	=?us-ascii?Q?RZjPQvBhmD316MgJwNfgClFJk4patUxwqHtQHym8Wzzz0zsNvbxFhF5lE3Ib?=
	=?us-ascii?Q?xCE0rA1CWn8JvdsL1gEESkeUwMbKFBOFOq4QLDOmVqIzXFAFrV02OCd84GM+?=
	=?us-ascii?Q?RLg50pGqkBxIrxggfU39Os1IDpQRkslM7g0jQLibOhWdfq0CBNknC60g+ANz?=
	=?us-ascii?Q?xSKZ/eyJkPsnJU+52Y0oQvnzs4X4I7QeLxibJPkEXATg9EsvQOx1nbWoM3qz?=
	=?us-ascii?Q?hjDjMbEoW0p9m6kF1go/Y5U9ae1WJ5meryJ6kpmwAT0Eo+K5QO60tS1um9oJ?=
	=?us-ascii?Q?ddD/i7//NlDqLw4vGvZzrpnG+8t1lgk4sMhs6t27aSsBHgX9KGpN0qfUqWGd?=
	=?us-ascii?Q?ZmdF32//N3P1lOc6gycMOT/EfEbmhz1Z3HxZmVcuSPQKNL6jqFyOS8FYxMru?=
	=?us-ascii?Q?5R8nJ9JsK/JarKoZqmu3B9E3DVOu+/vbfuzyS0Y/x72dJ3TkK2ocJIaxA3uh?=
	=?us-ascii?Q?ZBaWtWnpSDpGWtcuMHWJfhE2TTcJhirck+4breFhKskpCSC2s017dSL0ZEaB?=
	=?us-ascii?Q?qXI2Y9Lx7TRANfPzlL4bV3XBAU7goaXGFED2U26K81IgHYHRt6JjIeCEXUAm?=
	=?us-ascii?Q?UJ+1Nm+XMaUqYBwXqfRlVFwVP0fQ27aSsiVBmlXQlcW5RASnrBPPEAlqg8sb?=
	=?us-ascii?Q?iGFgmA5CfXKCBEpi7EyO/9RbLXZKZALlMBrjktD7KmQ5Vr/GbtAb/7QXF2qo?=
	=?us-ascii?Q?3wGyr0LZdWCW4NI6/3X24tEyeI0xx51CPMrfCJllcl5VdHF4qcl6rVAs0VEX?=
	=?us-ascii?Q?3RPlGToIp9KBpA9s=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	6:A3Y+kypdDsfBpWAWQT81OmRW8Dt33uYsk7OCzn+5ERCvuC220mfwadWs2YQlB89QahFPXDd6q77VgrLYEwZ+rf0LOtnQEfaKewN2VKP2BApTeOpTCxuVLbMk+tkm+3RwhuQvwFjmsKN9XJOSlMKOYGRz2IvUaktVWMgcebguV8L/Jio6m42dCQPLj22vSSy2TgFdZ6/r/6d98j/QLQwEk05e33fdgACSfhqx6V0nmuZWruhO3yq3g2pDwU79qAW3OsANMdG7wfYiL44ykijnb48yeJn8mB7NHcuStJZh+48Xa3+ufKPGBqPpn2OsXQg5kGg37qu0ttS3LluZbGsf9gnu9r7qhkR6qiWItZtsBh4Onh3asNRKtVrLofZzcLcA59tBE1gmp9Vmmq0IDI93nSRprCks6Ey/fMbJR1JYSaHpMYAUKjnZOa99XoXfjq+nY7BILDNaOws99Fo7/HTSGiHu6x6lxbhJv11fehfL7mNghWNuwkYDCLD4vmQKn9Rw;
	5:JxAMmDdBGXEy8UP4rdRh10WY7+izEa+CzmVIaFSHbLE3H/c+XxW/6gDIkpXMpHTCkVjRxU4iY1Pk+zAUNGdcXRQ1iKAUcCbDEDiFTpOyjom8sh7RM5//u0ShXSwiX1NmaiBsJl85dEDwgrZK9QKiTT3+ukGxl7XUmI7SYAK3pzTJRBBV2ZMtp94w6DhFDrqe;
	24:ztT9OykMPaUzOyVUWqDg2yGd2Ri6lLVEswIRN/A5rtIvBwOudkmeX8Pg4gdXbqFleDHkcBY+YC2F8SbKO4IauEWLJbTuZbtjpF+toAm4LDc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0907;
	7:YPs4sWFl2NP/l9JZBBuyK0gwFWVLah6mHZTloxGnPfc6twvxR520QhdHv8WCsjCHvLJd60Vems6QFqYfYY//jPvclIMDl/qCDy1JQ/GdiIH0tdsBcqKHRLyHVQxWFIA7IhWTwbDZsAq+bPp5A60civDgS1gYNVpOvD6BCvUWjv3YSaOmqA0zIS/3iVfD/+xPSkFHdKeSkyEO6g2VmTcGT1FxoGJVmw/kOzh+YUXi+UxlvTLhv7TA6q+KiBiIXUrSXIGQ5jTuXr6k0Unx3g4Q2Op4B0br4HQoWG7/zudYu928/nq2nSZ1y6JsYBlbI7FlM5rz4R4L7PlznLUK5OhG0w==;
	23:rXGwW7l1NEp2ORu6IDDpvvrTMiENKigu2iE2+cTSriPhbZXL4yDJ9kkD6HUO2bYBfmAhxBXxYmzCfTb1CgsSxChEsVb6fuzd5uxUs4ZhPNg2A2Jmgntt+/2YJDZimzhc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 08:54:02.6117 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0907
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 0/6] Add patches for gstreamer1.0-plugins-bad V1.10.4
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
X-List-Received-Date: Mon, 15 May 2017 09:28:35 -0000
Content-Type: text/plain

-Add some enhancements for qmlglsrc

-Add configuration for enabling accurate seeks

-Add get track number media info API

-Add overlayvideorenderer video sink

-Fix gst-player failed to load external subtitle uri

-Fix memory leak when use a GValue in glupload


Yuqing Zhu (6):
  gstreamer1.0-plugins-bad: Add some enhancements for qmlglsrc
  gstreamer1.0-plugins-bad: Add configuration for enabling accurate
    seeks
  gstreamer1.0-plugins-bad: Add get track number media info API
  gstreamer1.0-plugins-bad: Add overlayvideorenderer video sink
  gstreamer1.0-plugins-bad: Fix gst-player failed to load external
    subtitle uri
  gstreamer1.0-plugins-bad: Fix memory leak when use a GValue in
    glupload

 ...2-qmlglsrc-some-enhancements-for-qmlglsrc.patch | 170 +++++++++++++++++++++
 ...configuration-for-enabling-accurate-seeks.patch | 148 ++++++++++++++++++
 ...layer-Add-get-track-number-media-info-API.patch | 126 +++++++++++++++
 ...layer-Add-overlayvideorenderer-video-sink.patch | 138 +++++++++++++++++
 ...fix-gst-player-failed-to-load-external-su.patch |  50 ++++++
 ...-glupload-fix-memory-leak-when-use-a-GVal.patch |  29 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   6 +
 7 files changed, 667 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch

-- 
1.9.1



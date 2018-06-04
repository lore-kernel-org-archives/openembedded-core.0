Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0084.outbound.protection.outlook.com [104.47.34.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2B75275438
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NgA62AZkhUWIBNZf6fA5eOT10YbAwtAgVvwrUI+R0nM=;
	b=TVyfg9nHVbb+Hl3C/OQCyS2O0OuMoFEdy8rnp+jgKBudcHsQJOBlBzoEe0ynjkpKbH+1kb92+H30eoSjd19pLuS/UEHpfDrkMWNJCSCrqOwqLO4Ql+eFtRsmv7w9Qs3uQCD8xhV7XR4w5K9FRel3qhx5KhVBhpfgMTaCqLgGFaA=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Mon, 4 Jun 2018 23:06:31 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 16:05:56 -0700
Message-Id: <20180604230602.8461-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR0201CA0027.namprd02.prod.outlook.com
	(2603:10b6:301:74::40) To DM5PR0102MB3416.prod.exchangelabs.com
	(2603:10b6:4:a0::17)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3416; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	3:IosMEbeAj9TWKKuiWml0r5pClAjUaW3Gsr5p6lCrMpvBLfDw51lezVs70l/07/p4vDYY1wHFiRBx5flLsSjrW8cYL3mCcQlaDIlIRX86m7RKBVOgJW+pxf6iA8+hM4GVGVQYdxq4dOyUtDT28rcFxloCdK6O5/FLyBXE+5Zdr2+uPg4g3ycocxdCt4/+NRvU1UhIxlubcFBrE4+RvfpDOIe8NE0wnfNjjCpunU206Ol4nnVJPHfaWwvDrEVUKdWd;
	25:RnwQJT+wUbcQDCCUmCJ1y52g7lizDdvdzmO/oMIQoZIofuTWKCSTuIX3vqBtJueWeR8lmApyDX+f/hQWvyjScJGCLOlMfOvzQqGQT71dHo4Xt/iv5u89ISkgQtWLtsWp3k+Sl3dmtRlxtAPxb5o91PS2Ywac3l5Rfd9qgUcT2Slg0YDQMLo6uO7FpFSt0CcYqHqgqbFzT7yy3qspQgkIO/vOW7BaMBkZz8QD7D9PdBMKcxyMIMjfwAyppIcNE97za4H1arqO/nYhmKX6PAuJA8wsgvqssGX/fvPQHmrnfUf6lpM6leUFfVe9YsDR0kY6097aReHFa5Q2AaLGdb8SAA==;
	31:2N9XLTIl/It23GaJ3Ce4JldsRbqoiDgu8Efno8NCqRnQuHu2kxtvMVzScmEVba0hV3mSofidqhwrGvyUrhIclEAFMo/HI11OnXh1M6Ju4S42OF9t5rEiWQ6agfMNGjP/AtM36RKfDkrsFz5GpvAcC2ddUMXA2ZhUc9KPl7bb4AKVSX3nY10QpK48OPue51t5wkMaBVUU3peHvxz5xmp7qEtloF5tX6X7gQmX7d7EP2E=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:DSJe+EXCbeRJy0Fm1U+U+7uIKnx6oOb+UsxS3uSbBZC5Mk/9in1depqP7gCkbQLZFj1TQFW9szVCg90B0ftSYvqHsO6HOtpnE8A6/2UeFHAuQDVVzMQckUuBOhMsJ5VBr3AkCL8j4LAUbJQ16OawakvYhfkw4MsWcd3Zb2RQy8liR7nz4RdjZ3mShHissS9VdWrfbpJiYGzmQFSE6mIyC91FSyJmOZ8CkObAETrsvWJ/M0C2pAEBz1MTbCQqpNL6z0jpxoHAl29yB79FW15iPDHtGistlU3k03PWEBW2PjH6HFm7kyRv/azc344OoGFoKGbuDorKiiy2Xaf8u3qh1e+PxxBJhSdz9UGqsK5+EZ+cfJLV6GeZmWBZfB0ehBf8/Zk58mTV3lM+AvwcrLbBOS9Fq02HMLzFlDbc88XHpuUOnEeQ0b7YkPCXTB9JU8EJ9FDjcDW61SUsd8P7SQHOgGX9CBMMB7ZvDU7wYWcnq+iDGEN5xSTwgWWntZ1TnCpd;
	4:TktT20r0+SiOlSmdnRnHU5hG8PIaHV7EtlNWYC6xHxnjoX/JPNUj94sqdnAiLQZ5t2lrAKUGhI0SfdMiL4iptUj5gMlrVfiCjHcjr45yg3S1qfC4jzc4krXzqSFZDIaOBFOrzuMOora64SPrqzdGkv4OSPbzjnGg7m56xV8XwH1JgC3fte73m4gt64Aw7KoF1J1VIECbZStzSv8SVM+Ka57y4ZRNmP+lH+WNdI2uIcLB565L2bQNfXjDcj3ys2rYHt+p33DMD2W/kwXikSdIrEjzSJsDjf3F4J4emauz/BJpUaRCDL6IBE8R1r938TKB
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3416D3E97CCFD3AD6155CB48AB670@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(376002)(39850400004)(346002)(396003)(189003)(199004)(39060400002)(81166006)(81156014)(4326008)(54906003)(97736004)(8936002)(5660300001)(2361001)(6306002)(53936002)(50226002)(2616005)(50466002)(16586007)(6486002)(2351001)(48376002)(476003)(186003)(956004)(486006)(47776003)(316002)(26005)(51416003)(386003)(59450400001)(3846002)(6666003)(7736002)(2906002)(16526019)(36756003)(6916009)(305945005)(68736007)(1076002)(66066001)(106356001)(966005)(107886003)(86362001)(8676002)(7696005)(25786009)(52116002)(105586002)(6116002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0102MB3416;
	23:6pOttEywjxxphvvBYXDMvxSuChrRtYg86hLQtm8?=
	=?us-ascii?Q?AIEjvT9+bOLfa5ItFmd9QJbOYvJJDey8+AAZ1sun0Ng/1C93r4ihIrpVv+WM?=
	=?us-ascii?Q?tYGuM3Q8a8/og4KCZe5mdLXjbsc36xFUyAtZ/Q0dAq438ckZBhNh/I1NWNLV?=
	=?us-ascii?Q?FG8c+zAA/RGwDTj1ELweTRkuUS1kh6eXZREEqHJnHgkjWlYLwb7P2uYbS6tg?=
	=?us-ascii?Q?E/+S78uGlIfQtbcMPKpxQYBCaeGN73FuB8E4VRsbo1mdltoVac09JmXgOqc+?=
	=?us-ascii?Q?DhaNDsXjq/NV2So2m1gPvcUrlP0WPJ/xBdN74lKb8QAjkfBnkdhAvaxOA0SH?=
	=?us-ascii?Q?mE95jOXzWKV/qx/CexOtW9A5kmTj8CNm1wGcQSmyx3OuvbTcLZYWUZydU49w?=
	=?us-ascii?Q?QzbWMx5YP6Qk5k4VyYPMJOtKu8qOAveecWqVtlNlnsvDklX3vzGFn8ZrzUdT?=
	=?us-ascii?Q?HvHn8YqlD+RmOU7qoApWMuxLOYPCw29Q0Gu6X7uWs0VOrm9A8SfzzvAzAB7t?=
	=?us-ascii?Q?8hi6u8tEbaP9P1x7xoIZKjDtz2/zba7eqPBX/y8UZ1HViyNg204bOX/D8Vej?=
	=?us-ascii?Q?qXe8Gh4Ft7B/f2pdP03aBSQQhoDhH8zAvuwwVE3DlxAZeKtp+4TnxYdacho3?=
	=?us-ascii?Q?DUOLiRY28vEKiEbFkSrjDOdO6TMlFFMiU03kH0rlK2s+VlkyMRq5DFAhtaWE?=
	=?us-ascii?Q?Ny5Z5mAXQyoGabdy9vIv5ZbVfr34crx10xtugYryPna588yudfCZKuUyr+iO?=
	=?us-ascii?Q?G3tvVaCmcGSQ/OA2Pt2WpV93SQv/xJguLBWmPCN8L3Hdb/PCqQmVtoQRlIc9?=
	=?us-ascii?Q?rAx3RWh9x/kBIXVIqxzQg79IwOONbJk7x0mqVdzdMikg1b2vmVmW+rs/c0Ae?=
	=?us-ascii?Q?WgiLtjVSeXuUhcXns60ubp4OdfGj/eRr7tyjV9cacXVsDXRY7BLlUkd6T8Qz?=
	=?us-ascii?Q?rkIAB9wgq2W7Q+TgE08YDwIoFVQB93Qd0jnat8w1gafb+5yHgm+zkVCnfYPQ?=
	=?us-ascii?Q?YrdSeCpUvs5hZI0cg4CTOGM1+n4VyBGub+T+sGd7iZ5h/r/0Ae/3UB2eLYrR?=
	=?us-ascii?Q?CoDJzdBH3gAh/2LUtoRdUqkzlZlKvq/1PbShPcGhP95bA0b7elZe6fC+4Bpc?=
	=?us-ascii?Q?Cddk7TdJv5++euptW9hDyeWjWcJkeU1h+CMoZeLB0sq7baCKozFVpRdb955r?=
	=?us-ascii?Q?ISN7WwOuSgmlynQeZ8fVa55rCgrYko2EDZ/Ta8z/kh3LQEODLs0Ce9pwvPg0?=
	=?us-ascii?Q?Ij1Ugg1DFtucY/GF94/JK2lvrA0L5XHTKxmJT5qMB4rmwQyqIZYduo2xpJGB?=
	=?us-ascii?Q?Etg=3D=3D?=
X-Microsoft-Antispam-Message-Info: +1YcHDVrECMkCLgZ5FwDj9ElYcIImOFYa5mr5ZOQ2P3rs2cV3ztLgBpHIetyQsBF4nxYXsTgo86Mim0S/2MeKmTLysrY1qvgx90i484/h+c75TxHCgpcIe4yHgd5JZfeUluesIIr7m+4eXjiWo7ESoHgbRtjNSPav6JBg3FiG0/eaF+gOk4DGkQvHXUoush+
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:Fwhi/MmytvVixswOwiDu/obKieVrpto13SoksvGFtmWrgHMmaZP7Jlwgveit1+PfiYnRnaNTH7gE4ZX3HwBna6VZYHq7aQH2etjOC24cJM36eXs/Tj7WfoE+IWZ3R4ZlWcp+172+YCgKHrLMEgrHJ5DQtlGgDt10RCV+9dQAu/lXLkHo7JqoLpr/UdneNXKViBNseg4m0lCn6Od79FrI9AjEV86OndWzRS272NGtSuGFBIPFVl62j22wCxBfQwmgE+e0GoTerihmNxeqqY4gwV8lZlRuhy9MS3/h1c52IRcrYFF7gKduCwV71TPaJbNP2yT2VWMdvfdmrxevh6RvNp/jc4S540LZaCpTuRqWTwYO+3sHWGwSWieNppzFdRuHiQN6mJNOw4kbChCH/fU7tjmNef+rcK5AuMfXqUiBZh0CZ+2wCetyB1tve+cVFAWNPNMwAjuscDPcbjVY2b+5Zw==;
	5:rGZUZc0Mgi9NW0Lux0HH5F7A1rpNr07wYe91f7gwYIu5X4oVosPOIZ3mmI64eE4sFZfLJoPc30t0ihl1uMza0gy+PZ7vx23qpbb8tEAJcjkqcI5VfCGVxGG8ydWaQm73I/f5XuTMjLRrb9JCeaGitoffKL+4uLyod7p+OdA/Ntk=;
	24:dIzBcdrFG4wdn/g6pdjOPt/a5gKUnLjQ2jeL44LRZukJahD/i1cHj4RvAUcMMYisOKWM5vm3a8XyFBXfxGqcPFZ7aqt05YrBQLpBEKeSRJA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:JKsfy/WNMDpQJNNGtKQKDtFfBD97e0ClaoZ4oD1SsyteiSoWWD3DHT+tUNGfsLQgasi9X/NDMh+e4RbUH85yUkZ0akEeGMX3Jtw8SCgciTE09m+Uu8heXgxCOrOEndGzs0Jfwvsp39sq9SfaSdqQK4DJFBZFsyb8sXtCkNqnkDpZORR9Q9TeTJRmFxY84f9e5cT9+UKBJIrviZzCye8e4F08kryXqLW8UEeKWJ8d3l+XOTFiqvr3IbOeT0uz28aG
X-MS-Office365-Filtering-Correlation-Id: be7ab54f-db85-4221-053c-08d5ca6fcff4
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 23:06:31.9277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7ab54f-db85-4221-053c-08d5ca6fcff4
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Subject: [PATCH v3 0/6] meson: implement nativesdk support
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
X-List-Received-Date: Mon, 04 Jun 2018 23:06:32 -0000
Content-Type: text/plain

This patch series implements nativesdk support fer meson. In order to do so, it
adds a few features to the toolchain-shar-extract functionality, which enables
a script to run prior to the SDK being extracted. This is important because the
meson.cross file (which meson uses to find its cross toolchain) allows for only
absolute paths. Thus, it is important to customize those paths to point to the
SDK at SDK extraction time. For comparison, cmake did not need this
functionality because it supports referencing environment variables in the
toolchain file, so we can just reference the SDK root environment variables.
The meson maintainers did not want to take that approach, so this seemed like
the best option.

If curious, see the following threads for more background information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146210.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146225.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146236.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146241.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146261.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146262.html

v3:
- Implement review feedback from Joshua Watt (thanks!).
v2:
- Switch to new version of patches to fix exe wrappers, as upstream tweaked the
  previous patch.

Martin Kelly (6):
  toolchain-scripts: retab file
  toolchain-scripts: allow non-sh post-relocate
  toolchain-scripts: print post-relocate error
  toolchain-scripts: pass env to post-relocate
  meson: handle exe wrappers
  meson: enable nativesdk

 meta/classes/toolchain-scripts.bbclass             |  48 +-
 meta/recipes-core/meta/meta-environment.bb         |   2 +-
 meta/recipes-devtools/meson/meson.inc              |  22 +
 ...0004-Prettifying-some-output-with-pathlib.patch | 188 +++++
 ...on-command-to-use-when-we-know-what-it-is.patch | 851 +++++++++++++++++++++
 meta/recipes-devtools/meson/meson/meson-setup.py   |  62 ++
 meta/recipes-devtools/meson/meson/meson-wrapper    |  14 +
 meta/recipes-devtools/meson/meson_0.46.1.bb        |  20 +-
 .../meson/nativesdk-meson_0.46.1.bb                |  74 ++
 9 files changed, 1247 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson.inc
 create mode 100644 meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch
 create mode 100755 meta/recipes-devtools/meson/meson/meson-setup.py
 create mode 100755 meta/recipes-devtools/meson/meson/meson-wrapper
 create mode 100644 meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb

-- 
2.11.0



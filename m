Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0087.outbound.protection.outlook.com [104.47.32.87])
	by mail.openembedded.org (Postfix) with ESMTP id 47EE075053
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=biTkNBcwCATYVV7dstyCGMAnB8Is+AIJCUBKnc+HrXg=;
	b=zEiX7YWqKngQNp6j2mpWHSpqexE3IeVy/8oR338xlmmln1sNj9I1sVv7IgUJyCzZ46aYe/CV1qqqpmLxq5leGri33T/9cMuOA6f1Sp6yRA0GlOf+RxLaXxYUL2AuB2AOXTGE/tOrPuPkXUdIoZRosDYM9GahR8bp/scUiqK4p8c=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:13 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:33 -0700
Message-Id: <20180601210240.14969-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR1001CA0028.namprd10.prod.outlook.com
	(2603:10b6:301:2a::41) To MW2PR0102MB3417.prod.exchangelabs.com
	(2603:10b6:302:3::10)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3417; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	3:8gZxQBeu+A39HT+3LcKhBHdd2B5sOuf9SykPIqLtKH1aHMsc/R+yiD+rHZcvDSzs4bqhos63hh2LprmBGuI2Vjt9wTX/lyuLpsK+GOBkifM0D3KduKKV45gjUwnCbh5qUbAJ4Sv0d0EU6mgYsgg8osN6G5dRO4YFsEO1fCnETvEQFTtptcJYu4CMwdfNSm2hymi4qcslF+kuGdsZ+m3Bm8SbGNNelSr5X3+24zmIfshw8q79wIIR0dhafyrB0+Ey;
	25:0bq+7xTB9n3mUYs3nWEujRIOf1Pp+fzCxTOvclAe4UxTo4GyN7+pD14Ybrzb4GfCT+lUZzoo8SpekssTMJ1/SHsDuZEI2sQuR7DYZz2K8nYFUH5gbu0r4ar3ETbk1kArM0WgDbJgyhHzB2h3Yg7VqS47WKS0F55g667xzBpvclv/7Kw9vSrtvrbdRFMDez3tBIGNevaZX05jY8m/iCQS5G9OwQVXorUog8AnHn79PJm51xb4W+TR6yrtqq6hUHGjb114wfm6YSgPeNWCtRSOplrqvFIW2ypHScuxyXT6Pt1AuTMf71pvC2tLEYO4xZ66VKka07QZcARXyLiit56cxw==;
	31:Ga4ctwKJjykrXdILaRUWWOfaU4B27NqFFI1TiwMXyh6qYMH/4TOZL51RX3vNVFU1pm/Afw28R+2TaKdvlWgb4VtfKDsAZ7rD8SOv4VgywUlVV8vRgO1N4KmnVAz8HGzn5Stm/NVGQXOdLiVa+7/Rq39aTxWFb1nFoGH6bT5BrAKBbu71Kko/u78T1g5hHPeBukG01O+x/J4bsTvGOsahoxW9vfZ5WD+EFqG52Pmq5hg=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:GbIhs6Kd+XUKS68bULYRHx/fTe/nz2yfI12i2GK0qO5Jx9crkotLXVAZW/d0OMi/Ezt/zsm/zSDsGDalLKm6YvAV9IJYCgF/9ksIygEq29mMs6fyKcX9FhFY/+lY35csUJWBMZHgPCXsgpGXvXY6K04zlSsEiZFniCQUDtHDak1BhWP7zckRlGH6zhUmBGwYeklN5071gO6sq/ZqX/0pSBasN745Z6KP+XMY9A75Uvd1WzpM7fdvqgFoijLS5csDkKtPnSBon3ATupiX8zr4JPuQpQ7HWeoZLUtm9SbA7Ymn3pI57W1wEWP4+kpqjuxfgW/G0Wc1LxYaOwQOu2ONKYQFbYQz1zetrBDSz+po2MaBaX+mhJhkNQ0EQ1B7/JriGMP2h0E4yfqlLRucJjUYHFIvXSOu6pig9EsV7BNofdtcaZkf+9rEKid4l7D7TA8MqlPtkKbwfBF6ag5mlKad3Zj7DZI4/Lak4yTSER8YOhQLiOOIHH0949j4rM3M24eH;
	4:fugvYIXBkxN77LQtAcf6bnXmcoiwz5T4pMGw7+mMREVZ0UfYzaccDKkL0o45EkqDL43/nmkaPmPtVDLz3w2dLzivHjBp/A20LNyd/JPlO7ihgdxZZonIbbBN2bNSTPFnrBwLE9ajjBFqdTgXQs4WATBIDXoyuAxPJM/VPszBUIXE7NOGBeIpweuvLTyv7hXbTA0DZ8GVwdFgti3VP7xoGF3EFqiK88Eh2qBnWwz6NE4G/vLhyHMR7VjTVyW6HSIiLcN1D6yDnhN8mRvnOG+GEUuOBtqrMPAPMUU5TRqAI9SzRQ1L9+nqpgZPh5EngJQs
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3417B7AED4456C8D519AA177AB620@MW2PR0102MB3417.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3417; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3417; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39850400004)(366004)(199004)(189003)(186003)(68736007)(6486002)(86362001)(66066001)(106356001)(105586002)(47776003)(7696005)(51416003)(52116002)(26005)(81166006)(8676002)(16526019)(7736002)(305945005)(50226002)(8936002)(486006)(2906002)(59450400001)(956004)(476003)(2616005)(81156014)(386003)(25786009)(39060400002)(2351001)(48376002)(2361001)(4326008)(3846002)(6116002)(1076002)(53936002)(6916009)(6666003)(966005)(107886003)(5660300001)(6306002)(478600001)(16586007)(316002)(54906003)(36756003)(97736004)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3417;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3417;
	23:WUfk1YirpUFES+OfWLIbP0kwDuS1oSAA93JLhSV?=
	=?us-ascii?Q?+p+EphGIOKLYiZyBfjBmIsdjEgAv063SruwZSXZjdaaRH9DZSP0Gg8NQR/jP?=
	=?us-ascii?Q?rtGSQvGu8cHB6sgcsCEF0bUTlQ+qe1LlZdW4aOo112Fd++E8mj8pxtZeFeSu?=
	=?us-ascii?Q?lGcFyrlyhSneUzfv/JIG4nDCbvax8fPqK3b+DlIYSxRkG07YMzqIFyEfWumG?=
	=?us-ascii?Q?GFpytTg57WD2AFvqoR0Ir/fjYqiviYSSmWzBR44BGVX/pN4Vm8zil9eEYb/W?=
	=?us-ascii?Q?rB/6fjt35eXWNdzcbDa6gnmAc1dFRpTzIoVyw2KPzi161vSO6gLN326/n0jP?=
	=?us-ascii?Q?TYkXp06YqjNsSr3cN5uhB38JM755JhyCFTs9bzde30RTIXhg50OFeUWSOe4o?=
	=?us-ascii?Q?05GkFxLhkuJQ6t9XUJKuOEvTk1L6IxXZdIZLYJr5VC7sdtzvzdKF5atcURdr?=
	=?us-ascii?Q?BrUDTnJdbcyl7TH9E0TGA0SGUBjICK4MDpFtpVB9fKbil/11/koNm6dYJMv7?=
	=?us-ascii?Q?SuYN1uMhLBMvgDfkd80gQXp4Rb0enB/xlBdHZkPe7DE84m+umweNxipJ7ywC?=
	=?us-ascii?Q?owKZl8dZV/Ioljy036nOTOB2aF1HoDxm/P4xol2G5xecLf3kNzLT+RYBrKPG?=
	=?us-ascii?Q?kkxVh2m7Q5usTcASkvXYIvc9zN7aX9PORuUZR2+OnpN13xbUFCME9bj+co4j?=
	=?us-ascii?Q?wPNtGb7TA+hNDKOrwopUe+XBfxg52MPaRIwQ9CunewfymA2Bj9RnzdSZVYsq?=
	=?us-ascii?Q?djGY0BAq6w38Qkx0e40e820z0Ea6ODtnbdyFArb75/4/kjgNJuFS0Cp4O8Ww?=
	=?us-ascii?Q?CnL7TtxxBwSrGcJQ+3mqs0IlESKxO5XdxGrR4xiQ6Cd9Cb1pk6vL8WIJ3dQe?=
	=?us-ascii?Q?C0qIa0UW3UlZrWe9tf8YCTfBOt7d9ck/L+b550+UDaIgS4uqUDEkRjMm7O+s?=
	=?us-ascii?Q?TQX6b+/kJ6CQ050VtkbC1T+2MEZfzTGKrQqyicCslmfm9TID6nhqpFKj9x+1?=
	=?us-ascii?Q?YYgTocUTy0a9fhJhVJQqMUFd8u57C1eVEVaGLHbnC49DEyEfSQhcEbbYb4pU?=
	=?us-ascii?Q?bETdGzmq+e+CwgpI5Q/yX3flhiJtL7u8cK1QZuZQatXLUR0ZFU/sZgV21q9s?=
	=?us-ascii?Q?1QY7Vjz02UuBBa33xek04xSy/97GzZe7ttNcy2AYJaMKawR31FgzZXPlFyYh?=
	=?us-ascii?Q?+RqQTnL6LY39sVjwtrP3M0mAuntBWuEkmXcTMb7ir/Xa8afTr0tcxNBZ8dc/?=
	=?us-ascii?Q?dACkGQvDeKCGf2sAiAx35jsrBAFoehLJnN9xkHYen4AQnDG6DiCB1v1wlRAY?=
	=?us-ascii?Q?xWw=3D=3D?=
X-Microsoft-Antispam-Message-Info: j7DjPBipbRqJVVP0HPW2/AIeu/PzdAzEK0MRKhoETvdM/DDoDgXme/dc1ocxG4i/ulhrpQHZs1yAubkLDKKanLsPiq66JQxrk90eCfqx+pb8IkA2mKQHCWCzFWs9cjPr6Ive4AyIH7dheQRwuEScNz6cqhqePvl1wnZLLrKBDhEFZnicqI9CapuSYt3/W8+0
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:LbsOagOE2pxJR+vk4iSJL2QFHKAT8l02p4tOpOAFjbEjrn6M+60UxfqoPwjb6Flr8rL5g4DCRigF1Dat9gs9e01l4ZzO8SOW1fSLmL5W0OXVyg2R78LZ6xthWJqETIK4IjCs8Wkm0Riow7Pzzj8riXDFnNSjpO3F3SbeNCnDf31MPAlQlK12483Y1wlOYtN8HxI3Uqfcf7MeOFZYyZAT8S+ICCcDYb7EMcdgkcZUAqKmWF1U0zX5Vm5nS+LRL/hBl2M86gZ6QJ2HNYpXAB1wBUm5wmRWO6WNV4f5UNZsNFwtT59AlSdecI7xZNoZQqqMhUZUzxzUhyx5wRC59Wi/BPX9swHeN4uGw4wB4s2eY2dZbwd4htdKW40lvdWQILQTKG79bHXKSeSujlmGGYDHoYCj9Wt563HFlfFq3YwQzO7XBisES+z1GiE3MoRQvFDFQlwjaErLo4P4CyfvDamb+A==;
	5:eRbDhyoONk+W52udDuqqr4VH+MK8aaiOBHM1phAyTVspxxELuHbVrvQ23HDL7s9vyotkbWMnt5M3OKwDHUrXJFMOf2IVBW919PEnP0Suz0tkEQYaf207W9yhzANDs1Sn+ajnL5TOQKbVNq5EYiwVesjBfyuunYv1u908gITINy8=;
	24:3cjyeqXceA24ddeWquGGvZ/jYNrtIzSCzEhGQdl8j2bvQfGSONIxF3Z4c5NzcnULfuI+lecM7vtqpETtSYl+PNfHFL1XrpCrEeIh3XsRo3E=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:TLNj1nbB1zB9gEjxx1iJQaoRrVWv94+nLLFfAqZoEFc6hNpi01QUOAdzixjyG3jVKssrwl6xs2uVlNiFx/hXp0Fit9Ww+65F1/+XCFRbDisZ7TBhIjijMN+8LWMEhjfythOSep9yr7qPhywf4OnCDCtRspKCWzOgpwN7EBTO21ES7th/L0T9dhaUNbX6iJA0nVeGId4ZrfZFg88gZGweIQYdxaQlbZckeyOnVGRSOI8/fpRe4KcSsDn0qpKiuq/5
X-MS-Office365-Filtering-Correlation-Id: 26e0d107-9d17-4053-33c8-08d5c8031708
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:13.9195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e0d107-9d17-4053-33c8-08d5c8031708
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 0/7] meson: implement nativesdk support
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
X-List-Received-Date: Fri, 01 Jun 2018 21:03:14 -0000
Content-Type: text/plain

This patch series implements nativesdk support fer meson. In order to do so, it
adds a few features to the toolchain-shar-extract functionality, which enables a
script to run prior to the SDK being extracted. This is important because the
meson.cross file (which meson uses to find its cross toolchain) allows for only
absolute paths. Thus, it is important to customize those paths to point to the
SDK at SDK extraction time. For comparison, cmake did not need this
functionality because it supports referencing environment variables in the
toolchain file, so we can just reference the SDK root environment variables. The
meson maintainers did not want to take that approach, so this seemed like the
best option.

If curious, see the following threads for more background information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146210.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146225.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146236.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146241.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146261.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146262.html

v2:
- Switch to new version of patches to fix exe wrappers, as upstream tweaked the
  previous patch.

Martin Kelly (7):
  meson.bbclass: refactor native override
  nativesdk-python*: suppress user site dirs
  toolchain-shar-extract: allow non-sh post-relocate
  toolchain-shar-extract: print post-relocate error
  toolchain-shar-extract: pass env to post-relocate
  meson: handle exe wrappers
  meson: enable nativesdk

 meta/classes/meson.bbclass                         |  17 +-
 meta/classes/toolchain-scripts.bbclass             |  24 +-
 meta/recipes-core/meta/meta-environment.bb         |   5 +-
 meta/recipes-devtools/meson/meson.inc              |  22 +
 ...0004-Prettifying-some-output-with-pathlib.patch | 188 +++++
 ...on-command-to-use-when-we-know-what-it-is.patch | 851 +++++++++++++++++++++
 meta/recipes-devtools/meson/meson/meson-setup.py   |  62 ++
 meta/recipes-devtools/meson/meson/meson-wrapper    |  14 +
 meta/recipes-devtools/meson/meson_0.46.1.bb        |  20 +-
 .../meson/nativesdk-meson_0.46.1.bb                |  74 ++
 .../python/python-scons-native_3.0.1.bb            |   2 +-
 meta/recipes-devtools/python/python3_3.5.5.bb      |   2 +-
 meta/recipes-devtools/python/python_2.7.14.bb      |   2 +-
 13 files changed, 1244 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson.inc
 create mode 100644 meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch
 create mode 100755 meta/recipes-devtools/meson/meson/meson-setup.py
 create mode 100755 meta/recipes-devtools/meson/meson/meson-wrapper
 create mode 100644 meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb

-- 
2.11.0



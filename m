Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 3684 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 May 2018 00:48:21 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0068.outbound.protection.outlook.com [104.47.40.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57B4674616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 00:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GxWGueJ/obULPVmnkQOzKrC0LZbue7iJWXwhkWGVPJI=;
	b=OGnXBna2RZnzSmTHtvXqKvUsICbqgCP/gIKaSr2ojf4TIh77K9DWh0y11RKiTnQ3wSAjR3dfUOQm7dFXUcZmWgmrweN6PChuDMjsnMSm+HInJ3uInVvjtrThe9gUuxPi1BZi+PZEF0ce4AtvuE+D0Ea/DRvH7Vqwewz1QLPTQYc=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:35 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:00 -0700
Message-Id: <20180530231407.19759-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR15CA0072.namprd15.prod.outlook.com
	(2603:10b6:301:4c::34) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:PPAHHjGIyi7J8slY+8GOVfUYZM55b4+xM/7CzNWkF6npSAdpfA5cFeMaoxocDY0VxyLurP/QmpBd5c7qokJKdd1itOG67KJUwU9UmZRucS/WQHEXOtYmy7RLgX5vbggnjguSnL46RnCnr86EKK8wt9ZBYlXVUrxGsDSlwdf4Ih5UGMHzY8RuaKqk/u3Gi4/bFFr5lswEfC/eUclmp6vu+LP4P5F8Q+t2cLWydnrb+GVNX0LGsKm13fAIRHF/qXus;
	25:mB4UYqgwXl5uI+bDY2BFhTQpVzkfjoseC31vrEwfDMe90bJVo4jBrxwDFp7UG1lgPrYPTy6iFJ5yhRafTJqXP7ern7gryyIRanTADhZX+xV2VytwW8DXpIXtzP9cUHQw4grxqS0NHwQi/oyIi2V7AxnK1AWCpRb4xxvhe/wYjFcbXnTOtN8iP3N9XcvK2Rn0pClJKR3FJjAtg0hXMlr9iQzYkLQ9Vdk9JnBiSB57VXTeDgAoNEoQ0VjUdmR3rUiP6tg3DO/4/9hF8Kpm1pHJYC2W4ydtINMjfKr/f6cCPyTI+nn89X7Zw59sJAfs7k/3RRPhkaki1GBDUdJsBoEMXg==;
	31:+WdNK1sIr8uqOPRHsaDnGKfoBYDv1bIQ87oWfI/hFkOr4gJTnbdthbBmQ9Fp3R+m3zA6MZ13DuVsYHpTmrv6XyYk3tdWZIaqn6rmMwMd7Z/TjFCFkzVpwKxxS+jzOTsE4axFshM+K6SvT7UVNnXbrRqu8Kuu/YGOBJBAUIxUDm6hmwewnZbob+eky7aTPIMcCpf0I6aVEku6ZaP8qkpV1hA2elufma09djTms4xOkSQ=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:TouqDxQvgU1yj/ZR4zkUAfO6GDQZjll59+LtnUxBbjfqKMW6hi3d18aWscTPzfW8Ry9guBJv3fonB+pvS7gKYma0EMUO7REtovDSHtIlRz+jpv+IxIJY2AJ/AVwO2eHLUUzwpbseejSQAxgoMWY/OL+Ugm7Iez4Zhbsqf8Sm+bptkNLPh9d3VRH+Kr+72DAVk6xa0vghLSvgzqV0grV/Kuj2h/YspVf/CdLmd00Ot39dOHYVbm0eVyik+NtvJNwLycDjLvL6fkeYFkAtw4t8OC7WtCmU6Aqdj1AK4161KezFN4+BeVAdRp+bjWr4LLT3Oh1MC6zdrabv+h4aSCU7mTolG3bHTNMZmekaoqt0oN6BXwqJZYFiH6NbobMB2zfNavo722kR74qQSX5hrIw0td9NyTP3159XO3OU1dHlCtgpfC//6wjtkjnHPf268pXq1vT+nelfocWANtoHl4EEz7u/JfKTLceZBZxF8/qGEKgN6qAhYaPyiQmxRbcNC6h0;
	4:fUZab7Z4KkObppi61Ww2dzjSzbf1iQP41Kf7u2HyY90/pbT+KHFXbEBqhBWEYUPZ+GbzyJoJdPbqWFQ2XNO61nCYB9lNbf6AKZ8GkgNIbBkTBdlKhc3SSj7BN9qNdC7D3xv4ArSXOEvt/9RC5la7LRrdAFXSlX2wsK+sbsUijI+44bmbSGO3NR0yqZd9AUeEyoPOT7+kKfFU3LYagTfqnbAwyV8kFlbthYfQHRDcRBSnjy+PGFWOismOtxDh5hBTSl6xWdiq+AyY/LKDmMojMJiPjWu79B9S52VT1UEhwZC71Mx7xpuaGOQJnSA/gLc0
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34195AB385CFB27257331207AB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(199004)(189003)(59450400001)(1076002)(486006)(36756003)(16526019)(966005)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(6666003)(107886003)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(6306002)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(106356001)(105586002)(97736004)(2351001)(2361001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:qikWya7OElP+kkGhICe5VWSyBg+6t8NZ4zJamX7?=
	=?us-ascii?Q?7CW7qyQxM/OAu9Kxoxisy33Y/vWRyMGUO4h2LBe5zGoFgRg9//vHbi87rbII?=
	=?us-ascii?Q?ojU+6apEfXOix0NTeMPcmeXKQzCSxsT95j+j7KOwF8ZrCNoBOoY8zAzG5LCu?=
	=?us-ascii?Q?2rfSGeK5gdKV3AnuXFAkc26mW1na/0g6mRaomfkKytL9ntK19XILei/Uq0RG?=
	=?us-ascii?Q?VriiMPYAYo2jDOEkLJ+TFLa559leQMcD1MfrcbU05/K0L451LWUeNcVuyJ1T?=
	=?us-ascii?Q?j8fDfGSdiR8qNRdZf+siF4C5cdhtwYWSwbuQDEI/EmRPFjcsD1n+clvOW/oE?=
	=?us-ascii?Q?AiQNzwBms8EoUwlqB3e4FssKWTuNIJCrq4KxumHbs2CX+iK3mGMOyRJTRYYn?=
	=?us-ascii?Q?4aTJjJY+/fi7bt2TSkk709eXNO6xtNWMOtStkeVtgS3FaiGSJmhMk5fi4zcT?=
	=?us-ascii?Q?685Po9rFZy2TDvP/IYSnva5KiqG7RVgkPyUR55aLgqtR980Qm4kJHkY7Hkps?=
	=?us-ascii?Q?VU3MY035Zmv4rsXaXR3HLDqrr0IJ8p2k9ZyyuFToe2srL059IQzBZWabBBGU?=
	=?us-ascii?Q?qkOBLvW9dCjtuzI6Uct2I6b+8KhG63ulWmQcJ9Ijr+ka6VP+ViH8jYHhH8gC?=
	=?us-ascii?Q?vl+ge132OJPgIPDMA56w9OO0UR5KO9V9xRZukAHUxESO3eT1EDIKB4UIVZdJ?=
	=?us-ascii?Q?X4idILFN6i+BoVHAdc7gwtGAB33b+sE9MdQicREr4HwSESOsKRNlpjjOoNHG?=
	=?us-ascii?Q?iQtnS7XbgkfaohWQKY7XhZAgsbf6aM1ZKglghLoeh32pDssoWFis9/UY5WxS?=
	=?us-ascii?Q?rVb6Dz5nhCAiP2Ei9DBYWe8HSHrtuojmOgVaJ5uUJu0qwbAFLs8ZjHhOx0Ac?=
	=?us-ascii?Q?aBg2uWpH7w1jmkDoUPE8lIG7qvxEc7PsSrj69V3/NnYw64OvtD0SZZv/UiRL?=
	=?us-ascii?Q?RmY+UuudelmlRkqFBi4k6p0UXdBXQWUnh7Dd9Brvh0RGYJHnGrIzGHk6aC+8?=
	=?us-ascii?Q?f0eBRF+1OPD2vUcHYb1iwSyf2E/EGMFRkdAePQdTQirF1M4991+/Tes2gHsl?=
	=?us-ascii?Q?o8m8ULW/gbbPItFx+dLab+e8DDmlHl6RDZgyNwp66tkLimdRoYGkPolFsb26?=
	=?us-ascii?Q?6rL7HC5BOq1/ilJ5AhrArVx5AGJ/SGuiPCUw9Y2/7VMWllSJdiIjhzcGXkYT?=
	=?us-ascii?Q?Zpe/nGglTgJuKpI4K3KoUx/mkfv4uXU8k8gi8QgG22DPUTwYn96OQVUPUIqT?=
	=?us-ascii?Q?s7nBgHHXkZzSa7SBnxYA7qTN7/+xXbetxXaXQ3eFMoImgW0NG2x35V4CXb0R?=
	=?us-ascii?Q?saQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: ohPI/Cq8vPA5sMlF0k8sbeKzdfb+Jf9hynvCyCSSSVDDM75kpHSXj9dePUq/ZS6l/+ISX/1Q0yAM8GAPZv3HtATQRYxhs9JF63G4jyPD46h5/jieMfad2z9oJQHuVUrOBTvV6x0Snd9jEHW/c75BOPCCxK2hssWdYcyYzvtHwc6iebyfv29NwrsPZHw09T0S
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:cOm6BtZXXTr/jbJTNix2FsoLrMto38QxGTLU4NlzwtKbsggyWPplIPAgJmESB1a6t0l/xSLQ3R9QxgiYIyWUgkQ5/9+5vgV8eyb/HlpJj1oRGG9nJ+Y4nUzswUjlzrB6milhHQlGRG2zXmrvom3lm11IfJzS1dln0pX4fv4ALg4jUeyiqwXh1N3hiWRGqGunkELCPD8tKiElTJGAAPx2Zmin3wdsNMZQW7MDNP+CT57fwoO67cD4EVNefkZOvfcD2I70t66aX/EGKuxCkfrG0cJWJNb8jvg2KW8rSgwgBWY8+pliTfQ45FOxAnyiw/Aw21KzBEJ3kIjUZ94Kyy3jM5o0kL230oIGzGgeI6qts3YVkCKgud59eAuSmyg74OyD2umopw3LqriLdIAkZo5AdFDGusKKzaxnPCcqseYchXeelGzxAoVhEzmCoN5bqCoaoY60NVJMWwoQg/xICM58dw==;
	5:ncLMI4U9hPfmpUulFOU3FzP2b/IpYOzEY4YkehJdOCq5T1C9SWqsX2PG2FJYzgbN5QIHSEOF+zyQJgr61EFzzow091R3kMZ1ghCRAYNz4IyEGIAg6oBdKipHf/MgFOEYPkgkfpcv9ksUXXWczj7dATbdd0149sRbulL18evnQLw=;
	24:hdemqpE7jv6le/uqE2euKrQTilzGGVpJpS3xwUrIajcc5VwMIWVl5FO8lB43vYVSSFElxXT01TM+TOfaKfBD/Bt4PWe14e9IfQi0BSSbRCw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:2KJ65tAzFKKY1KlO1+OPIxxlZsiNp/+R3MXg381LJDG9ANl6yQLp4GZsDkr4I9KHgHVNb6PaK4cTpMu4hwTXdg2fBxt0NZcanhcrHpWaWeMJ5xloYckdajaMJ+x7THh8RXpPr2r3ES311GPdQh5k17ahEG27RDBWNXgoQOtLX9yM80Gqpr5Vpzo4HfH3rjwQrmoHrZD/Ps2dLfVxdiDiTFtEvsNCMUbjvCaKhRVxaPg7f2hD/axoCaiFFiHVaYCC
X-MS-Office365-Filtering-Correlation-Id: 0a7ff384-4858-467d-a663-08d5c6831bf2
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:35.4383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7ff384-4858-467d-a663-08d5c6831bf2
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 0/7] meson: implement nativesdk support
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
X-List-Received-Date: Thu, 31 May 2018 00:48:22 -0000
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

Martin Kelly (7):
  meson.bbclass: refactor native override
  nativesdk-python*: suppress user site dirs
  toolchain-shar-extract: allow non-sh post-relocate
  toolchain-shar-extract: print post-relocate error
  toolchain-shar-extract: pass env to post-relocate
  meson: handle exe wrappers
  meson: enable nativesdk

 meta/classes/meson.bbclass                         |  17 +-
 meta/classes/toolchain-scripts.bbclass             |  24 ++-
 meta/recipes-core/meta/meta-environment.bb         |   5 +-
 meta/recipes-devtools/meson/meson.inc              |  23 ++
 ...ke-ExternalProgram-get_path-a-bit-smarter.patch |  58 ++++++
 ...mandrunner-make-run-handle-python-options.patch |  53 +++++
 .../0006-mesonlib-handle-meson-exe-wrappers.patch  | 231 +++++++++++++++++++++
 meta/recipes-devtools/meson/meson/meson-setup.py   |  62 ++++++
 meta/recipes-devtools/meson/meson/meson-wrapper    |  14 ++
 meta/recipes-devtools/meson/meson_0.46.1.bb        |  20 +-
 .../meson/nativesdk-meson_0.46.1.bb                |  74 +++++++
 .../python/python-scons-native_3.0.1.bb            |   2 +-
 meta/recipes-devtools/python/python3_3.5.5.bb      |   2 +-
 meta/recipes-devtools/python/python_2.7.14.bb      |   2 +-
 14 files changed, 548 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson.inc
 create mode 100644 meta/recipes-devtools/meson/meson/0004-make-ExternalProgram-get_path-a-bit-smarter.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0005-commandrunner-make-run-handle-python-options.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0006-mesonlib-handle-meson-exe-wrappers.patch
 create mode 100755 meta/recipes-devtools/meson/meson/meson-setup.py
 create mode 100755 meta/recipes-devtools/meson/meson/meson-wrapper
 create mode 100644 meta/recipes-devtools/meson/nativesdk-meson_0.46.1.bb

-- 
2.11.0



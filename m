Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0083.outbound.protection.outlook.com [104.47.40.83])
	by mail.openembedded.org (Postfix) with ESMTP id 666A374E31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9uHmBXF/s1ZXBYHd37tXxyCPRMCvK0kYyjOyDF+sfRM=;
	b=dSVv6HWLoxyRLuTrweST4j7jHC9FUg64uu11ogCD6VfEl3F8rLBp2E823ngsLvBiKj6hhMBoBbu93GBKafWydjPiEphQaKVnqrKV4Aa5q5wxW3t5E3Q+/D+/7Cbn9YYlWDiFw4y7uoBJP8y2qyen1pSKIfJ28Hh7TYceCVB5W/c=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:44 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:06 -0700
Message-Id: <20180530231407.19759-7-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180530231407.19759-1-mkelly@xevo.com>
References: <20180530231407.19759-1-mkelly@xevo.com>
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
	3:ZwchktH8d0rz9jH0gZMscGHKAxHlhGD6OzZVq7cToK/EXcGdaX/fXu4X4nUiHQlxY1JPHUpV+B/q0uxYHys0Ta7EuyKsyfoUg7A3WuEhNEZ1l/gJIJBwaiiw3o7tirOmTDUBwfMGFsqhpv02ubAfx6nRZCBPFwQ3AW8eUj1K33JtcCUHs8uzFhCh0cj8Qx6LZggcqIYRaS76Mdw0GYkVYC+ces7wvjfuqxk2wJfiQRRxSOWGH9WJoeCh/NQwiLul;
	25:EGXHQ7dRngcdC0KmB+L54xGHwiYlDlhhAgMpMWVb6W3BFz9v8LbCjm8hZzNr6OTy7i+TUs9k37fOqp9iRAJlF1zKBxf1LwqqIE9rIdkiXnhnhB5jMbAOJJmTR9C0v4jaCTVZdy3iKTYxjBYgdLVeu7lKDOToAWmdGrSxN2rbaiYMtd+TlUo/9rig8RCzam3DQsDjcs0EZKCJHev28nluX9Q5D4LMvaty4LAV2E1r+nEJWT9XUk8uCRpWYihSjzGH6ix58o2FP/p70GpyNDFMkIJxbI/s8fSxWh7g11KH1DNRkfzKgLaD2begPP0wAfLvWvMaC93S41A7e/yT8zqAOA==;
	31:IkSVQMNQaOhXPvrSL2lwOF6m8XW4NXcsyeLQft8umxo6wcyZtOSlorojGr8wREXhDxFX3vHodw8v9bzu+t9mt5mAr+MUzAmRoz9WqJScmIHbVzMZ2pBxlQ2rzv6hVH42LACQx/xTUDDQ5mbzK+uG9JlYy6SwhLMFWfAeEJPyKZ2CajKZqWCnWPD7tZIjMPp3VDvyOOv5bZiGK71v5ow9ZKFa6ey0gRKdPIizDmDXznA=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:6sGmHA9Kt3TyVc0Bm6b9N8HCpHPoqwLJRkJcf/TWwlrTcQ0Vvqf2mRrX/JT8+cdu/lr+cw3GBlIifi0k3ShadiNXaZH93kvG5g0K/JSY1++M+JCkhZaJjZRXz0YWQXOLmRhv0o1IF3fcW5isJ6NK3G+CnZiiOWFlGOKclYRdYl42cIR8VvZ/INrWoEpQ7vKaFJJnh3f9n0JQmaIU2XJKaWB4lD951/hh7JdZpIJR2qnOTNpRPQcfk1peGjP5B29Ko9DTQyk9KYEE0jnTKstIfvpZVpceQbtc42tg1DYWpmFBViul6N122TZYX/sVBe5+Fk87ef1StXVM5auV9g5tUcZntIfaThLgJ9TFLQi/WbYjwCqJsmhUbJXiKFfyhTM3voB2d2CSWo6dZqbxq6sS9/8PLyytYouPwS8DFBkqdhcScoAUMmIpU0CuBpswVUnQaLUH20ThZEzYBUyqaLR3xLyYq+0MLalJn0v47NKoq7s8l14rfglsaqnSRqxVy1EF;
	4:b2J83xmL1b7RZ4cdo/8XcVTCJSAtXl2Hi3k+1J/5p2yzsbWrV6rT1i3/cVQyd4MdLv5YglmnzMCHGYHLkEqddPWL5xOqabKBhPq4usUwBu+hZ8cnS6cIoJ3CFX4M1hUsOnaGluiHHW9/qh5GtYrhI2n+MHbUOYCbEu/5LBTDNj0bJvkWW1FVOCMpmbPB+BvuAF6MQaHE+nPHuTucZx3bfFaUVC4e4B5/LMj7AtZ4lnrtmHd2BGDpEAm46ZlN9PyltzfeTW1SLZm4EPnsfUFVkJWQiuW1QdjWocNsOIPw4LtUuOmwRbCU8Pia/gyhfdxdvnYqZGoaQor/y2ng3OMgnaLiBV4lXYOQgfXuRRDYZ9M=
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34195EE8B3317908AEC3D73AAB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(199004)(189003)(59450400001)(11346002)(1076002)(486006)(36756003)(16526019)(966005)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(6666003)(107886003)(76176011)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(6306002)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(446003)(106356001)(105586002)(97736004)(2351001)(2361001)(460985005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:dBjuUesxOkky5VN8YrlEciiV6/wfJFPdIkZVjro?=
	=?us-ascii?Q?fOk6n4XLauP8oPWk1sMKYF7oxp/K4ZJrJnP6IdBcKu1SKseUfYkfjcidTyO2?=
	=?us-ascii?Q?nCcdIiyPRqHtbXq4wLESXfmeoOBLBvSthMG3Kq1SN3V+aS7xBBSCvxPIivvP?=
	=?us-ascii?Q?BJR5KFxkBZsoM2V5f6LC8iZbzHrsT1zR0fK82R3e8lwT+YehvABJIiURmQZM?=
	=?us-ascii?Q?HVEPUrekY29E6kbrozUOc1kgsrPjZvdIE+r6kdDaHyurTIhrvJ3XIKRGZed3?=
	=?us-ascii?Q?dwGrfuAe86SFMMUVY7ul0UhsE2IVWyxtg7jWdMkam5dPrDZw+KkZN23gzosY?=
	=?us-ascii?Q?ZKxdvr2w0uXemgHSMwQmUfIsGxtf/obor46wXF29uG/IXmjHE5yawPnKAByl?=
	=?us-ascii?Q?xu7ClyqI1qkAjxYVgXyRKXs3uHeeWIk71l2jsW17fTvbQ9Svug2XtFbOMuse?=
	=?us-ascii?Q?OUi0nlq0+fWa7rItaz7DzutC2TNexeSE5wduCma+g8c2oVL4l7TrJ8o/F6Qz?=
	=?us-ascii?Q?aT3vPVsDqrPoDzcw4ZdYObYWqQ+Ze6XKpqB7zqrAtUTe9aWC192oRk/uJ2zV?=
	=?us-ascii?Q?jFxnARJB8XVN7sWurWd0uqLOptH4byi5MnvvA0pPZ9tKaQvlZsClxSl+I5eu?=
	=?us-ascii?Q?FemheAED3iSJzswlWvzNhJCz+QaelNDUjmXpHzb7h8i8EBqd3KK0zNa/Puyy?=
	=?us-ascii?Q?X1ZOu75TRotJd5ZvSwe3HFaE08GVv/kWndBAJQ6dDuLxdB+qlWeINKuVI5bm?=
	=?us-ascii?Q?6e9YOKD3ipogz5xIfyUnXLRpu5w+Yq9zUa1PHAlrIoalDdRDrUw79B9MTxBO?=
	=?us-ascii?Q?64yUhbDDpVu2VrKHf9GLowkmAvNacX7BnAis64EFZZc4m6tBByn9Wg9LOwMf?=
	=?us-ascii?Q?WgJwEeYMm842saw1lWDTHBN6kkL8vbxAjf3YAXPD3IWxQabBD1kYiQuPB+aP?=
	=?us-ascii?Q?D0xL3MCHnF/Dz9S8zAiv6D/yAtcKxeu7TFNu4P/vnB5Bw5+uSaKsQy1hsZzi?=
	=?us-ascii?Q?wGMpcC10bEtzLfF3v+QpxcL/zomoRyQwx2a85vRHehsDq/cj/HNhlEmPfc0U?=
	=?us-ascii?Q?C+EruS/SQg1R1ji+gu+bPNUZ2FjQosed+/i/t7vj9giUQspUODyx12bn5aOU?=
	=?us-ascii?Q?VlwWl7XjS6BkIyPeUSj13CGx3rQN4gkANIHBY5oRNnTahj8aRTM6BZtBFQBd?=
	=?us-ascii?Q?y+kukCmKNjwORVruotz1ZH8DMxqA0nTz5epedTLhlNgkF65Phm5BDZ+Uxb9L?=
	=?us-ascii?Q?31+dpeBl4PHtTcFKgbAn4X8ZRY0xlDxC+GE94GDDfKbMCU0q/2UqfRvNM3vN?=
	=?us-ascii?Q?Igc8lN8KWBQGUMFS+Zzl7orFftVnlZaJlVMDXWuOAoE2oEg3L/nwYo85Xzbf?=
	=?us-ascii?Q?soEeV2ZA3ii5wDSl4K5sinFF0jEE=3D?=
X-Microsoft-Antispam-Message-Info: J7VRX/0P9MAc9/jpcVxfPJhnjxvYXm2qsV3YNkGkBLuQBfi8irIU3VBkgK48inBFgHbxQJUGaWdZprAEgLiC6zkPMkLy4PHfR1aCuYXZUijodrJNd69a7yyC5H2utxvbRyj7v2oUHC+LlTabauHAABhMytROPApEcM5fQUAeH+L486hh8mmN+4NFdLbs0Jqz
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:XdL6rYsufwc7Ig4zBGD1D766o2hpN/oALXfv2MnClbU7FAYoovYMq/prOYyVAaQh5TdMMAXzvzQlaequvqDFVMsbEEo///aAOrQ3UmFLU8DAzKZ7FFBzYg+wS/sJtVarBUOxONxyaa+MjYHiiRZbr+zVjZGswDqDnLuNsUqxd16UtGsd2/4aAE6Tdn5S1e1Lxff3lThdFlitPnbLFtjDEOqQgf/EIRRV97JWeWojkuiR3uhKHoZrfbnCpFrDE56u+2sXAdYjRDaoOyldt1N/IUMCiFmj318Jwmqb1VB3522Z3r0O2UOM9P9lJRd44P6jhP2euo5po5H3c4TTFwWmKZ+Pp4BTH4tfln/PK4DLfJLotTKNKwDLFhtC4bRi4HPt196BP4pWAbXUpsiwG3npGLcKwM3gy21DABThT4kvZO5Wn33/P7r3dkLjLtE784bcRXhK/8HNml9DvhhT1BvpuA==;
	5:d3KN/CTXv3w43CGjejFDF5j61qBH+++/iFYutfQ/TpGpLttVmEdaNLZP5F4IZn0fzNu9f5/e6t0ZmCFhpd2zJsWTstx2pcgLwOKDSOzJhxhc5PW6oKTZH8nGcankqqUr3RFki5mfycQkXOnVkfcR41xp39ssSXaNVwRYy+P0LRo=;
	24:QER6aCkJe3ec5/JWSOHong98aHpe4gHLnRrVh94qkw6sHVtugbetDi/nMajsjPPghg4SJ3EaR1i2BRo/H79mL0gK3zdNe1S9fvdGPr+33yM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:gXSfsG/DJB2hY3QqpOkvOw59tY8yskPf83jrF4jDmjevz/Hk7WrDhkFalvUMu7H/QgNaaMtfVDA85eZAgzand3vHNFRVl+meLUwhThLIkVnEMUKO4dNnxvHulYftXKSRfMFGS8y2ozT0nKQpLvP5ROf0HuNxE0DZA64X/9ETJ1TdioAtQJRIxJ2bs+RSE4hJCfskR3kQh2FRtYAjkeDv1RyNq3A2AufftrcvPFNtYCg8PhpXeaY6gN0pzRe+9Aju
X-MS-Office365-Filtering-Correlation-Id: 471d2e7e-d4b3-488c-bacd-08d5c6832154
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:44.4540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 471d2e7e-d4b3-488c-bacd-08d5c6832154
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 6/7] meson: handle exe wrappers
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
X-List-Received-Date: Thu, 31 May 2018 01:47:39 -0000
Content-Type: text/plain

Add patches to enable meson to handle being wrapped with a shell script.  This
will enable us to do so for supporting the SDK, which requires us to setup env
vars and point to a meson.cross file inside the SDK.

These patches are all merged upstream, so we can drop them soon.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 ...ke-ExternalProgram-get_path-a-bit-smarter.patch |  58 ++++++
 ...mandrunner-make-run-handle-python-options.patch |  53 +++++
 .../0006-mesonlib-handle-meson-exe-wrappers.patch  | 231 +++++++++++++++++++++
 meta/recipes-devtools/meson/meson_0.46.1.bb        |   3 +
 4 files changed, 345 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0004-make-ExternalProgram-get_path-a-bit-smarter.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0005-commandrunner-make-run-handle-python-options.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0006-mesonlib-handle-meson-exe-wrappers.patch

diff --git a/meta/recipes-devtools/meson/meson/0004-make-ExternalProgram-get_path-a-bit-smarter.patch b/meta/recipes-devtools/meson/meson/0004-make-ExternalProgram-get_path-a-bit-smarter.patch
new file mode 100644
index 0000000000..fdab7e67dc
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0004-make-ExternalProgram-get_path-a-bit-smarter.patch
@@ -0,0 +1,58 @@
+From 2c0273abecbdcef8411a6e513c7435ca4e7bd620 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Tue, 24 Apr 2018 16:53:18 -0700
+Subject: [PATCH] make ExternalProgram get_path() a bit smarter
+
+Currently, ExternalProgram get_path() assumes the last component in the
+path is always the actual command path. However, this is not always
+right. For example, in the command "python -u", we should return
+"python" and not "-u". However, in other cases, like "python script.py",
+then the last component is the right one.
+
+The heuristic that seems to capture this is to use the last argument
+that is still a file. This means options get ignored, but "python
+script.py" still works. Let's use this heuristic, at least for now.
+
+Upstream-Status: Accepted [https://github.com/mesonbuild/meson/pull/3393]
+Should be in the 0.47.0 release.
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+---
+ mesonbuild/dependencies/base.py | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
+index f4f19c57..18f04892 100644
+--- a/mesonbuild/dependencies/base.py
++++ b/mesonbuild/dependencies/base.py
+@@ -745,6 +745,17 @@ class ExternalProgram:
+             self.command = listify(command)
+         else:
+             self.command = self._search(name, search_dir)
++
++        # Set path to be the last item that is actually a file (in order to
++        # skip options in something like ['python', '-u', 'file.py']. If we
++        # can't find any components, default to the last component of the path.
++        self.path = self.command[-1]
++        for i in range(len(self.command) - 1, -1, -1):
++            arg = self.command[i]
++            if arg is not None and os.path.isfile(arg):
++                self.path = arg
++                break
++
+         if not silent:
+             if self.found():
+                 mlog.log('Program', mlog.bold(name), 'found:', mlog.green('YES'),
+@@ -892,11 +903,7 @@ class ExternalProgram:
+         return self.command[:]
+ 
+     def get_path(self):
+-        if self.found():
+-            # Assume that the last element is the full path to the script or
+-            # binary being run
+-            return self.command[-1]
+-        return None
++        return self.path
+ 
+     def get_name(self):
+         return self.name
diff --git a/meta/recipes-devtools/meson/meson/0005-commandrunner-make-run-handle-python-options.patch b/meta/recipes-devtools/meson/meson/0005-commandrunner-make-run-handle-python-options.patch
new file mode 100644
index 0000000000..876ace22f8
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0005-commandrunner-make-run-handle-python-options.patch
@@ -0,0 +1,53 @@
+From 0f54849523c812bca57d2182af92afe58c44f850 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Tue, 24 Apr 2018 16:55:12 -0700
+Subject: [PATCH] commandrunner: make run handle python options
+
+Currently, commandrunner breaks when we give options to python because
+it assumes python commands are in the form "python script.py", rather
+than "python -u script.py" or "python -u -m module script.py". Extend it
+to be more resilient and correctly parse python options.
+
+Upstream-Status: Accepted [https://github.com/mesonbuild/meson/pull/3393]
+Should be in the 0.47.0 release.
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+---
+ mesonbuild/scripts/commandrunner.py | 24 +++++++++++++++++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/mesonbuild/scripts/commandrunner.py b/mesonbuild/scripts/commandrunner.py
+index fc65e5b6..5922c64e 100644
+--- a/mesonbuild/scripts/commandrunner.py
++++ b/mesonbuild/scripts/commandrunner.py
+@@ -59,9 +59,27 @@ def run(args):
+     subdir = args[2]
+     meson_command = args[3]
+     if 'python' in meson_command: # Hack.
+-        meson_command = [meson_command, args[4]]
+-        command = args[5]
+-        arguments = args[6:]
++        # Handle any of these:
++        # python meson.py ...
++        # python -m mesonbuild.mesonmain ...
++        # python ARGS -m mesonbuild.mesonmain ...
++        # python -m mesonbuild.mesonmain ARGS ...
++        i = 4
++        while i < len(args):
++            arg = args[i]
++            # Skip past optional arguments.
++            if arg[0] == '-':
++                if arg == '-m':
++                    # Skip past -m PYTHONFILE.
++                    i += 2
++                else:
++                    i += 1
++            else:
++                break
++        end = i
++        meson_command = args[3:end]
++        command = args[end]
++        arguments = args[end + 1:]
+     else:
+         meson_command = [meson_command]
+         command = args[4]
diff --git a/meta/recipes-devtools/meson/meson/0006-mesonlib-handle-meson-exe-wrappers.patch b/meta/recipes-devtools/meson/meson/0006-mesonlib-handle-meson-exe-wrappers.patch
new file mode 100644
index 0000000000..19901d3a97
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0006-mesonlib-handle-meson-exe-wrappers.patch
@@ -0,0 +1,231 @@
+From 3d86e7b48407bd85d96305ebc8aa48cb1131cad2 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Tue, 24 Apr 2018 16:57:18 -0700
+Subject: [PATCH] mesonlib: handle meson exe wrappers
+
+There are cases when it is useful to wrap the main meson executable with
+a script that sets up environment variables, passes --cross-file, etc.
+For example, in a Yocto SDK, we need to point to the right meson.cross
+so that everything "just works", and we need to alter CC, CXX, etc. In
+such cases, it can happen that the "meson" found in the path is actually
+a wrapper script that invokes the real meson, which may be in another
+location (e.g. "meson.real" or similar).
+
+Currently, in such a situation, meson gets confused because it tries to
+invoke itself using the "meson" executable (which points to the wrapper
+script) instead of the actual meson (which may be called "meson.real" or
+similar). In fact, the wrapper script is not necessarily even Python, so
+the whole thing fails.
+
+Fix this by using Python imports to directly find mesonmain.py instead
+of trying to detect it heuristically. In addition to fixing the wrapper
+issue, this should make the detection logic much more robust.
+
+Upstream-Status: Accepted [https://github.com/mesonbuild/meson/pull/3393]
+Should be in the 0.47.0 release.
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+---
+ meson.py                |  9 ++-------
+ mesonbuild/mesonlib.py  | 48 +-----------------------------------------------
+ mesonbuild/mesonmain.py |  8 ++++++++
+ run_cross_test.py       |  2 ++
+ run_project_tests.py    |  4 ++--
+ run_tests.py            | 22 ++++++++++++++++++++++
+ run_unittests.py        |  3 ++-
+ 7 files changed, 39 insertions(+), 57 deletions(-)
+
+diff --git a/meson.py b/meson.py
+index abbac6f4..8f944c7c 100755
+--- a/meson.py
++++ b/meson.py
+@@ -15,12 +15,7 @@
+ # limitations under the License.
+ 
+ from mesonbuild import mesonmain
+-import sys, os
+-
+-def main():
+-    # Always resolve the command path so Ninja can find it for regen, tests, etc.
+-    launcher = os.path.realpath(sys.argv[0])
+-    return mesonmain.run(sys.argv[1:], launcher)
++import sys
+ 
+ if __name__ == '__main__':
+-    sys.exit(main())
++    sys.exit(mesonmain.main())
+diff --git a/mesonbuild/mesonlib.py b/mesonbuild/mesonlib.py
+index 2a3b920b..0b9279c7 100644
+--- a/mesonbuild/mesonlib.py
++++ b/mesonbuild/mesonlib.py
+@@ -38,58 +38,12 @@ except Exception:
+ 
+ from glob import glob
+ 
+-def detect_meson_py_location():
+-    c = sys.argv[0]
+-    c_dir, c_fname = os.path.split(c)
+-
+-    # get the absolute path to the <mesontool> folder
+-    m_dir = None
+-    if os.path.isabs(c):
+-        # $ /foo/<mesontool>.py <args>
+-        m_dir = c_dir
+-    elif c_dir == '':
+-        # $ <mesontool> <args> (gets run from /usr/bin/<mesontool>)
+-        in_path_exe = shutil.which(c_fname)
+-        if in_path_exe:
+-            if not os.path.isabs(in_path_exe):
+-                m_dir = os.getcwd()
+-                c_fname = in_path_exe
+-            else:
+-                m_dir, c_fname = os.path.split(in_path_exe)
+-    else:
+-        m_dir = os.path.abspath(c_dir)
+-
+-    # find meson in m_dir
+-    if m_dir is not None:
+-        for fname in ['meson', 'meson.py']:
+-            m_path = os.path.join(m_dir, fname)
+-            if os.path.exists(m_path):
+-                return m_path
+-
+-    # No meson found, which means that either:
+-    # a) meson is not installed
+-    # b) meson is installed to a non-standard location
+-    # c) the script that invoked mesonlib is not the one of meson tools (e.g. run_unittests.py)
+-    fname = os.path.normpath(os.path.join(os.path.dirname(__file__), '..', 'meson.py'))
+-    if os.path.exists(fname):
+-        return fname
+-    # If meson is still not found, we might be imported by out-of-source tests
+-    # https://github.com/mesonbuild/meson/issues/3015
+-    exe = shutil.which('meson')
+-    if exe is None:
+-        exe = shutil.which('meson.py')
+-    if exe is not None:
+-        return exe
+-    # Give up.
+-    raise RuntimeError('Could not determine how to run Meson. Please file a bug with details.')
+-
+ if os.path.basename(sys.executable) == 'meson.exe':
+     # In Windows and using the MSI installed executable.
+-    meson_command = [sys.executable]
+     python_command = [sys.executable, 'runpython']
+ else:
+     python_command = [sys.executable]
+-    meson_command = python_command + [detect_meson_py_location()]
++meson_command = python_command + ['-m', 'mesonbuild.mesonmain']
+ 
+ def is_ascii_string(astring):
+     try:
+diff --git a/mesonbuild/mesonmain.py b/mesonbuild/mesonmain.py
+index 2b6281d7..39d64d2f 100644
+--- a/mesonbuild/mesonmain.py
++++ b/mesonbuild/mesonmain.py
+@@ -381,3 +381,11 @@ def run(original_args, mainfile=None):
+         mlog.shutdown()
+ 
+     return 0
++
++def main():
++    # Always resolve the command path so Ninja can find it for regen, tests, etc.
++    launcher = os.path.realpath(sys.argv[0])
++    return run(sys.argv[1:], launcher)
++
++if __name__ == '__main__':
++    sys.exit(main())
+diff --git a/run_cross_test.py b/run_cross_test.py
+index e285e218..99230d1c 100755
+--- a/run_cross_test.py
++++ b/run_cross_test.py
+@@ -26,6 +26,7 @@ import sys, os
+ 
+ from run_project_tests import gather_tests, run_tests, StopException, setup_commands
+ from run_project_tests import failing_logs
++from run_tests import setup_pythonpath
+ 
+ def runtests(cross_file):
+     commontests = [('common', gather_tests('test cases/common'), False)]
+@@ -44,5 +45,6 @@ def runtests(cross_file):
+ 
+ if __name__ == '__main__':
+     setup_commands('ninja')
++    setup_pythonpath()
+     cross_file = sys.argv[1]
+     runtests(cross_file)
+diff --git a/run_project_tests.py b/run_project_tests.py
+index 8c02a9ee..0bf55cc0 100755
+--- a/run_project_tests.py
++++ b/run_project_tests.py
+@@ -33,7 +33,7 @@ import re
+ from run_unittests import get_fake_options, run_configure
+ 
+ from run_tests import get_backend_commands, get_backend_args_for_dir, Backend
+-from run_tests import ensure_backend_detects_changes
++from run_tests import ensure_backend_detects_changes, setup_pythonpath
+ 
+ 
+ class BuildStep(Enum):
+@@ -316,7 +316,7 @@ def _run_test(testdir, test_build_dir, install_dir, extra_args, compiler, backen
+     if pass_libdir_to_test(testdir):
+         gen_args += ['--libdir', 'lib']
+     gen_args += [testdir, test_build_dir] + flags + test_args + extra_args
+-    (returncode, stdo, stde) = run_configure(meson_command, gen_args)
++    (returncode, stdo, stde) = run_configure(mesonlib.meson_command, gen_args)
+     try:
+         logfile = os.path.join(test_build_dir, 'meson-logs/meson-log.txt')
+         with open(logfile, encoding='utf-8', errors='ignore') as f:
+diff --git a/run_tests.py b/run_tests.py
+index 648e6ce1..731d864f 100755
+--- a/run_tests.py
++++ b/run_tests.py
+@@ -42,6 +42,28 @@ if mesonlib.is_windows() or mesonlib.is_cygwin():
+ else:
+     exe_suffix = ''
+ 
++def setup_pythonpath():
++    # Make sure python can import mesonbuild, even if we change directories as
++    # some tests do. Since sys.path is the final product of fairly complex code
++    # in site.py, it's hard to tell where each entry came from just by looking
++    # at sys.path, so we don't know if a given entry was set from a relative or
++    # absolute path. If an entry was set from a relative path, it won't
++    # continue to work if we change directories.  Instead of trying to guess
++    # where a given entry came from, just add the known-good mesonbuild to
++    # PYTHONPATH so that it will continue to be importable from other
++    # directories.
++    import mesonbuild
++    meson_dir = os.path.dirname(os.path.abspath(mesonbuild.__file__))
++    meson_root = os.path.realpath(os.path.join(meson_dir, os.pardir))
++    try:
++        python_path = os.environ['PYTHONPATH']
++    except KeyError:
++        python_path = meson_root
++    else:
++        paths = python_path.split(os.pathsep) + [meson_root]
++        python_path = os.pathsep.join(paths)
++    os.environ['PYTHONPATH'] = python_path
++
+ def get_backend_args_for_dir(backend, builddir):
+     '''
+     Visual Studio backend needs to be given the solution to build
+diff --git a/run_unittests.py b/run_unittests.py
+index 6d4e0339..f5766613 100755
+--- a/run_unittests.py
++++ b/run_unittests.py
+@@ -47,7 +47,7 @@ import mesonbuild.modules.pkgconfig
+ from run_tests import exe_suffix, get_fake_options
+ from run_tests import get_builddir_target_args, get_backend_commands, Backend
+ from run_tests import ensure_backend_detects_changes, run_configure, meson_exe
+-from run_tests import should_run_linux_cross_tests
++from run_tests import should_run_linux_cross_tests, setup_pythonpath
+ 
+ 
+ def get_dynamic_section_entry(fname, entry):
+@@ -3180,6 +3180,7 @@ def unset_envs():
+ 
+ if __name__ == '__main__':
+     unset_envs()
++    setup_pythonpath()
+     cases = ['InternalTests', 'AllPlatformTests', 'FailureTests', 'PythonTests']
+     if not is_windows():
+         cases += ['LinuxlikeTests']
diff --git a/meta/recipes-devtools/meson/meson_0.46.1.bb b/meta/recipes-devtools/meson/meson_0.46.1.bb
index a18cab81f4..a1c9035e85 100644
--- a/meta/recipes-devtools/meson/meson_0.46.1.bb
+++ b/meta/recipes-devtools/meson/meson_0.46.1.bb
@@ -9,6 +9,9 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
+           file://0004-make-ExternalProgram-get_path-a-bit-smarter.patch \
+           file://0005-commandrunner-make-run-handle-python-options.patch \
+           file://0006-mesonlib-handle-meson-exe-wrappers.patch \
            "
 SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
 SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
-- 
2.11.0



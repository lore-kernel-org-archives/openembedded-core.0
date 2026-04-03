Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FFCD730B9
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:00:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7104.1775203236365908117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1nNB6NN8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 39B7A4E428CE;
	Fri,  3 Apr 2026 08:00:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 103E0603C1;
	Fri,  3 Apr 2026 08:00:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB62810450F5F;
	Fri,  3 Apr 2026 10:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775203233; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rIVkG6WaCAiIPdB0h0QPpWJgkJiSlLGv41bYpOzjRDE=;
	b=1nNB6NN8arv2QZ6JVTazqbv6G4FUvAphRyHH7TcfX6chrVrY9uF3jAfnlHgb5q3O9/sfrH
	oS9+udstg97An1TgwQz1+Fsu+l0CLhGwBdw2doDpIBv2QekvoYjaINxKUfjEarZGugPZGe
	hoxmSI6ZGZvC/SkG3vUgexd9c8iKNqYlwSLe3NLpHCieqw4aYXOLONjBj5lRiIVMFphYW2
	QM8G2uORQ+sgZJTolereFWXnReoMJJKTK0tBPDoIJ3pC+L/+df7YTazNA4LCDhK6SI+urc
	BLXUcb689bFmAmIjbLCLdCBq1RAw6GrAOCv8tGFv4xTdvS+Jzf5Y9B7BgMzRHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 10:00:30 +0200
Message-Id: <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/4] package_pkgdata: fix typo to stop
 calling undefined function
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.blank.g@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
 <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234561

On Thu Apr 2, 2026 at 5:39 PM CEST, Adam Blank via lists.openembedded.org w=
rote:
> The function is named 'package_populate_pkgdata_dir' but the
> call was to 'staging_package_populate_pkgdata_dir'.
>
> Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> ---

Hi Adam,

Thanks for your patch.

I can't say if this is another issue or something wrong with the tests,
but two of these are failing because of this patch:

2026-04-02 19:56:53,924 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_allarch_samesigs (subunit.RemotedTestCase)
2026-04-02 19:56:53,926 - oe-selftest - INFO -  ... FAIL
...
2026-04-02 19:56:53,926 - oe-selftest - INFO - 13: 17/52 271/679 (95.16s) (=
0 failed) (sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs)
2026-04-02 19:56:53,926 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 469, in test_=
sstate_allarch_samesigs
    self.sstate_common_samesigs(configA, configB, allarch=3DTrue)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 206, in sstat=
e_common_samesigs
    self.assertEqual(files1, files2)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1206, in assertDictEqua=
l
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: {'nat[31 chars]ckage_qa': '1cf298a771718a59519250687e84c92d=
e5[302150 chars]adb'} !=3D {'nat[31 chars]ckagedata': 'e9b33afd6d363736c82a=
f96ef0a991046[302150 chars]bb4'}
  {'adwaita-icon-theme/do_compile': '18aab6f6fe8018875194a0636a0f373a55f73f=
b4b8129d77a2e1d086d2ec578e',
   'adwaita-icon-theme/do_configure': '7380b23df0d0ef5ef3abc408bf06c4b25284=
a707bbb39391092412c9e5fdd0f0',
-  'adwaita-icon-theme/do_create_package_spdx': '71291be90a9aae925880a5fb43=
a06ac5e77b516d30297dc2a512939386160379',
+  'adwaita-icon-theme/do_create_package_spdx': 'e79bbe627c2567a418bd672bef=
357e0e2561f24100be568749bd5e0618503328',
   'adwaita-icon-theme/do_create_recipe_spdx': '4a4714266c3fb489eb4e563917c=
cccb38cc0b9f66594a6107f3a502036a3c5b3',
-  'adwaita-icon-theme/do_create_spdx': 'd4a4708d298a5dd62e647fe7e886d5c673=
e9c3aac4365c743360dbcafb18be38',
+  'adwaita-icon-theme/do_create_spdx': '98cd801f20f0ffb0e9bdffd12ee44f748e=
4d292e828f1cd37b7fdb1d24f195d6',
   'adwaita-icon-theme/do_deploy_source_date_epoch': '9f88202fbc0193ad762da=
ea7e7b614cbed0c61ff6a60a2dfba4bbd770e21f91f',
   'adwaita-icon-theme/do_fetch': '2ddf4b31dca442e88c40cbadb087f7f14aa5e790=
3ddf25a9eaa010a784df31e0',
   'adwaita-icon-theme/do_install': '997dd989d8d5379abaeaea11cb76db90603e4f=
d8e5b15eaa7d3bed5efc6c2f28',
-  'adwaita-icon-theme/do_package': 'ae407bcb5d420c505b3de2dd5d67eb6c9d81b3=
1da8008393c72bda7d1f7d4e3e',
-  'adwaita-icon-theme/do_package_qa': '0f93d17760ba7d350147722bf7a49a88580=
f3d2d511acace784be8737ab28624',
-  'adwaita-icon-theme/do_package_write_rpm': 'd672adc3f3a53d3392340974f4a7=
edc92bd455a6b5782a527a0f22f76ffc18d3',
-  'adwaita-icon-theme/do_packagedata': '252ddb5c78401938a7e0cc11803932ec5d=
5c55083a7bdcdee4e23c1f992c0f2f',
+  'adwaita-icon-theme/do_package': 'fcae5f450961cf5319679099fa4948312f2891=
50a73b75f4e6271aa41eaf35f4',
+  'adwaita-icon-theme/do_package_qa': '4d363ce538fd446486e157c8c4e7c304e8b=
b39fcddc70effc8779dee824984e8',
+  'adwaita-icon-theme/do_package_write_rpm': 'b9b134d7912f00b50297f2d18d64=
ff3589054c48574655b5f6749d9517451651',
+  'adwaita-icon-theme/do_packagedata': '25015261e21fd33d2c29b66af7158a8818=
612793eb676574355245c359bfbb99',
   'adwaita-icon-theme/do_patch': 'fbb075a802b4418e22df82386efbb58dd9bcb690=
2a5a2599d7b57921ba142e29',
...
2026-04-02 19:59:11,956 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_nativesdk_samesigs_multilib (subunit.RemotedTestCase)
2026-04-02 19:59:11,957 - oe-selftest - INFO -  ... FAIL
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3580
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3678
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3468

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



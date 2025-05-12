Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05EBC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 12:05:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.48796.1747051525349541947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 05:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MbtjYfL/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FA6A438FD;
	Mon, 12 May 2025 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747051523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qMEtNtUTZg/blLBXRUv1ivRx4k7TWfnDpt4JnK1TT4=;
	b=MbtjYfL/fJFJTc+5PuMtLUH7RPDE/9YiMdzSGtLc8HlavuR0AZiw8mC9Ezk8kISmpQxkbx
	ebUrL2r5GpcSfpQkHzgoNqWs3oC4655TMC/sCv4QRxknGmXpvStfCC+jzd6DRco2014oH7
	txqhCbjVs2qu/M5aewOt+XZtV3CRjfH+/YCVl4L1Rjwqm4CVG8SiwXYtmdgCGAKBcxAgVz
	WRRlack8K0+eGY9Fi40xmeuc3CqVre9RzZ6dXv0XGpMwCfmGgfATnYwz3v1d6O7dEy16Fg
	SiSXrT4O9v3GHOIOolv6TubORTecmmjZChflFEp29nZJtm9lpfobAsMMUgT0eA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 14:05:22 +0200
Message-Id: <D9U62TMBWDLE.19I9VEKRPRRC1@bootlin.com>
Subject: Re: [OE-core][PATCH v4] sqlite3: upgrade 3.48.0 -> 3.49.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250511150526.2787050-1-peter.marko@siemens.com>
In-Reply-To: <20250511150526.2787050-1-peter.marko@siemens.com>
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduudefgfeigfduheffffelfedthefhvefhheefiedvteegvdduhfevjedufeefnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdhiohdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehpvghtv
 ghrrdhmrghrkhhosehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 12:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216363

On Sun May 11, 2025 at 5:05 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Handle CVE-2025-3277, CVE-2025-29087 and CVE-2025-29088.
>
> This update includes major change in how it is built.
> Instead of autotools, autosetup is used.
>
> Autosetup (https://msteveb.github.io/autosetup/) claims to be
> * Replacement for autoconf in many situations
> However it also claims NOT to
> * Intended to replace all possible uses of autoconf
> This means that some autoconf features are not available.
>
> Recipe changes:
> * stop inheriting autotools and define B, do_configure and do_install
> * depend on zlib unconditionally, autoconf cannot be preconfigured in
>   similar way as autotools
> * update packageconfig options to match new syntax
> * libedit is detected with ncurses linking options (as seen in
>   do_configure log)
> * backport rpaths fix
> * define soname to avoid file-rdeps QA error due to wrong library name
> * add hack to force cross-compilation in native case to link against
>   zlib in sysroot and thus avoid crashes when sstate-cache from different
>   distro is used
> * clean B for do_configure as the new Makefiles do not seem to properly
>   retrigger build if configuration changes
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for the new version. However I believe we still have an error, in
oe-selftest and build on ARM hosts:

2025-05-12 08:01:13,149 - oe-selftest - INFO - buildoptions.ArchiverTest.te=
st_arch_work_dir_and_export_source (subunit.RemotedTestCase)
2025-05-12 08:01:13,150 - oe-selftest - INFO -  ... FAIL
...
2025-05-12 08:01:13,150 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/buildoptions.py", line 191, in test_arch_work_dir_and_export=
_source
    self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparentthe=
me.\nbitbake output %s" % res.output)
  File "/usr/lib/python3.9/unittest/case.py", line 831, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.9/unittest/case.py", line 824, in _baseAssertEqual
    raise self.failureException(msg)
AssertionError: 1 !=3D 0 :
Couldn't build xcursortransparenttheme.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1541
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1482
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1482

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



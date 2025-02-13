Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8BCC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 13:33:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11037.1739453611755370631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 05:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=khhXUUXx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9296C43423;
	Thu, 13 Feb 2025 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739453609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AHwx0PMxT+BZ6fvcbZB+3g4unjxxwcOHSQhKkyaDSW8=;
	b=khhXUUXx+46n7sKC1J25xpjj1pqZOpAvyCpuD6CF+UYLLvhMajVmRxpWrK5Db2NL4ma6J7
	yDs9fM0PJCKFwlEvZ90HzHObaXnKxMTZwzozqROQpof686P+2aBoJVpuUqF/I5Qlr476Tb
	b81KuxwS+oKeCHAkArKa9A+Y0r9qJbQ0YudkOzMGoLQAtcPNKZTJMOB5G1U1b1EUz8PzSg
	Mziv7KggTuzIX3NYm03tN2y1FFxBC6ecS0x8/4Wfkw5Dp197aeFZPOxxnVjR7mKhvOCE84
	WHSiPurrOkAUdPFEgVSpHTWh9Lg1C3LzQEEZPiKvgMW2CBnXrcK34u9cDVySrg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Feb 2025 14:33:29 +0100
Message-Id: <D7RCUCDJ0P1A.2V3UWW92HAQV@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 5/5] util-linux/util-linux-libuuid: upgrade
 from 2.40.2 to 2.40.4
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250213060000.1092285-1-Qi.Chen@windriver.com>
 <20250213060000.1092285-5-Qi.Chen@windriver.com>
In-Reply-To: <20250213060000.1092285-5-Qi.Chen@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfguedvgffhgedthedvgeevhfekgeehieekleeffeffteehiedtudduleduudelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopefsihdrvehhvghnseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnv
 ghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211330

On Thu Feb 13, 2025 at 7:00 AM CET, Chen Qi via lists.openembedded.org wrot=
e:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following two patches are dropped because they are in the new version=
:
> - 0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
> - util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi,

Thanks for your patch.

I believe this is breaking some sfdisk option we use. Here is the error
on the autobuilder:

| ERROR: _exec_cmd: export PATH=3D/srv/pokybuild/yocto-worker/oe-selftest-f=
edora/build/build-st-54827/tmp/work/qemux86_64-poky-linux/core-image-minima=
l/1.0/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/oe-selftest-fe=
dora/build/build-st-54827/tmp/work/qemux86_64-poky-linux/core-image-minimal=
/1.0/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worker/oe-selftest=
-fedora/build/build-st-54827/tmp/work/qemux86_64-poky-linux/core-image-mini=
mal/1.0/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/oe-selfte=
st-fedora/build/build-st-54827/tmp/work/qemux86_64-poky-linux/core-image-mi=
nimal/1.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yo=
cto-worker/oe-selftest-fedora/build/build-st-54827/tmp/work/qemux86_64-poky=
-linux/core-image-minimal/1.0/recipe-sysroot-native/bin:/srv/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/build-st-54827/tmp/hosttools:$PATH;sfdisk=
 --sector-size 512 --disk-id /srv/pokybuild/yocto-worker/oe-selftest-fedora=
/build/build-st-54827/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0=
/tmp-wic/efi-bootdisk-202502130949-sda.direct 00000000-0000-0000-0000-00004=
d9b9ef0 returned '1' instead of 0
| output: sfdisk: unrecognized option '--sector-size'
| Try 'sfdisk --help' for more information.

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/922/ste=
ps/14/logs/stdio

Can you have a look at this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



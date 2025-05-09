Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54053C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 11:56:56 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.12527.1746791810542281721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 04:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f7ieO6Em;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2DA843A0C;
	Fri,  9 May 2025 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746791808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SagmdMj3uitHq+PSHZxi46byFJORxz/N7u8G/JbiV8c=;
	b=f7ieO6Em4RaQEl+okQwc+LN4zQjLg6sqsQh5x2cf4INf5+oiizcHRbbB1/G3GOanxJ3IhK
	fZbMNAYsoXKZmNa5vcpRQvknTKsIcjdcBnweR8KyVL7I1MxMC+aPQpzWbG6WIJpgQhusw6
	0qIQmngJI5Dahfwzr2ACZNyR/hTW2MmpXSNZnpnvIEJwuMzKSTbphwTolDBvIfiXV+d4sJ
	lPdouxh2LuoXHpaqsLF3kcSgFbmvsvb0XfpbTAzM3LZHtn8IAwV7VMQ9a0RuBVIb6tWbT7
	PtU/TyX3RsTknvfP1gPjDIsY99b0fS+ind53d5tjsph2g5QoYuomoPwNp3cLkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 May 2025 13:56:47 +0200
Message-Id: <D9RM0MAYAXUU.23JI66VXBXKN4@bootlin.com>
Subject: Re: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.49.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250507081717.287535-1-peter.marko@siemens.com>
 <D9RI6IRC16OO.31JTIVJFTPSGC@bootlin.com>
In-Reply-To: <D9RI6IRC16OO.31JTIVJFTPSGC@bootlin.com>
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduudefgfeigfduheffffelfedthefhvefhheefiedvteegvdduhfevjedufeefnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdhiohdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegskedvtdemvdhftdelmeelvgdusgemfeekhegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemsgekvddtmedvfhdtleemlegvudgsmeefkeehrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehpvghtvghrr
 dhmrghrkhhosehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 11:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216199

On Fri May 9, 2025 at 10:56 AM CEST, Mathieu Dubois-Briand wrote:
> On Wed May 7, 2025 at 10:17 AM CEST, Peter Marko via lists.openembedded.o=
rg wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> Handle CVE-2025-3277, CVE-2025-29087 and CVE-2025-29088.
>>
>> This update includes major change in how it is built.
>> Instead of autotools, autosetup is used.
>>
>> Autosetup (https://msteveb.github.io/autosetup/) claims to be
>> * Replacement for autoconf in many situations
>> However it also claims NOT to
>> * Intended to replace all possible uses of autoconf
>> This means that some autoconf features are not available.
>>
>> Recipe changes:
>> * stop inheriting autotools and define B, do_configure and do_install
>> * depend on zlib unconditionally, autoconf cannot be preconfigured in
>>   similar way as autotools
>> * update packageconfig options to match new syntax
>> * libedit is detected with ncurses linking options (as seen in
>>   do_configure log)
>> * backport rpaths fix
>> * define soname to avoid file-rdeps QA error due to wrong library name
>> * clean B for do_configure as the new Makefiles do not seem to properly
>>   retrigger build if configuration changes
>> * use unstripped binaries for native (non-cross-compile) case
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ---
>
> Hi Peter,
>
> Thanks for the v2.
>
> I believe we still have some issues with this version. Not fully
> confident, as it seems a bit intermittent and I cannot see a direct link
> between your change and the error. I will try to drop it from my branch
> and see if it does fix the build.
>
> 2025-05-09 06:27:17,644 - oe-selftest - INFO - buildoptions.ArchiverTest.=
test_arch_work_dir_and_export_source (subunit.RemotedTestCase)
> 2025-05-09 06:27:17,644 - oe-selftest - INFO -  ... FAIL
> ...
> AssertionError: 1 !=3D 0 :=20
> Couldn't build xcursortransparenttheme.
> ...
> BrokenPipeError: [Errno 32] Broken pipe
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1518
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1468
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/1585
>
> Can you have a look at this please?

Just a quick update: I confirm dropping the patch fixed the build.

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



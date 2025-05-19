Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643CAC54754
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:51:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.46739.1747644675346838418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 01:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ka7KgI/k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE31A43301;
	Mon, 19 May 2025 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747644673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gicw+EPdd0yXNCtIp/2k/zljCXYAmgZFQqQAzudaIKw=;
	b=Ka7KgI/k41DBoqtLRRhgf/TOTHg5bUo11XR3pyyx2gerJlU8b/PFVb4kH2vXCbe4ZNTBy8
	E0Bzk7xuJcpviyGtb3uLETx8VSUmYjQsvfyhmovp9qkWZBLPsJgff/lubkRMp1Hld+Wsu5
	vrot7N9bDnOJ1Grj6e964cDinXwbgeUSNjDyCyxpMhUsbry39tqJrWj3NHNWCbRF9lZYkc
	m0NPURLZ1i5y7BsfLQM/mNYyQSW1zhQWEtTAaz82HCwAnap8ZEm2ec6DvFM6alC+T9vHR2
	Lnn2whrXIoA7UsNBA0+DDs/OyCr6VEgazD+s1zeE4lxzfWywutwWjnArIptxVw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 10:51:12 +0200
Message-Id: <DA00BYY3P9AL.3HV8STH1PXTJA@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 22/22] release-notes: drop references to
 kernel-fitimage.bbclass
Cc: <marex@denx.de>, "docs" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
 <20250514185225.162998-23-adrian.freihofer@siemens.com>
 <22cdbc6e-7b9f-4f46-b000-39ea4867457b@cherry.de>
In-Reply-To: <22cdbc6e-7b9f-4f46-b000-39ea4867457b@cherry.de>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddtleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffkeehtdefvdeuveegfeffhfdvgeevgeeugfegudfhhfefkedvheekfeeujeevleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnv
 ghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216828

On Thu May 15, 2025 at 3:06 PM CEST, Quentin Schulz via lists.openembedded.=
org wrote:
> This needs to go through yocto-docs ML and git repo.
>
> Cc docs
>
> On 5/14/25 8:51 PM, Adrian Freihofer via lists.openembedded.org wrote:
>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>=20
>> This commit drops references to the kernel-fitimage.bbclass to prevent
>> from build errors when the label is no longer available.
>>=20
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>   documentation/migration-guides/release-notes-5.1.rst | 2 +-
>>   documentation/migration-guides/release-notes-5.2.rst | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/docu=
mentation/migration-guides/release-notes-5.1.rst
>> index 267934a71ed..bab0c145814 100644
>> --- a/documentation/migration-guides/release-notes-5.1.rst
>> +++ b/documentation/migration-guides/release-notes-5.1.rst
>> @@ -377,7 +377,7 @@ New Features / Enhancements in 5.1
>>         :term:`SIGGEN_EXCLUDERECIPES_ABISAFE` and does not trigger a reb=
uild on a
>>         change for dependent tasks.
>>  =20
>> -   -  In :ref:`ref-classes-kernel-fitimage`, the existence of
>> +   -  In ``kernel-fitimage``, the existence of
>>         :term:`EXTERNAL_KERNEL_DEVICETREE` is checked more thoroughly to=
 avoid
>>         false positives.
>>  =20
>> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docu=
mentation/migration-guides/release-notes-5.2.rst
>> index dd541a7e3a4..42c6d60f9b8 100644
>> --- a/documentation/migration-guides/release-notes-5.2.rst
>> +++ b/documentation/migration-guides/release-notes-5.2.rst
>> @@ -29,7 +29,7 @@ New Features / Enhancements in |yocto-ver|
>>         ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``.
>>  =20
>>      -  :term:`FIT_UBOOT_ENV` to allow including a u-boot script as a te=
xt in a
>> -      fit image. See the :ref:`ref-classes-kernel-fitimage` for more in=
formation.
>> +      fit image. See the ``kernel-fitimage`` for more information.
>>  =20
>>      -  :ref:`ref-classes-meson`: :term:`MESON_INSTALL_TAGS` to allow pa=
ssing
>>         install tags (``--tags``) to the ``meson install`` command durin=
g the
>> @@ -684,7 +684,7 @@ New Features / Enhancements in |yocto-ver|
>>         command-line tool was added to the different Yocto Project and O=
penEmbedded
>>         repositories.
>>  =20
>> -   -  :ref:`ref-classes-kernel-fitimage`: handle :doc:`multiconfig
>> +   -  ``kernel-fitimage``: handle :doc:`multiconfig
>>         </dev-manual/multiconfig>` dependency when
>>         :term:`INITRAMFS_MULTICONFIG` is set.
>>  =20
>
> Please write some word for the migration manual to 5.3 (Antonin, can you=
=20
> add some placeholder like we did for 5.2?) so people know how to go from=
=20
> 5.2 kernel fitimage creation to 5.3+ kernel fitimage creation.

These are in master-next on yocto-docs at the moment. They'll be merged soo=
n
but in the meantime checkout from the master-next branch.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



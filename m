Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E081C021A6
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 09:54:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.17693.1739526851358995606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 01:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n3RBpr7r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F18674328F;
	Fri, 14 Feb 2025 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739526849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVG9aGk8p0G2QT/VhsIvEUhz/FzXm+ZdBgJw9zeXMWg=;
	b=n3RBpr7rsNNHGZvDwNF8+4rzIZD54U3IGdKpf/JgzQTq7zkM9yh9c3DnOD58C2uU7QOfyA
	h7EU5uGkR5Hh8al7lPmccoRn0xLmSFsCBSeQ68hGs3RfiUjIXOvpI5IZdZqrF/AVkJlZVK
	Lwi0eFKpg1d1NdPyY8jFQ+USsmnw9GMLOICISFAdMh0DIgC1SOQi4dQtXnk3eJ11ETHA+J
	v40E/4smYfgtqrK288IBToQABcfJ0I95ih/SJ5pRBh08jFcMHKl1+DOh6bnOf54+nreMdA
	Vyg2fKzRADrvkkh49CJIGrBwnUvX0BAjS7RocLVKvhg/Wc0oOtMLhKd8nB2f/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 10:54:07 +0100
Message-Id: <D7S2SXPGW3PI.260AKHQ97PB68@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/4] systemd: if getty generator is disabled
 remove the generator, not the units
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250213200212.1694055-1-ross.burton@arm.com>
In-Reply-To: <20250213200212.1694055-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvedvvdfhheegtefgheetjeeuvdeiveefhefhieekheefvdejleelteejiefgteeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 09:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211379

On Thu Feb 13, 2025 at 9:02 PM CET, Ross Burton via lists.openembedded.org =
wrote:
> If the getty generator is disabled then it's neater to remove just the
> generator tool instead of the unit files as the unit files are still
> useful.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Sorry, but I believe one patch in this series is again triggering a
strange behaviour on the autobuilder:

QMP released QEMU at 02/14/25 09:37:43 and took 0.12 seconds from connect
WARNING: core-image-full-cmdline-1.0-r0 do_testimage: Couldn't login into s=
erial console as root using blank password
WARNING: core-image-full-cmdline-1.0-r0 do_testimage: The output:
root
qemux86-64 login: <<< run_serial(): command timed out after 120 seconds wit=
hout output >>>

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/1003/ste=
ps/35/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1019/step=
s/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/1042/ste=
ps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/947/step=
s/13/logs/stdio

Can you have a look at this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



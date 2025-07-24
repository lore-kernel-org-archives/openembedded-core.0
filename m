Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AFDC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 11:29:33 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.10222.1753356570211247764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 04:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AIA1YcGp;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E2F04496D;
	Thu, 24 Jul 2025 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753356568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FbDFM/iOP5Pj/WF8XmpH+tkc8JGVDU9S9yJRChm4rb8=;
	b=AIA1YcGp533TW6rCy6XPC98DjK8wRHh4eOsEIjxQtO0gTp7vYHw1al6FhX5ACr6y0UsSE1
	V9/uLlkspk60ictCzYtVcEUzkWzkIOpQSwPzip0YS5R8p3LVAb0SPa0ZxeMloYYR/XyW9l
	pwvjsmpHZUI4349K8qKuaiQIoANZZWWfCrPySEjQ0FDVQIFy0o+dBAC4MyZBtFGoPCZARt
	tFJy/GMrjzUGUddpu1l6iovW0zeKGUxUmoq9zGEAv1Eb9HEwqMt56lkMMllAOsMtXOBK+e
	NKN3usFQa4YAdOmTgDkbi+o/+vGY0nT3zicPyi1kQIzjn5qPrHgI8r9Oxr9qjA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 13:29:26 +0200
Message-Id: <DBK912RYQHJN.S7XZ51XKPKTV@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 2/4] babeltrace2: Enable python plugins
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mingli.yu@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250724092814.4183226-1-mingli.yu@eng.windriver.com>
 <20250724092814.4183226-2-mingli.yu@eng.windriver.com>
In-Reply-To: <20250724092814.4183226-2-mingli.yu@eng.windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffvdeuteeiffelgedtvdeiveffledtffduueelkeetgfduvdelueekieeluefgnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdplhhtthhnghdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfhgurgdvmegukeefrgemhegtrggvmeejjedusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfhgurgdvmegukeefrgemhegtrggvmeejjedusgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmihhnghhlihdrhihusegvnhhgrdifihhnughrihhvvghrr
 dgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220834

On Thu Jul 24, 2025 at 11:28 AM CEST, Mingli via lists.openembedded.org Yu =
wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * The lttng-tools test fails as below as it needs bt2 module.
> ERROR: ust/high-throughput/test_high_throughput_snapshot.py
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Traceback (most recent call last):
>   File "/usr/lib/lttng-tools/ptest/tests/regression/./ust/high-throughput=
/test_high_throughput_snapshot.py", line 26, in <module>
>     import bt2
> ModuleNotFoundError: No module named 'bt2'
>
> Enable python plugins for babeltrace2 to provide the above support.
>
> * Add swig-native to DEPENDS to fix the below configure error.
>  | configure: error: SWIG 2.0.0 or newer is required to build the python =
bindings
>
> * There are some ptest failed cases after enable python plugins and
> track the failed ptest as https://bugs.lttng.org/issues/1430.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---

Hi Mingli,

I know you are working on the issue, just to confirm we still get the
same ptest failures:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1968
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1952

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



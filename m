Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75250C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 05:36:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.7126.1753248952162419173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 22:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n0sB8g/6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88120444CC;
	Wed, 23 Jul 2025 05:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753248950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrrpceR8UglsSuan1tT2UnqwM0VRaQWZfKAwY0WH4mU=;
	b=n0sB8g/6nliBtesBidGb19Gpv5uWr++o10bEHPOsXsH2VdhFePoXly2/u2c1capB6/zMHm
	+dPA8BoH4NNPiz60u/O7aDMCSUVhZKi3pLJDMRclRorDVl4aHILnJSjp41ReZh15jkdodG
	TqfJ5TPK9xiyCaAEjSmK5DG6WhzsTzsV1o+q2X9p4yp2FsH2a5heT5zFjscuyVaa9PF9/i
	grvsmJOzjpkaR1A08Ouy6gjlC9dLCArhXjF6OxB8WNe9kGf512JRJYvVMV0I/yMSnf1DJY
	aN20jN3ZUx09fDY7ZCKYWADfsGCkfRN3Eo9/8x67o6rH2XGKTLlXm1l5Q8/7Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 07:35:45 +0200
Message-Id: <DBJ6VQ8HNDNA.2QA8PHPZYPCE3@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/4] bash: upgrade 5.2.37 -> 5.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
 <20250721082103.2262095-2-hongxu.jia@windriver.com>
In-Reply-To: <20250721082103.2262095-2-hongxu.jia@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejieelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteekvddtudetteetgeejueekhffgjefgffefffeuffejhfdvheejfeekfeduvddvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemledukedvmeegfegtheemrgegheeimeekjeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemledukedvmeegfegtheemrgegheeimeekjeekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephhhonhhggihurdhjihgrsegvnhhgrdifihhnughrihhvvghrrdgtohhmp
 dhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220786

On Mon Jul 21, 2025 at 10:21 AM CEST, hongxu via lists.openembedded.org wro=
te:
> Refresh patch to 5.3
> - mkbuiltins_have_stringize.patch
>
> Drop backport patch
> - 0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
> - fix-filesubst-errexit.patch
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi,

Thanks for the update patch.

It looks like this is somehow breaking util-linux ptests:

Failed ptests:
{'util-linux': ['kill:_decode_functions']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1942
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1934

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250722-88/testresults/qemuarm64=
-ptest/core-image-ptest-util-linux/
https://valkyrie.yocto.io/pub/non-release/20250722-88/testresults/qemux86-6=
4-ptest/core-image-ptest-util-linux/

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



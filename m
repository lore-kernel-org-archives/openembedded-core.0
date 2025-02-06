Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F49C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:16:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.37360.1738837010011242843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BWWkQl5d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B764320B;
	Thu,  6 Feb 2025 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738837008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41iVAsiAArI9/FGV4TAI0BWq8UMSJY7ReMbxIBFoe3Y=;
	b=BWWkQl5dc0vLpor+7IcixMnhXG5giLM7Zxv08puMbzMJyAEFOBS/+3qboX78z6Oh3MKlq7
	MrRMQRj9TJO74YSi6owT4tbB75krnVrE3SanugXVurHYbk3hmLoo5f0EAVj3Ok35kgqacX
	Rst8DJmSvpsCx9C5ZF6658Fhx2yQ0XJMAtz8PFSuWqDLe1b8p1vYj/q+HoZ43EVvwkw5FF
	fxaR7oOAnmf/X3g/mnGqHzjy92jmg3ch4vqEZ9ykiOT/3ndbsDTFd53WIAinFkMtGW+Xx7
	LWTebeBEvvwwpoE/z30o9ZiutoYZHckL2DJwBQ4OwhABTXfHzN4sv6ZGR59ssw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Feb 2025 11:16:47 +0100
Message-Id: <D7LA9XGPGG5H.287DBDA93AM2K@bootlin.com>
Subject: Re: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Randy MacLeod"
 <randy.macleod@windriver.com>, "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250206055222.3319167-1-zboszor@gmail.com>
In-Reply-To: <20250206055222.3319167-1-zboszor@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeghfektedtfeegjeffvdfhudetledvfeffhfetkeffleefjefgieffudetjeevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvm
 hgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210914

On Thu Feb 6, 2025 at 6:52 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi w=
rote:
> This ships a crypto policy file for rpm-sequoia.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Hi Zolt=C3=A1n,

Thanks for the patch update.

I believe there is a regression introduced by this version of your
series, several builds are failing with:

ERROR: rpm-sequoia-crypto-policy-native-20250124-r0 do_compile: Execution o=
f '/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-lin=
ux/rpm-sequoia-crypto-policy-native/20250124/temp/run.do_compile.537997' fa=
iled with exit code 2
Log data follows:
| DEBUG: Executing shell function do_compile
| asciidoc -v -d manpage -b docbook crypto-policies.7.txt
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/asciidoc.conf
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/sources-unpa=
ck/git/crypto-policies.7.txt
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/docbook45.con=
f
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/sourc=
e/source-highlight-filter.conf
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/code/=
code-filter.conf
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/latex=
/latex-filter.conf
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/graph=
viz/graphviz-filter.conf
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/filters/music=
/music-filter.conf
| asciidoc: reading: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/asciidoc/resources/lang-en.conf
| asciidoc: writing: /srv/pokybuild/yocto-worker/musl-qemux86/build/build/t=
mp/work/x86_64-linux/rpm-sequoia-crypto-policy-native/20250124/sources-unpa=
ck/git/crypto-policies.7.xml
| xsltproc --nonet -o crypto-policies.7 /usr/share/asciidoc/docbook-xsl/man=
page.xsl crypto-policies.7.xml
| warning: failed to load external entity "/usr/share/asciidoc/docbook-xsl/=
manpage.xsl"
| cannot parse /usr/share/asciidoc/docbook-xsl/manpage.xsl
| make: *** [Makefile:137: crypto-policies.7] Error 4
| WARNING: exit code 2 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/870/step=
s/14/logs/stdio

Might this be a missing dependency ?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



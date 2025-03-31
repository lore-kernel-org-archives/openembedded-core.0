Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BB9C36011
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:45:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.47960.1743414319572465803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QjpMWvab;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 592E343153;
	Mon, 31 Mar 2025 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743414317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/kfuChkADvcaSy/bJvkSsORTjqhyoB+gdgwRcKtipjk=;
	b=QjpMWvabgmBNC5dCs3wfy7KBSiRPP81zYcrIeDfaIvYcKm+53IMsm7siiuu4i+bMPHiOW4
	mcYiQbex0i6VHhrWEGLtPKoPDMQXoUVTd58f6kvkLOfUM2D3kT200Ob3pe+dx7htvVr2T9
	fCwM3n9vAqiEP+noT/ghOM7/jiB2EKshRz6yfOeGVoyuG9DVefmDhIecWnh4VYoIguomHi
	BYrlIJK4DFPjs0MbP+Ej+i+y2bBC2ZrD2zJtb178cXTgc2hqytZtTt11NpcIAcW+PxWs+y
	HS3gEfTxgxNj88xSDSZwgPmteICOPv/3k9EboyOv2bTcHf1riS8oP9rhA84VPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 11:45:17 +0200
Message-Id: <D8UCSOK7M0KD.2FXD6KPWVXD95@bootlin.com>
Cc: "Anuj Mittal" <anuj.mittal@intel.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <leimaohui@fujitsu.com>, "Jose Quaresma" <quaresma.jose@gmail.com>
Subject: Re: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
 <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
In-Reply-To: <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleduvedtieelgfelueeikeffjeeivdeujeevhfetffeitdduvdejudefvedvudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhordhiohdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehmrghth
 hhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhgvihhmrghohhhuihesfhhujhhithhsuhdrtghomhdprhgtphhtthhopehquhgrrhgvshhmrgdrjhhoshgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnuhhjrdhmihhtthgrlhesihhnthgvlhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213959

On Mon Mar 31, 2025 at 11:40 AM CEST, Mathieu Dubois-Briand wrote:
> On Mon Mar 31, 2025 at 8:48 AM CEST, leimaohui via lists.openembedded.org=
 wrote:
> > Disable new meson option dots_viewer
> >
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
>
> Hi Lei,
>
> Thanks for your patch.
>
> It looks like we get some new ptest issues on gstreamer when building on
> the autobuilder:
>
> Failed ptests:
> {'gstreamer1.0': ['gstreamer/elements_queue.test']}
>
> More details about the ptests failures can be seen here:
>
> https://valkyrie.yocto.io/pub/non-release/20250331-52/testresults/qemux86=
-64-ptest/core-image-ptest-gstreamer1.0/
>
> Can you have a look at these failures please?

It also looks like we get a building error, I'm not sure why it only
happens on some platforms:

ERROR: gstreamer1.0-1.26.0-r0 do_compile: Execution of '/srv/pokybuild/yoct=
o-worker/qemuarmv5/build/build/tmp/work/armv5e-poky-linux-gnueabi/gstreamer=
1.0/1.26.0/temp/run.do_compile.99896' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/armv5e-poky-li=
nux-gnueabi/gstreamer1.0/1.26.0/recipe-sysroot-native/usr/bin/arm-poky-linu=
x-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/1=
4.2.0/ld: gst/libgstreamer-1.0.so.0.2600.0.p/gstbuffer.c.o: in function `gs=
t_atomic_int64_inc':
| /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.c:180:(.text+0x38c8): un=
defined reference to `__atomic_fetch_add_8'
| collect2: error: ld returned 1 exit status

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/1216


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



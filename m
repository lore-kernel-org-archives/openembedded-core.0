Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C29AC3601A
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:55:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2098.1743785748286956970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YSLcU3hg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CB63442FF;
	Fri,  4 Apr 2025 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743785746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8987IfBtqhQyXXHTKknFzXAiq8NOdheGtEhLSwVlZFo=;
	b=YSLcU3hgFd7JdXuNCO9PsQ8K3BJq0iSGy2G9cFkztNVQC0yX32X0kFpGkab7Zk1COxiD34
	28xq/BQhZlKlD0zHvh1KBJY+tDIn2Un+0tkzKTUJfg4oKBow3OLzB+jG5vrBc1nQeo2tu8
	jL23qUbO7212Lx5QE/ihq04aZGqTo+wf7p8C7IkOtzk0R7C8uHA1ypeUyMEmMsItJhzp5c
	bZWT5Np/mLVMtWEA1OE1hUt7HGwRlLTGqdq6Q9rpNmMoGUQj7UZqL1KUyKetJEZtw8nOnP
	2udKSSgd0pfzLXngs0RixoJck1k/SjGz8irTKt9TylaolM/4B1dF3P165IzP1Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Apr 2025 18:55:45 +0200
Message-Id: <D8Y0GGHA95CW.28774KM48J5N3@bootlin.com>
Subject: Re: [OE-core] [PATCH] packagegroup-base.bb: Enable hostapd for WiFi
 SAP configuration
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <quic_bpothuno@quicinc.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250404103901.3644174-1-quic_bpothuno@quicinc.com>
In-Reply-To: <20250404103901.3644174-1-quic_bpothuno@quicinc.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleduleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffellefgveekfeegheejiedutedukeffkeduvdevvddtgefgffffveefgfdvudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehquhhitggpsghpohhthhhunhhosehquhhitghinhgtrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrv
 geslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214363

On Fri Apr 4, 2025 at 12:39 PM CEST, Balaji Pothunoori via lists.openembedd=
ed.org wrote:
> This change is to enable hostapd for WiFi SAP configurations.
>
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-base.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index cb9d1f07af51..e0a021fc6091 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -262,6 +262,7 @@ RDEPENDS:packagegroup-base-wifi =3D "\
>      iw \
>      wireless-regdb-static \
>      ${WIRELESS_DAEMON} \
> +    hostapd \

Hi,

I believe this is not possible, as the hostapd package is not part of
openembedded-core but meta-openembedded. This change, if it has to be
made, should be made in meta-openembedded.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



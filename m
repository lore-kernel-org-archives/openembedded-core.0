Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D43C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:07:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9981.1741702028375537813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 07:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NObDsdjg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56051442E5;
	Tue, 11 Mar 2025 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741702026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xndEseeueX12ycZDVmWPAwiLfA9mC2ihpvykAhBTWs=;
	b=NObDsdjgkgnoSnwrPRL7NRRuI/WkANQQSdVaEQQ+uTH1GTzbfyqdwtcgE6Q5vYLdlkTajB
	jalJqBOH6JfuX0ue2+PbxjV2d3rf+ahuolhxyLBDLOjDm8EVyf7h1w8KoSWIB3a5dyDT8o
	KCAJ0I2B2s/bQ/kbUhqacW0KKut3bNRAsH4KBcEPyzNaPbp5iGbMO1yZXFsYCxq8S2EhoZ
	RB41q6+eAv1QiWhBQotfs4JOcDO8ENCtQbB/ugiwej6xpjbrKz7RZLtbShi/m3TKReq0eZ
	5Nfz+XTHR2287B0kNBt5X3Khj2h5hjg5wvswypEv9fJ8bPNrT5Vyne51M6DoyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 15:07:05 +0100
Message-Id: <D8DHU8UJ67HU.3M72I1AH28QOW@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] lib: spdx30_tasks: Use
 Fetch.expanded_urldata()
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250307162426.1152646-1-JPEWhacker@gmail.com>
In-Reply-To: <20250307162426.1152646-1-JPEWhacker@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudeiiefhkedtjeejheeiledviefgudeiudduheejgedtgedugedvleehheevieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdpr
 hgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 14:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212571

On Fri Mar 7, 2025 at 5:24 PM CET, Joshua Watt via lists.openembedded.org w=
rote:
> Converts the SPDX 3 code to use the Fetch.expanded_urldata() API instead
> of iterating over all the SRC_URI entries manually. This will correctly
> report additional download URIs (e.g. submodules) in the SPDX data.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---

It looks like this is failing sometimes on submodules, I had a fail with
meta-arm edk2-firmware recipe on the autobuilder:

Exception: bb.fetch2.FetchError: Fetcher failure for URL: 'gitsm://github.c=
om/openssl/openssl;protocol=3Dhttps;name=3DCryptoPkg/Library/OpensslLib/ope=
nssl;subpath=3DCryptoPkg/Library/OpensslLib/openssl;nobranch=3D1;lfs=3DTrue=
;bareclone=3D1;nobranch=3D1'. Please set a valid SRCREV for url ['SRCREV_Cr=
yptoPkg/Library/OpensslLib/openssl:pn-edk2-firmware', 'SRCREV_CryptoPkg/Lib=
rary/OpensslLib/openssl', 'SRCREV:pn-edk2-firmware', 'SRCREV'] (possible ke=
y names are gitsm://github.com/openssl/openssl;protocol=3Dhttps;name=3DCryp=
toPkg/Library/OpensslLib/openssl;subpath=3DCryptoPkg/Library/OpensslLib/ope=
nssl;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1, or use a ;rev=3DX =
URL parameter)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1122

Yet I had another build succeed yesterday, also with this patch and on
the same version of meta-arm:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1120

So I'm not really sure what is happening here.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



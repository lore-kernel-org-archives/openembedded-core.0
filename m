Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8338DC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 06:30:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.17617.1747895443991549116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 23:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VkIr/SF4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48C9143988;
	Thu, 22 May 2025 06:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747895442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ubb1OYGaKWq3CKiabSjBiIYkaQBDtp3tf6iYbGDrbw=;
	b=VkIr/SF4DXH8XuqbphPuG2IXXgBOMNXC+gOZsiulvGAuSXcbOsb/s+ZkJIKOu7/fw/7F2C
	ulwhqL51ejoAWSCJLrEnOnzkmUgpl+nRJdc0xZoCoSkSJpMJ+BkkqBkVxCjyF4l52A6rh2
	I68w/8y6HroX7lSdMu4SI8/YuXbfkm5d01dHhL/F9WtVvGpaGVlIl8dwQM+0KljyuDh/RI
	UbKW/bRhEvNs/bV+I1+i34w9wKdXR3Sgk2w0LWnn8OaocVobazk5vjJEdqnpXQZWJlh8v/
	rT+zWA4l8OXOIHXuOqXQjGzowE5UJagfTbNVpJnKQgN8jXsmqUSuNPyDxFkb9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 08:30:38 +0200
Message-Id: <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
Subject: Re: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Hongxu Jia" <hongxu.jia@windriver.com>, <Peter.Marko@siemens.com>,
 <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
In-Reply-To: <20250521080925.815334-1-hongxu.jia@windriver.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehvdehucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeguddttdevkefhudduhfetjeelkeejtedujeegieehveeikeegffeguedtteetnecuffhomhgrihhnpehgnhhomhgvrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehho
 hhnghiguhdrjhhirgesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopefrvghtvghrrdforghrkhhosehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 06:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217063

On Wed May 21, 2025 at 10:09 AM CEST, Hongxu Jia wrote:
> - Rebase install-tests.patch
> - Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 ][2=
]
>
> License-Update: Mention contributors in Copyright [1]
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752=
e0daac3a189d2fec8f7
> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3=
af9ad6879821558d6a7
>
> Release notes: https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3
> Regressions
>
>     reader: Fix reading compressed data
>     parser: Make undeclared entities in XML content fatal
>     save: Fix XML escape table
>     save: Fix xmlSave with NULL encoding
>     Revert "valid: Remove duplicate error messages when streaming"
>
> Bug fixes
>
>     save: Fix serialization of attribute defaults containing &lt;
>     io: Fix linkage of __xml*BufferCreateFilename functions
>
> Build systems
>
>     cmake: Fix installation directories in libxml2-config.cmake
>     meson: Install libxml2.py
>
> Improvements
>
>     parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
>     html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi,

Thanks for the lttng fix.

Build is now correct with this version of libxml2, but we do have some
ptest failures:

Failed ptests:
{'libxml2': ['testThreads']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1541
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1540

Corresponding ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250521-95/testresults/qemuarm64=
-ptest/core-image-ptest-libxml2/
https://valkyrie.yocto.io/pub/non-release/20250521-95/testresults/qemux86-6=
4-ptest/core-image-ptest-libxml2/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



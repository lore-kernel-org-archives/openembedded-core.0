Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD74C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:00:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11426.1745488809368664418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UeysC3k3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3311A43ACE;
	Thu, 24 Apr 2025 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745488807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuJ8v3efJq7T9mOkvBo6+ip8ziW1Pnm4RfBCubS5feM=;
	b=UeysC3k3RMs8/qz0zIk7CVLaq5moAoOEohNt153ioqtgVf3bZ3w2+8oVLh1NE0EbDNIU2K
	1moJOoDR9o+beP/mAoKm2sFA7bIYJosDWIc1vO305in8uWn+hrbN+Zhi06dDYMOB+GWXF9
	cO1Ma25zO9F2SihfPcONU+pJR2Q/FRN6CL/zrdb/TUXgBKR/6ksTwH94CjWWttiVjEqZIU
	4hyfWzt+1G0s1LyQiN83c7mTOi+uFDbRBeiIVgyFL0Wp3k6XUBTeCQ4dC8q08nH9p0Csbp
	wEHx5uLckdfuyXRwaOCPwWOMOYmdjCoErRc4B2DIpE5eXiTWMMr8gDuAr88TIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 12:00:06 +0200
Message-Id: <D9ES53X06ZYS.O2YBSMHAGNG2@bootlin.com>
Subject: Re: [OE-core] [PATCH] rust: restore unit tests that were marked as
 ignored
Cc: <Shivaprasad.Moodalappa@windriver.com>,
 <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250423112604.3718426-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250423112604.3718426-1-Deepesh.Varatharajan@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeludejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudehgefgteegheegjeehhffhgeelkeehgfelfeeukeetvdekiedttdevgeefudeunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguvggvphgvshhhrdhvrghrrghthhgrrhgrjhgrnhesfihinhgurhhivhgvrhdrt
 ghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopefuhhhivhgrphhrrghsrggurdfoohhouggrlhgrphhprgesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopefuuhhnuggvvghprdfmohhkkhhonhgurgesfihinhgurhhivhgvrhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215346

On Wed Apr 23, 2025 at 1:26 PM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Some unit tests were previously marked as ignored due to failures
> in earlier Rust versions. Following the upgrade to Rust 1.85.1,
> these tests now pass reliably and have been re-enabled. They have
> been verified to run successfully on the latest version.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

Thanks for your patch.

I believe we can still see some test failures on the autobuilder:

2025-04-24 08:28:31,576 - oe-selftest - INFO - rust.RustSelfTestSystemEmula=
ted.test_rust (subunit.RemotedTestCase)
2025-04-24 08:28:31,590 - oe-selftest - INFO -  ... FAIL
...
test fs::tests::file_lock_drop ... FAILED

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/1422

Can you have a look at this issue please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



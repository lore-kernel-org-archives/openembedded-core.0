Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87542C54756
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 08:58:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.19717.1747904320539705777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 01:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gq0/ROUT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEBF61FCF2;
	Thu, 22 May 2025 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747904318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JqDA+kFCsYgTBcKWw6jJmlOm4Y5yU/y5mt0FN1jT3k=;
	b=Gq0/ROUTI1fGc1PpozX4v4q7BUaWXDpqvf5JsR2kDUL6h/Oxx5FCqIQWF6BPGrjj65zPlu
	u4CXoDwMV7VHbtcQJHiA/RU60K93e6OvmWwSBQ0fvt/93hKbsRlpsJVkvXw0zhVf6q1wcf
	e2uCp8rZJydal93RGOMWjFuGV2ZuTFR9l30IPznLjdlNkFz2fbtPAOktQrHOwT5EnKvdzA
	eBm0L4pW9ylIuMYXTlM1Qeg+xOGDjadEfc753oUmJBkAhY4bg59hbfHFvZAU9XMZEdbYBq
	VzwPpmOy0n4d/qMtQAvOJXxpcfdEqIbH/YswrAuiyX4u0kwBjTqXKCwVoH3GkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 10:58:37 +0200
Message-Id: <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "Hongxu Jia"
 <hongxu.jia@windriver.com>, "alex.kanavin@gmail.com"
 <alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
 <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehheegucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeelheekudektddvjeehuddvffekjeduudegveevgeejteeggffhveehueetvedtnecuffhomhgrihhnpehgnhhomhgvrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprfgvthgvrhdrofgrrhhko
 hesshhivghmvghnshdrtghomhdprhgtphhtthhopehhohhnghiguhdrjhhirgesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217070

On Thu May 22, 2025 at 8:35 AM CEST, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Sent: Thursday, May 22, 2025 8:31
>> To: Hongxu Jia <hongxu.jia@windriver.com>; Marko, Peter (FT D EU SK BFS1=
)
>> <Peter.Marko@siemens.com>; alex.kanavin@gmail.com; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
>>=20
>> On Wed May 21, 2025 at 10:09 AM CEST, Hongxu Jia wrote:
>> > - Rebase install-tests.patch
>> > - Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 =
][2]
>> >
>> > License-Update: Mention contributors in Copyright [1]
>> >
>> > [1] https://gitlab.gnome.org/GNOME/libxml2/-
>> /commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7
>> > [2] https://gitlab.gnome.org/GNOME/libxml2/-
>> /commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7
>> >
>> > Release notes: https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14=
.3
>> > Regressions
>> >
>> >     reader: Fix reading compressed data
>> >     parser: Make undeclared entities in XML content fatal
>> >     save: Fix XML escape table
>> >     save: Fix xmlSave with NULL encoding
>> >     Revert "valid: Remove duplicate error messages when streaming"
>> >
>> > Bug fixes
>> >
>> >     save: Fix serialization of attribute defaults containing &lt;
>> >     io: Fix linkage of __xml*BufferCreateFilename functions
>> >
>> > Build systems
>> >
>> >     cmake: Fix installation directories in libxml2-config.cmake
>> >     meson: Install libxml2.py
>> >
>> > Improvements
>> >
>> >     parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
>> >     html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT
>> >
>> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> > ---
>>=20
>> Hi,
>>=20
>> Thanks for the lttng fix.
>>=20
>> Build is now correct with this version of libxml2, but we do have some
>> ptest failures:
>>=20
>> Failed ptests:
>> {'libxml2': ['testThreads']}
>
> Mathieu, you can take my limxml2 upgrade instead of this one, the ptests =
are fixed there.
> https://lists.openembedded.org/g/openembedded-core/message/215559
>
> Alternatively, my changes in run-ptests can be shamelessly copied.
>
> Peter
>

Oh right, I remember this one now. But the patch version differs. I
could change it in your patch while picking it, but I believe it would
be better if the modified patch goes on the mailing list before landing
on master-next.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



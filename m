Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FFCC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 18:02:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1609.1743833053451184287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 23:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@softwareheritage.org header.s=gm1 header.b=H3Son8uM;
 spf=pass (domain: softwareheritage.org, ip: 217.70.183.196, mailfrom: archival@softwareheritage.org)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1BE04452E;
	Sat,  5 Apr 2025 06:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=softwareheritage.org;
	s=gm1; t=1743833051; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=wd16VePMyMX2/tA+0VrqYavmK1Mzu1VbFF2yjMYDNqc=;
	b=H3Son8uM8V5Mp+JyYjYILmkwtFobeju+wLA922/Jg1GmYTDvufHlY7CZ0zWkTZMeg0DU+8
	VVHGy+0/KQ6pR5Nb3OdzyA5SE+bNhe8zCK/hX3Qp1jlwB2Z45j57B6/KEmVn4+YOBoOPJd
	6OSi4+UwbXAJqKn5di4pb9vPbSYOMUHv6dH1qT0KYP3XBV8M08w+TZD8Yd/eBOUvHgDf0f
	4tZhgwds2lnOakLKG8tRHQume9K6E8hdnXQdsNZyqvZqVyRASG+RNIMrFP5XwZOjuwzX3v
	kyhCk2FMJvkb4+VFs4mPOoJoFybTLRW2UgqP73xwe8ce18WnI1hGretyPfxT0Q==
Message-ID: <023952d52bc661861ff1aa440b8498b91ef09b63.camel@softwareheritage.org>
Subject: Software Heritage archival notification for git.openembedded.org
From: Paul Wise <archival@softwareheritage.org>
Reply-To: 
	add-forge-now+1633._Qc5VVhZRC4WgJlnvEGnz0Iv6wU@archive.softwareheritage.org, 
 Software Heritage Archival Moderators
	 <archival@softwareheritage.org>, OpenEmbedded Core
	 <openembedded-core@lists.openembedded.org>, Philip Balister
	 <philip@balister.org>, Denys Dmytriyenko <denis@denix.org>, Jon Mason
	 <jdmason@kudzu.us>, Tim Orling <tim.orling@konsulko.com>
Mail-Followup-To: 
	add-forge-now+1633._Qc5VVhZRC4WgJlnvEGnz0Iv6wU@archive.softwareheritage.org,
  Software Heritage Archival Moderators	 <archival@softwareheritage.org>,
 OpenEmbedded Core	 <openembedded-core@lists.openembedded.org>, Philip
 Balister	 <philip@balister.org>, Denys Dmytriyenko <denis@denix.org>, Jon
 Mason	 <jdmason@kudzu.us>, Tim Orling <tim.orling@konsulko.com>
Mail-Reply-To: 
	add-forge-now+1633._Qc5VVhZRC4WgJlnvEGnz0Iv6wU@archive.softwareheritage.org,
  Software Heritage Archival Moderators	 <archival@softwareheritage.org>,
 OpenEmbedded Core	 <openembedded-core@lists.openembedded.org>, Philip
 Balister	 <philip@balister.org>, Denys Dmytriyenko <denis@denix.org>, Jon
 Mason	 <jdmason@kudzu.us>, Tim Orling <tim.orling@konsulko.com>
To: OpenEmbedded Core <openembedded-core@lists.openembedded.org>, Philip
 Balister <philip@balister.org>, Denys Dmytriyenko <denis@denix.org>, Jon
 Mason <jdmason@kudzu.us>,  Tim Orling <tim.orling@konsulko.com>
Cc: 
	add-forge-now+1633._Qc5VVhZRC4WgJlnvEGnz0Iv6wU@archive.softwareheritage.org
Organization: Software Heritage
Date: Sat, 05 Apr 2025 14:03:56 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.56.0-1 
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleefheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhrhfvvehotgfgffggfgesthhqredttderjeenucfhrhhomheprfgruhhlucghihhsvgcuoegrrhgthhhivhgrlhesshhofhhtfigrrhgvhhgvrhhithgrghgvrdhorhhgqeenucggtffrrghtthgvrhhnpeduvdeuvdevueeugefguedvffefudfhieelhedvveektdevudfhueehkeeutddvveenucffohhmrghinhepshhofhhtfigrrhgvhhgvrhhithgrghgvrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghenucfkphepgeelrdduleegrddvgedvrddvudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeelrdduleegrddvgedvrddvudeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrrhgthhhivhgrlhesshhofhhtfigrrhgvhhgvrhhithgrghgvrdhorhhgpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepphhhihhlihhpsegsrghlihhsthgvrhdrohhrghdprhgtphhtthhopeguvghnihhsseguvghnihigrdhorhhgp
 dhrtghpthhtohepjhgumhgrshhonheskhhuugiiuhdruhhspdhrtghpthhtohepthhimhdrohhrlhhinhhgsehkohhnshhulhhkohdrtghomhdprhgtphhtthhopegrugguqdhfohhrghgvqdhnohifodduieeffedrpgfstgehgggghhgktfevgeghghfllhhnvhfgifhniidtkfhvieiffgesrghrtghhihhvvgdrshhofhhtfigrrhgvhhgvrhhithgrghgvrdhorhhg
X-GND-Sasl: archival@softwareheritage.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214475

Hello OpenEmbedded folks,

The mission of Software Heritage is to collect, preserve and share all
the publicly available source code: https://www.softwareheritage.org

We would like to add the code hosted at the URL below to the list of
software origins that are regularly archived, and we understand that
you are or know the contact person for this site.

https://git.openembedded.org/

In order to archive the code contents, we will have to periodically
pull the public repositories it contains and clone them into the
Software Heritage archive. FAQs for our processes are available:

https://docs.softwareheritage.org/user/faq/#add-forge-now
https://www.softwareheritage.org/faq/

Please let us know if there are any issues to consider before
we launch the archival of the public repositories hosted on your
infrastructure. Please use "Reply all" to ensure our system will
process your answer properly.

In the absence of an answer to this message, we will start to
archive your code in the coming weeks. Only the publicly
accessible repositories will be archived.

Thank you in advance for your help.

Kind regards,
The Software Heritage team

--=20
bye,
pabs

https://wiki.softwareheritage.org/wiki/User:PaulWise


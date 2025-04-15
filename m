Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C9C369B8
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 08:23:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.15156.1744705425496850781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 01:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MlKaQxlg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C35E43216;
	Tue, 15 Apr 2025 08:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744705423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NB4qISk70tCVlniWHmBDz3rj0Qy0VCprfldF0SiIpU0=;
	b=MlKaQxlgxFQdwqZqTm28ItupOYQGQbXvhbahdWmHlMBwTzuPgRp1LGzo/A2IciiiMIFTHN
	fEyrbFZ0Q5rGnkrkf83wulB9S0anSgUqRSJzQXez7ZycysFnce7vZ2LlrYRooG+zvpEZfz
	b7IV4k2Bn5HZSQN4HRE9yEybrFtD6yOJPmmgjQsA5/cS1XcWdz3ceEBBwJ7HhlzcVZRMeG
	iTRsItGFKJyKVYUVkq8wtcJog2mT4SIm6FjPe2FWWVelrTMuNVd4vbfBY5/M42UOCMsk5+
	r7bo5lvRZnsqNYOoAYA9oKBnaIXRbOek6HJGtXwLjGsTpDQUR2JK1Ohd1DZfWQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 10:23:43 +0200
Message-Id: <D972GEFFVR83.1EHQVCQIO3WY2@bootlin.com>
Subject: Re: [OE-core][PATCH v2] openssh: upgrade 9.9p2 -> 10.0p1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250412034756.24846-1-vanusuri@mvista.com>
In-Reply-To: <20250412034756.24846-1-vanusuri@mvista.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddvleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvvdejgeethfefheevfedvvedtffelgfefveektdffkeegveettddvheetjeehveenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhophgvnhhsshhhrdgtohhmpdhophgvnhifrghllhdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehvrghnuhhsuhhri
 hesmhhvihhsthgrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214827

On Sat Apr 12, 2025 at 5:47 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Includes fix for CVE-2025-32728
>
> Release Notes: https://www.openssh.com/txt/release-10.0
>
> LINK: https://www.openwall.com/lists/oss-security/2025/04/09/6
>
> Regarding the Portable OpenSSH 10.0 release:
>
> Due to an error in the release process, the recent Portable OpenSSH
> release identifies itself as 10.0p2 rather than the intended 10.0p1.
>
> We do not intend to make a new release to fix this mistake. This
> portable OpenSSH release will henceforth be knows as 10.0p2 and no
> release numbered 10.0p1 will be made.
>
> Sorry for the confusion,
> Damien Miller
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hi Vijay,

Thanks for your patch.

It looks like this is causing some issues on the autobuilder:

Test case logrotate.LogrotateTest.test_logrotate_newlog depends on logrotat=
e.LogrotateTest.test_logrotate_wtmp but it didn't pass/run.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/core/decorat=
or/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/core/decorat=
or/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/runtime/case=
s/ssh.py", line 38, in test_ssh
    self.fail("ssh failed with \"%s\" (exit code %s)" % (output, status))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: ssh failed with "ssh: connect to host 192.168.7.4 port 22: =
Connection refused" (exit code 255)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/1381

Yet I believe I saw it working at some point. I will drop it from my
branch and try to investigate this a bit later.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



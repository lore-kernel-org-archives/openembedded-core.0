Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web09.3694.1620851667012957314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 13:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=DuhbdR7H;
 spf=none, err=SPF record not found (domain: verbum.org, ip: 64.147.123.24, mailfrom: walters@verbum.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 6F10A15E9
	for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 16:34:26 -0400 (EDT)
Received: from imap10 ([10.202.2.60])
  by compute1.internal (MEProxy); Wed, 12 May 2021 16:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=+mq6CHdvUWZk4KCAZsqBrmmG4GCBt
	QTJj1AzC7ismpE=; b=DuhbdR7HMlcyNDLwakJ9Zp6/UCNj+dzp8zXZ5lsvRI+V6
	1StjZXZvPDy8UG7ZWHVvG81Co7+nOH9aMzzHDSHcYNqQPC8tR//kcoGR/TwvxTA0
	AXsYz6M2v/nkVWR4zRgntX2UfRsCaZkF8/JPT48MXQ6v+bwZ3VIZ/a0jPwftSjd7
	FaIx0CTCPWscJB/f3iyFp8nZaZaqOj0Sg6gagNn9GoEkpnlvf+aK7YV1cNdeGS5S
	sghfwZQnh082OdnsmSUk9xqmgSzBTwte6rMs2d1sytaOVfOz3Vj8C1RpVnYeTUHz
	uTJ0yu7DkXsVurDR0EGnbjJoKGn82JNXJ5bz50tlw==
X-ME-Sender: <xms:0TucYLdGzLrUeduqCstJ04bHbJqXbEGpQaVZ5GKmTGvm1gwjvMdX7A>
    <xme:0TucYBOiLDuLDEKpRnPwIR4PitGYjRQPvlbNuMhOe8wHHGjpOO1I4kWNJjVBnkoAK
    nDLuASnouklGnYZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdevohhlihhnucghrghlthgvrhhsfdcuoeifrghlthgvrhhs
    sehvvghrsghumhdrohhrgheqnecuggftrfgrthhtvghrnhepueefhfeiudelffefveefgf
    eiheffvdeujeekheejleetfeefhfettdehudelffegnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpeifrghlthgvrhhssehvvghrsghumhdrohhrgh
X-ME-Proxy: <xmx:0TucYEhsgiYeLa5bgajIfstVyoNhb-VXkHRVPRPncSwUEUExhnMElQ>
    <xmx:0TucYM82FBoWmHp6lX_xfpVg5GzGukKkFeXBpDRoM98a2EeOJlxUQQ>
    <xmx:0TucYHsU8Yiv4yQvLzjHhkKc6UIrU_0oyuFCUZnDxI7ryJDv0fjDGA>
    <xmx:0jucYIMfb-tUYXcjcAvsTXK3tqLclFg0_8bZ_9ssf1mNXHmJeyqx9Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9B9004E00C8; Wed, 12 May 2021 16:34:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
Date: Wed, 12 May 2021 16:34:05 -0400
From: "colin walters" <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Subject: master/main branch renaming and bitbake
Content-Type: text/plain

(Sorry I think this isn't the right list, but I happen to still be subscribed to this one so...)

Can someone please tell me there's a fix for yocto/bitbake failing if the master branch is renamed?

https://github.com/ostreedev/ostree/issues/2360

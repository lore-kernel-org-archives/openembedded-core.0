Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.13340.1620912446153741379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 06:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Z9N10GUg;
 spf=none, err=SPF record not found (domain: verbum.org, ip: 66.111.4.28, mailfrom: walters@verbum.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 5700E5C0163
	for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 09:27:25 -0400 (EDT)
Received: from imap10 ([10.202.2.60])
  by compute1.internal (MEProxy); Thu, 13 May 2021 09:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VkQHNH
	UhJHPm7Ml0qGxxQ41B+Axs9uHrkVfGhPONYAo=; b=Z9N10GUgqd4N02XvXqDfW0
	rtCnckJl0grWNFhoV+StxpSfSRo+RUGVeO/+X1mHiHcjwweYgWpaKalvmKqs8eqv
	bpS92XAX2LOCi+af4IK4gpZaf0wBL4x6vl8uI37LwqdQwviR3dEdLFgskApejfht
	f4Zv75kqlw00WoCRbBPS6VYaWb0QeoupOqHNSEIA4V7IzQ3HxlVImvuJHg5LnIsJ
	u6HEpAjaM3Lp7kFGkMdynEbIfh5MWk+qB5Tx4QO5AOXn6YYnPkOBMuzQ42mcAzf/
	giCM3r6zfHza/sg/7YmqvSkmJJ/US3uT1VMWQPDk56hp8S1I6FCp8glHtdKk8x5Q
	==
X-ME-Sender: <xms:PCmdYA1xGqRdgPuTmi5gWbyZLfhrRuI92kcj3qsjEHO0dLM1SdMI0w>
    <xme:PCmdYLHsxWacv85Q6RhhffGi23JJTTJJvQfFkFkvMpFOF6T7Sjosnrv593e_UxSvU
    Fjs285y0ZeHEtMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfveholhhinhcuhggrlhhtvghrshdfuceofigrlhhtvghr
    shesvhgvrhgsuhhmrdhorhhgqeenucggtffrrghtthgvrhhnpeehgeehheeiledugeelle
    etkeeijeehueetteeggfeivdekudeghffhueffledvvdenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeifrghlthgvrhhssehvvghrsghumhdroh
    hrgh
X-ME-Proxy: <xmx:PCmdYI4leT3QAhFMMeeZMQ3gRb7K6sYjC132lpi5NR7D5qgku3FaeQ>
    <xmx:PCmdYJ39HQwzvNAciF9z_hzzFcX_BhTWG1M7NpLASrumTtGbgcXlCw>
    <xmx:PCmdYDHOn0mFWLLUHMUJ74cu2c42Ja-YrtbVmIUoFkObd_9Uoq9dng>
    <xmx:PSmdYDHFQ4z2BvAaIRW8MMXzQwdIe9JsCINDpd_H58K-L09NoWxMgg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E8EFD4E00C8; Thu, 13 May 2021 09:27:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com>
In-Reply-To: 
 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
 <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
Date: Thu, 13 May 2021 09:27:04 -0400
From: "colin walters" <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] master/main branch renaming and bitbake
Content-Type: text/plain



On Thu, May 13, 2021, at 3:08 AM, Richard Purdie wrote:
>
> I had a look at the code to try and remind myself why it is doing this. 

Thanks!

> The best answer I found is that it does support filtered fetching of 
> remotes, i.e. it can and will only pull the branch it wants/needs rather
> than a full repo clone. In the case of a small repo, it doesn't matter
> much. For a large repo it can make a significant difference to the speed.

This is with `git clone --single-branch`?  Makes sense.

> We also don't run "test" commands against the remote repo, we figure out
> what we want and then get it with small numbers of commands.

I think what I'd argue is that in the case where the remote branch is deleted,
the tooling should fall back to listing remote branches, sort by
most recently updated, and try finding the commit on that.
And in practice, explicitly using `main` first in that list would make sense.

> Is explicitly specifying the branch along with the repo url such a big 
> problem? We already have to provide the url, it isn't like we guess that
> too.

The problem is that your build system is penalizing upstream projects that are trying to migrate
to using `main`.



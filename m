Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F101C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 11:27:06 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.8695.1651145221219641283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 04:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=YpOOyLEL;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 834415C018E;
	Thu, 28 Apr 2022 07:27:00 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Thu, 28 Apr 2022 07:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1651145220; x=1651231620; bh=swhhgRQMTU
	S4Xa3978EjUb8IGzMO51SJpQQYr5aHyoA=; b=YpOOyLELix+ehVzcGZN7KjLI9B
	verbj7Mpd0Yv8MRDSX6fKRc5Xjqs5EDBSE3CNFkWo2pRwU+YxA7vn/y5JUkrQeFO
	Gjpoht69SsvJ5dvBpS44f+F+6hMc0wqR2KTfpZ0qWVu0lFLalkr+WiyZ6aqffhBp
	E+9hU7I5ZMkAsogip4dKrkoSXB3Uz8kE4cqJhy4w5RVT8PqfeRh0o+hoT+aqtq+v
	xvg1f4frr24AcdZF8K/xF7Csoj+bBk9NVXcCSTuggBf/z4sU8qzYKdMvuZmt4Aow
	G4WhL0jqNaleiSxB5sdxXhux11UXcVG49sxiCrjJ7r/5dRINKVl6x59v/NrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651145220; x=
	1651231620; bh=swhhgRQMTUS4Xa3978EjUb8IGzMO51SJpQQYr5aHyoA=; b=a
	PZvm2S297MPXwX97Bz8U25ZKryFOAkB6jLjszECBw3eCRd9tClYwQAiSxguiFNAb
	NwyN7Nr9CcX46gJgXcLDljJsVkpebkUowmXzrva1+pujIjdZWvEIGd9haeNwcAbC
	rrsO6BmIJFxftMltUE7FVUtdzCSlpieFWNAYhln9DuQvyJXN487cU8E8m/e+j2Ga
	oyQVjA6yMG0IZgz4BmDfZmtpPMp+4vdtIeQZ+BZ9K0UjZuuwBK25GRcQFlouIRIw
	Hubb4WM/JwqVZib2haiaOhSmzw3pYP52ciqob6iY/Hwmop11zSa5NLw/nzMqQpci
	hZZK3WO5zs2cSR4kUyWFA==
X-ME-Sender: <xms:BHpqYl3pD-2DIrJJQa09C6n1KPOiKgpFMNvKepiVwFpel91nkMxXSQ>
    <xme:BHpqYsEGIktUlScZE5Q5495E4kcpz-QiZduTzAGFMPC-WzjU9ALJ2US5hWkl9JBsp
    V5Qli0tB4Xuskz_d8M>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffektdelfeffhfekffefueevjeduteevjedtlefhveelueeujeeg
    leeukefgffevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigr
    nhdrtghomh
X-ME-Proxy: <xmx:BHpqYl6e2h4STJot3y9ZdA9KajJ-7m168Y4ESMg6UnNvsmYVlx3H-w>
    <xmx:BHpqYi1O6VS401Brik-eElmf0iLUCDXemQPd0RlfB-Z2g7X-QlKRwg>
    <xmx:BHpqYoF7UhdK-jNgUwiuz75N0jUttfXFn92dKV7C_lFcnByG3P5Wpg>
    <xmx:BHpqYrzwPRo87IGo1AKuhVboO6LSkr3Me8H-rCv8Jx-rTZB5nS43eQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3A5F53C0F98; Thu, 28 Apr 2022 07:27:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <b2ffb05a-5792-4630-8a85-5d4d64c7aa53@www.fastmail.com>
In-Reply-To: <20220428062647.2717638-1-raj.khem@gmail.com>
References: <20220428062647.2717638-1-raj.khem@gmail.com>
Date: Thu, 28 Apr 2022 12:26:40 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>,
 "Khem Raj" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] kmod: Enable xz support by default
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 11:27:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164941

On Thu, 28 Apr 2022, at 07:26, Khem Raj wrote:
> RPi kernel has started building compressed kernel modules by default
> starting 5.15, currenrly therefore meta-raspberrypi kernels are unable
> to load kernel modules since kmod and kmod-native do not entertain xz
> compressed modules. There is a fix proposed in meta-raspberrypi [1]
> but the fix is needed for native and nativesdk recipes as well, perhaps
> its best to enable it here for best out of box experience with
> meta-raspberrypi
>
> [1] https://github.com/agherzan/meta-raspberrypi/pull/1056
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I don't see any reason not to do this and it does help with the BSPs using this compression requirement. So here is my +1. Would it be reasonable to propose to have it in kirkstone too? Otherwise, @khem, I'd need to drop compression or downgrade the kernel in kirkstone rpi (or make some yocto incompatible changes - which I'd rather not).

Andrei


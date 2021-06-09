Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.8099.1623247039079327724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 06:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=H5Wp73NW;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A88A5C018B
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Jun 2021 09:57:18 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute6.internal (MEProxy); Wed, 09 Jun 2021 09:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm2; bh=wOjGsIFUDCj3va2xcX7Sf9y0PpOuEWe
	sX24chZQYBoE=; b=H5Wp73NWqP2Mc/0I3VUnOm3X0nYvU+lIeQPAnbqdwNoJ5Lp
	J3snKe4LbPwVHCd8GLGEIMxJnQAVl2TSWxOz33dF4lFrtKPQTWB2ZLqpefN/gIQf
	gkDVRQE0Bjaim+cHL43zk5ZmAnIDfVu+ggIXd/SKlJX/kSCRV03UTih5jsiVVA9v
	X13WP1q+pxCk0M0QXSuyVgHBLv3zPmJPCSnHH4Y4MvF7UAHgHVRl0OQcK2EJPkBW
	EP4n0be0wC6IwqI3u1J3Ez59evvRXZrJyCcMXs2ISNVk6fjQ30/2OrJVviBV+b4A
	nsyEx8cu8SsAHK7QbuHj+4HZLSzInKMbrvpGjgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wOjGsI
	FUDCj3va2xcX7Sf9y0PpOuEWesX24chZQYBoE=; b=wn0m1Uqls7CqSZX1vqKgnQ
	L7CEBg8YUm8ey22kwaLoYjensNEJslqKDHId9Z2iEAN7jIr+o07GYolBhp5HJ+Jn
	eUsOATlqcmUGaZY6vFwpPgqyGQhTH/AhHiHUeANld/3VKpL+wJbXofP0mIN8dIr4
	nxPF/iWpG1/Lam4de2QlKmFnpP3tQxKlOBlzbzAzhHIY568TBN36nELcore/0rbx
	GhXXs6PUWewaHbl17YLZ0rBBml/V2RSqEGgKQWwNkro3jGHXubEz04g4Y8dydOpq
	0rI4kInRs6bSvXwKNkjRL4LYSkojq9w0+TXeReFzKdOfRuYz0ZGdFOxJMXSiskNw
	==
X-ME-Sender: <xms:vsjAYJV5yawcJ3yRQU5rVMBoqkoOH0Nir-f0BmVGLlgiYE0Mm9OzWA>
    <xme:vsjAYJm-VigzSckuBCCDxbgGknIysi3YA8mjAiG9s2jasKBnc3k8N_cVju6lbFaMO
    6JvDe4SGNR-_IP21qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderreejnecuhfhrohhmpedftehnughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgv
    ihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnheplefgffdvtdejiedvhe
    elfeeljeffgfelfeefgeeuhfdvveekfeeuueelfeevuedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrd
    gtohhm
X-ME-Proxy: <xmx:vsjAYFb1mHZasGCI1ySDZB1sBmCcASCjSI0na_9ypCDMCI-IlP-trQ>
    <xmx:vsjAYMUlt--h_8mMgKKzJ1kSH0XswQaEl_GOAfiwyr-ZkHF9YhmfIQ>
    <xmx:vsjAYDnXyYBdGLu2eRTadP6X85EBpqQJWQLgJbuh3_tfZr4w0_zy9g>
    <xmx:vsjAYPyhVRIvNHXelZN6Xu0YD3C1CBzOcJjPvH7491jUbTUTwbAupg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F2C80160140; Wed,  9 Jun 2021 09:57:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <57850109-e942-4b7e-ad3b-7536d779a2ba@www.fastmail.com>
In-Reply-To: <20210603142106.115932-1-uvv.mail@gmail.com>
References: <20210603142106.115932-1-uvv.mail@gmail.com>
Date: Wed, 09 Jun 2021 14:56:30 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
Content-Type: text/plain

Hi,

On Thu, 3 Jun 2021, at 15:21, Vyacheslav Yurkov wrote:
> It's often desired in Embedded System design to have a read-only rootfs.
> But a lot of different applications might want to have a read-write access
> to some parts of a filesystem. It can be especially useful when your update
> mechanism overwrites the whole rootfs, but you want your application data
> to be preserved between updates. This class provides a way to achieve that
> by means of overlayfs and at the same time keeping the base rootfs read-only.

I was looking into something like this lately. There are actually two kinds of write access - volatile (tmpfs) and persistent (to disk). So my approach would have been to use bind mounts from a tmpfs/ext4 based on configuration per recipe. Is there any advantage to working with overlayfs in this case? The main idea is to have state that doesn't come from the ro part of the OS because otherwise, updates will be shadowed by the overlayfs. So I fail to see the advantage of using a set of overlayfs mounts instead of bind mounts. At least with bind mounts, it will always shadow the rootfs bits so you can catch early this case.

Depending on your use case, most of the times, you'd want this "state" setup happening pre init (in initramfs, for example), especially if you want to handle persistent systemd logging or machine id, etc.

-- 
Andrei Gherzan 
gpg: rsa4096/D4D94F67AD0E9640

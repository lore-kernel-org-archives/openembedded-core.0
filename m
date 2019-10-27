Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B77777FA8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:04:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 471Lj823HTz3P;
	Sun, 27 Oct 2019 16:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572188652;
	bh=nZ1yCKFVxBDO35QcxvjBJHsv5LK6685Ymd8oskU8HuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeZtWaScvo0ch7gKSjYxBT62F5DHTRgU4vzBbsljSyqXiRu+HTUq8l7o+bKtSqDh2
	O5A1Z4aIIIetPToE3DxCqGLMmZt9Rc9TS3HsgNq1laqzEA41YlHCvwnTPVJPv7eOYg
	33hHwnApnUFwfhHg6sabZ1vgKr8XgfqZZfQmdFu5ixMxWXFd90ds8TfCa2/Vfv62az
	2YZJSMdVkFh4wSBNJfP3vViXogz3YaXj6fOS1dDXLfEKBPq71TNbL1UE9M0SbwupZX
	q0M1hoSEQoImVUbeVW9cwvHkkvmkj/rFdhn/WkwhQQphZbFyBgbWgjZu9hLTinexg2
	x+48q0Ajt8VpOcKAhnPqPE3oZ4w0DnwKG12N28m+kOyF5vD7hjv/Qveaq3fgzA02eK
	WPAHvAvapLtuMGC0gcnsCR/TWa0jQJ9aPEKAH5COXICwv0UD81EpUcYhOP/pGiQyeO
	snw1TtrQ3YZx1G7JErH6ETkLBko6WbVdkNfrl7ioZ7hZ5oUOUyulSCrlLIQ2PXmqPZ
	JtYrtMRXBm74tStIWDOHf4VyZdro8ZW10N8UOkePhhWblCie/An1oY4DFDd8sXM73z
	QO+7DcA6L+jvff4L67Uuz97IGz9IvDXg/yz0xs17/pcj8XBQuLRNvtmmtVsX0YEfO3
	nCMzIRhC+iYtgowHlLUHrDWs=
Date: Sun, 27 Oct 2019 17:04:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191027150410.GB31803@localhost>
References: <20191004142027.27324-1-bunk@stusta.de>
	<3fa389507f352aab06a4e084039e0bcf68bde9b1.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <3fa389507f352aab06a4e084039e0bcf68bde9b1.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] coreutils: Move stdbuf into an own package coreutils-stdbuf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Oct 2019 15:04:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 22, 2019 at 01:50:05PM +0100, Richard Purdie wrote:
> 
> This seems to break core-utils-native:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/1157
>...

Thanks, v3 sent.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



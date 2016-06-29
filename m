Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A31460043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 14:42:34 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id ts6so4599128pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=WL5UteV2R5ewWdlaKRj7wby3rT7b9pYdACY6xr8AsBw=;
	b=vB6bgJEL+cyP0dFC3OdhNy1oIAr7bMUYK0fSa0n0WtkY06GKiFFBpNXnJYBhvHU6nr
	oKFs+He3JiqXT/kB4K7vsnB6vRLH7E08dCVJKxlnjNTTMX3feD4yf3ERe1XTstsI/hlL
	ybh/tjCpZ6zk3jWpzCF1EG+3FKB97xTSb6UkFKMKNwIibYXjGj9EbWVR+OP1+Xl/jAq2
	eHcgR1wK6CR5ygmERXlGi6ddcIaVw1AsJjazBTW9bKH3Ozl+I12RpRNf0xl8K7F2PYhW
	+kagk9WZD+eBrcs6Oc7/XNzUQ9Dcd+M+CGRVW7Ht5RGMPcizPrJuVWoc4Mt5HcUTvOyt
	7k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WL5UteV2R5ewWdlaKRj7wby3rT7b9pYdACY6xr8AsBw=;
	b=N974u2oeT55rrzQOBfHzimCBByvbYvcUJJ5MvXYVUkmGejbx/QmuxVelz5snI1LW3Z
	88G6quzQ7enxZ6TpfrSYDo3MGQhJ0SqJ4xMLY+p/A2pvPPTOSbkKt+OJUuntzGAOaTPH
	Bz+cVMHwU6v1s6py3puClTEX34WwrqDPgOO7HweHoJ1/7w9cK6hOI2jYlVx87897opCs
	sQ0FbRRA7UGedLwsy6YsHPSn7k5uFNKrIp3yA4YsLL9FMJHwjHoOK5A9bkOhLm9EkLIN
	v0d/s5UGo6cqwob0WKixUhX8qbPLfmB/HBgI4PI5HfbYQjSg4JfcJNn9pVSD+jZWGfM4
	/Ryg==
X-Gm-Message-State: ALyK8tLrvPO0PvoTCpvoOBC1BZC3LMoyLFeIvZHo17a3HFEUF9G86EJHAdAaA/8zGjVO1w==
X-Received: by 10.66.253.38 with SMTP id zx6mr12309963pac.19.1467211354760;
	Wed, 29 Jun 2016 07:42:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:24a2:4605:83ec:ce41?
	([2601:202:4001:9ea0:24a2:4605:83ec:ce41])
	by smtp.googlemail.com with ESMTPSA id
	ez6sm6637440pab.12.2016.06.29.07.42.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jun 2016 07:42:33 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1463979792-7559-1-git-send-email-anders@chargestorm.se>
	<574294A2.9000806@gmail.com> <20160607073112.GC3930@ad.chargestorm.se>
	<20160627070349.GA20550@ad.chargestorm.se>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5773DE58.3020909@gmail.com>
Date: Wed, 29 Jun 2016 07:42:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160627070349.GA20550@ad.chargestorm.se>
Subject: Re: [krogoth][PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
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
X-List-Received-Date: Wed, 29 Jun 2016 14:42:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 06/27/2016 12:03 AM, Anders Darander wrote:
> Ping.
> 
> What's the current status?

Submitted again. Hope it makes in this time.

- armin

> 
>  Anders Darander <anders@chargestorm.se> [160607 09:31]:
>> * akuster808 <akuster808@gmail.com> [160523 07:29]:
>>> On 05/22/2016 10:03 PM, Anders Darander wrote:
>>>> In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
>>>> for images using opkg, which included openssl was fixed.
> 
>>>> However, that broke the generation of the opkg-based images, that lacks
>>>> openssl. The error is a python stack trace, showing that shutil.copytree
>>>> tries to copy a non-existing directory.
> 
>>>> This relates to [YOCTO #9040].
> 
>>>> Signed-off-by: Anders Darander <anders@chargestorm.se>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> (cherry picked from commit f6b0b260ce18a30d04edfb0afb7942b9f9a5480b)
> 
>>> pulled in.
> 
>> What's the status of this? Waiting for autobuilders?
> 
>> Martin sent a query for this patch last week.
> 
> I'm also eager to get this into the krogoth-branch. I'd like to enable
> debugfs, though, I'm also trying my best to not have to fork the krogoth
> branch...
> 
> Cheers,
> Anders
> 


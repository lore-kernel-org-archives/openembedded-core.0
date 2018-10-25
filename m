Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id EE9F27017B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 23:01:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id l6-v6so10958585wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hNToDCHHZbzINxzIArXprSDQVwBhef/enCL+Rcfx6B4=;
	b=Vvh2e0a0I7dPJo9iMdtQ3kyJCt8V785Sa4TJf57kMH+EDfzJ8BT1aE0xJdMY3GvqGT
	EEBCBlcsCGB0txK7p6Sbe/Rx3v66ekhEcsXNqQd8uqxeo9AlJY/F+ENGL0D/mB+a6jsn
	NtxxUSDoSOwbFjPCwPq+Jbjn8r3xK4q4qB1qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hNToDCHHZbzINxzIArXprSDQVwBhef/enCL+Rcfx6B4=;
	b=qCm3AEFn8CFJgLeZ1KZlHRnpmgQtGQZurlk0pquch7UneHVRMqTnua/xNSLYsL8Xob
	NIH3ql4YacV+D+dngvOJ0fgzM2K21VOR6n6R9UtuQ4n1ccxJRPYZO8nX6iisMEFiY+GE
	JxlZR7cs+gmvdErHtpJ4Oy/Dei2sn8Dg8ctn8CkLI5133kACniXIm5HTLVQ8v8NRTBg5
	acrZAT16OUuLHDzk0D11ao2qqp12r+0raSpgBFe6N1URjJYwTuhXkqCtX9uC3tkNl5wk
	BGhnzws0KrwzBS00zTdVD/my0aFMhSbjj0WEkpCFHdKbgXztU56OxrklI58kl+2ArGm8
	bJYw==
X-Gm-Message-State: AGRZ1gKckI9KtATwQ4NmexrPdv32qrPglgXL1qTEJIRdpFiMwIA/v84F
	uDUjCt45FM2QZz0ZBrt4Y/INVg==
X-Google-Smtp-Source: AJdET5fXLKBtmLRPDehtqb9X4YFHyEFw2vlv4JyZ89pRq6E9tws+CcD1jJ8jPtNu2kXioCcSRQjcYA==
X-Received: by 2002:a5d:4d46:: with SMTP id
	a6-v6mr3607350wru.316.1540508466427; 
	Thu, 25 Oct 2018 16:01:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x139-v6sm5461320wme.3.2018.10.25.16.01.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Oct 2018 16:01:05 -0700 (PDT)
Message-ID: <83b168a1e17b089c452edc2501150b27311e378e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>
Date: Fri, 26 Oct 2018 00:01:03 +0100
In-Reply-To: <376c502d-5d87-3a9b-3f4e-6b6854379a51@windriver.com>
References: <376c502d-5d87-3a9b-3f4e-6b6854379a51@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: About uninative-tarball update
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
X-List-Received-Date: Thu, 25 Oct 2018 23:01:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-24 at 15:47 +0800, ChenQi wrote:
> We recently got the following warning when building on ubuntu 18.10.
> 
>       WARNING: Your host glibc verson (2.28) is newer than that
>       in uninative (2.27). Disabling uninative so that sstate is
>       not corrupted.
> 
> I checked the official uninative tarball on 
> http://downloads.yoctoproject.org/releases/uninative/2.2/.
> And yes it's using 2.27.
> 
> Our glibc has been updated to 2.28. Is there some plan about the 
> official uninative-tarball update?

Thanks for the reminder, I believe we have a new version built and
ready to go in now...

Cheers,

Richard



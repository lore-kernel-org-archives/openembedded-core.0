Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 647117E407
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 16:23:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u8so2519532wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pcS6rmv3L7mnx6qXSYsRurOD9kE24O4VljnOjhl0+j0=;
	b=FQ4EJkrRghHhEAmgu+MeQ0k3cI1hfoEkzXVztQEJFTQrzhDmotSEFPYCQ0cP0+JDXD
	9qk5V4iq3YeRSZwRBardnMbn3oL86HQkRHcYatawAuOd60VSL9papbUcTBHsCsjS806V
	BFMzWrHkoSuE4F8BINA72fKCNDm+QTZyOlGCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pcS6rmv3L7mnx6qXSYsRurOD9kE24O4VljnOjhl0+j0=;
	b=E3MvqszPbp9iJbU6FRbeB6gf8tVYQhurlW1hl5T1n4fN4SumMWOKLHlLa/RemL94cp
	n7qIlJl+GTa9Lb//pcyKEgMCl2dFL1dgVzT87104K4DCdLSmAS0Z8TPwUgGRFtikYxyT
	n+eJZCiv93SKINublmuz2sAuWsTsJi2xLG2s4FKeNgBfiUbktpXDvYsvYXSmG6PzqeOH
	rHrLPn8oJbRwkrqvtVTTM48hMtTsW4OcClHKleZ3t/dzTdQmi+auJM8U7iPF99stEnY1
	PEKijHiFSArhCKvlXxUAUwZNxvU2d/yO5DDV+9hgcBvqoAT6pdnWJ4ocy0V52gBzg3st
	Yjfw==
X-Gm-Message-State: APjAAAXaE2/uunSkQL7KDAmO6Uw211avzeabHgA7/tEsY16PghBRE/bs
	G/kZaF2D+N7RtGR6TWRUpldZMw==
X-Google-Smtp-Source: APXvYqwflCiDfq3kDosf3cvpXniecmdlFV69za1x8W22fs5x9G+vABhTvHZZVMacxsIME5t0ZIipuA==
X-Received: by 2002:a1c:c305:: with SMTP id t5mr4161387wmf.163.1559924634183; 
	Fri, 07 Jun 2019 09:23:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	135sm2869050wmb.28.2019.06.07.09.23.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 07 Jun 2019 09:23:53 -0700 (PDT)
Message-ID: <c0cb96272d5dd5dddfe61dfbee2f428156b124d9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Joshua Watt <JPEW.hacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Jun 2019 17:23:52 +0100
In-Reply-To: <ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
References: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
	<ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
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
X-List-Received-Date: Fri, 07 Jun 2019 16:23:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-07 at 10:51 -0500, Joshua Watt wrote:
> Is there a reason for this change other than aesthetics?

I have had a lot of complaints and in real world use I can understand
why...

> FWIW, we maintain some recipes across several versions of poky, so
> this rename is going to cause me some headaches

The mcdepends code is tollerant of either naming. We could teach cooker
to translate any commandline references so both worked there. Would
that be good enough to work for you?

Cheers,

Richard



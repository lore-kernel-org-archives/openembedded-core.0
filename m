Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4257F9A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:37:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w18so26486734wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=SrmGp7Axk0L/hC5rSAmgMC0hmdR+Ae3ssHd9WYua19Y=;
	b=GKICxrZErXRjEeBAJicpowqAYK55vJu5n/AH5gecS0e3pGLCmwPvS4gcMxkmR1sddL
	sWUoBCruU5EL5qltI9DgYpC48Li1/FXIUP+r5jET26fI/d+q1++yy87BSwf6qWOYIiQm
	urnO2jXdj3FGYpCQpoh19OYQpP98elGyWl9rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=SrmGp7Axk0L/hC5rSAmgMC0hmdR+Ae3ssHd9WYua19Y=;
	b=btXTyzTup+osvN9LRtskpkftSYJ6KaViBhYghDLumBc1HCX8qgtEgme2JeWai0Npyb
	Euid1SpwkMdOWjO9ZBPaIUuOSxGNffmVPkkWX4jn/lveqSUTNeiPT2flFiUX5dT0JXgI
	o7XlbxlWGGg0xNUZfjxG4X0UnXH/UqD+ygTlA0MjuZM5SlGqJ6+Cm0v1ml0cNU9dha8U
	WUHoJB49Q/q3i0YUqaNv47kLf2SU/FZFfXcvzTpdWxIm+sThSNHuuQskH1XX3UXeN7M8
	ivfJZtP6eALswuQgqecNB4nsJGfOj4lnt6qOhX3CKQpVUZ9zLEuZChysx19n+VdoJpu+
	+7cQ==
X-Gm-Message-State: APjAAAXEeDWvLVWu7vz8bM8kDem/sU/8kVfYPsn8b4Qcc2UVjt2lo7J/
	r65YPoQlYLvV/4P37CCe3yOFtA==
X-Google-Smtp-Source: APXvYqwi4MfoEE90lPBpk572tJ7ZYDfGOlf2gT1um00Bm4VCiHNQmnCMcRcYzmuAOP3cHqG8FeLycw==
X-Received: by 2002:a5d:4885:: with SMTP id g5mr5361346wrq.219.1571938670069; 
	Thu, 24 Oct 2019 10:37:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v128sm4610383wmb.14.2019.10.24.10.37.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 10:37:49 -0700 (PDT)
Message-ID: <7d5b190d3a523f973ce6788d0234be31fe8cb631.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kube <alexander.j.kube@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 18:37:48 +0100
In-Reply-To: <20191024172908.68056-1-alexander.j.kube@gmail.com>
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Add recipes for Go v1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 17:37:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-24 at 21:59 +0430, Alexander Kube wrote:
> This patch set adds various go-1.13 recipes and changes the
> poky GOVERSION to 1.13%. It leaves the existing go-1.12
> recipes untouched and available for existing users of
> those recipes.

Thanks for these patches. How compatible is 1.13 with 1.12 and do we
still need the 1.12 recipes? I'm wondering how hard it will be for
people to migrate...

Cheers,

Richard



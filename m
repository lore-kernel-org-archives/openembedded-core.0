Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9F16B513
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:25:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so3858274wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LLe79CZwzRK6vTqw8M2KHHAxtMgcZkXXZgcY/QZPS5M=;
	b=BuJgpCsj8e7++/EcHcgEDm8aGx4Z5x94JCfuKujBf2bhebgM7V0jl7eg+QKPUpvFnO
	Ou5N6aCqUlQneloiCdZ7WXhdekBAv87t2M7G18EMQjQlcqnKyydWQUExYgriE9PTMs8V
	4f4eQnbDSw/fnxnOMk4hep6bBSPxCzOF3Z72M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LLe79CZwzRK6vTqw8M2KHHAxtMgcZkXXZgcY/QZPS5M=;
	b=q2BHZDuZLeYaeSngXBtZFYMuNgugPJV7nOLjVgMmWCl66GUSxsyyoOF6dh4O3mZKZ3
	Rpz+6dutqEshUuADEAajPlySxdbaRgcvr4alrimBee7My1pUB8w60QdlVhfYwMbEYCVx
	rZLawVkL3pvyuE22PGuXa9sQbB1VvJyZxSqdFctUS00+82gpNIjAOPv34Glyjs9AQG3L
	TYy9eWE4fp7PndfcfNVXUZB0dIQPdihIVC2yhF/nEh2t2fa+dXIdANtJTFZ8IUK/J3F7
	8kunxuF0cBicrrhIjl6iYKcsiF9vxztIligw7nrf4erOUgQb8stIbjreYXYUtS9o5yoS
	3vzQ==
X-Gm-Message-State: APjAAAXqTe4A0owpYj+4LFR8xYm2RNpn5LhnuJ4seFF42O43qnt3vSHL
	d/jey8Yw4VrtvjVwNbBjZUfItA==
X-Google-Smtp-Source: APXvYqyZFFOUHjNXbKBNcOFwU5OmxeEf7GXg92JOVAEeNiQyhDwpPolu29Yh/tAq1h69vfzGj/F61w==
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr7176710wrp.37.1559319913198;
	Fri, 31 May 2019 09:25:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r8sm5328311wrt.92.2019.05.31.09.25.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 09:25:12 -0700 (PDT)
Message-ID: <b22d487548905237681a0d8ea2c18a17da1714c2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:25:11 +0100
In-Reply-To: <20190531155612.75663-7-alex.kanavin@gmail.com>
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
	<20190531155612.75663-7-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 7/8] mesa: switch over to official git
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
X-List-Received-Date: Fri, 31 May 2019 16:25:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-31 at 17:56 +0200, Alexander Kanavin wrote:
> The tarballs for all versions prior to 18.x have been moved to
> https://mesa.freedesktop.org/archive/older-versions/
> 
> To avoid this practice causing fetching failures in the future,
> let's use the git.

I'm really not sure we want to move things over to git, it does end up
making the build process slower as they take longer to fetch, unpack
and clean up :/.

Cheers,

Richard



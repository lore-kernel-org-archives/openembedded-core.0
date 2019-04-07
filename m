Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4CEEC72EB7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 21:38:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w1so14044720wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 14:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=trp7rn7FDtTwIl8KINKUGeU03yGo34rCnN3jIhWhXUg=;
	b=J+qvd5mg8l3U742yxVtZwj7gZOUIvhejckNmf/a1yNKCWfUJ+Crrr3d98U6qEofa2n
	jV1Vnc6pUu2AoVxvcFK+kss/zshNYV5pRk983QPEbmLz5EKYBrJBZR0IdBKaQmAiAcKc
	BjosRzxQ8oTG/yZX/w6SVX2/PZorJWhNRA3Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=trp7rn7FDtTwIl8KINKUGeU03yGo34rCnN3jIhWhXUg=;
	b=mk8sciRRAXs5+g4m+BgahYl3weKypF42SQcTPuMA/rE44oPHxwwQZtvppumHdyhRVC
	1ZRq74Jah0XR+j4xGGvn//ZpbzBRQzPCea5nnJ7BraG86v4+atq3DhaRgNuOieKi+Fjm
	kxmW1VZoxrBd9uVGjPko5T+HZ3SVKNW83ozsTXczyBm1FdwXw4GFBHAIqji6aYlMW6mZ
	C383FQCiguTfZoEWtoNXQApHyyA79d7ubJNxw6RWwN64Tjl6QARvnXUmg5jnMRy+S0eI
	2LfkXec/ndZOajqbmnA/5c3Ix0UNM3JgW38hXZBGE1N/QVi0AoCuz4P02Yje3+4MI9lu
	HVfw==
X-Gm-Message-State: APjAAAVo+Xz0sAhGDCsQwI63XhvBDGBcy/HStPiHizKYwaOykCIve781
	SyLbZtRWLipWCoLp6TOV2hDsaA==
X-Google-Smtp-Source: APXvYqzOb1E8fHUHFwu1Kxy/7uOTt/vO3Y1zp8kHbb9nxXFxUd3e+4o2wbY4878Vhth7aWc4VBrGxA==
X-Received: by 2002:adf:dc4a:: with SMTP id m10mr15799457wrj.0.1554673098905; 
	Sun, 07 Apr 2019 14:38:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r30sm89694715wrr.46.2019.04.07.14.38.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 Apr 2019 14:38:18 -0700 (PDT)
Message-ID: <6b1ead98bbe9899faaffa0283deef5fec6b75c03.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 07 Apr 2019 22:38:17 +0100
In-Reply-To: <20190407001150.41719-1-raj.khem@gmail.com>
References: <20190407001150.41719-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "mdadm: fix gcc8 maybe-uninitialized/format-overflow warning"
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
X-List-Received-Date: Sun, 07 Apr 2019 21:38:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-04-06 at 17:11 -0700, Khem Raj wrote:
> This reverts commit 630281663893cdcfa9c4323b717b415d87d5510f.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I know the answer but just for the benefit of the git logs, can we say
why please.

Cheers,

Richard



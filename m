Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 095917DE5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 05:49:07 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k2so14033078wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 22:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mxNB4FO6Q99iE9lbpQ6aq7SgSAYeOlYQhdsi57O0Mh4=;
	b=Z1CY11YbDPWuypX9Yysj8sR0Zm7RiADxXJv0LCldDqXQ+860TtpNmJK6QHp73wbL56
	EqpwQTNdhYQLeWnFGerIowIeCP8LUeXL69mIEXnpUmVX4fP1NoZ3ZXOj4ZiOR8S5vmPB
	d2wPkgrYZ/Gz/kIdUgKeN5wXvu03QOhjKw9CVvNgLqw/gmvlY7bmfrFd3l1OyaPsvptl
	oJYtgIkuLauJFvZWaEO3dPyvblG5hszD7b8Ua88SaWnV3l08DiMPASi7SlNl3HiGGn9a
	GRaUuvppDrNCaAW4iBfhZlndSrcTrLvsxsQaoXYa/bnJ/sgKVNOp5hk/6c8XYWBjowzx
	Ux5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mxNB4FO6Q99iE9lbpQ6aq7SgSAYeOlYQhdsi57O0Mh4=;
	b=PUgrEum3EaeWS8ow57yjTHlQ94Re2OO6uyep9Q6ZgCI2YJCq/L+SAXH+Zwt4rG4c22
	1Xj1JArvmVu2em79SRBGR73w7+nUg2HjaSjo6M2OvCYOz4pcJUjB/0OIZLMuWX7I63Yk
	o6VILdNz8BNpBSWxybetAws44T2RGPQZwP0brZYOGKB07YyaPVyTgDoyt0ZWR3typjWV
	yT2xmjqiyX7yfFQ1hppAfnZlqPr+KXKdAdm+IjNESInMmzlnM0MhAzskBKbxnGQ50jQ/
	dRcH57DmlkXhsC005p6ZTWovhzf4SXClEahT4vDQ9KkTn8/9mwUpiaAbBwec9iXX+ZeG
	LWzw==
X-Gm-Message-State: APjAAAXfzAxAiR28cT+9rticRJGlZksY4ViWJRe5zqCsOD/3afqJz3a5
	vnAiyQl2wps/PH6bq52Qc0s=
X-Google-Smtp-Source: APXvYqxaQTOnK33MRduBgXEKUJr7HWr0OM2uWr2VTkY3R5+gU07nFkRQVV8jmBFxeUe7zcnPhrd/rQ==
X-Received: by 2002:adf:c508:: with SMTP id q8mr19619976wrf.287.1566798548649; 
	Sun, 25 Aug 2019 22:49:08 -0700 (PDT)
Received: from x230 ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id m6sm8179707wrq.95.2019.08.25.22.49.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 25 Aug 2019 22:49:07 -0700 (PDT)
Date: Mon, 26 Aug 2019 07:49:06 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Message-ID: <20190826054905.GA8260@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190823215653.27040-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190823215653.27040-1-changhyeok.bae@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iputils: upgrade to s20190709
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
X-List-Received-Date: Mon, 26 Aug 2019 05:49:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> build system is changed to meson.

> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

BTW It'd be worth to add this patch which fixes regression in s20190709:
18f14be arping: revert partially - fix sent vs received packages return value


Kind regards,
Petr


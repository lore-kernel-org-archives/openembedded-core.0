Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.26846.1593897206065661895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2020 14:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=j8AmR5dE;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=cbi1=ap=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49zl1J17M1z2C;
	Sat,  4 Jul 2020 23:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1593897204;
	bh=GTRbg3TpxBTuIc2xpTEBz7dkv0d4DZoh/TKzUXn9Lc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8AmR5dEcE5OCcG+ROr/P7x/D5j5Ph1pkh9PQ7naAqUPi3N0z/hUgdvi0R43rjGou
	 70Ot0F3p/YxIl5jfazq6nhvhKiucXApe3+O7lewgGMxOw3tCQA68SrSIAd+STHll/e
	 OCvv59RVkSHKgocSG5Yb+JDnh8BwtRGaPVqsuvvLAtzuVcNxXXxDcD3Y7z0yZa0bc/
	 6IFJu+8Tis28NZ6L7gedw4VzuVm1SbWKEF60asUEW8IzfstHmNVWIfRukWIJapK76F
	 P1KpftX1RPLMqDvODDwbSjre3CT2Nnul/1SHzaC9Qy8yWcOXxV8Inl+dWMj7yC2UNO
	 7FYrGxBN15tJXa65tP8hDmq26nMYDkJ0PsToLftYbmXecSS1aWWh89y2ne+y8ZxbHR
	 B7WwigqA5flcQWsvYUL7GS8bypNbkPTTqsBrkcvi4JAu4qpHI+iZXWo9yV+VQHfRm3
	 3GuXnLoj//6VbzdhPho0VR6md9Xk79K+G7HfYeeIZ7qP/X9gNJNEWSjCaQ7cN5IzNL
	 fbB9vquPJI5M53Arord6FlprRrkNd0ctAU1U8vNELgG0MgNTfWFrRqFD37r5LbLggQ
	 9zlKBr4C4uq839rAIvabeLbLHcZX4lBvSt7mxL2ItYigmWz6qNpxv4mpxt7GOl5tXE
	 VdgLft3t2xR4jRkLc0ez4cr8=
Date: Sun, 5 Jul 2020 00:13:22 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [zeus][PATCH 08/10] kernel.bbclass: Fix Module.symvers support
Message-ID: <20200704211322.GB24166@localhost>
References: <cover.1593474787.git.anuj.mittal@intel.com>
 <03248953d1eacede00971289dc9fff8d97d00464.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <03248953d1eacede00971289dc9fff8d97d00464.1593474787.git.anuj.mittal@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please drop this patch:
https://lists.openembedded.org/g/openembedded-core/message/140233

cu
Adrian

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.13342.1607014970690306917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 09:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jwlFSHWv;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v3] net-tools: split into binary packages
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607014967;
	bh=sam/hVYQMSfWqtHlwhKMcCfbpgYnBn298dSlIE9iP/g=;
	h=To:Cc:References:From:Date:In-Reply-To:From;
	b=jwlFSHWvQNZAuO5fNp23Z168CLrWLrCsG2Ty3mBd0ntt3hV6ZIBmKRuaBFgZjkJ2M
	 HsGgPwT/NbTJDpkbUj+sgkalaLXfk3m/hSOj/UfMOiV3rW3wk3//uE8qL+za1B14qs
	 ARp/iNwnVyNtp7xnDLHhHJL4t3GDWix0Z8lZxCOgNz9DslZ2ZxMqiAfHT7nf0j1viz
	 OZq8rX9R3XN0kXCxzYaqwPcozV1EUf4dl16M6cTisj9t+Zro1m+yjkEhnjbuthQkas
	 wOwzLoXVGCe7yI1SlwkLomjvRKEAygHM1foJWAuW7NgUqKkVHSY+CpFeBJbHfKd9WW
	 uQNQogkdZ4Ctg==
To: Anibal Limon <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20201201033449.8961-1-okaya@kernel.org>
 <CA+_AqivGc6Omr0iHes0TKWoxWZOncw=ZA6YQCsCYVfR6YaDMvg@mail.gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <a4587c4f-4632-e0fd-e9e4-6bccd1e27110@kernel.org>
Date: Thu, 3 Dec 2020 12:02:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CA+_AqivGc6Omr0iHes0TKWoxWZOncw=ZA6YQCsCYVfR6YaDMvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/3/2020 10:40 AM, Anibal Limon wrote:
> This patch causes problems in multilib configurations,
> 
> http://errors.yoctoproject.org/Errors/Details/539019/
> <http://errors.yoctoproject.org/Errors/Details/539019/>
> 

Thanks for the report, I'll take a look.

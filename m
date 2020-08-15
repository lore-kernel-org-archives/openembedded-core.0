Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.8074.1597507838962306283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 09:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=IseJTde9;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rxex=bz=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BTQJT3KLDz4y;
	Sat, 15 Aug 2020 18:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597507835;
	bh=d+aIhPZpzPDS6PjxjGPtWpA7JmnbWUbOsk1gptIIhZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IseJTde94FL6IsYli/vLTvUrgiV2uHksZM7LIQvi8g3uDj0S7OuyZp6IvMurP+b6v
	 ygEJfC6TMmj1+2+By7PrpAeOWmS8d4mXmwqTt/z3ufcULbc+u2uETlu6JanwrNcEqG
	 gKC2Gr0Mo4pFKKsE2QN+9V8y6g3j4LTf2g9Npn4dokAUqXgKd2ghOC7yBbrktKHYue
	 JR4pch4/P2lGJkw+X9bS/EyKrZiCrhus/2ojKxhfElSdXF9rknhZqDhsLZ6eUwnfht
	 Sq5zsA1Ox/lBKvHwFHAwNElPRxyqmZ2xXJbm7/zaAg9HVTTKfMdSZjY9qT5W6UVRJp
	 Lg9QN9bd53oJAe1HuuU1lVZhiG6DsBi3bjvUCOR7HEO5sHLJL1j5NjvSH4oQ67W7VO
	 bX/X9Y6v3gk4P+kVBkEj663SduXhvfSheF3UC1i4t3SYbITJ2BuWMQEu10kyC8Jrfb
	 levF3SXss9OfPHbKRwPlV1+cpVs1YbqPBtHElJ1bUl6/jWUBkrZfNSOP+RvUj4t61K
	 ToMLvL3w11bC/QBKRzSaCMUypV0QtrQg53C6lTFZpwOQNj3vd61NuADzmC4WowY8U5
	 vpGKhfKP+2qZKuO9Eq3/Pn0l+N/33tkNBCYNGfS+oGR8q1K2HwdhYq7L6q3frn4gER
	 HmdEW9qKI4TNzE8iRc402xFY=
Date: Sat, 15 Aug 2020 19:10:31 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Ross Burton <ross.burton@arm.com>
Cc: Stefan Agner <stefan@agner.ch>,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [OE-core] [PATCH v5 2/2] image_types: add Zstandard conversion support
Message-ID: <20200815161031.GA7593@localhost>
References: <20191120124146.21245-1-stefan@agner.ch>
 <20191120124146.21245-2-stefan@agner.ch>
 <7eb71f58ebc85c734109a6635b620b66@agner.ch>
 <8ba354cf-b531-a386-32bf-fef3a33d0ef7@intel.com>
MIME-Version: 1.0
In-Reply-To: <8ba354cf-b531-a386-32bf-fef3a33d0ef7@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 06, 2019 at 12:00:54PM +0000, Ross Burton wrote:
>...
> Personally I'm leaning towards keeping zstd out of core *for now* but I
> struggle to have a strong opinion either way.
>...

Is there a chance the "for now" is over?

zstd is becoming more and more popular on the target side,
and right now cmake is already building an own copy also
on the native side.

> Ross

Thanks
Adrian

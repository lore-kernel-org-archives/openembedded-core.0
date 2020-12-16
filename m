Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.107.1608139117590169218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nKTE1DNZ;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v5] sudo: split into smaller tools package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608139116;
	bh=HSVKMXbw1zk+OONl3uKl88LYH2tlHnNbvU8GLUILk3o=;
	h=To:References:From:Date:In-Reply-To:From;
	b=nKTE1DNZzPF+bh0DrVQj9rK8nm7sVogHD1qd9epjoNdp7SqMhKOcYJpRh94aGmHKt
	 2LwKfMboSnpgyQbicYLT4Bxe4aY3AsMSseeiFpl43zI9WK7v5C9wW2Ic5vshKPw0S5
	 +n/xSd4fBLDYa9HGO1wQHKDgutiE2pUhwz/LI2iNB9BNsK1wBbycpyl1hgy0To8fej
	 ru7h/W3J4ykWNpqqjqB9oQMgIm6c/NMAvEy9yCHQx7KiUxcEy536x0/c3kOQfKnNGv
	 soUEBEx5ktsAQRgYRS/xdFbHbDjGDAwkl/kMcvShs4IYG/XlvrbJ392Qb5VkCIu1fN
	 Gok+De5vCkzLw==
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
References: <20201216165609.28794-1-okaya@kernel.org>
 <AM9PR09MB47392E6E695982CFAFC326B8A8C50@AM9PR09MB4739.eurprd09.prod.outlook.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <b39b1794-8291-02f8-a43d-a0a97a177daa@kernel.org>
Date: Wed, 16 Dec 2020 12:18:35 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB47392E6E695982CFAFC326B8A8C50@AM9PR09MB4739.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/2020 12:01 PM, Konrad Weihmann wrote:
>> +PACKAGES += "${SUDO_PACKAGES}"
> 
> I think needs to be PACKAGE_BEFORE_PN = "${SUDO_PACKAGES}"
> otherwise everything will end up in ${PN} as the list is appended here

OK, I guess this is what I didn't know. This is unusual keyword that I
have never used/seen before.

All other examples I looked had FILES="" and split the package into
smaller subpackages.

I can rework the change to just have sudo as a small package with
PACKAGE_BEFORE_PN keyword.

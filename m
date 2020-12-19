Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.3729.1608346332260168333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 18:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=V6344LOR;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [PATCH 1/3] rcS: Define identifier for init system used
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608346331;
	bh=RWhFoBDbO21KweaOE5lXjKlFxJX9bhs9tpAKRJDcoGc=;
	h=To:References:From:Date:In-Reply-To:From;
	b=V6344LORVbPbLsJY2/vPGW+MsM+2NUz6IIoE5rI4Qzp8Gdof04T55o7JyXKMrla16
	 QkPtzPhZdOfVtBsUGknmFXXzt82iX7xH0bBGXRdPnQUJHXxJFHVVS9eHmio9DLrz8d
	 cbZPgXS98rnyJvXS1kdLqVGlNdtao7stAcdPKJrNqs/c8FBUnqnO3ilokM0blV51Kj
	 YmzHbLjCB/PrmWzIzk83seEeer2E45w5SeZnYvh2xJ9SOcZVRfT5MUdNPMdSvGrhyF
	 YsQparQR5P29foG7iXwqqhSvKcNa7YxxSVSlFBvTfMkCMLunqnxghMTRUFn7roNaAM
	 tQbxe0HOC5XPg==
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20201219022343.3362531-1-raj.khem@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <52df2b4e-a07f-a282-c882-245fcdd3b846@kernel.org>
Date: Fri, 18 Dec 2020 21:52:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201219022343.3362531-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/18/2020 9:23 PM, Khem Raj wrote:
> This will help in defining init system specific portions of initscripts
> which are shared
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Sinan Kaya <okaya@kernel.org>

Reviewed by: Sinan Kaya <okaya@kernel.org>

for Patches 1-3.

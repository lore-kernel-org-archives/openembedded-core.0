Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.60495.1629319058659240176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 13:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tC9P1/7P;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC311610FD;
	Wed, 18 Aug 2021 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629319058;
	bh=lnobyPH0gEYsYWmJoIHKI6IyMcL2zsrcZy4UDZIPJRc=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=tC9P1/7PuGZb9mA1/lrQ2gV3xrxGu1rHHG5GVO06s7VBLm1cgNEGqBGIKBRc9AKfm
	 AQ73po9XreEYpLICgC78aNyLwhwTq2g/g0qAxwYtZI8iyWVyhIY9za++ew8smFKNpH
	 gCeVI2E3YHrUTrO3EPG0BvGoHfmeUjwcnQyGFgtDZ2+SEnivg2oXLd1PRNmLemHQoq
	 sL9ltSZdSYsVirSbvZoBSUFbC2ZL+l4rDnRjRioYxFgn5BH/ljlx9DM7NBH/ry2j/y
	 2sndXIZggx/Sk/hFSiD/M4j4oYj7IQNpezo5YPwct3Ehson+EilzfxfrBtaF1yr+be
	 hyyI6jORIBt+g==
Subject: Re: [OE-core] [RFC WIP][PATCH v2] add two zram IMAGE_FEATUREs
To: Trevor Woerner <twoerner@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210818203605.30426-1-twoerner@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <de12600b-4b7d-b6b1-83f3-88825631b73b@kernel.org>
Date: Wed, 18 Aug 2021 23:37:36 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818203605.30426-1-twoerner@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/18/2021 11:36 PM, Trevor Woerner wrote:
> this is a WIP patch submitted for RFC
> this patch only works, currently, with sysvinit
> but I wanted to get feedback on the general approach before tackling systemd

How about using/extending the zram package in meta-openembedded?
Would that be an option?

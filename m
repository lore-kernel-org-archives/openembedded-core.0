Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.19690.1627911049437839921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 06:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 570FDFF80B;
	Mon,  2 Aug 2021 13:30:46 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH] sstate: Fix rebuilds when changing layer config
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210801124856.3413781-1-richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <62a315a0-5015-bd1f-3133-560ceaf051ce@bootlin.com>
Date: Mon, 2 Aug 2021 15:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801124856.3413781-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

On 8/1/21 2:48 PM, Richard Purdie wrote:
> When adding a layer which changed SSTATE_EXCLUDEDEPS_SYSROOT, the state
> hashes were changing when they should not. This was caused by wider use
> of setscene_depvalid which means the dependency on the variable was seen
> when it was previously not.
>
> Exclude the variable since this should be be included in the hashes.

I realize that this variable isn't documented in any of the manuals.
Should be document it?
Thank you in advance for your advice.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


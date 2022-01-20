Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BF2C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:28:10 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.1919.1642710487917194847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=w/W8Z/fv;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 051A2838A7;
	Thu, 20 Jan 2022 21:28:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642710485;
	bh=7+CeL+i+R+Z2A8PwkpkX+wCMI+JmI+Ydddsb+mStlUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=w/W8Z/fvjqATEiyD8s6k/xvygoF3irSu+f1oxWYVqicVu4iZmMi4mPbPgxKw5LOXN
	 4WP/PrzAOUStIKCmlibjHsvT+lSY9WQAt73Iy+qy5RgMQAq+iEOBl4bNKs0d3RrngO
	 ezCB3dOOkvcBvSg8vm7qGQxVij+HZyoteFpjbNRWlAn2o7turpBjAi+L0+7ZH0AJOQ
	 rgYZdxRPRmJIUlmpnlbyqUySMwlhouvPZHTAzCvEZGZTICRyqweEgGxmeVPfaOZvYF
	 AyKjFRxGLeeh6VtZrWOV88+VukQjoQWOYW574ic7VDOOMWutJ7axPa+Ge6I2o4UU8x
	 ONKGMTIyTBluA==
Message-ID: <7e645982-b148-680c-c6aa-89724716f659@denx.de>
Date: Thu, 20 Jan 2022 21:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] ffmpeg: Update from 4.4.1 to 5.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220118185043.1778569-1-marex@denx.de>
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:28:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160782

On 1/20/22 21:15, Khem Raj wrote:
> there are bunch of failures in meta-openembedded as well  see
> 
> https://errors.yoctoproject.org/Errors/Build/138784/

So, how shall we proceed here ?

I suspect Alex will send a patch for the problem detected in oe-core and 
then oe-core with ffmpeg 5.0 won't be broken anymore.

As for the rest of the recipes in meta-openembedded, they will likely be 
catching up to ffmpeg 5.0 over time, so we can either upgrade them, or 
patch them. I suspect the former is more favorable approach.

However, what is not clear to me is whether this breakage in 
meta-openembedded is a blocker for this patch to be applied to oe-core 
(with the fix from Alex), or not ?


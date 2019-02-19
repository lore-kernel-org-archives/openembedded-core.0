Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 41D297C94D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:18:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id w17so22591474wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nFPRUJfwj+ZS5KR7UvwCuzyo/fvWc1N7SFfnZjIThtQ=;
	b=icDGn3r/LhmRxbWUFSkLjEQHcOcw17OwWsKP+VNZgQAojnIcU2pMg16NRRQgR9b1CV
	sYsyXATu9rAPMKreapp0k85v4R4kg5sA+OJaq3+mtD4i0awFESiJqZVVjC8Bg0x0p1Pj
	D27bNjRHfJIg55/4+DcbhMfqvKs2HQdvMpZcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nFPRUJfwj+ZS5KR7UvwCuzyo/fvWc1N7SFfnZjIThtQ=;
	b=BpJN7Gg/pVQmceZuEP/8F3QO3mEsJMS2egnJIc3kfk2hi5vs1KwiMFc1oHUPH2p/uM
	iJazs826z2PHUfwZ2UM/S8DyMSsbwAkzTYCyYXqmhLxbi5IEVfrC3/xN2LilD6JmC2Qe
	g6t8Pbh/i9CuFLhxNpRFohToLHHoRqgwiyfAO5bsBpfEnCdIt19GdWul1HLADh5SXOAh
	iK6nDByDgi9pmbWiYPgae+ciL1sz5XAkaxak2wtx/5aMO8DMAVi3pjhRXcOjOqu6i9wJ
	cHRSU74+N7fdfAmaoMP4f7SSXjhoQLWGG2iz7OzbGbsKmU1mk/R26jAbdlQhTkuYpg6o
	JEiA==
X-Gm-Message-State: AHQUAuZh1rHX5Cc+8fbhGITXLZZWIyBT6U55AZN+cD/DQftC0K6FEnmj
	NWUJbF2xXkfNSk5YHz0ISAV7sw==
X-Google-Smtp-Source: AHgI3IZvIa0nVRLa2yYRKFYlYV3O7gwMW9iGWi8jTcUlzII7iqMZMNA/2GCu4K3XWCDoVn73ssSfmQ==
X-Received: by 2002:a05:6000:10c1:: with SMTP id
	b1mr20174557wrx.275.1550593084665; 
	Tue, 19 Feb 2019 08:18:04 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c14sm21156406wrn.12.2019.02.19.08.18.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 08:18:03 -0800 (PST)
Message-ID: <c8482df2790b2671aa0acc3064ad0c63f327e564.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 16:18:02 +0000
In-Reply-To: <33498903f6eecdfd508add01a9ecd8c0997e426b.1550541019.git.Qi.Chen@windriver.com>
References: <cover.1550541019.git.Qi.Chen@windriver.com>
	<33498903f6eecdfd508add01a9ecd8c0997e426b.1550541019.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] sudo: upgrade to 1.8.27
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
X-List-Received-Date: Tue, 19 Feb 2019 16:18:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-02-19 at 09:53 +0800, Chen Qi wrote:
> --- a/meta/recipes-extended/sudo/sudo_1.8.26.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
> @@ -1,3 +1,24 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool
> upgrade'.
> +# The following is the difference between the old and the new
> license text.
> +# Please update the LICENSE value if needed, and summarize the
> changes in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- doc/LICENSE
> +# +++ doc/LICENSE
> +# @@ -1,6 +1,6 @@
> +#  Sudo is distributed under the following license:
> +#  
> +# -   Copyright (c) 1994-1996, 1998-2018
> +# +   Copyright (c) 1994-1996, 1998-2019
> +#          Todd C. Miller <Todd.Miller@sudo.ws>
> +#  
> +#     Permission to use, copy, modify, and distribute this software
> for any
> +# 
> +#
> +

Thanks for the upgrades. I removed this bit in the patch I queued for
testing!

Cheers,

Richard



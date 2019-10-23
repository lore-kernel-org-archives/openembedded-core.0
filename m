Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id F30897F882
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:22:32 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q13so17816161wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=eM6WS5W5Gg/Gly6u04WdLX4nUs9KpurOIZGFXNp5fIc=;
	b=OBPnmPDEl6cq1a7ypr1SkuU/gKZYxWXdgnXRNsCAyVqlmBiWEBUr7IygfcEv0n4rWS
	DoxPfTs8b8b1JSPOVcp2KYqY0zeNrWO28o4cxCphC2NYSWxDnwby5MO/DeLCK4M7f655
	d8B1pTWCJWmV+pYG3xxq8jRQmuzb+kw08wht8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eM6WS5W5Gg/Gly6u04WdLX4nUs9KpurOIZGFXNp5fIc=;
	b=JJ60oPmYmeZHfRaLQ32xyfcdkf8j+apbYrvPnTpDYvpYIU/LzSDD+8WC8CjrJKJgk0
	msz5MAzlavoPTf9dPe3E8FhQJFfKclBAwsakHiGsOD8gC9frgs0GlkBoBilcB4j/rmeA
	rN7VTP0ZC/O4Tj32gsogjKuXBLw02m3eNMljHr+hPa1X5TmW4aGe+g1GVc1m+iVWSBp1
	9BD/DCJbcCi8vfW7FZM2/hcoBbBsUd5yKcewvS1p4Bt1UXolCUuzdB4kgmSZ54ReFY9c
	LnQvxZTgZidLP3g4Rg64V6+BCdItbsR7sfNRwz8vdYYbIsG7YCb+BIaWr4x2dD9NfuCW
	hO9A==
X-Gm-Message-State: APjAAAW0BZMTVyh2Az6O3SMKPlljw+NOIcizODH5ZdJwZ3YoqXMpzbO0
	KXi+z1p8PYPTMohpibKr7/Ayzw==
X-Google-Smtp-Source: APXvYqy21wynNbaEmYgpp9Dsc+39CHrVA7FIDX83zr1/2ipOqiECFQcYgsL7+8CLum8eYXBnljQqbg==
X-Received: by 2002:a5d:4283:: with SMTP id k3mr6584091wrq.236.1571847753509; 
	Wed, 23 Oct 2019 09:22:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o15sm4503345wrv.76.2019.10.23.09.22.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 09:22:32 -0700 (PDT)
Message-ID: <6c1e8acfb321e2684dc8363aa082ad4cd90cffc4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2019 17:22:31 +0100
In-Reply-To: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 16:22:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem.

On Wed, 2019-10-23 at 14:03 +0100, Khem Raj wrote:
> Hi Richard
> 
> New master-next I see these fails
> 
> https://errors.yoctoproject.org/Errors/Build/91645/
> 
> First two are important one's we already know why
> ti-display-sharing-fw fails to fetch

Firstly, before you mention it, I started merging master-next earlier
today after multiple tries and finally a green build last night.

I paused as there was an issue, I dropped more patches and eventually
after I thought I'd handled all the remaining issues I knew about, I
merged things. I didn't see this report until now (afterwards) :(.

I guess I now need to bisect things and figure out where these failures
came from.

Cheers,

Richard



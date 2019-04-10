Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3084E7D7A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 09:41:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id g3so2078158wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 02:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BS1dxAymN4xVQI5RL/sOe8PTS5ZD9ACKNEhWAi0SeK8=;
	b=cxxHhnCeocdyD//TLUlap45R6aGq9/+cWxodU75b6/D8kQHC8oyrVGRPhiEEZFWM4N
	IomO4owc+zOivShsK+6hxEIjsRg/DAcjIIbprmV85bwlRdZasUuzKjLX3ZPjaFiKNWcP
	4089P/Fk7D1caiRSRbUiJAH60GoPBId+DA560=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BS1dxAymN4xVQI5RL/sOe8PTS5ZD9ACKNEhWAi0SeK8=;
	b=HTE/QyvjbYjQq4R2vTEbqfCgEcCuXz/Hv5gDxTvfu9vsFoHxA4St885TTH0x438pDO
	HoY/YhTM7G9tn4R2ArxUO72LIhZgtAMZBcrdS8jSuIoYbdn8VcEUlX4MgG+F8JK4gr33
	DYwrVTlIWoGvT8hiz3tkpKzQFVMF8wUR3TkdqN4/hToCioXwO7/69CJf60k1V3MUiKIz
	VUYzXclU5PpZH5GB1P9l4uo8lklB6APc7WyIM8LjsbJzdpsAJS5VGs6eKF1+HlOWchFI
	3ipZDVgEIxPEiP9SO0kp0LonSRp9UYeT4YwS9H6XHPhNsOQHb0SG9aJSZKKOLWSRygON
	sH3A==
X-Gm-Message-State: APjAAAW/FtbAHHW1LVRuu/l/YB+0gdlXWDLjydvDPFvQqYnHGNugHOyY
	ya2o3wKltqiZCpmIoUht9k/SdA==
X-Google-Smtp-Source: APXvYqznGkSR+WAWRzOROV6ERrdL4O2joWiQu6qLt7edT05q4Oh0uSf4g6vo4ysQYqEq035ZBLesYw==
X-Received: by 2002:a5d:52cc:: with SMTP id r12mr6888111wrv.163.1554889283812; 
	Wed, 10 Apr 2019 02:41:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c10sm40684639wrt.65.2019.04.10.02.41.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Apr 2019 02:41:22 -0700 (PDT)
Message-ID: <680dff761ebd04f8f240d12339b31569c70c48da.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, Yocto discussion list
	<yocto@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Wed, 10 Apr 2019 10:41:21 +0100
In-Reply-To: <f8b3661d-a6cc-494e-de49-e462ba935535@gmail.com>
References: <90d55754e9381759c8b70ebca0b880e6013f17f0.camel@linuxfoundation.org>
	<f8b3661d-a6cc-494e-de49-e462ba935535@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: Eclipse support dropped with immediate effect
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
X-List-Received-Date: Wed, 10 Apr 2019 09:41:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-10 at 05:56 +0530, akuster808 wrote:
> 
> On 4/9/19 8:52 PM, Richard Purdie wrote:
> > I'm sorry to have to say this but the project is terminating its
> > official eclipse plugin support with immediate effect.
> 
> Does this affect the stable branches as well?

Yes, I think we'll just be removing the target from the autobuilder
entirely.

Cheers,

Richard



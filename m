Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4045F610E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 21:29:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so204291wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ovWkhdZ9j2mKAPaNUrqw76mSnl9S4gZaOvz7kG2EU6Y=;
	b=FaMaM9cn6mYN+yRxDs/UxsJcq3Lfq96mYeR/LIZWlE0sztmxDaBdGIxeBB70UsSOQP
	/DAn6quzwOPLHtiBQfSjWmer8nu8MwqjQkag2dRB+H4yOwjyzPXBcpOwDDw7wT1U5YOT
	2qBzEiwDfRkgm+kjxp7EEdbv0yeRL1myH3E2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ovWkhdZ9j2mKAPaNUrqw76mSnl9S4gZaOvz7kG2EU6Y=;
	b=FItuZy2R+kO8/Jxz45ZdCXkcF7uozeqqqDmT0OICLasGvVjn6hH8WVfCT7DhuD7dDY
	v2UuJJAUWs0bRpqUSUC0JhuHfRGFr6zj4JtCZNRYCwvF4ENCZOjH1oyu5Gzu8MWClNYs
	hnGmlD3zHw18kPAKW3+LplAw3yR9Sxvn0SgZN4nHmbQAyptJ0gmJrQC8oPfJzfNj1RmX
	TfeCjpQwf7Lg2sNjKVm/x46DSWG8b/n0I+P/Auj9vxsojKPTRy4CUFi9Iv7s4COgKVAB
	5LafHJacptJOlqL4mxZaECO6/2bY8KGLHyDCUM8aeYItq9hbcsc6FCRYyYL0uNDSlV+h
	UeAA==
X-Gm-Message-State: APjAAAWXb2jIsO0RhH0WpLo8dQtmYkTYepwnYKNyGo41SDEVApKwXO0b
	CMeFBgrqH0OGkdkb5SFWxL/plw==
X-Google-Smtp-Source: APXvYqxkgnVvyunL2u/74rHlPw+UxrIAh+AxO+9R0KtbFdTk6KGsS9oWOqMCMlnkjL9dqLwcr/08PA==
X-Received: by 2002:a05:600c:54d:: with SMTP id
	k13mr985736wmc.188.1580851763942; 
	Tue, 04 Feb 2020 13:29:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i16sm16033468wrr.71.2020.02.04.13.29.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 13:29:23 -0800 (PST)
Message-ID: <1e008fb569c7f94319b00108b26133e2127fe0c7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Kang Kai
	<Kai.Kang@windriver.com>
Date: Tue, 04 Feb 2020 21:29:22 +0000
In-Reply-To: <CANNYZj9jTrZHYJw0y2=7BxhpJxgV792y06O2eQqsDALApo+QJw@mail.gmail.com>
References: <20200203091406.37643-1-kai.kang@windriver.com>
	<B90E2425-D2BC-411A-B3CF-E3B31614A8DE@gmail.com>
	<4d47a7c5-d60a-2fcc-3a4d-a716727bbcbd@windriver.com>
	<CANNYZj9jTrZHYJw0y2=7BxhpJxgV792y06O2eQqsDALApo+QJw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ifupdown: add ptest
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
X-List-Received-Date: Tue, 04 Feb 2020 21:29:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-04 at 21:50 +0100, Alexander Kanavin wrote:
> imagefeatures.py does set:
> 
> PREFERRED_PROVIDER_virtual/base-utils = "packagegroup-core-base-
> utils"
> VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
> 
> which I believe does actually replace replace busybox with that
> packagegroup in any image, as packagegroup-core-boot RDEPENDS on
> VIRTUAL-RUNTIME_base-utils.
> 
> I'm not sure why imagefeatures.py only does 'bitbake("--graphviz
> core-image-sato")' instead of building and booting that image
> properly, but this is exactly the place where it should happen.

I suspect it dates from a time where booting and testing the image
likely wouldn't have worked. It sounds like there would be a lot more
value in that now.

I merged this patch on the basis it was a good step forwards on the
issue in case that wasn't clear.

Cheers,

Richard



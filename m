Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id C863C7EC92
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 11:47:14 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id u18so9378877wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 03:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=5KsxIk7SrSJHaP8CJOXsTNPl45HyrEoV9gfa8XYFLik=;
	b=EfdDPZy07Ns4Jz8r7ZS0b3ExNSa6ZFzU99/ZTqj0FmlQUiiZyVhZDRGHuHoQdeVm9j
	K/y3ZldsQX6E0Vs9x9w8hLvj7/OaSfZIVc32kloHAPEeCZ8t9bQrVjO6sJpWYdw+ABt1
	bh4R5g5Y9xRyQnPZPw9kBCkjbDVf/tDkGC7To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5KsxIk7SrSJHaP8CJOXsTNPl45HyrEoV9gfa8XYFLik=;
	b=l0IJmXzKnsoio/WaQtxe6S4UzBZ85rZ5+U7o/nqg33ilSrWlcGOxYRYG6N8aTv8i0f
	O1t6u9OiT31srvxuDWEZsifEhwoQ04cAu8kP6m/YmmWOLRIl5XJrY6bOVsfmJlvoXM4J
	sOUl3eaIVQa6ARNx0qwyKnaJmwkkravMOf+0dhllaq7s6Yj2aXI/WIWnt1yaor19Iw3u
	r/+Ho3mubThcxC+rgjZgOIZhodMwXhs14+vefokdMw5ddzjx68/n7buSFtRDbeKuJCvu
	AFK1uVc+tOFoO9MIx3p0bwXdCSljwLZGjDt50gtVx7x5FXach0a6nejsZiTvPg2WAb0Y
	70bw==
X-Gm-Message-State: APjAAAXgYH0w0qWN0S8h1NH+39ZajnY/74nk6Yk56rZJkmZQMOhGA8CC
	mGkpf+J53tIYmjQURJgvtwFqNQ==
X-Google-Smtp-Source: APXvYqzK/Gr7OoL/IDZMDR7crkb3BmsmNxigjPrX3E1csHopwgEnCwm0TXpKWu9qPq5XlMtnsKOb/w==
X-Received: by 2002:a1c:2bc2:: with SMTP id r185mr13618944wmr.91.1573818435276;
	Fri, 15 Nov 2019 03:47:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i13sm10693782wrp.12.2019.11.15.03.47.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 03:47:14 -0800 (PST)
Message-ID: <49217ee67206623b1c491c3deb13a5f7dd697f88.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chee.yang.lee@intel.com, openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2019 11:47:13 +0000
In-Reply-To: <1573783128-17519-2-git-send-email-chee.yang.lee@intel.com>
References: <1573783128-17519-1-git-send-email-chee.yang.lee@intel.com>
	<1573783128-17519-2-git-send-email-chee.yang.lee@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] wic: rm with -r flag support
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
X-List-Received-Date: Fri, 15 Nov 2019 11:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-15 at 09:58 +0800, chee.yang.lee@intel.com wrote:
> From: Chee Yang Lee <chee.yang.lee@intel.com>
> 
> wic currently unable to remove non-empty directory in ext* partition.
> enable wic rm to remove non-empty directory and all the sub-content
> with -r flag.
> update help documents for 'wic rm'.
> [YOCTO #12404]

This kind of new functionality means we need new tests. Could you
resend this with new tests for the new functionality being added
please?

Cheers,

Richard



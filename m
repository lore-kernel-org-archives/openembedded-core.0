Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 797DB7859C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 21:22:33 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id p68so27833385ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=h9eOQY2KI/E0/vmQVgFkhp2ltGbFjg0ei2hxQ3UxK48=;
	b=NAQQSt86F4XFhAnCdyYogSNX4kCVNLl6E6LTI1gqejfONQQHcCZl3on7g2VLbP/HWS
	YRnWPIOiRHlTNGfbvyXjXyKFPl/a0zZdbAnyglHWhYPVT6I6TEl0cMMzmkzUkZRK+7LC
	8qgMTPEKZ9C+ssTgeJul5FDs0/iB172fsvf0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=h9eOQY2KI/E0/vmQVgFkhp2ltGbFjg0ei2hxQ3UxK48=;
	b=rdQBcEQyp+QSD9C8OflhSGYH5BOZtAs3djFF5loQFViFMRr/gnc2+TGnGGi9UDICm1
	//EiKgDvHRZ4ln0YBrT5lSBBl5GUp1uKcG3+BjErqj4K2EmJtOgQpL7P3YqThJJOHZqD
	Gib4c0qWT3Z2IdPHAAsewlDykvcQ2nWMzXEQBEQqoyWjD9i5/HNX1uoPyWYnVpNWfHnj
	GqAzOxtJf5GxY5R+TpbH13e1FDgqIU1KaMmsrgCrwWRBBjUveTFQ6vrtE0gkdAHYVM9X
	j4XwkRqDjhu8qoFRFBfglIry3vsg0O82Bs4D7AIzPKS2/fgqRsAcLYxKk8DC8gQTR8jU
	JdKA==
X-Gm-Message-State: AIVw111JfyTF8o+Pf1OpfenHBCAnfBQs+0blUYYecEdBUF4TTZTLkgSH
	trHskz5//gec06eh
X-Received: by 10.37.177.151 with SMTP id h23mr14654736ybj.164.1501536154331; 
	Mon, 31 Jul 2017 14:22:34 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:b42c:54f:27db:36c0])
	by smtp.gmail.com with ESMTPSA id
	l190sm2252418ywf.91.2017.07.31.14.22.33
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 14:22:33 -0700 (PDT)
Date: Mon, 31 Jul 2017 17:23:59 -0400
From: Tom Rini <trini@konsulko.com>
To: drew.moseley@northern.tech
Message-ID: <20170731212359.GR16135@bill-the-cat>
References: <1501532184-26270-1-git-send-email-drew.moseley@northern.tech>
MIME-Version: 1.0
In-Reply-To: <1501532184-26270-1-git-send-email-drew.moseley@northern.tech>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] local.conf.sample.extended: remove references to image_types_uboot
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
X-List-Received-Date: Mon, 31 Jul 2017 21:22:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2017 at 04:16:24PM -0400, drew.moseley@northern.tech wrote:

> From: Drew Moseley <drew.moseley@northern.tech>
> 
> This class was removed with commit:
>     OE-Core rev: 65f27122950a35a67ce39ae4cfe93d0dca6b0dab
> 
> Signed-off-by: Drew Moseley <drew.moseley@northern.tech>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom


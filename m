Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B99BC6C4A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 21:55:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v13so1126673wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 13:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=4D5rEc6IWpDxfaomEM+YARZyV5MP+d0qEMFsSPEugpw=;
	b=KEjw8acjtpeS4Z28TVgDyDFKy5RRUPasmPJYxqx8REAL0I5PTEyuypj87/ZHWzPrLL
	u0dj0uREZnYgt44AKpx6V3MXKAek6ilhp6zHYdWTG4cv+azyigTchhFRIaBUwGkT5hLD
	Vkxs/ODHcbmdZfUEO7fntA0hd5t7NUda6aR1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4D5rEc6IWpDxfaomEM+YARZyV5MP+d0qEMFsSPEugpw=;
	b=n5JWCp1D0zdG0HN2Dp3CB/03KQTYrTUHD8+tUHD5wQUkqwlLfrxIrRzWyHvnoaR9Lf
	iLPyyX9qnIPgI9pVTvSOIjnNBIJTORFGbU5bOTwuF149mc88ETPas5vARgJWeM+7s+h0
	n6nu5IZutw9Pjvm3H2xHyKhdcKlUy7tAqJGqLt7/6JQ+M+2Jo1mR01hvQj76tvfToQ6D
	6WuN7ow06cPavRp6tY+he0B9Sqg5EdMTKxK95e9WyEagW1ecsAos2w5xlR5FtxL6yVMz
	0k2HN2neNLMymiFkuZDVOqr0e4hXcf8WGKmxwbX8Z7b7j+BtIgG/lb3XHSw36+fO6OY4
	HUjA==
X-Gm-Message-State: AJcUukcg+qTZKrNdoJRrYmZxorc4G/xdH1EMdg7fA9fK4WKOvUNlAC6x
	72ckttk8/ykulO4pVn8/ua1RD8aVa50=
X-Google-Smtp-Source: ALg8bN4eOawWMm9cjLNtmBecp11A0sFKo7MyIi74FoqkZi5ahAE1PKsMtiH/cGa/uKDkMuqUO7L/PQ==
X-Received: by 2002:a5d:6450:: with SMTP id d16mr31838891wrw.64.1548885301301; 
	Wed, 30 Jan 2019 13:55:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f187sm2026651wma.4.2019.01.30.13.54.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 13:55:00 -0800 (PST)
Message-ID: <2acd4017b1a5bf6882bb54e2e559588b7d8cac67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonas Bonn <jonas@norrbonn.se>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 21:54:58 +0000
In-Reply-To: <20190128205848.12834-1-jonas@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 0/6] systemd patches
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
X-List-Received-Date: Wed, 30 Jan 2019 21:55:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-28 at 21:58 +0100, Jonas Bonn wrote:
> Changed in v4:
> - add patch to make systemd-firstboot a non-default option to systemd
> to
>   prevent unexpected prompts at runtime

There were still some failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/237

(steps 5c, 6c and 7c)

Cheers,

Richard



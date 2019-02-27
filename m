Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 821807C86F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 21:48:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w2so19671736wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 13:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TBhuk3KOPjMIlZicPWvDYBAEzOKibvLcrFA5So792LU=;
	b=MkBGYDyvckK4M7d2E4o7xaiPg87n2eE4Y39ewGa1aVak79ocrd8Am+NECxkinD+HBq
	8a5e7qjqSHBTbH6i9V4BYf92nHhmnoWSj3BKy3p30S7VxqNOfj/fKLL0Z1yTx9twQ1r3
	KzV2GEQn8E6+5egyYPuj0w3BxgNbUYoUmLVGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TBhuk3KOPjMIlZicPWvDYBAEzOKibvLcrFA5So792LU=;
	b=t1fh5zbl1/G7OI46BbXksFbZ/ToxpG3ziUcfMQBB+urIUuZfAvwg9X2/loYHGkZRsg
	cYWiX1YMgZ8IUQUbNBbc+CvWJf6+Fewgtf5GYjj7tc8vSDmOYRMTHE89EWgq6KQJtSzZ
	NPR3Gzev/9U5cAQYBqGKHp72zBkT/614JdaleP2dJtYs2Z0W2KeWkik7861PkPbNvoTO
	KDdwprAArgEH3twZf4H1j2CtPE5lYuWHy0MVel5CdAEB9L7TIcbNLPmd3R6OnlMrKyCp
	jujvxATig/VEZmdKyCmjBiF/aYTZSunQM87N2PPUxtgXJ9p7F4GWOdetjsCVN3n06k7D
	XGFw==
X-Gm-Message-State: APjAAAWMqgNKmBv1WQT/qOixgUCkYaBQbgSAC1Hmg8NIi0VWBVWn+vvU
	c+YYX0yJIQYkLpPK3iF4/GCWxA==
X-Google-Smtp-Source: APXvYqym/i5fQxZv7mG5lYFXVIxub7ZB+FFZjomUMXCc+NO/8Muhz/W4b87WzyfpJcbPK8ZDVGoc2w==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr3768316wrr.297.1551304104088; 
	Wed, 27 Feb 2019 13:48:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p6sm49555535wre.63.2019.02.27.13.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Feb 2019 13:48:23 -0800 (PST)
Message-ID: <77eb8d4df1a4220e3f19d09e3ad1130cc60e817c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 21:48:22 +0000
In-Reply-To: <20190227212951.39714-1-raj.khem@gmail.com>
References: <20190227212951.39714-1-raj.khem@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] glibc: Move common bits to gcc-common.inc
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
X-List-Received-Date: Wed, 27 Feb 2019 21:48:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-27 at 13:29 -0800, Khem Raj wrote:
> We have been duplicating few variables in glibc recipes which could
> actually be defined once, therefore move them to gcc-common.inc which

gcc-common.inc for glibc? :)

Cheers,

Richard



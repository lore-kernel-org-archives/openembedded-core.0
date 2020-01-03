Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D05076C0ED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 10:40:24 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so7998575wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2020 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uNhG6+lN++FB1bzY1j3RKVnSLGUiEiAF1MJkOfnJNb0=;
	b=Btb6odzEgGYJiXWoRdi1OV9A02y0atvUEuRzVOmB8v1S6RtU4R5sJGwAGmFP1riWWG
	PxK6oRP1JxSV/CnEk/FfZ4ii11YkLN4s7pE5s+aMHzPPShcCQ3m4sL7wK2ChVojVXOe8
	uV7ldhgYNJ6ZXn6epv9H9HDVOOpxJZr31RH0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uNhG6+lN++FB1bzY1j3RKVnSLGUiEiAF1MJkOfnJNb0=;
	b=ibYURaFuA39rrvAP5Vt3vw7i3olNfnreOFElef5AZ5u1rnFuK5xhEr3M3BdNegGjDj
	Q6CD4ct1m1X7kHuPjVJDiEF7yl3YqwP3Enst7cYYkDUYl/4sPjtiqDkOuuIe15xTvo5o
	SmhDZMemySSFuHUgbBqUyRibJvIP6yGbPkpOmQfN2tvhAo/dt6OQITJIv9NQ7CgG8v2z
	Aj72hLWPkXdXhB1wvVT2eDMZ9GpdLClmwWO0XaW2axz3xk5ZMMVcKH7npxlZYht6vMQy
	wKExlzZSQfAc9nLIYXXZgmh7Vaf07xU+ML19U2Z7hBLxesh0SuqHqq2nHWJgrjIGbHxv
	P0Zg==
X-Gm-Message-State: APjAAAWnAa1EwSCasamBTIxNu37jaLAxBL2MF/W42hK4jlKe7wu6Y64j
	PpcEE0X25cs0fv88FyvFt3hO/g+c8Uw=
X-Google-Smtp-Source: APXvYqyx9P9vVTy5nBOyJnjeJ4wnS58nr0a4jW3x8LzUQ0u9T+Q/i1wIRMhdVkZjPKG1eyS4kS6sMw==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr18918070wml.3.1578048025465;
	Fri, 03 Jan 2020 02:40:25 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b10sm61823905wrt.90.2020.01.03.02.40.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jan 2020 02:40:24 -0800 (PST)
Message-ID: <67936cf2c289480b0a9b94b7ca52ba2e061c0fad.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefano Babic <sbabic@denx.de>, openembedded-core@lists.openembedded.org
Date: Fri, 03 Jan 2020 10:40:23 +0000
In-Reply-To: <20200103101536.2561-1-sbabic@denx.de>
References: <20200103101536.2561-1-sbabic@denx.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH V3] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Fri, 03 Jan 2020 10:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-03 at 11:15 +0100, Stefano Babic wrote:
> libubootenv is a replacement for u-boot-fw-utils. It is
> hardware-independent and provides fw_printenv and fw_setenv tools
> that
> are full compatible with the ones provided by U-Boot. A library is
> provided to access the environment from an own application.
> License is LGPL-2.1 and this allow to link the library to proprietary
> code. The user of the tools should install the configuration file
> "fw_env.config", as he is already used to with u-boot-fw-utils. The
> configuration file is compatible with u-boot-fw-utils.
> 

> +PROVIDES += "u-boot-fw-utils"
> +RPROVIDES_${PN} += "u-boot-fw-utils"

What is the ultimate intention/end goal here? Does this replace u-boot-
fw-utils? Should we remove the other recipe?

Cheers,

Richard



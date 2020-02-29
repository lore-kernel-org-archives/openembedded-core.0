Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8629F61A0E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:40:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z12so6099041wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 02:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=CBMO5ApRYp+RG4xwzI/YVgIBklXtpBjRA1ggMiJiq+g=;
	b=ByDYBG+3o+O6vtqoG2ANwIoLUQTioIHeqE1ksmlmRTgzzq/De9vMShe9H5ccXSjLcq
	PI3QjptoUEHVG6NBMIKvgaLP1r2jyafMmQqXxwunVAIujDCXkgc3gYQQPa6GruLIEB+q
	49wx3T0KIRBkpNuGpVzHFe8/af8pdpP7A8l4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CBMO5ApRYp+RG4xwzI/YVgIBklXtpBjRA1ggMiJiq+g=;
	b=Dys+c1O59dykLsU7NexMYzpQXhn8yTv0XjCy8RNViOkc1CsbCtVwjfPte2wzRXTgmV
	i/wtbYrwhtip7hPyJa4gon1rmMSJGVpb7W8Uas6diKqWY/XEJkQSxSwBon9NhDKruIzY
	2WFApRrSM/shizXgJyM3shFfUOoTt/9WvRWcnCYdi/1IJj/VSxqKKQz+X9yIBthWOwNf
	ttWApTFOyMkQ1UVMBw0TtmZtJ0uX+JWVj1avGoZb5DFaRN1d9QoL+j4z74q1khydOVCr
	MGlVdbtLgDCg8esu7laK6A6rTnmXjpCYgIE2TuM1nlQIHEoYB/Tm0bw0bLdP6iZWu+C5
	B3sA==
X-Gm-Message-State: APjAAAVYzqYcU530Ku+Y+Ngt6Sxc4myClICpDMawB2SBwHszJjHTlnww
	/vpFz2p1xXLpfsLdousoJw7L7g==
X-Google-Smtp-Source: APXvYqwUoAK2jtUgB/beXWiNVujrEIReJeat4lePYteqAZa0qCVFzpby5X/AkwCVau6uWn1Qrcb8aw==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr9509877wmf.136.1582972836095; 
	Sat, 29 Feb 2020 02:40:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g129sm750631wmg.12.2020.02.29.02.40.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 02:40:35 -0800 (PST)
Message-ID: <23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 10:40:34 +0000
In-Reply-To: <20200229101433.30787-1-alex.kanavin@gmail.com>
References: <20200229101433.30787-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] piglit: move to meta-oe
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
X-List-Received-Date: Sat, 29 Feb 2020 10:40:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 11:14 +0100, Alexander Kanavin wrote:
> This recipe is build-heavy, yet is not part of any images and isn't
> runtime tesed as
> part of oe-core. There's no evidence of anyone using it, as all
> commits are revision updates. It also pulls in NumPy, which is also
> a significant support item, and wouldn't otherwise be part of core.

I'm not sure about this. The intent was to use piglit as a way of
improving our graphics testing, particularly allowing it to be
automated.

Whilst we've had to focus on getting the basics right, I'm not sure
that objective isn't still a worthy goal over time?

Cheers,

Richard





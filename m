Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id DE4517C427
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 20:26:26 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b10so924222wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZXZMfmw5Us6lIIg3CK4RregE2019SrLPW2GFx3T2shQ=;
	b=LcUmT+uaBn/lbcdZ/GyDE2hLJuZCGB3hIjcgq9j9cVarG3czO+rT2zLf9ynvoosLC7
	RXxYW0roVYIcP+hpsMpYJZ0jtFyXR+TWX6H1yuv+lT3Hq1q+v9m2fcaSoFRIzfPfiCaM
	czpv6DKFnPKWOSZ6IGiZwuRBeoaokCS3NAFFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZXZMfmw5Us6lIIg3CK4RregE2019SrLPW2GFx3T2shQ=;
	b=iTKAhy2SIVKr+w7og/YhAAAn0VJNh6ipLzL5L5DjZuociuSWiV5qM8PHjuZpaSXDWH
	qiYGL0veJ9KJHfOoNZdn12zYUKzn5bzws0HxB7PuXw0sR74LYZyC4cvYyNZOh5khvVX5
	IGNQApxFcolTxT5Lg+5/RZa/OeBob2b7h9kxyIIUcCyeSnQly+J/HUU+FaOcfgIFB6/c
	tjEui9udrKRzVvnEz1nR8jOZsTa+aGsv1+OirqQCWSBLSyDh6WVuLaj6bdnAkzVC88wp
	Fs2Teyl/IwQlWuGqZ/URq5V4YJ3agpHiU1yTroF6LK8Xq62q0l3UH9XftbYxLO/+nLsS
	OiEw==
X-Gm-Message-State: APjAAAWEdYR3cUh/KLgtGT9jRoagdc+9mdhcv8stTmwSd18rK/TEW0GY
	p8YncUWyBxRrPKzYXQV4I5gEXg==
X-Google-Smtp-Source: APXvYqxsPfooIIa4tUZlGO8OlVZOrbg2ytLBPCy0OLJAILdGxi82tWnnzB52AIgYf41aLBuXz3qaIQ==
X-Received: by 2002:a1c:e707:: with SMTP id e7mr636753wmh.42.1556569587431;
	Mon, 29 Apr 2019 13:26:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z6sm15612336wrw.87.2019.04.29.13.26.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 13:26:26 -0700 (PDT)
Message-ID: <323098102d47a837b953a3c399f8db65b1c43349.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 21:26:25 +0100
In-Reply-To: <20190429140730.2899-2-schnitzeltony@gmail.com>
References: <20190429140730.2899-1-schnitzeltony@gmail.com>
	<20190429140730.2899-2-schnitzeltony@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Mon, 29 Apr 2019 20:26:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-04-29 at 16:07 +0200, Andreas Müller wrote:
> This should fix build on ancient hosts
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>

This fixed debian9 but didn't fix centos7 :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/150

| checking for a sed that does not truncate output... (cached) sed
| checking whether g++  supports C++14 features by default... no
| checking whether g++  supports C++14 features with -std=gnu++14... no
| checking whether g++  supports C++14 features with -std=gnu++1y... no
| checking whether g++  supports C++14 features with -std=c++14... no
| checking whether g++  supports C++14 features with +std=c++14... no
| checking whether g++  supports C++14 features with -h std=c++14... no
| checking whether g++  supports C++14 features with -std=c++1y... no
| checking whether g++  supports C++14 features with +std=c++1y... no
| checking whether g++  supports C++14 features with -h std=c++1y... no
| configure: error: *** A compiler with support for C++14 language
features is required.

So we may have to look at reverting, or perhaps just adding a vte-
native recipe with an older version of vte?

Cheers,

Richard



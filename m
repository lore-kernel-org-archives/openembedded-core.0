Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E53F67D590
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:05:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id j13so5124977wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nGRlmJvnS+EutRcZphZuOQGG+t6h8y4ZwWqhCrm6y7Y=;
	b=asIOf3g2fQ+6ulI89S0H4hNbTUgpJEAJ+jItifIt5iaGkrjDScMKZTucqpLDgo2E+y
	msi1LaT9zcqpRBh6MDbgbzG9D1mjQEnePGT5NhP92ifuMCTf8x/U2n2FY8XV7w0tr0le
	K2plDSvCzMEWyXn7GnN75MSqHhwuBLUpbXfQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nGRlmJvnS+EutRcZphZuOQGG+t6h8y4ZwWqhCrm6y7Y=;
	b=NTj6Vcbacvdr3SuTqp5HMRjd8IqY+a3JNwSkuPcLWw37oDip5JvEmaZNdX7ResGFe6
	6pO02pBcl4qFLwMWwJyMCwZV6lmTO7HmZXs/Nt6AtLRTmfooFv4MPSlvYvXudRoVa78w
	yEplrwmSQKM8I75cYUACmPAL+DDkOsi+vQ6qTJTv5z8HMNZ59TzCr9zxMKZLx0IisMAH
	EvEMDftMw2VSVXpWMqlyUv6lESneE1qSerFRFR8yJRAAu4gIdZ5x7hDYEA1bx47TCnmM
	Hq5cqP+eTnT+7yVf8Vhma6XJnq5PcXeaeFnmQKXOIyG5wpuVaNiQauYnec+mDMeK7ScK
	oslQ==
X-Gm-Message-State: APjAAAXkGw1JO4vywm6Oo8kjkta0uHqXP+TDUovhaE68ENT457MwhvN6
	f+j5oT3qIURiavrY8E3TpshdQw==
X-Google-Smtp-Source: APXvYqx1EBQ82v8O+uHp4XOrurDnvSKSRWZBXhdD3Sy3C75lldkptnH7nfrhx42qx19tkuZcYwuXbg==
X-Received: by 2002:a1c:f910:: with SMTP id x16mr2485452wmh.114.1556118312692; 
	Wed, 24 Apr 2019 08:05:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d3sm36286926wmf.46.2019.04.24.08.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 08:05:11 -0700 (PDT)
Message-ID: <6d0bf92974bf8b17be3e5daebb33673b71428642.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 16:05:10 +0100
In-Reply-To: <1555936919-19078-2-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
	<1555936919-19078-2-git-send-email-akuster808@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [QA][PATCH 1/7] manual tests migrate to selftest
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
X-List-Received-Date: Wed, 24 Apr 2019 15:05:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-22 at 06:41 -0600, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/oescripts.py | 89
> +++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)

This threw a few errors on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/425

One issue is missing pycairo but there seem to be others.

Cheers,

Richard



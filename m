Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 85F3B7773C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 23:16:19 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id j5so55034612pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=xJ5fFR54BMDDv98Yr9b0wsyKG5WBD6OrboXCkQ8tcCw=;
	b=gJdPlEHOd9v4377GY5vPXYJQY7+iSJns+wR8GADUoMZXTrAnDPtrM6BDAP6YdjXXXB
	axcFuaBpc5q65hRf4gdLM/iHrI1xHpkmzhBV2V5oiSZfchxxqkeNakyl1KZpA96rAGDc
	Fn8hm5YJSZdNnkpQiTkY2iqxPxVLAOJqCjyu7JPFRYuFfZfSMz8NEl4HtarJaWlrhmkS
	gzyvwzdmqBuKzJthCtPOw2ry1Y0hDUpvbuY8cwLpyrY+pMnFSOS4EHdAOj+B98x+Pa8u
	r1/fG1y2gkfo+izTkPJqB2/TihJDrklwk9Tm8E5ifAm1esQ+OF4pYcJzy8+rSbC3uuiP
	Ljug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xJ5fFR54BMDDv98Yr9b0wsyKG5WBD6OrboXCkQ8tcCw=;
	b=kU3VyJaV2afRryPgIItgrmG+3R8ZUNYqpHCeK3Qj0LKyzqfQ5mDUoOy6zU2w7iK0qI
	5GZoA4Q/VnBrO+pTTJQdFF+k4qnKyq+xTKps3ao9dTlAYO80zALe0bb11qvWhMJNNnht
	dV1xuh0vUc+7u3Mwj3Xb65fyToWj/d7yuUYkcHPrZBHBmdiD8HNAMfOLv4uh2lTBISyU
	mKVK7YyLr67WSIl8/MUhLk6Tf8TNogU7P3F7Yh8K6zI6nYqpEp3qNdo3wf9TD6thaOkj
	6xKQC7HmljGSReaXvUFipxIquXxp4KeB6FoGMLCI+Lvvsfz7MetWCK1yJerhE8/reaFC
	dsvA==
X-Gm-Message-State: AMke39mpOU8N7UIvtCaC4n0oknHQBn8HEbyewoE1yOd050z0uqysuwuyFSS4TWVED68JWw==
X-Received: by 10.84.231.200 with SMTP id g8mr36711828pln.100.1489274180232;
	Sat, 11 Mar 2017 15:16:20 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:cc95:4c5a:d83a:64d2])
	by smtp.gmail.com with ESMTPSA id
	m29sm25890036pfi.54.2017.03.11.15.16.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Mar 2017 15:16:19 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1489267743.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
Date: Sat, 11 Mar 2017 15:16:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1489267743.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Sat, 11 Mar 2017 23:16:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 3/11/17 1:30 PM, Khem Raj wrote:
> The following changes since commit a47e64d985a610535449730806651f5bfd75d9ec:
> 
>   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib kraj/pu
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu
> 
> Khem Raj (1):
>   mesa: Contain configure search for llvm
> 

I added another fix for mesa-gl to remove one of obsolete packageconfigs
and its on the same pull branch now.

>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


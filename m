Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E9C917D3CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 12:30:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so11863272wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=riR8RLGlKIljvDA8ixw/XXSyenOG/l/YmDF4YMn86UI=;
	b=YWeZhYBrXPtojGmqaBQb+g01G2OVqAoogfQJXtB/mPS9Aqg6LUgQfeynbClAGK1tTG
	aSnO7czhVXyIJRHU0WvwfmyGbRct6cptd0GxXSPEOFBnG9RwVsaXD++F5H8MJjfd2VUf
	uLoDzXHEMvwXQJiK1/Nhtmc37Nn+Z3d6R1Vio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=riR8RLGlKIljvDA8ixw/XXSyenOG/l/YmDF4YMn86UI=;
	b=G7Sbz0v4Sn1V0ptpn9tbQ3dArwdsOQ7EtLUDIOeJNvIO5q7ZPvlfNdAK2fc0cNgkyf
	DQw9o5BVcOYDJTUKw8ntq8CRTAGemgvP7KF/DEn9TKAJH8JwrEzbatEOEPO+XginexHO
	9cDVqP60CtoFP9TcN5gGR3Q+x9ezyK7WE35gBKWA5fPpEaoyxhsOM5YK0+wMgTrnmZaR
	HNZi5B5qH0qjIAXH5QXbBe0ALbXgQH+5K/FzwM+d9ZSlyyj26rMtE4JrpaYFbfA1474O
	SYqxL/U9hmBcFXbMAogM53oi+9Jja3K9sYy4rdDLM8NCtOUZemXcS4hl18Ux2FpZ6Ew2
	p5vg==
X-Gm-Message-State: APjAAAX0ksXgCpSLKBxfNRwgJVX6BevRfnsXZTgbKWVyvy+WFwHPK5iJ
	EoBTZNrp+xDaZV6gEW6erjTgaw==
X-Google-Smtp-Source: APXvYqyeYvOooaaaztJ5Np6emh+FugpmzcxcU5gWKTyym5eYuTCiWZOfyr/V68wjb1mc2l49iECk2Q==
X-Received: by 2002:a5d:5108:: with SMTP id s8mr8974212wrt.341.1559565035641; 
	Mon, 03 Jun 2019 05:30:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm34218428wrh.54.2019.06.03.05.30.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 05:30:34 -0700 (PDT)
Message-ID: <51adf784752be06beea78dbe4a523a403671dbe0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Mon, 03 Jun 2019 13:30:32 +0100
In-Reply-To: <20190602145530.183521-1-kai.kang@windriver.com>
References: <20190602145530.183521-1-kai.kang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [meta-poky][PATCH v6 0/2] Make systemd as default init manager and configure wired network
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
X-List-Received-Date: Mon, 03 Jun 2019 12:30:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-06-02 at 10:55 -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> v6:
> * create .inc files as Richard suggested, and include them according
> to POKY_INIT_MANAGER
> 
> Kai Kang (2):
>   poky.conf: make systemd as default init manager
>   systemd-conf: configure wired network with dhcp

This is looking good, I do agree with Peter about the file naming. I
ran it through the autobuilder to see where we are at runtime and the
results were not so good:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/484

We may need to reduce some of the free space in the ptest image and it
looks like there is an NFS startup failure issue in the sdk images.
There may be other issues in there too but those were the two I
immediately saw.

Cheers,

Richard



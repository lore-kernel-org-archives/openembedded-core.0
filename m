Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4730B7EB5A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 22:34:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 207so6990290wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zJggDSeUJHhejnqW2kL26czyG6ulZYiNuqpFfgMUPCk=;
	b=VC/NDO85qLhrXkKhJxkiX2tciZygLUZWIzNXWbwGScLQa66+8g8rmdB6B+xUc/uTZ/
	3baNO38+XJd3Yy5nzapqIClN1s9aIzP8PGHwvV++ZzUFVrfCXMVJvPCHsBnnCZyjZcCm
	kEG2ASWP9pfNBCk3AOjbAf8mENtaT5XcqmlW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zJggDSeUJHhejnqW2kL26czyG6ulZYiNuqpFfgMUPCk=;
	b=t6cwBllU83HKOUsK/zWkWsyngALtgrPojyP4fc3+TVfUPjqHIoSEsghmlg7CNOtUCq
	tBe2HrIB2M0vwq/THC4UGJUJb2xqVAj6AZ/u+pIt5Z4htGjCt37CZbh8enMVPoWUmCXm
	IXYG0K8KDUFaMHi9w5nSjAm6B2ENFBL9IDYXJJ2IadWnRa3/nK3hXlxP8gkQqptWk7ms
	o+1YsbFVtFy3zO9Sf2frK+J0MZu89oEVwdpGjsrz6uwvMC3DHlLAy2lRnM4wU0Z+pqoe
	J9drYcerbvS6bCS/pni7D9KuP91tHB5CPb5MnWAdvzyWYubMh9wfdF+8btIocQhaTl8A
	MHbg==
X-Gm-Message-State: APjAAAXvBseZfCVg6Tzl6V7JhPQjwc0zgr9HTII1GvrDEBnqvepUNc79
	XYQpt7y2IfGHFJXp76UYIXtBLQ==
X-Google-Smtp-Source: APXvYqxZzQDDrfdT/3B9QW7/Hcrze19S+5sS1gcaPwo4n69UsCcnRMLToNft57HjfIHqcNBqA7VMVA==
X-Received: by 2002:a05:600c:23d2:: with SMTP id
	p18mr178338wmb.160.1562279682032; 
	Thu, 04 Jul 2019 15:34:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h11sm7729279wrx.93.2019.07.04.15.34.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 15:34:41 -0700 (PDT)
Message-ID: <de9d7616cf0be808440f3b368f0fc2fb274bd7a4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Thu, 04 Jul 2019 23:34:39 +0100
In-Reply-To: <20190704134520.16320-3-kai.kang@windriver.com>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-3-kai.kang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [meta-poky][PATCH 2/2] poky.conf: make systemd as default init manager
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
X-List-Received-Date: Thu, 04 Jul 2019 22:34:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-04 at 21:45 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Make systemd as default init manager for distro poky. And set
> sysvinit
> as default value for musl considering security.
> 
> Update poky-tiny.conf to use new introduced variable INIT_MANGER.
> 
> [YOCTO #13031]
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-poky/conf/distro/poky-tiny.conf | 8 ++------
>  meta-poky/conf/distro/poky.conf      | 5 +++++
>  2 files changed, 7 insertions(+), 6 deletions(-)

I tested this in a build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/259

and there are a number of failures in there which look related to this
and will need to be resolved before we can make this switch. I'll still
aim to get patch 1 in since we should be able to do that and at least
clean up poky to use it, then its just the switch ti systemd we need to
do.

Cheers,

Richard



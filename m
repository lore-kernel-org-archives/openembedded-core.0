Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 625AB7F7AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 14:08:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c22so2592410wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 06:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=izs0Zc2TeZ1nJKiLUH2hMuh0WV9E2utxz1QcYiRhQBk=;
	b=h/7g33ihwzrndpuMXLVr1GPrKeOoW0hMUzD0LIVRkAlB/ynnuZNm/YaolWOMG8p1O/
	6OrHJrzEjJl+zW+wOyh1svWg/RNsUIdM1tvWkrP41KtzVcYrpbeaIOYkkgf3ms4j1An1
	qp4lTYQzfcskbPN5i1pazR3f02NsQjGr2L5Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=izs0Zc2TeZ1nJKiLUH2hMuh0WV9E2utxz1QcYiRhQBk=;
	b=A9pJDfDUpt9RKbFAHlJDedWIe/wYRjbfkFJ9CTspgENpBoVXNZHFcWw8Ofl3erY7Bd
	19g+VLX3u2GkEN9Cr/nXkgNc+IhHfes7amL4/Zwu8VO4gCttle1wshQYjhhC9zWSQ5ti
	y8oaJoWRh0coNBCzl/gQNyBMHQobZ9FWYM2L784A/tWbPEU7lQizWOrT2D0UavxNh54J
	4Oc9ZE5+FQsoYOG5NPi2Auti2YgGYhNpgGSob9Z80+kPdYDWoEl/BZiNpCZL79yd3z/1
	kUaRAv0Rd1HqL8QyFsbgLWh+oETQHqq6WfAc3zHg1p0udRajj9gzwHGHTZpN9keIcvkr
	9H+A==
X-Gm-Message-State: APjAAAXHU33w6HdORPZKP+pTfbtxpGLq76tk1l7obBrOcPUtFvIFgA7V
	hq1wMYaNqJ3LQsEUVdpRYswK5g==
X-Google-Smtp-Source: APXvYqwvgH5kIVslH6S3qvbd483RJy8Yj0z+G/3e5kNvIcT/UFXOj0xdD83DvCsJ+Q3OYB5nO5bALQ==
X-Received: by 2002:a1c:98c5:: with SMTP id a188mr3111620wme.133.1573135723014;
	Thu, 07 Nov 2019 06:08:43 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a10sm3824127wrg.0.2019.11.07.06.08.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 06:08:42 -0800 (PST)
Message-ID: <d3db0ce8182373d0f4e76427de741e93d839a3d1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Thu, 07 Nov 2019 14:08:41 +0000
In-Reply-To: <8002dca6398624337867ed88608e7156e6f943e4.camel@andred.net>
References: <20191107094033.33950-1-git@andred.net>
	<CANNYZj_Ph4M_cVFQXaWpgPExhnkjntYUOm_8Zio7APmtkP_Tgw@mail.gmail.com>
	<8002dca6398624337867ed88608e7156e6f943e4.camel@andred.net>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: enable OpenSSL unconditionally and update packaging
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
X-List-Received-Date: Thu, 07 Nov 2019 14:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-11-07 at 14:01 +0000, André Draszik wrote:
> On Thu, 2019-11-07 at 13:26 +0100, Alexander Kanavin wrote:
> > I would rather keep the option to disable openssl, but simply
> > switch it on by default
> 
> Why complicate things, what's the use-case? If libevent_openssl.so is
> not
> used by anything, that library will not be pulled in, as it is a
> separate package now.

Build time dependencies and hence build speed?

It sounds trivial but all these inter-dependencies do mount up so if we
don't need it, keeping things minimal has advantages.

If there is a security issue in openssl, its one more thing that would
have to be regenerated if a CVE fix were added too...

Cheers,

Richard



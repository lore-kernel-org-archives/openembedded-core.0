Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8EB57EE91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 09:08:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so1429584wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=9WR+Xon+lAIlBulSrO9wyfCKROK5S+bUXuVeWXcDnEY=;
	b=XIkoj5zTGSJraxFif9EDu3bsKSGWMI5Xxsc+nwP4e4DEof8oPM7yyRpkrBmR4k42HH
	pLhXzPGYyRhe8tc+SDo2TKqJF/DZePOw3g6Qs1oYNmnwEkK9ASm7Lx8PMZkfIbgm8+QM
	nWbhlEJrVtFJIDghe/z7ODo1yWYqsbjGCT7CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9WR+Xon+lAIlBulSrO9wyfCKROK5S+bUXuVeWXcDnEY=;
	b=L4Tp81g2jKzmh5XU72y9GnClaasv2CRQNoiT4qf173feyNwJCshWrDtcKbP8nZRgLb
	gNgl3bxfbwpjUN12HMSfSiUdV01Q6VtYucJ2sO/E9G4RVw3+NJAlfUbh9hV4OnnFROuj
	fbz/p29DDBlmcKQ/BTLHrU3Pb7JbJEfmhu37b8f4vFzKy7NisI2Kmbp8uWPiDMtEI8uH
	Jg4vPGvNgMM0RoUS8BPWCcuhwLxzFNsiNIjscQ24IU9pYXbrvSTBY5GFWLm+4A9n6BZF
	tClSdemTLOd3GQEdvhR82vPxapREpvZH07x3EwcBsyrUH/kW8VLjAXy1lPzJgq07BGd5
	6Y1A==
X-Gm-Message-State: APjAAAXDCooG71VcWwXcqBmRNajI9C67RwnuXWUy6/vQu6DannuJurq/
	dKo/WhJVU6xYq79/bk1gs0tnDg==
X-Google-Smtp-Source: APXvYqz/5WMd/+paP+FW6WK/spKUl5f0yHf81pFdHW0+27unMzd+//u40UzwFlldFwmbF5T/6M1jcQ==
X-Received: by 2002:a05:600c:214c:: with SMTP id
	v12mr4284998wml.28.1562749731407; 
	Wed, 10 Jul 2019 02:08:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y6sm1602336wmd.16.2019.07.10.02.08.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 02:08:50 -0700 (PDT)
Message-ID: <42160455aa393b1abbf68290154bf8e07d121e8c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:08:49 +0100
In-Reply-To: <ce900e3b-8b46-fe8a-d123-da28dbd6b054@windriver.com>
References: <cover.1562570956.git.Qi.Chen@windriver.com>
	<0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
	<bffaaf84031568a924656bf092d9d17405fbef2f.camel@linuxfoundation.org>
	<62f74fe5-abe0-9d13-50ce-7660291180ce@windriver.com>
	<6a7b868b-348a-b747-4115-9e4089ad0232@windriver.com>
	<bcfe62810b7e56c82606a759e50821547da6086d.camel@linuxfoundation.org>
	<ce900e3b-8b46-fe8a-d123-da28dbd6b054@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Wed, 10 Jul 2019 09:08:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-10 at 11:06 +0800, ChenQi wrote:
> On 07/09/2019 06:18 PM, Richard Purdie wrote:
> > On Tue, 2019-07-09 at 17:36 +0800, ChenQi wrote:
> > What happens if we add:
> > 
> > ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation',
> > 'nativesdk-libxml2', '', d)} \
> > 
> > to
> > `
> > meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> > 
> > ?
> 
> This does not work. Using nativesdk-libxml2-utils does not work too.
> Both buildtools and eSDK do not use this packagegroup.

Ok, I'll need to spend more time looking at the problem then :(.

> I've sent out a V2 of this patch, with change to put the 
> 'libxml2-native' dependency in xmlcatalog.bbclass.
> In this way, we can ensure that the xmlcatalog is from our recipe.
> In normal build, it's from libxml2-native; in build-sysroots in eSDK,
> it's from nativesdk-libxml2-utils. Do you think this is acceptable?

The class change is fine and I'll queue that.

We are not adding xmlcatalog to HOSTTOOLS_NONFATAL however, that is
simply not an option or the right way to fix this.

Cheers,

Richard



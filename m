Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 068B46007A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 10:17:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so56911666wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ShGYGAz5pVYRb82VKDXBlVxAr5RdM7rPXO6xg7hKC/M=;
	b=G5/v1ppK8EGBviXpLE33ESaT6WvNY8PZPkjwwbrdCuPcucMyFuD64FzGHj4II/8NzC
	lLES5ws0y2SX4Essz3rB5nMo2bDvc/65NdkwWtwdZcc8S8hiLuX92T8q4AIe/8mzLaZR
	C4YSyicJd5/0elnmIr8kDGptiGbsYSXDt7NB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ShGYGAz5pVYRb82VKDXBlVxAr5RdM7rPXO6xg7hKC/M=;
	b=AqZL0R5WZEtaWy4hHrbH+JTvvLXUOmQg1oBBjtwrPQYqD7tUg4GBRV1ZPV9GDQBiLb
	+NSLrvKZQNTfg5gA2OsUw63EgDn/dve3jox3IEKK3pmT0VaV1nqbWwQD/Zx2UNi1XJCS
	yvN3UEcHAOdNN+fM6c/NKRFoe34RdUZeaV38+jei7EWU3EVucoZEXUdzWZNGAvfYvI8b
	4yApaR7oseCUUDVZbJRp3VWBHuMwjcuZD9AATZTBPGE/jUUXR0igi2NmcJgxG9mZu+fO
	DIiMfIwCakB3ogzTAWQJtdX6Hueocygbpg5PvDkTYf6xNK4U3yueLTR0EwguZtFxvAL3
	pB3w==
X-Gm-Message-State: APjAAAXgPZlRYXbx88B4FQ1nxW8T02m0QCr9nFojjBNGFZb5oI053PLE
	6z+t0fGv9Hmg2e7d8vMqtn9EOZBYblE=
X-Google-Smtp-Source: APXvYqzwwb4ZjwlUWCSvHtt+oHYGXYcoGgs8ulQVBlqRTTlHw/B46TjAz7eTxNcLjgr/TPgp4jcRlA==
X-Received: by 2002:a5d:43d0:: with SMTP id
	v16mr103801332wrr.252.1564222676686; 
	Sat, 27 Jul 2019 03:17:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p6sm60901612wrq.97.2019.07.27.03.17.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 03:17:56 -0700 (PDT)
Message-ID: <b537d1766b6df65557720910c069e11b221f1a51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 27 Jul 2019 11:17:54 +0100
In-Reply-To: <20190726022210.18415-1-zangrc.fnst@cn.fujitsu.com>
References: <20190726022210.18415-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] mdadm:add mdmonitor.service
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
X-List-Received-Date: Sat, 27 Jul 2019 10:17:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-26 at 10:22 +0800, Zang Ruochen wrote:
> -The original mdmonitor.service is wrong, so append new
> mdmonitor.service.

"wrong" how?

Wouldn't we want to patch it so its clear what the problem is rather
than just overwrite it?

Cheers,

Richard



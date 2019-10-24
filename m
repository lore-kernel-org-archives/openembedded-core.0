Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 083D27F8F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:21:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q13so20020695wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aomvXqPLnCPwutumd6ky+R/oPFpxvwI0wm1iysnuuAw=;
	b=Hz1UkbNmlZLcz7ATl+QoBXgclK06NujzMFMd2aQj5BvQnwT9d6+ppsEiIdYSoJUNLm
	pHoeJQfI2iVwInmKA0PEylqL8GAWujdgvKtCqa13Ix6vt82vKdADSUjZ3CKAqGXX86Ar
	vrqWuY8yNbFuk+17Xb0z/d+vVB8sjCVGp3+bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aomvXqPLnCPwutumd6ky+R/oPFpxvwI0wm1iysnuuAw=;
	b=G/796BmkLtKUXEApb+CgefJhfZ0Z+FuSGrg7CEEZUiVbU3GxjU2SgWGRwaYl6vlCwS
	GgIEQqtX3JYjKCJkAGjlmVRLtC0nSu6WzJDb8XGfzM8oq3BhYZCe+BWmWxLcjv1WTXuO
	zbKx3jmekbBdu4WvAk1kwnyrj/yz+2venHrrcLl9JQa3iLK88ldsIXONfLA6qIfxkm58
	/AWPSKxJNdUvX/IG5VaofzWQQ/droC0Vd6G4CEuxUJ/9CJh52P+QpOyc9cLCR9enet9x
	q/ZI9YHFj7OwuN2LaEsgOeMhtSbAaQcNojEbZIKpoBDo36ZcKSZP0vRkJs/bXWEU4X+t
	/23A==
X-Gm-Message-State: APjAAAWF67e6yIMiucXr153OnzNWr0BixYK331Fj7pwDwY6PQ6TnlaSE
	Rqcix9ySR/XOxGwfDg705r9xz3P5lWw=
X-Google-Smtp-Source: APXvYqz7k5HcaG3qeSMZqhUd62Afm6isN8UyA9kxOcwUKWZ3THl3OfioRPQ7QKBJ1wol03lcsKKtmw==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr2539095wrj.250.1571905304656; 
	Thu, 24 Oct 2019 01:21:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e3sm1501108wme.36.2019.10.24.01.21.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 01:21:44 -0700 (PDT)
Message-ID: <692b3ce9c5ea3f5a55084d109f2cc7f39cea4ae3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 09:21:43 +0100
In-Reply-To: <20191023210240.27983-1-alistair.francis@wdc.com>
References: <20191023210240.27983-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Thu, 24 Oct 2019 08:21:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-23 at 14:02 -0700, Alistair Francis wrote:
> From: Alistair Francis <alistair@alistair23.me>
> 
> Upgrade mesa and mesa-gl to 19.2.1.
> 
> The license hash change was a trivial new line removal.
> 
> The glx-tls option was removed as it isn't included in the
> meson.build
> file. It has been replaced with 'use-elf-tls' instead.
> 
> The -Dasm=false was removed as it also is no longer included.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v3:
>  - Fix missing Upstream-Status
> v2:
>  - Add back "make TLS ELF optional" patch

This appears to have fixed musl but still breaks libsdl2:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1145
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/43

Cheers,

Richard






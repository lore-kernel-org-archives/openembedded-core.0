Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id E099B7CE89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 13:46:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id m35so2000405ede.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pHqj44bR4HrfnFEeBHNXajBzbbUPxX2VEpdmQBN6gTE=;
	b=tP75e17ItajvLPbPvXdQoF9BRe3r48xNbPkkh4lqgv23ElUpzP7fRmTgX1l//OKfMq
	G++vy2dh74ZnQEBlQ9vFafd4KedjU8G7i/e9M1WW8/D5XL9IuuEUmLBMdI94uuch4F4k
	ADaIn0jf+sv6wdiI+yOHcLqrFUEBIhQeGIKQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pHqj44bR4HrfnFEeBHNXajBzbbUPxX2VEpdmQBN6gTE=;
	b=ciKNBu3cD+IH5T021zImjAkfIb8kVcBFJsk1lSgm9wCSkuoroqSxu5TULsrdQmhC1e
	0UdpHZEIs5lF3XmX4vST2x0M+XfRhThVegecy2QOP1yXgfxsDhFUV0SzCJ6jLxEkB5bH
	W23CBokR3Y+yYlku8hxmKlaG7DEyhcS+XAJ0vNdUZSPSi8kIu1dMDZAPipg4+qCHmJUj
	qfh3LyYYdu/IJv+eCfDcAf4SNlvbbEexZE6HodJ3jQRm3om5QB2MUFOhE5EG7c0Jlabb
	QoRSfeCQsu/G3G2e2YfE0cFxoV8igw94WgUxAXw7/OctJN4ApsDiVX5MZiZ7N+tUQgGN
	kGyw==
X-Gm-Message-State: APjAAAV3HFhPJq5oaja2ihd0kn9Yc+ON6YNN4Y71CQnI9uFjgNxEIcPZ
	Ocb+uxldMGcOmR4bwFQcDSKoAPeOPbOEsg==
X-Google-Smtp-Source: APXvYqwvxUe/VGLQu/SQGY47fiZg/0iI3I2ZCcAcRPcIrCwxJuLi9eFAg7EtMy3FruP1UhdLESpuUg==
X-Received: by 2002:a50:cb4a:: with SMTP id h10mr16815001edi.134.1553089565590;
	Wed, 20 Mar 2019 06:46:05 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id i46sm664950ede.32.2019.03.20.06.46.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 06:46:04 -0700 (PDT)
Date: Wed, 20 Mar 2019 09:46:01 -0400
From: Tom Rini <trini@konsulko.com>
To: luca.boccassi@gmail.com
Message-ID: <20190320134601.GG18421@bill-the-cat>
References: <20190319181544.314-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190319181544.314-1-luca.boccassi@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Wed, 20 Mar 2019 13:46:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 19, 2019 at 06:15:44PM +0000, luca.boccassi@gmail.com wrote:

> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Dumpimage and fit_check_sign can be used to extract kernel and ramdisk from
> a FIT file, verify them and kexec for a faster reboot.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom


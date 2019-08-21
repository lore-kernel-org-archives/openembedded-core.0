Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD88751D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 12:25:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b16so1830062wrq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=OFmhMBT9ZdxIOwJVRizozFeyqZXH55FvlLmdCb3A6a4=;
	b=QUlbg76OfnY8D3z1xNwo8p4ctYuHFLmgXGp741hoBMgddlnxP7YI209LlwZnAJnKbX
	NEepKbBnY7xh39TnjqU72sxJyTxAKKnWa0oAxbl2HSjTJpF7cMN4UQnCsZlElIB0+JmC
	ua/vzPkWO72FO/4r27f1xfzd6w6DNyfJuj71Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OFmhMBT9ZdxIOwJVRizozFeyqZXH55FvlLmdCb3A6a4=;
	b=tsb8yZE/wvdtZxgUwOagzWSiB14fBBjKROp1yKvT8IZ6jp+wVAyA1wlrg4xol+bIju
	Bw/Pnq5trGuwiz+HsQAbOWMf/sv8+bRmrbeqgEf8xrHEHtBKgR55k5BKcXDljet9rz6P
	zusZTefileiS/txYVHNupn6E4w9G0n/xKsid+YwCEZ/G9YZLqDbeE61n2Vg2dXVuDjGn
	v9SC15JGPfvvfnE4Qr34w1mbaykbIcA8DxCE+ORUnRsIcDlVXfp4a9rMi1VSHK6nCzq8
	ebQIM+WseiKaz+6SP50N375Hk4VCPK2IhtfoPNcWUrGs+3SoZ+dXvoQEcmXthmk8JBmo
	BV1Q==
X-Gm-Message-State: APjAAAWA8p90sjJpEGUERJDzaUv1yKe9IoXat/GQ5YlzM7prt0zOQbA5
	y5UGwS5ZYdrC7gSbeyfx3Bi81g==
X-Google-Smtp-Source: APXvYqxLFoh1tQJnfzwhxB+Debj+M+or6pzAhLAtDG3A/Ej2lIkhkknvjf/th71VtntQicp+36zZrg==
X-Received: by 2002:adf:e5cd:: with SMTP id a13mr39211804wrn.316.1566390343016;
	Wed, 21 Aug 2019 05:25:43 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a11sm21616928wrx.59.2019.08.21.05.25.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 05:25:42 -0700 (PDT)
Message-ID: <2f8f87ef44cafa2769c654811bc0416c04acd872.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 13:25:41 +0100
In-Reply-To: <5b4e3af1-4f54-2b8d-a378-48cca0d98816@intel.com>
References: <20190820205917.21297-1-alistair.francis@wdc.com>
	<5b4e3af1-4f54-2b8d-a378-48cca0d98816@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] qemu: Upgrade to version 4.1
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
X-List-Received-Date: Wed, 21 Aug 2019 12:25:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-21 at 11:11 +0100, Ross Burton wrote:
> I think this series is responsible for testimage failing on qemumips:
> 
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login
> into 
> serial console as root using blank password
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
> root
> 7

Although it passes in my -next build which also contained it so I'm not
sure about that...

Cheers,

Richard



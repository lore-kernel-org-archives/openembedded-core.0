Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49DFF7C124
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 09:12:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r3so16272259wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=x2/emfZhQSI2KsKo97ZJOg/IKN5zw19RRDOofTdedu8=;
	b=XTeu0iUQi0sO4CvIutXo8kyBrC532JqsYiSmm4IOnG2xKZDoNk+jQLFhy2Si6RbL4S
	VwmVO+8iL/n7rT4rET6MjvShBOZ05ochCO1/PZjf5H3C0ycFfFkXKZ4/JOjPRUBgiDpj
	K9DYEeWfffnE3jegF6jiV7bNWsqUKL3PDRuQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=x2/emfZhQSI2KsKo97ZJOg/IKN5zw19RRDOofTdedu8=;
	b=Dh5JbPlUdrZU6G/aeT4apFcmhNPawzv/yyVFZ+fX2EvYK24AcrW+u6cxVqXN6/P2e7
	POkrIVTamsEIDorZkXoEB7m8g+2Ra8TTDCV/me6qi3j9x84byKAQTYSiX6k00F7ah/hB
	P+vg2FftCz2cqvqEoVjIuC/HWzhRDu96JVULgd8tuzG7CaA4Wzqev+edaM8x/a0zTf+d
	iKnCyW6dgmkWMCyVS/4TMRJibMEBsHZjBUOc0SdC0mS80bNIcglH0CFd9mDVLMYDRO9w
	nJnqKYqSefifM+AFTtg2ha+diUweCbFDWaf4RRsrs8x0GOslO+KwVipU2m75YCfzloY1
	5QYQ==
X-Gm-Message-State: APjAAAXy7sqQM14AENoeykyViqNM3vYBnBJ/7np6wNSKOi1e1+acJx9u
	Vm54k5E88cUE0nBt4/ue6wiMvw==
X-Google-Smtp-Source: APXvYqyQk+DS0GKdMzvuUMvkYk2d7phlSZLE46qLXUcblYkmL15bCLOQ319ZX23sFl2U915+EmVkrQ==
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr8272701wrp.164.1570957920977; 
	Sun, 13 Oct 2019 02:12:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t6sm26941958wmf.8.2019.10.13.02.12.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 02:12:00 -0700 (PDT)
Message-ID: <8a76a105e6046cf9601b02f7b0af9e258fd76d7d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 13 Oct 2019 10:11:59 +0100
In-Reply-To: <73a4ebf5e0fe883b6d0cb8757dade5cca194d413.camel@gmail.com>
References: <20190928231617.3553801-1-raj.khem@gmail.com>
	<73a4ebf5e0fe883b6d0cb8757dade5cca194d413.camel@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] core-image-sato-sdk-ptest: Remove valgrind ptests for riscv
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
X-List-Received-Date: Sun, 13 Oct 2019 09:12:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-10-12 at 08:48 -0700, Khem Raj wrote:
> ping

It merged but I tweaked the patch as I mentioned:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f2df235b49ad920911d152f75cfe2b1e2726e9d4

Its not rebasing out but you can drop.

Cheers,

Richard




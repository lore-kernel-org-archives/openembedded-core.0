Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5D96C0EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 19:03:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l2so6606755wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qwWl42F2UfXK9CdKSITCSsx2y50Tf7CkQLG++xXxIEY=;
	b=VFS7W5ToiLJo3/mWdSQFzPtPVEnu3XaXetoimdkGySp4m0ORoQFBuI5T5o0e+k5vw/
	0tJebeuDR+/rfwneOsBLgvpr/7s2d0f2MLvSu/fLUrpeUcJcaQYgKi+X5jLoyJeokx24
	7mFBNT2GGeJs0JkDrg+C0d1zzHa9BJmAP1MkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qwWl42F2UfXK9CdKSITCSsx2y50Tf7CkQLG++xXxIEY=;
	b=GxgSyfcM3OSu7Nrw7KaytQXMW++tasr6ffi84uUPvFGiT1+LcuaBwY7fAsjSAVGOH4
	TY9CG30KEQwQfLOLQz0WCjM2K7MVN5KnQTcRKFeBFpYGX6LENWOO5OoNHUf9Daf8P1Jj
	/leJ1+9ui5NrQli++KjgIFp1RMAPZq9uSnofWECdd8PeE+yQuoC6dljP0UBnpkfKgv59
	xqogTu9oCRAIXNUvIpweTR3MzKLNrEeBfmqg1vEnT4/gV2VoGNmTrXLeQqvTQ1OZDDnz
	mxHFQgEay56w5pT4ULGN3weiZb39cVHeyeUIAQCC+KP0+6+acfUDZD0ATX/rDL9fwT6w
	//jw==
X-Gm-Message-State: APjAAAXBzrNAZRqWIeYnn+iGmoNp26g5mmS1bETayQofnsb/4+x/tVrR
	ucQMBMqLHWwy3YVGQAhn6dw19Q==
X-Google-Smtp-Source: APXvYqwkGvRUSZgMCcV6k6MvyCM5CHaoP2Ga0qOgFYTOTWWdE3XuY12F8zDd3GSu4JGlRTpLPnBSBg==
X-Received: by 2002:adf:f2c9:: with SMTP id d9mr24205611wrp.36.1556651033696; 
	Tue, 30 Apr 2019 12:03:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o8sm16811048wra.4.2019.04.30.12.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 12:03:52 -0700 (PDT)
Message-ID: <3e4a4b1296f3c42c087d2d03a6ad11b47239c694.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changhyeok Bae <changhyeok.bae@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 20:03:49 +0100
In-Reply-To: <1556575824-39650-1-git-send-email-changhyeok.bae@gmail.comd>
References: <1556575824-39650-1-git-send-email-changhyeok.bae@gmail.comd>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] iputils: update to s20190324
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
X-List-Received-Date: Tue, 30 Apr 2019 19:03:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-29 at 22:10 +0000, Changhyeok Bae wrote:
> From: Changhyeok Bae <changhyeok.bae@gmail.com>
> 
> build system is changed to meson.
> 
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../iputils/iputils/ai_canonidn.patch              | 58 ------------
> --------
>  .../recipes-extended/iputils/iputils/install.patch | 26 ---------
>  meta/recipes-extended/iputils/iputils_s20180629.bb | 61 ------------
> ----------
>  meta/recipes-extended/iputils/iputils_s20190324.bb | 55
> +++++++++++++++++++
>  4 files changed, 55 insertions(+), 145 deletions(-)
>  delete mode 100644 meta/recipes-
> extended/iputils/iputils/ai_canonidn.patch
>  delete mode 100644 meta/recipes-
> extended/iputils/iputils/install.patch
>  delete mode 100644 meta/recipes-
> extended/iputils/iputils_s20180629.bb
>  create mode 100644 meta/recipes-
> extended/iputils/iputils_s20190324.bb

This is better but there are still some issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/43/builds/549

https://autobuilder.yoctoproject.org/typhoon/#/builders/54/builds/128

Cheers,

Richard



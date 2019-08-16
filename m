Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF947F2F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 14:48:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p74so4257991wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=QH+UEp9QRzsKab+l/zbKpUPlB/pJnTpgAjbQ+gD9I4E=;
	b=Km/kyFlWspjUwjMF4np78yZ4kW5f6UdM4JBOLWhje8SKkOd84KemHXj60WYgmr7dzP
	RNQBOSSPopYHNsHICngMtwnXQQ9qDivYGE4pzGF0A3gHV+/32CDvKDv9tdGQosPstT1i
	w72qiS+BPZTwryMQWW9bmU4A3/oG3fYh32KT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QH+UEp9QRzsKab+l/zbKpUPlB/pJnTpgAjbQ+gD9I4E=;
	b=A4ZNXMP7HH8JEUSgdojOlgPwfeylJlrm/FTqumjoaLvmzZKq3QT5gkTEvn/X6Vn8XP
	kE1PVwZshS4z027vtTmGXQ96PKT6Lu7pyjFoEl8g02lZXVwTVdaKJNPug/vzVSnPXtkp
	BVrztVyhQr+YPPNQIsMYOtC2a3n9NQqLgiSuuoazZTgbSNSomuk/J3N7V9ukFzcqwKhm
	2HoXefjuliak9SWD8vq2hxiFc8i5iokog1KwVAidLhtfoirunS5y9EA6pyyXSV6ArjlI
	YahrwJr9ZTlm6bLo99Q9I72oL96tfG48F3wKDYjXOaMi3LJ3rP6c8b4Hh8tJRTS/QTE6
	z42g==
X-Gm-Message-State: APjAAAVHaRHtoMDTH9F2XxNUldV7eevNCA/UhKk83loPejyliKlAbAQd
	cdFV3rIxT0ckWsfu5DpkpxKdIm5zAl5Msw==
X-Google-Smtp-Source: APXvYqyQYB1pNSs7Vns7Dpo8wI/kjANteMM0Z1XkqN/P95KGLlSS3y31IFClCvQlm5UoqEzjiRaJnA==
X-Received: by 2002:a1c:9889:: with SMTP id a131mr7411702wme.22.1565966892847; 
	Fri, 16 Aug 2019 07:48:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b136sm10325464wme.18.2019.08.16.07.48.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 07:48:12 -0700 (PDT)
Message-ID: <1ff55109be0cdd952967564fe1d5ff026413ccda.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:48:11 +0100
In-Reply-To: <20190814230057.31103-1-raj.khem@gmail.com>
References: <20190814230057.31103-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V2] libffi: Upgrade to 3.3-rc0
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
X-List-Received-Date: Fri, 16 Aug 2019 14:48:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 16:00 -0700, Khem Raj wrote:
> libffi 3.1 release has been a bit aged and new architectures,
> compilers
> have since been come on stage to compile it, we have been carrying
> patches, but its better to use the latest 3.3 rc0 which has lot of
> these
> issues handled and is in good shape.
> 
> Use 3.2.1+3.3-rc0 for PV to keep room for upgrade path without PE
> bump
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Set PV = 3.2.1+3.3-rc0
> 

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/960

Its a multilib file conflict issue, see step5c:

Running transaction test
Error: Transaction check error:
  file /usr/include/ffi.h from install of libffi-dev-3.2.1+3.3+rc0-r0.core2_32 conflicts with file from package lib64-libffi-dev-3.2.1+3.3+rc0-r0.x86_64

Cheers,

Richard



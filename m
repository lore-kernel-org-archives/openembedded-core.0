Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00C7B610A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:06:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m16so11016178wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=arjx6CUI8+15xixBrliu9bT8nvQcV/wLkw2JMZ9co+Y=;
	b=Z1kpUaL4nO9AWVkURR0XbPpbjg6vxj0yACjPq4kbYv+rS2WeE0yBTli3+OpbZLHpy5
	DMyEqbq6wr5uCg5FGDhV2fhNVy1Ya5hTLH5hZjLWg94Oy9c1CVzWiy6sZTvNDDeDH3iR
	rXUFCzLgQzTAbBdVYE9IG94Q2Qz90IQdj1Qcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=arjx6CUI8+15xixBrliu9bT8nvQcV/wLkw2JMZ9co+Y=;
	b=MbO82G2DRhVVXMK2gC6hw972h/YNO2RgEIoDcGxWq/IcpAeCUNe89/Hquk1RMSOzbU
	5+zi/AyAfUqvuNwCpZfzbmVXPN3ZCqh9uv00mQbTnF5l3JLtarRqN3QPPW+ret1CYzcz
	6EactR9RTjbdBp8uSkwIu3V+9o7bEo3CBOPLReS6dIEmd2Y+ADxRe/GGrhnluk6lUxS8
	YGXQdU5TGsIldYdGeaqldVWOqKSkM1WZNI75fwcphADzmM2A/NrXqbHlyOHZ1r9XojbQ
	izhMd1wvRWzYwDf8lZch3/yG88tgSESG3kEXnT4JS63aa3tL8UTiUGSeL8AH3Y/hdupp
	+zrg==
X-Gm-Message-State: APjAAAWQxto3YWa20sUWdXLgxB8cY3IQIqyp45dzn5AxXqUwd7s2Q+XS
	MLeK3eHN6WzH5/UhbxvBl4M2rg==
X-Google-Smtp-Source: APXvYqyog8OToUPqCnyXOjXdGXCUKSko08iSqrum8sHpVTaCUH5Cu4Tuasn1k93ft+gJbZIXV2lziQ==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr4189081wrp.63.1581689192483; 
	Fri, 14 Feb 2020 06:06:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 5sm7476163wrc.75.2020.02.14.06.06.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 06:06:30 -0800 (PST)
Message-ID: <31a811fb1053f640ae6a35398f6723367a289b81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org,
	Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 14 Feb 2020 14:06:29 +0000
In-Reply-To: <20200213133616.19507-1-sno@netbsd.org>
References: <20200213133616.19507-1-sno@netbsd.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [RESEND PATCH v2] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Fri, 14 Feb 2020 14:06:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-13 at 14:36 +0100, Jens Rehsack wrote:
> Announcement: 
> https://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.html
> 
> 1) Remove upstream provided patches 0001-glob-Do-not-assume-glibc-
> glob-internals.patch
>    and 0002-glob-Do-not-assume-glibc-glob-internals.patch.
> 
> 2) License has been changed to GPLv3 only
> 
> 3) Important bug-fix is
>    * 
> https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html
> 
> 4) Backward-incompatibilities:
>    * Number signs (#) appearing inside a macro reference or function
> invocation
>      no longer introduce comments and should not be escaped with
> backslashes
>    * Previously appending using '+=' to an empty variable would
> result in a value
>      starting with a space.  Now the initial space is only added if
> the variable
>      already contains some value.  Similarly, appending an empty
> string does not
>      add a trailing space.
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

It breaks nativesdk-make with meta-mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1562

Cheers,

Richard



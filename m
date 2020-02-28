Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9676860B13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 07:46:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t23so2145905wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=N+jl1z169BQPyM7QxkhDl3ExOQWr9zj3ojRcQkqSy30=;
	b=C3MfwzjrxOUKJGtBFvX76+WuPJy4X/iM/9dvGzPcYr8k222Ucmth7ddNjHx0k/D7d7
	t6TnJVVi/AMAk59EauuD+ZWHP6JjkM5rWBEyB2UWWeciV1za44knBd7ulM2WlFFPgZvo
	6UPwFrosUp+GH22Hd0PvZbyXlOWy7z0kOTIhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=N+jl1z169BQPyM7QxkhDl3ExOQWr9zj3ojRcQkqSy30=;
	b=M58eWCTdjb6WGczGpHVJyyTULrcfh7D7lXYj+qCLSTb81Xe1mFDkCyThFtocRHm59Y
	GZPO2mr3acpmRGQtBKQtq8ApUF9JVqM3+q+to/iDHygYzj73SfnbsLMVOecNfpXTj2Pn
	Gga8psD9OUsDMvYoLMyz6tH9R4nGgfeqbT5mbPWPT3F3PncFzCCVlOmZlb+hx8CRha9b
	ut6i0T7dezudhek30e6/dPcP0g/CFG1TqXNsevXrpTC9WuIIwz2Q60SzHZjUY6QEjRUl
	M61duhYerSUyfiYNEuSQLwrWPjJFH3eNSMBOo2XGu/j57ToLoFQFDh4kpKAK87sJy/va
	7Lmg==
X-Gm-Message-State: APjAAAW75YVvqESspXvx6YQw0RT4adlI5kZx1S9ICQNEuemSCL9F1TvD
	MltbntM95h19144vLLygYVYWWA==
X-Google-Smtp-Source: APXvYqztuka8JZ1GiWQkJjlXnCBdVnKOa2W/suKGMCkXh+NuGeTtzJk4xjMImjq5kxiwlTOVH3i8Tg==
X-Received: by 2002:a05:600c:20f:: with SMTP id
	15mr3389415wmi.128.1582875961172; 
	Thu, 27 Feb 2020 23:46:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x21sm912595wmi.30.2020.02.27.23.45.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 23:46:00 -0800 (PST)
Message-ID: <3bdcf798302bbb0ce1de37eca82223dd8c3778e3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 07:45:55 +0000
In-Reply-To: <20200224143920.19383-1-sno@netbsd.org>
References: <20200224143920.19383-1-sno@netbsd.org>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH v3] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Fri, 28 Feb 2020 07:46:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-24 at 15:39 +0100, Jens Rehsack wrote:
> Announcement: https://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.html
> 
> 1) Remove upstream provided patches 0001-glob-Do-not-assume-glibc-glob-internals.patch
>    and 0002-glob-Do-not-assume-glibc-glob-internals.patch.
> 
> 2) License has been changed to GPLv3 only
> 
> 3) Important bug-fix is
>    * https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html
> 
> 4) Backward-incompatibilities:
>    * Number signs (#) appearing inside a macro reference or function invocation
>      no longer introduce comments and should not be escaped with backslashes
>    * Previously appending using '+=' to an empty variable would result in a value
>      starting with a space.  Now the initial space is only added if the variable
>      already contains some value.  Similarly, appending an empty string does not
>      add a trailing space.
> 
> Fix incompatibility issues between gnulib bundled with updated make fix issues
> in w32 compat sources.
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org

Unfortunately, crazy as this sounds, this is causing mips problems on
target with kernel module building. We only see the following failures
when this patch is included:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1612 
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/315 
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1616

Cheers,

Richard



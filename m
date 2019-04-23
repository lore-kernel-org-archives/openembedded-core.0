Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C2AFE7D2B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 22:56:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y197so2152214wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fQKTywUOy2ytfa5Fig9cdHcN/HHSWqMskb4ml3kq5tc=;
	b=QIcVvJm8BUQMOgMga6Xk3QIMEJzPAkviGD0reLfMU6ifqqaTuEkvqHEmVTSJtK3T+u
	eTJq4j39jtrXeYnhty/QEa6CdE88zSrvHdTwjmwd2Q0HHd9OGl9neDkPL25SqQu85VsC
	ifjBXn/FKWfeAxtGOfLwMULfBXQNPkUHHMlMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fQKTywUOy2ytfa5Fig9cdHcN/HHSWqMskb4ml3kq5tc=;
	b=BS59KHHnrd+MK4vOx0dmCPfVW6GSFQStDhPia9TqmDc+Jj01ST/KXziItpEmc4+ZL5
	xJaHPRwlHDZuAj6Ruw1ih9fMLEfe0fo6p+u7JYZb52VG/UHk6JfEG1MJXHirKpVDFSMU
	IoGFAgY1HAyrNM7m29UzTSHsJqjm9edYEDrLje/7pzidky/0to9vAtc5PuqayO4IRFIl
	+zhPLyunPkg81tNKlX08knc/cPXoYhzrL3RDWfCr1IfrKeSuVtpz5Q+03xxBoFzC+y8L
	Fkt1ErTSIOREXV721uk1P+TKugDrPrw2ILaVAm671s74wty6ahA/MUDH2abMxIgadzdj
	+w6A==
X-Gm-Message-State: APjAAAXASS9dP34ISHTPClVKj/Y+PmQ2+mlmBc7Z9Iz4dMwHeoKYlfDY
	AYTgR0UY+o31zNy5j+yS/IMUyQ==
X-Google-Smtp-Source: APXvYqxbuSH4W++i/YegewoA68Sj++DBmvbnipXYUuiFb52WAqReIYzBE54xTIcKYZ8H/Z9AxXAzMg==
X-Received: by 2002:a1c:7512:: with SMTP id o18mr4282424wmc.68.1556060187552; 
	Tue, 23 Apr 2019 15:56:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	13sm16024492wmf.23.2019.04.23.15.56.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 15:56:26 -0700 (PDT)
Message-ID: <1279b24df16a06a5bdc17b699121e090d4ff1a30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 23:56:25 +0100
In-Reply-To: <20190418155918.40653-5-alex.kanavin@gmail.com>
References: <20190418155918.40653-1-alex.kanavin@gmail.com>
	<20190418155918.40653-5-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] python3-pygobject: update to 3.32.0
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
X-List-Received-Date: Tue, 23 Apr 2019 22:56:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-18 at 17:59 +0200, Alexander Kanavin wrote:
> Switch to meson build system.
> 
> Add a patch to disable tests.
> 
> Add "introspection" to unknown configure option whitelist, as
> this recipe needs g-i unconditionally.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../0001-Do-not-build-tests.patch             | 26
> +++++++++++++++++++
>  ..._3.28.3.bb => python3-pygobject_3.32.0.bb} | 10 ++++---
>  2 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3-
> pygobject/0001-Do-not-build-tests.patch
>  rename meta/recipes-devtools/python/{python3-pygobject_3.28.3.bb =>
> python3-pygobject_3.32.0.bb} (68%)

This merged but I think it is still causing some QA errors which
somehow got skipped in the previous tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/765

(in the native case we may need to do something with the whitelist
too?)

Cheers,

Richard



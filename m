Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E42DF6C4FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 12:25:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m1so12169483wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 04:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fuPWcn1I9OlPV4XwIfSoY/c2JKvJSEb2RJqUk2G7s0A=;
	b=Fe/CMj1YaWw2f9Oi398tcduvkFovCb43rAoZElT9bTkN98A8+23Z42KOjrZUixzZuX
	SRKg9Xyvf5QkxchzfRoYmg9RQosi0HO5AEqO67KIBfeiPJePpwoTv0cJDjhnEqCS5fRy
	FHo16VKPPyg/eL+dLKgHxd7c56VbA+6ldg/l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fuPWcn1I9OlPV4XwIfSoY/c2JKvJSEb2RJqUk2G7s0A=;
	b=sLBdETDudnY8kiE03UYCD4M/QQ4mW7c97HOnmgl9lTyz3CqEykddr0XNPVmdrJVtlm
	O/db14YVl080ERs2s0cx967fQeb7vo1pDE4fBk8qR/RxuvpQHOInJ01R4a9ilFVbmWUE
	ah8+FBLnMynlRRctn/tLWuxPvpQrP/PcopJ9aMomPdb8Yw2J9yDXk0DaM22SqZNoUGnq
	KIUA6Mru4Y1NKPE84cPY8bjer3Ttye7CgO08NjSPJIq3vU3GTP0+28x8WycaBkavHK2M
	ITdNwZJUNpidYkszRrGF0PaHxfXbPQNWiXAqreX51suk3ZSk40fkHo7bEquKze0YWMmk
	MB+A==
X-Gm-Message-State: AA+aEWZvce2a0D4W6XdMeKfq2iOx3BlXaIsZ/2fQNNvzXj6ZZj1AWQ9s
	kxcF92SLh58AgBgM3OPnZ0pLNQ==
X-Google-Smtp-Source: AFSGD/U8w7BmdL/J+aAMkMKmznSIwPXczvocu+D6FubHXICbOk4FLMxxqkU+FSVQHe1Iq9iOQ4zC8w==
X-Received: by 2002:a1c:2408:: with SMTP id k8mr11013568wmk.110.1545049558394; 
	Mon, 17 Dec 2018 04:25:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x15sm116319wrs.27.2018.12.17.04.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 04:25:57 -0800 (PST)
Message-ID: <9df98081db6aa534145d8cf5e362a671a15da5cc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2018 12:25:56 +0000
In-Reply-To: <20181217055442.13735-2-raj.khem@gmail.com>
References: <20181217055442.13735-1-raj.khem@gmail.com>
	<20181217055442.13735-2-raj.khem@gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] libxcrypt: Upgrade to 4.4.1 release
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
X-List-Received-Date: Mon, 17 Dec 2018 12:25:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-12-16 at 21:54 -0800, Khem Raj wrote:
> License-Update: New files added to existing list
> 
> Add -Wno-error=missing-attributes to compiler flags, this helps in
> compiling with gcc 9.0, eventually, the code should be fixed
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libxcrypt/{libxcrypt_4.1.1.bb => libxcrypt_4.4.1.bb}   | 7 ++++-
> --
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/libxcrypt/{libxcrypt_4.1.1.bb =>
> libxcrypt_4.4.1.bb} (75%)

Fails on x32:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/102

Cheers,

Richard



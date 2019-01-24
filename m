Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB177C121
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 12:51:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r10so6314426wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 04:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=iCei2DXhAYkSg5FExmrsA4hHICHhaIekOG6TROuEWJs=;
	b=TU9W1ZuEeEpwucbqruX6vFyt3Xrt6nT3DM8TLDb8cm42NRB0ELPtgXvPkSKVrcrWug
	x/y1I6I7SBy44140X1qZFKWudND9I+5BXniOSgoyybml1qi/V8kWYr0RvX0vWsrln2hN
	+nt/gWC4Cuh/Ouw+gQJiMXJvb5E5khCRellys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=iCei2DXhAYkSg5FExmrsA4hHICHhaIekOG6TROuEWJs=;
	b=p5caq98ucs7W47mD3FAKHckstjcWTZbL8OXLRd5BvP0ybgbxCSPJKS9wEb/ImfrS0B
	0VH58imAHpoEzUH6icnPRMHgYqfqy33t1HiNKF1+YaUlYMLNAMJQ8iewHzBK3JPhxL+3
	WI1LR7zw2AyMLBVkNW/Y3H/GIP1Qe3Ri8foOkqeGjfKpbee3VzTZBKcn857jcL+U/yXJ
	Bpqf9bW4FqJy6EDGhjTPg3UOzBwSZl8g3huHwFCvZKt68WTYwuC1uYOVTfVsdsGkb290
	Mptp4PDQFCjE1GRLSY35g1w/XWKFtVe17YenmE4Ztw2v3yaAlPHADk4M8t3aMEzeHmTb
	ESVQ==
X-Gm-Message-State: AJcUukcd+zi2MWbabwCUEBWE/FZfOyPFdGbx/8f2wlH/MVNhg9ODKaJS
	eHEnHHmLJQf87haPKqsOjTV22g==
X-Google-Smtp-Source: ALg8bN4jVDycDrM7VZ8VDVB7xOSz0ofzo/so7UjcNheDH9Rqk3EV8GHYSVuH7SWMY/gM2zqC7PsQdg==
X-Received: by 2002:adf:81b6:: with SMTP id 51mr7477739wra.240.1548334269897; 
	Thu, 24 Jan 2019 04:51:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t12sm98974498wrr.65.2019.01.24.04.51.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 04:51:09 -0800 (PST)
Message-ID: <03cc0bf2cf2d942dcd7c05b89e039499dbe617b3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 12:51:04 +0000
In-Reply-To: <10d326febf6744315b0cb324b98b9f3bd9ea4056.1548313558.git.liezhi.yang@windriver.com>
References: <cover.1548313558.git.liezhi.yang@windriver.com>
	<10d326febf6744315b0cb324b98b9f3bd9ea4056.1548313558.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] native.bbclass: remove invalid CONFIG_SITE
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
X-List-Received-Date: Thu, 24 Jan 2019 12:51:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 15:06 +0800, Robert Yang wrote:
> This CONFIG_SITE has no effect since autotools.bbclass handles it.
> And the
> comment line is out of date, it was for "CONFIG_SITE = ''", so remove
> them.

Going from memory, we had a problem where the path to sed was being
encoded into scripts (e.g. libtool/autotools and others). It may be
/usr/bin/sed on some systems and /bin/sed on others.

Are you sure this is no longer a problem?

Cheers,

Richard

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/native.bbclass | 3 ---
>  meta/site/native            | 1 -
>  2 files changed, 4 deletions(-)
>  delete mode 100644 meta/site/native
> 
> diff --git a/meta/classes/native.bbclass
> b/meta/classes/native.bbclass
> index ddccfe2..c20c6dc 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -54,9 +54,6 @@ TOOLCHAIN_OPTIONS = ""
>  # Don't build ptest natively
>  PTEST_ENABLED = "0"
>  
> -# Don't use site files for native builds
> -export CONFIG_SITE = "${COREBASE}/meta/site/native"
> -
>  # set the compiler as well. It could have been set to something else
>  export CC = "${BUILD_CC}"
>  export CXX = "${BUILD_CXX}"
> diff --git a/meta/site/native b/meta/site/native
> deleted file mode 100644
> index 7dfb1cb..0000000
> --- a/meta/site/native
> +++ /dev/null
> @@ -1 +0,0 @@
> -ac_cv_path_SED=sed
> -- 
> 2.7.4
> 



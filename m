Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.976.1615568344241225739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QH/wIPct;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id g8so4215747wmd.4
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HswxFJTYA/QkivbNbXfH0sUGVLssSVwHDxWcZLHGQU4=;
        b=QH/wIPctJ7xtwgOR6EoK/uRIMdsbi9uVWk5e6Pd7I1JDMpcVQsTNKlOtRbun1bF0W2
         8/RBK9yXuUh11jD3vQehLXbcjNamBSxKnAFxVkPDS4H6hZ0jCJicZjVZiBh2C0Iy94NH
         IjIDOzAsfnNjcpOFdMeDbCYlRh181a01eJ/VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HswxFJTYA/QkivbNbXfH0sUGVLssSVwHDxWcZLHGQU4=;
        b=djuenxB05s02e5UnAPVldiLc3LklWbZLKjtlTr3dig7VYwCatY3K+qLU3ETjlKLDZ7
         ep9VtUh7n7fjzd1HM4v6zvLQzGwRI4FT4/8rFKL4Lqp8wcWwBcTqmHrJFFNV8ADTS03O
         krgVz0q0zf+rf+5oQbvzGkfD6/Dtn6lmKiUbJNbuh6bMk+vFU1kU5fJMPwQ8TJbM5nWf
         StIIRpW+aH6ei67djE6IzJo3kBtlrjf8EPw03qF1bax0lTTHQNwbxH03+2cRS4k5Lawn
         ca7j1Eqabl9m+EX3hP8eurpJqLNlqCgw0gm+O3CFgOkxORaLHTPcldbfKhkLMemjhU+0
         aiaw==
X-Gm-Message-State: AOAM531e0BSHHELHmh9jT7OurlgRYYjDrmWbPle4qJ37elrtC5J7oteQ
	UMrbCS/zu9a7Yn+PZ3yoJTJCBA==
X-Google-Smtp-Source: ABdhPJy+4TnUyvUUqhPDz+i/2mUI9+343TT8oGzrFwKrN7Yv6wIr/Seu8LkSlcm0yjC90bOVmeYVwg==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr14321818wmf.165.1615568342773;
        Fri, 12 Mar 2021 08:59:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7cc6:73c3:839f:86be? ([2001:8b0:aba:5f3c:7cc6:73c3:839f:86be])
        by smtp.gmail.com with ESMTPSA id u20sm9293280wru.6.2021.03.12.08.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:59:02 -0800 (PST)
Message-ID: <9e6ab3f507f8325cb41a6caff9c1dcaca8c9b23d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add handle_qa_error check
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Mar 2021 16:59:01 +0000
In-Reply-To: <CABcZAN=e_-OTy0x8jsiEb1-ysqfP6fqf27BoG9ZE63dzkGm_Ug@mail.gmail.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
	 <20210309233130.104839-3-idadelm@gmail.com>
	 <0e7e667066734d1c9276c1730742c659@XBOX03.axis.com>
	 <CABcZAN=e_-OTy0x8jsiEb1-ysqfP6fqf27BoG9ZE63dzkGm_Ug@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-03-12 at 09:54 -0700, Christopher Larson wrote:
> Indeed, bitbake only requires python 3.5.0 right now, we can't use
>  3.6 or 3.7 features in it or oe-core at this time.

We did increase the version requirement to 3.6:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c08279f9c3a0260f80fb0948520a24bf2fcdb422

at least in OE-Core.

Cheers,

Richard


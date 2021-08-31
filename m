Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.3127.1630401814695086121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 02:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=azGkyaWP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id u16so26585552wrn.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uRsYvFX9kndan73OoZPvElipfTnxbN64W/lajWk4ckg=;
        b=azGkyaWPJUMxbQXGlSvR0xawxaftnEj2P+lHErIG1fqi1vX0Xr8DYh+639rfKnnlh0
         WwUWl9cuojBa+vhCy6eJ35R78GVmMwXt2K4GpdERMRdLfa5BviAZmhrZDv2beDMR3hP4
         ojo6Qplb9+H75aY7WQ/lqj8Blp3Ch2JYgV4TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uRsYvFX9kndan73OoZPvElipfTnxbN64W/lajWk4ckg=;
        b=hzbnb+DuWmq6MnuNenL8I8laceZ0JyFEj0nmQfczXOz+RzZlG65jnyGCZwOpz2UvQp
         QZjsJLRTHpb0wBVsmNbta2MvIfREVl6rEGNN+ate8wjroliQ6/rkwdJDHcp6xIzXdCkF
         5z020CSStU+V0igXTUfW9XWIT8HZtyZ1EgYLSp1cfYDM+phdtr5DwxjiYI5/sMaPJET1
         TtafL+ibDxUeE7Ze9dNG6RKIx9KsFMLugrTJVY6RgxKDk2ZS6xZV2VpAgqVmNaOvw52o
         +l7cIO69UCqCAv7tXuxS5DImoE7Yj/Vszzg502Ga48YgHX7XnzkIDJQ04PCvRVek5mvz
         E47Q==
X-Gm-Message-State: AOAM532gf7oEPl+ZxGoWS2ZFGK2c9juiFAE5lulECq1QGmk+9hThTpjp
	ZWwun4xZu/iJFMk9tOv7XYoUPQ==
X-Google-Smtp-Source: ABdhPJwn/Elt6KmRyvo+CvAzb5S1/zLzy57xQDuRcgPyxPEaorv1AkDVjhIVrNc16Uuy2Y9U+VNKsg==
X-Received: by 2002:a05:6000:363:: with SMTP id f3mr12392339wrf.142.1630401812760;
        Tue, 31 Aug 2021 02:23:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id f20sm1975664wmb.32.2021.08.31.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 02:23:32 -0700 (PDT)
Message-ID: <6bb80d28a94f447ec4ecfaef4f04e818b0041835.camel@linuxfoundation.org>
Subject: Re: [OE-core] why "PREFERRED_PROVIDER_udev" and not "PREFERRED_PROVIDER_virtual/udev"?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Aug 2021 10:23:31 +0100
In-Reply-To: <a9a5b3df-5a2c-c7c-ba3e-9e4ed712cf67@crashcourse.ca>
References: <a9a5b3df-5a2c-c7c-ba3e-9e4ed712cf67@crashcourse.ca>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-08-30 at 03:52 -0400, Robert P. J. Day wrote:
>   i was going to extend section 3.3.17, "Using Virtual Providers",
> with an intro example using "udev" until i realized that that example
> doesn't use the "virtual/" notation. so ... why not? is there some
> distinction between other components that use the "virtual/" prefix,
> but a reason that one does not specify:
> 
>   PROVIDES = "virtual/udev"
> 
> rather than just:
> 
>   PROVIDES = "udev"
> 
> and then use the corresponding PREFERRED_PROVIDER_virtual/udev
> notation?

The "virtual/" namespace is just a way of namespacing some key dependencies
outside of the direct recipe namespace. 

virtual/libc is a better example and there are a few toolchain related ones.
There are several different libc implementations and virtual/libc just says you
want one without being specific.

Cheers,

Richard


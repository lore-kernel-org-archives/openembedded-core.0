Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.16238.1594908330499279732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 07:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WKujmH8f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k6so7225703wrn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jxb89Eo6hbmSmbPyfkLL4TDrFepGrhjnueq2hCE0SYc=;
        b=WKujmH8fH/zNF2/++STgKk4YZ9GadicQ/YDXWgxf9wZE7pvT8e9VbxIaKKL2hDKn2+
         gO9vIxQbYJJiIchcxxIWqhgUGATiIu+hG+HqOch+eqvqiJRTKAkt/JQ0bLb80T4HRFab
         S+Ko86wYS6S7NE5mE/rNEubryKNfJ3KOLakjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jxb89Eo6hbmSmbPyfkLL4TDrFepGrhjnueq2hCE0SYc=;
        b=qdLRpnqy/pzgKi8X0yiVpcVd01pfxolT4miwldyRVsi7tpRkmturbxRySl/YNaUQ7A
         0XheIQAKX2EFAV0rPmgaPSyJf1Kh1wwW69FXXO6fw11q0bwIN0jFhZQqCXYslCQ0RVvI
         Iq70TJaQKKgvAFX4WlZ58nZo/uh+TNXftHxmkRWh5Ipb6B4ekCSu/Zq3nQ43BJRsuMwU
         Md/N50LP9G5DdBgrxR7qEbsNvd01ACX5MvPTlCOuyt7TJaC50sA8+g1hFkVWS3uLjnJu
         H+Lv58+bZYo/YD35faQhkDkUDZJfWQHEytSqQAYHqkqv64Bqsbz0HzTn5kRZ8hWDyC4u
         9Slg==
X-Gm-Message-State: AOAM5303emdsJgTfvW1/tbTvEfWWCUICZtJgN/5LqLHMeV6BI83s2TRS
	AJqIFAKuqf3ePAdQ3Ctaa8Xi1g==
X-Google-Smtp-Source: ABdhPJzF7AI2jno+9KKfMM4xu7q4H2MbqNjySxeInixVBzlMyPQJe1kl5RfW95XfIhnBKa8GtQG8kw==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr5586897wrv.394.1594908329053;
        Thu, 16 Jul 2020 07:05:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.5.e.d.0.0.8.7.7.9.2.b.d.5.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.5.e.d.0.0.8.7.7.9.2.b.d.5.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d55d:b297:7800:de5e])
        by smtp.gmail.com with ESMTPSA id u23sm9916484wru.94.2020.07.16.07.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:05:28 -0700 (PDT)
Message-ID: <a5a2f620b4203f3c4584c7d686f4991ed5e3464c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] openssl: openssl-bin requires openssl-conf to run
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2020 15:05:27 +0100
In-Reply-To: <3541ef9cd5a1ebdfa20e9bfe1b1dacf4589bf2fd.1594897729.git.liezhi.yang@windriver.com>
References: <cover.1594897729.git.liezhi.yang@windriver.com>
	 <3541ef9cd5a1ebdfa20e9bfe1b1dacf4589bf2fd.1594897729.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-16 at 04:09 -0700, Robert Yang wrote:
> Fixed:
> $ dnf install openssl-bin
> $ openssl req -new -x509 -keyout lighttpd.pem -out lighttpd.pem -days
> 365 -nodes -batch
> Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or
> directory
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> index 47ed6b7640..815955837b 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> @@ -204,6 +204,8 @@ CONFFILES_openssl-conf =
> "${sysconfdir}/ssl/openssl.cnf"
>  RRECOMMENDS_libcrypto += "openssl-conf"
>  RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
>  
> +RDEPENDS_${PN}-bin += "openssl-conf"
> +
>  BBCLASSEXTEND = "native nativesdk"

Wasn't this addressed by:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cd80b0e52ee2e008672ce910856f63176bc00480

?

Cheers,

Richard


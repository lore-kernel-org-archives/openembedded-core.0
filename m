Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DFFDA751D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 23:24:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f8so345855wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 16:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=wrDSuWD9qfUiRy6O8ylNMIVfJG/XB63PYbqMMqVnz3g=;
	b=TtCmqxtsPlTQRnTT9xWe0FsRJ8G7z1fDG0l4qXGBlCydY3Y6LoCwNnt7G11YxfaaUR
	VJ/6LwVJc5mI5gYL9beQmlwJpfURmcuP0uTTbXbsVMSmeXTVZ82J7+h7HNjD/Zd78q1L
	GFsbPtHipqlVm7vhTujfinpcgrE0oPmhXSS00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wrDSuWD9qfUiRy6O8ylNMIVfJG/XB63PYbqMMqVnz3g=;
	b=fkKz2phmvGh5IlvdPY6ryHsRZ4ijDSykFS5q8VC6eGunqwNIwH4drgM7rAgxSCnKnH
	h58hOGj8tBsNz46x3TeyHtzUyq3StQMGw1WzHse88rVaQiu8K8Jvy9XYMfg5QPFOKMip
	XgjqgZp1nj7Ela+hRZA7pZuwY+kw+ZzxHi203MS7aqRHoLjIVzxwYXYlE0jf2mLFWCTR
	vF0ObgMNfHf+3Fh2EReQjPzamS3n+jILVEZp3pIJcSh2QEXIVcBvdHKHqbcQiQzJCTIL
	K2H6qSakkN6NkMigMD5SOVt6mks8xswTLlPDT5j3sgy9gJwgCTy8DoQa7NzHAUfhC1dY
	KQWg==
X-Gm-Message-State: APjAAAVoiF1dfhFMQy8OmvMMqP6o0lnFHtjPK2pxQu+AECYz8gBzaaqG
	eBZX4lSPh4IBT4wjmnHlpOBlnGwQRas=
X-Google-Smtp-Source: APXvYqyv+JRaxwaFF/vyjqAXbg518HFRBDmbeXi4WsiHWXGP38d6vi5lulGI6tRbnGdKjI/AcscIqg==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr54183649wrt.217.1559085860539; 
	Tue, 28 May 2019 16:24:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q9sm2783084wmq.9.2019.05.28.16.24.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 16:24:19 -0700 (PDT)
Message-ID: <efd8fab5c30823179cc418a855c6e660c0a534d3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.ro>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 00:24:18 +0100
In-Reply-To: <20190528143030.2205-1-andrei@gherzan.ro>
References: <20190528143030.2205-1-andrei@gherzan.ro>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Tue, 28 May 2019 23:24:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-28 at 15:30 +0100, Andrei Gherzan wrote:
> Since yocto thud, and more specifically since poky switched to
> openssl 1.1 line, the openssl binary is provided by 'openssl-bin'.
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../recipes-support/ca-certificates/ca-certificates_20190110.bb | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb
> index 4c0425302f..bc69c55daa 100644
> --- a/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb
> +++ b/meta/recipes-support/ca-certificates/ca-
> certificates_20190110.bb
> @@ -82,6 +82,6 @@ do_install_append_class-native () {
>      SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-
> certificates
>  }
>  
> -RDEPENDS_${PN} += "openssl"
> +RDEPENDS_${PN} += "openssl-bin"

Doesn't work for ca-certificates-native:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/638
[amongst many other failures]


Cheers,

Richard



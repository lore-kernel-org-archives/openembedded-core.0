Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 34A0C7D900
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 08:35:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n25so19180537wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=QXUkNSLNJvcOmriLAjatEtqSs8b8AQ/+CQvINdzpI4c=;
	b=Wd3mp7aOBaVw+G46r7c5cEJtEKZ4EfArjnX2iLgob7Fubyf84PngQMcEmBH/LgbL/o
	JI6Z3IHaL/d1jRIL+VZTEkKEi7d3l175aXgHqGwubhxQLCN67KQ8porck8mMuvXwJPO+
	bRmuIkok1+G8EGvshbZooiEHfialttcrJ2l4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QXUkNSLNJvcOmriLAjatEtqSs8b8AQ/+CQvINdzpI4c=;
	b=KdR7fnXEtCcrwzMWTWzfLIfIWN22CXMwFVEAFoq/xGrLU7q7f2ZnCLuoSogQU0wG2z
	RIhD7Pk9Oz5MlVenDjqZx5M6Td/JQKV/F2N/unzbhrDueYIL+mhWjncEsykptMJA0IIn
	Q+8yJRFLjKYsQaDIBgxlnnrYXi56NnAxsRuZfPim3MUgzHagKkcomw5a1DZSKcNR97dm
	eJGgOREyFnNw/Mbua0H2xQ62v2fth7JHZ0SyC58EAhe7aLXk9DA9ww/z2XtxGjG/mYh1
	mMzwTruLtejfZD2l+bDboFZ9gh+9OPlAkdAbil/N7B/e6iRp5pltvrtwnu0DNFSx1ld7
	D7CA==
X-Gm-Message-State: APjAAAWxVFgWCUAmgIDKGnTYkvruCaXXhZDPya03JpIKf6DyjNY42J8E
	IeE+bd6GEGvF8OADyC4StgFslw==
X-Google-Smtp-Source: APXvYqx2yDv8R6MtfNxYFQyoK742w+tKQiIpoeaxG8ZjBjzbn5nA0/2/l3YBKcGBWuMUeyNtQW1w+g==
X-Received: by 2002:a1c:804c:: with SMTP id b73mr20166418wmd.116.1555317314929;
	Mon, 15 Apr 2019 01:35:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w2sm37485886wrm.74.2019.04.15.01.35.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 01:35:14 -0700 (PDT)
Message-ID: <97ab05f9b4560c85e7386210318fe98b1d5121af.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 09:35:13 +0100
In-Reply-To: <1555317167-20284-1-git-send-email-yi.zhao@windriver.com>
References: <1555317167-20284-1-git-send-email-yi.zhao@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] libyaml: update SRC_URI[md5sum] and SRC_URI[sha256sum]
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
X-List-Received-Date: Mon, 15 Apr 2019 08:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 16:32 +0800, Yi Zhao wrote:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-support/libyaml/libyaml_0.2.2.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> index d2b39f3..fbd1992 100644
> --- a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> +++ b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
> @@ -8,8 +8,10 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
>  
>  SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
> -SRC_URI[md5sum] = "2ad4119a57f94739cc39a1b482c81264"
> -SRC_URI[sha256sum] =
> "46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe"
> +SRC_URI[md5sum] = "54bf11ccb8bc488b5b3bec931f5b70dc"
> +SRC_URI[sha256sum] =
> "4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9"
> +
> +S = "${WORKDIR}/yaml-${PV}"

Why?

Did upstream change the tarball?

Cheers,

Richard



Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0A77ECB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 02:58:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r5so1122533qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LLunV3LpgoVqKXO4Ua2RPUH2cyF+8BeLxQuTc55Ephg=;
	b=gd8vzDbHnVoJcdgK2Wm2N/0tH5Gstqdz+JNiD0EjBwCFUKnZKFmQg0lJMbArVP7/cF
	CHDA/88+35jolYFhwYySxcyQGEa1GnWNnNs5WMWaf9kFItiMDVUV5JCsAIpcHbNcVHl6
	GyM5a+j4/q8opvoa5DNg/MYJV0chsVGawRckRuwP+b55QEXucycdMfegO0jqwt9dYi7S
	NPP52d6hEtjmIEO6KOcw3SWqrfh1BYAve+fyn+/dIBhwL6y5+LH1OBOLjwIkTTF9Xh5h
	zVSJQj7PQxLpjz2mV+ZbYHQDZy6s7cTP4ZVAxjcnSmWutVCWo5HrDHDRs0R6hS3gGCsB
	ZKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LLunV3LpgoVqKXO4Ua2RPUH2cyF+8BeLxQuTc55Ephg=;
	b=k5XwYkxEHr/3u4Eb6NHJhSf63ygqi0Kn0mx5NRgZJ55JzJt9WgzPlLp9WbB1rqDxMy
	dNG3tzmqFsF5kWP+M3+nyrB0UUvVfeTV80wXtfp8+DYWIKNhcriMl9dRaSnGoeVeI+kV
	vMz62NRLWQGHCGCi9mWimK4ChWoc6Ig1q1GWWlQ4cQqvYDFuFmBpzv5Ap906kXlB9wDo
	hd+dz/bB1x45/X7P1ATtw9jzWl6eTYcUj2BHXFSycbe2ruoYeWhp7+0IacLOKaf0kDfU
	gjkTB5Q5Y2SREKDhZa8slW86TgXrlMBlwDjRHfj1Q/5opQ1RZXrJdysvG0CcwhdoVLaJ
	Y4JQ==
X-Gm-Message-State: APjAAAXf/M010kC8ZdwvIU8XF2g1HOqihD/3BaN49rh91BPdcY8xI07L
	YO6llAs4P+G8nFOMBy3Z6gWgmUY+UcNSYf5mSbQ=
X-Google-Smtp-Source: APXvYqxxG0GbtdfnsJKAhqB/b8kmvyo/BTTjrWuMiJGD/XR0375AHjFHmEImQggZmxtYILyI2M43aXMYturIpuzKy6g=
X-Received: by 2002:ac8:e09:: with SMTP id a9mr1775542qti.88.1569466684172;
	Wed, 25 Sep 2019 19:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569466181.git.liezhi.yang@windriver.com>
	<e32ddb5983f3ac13e58fb60425bafbb711721151.1569466181.git.liezhi.yang@windriver.com>
In-Reply-To: <e32ddb5983f3ac13e58fb60425bafbb711721151.1569466181.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2019 19:57:36 -0700
Message-ID: <CAMKF1sq9Yc4=_R2EkvUw4+m--YxgGViStkg9RU_mXXqH7SwBYA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] apr: Fix configure error for nativesdk
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
X-List-Received-Date: Thu, 26 Sep 2019 02:58:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 7:52 PM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Fixed:
> $ bitbake nativesdk-apr
> buildconf: libtool not found.
>            You need libtool version 1.4 or newer installed
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-support/apr/apr_1.7.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
> index 09a65bf..a9d98be 100644
> --- a/meta/recipes-support/apr/apr_1.7.0.bb
> +++ b/meta/recipes-support/apr/apr_1.7.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Apache Portable Runtime (APR) library"
>  HOMEPAGE = "http://apr.apache.org/"
>  SECTION = "libs"
> -DEPENDS = "util-linux"
> +DEPENDS = "util-linux libtool"

hmmm packages usually need libtoolize so please check if thats the
case or maybe patch apr to
do so., thereafter you can just DEPEND on libtool-cross

>
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


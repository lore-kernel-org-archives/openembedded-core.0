Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id B1CF17ECAA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 19:18:46 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id c21so1799161qtj.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vMllXIJlruQkMjVYiqUXmc+hYB3JDkTTP8RovI3gkhA=;
	b=ZQhwzdvQbpCSsSezuVv468ZMp7sHIXFI/RvLQGpk8DMYMTilp6dNdXQSQ3PbFc02xf
	uMCn1TzD4oeLMicXCtJLpC1Qd1CEuVQdmv4QqzfoUOVUkA75M2Pf1zqAlRDZZ4AMqhKi
	+OyqwRcjnK/HSm2RExX+dN0OPUSYaN9ik1bNQksdsz6ikK3s2DC8AvUBLdrBkSZt8a2k
	n0+TLMUUDM2t1/VXg3ZzfQvLJmYKGJBYvfYIW1Wn3skXlX46kMQon4iSmPy1+HCLLhBd
	07A+JhAbGu5J1gpltveLTolMBojskjTCtVk/316ARGoicUkjYdsOZX+Xoyy9O7Hl9iwG
	5/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vMllXIJlruQkMjVYiqUXmc+hYB3JDkTTP8RovI3gkhA=;
	b=Baq9YQSz4/8UNTVZMRVgyFziMjhKX18I/QX8MeyT2grMctpnbIvgP1hQzbeYwhvI6v
	Vhv9B4VkL3sU4F4x48jwM5T+jsYt/V17tY4ZyM88AnU4XUBgWP3PMO6jxzlfpwVLkwvV
	F3IYKv43KSiu4RYq9HNlF4t7hEsCNsNVJlT//e6VdL3r/3AC4vcbTegl+JaM9M+yIXg6
	bMYtC+FX8XmsF8Rubi1nyCSr9xv+6UUtWRrrT6dkwC83IFbIBtvIKVsoTyuBkCACp19U
	Qf9IrMHhz/dnNfx333LAZj+AuVijX7+iVMjM5m5A+RKiMq60dCpAok7nQ+ThO0oIxIQx
	5oZw==
X-Gm-Message-State: APjAAAV5ug35h7RMeBPvPOOQGqIEIl3KAq0/dVzSBQluI1Zb/YtnRtM5
	Dj5BA7e2BZsGmQLfVT1NuIUZw+bpQL0gZlvcu3xjx161
X-Google-Smtp-Source: APXvYqyYqVRjUyx269Rligk4XnZMcnLsTLS4/mGVsgDgAfZHRRBdGdX89gnliPzkSXY00qNUqLgP/42zT+FQjTaeBns=
X-Received: by 2002:ac8:1103:: with SMTP id c3mr13958734qtj.88.1568575127344; 
	Sun, 15 Sep 2019 12:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190913191558.31450-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190913191558.31450-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Sep 2019 12:18:21 -0700
Message-ID: <CAMKF1srfspo_yqpaZDuB183C5pqT40g7Zr6Sh9eHHH6=VZPXDg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH]] curl: update to 7.66.0
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
X-List-Received-Date: Sun, 15 Sep 2019 19:18:46 -0000
Content-Type: text/plain; charset="UTF-8"

I think double ]] will leave a ] in commit message. Please resend with
this addressed

On Fri, Sep 13, 2019 at 12:16 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.65.3.bb => curl_7.66.0.bb} (95%)
>
> diff --git a/meta/recipes-support/curl/curl_7.65.3.bb b/meta/recipes-support/curl/curl_7.66.0.bb
> similarity index 95%
> rename from meta/recipes-support/curl/curl_7.65.3.bb
> rename to meta/recipes-support/curl/curl_7.66.0.bb
> index 96f90fb8ba..d1975f2460 100644
> --- a/meta/recipes-support/curl/curl_7.65.3.bb
> +++ b/meta/recipes-support/curl/curl_7.66.0.bb
> @@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://0001-replace-krb5-config-with-pkg-config.patch \
>  "
>
> -SRC_URI[md5sum] = "bdd220d018c23e7f9ee82894e62a70bc"
> -SRC_URI[sha256sum] = "0a855e83be482d7bc9ea00e05bdb1551a44966076762f9650959179c89fce509"
> +SRC_URI[md5sum] = "c238aa394e3aa47ca4fcb0491774149f"
> +SRC_URI[sha256sum] = "6618234e0235c420a21f4cb4c2dd0badde76e6139668739085a70c4e2fe7a141"
>
>  CVE_PRODUCT = "curl libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


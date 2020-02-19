Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF95615D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 22:05:30 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id m4so1358830vsa.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 14:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uFGQ1iQU1ZO2U9c/GfKsr3t/l6kqMhTeW3fEe/vAaew=;
	b=uChFWUKFvs6h3hzdyGdwouAwDH1prYZdY6Bhl9oDsKf1K4Glid3nzYKg1qHNVCpc+J
	L8CWdZJf8B+BUJf0UVD4AY6cXk7Ma7DUKN+0ktohQqKEf6ZPZBhBA4pPWDYjEuHAnF4O
	00M+toxBuRujYc+WjwTMpNC1hPC8GTC8PR7SZMc1pIXB0t/tBIgKfyS+sNL+o3uEgbuG
	ake46r71G6JmvOjJV/AGa/BA3lFhAobsLOY/aTbFdMACxS82JCV6PtrBCmlo72p//apJ
	KqZlQdkYhhsZUPdI0KD/w0SWKhPdBB2dlI4mz8HtJZlPHMKIav7GaTJeSohqtc7+Ma99
	btzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uFGQ1iQU1ZO2U9c/GfKsr3t/l6kqMhTeW3fEe/vAaew=;
	b=jTyY2cpKBW2Bx8J6T26Jk8hMZJNSDMlchoVRovNUCPwua7tHGHcyQb3k881Q1mt0Sd
	PbQGFt20ZVEiLWA9O7x+s7IwATrlUtgwLSlcMSWzMH2jJh5nd//ZLtFlk6eafhHQ2nVI
	zsfVBHmYH7/Ka7zYakmaE3SHSccBr3apU7hcsnLdqNVR+sOSRVZkA7mIQ+cHzzFXm1Tv
	ipa+xPBYeL4EG7xruOrpJir0vROQf3BjCWPqOS5xOGaoyy04BgEZiIKoXDBDQ3/D7pbU
	B1OTqfaf5G4lxj3Me/WZyezOr8CqqRktFh63aGKS+2wZqQd1iMle8j682noocbh9N6t/
	hJGA==
X-Gm-Message-State: APjAAAWpGVOg6reP48HMs1rptxd9JTfvmav/avsfvW9lkL9Vse8ecdZv
	WPWpO5j+/2kdiH6kq6XIW3vyLnIfvV5DXFuH2Ts=
X-Google-Smtp-Source: APXvYqyPJ+PUrFBxXf03hrV7ZHkkXrvBz6LMhwdBTxBNKOt2kn2cC5/JWjfadMa78fokHiDVZh6123MnxcUcwfokb6Q=
X-Received: by 2002:a05:6102:a10:: with SMTP id
	t16mr15788831vsa.130.1582149930894; 
	Wed, 19 Feb 2020 14:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20200219214303.138067-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200219214303.138067-1-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 19 Feb 2020 14:05:19 -0800
Message-ID: <CAJ86T=VsVpM+KLzXdQ569T4LALG4fDT2sS4v+4YCp_6LTZvfsw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample.extended: Document how to limit parallel fetch tasks
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
X-List-Received-Date: Wed, 19 Feb 2020 22:05:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 1:43 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> [YOCTO #13235]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/local.conf.sample.extended | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> index fcf4a9b7c1a..443b4e83f9a 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -23,6 +23,14 @@
>  #
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example.
> +#
> +# Some users are behind firewalls or use servers where the number of parallel connections
> +# is limited. In such cases you can limit the number of fetch tasks which run in parallel by
> +# setting the option below, in this case limiting to a maximum of 4 fetch tasks in parallel:
> +#
> +#do_fetch[number_threads] = "4"

How does this interact with BB_NUMBER_THREADS? If, for example, both
are set to 4 does it mean there could be 4 fetch threads and 4 compile
threads running in parallel?

A related issue when the number of parallel connections is limited is
parsing a large number of AUTOREV recipes. From what I remember the
workaround for that was to set BB_NUMBER_PARSE_THREADS. Maybe that
should be documented in local.conf.sample.extended too? Perhaps even
better would be to define a single new variable which limits the
number of parallel connections in both cases?

> +#
> +
>
>  #DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
>
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id BAF3B78834
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 13:39:49 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h92so15390504lfi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 05:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Czh4ucY61dVaoC1OL9WIerY9zBT+o9SwHUSvvkoMyhc=;
	b=Rlq7pZWAowYvDpi2NpHkJfDSf86EYckcpeGMqDYmU8oIGHc6K+vFjyCR5+3AlIOMtz
	TE5TVKS0HgMc4w/mbVF4vm4KXZWhhr1fiYc+wWc6Y5iU5kqfWY00qEoJUpZVb+9GJrwc
	IjUYLHCOEiSQCRVX8clvv12+j6T/hsl2VSK//Xzlm0qJsRO/sWa4SVDLtu1arV1LTuUt
	2cPBoefKFF+i5RqpJCtMGBdBubs0iXaq1KAdMqfqBjMuzBC94Ib6hEi3ZNe23SnqEF+p
	av7/5ltpXrkDHHwKK4bVz1SnAwuf/z1iD4XZsNKvr9PWTEeJp9jvMe6r+ODyTlCAVsnF
	5LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Czh4ucY61dVaoC1OL9WIerY9zBT+o9SwHUSvvkoMyhc=;
	b=JyRV6xlzKN4P+ulDYI/9fWPdXVhrFU2zaB3LfiZDvLhF9e41Hzm1HSKo0DHlQNot2d
	IwLNGT/sh+uAjkZSligrLInzUhEpBzHlgCDkPCJGbKfaNXqUWrt/JlWj+9LDfDiwrYD4
	suPb4XzlDcNFoblQ2XUC51A+IjjC6s7FkMMbl1nJw1s0mz2reNJXO9msEfX76lhQS9sl
	yTzbNHNOaWN8bEGKu9ZVyZCkDboJ1ElLqveLTjVZkEh5Cl7w9Ja7L7QCZD1OUYYD8FWu
	oMFP3HtOgqeZFCeyeUvWvwkuF7ZrUzo5lMe8fHA/IU/7z2iiDOaUail8fdbv5xDLwxDc
	2FLQ==
X-Gm-Message-State: AKwxyteiyIhUBpMfYo+zjCwdlcNPnM1sixDq/YWyqRq4u+ZKdnkQ6mnf
	L6OhJQ4aKAa8uUjajsi24VtihYENoi5G9KHmXniisw==
X-Google-Smtp-Source: AH8x226HkV5J0dgahOuTdzTZHPO69g/mays47uJjRb17k6zD5RhxmEokk8dDwWVi4rzBD/LVoQQ0jGnkW5iYZHdLbEM=
X-Received: by 10.25.143.12 with SMTP id r12mr17586169lfd.30.1517319590036;
	Tue, 30 Jan 2018 05:39:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Tue, 30 Jan 2018 05:39:49 -0800 (PST)
In-Reply-To: <1516957210-15531-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1516957210-15531-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Jan 2018 08:39:49 -0500
Message-ID: <CADkTA4NOFuhCM0vnPQFbtQK4OGPidHhH1GtJC6HBiKfw15SbbA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: 4.12 -> 4.14.13
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
X-List-Received-Date: Tue, 30 Jan 2018 13:39:50 -0000
Content-Type: text/plain; charset="UTF-8"

Please cc'd me on any libc-headers upgrades.

I bring this up to new versions as we do new linux-yocto reference kernels
and this has messed up my queue with respect to 4.15 which arrives shortly.

Also, there's zero commit log as to *why* these are being updated.

Bruce

On Fri, Jan 26, 2018 at 4:00 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade linux-libc-headers from 4.12 to 4.14.13.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../{linux-libc-headers_4.12.bb => linux-libc-headers_4.14.13.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.12.bb => linux-libc-headers_4.14.13.bb} (71%)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
> similarity index 71%
> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
> index f0d0abf..455ad4b 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
> @@ -7,5 +7,5 @@ SRC_URI_append_libc-musl = "\
>      file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
>     "
>
> -SRC_URI[md5sum] = "fc454157e2d024d401a60905d6481c6b"
> -SRC_URI[sha256sum] = "a45c3becd4d08ce411c14628a949d08e2433d8cdeca92036c7013980e93858ab"
> +SRC_URI[md5sum] = "4e8bb562f8fd33d5ef1feb0435ed2b02"
> +SRC_URI[sha256sum] = "4ab46d1b5a0f8ef83b80760f89ae4f5c88431b19b3cf79ffa0c66d6b33e45772"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


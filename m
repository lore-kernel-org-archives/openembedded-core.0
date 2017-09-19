Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA28781EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 00:17:56 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e69so805236pfg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 17:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GS+7KDl2/SVZibr6elMBBPlNA81wa4h4zZ7YOLoJwes=;
	b=MIBJWqSbzJ5ysE2UgzSDu5XEqdPPqNxTqvc9cmHAhX5simhFqRwmZKzAAy11njxsR/
	6WA1gS0CCWwhaLa9b8/u98I36lNERxiEz/wPC8e0KylEVURa7FArJ7HY5duC5t5VGYwg
	4qA5Y+8mWca+o3Swun6qr/G1KogfqlRF4gaaA16fN8QQvT3rsCfvOSjXO6f6Alt5maQD
	UAPIN+5u6PyjZa9oCrflYXzyu72pOOT0W0++KtWpJCWrr48ekxySdbjzJpKPMLDav0Rn
	HGPd8jTfkFVDhs/XpYXGgSSjmIDQEkbZBAZhhQ9jEZTMvqvubHGLwVmSgPjVbg0zwqc2
	3W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GS+7KDl2/SVZibr6elMBBPlNA81wa4h4zZ7YOLoJwes=;
	b=oJbCOKo7KiKCbawRZqrf1ldfg+RPPMIdnHoWUwYIqpVCWMqnb7C27TxD9X9z1J7s0z
	439JmNDstAWqYAHrDcI5/LJ85jwX+5Qwt9/bOvAQO76tj0NXQrbeEg7tfuWV32CS5Ihe
	TQi+IG84uQu1zmu9v4IGmuRxdqQ23bUW3ZcnDb9+IqtCFFIKobj9OnS/0wwed5rsw4ZN
	RB3PCHGOp7guO1Nvk6mCJkDZeoGwxvBvk16YmDe+OnfeJJyAzbThpvQd6PN8GnxyMywm
	tHB5EusAtlO/Eh6QvXKwXsgaeeKeGY8n0IpYwsRuwOX8RaS7VELFjmYcCIO4MxwMKMw3
	3OBQ==
X-Gm-Message-State: AHPjjUh6YKPTzTB7UVnTWNNw7fD0izdZccd+f22KrScEqWjLHpxR3A4H
	PfrRSCSBMbqqLDtOn50g2bRry35ZSvgxqoHEOPU=
X-Google-Smtp-Source: AOwi7QBxNMnP61j4xi7T7/Beo3kD8M6iDcIo8gryxOL9BlgaP1ZOZSKHPKl7tfxfc0iCQODuXYrbHHF7KGyU8d4K9fc=
X-Received: by 10.84.240.137 with SMTP id z9mr317128plk.114.1505780277479;
	Mon, 18 Sep 2017 17:17:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Mon, 18 Sep 2017 17:17:26 -0700 (PDT)
In-Reply-To: <1502788783-997-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1502788783-997-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Sep 2017 17:17:26 -0700
Message-ID: <CAMKF1sqDEtoaXHwz3=O-i8N5=4Fv4SC1Kqw-gZp5vbcayjU88g@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nspr: 4.14 -> 4.16
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
X-List-Received-Date: Tue, 19 Sep 2017 00:17:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 15, 2017 at 2:19 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade nspr from 4.14 to 4.16
>

This breaks build with musl. You can reproduce it with
TCLIBC=musl MACHINE=qemumips bitbake nspr

> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/nspr/{nspr_4.14.bb => nspr_4.16.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/nspr/{nspr_4.14.bb => nspr_4.16.bb} (96%)
>
> diff --git a/meta/recipes-support/nspr/nspr_4.14.bb b/meta/recipes-support/nspr/nspr_4.16.bb
> similarity index 96%
> rename from meta/recipes-support/nspr/nspr_4.14.bb
> rename to meta/recipes-support/nspr/nspr_4.16.bb
> index b0892a1..a634afb 100644
> --- a/meta/recipes-support/nspr/nspr_4.14.bb
> +++ b/meta/recipes-support/nspr/nspr_4.16.bb
> @@ -22,8 +22,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
>  UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
>  UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
>
> -SRC_URI[md5sum] = "743f6b7888a614da9927400874054d8c"
> -SRC_URI[sha256sum] = "64fc18826257403a9132240aa3c45193d577a84b08e96f7e7770a97c074d17d5"
> +SRC_URI[md5sum] = "42fd8963a4b394f62d43ba604f03fab7"
> +SRC_URI[sha256sum] = "9b3102d97665504aeee73363c11a21c062ad67a2522242368b7f019f96a53cd1"
>
>  CVE_PRODUCT = "netscape_portable_runtime"
>
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


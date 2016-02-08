Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id AD5FF731FE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:48:54 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id s68so62562281qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k1vvecD4Xl8pLRQ6OgG6EvWAxvoJ2ZiQmJ5r6wonBO8=;
	b=v2lKoqSggncgOLSyjt8Xs59Q1Uz2B6HJxqcX26QXxzIDCDgyJgT9eipzTDQLlhM4Bq
	h+krUZyyj+9GAbFyRAAizaw8KTTKU9NMW6QoRC4+KYhDjgsdJw2i0fqjfATrX/e1ISRm
	An2gbkzHX58fhSzuAuytpt43hg+a8qGOY+PMenh+dHhxncDOHfiqf35hp1QwZIaekSTc
	TIJmY0xh/0Gybl/Ka0evfxbIUbp6D1vQwAGLhBzM7hu8PRd/MmSwcRU/ci0L2JfyrpvU
	dL9Hkh26R5ydG6PZhbbvsSyPl/kKjdAA0DqhtIXI/5QmTUmKhJ+A5qAvf5xCxXDZTALr
	40xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k1vvecD4Xl8pLRQ6OgG6EvWAxvoJ2ZiQmJ5r6wonBO8=;
	b=AlQa3vw2lGaEdZOWGqoMUlppmtmsXY7pX/zX0XqgEclI9b4OtJDK7B+YRbEiOGjLY9
	JWkUlXmO0R1OjBZxeZ7R1BpEoDu9vg5CNbavwXiv5+PYedoL4usIFZWl9OgXUqcYFAn7
	yiCFb316y8EvCvWb0ESk2Dr9xajGpIZ6zt8KROyqTZpOVgleaO0Fz8tlBqEx+U570axf
	atpNFJweGzljxw24TdiB15O7EPFf6r8x/1JlSoSiMNgPup/j5eUGK2aZuBpLB4/8IXLb
	BqL5QRWrcVz+EZEcMMr/otuOIcDQw857+13Ac6WC4f7uPIk088Og3domeQbqvexBOyi2
	vjbA==
X-Gm-Message-State: AG10YOQtrtFdIiXukFBEwywRf/mHwJfmA5l59ZBrORBv+SUudMRI9T0soc5o2pmcJxJOogPZYfe0u8I+YMJisw==
X-Received: by 10.55.78.70 with SMTP id c67mr36120153qkb.37.1454960934737;
	Mon, 08 Feb 2016 11:48:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 8 Feb 2016 11:48:25 -0800 (PST)
In-Reply-To: <1454960141-18350-3-git-send-email-armccurdy@gmail.com>
References: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
	<1454960141-18350-3-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Feb 2016 11:48:25 -0800
Message-ID: <CAMKF1spGGbVK9KM+9=eRd5-wyND94W+VXG6Kubf4VqSsqomDZw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gdb: drop unnecessary CC_FOR_BUILD etc exports
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
X-List-Received-Date: Mon, 08 Feb 2016 19:48:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 11:35 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> These exports are all provided by autotool.bbclass
>
>   http://git.openembedded.org/openembedded-core/commit/?id=edf30561184ec42e5692a55fdf93304fac0fdb1b
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 6baeb0b..06272a9 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -22,16 +22,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                 file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
>                 file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
>                 file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
> +
>  inherit autotools texinfo
>
>  SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
>            "
> -export CC_FOR_BUILD = "${BUILD_CC}"
> -export CXX_FOR_BUILD = "${BUILD_CXX}"
> -export CPP_FOR_BUILD = "${BUILD_CPP}"
> -export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
> -export CXXFLAGS_FOR_BUILD = "${BUILD_CXXFLAGS}"
> -export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
>

you should build all flavours of gdb recipes for one architectures
including mutlilib combination to test this out.

>  B = "${WORKDIR}/build-${TARGET_SYS}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


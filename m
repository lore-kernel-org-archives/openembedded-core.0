Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 433BB6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 13:50:08 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so12613307pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L+N4ufNkf2h4N5wvERKCIiu5P+LOS2ShzoNQL6jAv+E=;
	b=njHdXUv/r6/pU4ncIzEakr+DHhrnvibSfRR83wjetJtXn4YjAPFbL27U4T8vdWbh8b
	gzEDQnfX1p7m8bwIan71gPPTCrNxxcT4w7uUaHo8xV+WJB7I33P7jcjE4tZxDk5kDqE+
	2hE563KM0GTTCsxAQFrjwdFWlSAA9kM7m9BavjakPun6vp7tC7V9WBzwDdbgRxNxawR0
	VD1yYAAzRSuliOmVBKjzQQunE8JH7ChW/EEm3AuGN4NZMULym9v2HSqsgaaRQ4UmwE/J
	Ax2K7XUoZRkzcBtEEv2B/G8K8k4T1j2DhTjkg6LP/qasj98TKubwYVSVKeBKJegwl1rX
	5JSQ==
MIME-Version: 1.0
X-Received: by 10.70.41.38 with SMTP id c6mr36717792pdl.69.1429019410245; Tue,
	14 Apr 2015 06:50:10 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 14 Apr 2015 06:50:10 -0700 (PDT)
In-Reply-To: <9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
Date: Tue, 14 Apr 2015 15:50:10 +0200
Message-ID: <CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Tue, 14 Apr 2015 13:50:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 14, 2015 at 11:09 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Fixed do_configure error:
> configure: error: libX11 headers (libx11-dev) required to build with GLX support
> and do_compile error:
> ../include/epoxy/egl_generated.h:10:29: fatal error: EGL/eglplatform.h: No such file or directory
>  #include "EGL/eglplatform.h"
>
> The dependencies form its README.md:
> * automake
> * libegl1-mesa-dev
> * xutils-dev
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-graphics/libepoxy/libepoxy_1.2.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
> index 4357331..50b9d2c 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
> @@ -13,4 +13,4 @@ S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> -DEPENDS = "util-macros"
> +DEPENDS = "util-macros virtual/mesa"
> --
> 1.7.9.5
>
from the error I would DEPEND on virtual/egl

Andreas


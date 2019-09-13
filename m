Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id DE5987DDA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:48:17 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id g16so380818qto.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZbWZWmBHDIkIHjFSKzpfprO+z403WVmAxv6jclF6Lm4=;
	b=tmTg3AeYOjXBsqahDTfkOG7oGr/i5tiTnx4BYgeRFMpjShVnHwjTrVOP8exoDrpm+k
	9FLRp/7oZFMOTiK6KgUL9FtbRD2bvfmwYqw8/BNDBIp0GIUFS+ApbAGGfqeFbE0CiRp/
	gm1LpCr0gUsXgwzOlhiRt31cozvHYXlEg6QYjG6LGgCTEeio+AfBZGfGfp1wkBNstHVp
	rW9mhaZMqDX16ulPWYLMGV2V546Jh7OMK/uyA4wKXW3LO9u2W+Dq+QSiPiVyqCYortez
	m0FdBmh2j4RUX0L1oU9D+lT6D6KzcFB/Htg/Jw9jDrEJ7mApL091krqx54DXGbfWES2N
	0UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZbWZWmBHDIkIHjFSKzpfprO+z403WVmAxv6jclF6Lm4=;
	b=UrhJoB0YQQpA9MBIabTji8QUDFtifcdQz5FsF7cu0PE2W+6NK3Bx93Llcza9b8rvTT
	yZo0flJ32LLTiUUicF5YQw5I/0S3P80zz721z8sqKn9CVC2aTWEQaURvqZaqfVtlUc5H
	dNBuOEjQIXdPkC1DQQ1LoW0shK31nchJa6K25+4F8zO7GslME/K7kAtx/zFJROiYNGVR
	IGNKC7SB+w/dZMgI3YyN7j3PojGJH8iKsoqt+Vy3SVt38d5LyNoDUK/azmb6OaKq9RhQ
	jYyUwkCR7RY40ArBwwbGQya/2lbx1pNKgzHD1L+xZQ6xTp256Xd93MEVyToBmr6oRFtW
	b4dA==
X-Gm-Message-State: APjAAAWF0wYf+zyGLe4sPeY6GeRR6SfqxHOaBWi17r2PEhgiQIffjwcG
	6VMrKG/NKKXX62XPYE2r0C0YWo9hbgdd8HGRzDw=
X-Google-Smtp-Source: APXvYqyuStGii1W6+uZ9ysrZ20eT+yr90369Mi+fuzwIy0P2XsjB4WQ7fBRJ1FAzVwKehcf9KecefhBecWDEudB0CcY=
X-Received: by 2002:aed:3c52:: with SMTP id u18mr3025646qte.194.1568382498387; 
	Fri, 13 Sep 2019 06:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190913074910.23384-1-nathan@nathanrossi.com>
In-Reply-To: <20190913074910.23384-1-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 06:47:52 -0700
Message-ID: <CAMKF1sr5W3a2mT46Gt=GG=A32gWLVABiOL7PHc2TwNksH5CrSw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-testsuite: SkipRecipe if libc is not glibc
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
X-List-Received-Date: Fri, 13 Sep 2019 13:48:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 13, 2019 at 12:49 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> To prevent issues with parsing or dependencies, limit this recipe to use
> only when the libc is glibc (and libc-locale is glibc-locale).
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-core/glibc/glibc-testsuite_2.30.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> index 64fa8d87df..657fd4dbc1 100644
> --- a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> +++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> @@ -8,6 +8,13 @@ PROVIDES = ""
>  # setup depends
>  INHIBIT_DEFAULT_DEPS = ""
>
> +python () {
> +    libc = d.getVar("PREFERRED_PROVIDER_virtual/libc")
> +    libclocale = d.getVar("PREFERRED_PROVIDER_virtual/libc-locale")
> +    if libc != "glibc" or libclocale != "glibc-locale":
> +        raise bb.parse.SkipRecipe("glibc-testsuite requires that virtual/libc is glibc")
> +}
> +
would something like below work

COMPATIBLE_HOST ?= "null"
COMAPTIBLE_HOST_libc-glibc = "(*)"

>  DEPENDS += "glibc-locale libgcc gcc-runtime"
>
>  # remove the initial depends
> ---
> 2.23.0
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


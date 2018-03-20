Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A22E605C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:42:47 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id m68so281070pfm.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F5LMJAz4hPw96rADB+wgdP4zNetrTCly7fRsMyx0wJs=;
	b=TyM8z+MQ/GypU/tV3dm+/AGXZehZJh4Q7r+6GMPxpti0bF1wv0rIyH9NzN7ie/YLe1
	6TJZMcLKJ7IRO58JR+cExAW5zL3FcgnSVhGcOhbtsfuJ02wq43TqSnSVOfIOAKW6zuNB
	ZPPYuAQhxiCrjuYlSeszhFT32jonbOlB2cclQymgsjr3KClqWuiWbzMI86D1G3wrC4ji
	ruy5qd96xLac4pRORDQyteJ9ZMjqtYCibOkNGLzad3C4uVlRIHlK2f1Aj0Af8pK0FeEq
	gGfjvEdPP4b7l9xP01aYaxZWV4COISvRjAq2O5WrFM85ilaZjjpFnyMCIz4XTIG2Sdlc
	leXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F5LMJAz4hPw96rADB+wgdP4zNetrTCly7fRsMyx0wJs=;
	b=Crm043Ne4DSJ5d/i3wgZCyjNB7kQBW8J2JMgoUslwg9I2+kN0JQmkkh0V9xF1pah6W
	/N/xQdGhwqjmpU7P7VAO3jLMXvvlQ6SGyRHi5dQIb/1dtt/OtUz54y8TA35ieQ2MiEjT
	oQxKIa9PDOmPEou2dsoNI7L9juswzMseH6IUyPjfP+k86R6XC9Zm84Xh6Gb92msYoDx0
	x+1Oz5EHsInPDzp+eQBNwWOp0KrO2K/HAqfd+GacR26TN+ASGSI2ZKWSM7ZtPsY0pFVj
	6pKrihxvRMRj5N1yrMHXWlHl+lAgwXsj++1SD37t5Whcka+5Uh4qY+GBTBCYZ9H13W27
	8SzQ==
X-Gm-Message-State: AElRT7FmUgfG3Dcz5zBHAFcJnxf3ahHjxl/2B322SdKpJxOmkKoqdH8Q
	KJkUW1aCaDCbcSpBPYI+6/GdeXcy0KVEuPlH8xw=
X-Google-Smtp-Source: AG47ELtzNkvI4iF1e7h71VK/GTBniWQZacDpwyT7lTbfg1NMhLgjz5NN1uoYIlgKaG2SVUVfPAUetWtWMcvzPMb+7es=
X-Received: by 10.98.18.70 with SMTP id a67mr12663604pfj.213.1521528168230;
	Mon, 19 Mar 2018 23:42:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Mon, 19 Mar 2018 23:42:17 -0700 (PDT)
In-Reply-To: <20180320052114.32323-1-raj.khem@gmail.com>
References: <20180320052114.32323-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 23:42:17 -0700
Message-ID: <CAMKF1sqQtYaMFV75k76-e+xqv7roh2c4oLKFunKOCX=vPAqHyA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-2.27: Update to bring in 2.27 bug fixes since release
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
X-List-Received-Date: Tue, 20 Mar 2018 06:42:47 -0000
Content-Type: text/plain; charset="UTF-8"

hold on to this patch, I am seeing a runtime
regression.

On Mon, Mar 19, 2018 at 10:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Here is full list of fixes
>
> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98;hp=23158b08a0908f381459f273a984c6fd328363cb
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/cross-localedef-native_2.27.bb | 2 +-
>  meta/recipes-core/glibc/glibc_2.27.bb                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> index f1e4a657cf..d80c8c2a55 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> @@ -21,7 +21,7 @@ SRCBRANCH ?= "release/${PV}/master"
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
>
> -SRCREV_glibc ?= "23158b08a0908f381459f273a984c6fd328363cb"
> +SRCREV_glibc ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
>  SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
>
>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
> index c4042d16fe..326804d6d5 100644
> --- a/meta/recipes-core/glibc/glibc_2.27.bb
> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
>
>  DEPENDS += "gperf-native bison-native"
>
> -SRCREV ?= "23158b08a0908f381459f273a984c6fd328363cb"
> +SRCREV ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
>
>  SRCBRANCH ?= "release/${PV}/master"
>
> --
> 2.16.2
>


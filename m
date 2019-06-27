Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6486B7E9BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:24:02 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r185so6066476iod.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Eqnr2yvxDeST4iQCRUNKyNew/MzLmfPtiXPIjAQEInM=;
	b=1zuahGEoRvuHwTOrKtShMWk4IvprliPnr+LILj+1M2C4g++nWN3INDZNz0MWOA5BsC
	9pIOzP+fKuIaM+nK/ubi6LU43DginsV6Zmzl0jE1shqUY4Kp8xpZo01UD8KW2MOE5ItP
	Yfj7Hci0mY7ngJa6NJunK1KwmH2YXzCCJah0JV5sXTc6HxS1Lyi+q9Nw+/YNhmNCtuwa
	bQXY0kzDeNBH/eq5R+Wje6bNWU8tclPLQRwggDxjk92Q+x1ZAH3VJbbMdrM+g7/q/lkx
	5G7sjhwZMVkwcnBtIGIvELxg7T/1qNpA5jL0y6n38y9zC6L++iIWnG5zdNahSeiOhQlh
	6Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Eqnr2yvxDeST4iQCRUNKyNew/MzLmfPtiXPIjAQEInM=;
	b=B4ZprY0IYapY8SABZ0OSVj4zCOsQzUCoI19c7G7tJb3cA98wriXzgL9yYvLBI7Iau2
	C48qGA3FnlQYj62w3ybQyCpMioc/v9WG2wLDethstFgGp5W+/i2iJg5oEeW2OYaxVFLV
	FNlPB4RE5GLK6XkktyeYZCAK73iUBbM93+Cz0GceYWMkSGwUKb6M8CGlyLyOixBIlfKF
	oZFwh3LGfwLATiFSm4WlCg4Jhm9ZRleVUZqdthEwpqU2S7kpRwtH6W2RooroWNwqjr1s
	zcsiuS5IWOVU+d6gckFG16Zsv22C6LG5ezG+zvIGABgdSni6ggAiDJPbsWtl9N7RQ9CQ
	WXyg==
X-Gm-Message-State: APjAAAXSPI6kBWmZ5H4ynDLF82Gq9dPH8T1QKhdit92ecLbneGXFdIZx
	xSZ/k701tMP9ZFq+Q7w/Mg2iSNTpY/DSc66qhyR4xA==
X-Google-Smtp-Source: APXvYqwksicBj5izKdBnoGJQmtmifAdnCLqKPqCCZDpBrZVBCT/mYabDUDbuoJwVvvNzqVDOuyDKSqz2qXeMz2ye8nk=
X-Received: by 2002:a02:3093:: with SMTP id q141mr5695898jaq.128.1561652643295;
	Thu, 27 Jun 2019 09:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135359.15689-1-JPEWhacker@gmail.com>
In-Reply-To: <20190627135359.15689-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Jun 2019 17:23:52 +0100
Message-ID: <CAJTo0LZkb4kEXm91+Zghy8PWParVTBvDQRZqmbVK-ATK4GfMUA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-util: Fix documentation DEPENDS
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
X-List-Received-Date: Thu, 27 Jun 2019 16:24:02 -0000
Content-Type: text/plain; charset="UTF-8"

Actually looked at this.  The makefile is using pod2man, which is in
HOSTTOOLS, so how is this a problem?

Ross

On Thu, 27 Jun 2019 at 14:54, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> opkg-utils requires perl to generate documentation in do_compile. If not
> present, the documentation will be skipped, which is not reproducible.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
> index 4be7b16d8a2..2f1bf0d21ba 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
> @@ -12,6 +12,8 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
>  "
>  UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
>
> +# Perl is required to generate documentation
> +DEPENDS_class-target = "perl-native"
>
>  SRC_URI[md5sum] = "8c140f835b694a0c27cfb23d2426a02b"
>  SRC_URI[sha256sum] = "9ea9efdd9fe13661ad251e3a2860c1c93045adcfaa6659c3e86d9748ecda3b6e"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


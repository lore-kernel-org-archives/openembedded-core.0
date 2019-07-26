Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id EA4B67F13D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 15:57:20 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id g20so105756083ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=js8RqgGpbiaPy5LrI6KuRpEz4XwwVdZkOl+xoGHhUJU=;
	b=ZHcuh0d7FK6O0Esvdv0hlC3yACPxSbMBwbjRNinoo3VRlouQcASZJ1bzr/iWHYcfdZ
	757Dno4kHChdORMkLK7reeQIzwLBqQ1IFK7mJMCnocCHwutnxOwQ4Gu5P1TRrl9n3oEL
	bKzSwBRNxBJEdMHZ8Gg1ObzBLBleZfQtQLZLfS856FLD9aJ3Q1wxANFTlxOBwU/FSGTp
	H1asaVDEfZ+j177g57n0H6MxMBxaPYQU1MceUi9uq14sOq+n9/AamQCe1xyKgCEgxgKd
	931v7WmxN4T9X3b5wrOFX38NEmubZsfbqOAZeVCT2Vf5Mn/5UmjaYhxw9I8hDsaF9G/N
	wimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=js8RqgGpbiaPy5LrI6KuRpEz4XwwVdZkOl+xoGHhUJU=;
	b=hQs69nJWaj4SF9PlEsrM+unq3zkDP+NrvllxqXlSLx0/fv1nYvohcSioYc46dqJ9/l
	yTqVkzIbXm5DcnF+omU6el4fheb2o60t5K+UPwuGNp+A1P0L1RIaDciq++2fTIZcGlgy
	CHMnZgY7ZUmtOwmQoXIbrj3PzWlZrsdpJgjx6wg9vsCsAwT/U4/1Ve+B9j9avXwxElos
	BgSTCwX9pIC+/3TjvoGV3pRmOyGyiPp/0TeIJKVBm94MLhcyPRxJzljpp7RnrZyrJa0w
	lnkw8YvgGsU4udQIDa4Nb6kR27SgDlypG2LQ+D0zVJDn7w2xto9gz+R6rWGk8IR2ux2M
	4vgw==
X-Gm-Message-State: APjAAAX04OhQHG9iUEj/wn/FMIFBDPNfQJUiOmq+yJUov56mDTYmuKDN
	dFRp/D3AKQOqaq4dJ0EHa1Vdlv07XJL81AapOH2zJkDJ
X-Google-Smtp-Source: APXvYqziULUA8uZv1iGfLOyzQaeAS+TxTIkaoDHcCTcxXInsv0pb6posQweO9GjXocu7T1XuPzK9We1DoANOotNMYtQ=
X-Received: by 2002:a02:7303:: with SMTP id y3mr868001jab.97.1564156641628;
	Fri, 26 Jul 2019 08:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190726153927.14245-1-tworaz@tworaz.net>
In-Reply-To: <20190726153927.14245-1-tworaz@tworaz.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jul 2019 16:57:10 +0100
Message-ID: <CAJTo0Lbwj-5k4K8UDVY0cD+eXnSL1Cv1QoR_Ddvfboh3KDkANw@mail.gmail.com>
To: Piotr Tworek <tworaz@tworaz.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] itstool: Use python3 binary fom PATH instead of /usr/bin/python3
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
X-List-Received-Date: Fri, 26 Jul 2019 15:57:21 -0000
Content-Type: text/plain; charset="UTF-8"

Considering:

1) bitbake is written in Python 3
2) HOSTTOOLS contains python3

There *really* is a host python 3 binary, and the canonical path to it
is ${HOSTTOOLS_DIR}/python3.

Ross

On Fri, 26 Jul 2019 at 16:40, Piotr Tworek <tworaz@tworaz.net> wrote:
>
> Although /usr/bin/python3 works fine for class-target builds its not
> really what we want for class-native. The host system might not even
> have python3 installed. The native itstool version should use pythn3
> provided in recipe-sysroot-native. To accomplish it modify the default
> shebang to use /usr/bin/env. This works as expected for both native and
> target builds.
>
> Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> ---
>  meta-oe/recipes-support/itstool/itstool_2.0.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> index a0af44a71..f21e7f39b 100644
> --- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> +++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100
>
>  do_install_append() {
>      # fix shebang of main script
> -    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
> +    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/env -S ${PYTHON_PN} -s:' ${D}${bindir}/itstool
>  }
>
>  BBCLASSEXTEND = "native"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


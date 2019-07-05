Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D78D7EBF9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:38:34 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k20so20294775ios.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w/50R43Af1UieRa6FGW3MUb5xmkyVjtFNpcNY9gBAAM=;
	b=XOFolNWCNBhMfgm0gjlXaK5EGcqlzq33j+XBP1cQ9oZtVMAAGFfpeQqL6z77QEpx9y
	FPd/5Z6tA7SMdPaJToA+kebFemMJW2GxsMWpSS4VQhWcAH627VRKL/E04otTA2/gePe2
	MDNOdgT8kGvs4K3dS9saoFZvDkAnoH8tkr3ZypUe70/ObKECkRXwQzxbBjpPz7zstO3c
	Z4rd3ora+6uNocLjwsxBr6lGv9qpnmngm5OHCrsgIYW9SkOzA0yZxuotT72cZTvZWWK4
	Ixt8hkA5SGOe3Q9XG9So/se1Z1kuIkLGd6CEVI35Bs5FOeh0Y2ewnE7YwckVyLCzxVYI
	jYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w/50R43Af1UieRa6FGW3MUb5xmkyVjtFNpcNY9gBAAM=;
	b=J2VpfQLbb7VO3MfSPuRlj8G3BSt5t6tb1weBeXNkZiZ2XBkyw9/t5xjyYFsn5/YOWu
	jTHtladsW9absLLH4KOcGdVpOSGD53rfh+b2N3INoN75Y2klLShRyBJ4uNUQbBAzjNnx
	kmFza+IUiiz3GYq4fyR1T46v30OFSPKS5Ybiv2Cu5rnkOL5XUU8vfRKO/soJdFVn9otF
	ukq2gSc0JvWz9GTlENi7XC78NvF2/NcqV7pDiGO/+IRup4/gbi+vNBKRZjKn1eSSBRp5
	Yw6D/c9rI4s+jSkD60tasjBiKuRXZi2kFGtz1aH5eff9xj0uUJpN0h5DMsq4HGoj+oty
	ya1A==
X-Gm-Message-State: APjAAAWiR6Asdhdkm2rtTQ9KoNJrhQpKQTq3BBsADMcMvD1Ij682VdUR
	RKxk5z/eTujzdew6PEqmHLijTqVygi+OHY8z7/y6LA==
X-Google-Smtp-Source: APXvYqzwp2PS0Rg+KMqmnmvTyMBF6t7QHRZXGtAE3ErhsmegJqFYDc6IAMrH5s6o+v7QjdwXZtQbYldu10yLvipUZzw=
X-Received: by 2002:a02:3093:: with SMTP id q141mr5753516jaq.128.1562344715302;
	Fri, 05 Jul 2019 09:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562290204.git.Qi.Chen@windriver.com>
	<c9d93056cbc6067892aa042e5f2c71f3cc264656.1562290204.git.Qi.Chen@windriver.com>
In-Reply-To: <c9d93056cbc6067892aa042e5f2c71f3cc264656.1562290204.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jul 2019 17:38:24 +0100
Message-ID: <CAJTo0LZjFA7t_nqnF9m-=Mm4pcNkJmNf8Puwo6RgeZQnNZkUog@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xmlcatalog.bbclass: execute xmlcatalog only if it's available
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
X-List-Received-Date: Fri, 05 Jul 2019 16:38:34 -0000
Content-Type: text/plain; charset="UTF-8"

We could just always install libxml2 into the SDK...

On Fri, 5 Jul 2019 at 02:18, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> For build-sysroots.bb, the xmlcatalog would not be in its
> staging directory. Causing the following error for eSDK.
>
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function failed: do_build_native_sysroot
>
> The problem could be reproduced by the following steps.
> 1. Add in local.conf:
>    IMAGE_INSTALL_append = " btrfs-tools"
>    DISTRO_FEATURES_append = " api-documentation"
>    INHERIT += "testsdk"
> 2. bitbake core-image-minimal -c populate_sdk_ext
> 3. bitbake core-image-minimal -c testsdkext
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/xmlcatalog.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
> index 075aef8..e805e7b 100644
> --- a/meta/classes/xmlcatalog.bbclass
> +++ b/meta/classes/xmlcatalog.bbclass
> @@ -5,6 +5,8 @@ XMLCATALOGS ?= ""
>  SYSROOT_PREPROCESS_FUNCS_append = " xmlcatalog_sstate_postinst"
>
>  xmlcatalog_complete() {
> +       # In case of eSDK, build-sysroot does not have xmlcatalog in its staging directory.
> +       [ "`which xmlcatalog`" = "" ] && exit 0
>         ROOTCATALOG="${STAGING_ETCDIR_NATIVE}/xml/catalog"
>         if [ ! -f $ROOTCATALOG ]; then
>                 mkdir --parents $(dirname $ROOTCATALOG)
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


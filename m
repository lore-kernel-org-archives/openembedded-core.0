Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B014B7D344
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 16:47:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so8758165wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 09:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2X4kVPSv+cnGRn5AmjZCh94SzKcBme0sLiEiPS8+nWg=;
	b=N+LmIlwiZOdY5TrGFJ8g/cg5qy9c6/Or3nFm/zVAWnsMKSvLmB8ffu0wEbddKfZDbs
	zP/QManDevub21uyMyWgZWAv4ag++57wxlhawxc2ZM1MKPoaR3F0LYGjDXrXS++PptS3
	G1JLJKYBaC9wKIGYdEd9bMZ3KNLIMjoaPG75M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2X4kVPSv+cnGRn5AmjZCh94SzKcBme0sLiEiPS8+nWg=;
	b=eeGdbVMyhBrQgUDe/mn/Ypnr418Gsa0a11GPVAXUMi3LgfXmz3Fb8etmxAZgjKDSGk
	je+uPcvxHAi6IwUpPFMhEhiKwHSe0M+dQL+rhPZ/5kQ8jdScR2KhVkXIB87IQ2t3Fc8J
	kxFev0HXCQ5+treRenti5l6S+nZaBaVqwGaqMl5ue2hd/kL1URGULIFD8fLUogr1xy1n
	uu0QhdYfTfY0SlSe5aan5CsVnZseBWb91vEs+3WhxFpQQKdIOnkg1/L9+hFD93LRNo9y
	wglAenGEVP6G0qhuQUOPqRa7vPVBEmknfiVtxYb3Vd5GO1ckS0iZuJwIy56jEryZfftz
	VqpQ==
X-Gm-Message-State: APjAAAU8i+N263Sj9q2rLZ45NTzir/xbuzkydudvcr6StBhd0ZeiN/Mg
	BxzjIJ+ukAMibVLuPvpVqYbNjg==
X-Google-Smtp-Source: APXvYqx7zYx+DTtgdCT2PVX9rzTpw2qnCfiO9R12N9MjleuwFjOLqxeXRmn8R2m5I96H2319rrNhYQ==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr20073586wrs.136.1562604454440;
	Mon, 08 Jul 2019 09:47:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f192sm86255wmg.30.2019.07.08.09.47.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 09:47:33 -0700 (PDT)
Message-ID: <bffaaf84031568a924656bf092d9d17405fbef2f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 08 Jul 2019 17:47:32 +0100
In-Reply-To: <0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
References: <cover.1562570956.git.Qi.Chen@windriver.com>
	<0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Mon, 08 Jul 2019 16:47:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-08 at 15:37 +0800, Chen Qi wrote:
> For build-sysroots.bb, the xmlcatalog would not be in its
> staging directory. Causing the following error for eSDK.
> 
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command
> '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-
> docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status
> 127.
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function
> failed: do_build_native_sysroot
> 
> The problem could be reproduced by the following steps.
> 1. Add in local.conf:
>    IMAGE_INSTALL_append = " btrfs-tools"
>    DISTRO_FEATURES_append = " api-documentation"
>    INHERIT += "testsdk"
> 2. bitbake core-image-minimal -c populate_sdk_ext
> 3. bitbake core-image-minimal -c testsdkext
> 
> So we add nativesdk-libxml2-utils to buildtools-tarball
> to ensure the existence of xmlcatalog. Also add it
> to HOSTTOOLS_NONFATAL so it could be seen by bitbake.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/conf/bitbake.conf                       | 3 +++
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5e93f5c..2f64eae 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -517,6 +517,9 @@ HOSTTOOLS_NONFATAL += "scp"
>  # Link to git-lfs if present
>  HOSTTOOLS_NONFATAL += "git-lfs"
>  
> +# build-sysroot needs xmlcatalog in order for eSDK installation
> +HOSTTOOLS_NONFATAL += "xmlcatalog"

I don't mind the buildtools-tarball change but HOSTTOOLS is starting to
grow to contain far too much random stuff which could impact
reproduciblity.

Is there some other way we could fix this? It still feels like a
dependency problem which we chould fix by adding a missing dependency
although I appreciate its far from being that simple.

I wonder if there is a way we could teach build-sysroots to be cleverer
about dependencies?

Cheers,

Richard



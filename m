Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 416EB6BCD6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 06:20:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r16so8475416wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 23:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=A4RNc4Uz172RkbkOLIawsORK4ebVYPBBwBvHf1tBNcs=;
	b=MA9GZAeAwyC4DsT9QigErrvZkRd0YMZX6pMBbbo5/joujWbR9hagSHEV/KSC2xk8DZ
	gOyKedU2i6fuSChCNHHAd2ZSFrAlxMXFhT3sZKCRbZUmTw2hzCoR/nZveO8juL3C2XHw
	OipsHygJp2uMfAYprILA8rYAHejzeIRk0nnr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=A4RNc4Uz172RkbkOLIawsORK4ebVYPBBwBvHf1tBNcs=;
	b=SqhnQoM6aV2B+EHOEg/1CJ54pTRrAobT+zuvVD+oLbPLbURPG9xHYIzcP3+DiXHf79
	drIqjc/W60Oc0k454QQkk4OadJ2C+oCurAxH1nJkQM7laGPBIvpGnx/wiTnlXBAmKi+p
	lbpZIn+Qz96me9GVxtC+2m/YwaQwaYTE8OVQIB74jT74QrUv4vu1xySCZ2aabPuK/ESq
	trNdL7Wq5u+k1EtOMS9gd0mjEB7jozoxNWgeTwQVWLTTLabaC//N1t4hzn9nNny6XC1K
	PVLXsNirRg0VFQW4F9i1DyQ8jT7cp6AFz0X/81rErEhGEcXX700xFB8ZPHiwGc9u2NP9
	1+5g==
X-Gm-Message-State: APjAAAXhPJZaEUPlDuCEwukG4CQS2IWf9MVjaBsZzIZCjEuHiOhMD9VE
	85Anmc/m6lONhGMf3hW3ACZzMw==
X-Google-Smtp-Source: APXvYqzdoHKoUYyg8FeVJbpcydUeDK92ue5Me3e0Fj6d8p3Qf59ovj3iqChDBX8XPcKSVw6SGmJ4SQ==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr22205881wra.156.1561184420917;
	Fri, 21 Jun 2019 23:20:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o20sm13362457wrh.8.2019.06.21.23.20.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 23:20:20 -0700 (PDT)
Message-ID: <200a7789559254fd62c36907ae45b03afd29db10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 22 Jun 2019 07:20:18 +0100
In-Reply-To: <20190621095541.1198-1-ross.burton@intel.com>
References: <20190621095541.1198-1-ross.burton@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] pigz: provide gzip
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
X-List-Received-Date: Sat, 22 Jun 2019 06:20:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-21 at 10:55 +0100, Ross Burton wrote:
> As pigz has the same command line interface to gzip, it should
> PROVIDE/RPROVIDE
> gzip.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/pigz/pigz_2.4.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-
> extended/pigz/pigz_2.4.bb
> index 8c65ec34f06..a173268eaa8 100644
> --- a/meta/recipes-extended/pigz/pigz_2.4.bb
> +++ b/meta/recipes-extended/pigz/pigz_2.4.bb
> @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "
> file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline
>  SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
>  SRC_URI[md5sum] = "def2f6e19d9d8231445adc1349d346df"
>  SRC_URI[sha256sum] =
> "a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73"
> -PROVIDES_class-native += "gzip-native"
>  
>  # Point this at the homepage in case /fossils/ isn't updated
>  UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
>  UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
>  
> +PROVIDES = "gzip"
>  DEPENDS = "zlib"
>  
>  EXTRA_OEMAKE = "-e MAKEFLAGS="
> @@ -38,6 +38,8 @@ do_install_append_class-native() {
>  	ln -nsf gzip ${D}${bindir}/zcat
>  }
>  
> +RPROVIDES_${PN} = "gzip"
> +

The RPROVIDES is fine, not sure the PROVIDES is going to work though as
bitbake handles things a little differently.

It throws errors on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/734

Initialising tasks...ERROR: Multiple .bb files are due to be built which each provide gzip:
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/pigz/pigz_2.4.bb
A list of tasks depending on these providers is shown and may help explain where the dependency comes from.
/home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb has unique dependees:
  
/home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/pigz/pigz_2.4.bb has unique dependees:
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/ltp/ltp_20190115.bb:do_package_write_rpm
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb:do_package_write_ipk
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/ltp/ltp_20190115.bb:do_package_qa
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/ltp/ltp_20190115.bb:do_package_write_deb
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/ltp/ltp_20190115.bb:do_package_write_ipk
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/ltp/ltp_20190115.bb:do_build
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb:do_build
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-sato/images/core-image-sato-sdk.bb:do_build
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-sato/images/core-image-sato-sdk.bb:do_rootfs
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb:do_build
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb:do_package_write_rpm
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb:do_package_write_deb
  /home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb:do_package_qa
It could be that one recipe provides something the other doesn't and should. The following provider and runtime provider differences may be helpful.
/home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb has unique provides:
  
/home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/gzip/gzip_1.10.bb has unique rprovides:
  gzip-ptest
  gzip-dbg
  gzip-src
  gzip-dev
  ^gzip-locale-.*
  gzip-locale
  gzip-doc
  gzip-staticdev
/home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/pigz/pigz_2.4.bb has unique provides:
  pigz
/home/pokybuild/yocto-worker/edgerouter/build/meta/recipes-extended/pigz/pigz_2.4.bb has unique rprovides:
  pigz-dbg
  pigz-locale
  pigz-dev
  pigz-doc
  ^pigz-locale-.*
  pigz-staticdev
  pigz-src
  pigz
done.

Cheers,

Richard



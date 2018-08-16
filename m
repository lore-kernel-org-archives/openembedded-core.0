Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
	[209.85.222.42])
	by mail.openembedded.org (Postfix) with ESMTP id B351679080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 19:34:43 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id m13-v6so4365595uaq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HS36p8tGVaqP1b0e9RQNcFsfEevI6capVnjVXpwTbbg=;
	b=Ugyttna9mfRiEG2y42AgtXqp9OniZ+ETVVfqcNnWy8AG9IZElAJTERO8uuN1Rs+zUr
	1ln17d+fjuZpBKu/RjFm2klJhBrQ2aCXobn+qfq49Rb31VK7ParsFQ45/iK9hvosiQza
	mu3TvI0j60BSCuluJum18v5vq0sfRzLXh7hNIRpsxzqDzG54OeygU98d0/ScYZ3wkXvl
	PBKd6LC5N5t1gV8++2vVc92SjaqXCK67nqZ5fOfMTtrzZmysppQ2JHdmd6/wqEciYELo
	iiAJBHDORtcAXxH7AAqE2XwukRF8q375m8QaO/NAWGyPkd2rI2NFPcJDJHfs5Y0jz+48
	8Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HS36p8tGVaqP1b0e9RQNcFsfEevI6capVnjVXpwTbbg=;
	b=VR71UChXU+YVmuJ0akksRdsr2OUImiiXGFI2zwmetDHq5TaFTGdHus5aG04kHF/t7i
	IJYXAaqX/nGaS0WkhWuN1AbPLvFQ71B4/qzMQuRgubha1XdRykMVAt8leBa5gBONtHay
	p9Dq8dBUb86+tiUHcMpY1hfLVOezwwkMlrLqqIrdXH4iah5ZfXcLrDhqrNbx3Ux2J/d1
	StzUjy4Iugqw8S8ZBOz/rBO5turHKkGVbaAyINB/DFtQ+HrreETN9/dNNlvGtGSdfQ72
	F5RD+w1DpvtiSslRD2B0JLIo7AQ9xb6ubU0CiveHCujj9FPyDW7Nh4XQL+T5A8/hUFc1
	ziVw==
X-Gm-Message-State: AOUpUlHwOHJP96EU4LC71i52Sa9lm7IdG8SiAgmm9BPo3raYHImyGIiQ
	Q2MGGSdkxXUxqNasmFf9097wBJ2agvE6W9hMNs8=
X-Google-Smtp-Source: AA+uWPwpwtSVrMIw/OTdHW1R/KB9JPUiTfIC88FAOvDFF8/D/QqtUTVFlaO1xzTHWJxcz0o/Oj21VamnXn6L9wN+XBY=
X-Received: by 2002:ab0:5b8f:: with SMTP id
	y15-v6mr20927560uae.59.1534448084530; 
	Thu, 16 Aug 2018 12:34:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 16 Aug 2018 12:34:44 -0700 (PDT)
In-Reply-To: <20180717091035.26461-3-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
	<20180717091035.26461-1-andrej.valek@siemens.com>
	<20180717091035.26461-3-andrej.valek@siemens.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Aug 2018 12:34:44 -0700
Message-ID: <CAJ86T=WL-za2Yd9d=jkQ48gBc9FB4uy3TH0VBR4vEy8hJcoPYQ@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 2/3] openssl-1.1: rework packaging
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
X-List-Received-Date: Thu, 16 Aug 2018 19:34:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 2:10 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
> The main idea is to have libssl and libcrypto in separate packages.
> This saves space if only single library is needed and also some recipes
> (in other layers) depend on these library packages.
> Together with this other packages like in 1.0.x were created.
> The only difference is that openssl 1.1 has additional package openssl-bin.
>
> Add missing dependency to perl for openssl-bin pkg, c_rehash requires it.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Marko Peter <peter.marko@siemens.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> index c5de085521..7af527ca31 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> @@ -158,12 +158,22 @@ do_install_ptest() {
>          sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
>  }
>
> -PACKAGES =+ "${PN}-engines"
> +PACKAGES =+ "libcrypto libssl ${PN}-misc ${PN}-engines openssl-conf"
>
> +FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
> +FILES_libssl = "${libdir}/libssl${SOLIBS}"
>  FILES_${PN} =+ "${libdir}/ssl-1.1/*"
>  FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
>  FILES_${PN}-engines = "${libdir}/engines-1.1"
>
> +FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
> +RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"

There is no "perl" PACKAGECONFIG in the openssl 1.1 recipe (there are
no PACKAGECONFIG options at all...).

> +
> +FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
> +CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
> +RRECOMMENDS_libcrypto += "openssl-conf"
> +
> +RDEPENDS_${PN}-bin = "perl"
>  RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


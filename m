Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
	[209.85.222.49])
	by mail.openembedded.org (Postfix) with ESMTP id 73DC079268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 23:38:25 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id c12-v6so4719298uan.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 16:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qqwHBA13IaMna6sHKqiVKgjB7J4NDsJQlFp9WI+JELk=;
	b=DPmGWUMqZZyBN5icURZ7DOZpD+oj3FDMpg1VrWSqdsxZWMC9UNvqRfa6YvF+A5twH9
	D1sbvWwG1ssR7WKA0UM/neeYQYPuwTDlC++mr9eEE1x8Tj+wz8Jkj+j07TfcGZVvYuq3
	hL2R4ePLX43et83VcgxLvs7LhVFU8SGz8rG3kVbLo426F/wSJgLKVzUDegxxXPrkRTbF
	/cZrRFVD6BYTPKUjuTn7ILHYkrXKWQXIckADp0OPcBt9dCtN2U4cX65kARqokL2HsUYV
	YUtJKOgVlCpj7N/0z1V+v2H9vjIEBkg2DyGUT3lkZGPD7RZmEoAxqNhpO9QVRcKGtMaN
	KOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qqwHBA13IaMna6sHKqiVKgjB7J4NDsJQlFp9WI+JELk=;
	b=a9j8IhOddxNLbLQCRp97905MekTwGKoIiKWtBj2mZISqLj4d3+hviHQhYfmY1++rFc
	tUpBR6aTGuc/rVY2eaA9mtn7INn+luT+iF/K9hr8YlXjCxqTtFKGXAN5UmzhxUHOn9Zh
	Vo8eRk1afjroe4Wv4PWaOmMywjjx22m+KYzU2rHb+rKNy9UERKEWGxbwFicUjTkf9BbS
	H/rH2hhJm9sXVrtGtiMLAQ5qXoY6yKkF1f6SaOApn54iwsSvUgYYgvE1atA2AQy1X1UO
	lm24uhwn3SbGzhbyfS5wMMVscAJX+5pNDr7JYwZv3Y6N+r5M/+UcoJziHKi2uB6Oh0f/
	y80g==
X-Gm-Message-State: AOUpUlFMp7AzpdJAb0zwjqcuJexJR0CiInYxh5yi7cEIwW4FVbIjuBF2
	aEGgShvK3n/hxD2Y4DZyAAXxzpdw6R6QYesxKVE=
X-Google-Smtp-Source: AA+uWPydV4M1VnFu+HefkdKjEkyb2Fh8NU2AKECNaFSvq+mVfuc/0m/Tg7+qH51VQ68XcSrdPAw6mQTxV7TJS6GeG/0=
X-Received: by 2002:ab0:5b8f:: with SMTP id
	y15-v6mr21426503uae.59.1534462706311; 
	Thu, 16 Aug 2018 16:38:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 16 Aug 2018 16:38:25 -0700 (PDT)
In-Reply-To: <20180717091035.26461-4-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
	<20180717091035.26461-1-andrej.valek@siemens.com>
	<20180717091035.26461-4-andrej.valek@siemens.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Aug 2018 16:38:25 -0700
Message-ID: <CAJ86T=UH0JoFfz2x5gJNpjMugAUmK1ADR_8LsOwT0=b6Ekv5ww@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 3/3] openssl-1.1: /etc/ssl location compatibility
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
X-List-Received-Date: Thu, 16 Aug 2018 23:38:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 2:10 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
> Some packages have hard-coded path to /etc/ssl location.
> Create a symlinks to correct location.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Marko Peter <peter.marko@siemens.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> index 7af527ca31..d6ef66ba51 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> @@ -22,7 +22,7 @@ SRC_URI_append_class-nativesdk = " \
>  SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
>  SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
>
> -inherit lib_package multilib_header ptest
> +inherit lib_package multilib_header ptest relative_symlinks
>
>  #| engines/afalg/e_afalg.c: In function 'eventfd':
>  #| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
> @@ -133,6 +133,18 @@ do_configure () {
>  do_install () {
>          oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
>          oe_multilib_header openssl/opensslconf.h
> +
> +        # Create SSL structure for PATH hard-coded packages like ca-certificates
> +        # Debian is also using this technique
> +        install -d ${D}${sysconfdir}/ssl/
> +        mv ${D}${libdir}/ssl-1.1/openssl.cnf \
> +           ${D}${libdir}/ssl-1.1/certs \
> +           ${D}${libdir}/ssl-1.1/private \
> +           \
> +           ${D}${sysconfdir}/ssl/
> +        ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl-1.1/certs
> +        ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl-1.1/private
> +        ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl-1.1/openssl.cnf
>  }
>
>  do_install_append_class-native () {
> @@ -169,8 +181,8 @@ FILES_${PN}-engines = "${libdir}/engines-1.1"
>  FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
>  RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
>
> -FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
> -CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
> +FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf ${libdir}/ssl-1.1/openssl.cnf"

The openssl 1.0 recipe does not put the ${libdir} symlink in the
openssl-conf package. The reasons for that are not entirely clear, but
it does seem to be a deliberate choice according to comments in this
thread:

  http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135176.html

Is there a clear reason for the openssl 1.1 recipe to be different?

> +CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
>  RRECOMMENDS_libcrypto += "openssl-conf"
>
>  RDEPENDS_${PN}-bin = "perl"
> --
> 2.11.0


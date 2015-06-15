Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id CB48475979
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 23:18:20 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so348904pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=laIRFHjY7kTXtO8Um1DqUcM//RAFP4V0ZjGFTTVbJc8=;
	b=w+BOXJKmyT+avjXseseUT9/MGn9QNtuFM6lko3VDDMhCExYp0C1hyk1qa5f0nulnMD
	cfMpVSIGWE5LRKNcccxyydDZlxlv8Z/88Syou1XOOCDNv98bGry7Ht+0ZAvPRF4hYlmR
	WfM6f+7+/7A47PytfinbE+FO7qbPLXfT+Rard37jaJMlsScjU7q6UP8gkm9TtaeKuAaX
	Ktmmd2dH50j+fdX90P6f3rvLaicdYnXQMGQT3IfxwmKaPbQ/z+JnM5Wa4ObHoRQxJJiT
	/aiUbJeAY9sxDn06+B/5DSmu51YKcvuKtuSPAWr4w8kp+73jxwtnCHkKff2vwGz7tIv7
	YXlA==
X-Received: by 10.66.131.110 with SMTP id ol14mr43171495pab.0.1434410301592;
	Mon, 15 Jun 2015 16:18:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:5497:5873:98e2:119e?
	([2601:202:4000:1239:5497:5873:98e2:119e])
	by mx.google.com with ESMTPSA id
	do16sm13401160pac.15.2015.06.15.16.18.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jun 2015 16:18:20 -0700 (PDT)
Message-ID: <557F5D38.9020200@gmail.com>
Date: Mon, 15 Jun 2015 16:18:16 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1434259784.git.akuster808@gmail.com>
	<25c4ff3c454ec38bec5e68498d7230e6aaf8dc64.1434259784.git.akuster808@gmail.com>
	<CAJTo0LZ5uHLs-aP266_MYNkaBikPZ9=LDmOM+Vvr7SBkAqvJbw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ5uHLs-aP266_MYNkaBikPZ9=LDmOM+Vvr7SBkAqvJbw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnutls: update to 3.4.1
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
X-List-Received-Date: Mon, 15 Jun 2015 23:18:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/15/2015 03:13 AM, Burton, Ross wrote:
> So this happens:
>
> WARNING: QA Issue: gnutls-openssl rdepends on libidn, but it isn't a
> build dependency? [build-deps]
> WARNING: QA Issue: gnutls-xx rdepends on libidn, but it isn't a build
> dependency? [build-deps]
> WARNING: QA Issue: gnutls-dev rdepends on libidn, but it isn't a build
> dependency? [build-deps]
> WARNING: QA Issue: gnutls-bin rdepends on libidn, but it isn't a build
> dependency? [build-deps]
> WARNING: QA Issue: gnutls rdepends on libidn, but it isn't a build
> dependency? [build-deps]

Well that is a bummer. I have not seen those otherwise I would have not 
submitted the request.

Thanks for the feedback.

- armin
>
> Ross
>
> On 14 June 2015 at 06:37, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     This version supports the nettle 3.x and higher and requires that
>     version.
>
>     this include a security fix:
>     GNUTLS-SA-2015-2
>     no CVE assigned to date.
>
>     enable openssl compat via PACKAGECONFIG as iputils needs
>     gnutls/openssl.h
>
>     for migration info:
>     http://www.gnutls.org/manual/gnutls.html#Upgrading-from-previous-versions
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>       meta/recipes-support/gnutls/gnutls.inc             |  3 ++-
>       .../gnutls/configure.ac-fix-sed-command.patch      | 29
>     ++++++++++------------
>       meta/recipes-support/gnutls/gnutls_3.3.14.bb
>     <http://gnutls_3.3.14.bb>       |  8 ------
>       meta/recipes-support/gnutls/gnutls_3.4.1.bb
>     <http://gnutls_3.4.1.bb>        |  8 ++++++
>       4 files changed, 23 insertions(+), 25 deletions(-)
>       delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
>     <http://gnutls_3.3.14.bb>
>       create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
>     <http://gnutls_3.4.1.bb>
>
>     diff --git a/meta/recipes-support/gnutls/gnutls.inc
>     b/meta/recipes-support/gnutls/gnutls.inc
>     index e9b138a..6928cb9 100644
>     --- a/meta/recipes-support/gnutls/gnutls.inc
>     +++ b/meta/recipes-support/gnutls/gnutls.inc
>     @@ -34,9 +34,10 @@ do_configure_prepend() {
>              done
>       }
>
>     -PACKAGECONFIG ??= "zlib"
>     +PACKAGECONFIG ??= "zlib openssl_compat"
>       PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
>       PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
>     +PACKAGECONFIG[openssl_compat] = "--enable-openssl-compatibility,,"
>
>       PACKAGES =+ "${PN}-openssl ${PN}-xx"
>
>     diff --git
>     a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
>     b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
>     index 44a9934..342143f 100644
>     ---
>     a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
>     +++
>     b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
>     @@ -13,19 +13,16 @@ Signed-off-by: Robert Yang
>     <liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>
>     configure.ac <http://configure.ac> | 2 +-
>        1 file changed, 1 insertion(+), 1 deletion(-)
>
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index c6818a0..1c4582d 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -466,7 +466,7 @@ if test "$NEED_LIBOPTS_DIR" = "true";then
>     -       dnl replace libopts-generated files with distributed
>     backups, if present
>     -       missing_baks=
>     -       for i in ${srcdir}/src/*-args.c.bak
>     ${srcdir}/src/*-args.h.bak; do
>     --              nam=`echo $i|sed 's/.bak//g'`
>     -+              nam=`echo $i|sed 's/\.bak$//'`
>     -               if test -f $i;then
>     -                       cp -f $i $nam
>     -               else
>     ---
>     -2.0.1
>     -
>     +Index: gnutls-3.4.1/configure.ac <http://configure.ac>
>     +===================================================================
>     +--- gnutls-3.4.1.orig/configure.ac <http://configure.ac>
>     ++++ gnutls-3.4.1/configure.ac <http://configure.ac>
>     +@@ -530,7 +530,7 @@ if test "$enable_tools" != "no" || test
>     +               dnl replace libopts-generated files with distributed
>     backups, if present
>     +               missing_baks=
>     +               for i in ${srcdir}/src/*-args.c.bak
>     ${srcdir}/src/*-args.h.bak; do
>     +-                      nam=`echo $i|sed 's/.bak//g'`
>     ++                      nam=`echo $i|sed 's/\.bak$//'`
>     +                       if test -f $i;then
>     +                               cp -f $i $nam
>     +                       else
>     diff --git a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
>     <http://gnutls_3.3.14.bb>
>     b/meta/recipes-support/gnutls/gnutls_3.3.14.bb <http://gnutls_3.3.14.bb>
>     deleted file mode 100644
>     index f41d183..0000000
>     --- a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
>     <http://gnutls_3.3.14.bb>
>     +++ /dev/null
>     @@ -1,8 +0,0 @@
>     -require gnutls.inc
>     -
>     -SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
>     -            file://configure.ac-fix-sed-command.patch \
>     -            file://use-pkg-config-to-locate-zlib.patch \
>     -           "
>     -SRC_URI[md5sum] = "7f4465f8c564cf9cb8f5cb38b909f7ca"
>     -SRC_URI[sha256sum] =
>     "0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52"
>     diff --git a/meta/recipes-support/gnutls/gnutls_3.4.1.bb
>     <http://gnutls_3.4.1.bb>
>     b/meta/recipes-support/gnutls/gnutls_3.4.1.bb <http://gnutls_3.4.1.bb>
>     new file mode 100644
>     index 0000000..1b64813
>     --- /dev/null
>     +++ b/meta/recipes-support/gnutls/gnutls_3.4.1.bb
>     <http://gnutls_3.4.1.bb>
>     @@ -0,0 +1,8 @@
>     +require gnutls.inc
>     +
>     +SRC_URI += "file://correct_rpl_gettimeofday_signature.patch  \
>     +            file://configure.ac-fix-sed-command.patch \
>     +            file://use-pkg-config-to-locate-zlib.patch \
>     +          "
>     +SRC_URI[md5sum] = "2d04f34fa25b45f9dcb9104c0394e12e"
>     +SRC_URI[sha256sum] =
>     "e9b5f58becf34756464216056cd5abbf04315eda80a374d02699dee83f80b12e"
>     --
>     2.3.5
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


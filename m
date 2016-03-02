Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 59A4077074
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 18:06:12 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n186so98303390wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ksT0JKuNqb6KjOrTrRjf4hIUB9ebKf/PBs3tFN7BxF8=;
	b=NIJV3XwH4QfNNb48v9J21eTzEuh0zS+zam6p7sf6xaMMCi9bEU0XAZLT1Qpl7G7bU9
	Wbl1yJtayW5UtW2hjVFeBWNNU9Wk2sOU3gk8mxSM3Ssp0GwQOoO8o7qYPluaJDqn9PhZ
	qTTd7gyzP7wGnV6lnO1Exku89OW7+kH0HGXAziorYzhR3hd/vdSBUUp0E/h4j8mNgKLx
	NYdAkkfw/XSgP8489iSidMud9GuLZ6XMMt3741Ok7rA9BcVdn67SvIizqKhlSewiQuPm
	Hga4wxxiIfBi88LWt/pl9js1jPKfH85gL0ZwPMDK6Ct8g4S7YOskArQvCQiUMdB7zTYy
	UkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ksT0JKuNqb6KjOrTrRjf4hIUB9ebKf/PBs3tFN7BxF8=;
	b=cCyszE8FuAZxEplCi62PE9QtpQ6nVik7THVryleuWacAXOGULHwx3GfA7vLFnnpaH7
	AuvLXwakZ2CPfq+3sEIx1aEAvsng1nRZQuI50g4DjcAuMv5Vh/3nCS3LJ5ifYgFjqQyz
	le18GZ7OcziQuCplKhsUDShHgO+QlbHA6a9xZlItxLNqt85wT6aepbz5xhZAg8mTXbRc
	zKbQuTVgHkRMtOBrIf1DGvIU4J8G/RPGV79kRWh1xPmK4Y5rdDl2Iew/VjpizepyY3g8
	N08bpdJlCsu0n/6nnMFdIT4Rs7swm9mzvlCSZEW3zAMBrmKElXzk8MFwNfhHEgGw7RDE
	6gQQ==
X-Gm-Message-State: AD7BkJLNlmrniSv9jB94nuhcqPvWWQuUDFMrhcVYEMZjqd/9cdsUI8qIochIIPNtjB26RomBVFbFyNWC0uk3Tg==
MIME-Version: 1.0
X-Received: by 10.28.54.22 with SMTP id d22mr1233379wma.72.1456941972879; Wed,
	02 Mar 2016 10:06:12 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 2 Mar 2016 10:06:12 -0800 (PST)
In-Reply-To: <1456904321-25059-1-git-send-email-akuster808@gmail.com>
References: <1456904321-25059-1-git-send-email-akuster808@gmail.com>
Date: Wed, 2 Mar 2016 10:06:12 -0800
Message-ID: <CAJ86T=UbRRkZAV5-JEfhZs3TL_W0Hbb4bhcN0kJGZssj60OPOg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster@mvista.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master][Drown] openssl: Security fix Drown via 1.0.1g update
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
X-List-Received-Date: Wed, 02 Mar 2016 18:06:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 1, 2016 at 11:38 PM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> CVE-2016-0800
> CVE-2016-0705
> CVE-2016-0798
> CVE-2016-0797
> CVE-2016-0799
> CVE-2016-0702
> CVE-2016-0703
> CVE-2016-0704
>
> https://www.openssl.org/news/secadv/20160301.txt
>
> Updated 2 debian patches to match changes in 1.0.1g

Could you give some details on why the linker version script is now
required and how it was generated?

> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../openssl/debian1.0.2/block_diginotar.patch      |   17 +-
>  .../openssl/debian1.0.2/version-script.patch       | 4656 ++++++++++++++++++++
>  .../{openssl_1.0.2f.bb => openssl_1.0.2g.bb}       |    6 +-
>  3 files changed, 4668 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2f.bb => openssl_1.0.2g.bb} (91%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
> index 0c1a0b6..d81e22c 100644
> --- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
> @@ -9,14 +9,15 @@ Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
>  Reviewed-by: Dr Stephen N Henson <shenson@drh-consultancy.co.uk>
>
>  This is not meant as final patch.
> -
> +
>  Upstream-Status: Backport [debian]
>
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>
> -Index: openssl-1.0.2/crypto/x509/x509_vfy.c
> +Index: openssl-1.0.2g/crypto/x509/x509_vfy.c
>  ===================================================================
> ---- openssl-1.0.2.orig/crypto/x509/x509_vfy.c
> -+++ openssl-1.0.2/crypto/x509/x509_vfy.c
> +--- openssl-1.0.2g.orig/crypto/x509/x509_vfy.c
> ++++ openssl-1.0.2g/crypto/x509/x509_vfy.c
>  @@ -119,6 +119,7 @@ static int check_trust(X509_STORE_CTX *c
>   static int check_revocation(X509_STORE_CTX *ctx);
>   static int check_cert(X509_STORE_CTX *ctx);
> @@ -25,17 +26,17 @@ Index: openssl-1.0.2/crypto/x509/x509_vfy.c
>
>   static int get_crl_score(X509_STORE_CTX *ctx, X509 **pissuer,
>                            unsigned int *preasons, X509_CRL *crl, X509 *x);
> -@@ -438,6 +439,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
> +@@ -489,6 +490,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
>       if (!ok)
> -         goto end;
> +         goto err;
>
>  +      ok = check_ca_blacklist(ctx);
> -+      if(!ok) goto end;
> ++      if(!ok) goto err;
>  +
>   #ifndef OPENSSL_NO_RFC3779
>       /* RFC 3779 path validation, now that CRL check has been done */
>       ok = v3_asid_validate_path(ctx);
> -@@ -938,6 +942,29 @@ static int check_crl_time(X509_STORE_CTX
> +@@ -996,6 +1000,29 @@ static int check_crl_time(X509_STORE_CTX
>       return 1;
>   }
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> new file mode 100644
> index 0000000..29f11a2
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> @@ -0,0 +1,4656 @@
> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure
> +===================================================================
> +--- openssl-1.0.2~beta1.obsolete.0.0498436515490575.orig/Configure     2014-02-24 21:02:30.000000000 +0100
> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure  2014-02-24 21:02:30.000000000 +0100
> +@@ -1651,6 +1651,8 @@
> +               }
> +       }
> +
> ++$shared_ldflag .= " -Wl,--version-script=openssl.ld";
> ++
> + open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
> + unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
> + open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
> +===================================================================
> +--- /dev/null  1970-01-01 00:00:00.000000000 +0000
> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld 2014-02-24 22:19:08.601827266 +0100
> +@@ -0,0 +1,4608 @@
> ++OPENSSL_1.0.2d {
> ++      global:
> ++              BIO_f_ssl;
> ++              BIO_new_buffer_ssl_connect;
> ++              BIO_new_ssl;
> ++              BIO_new_ssl_connect;
> ++              BIO_proxy_ssl_copy_session_id;
> ++              BIO_ssl_copy_session_id;
> ++              BIO_ssl_shutdown;
> ++              d2i_SSL_SESSION;
> ++ ...
> ++ ...


Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A24F79704
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:11:02 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id l82-v6so6582333oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DZsktly25PXVfFieTwaQVXHBf4N7VPRsEtFHiMfy+mU=;
	b=fcbOjFGNXKShdGqR45ONcBDt3L+RIvTYoPgYvrNJbI7sxJqRLxDCWu09I1Z1lQPWI8
	PRbTLt6TXMtG+3OWEE8020sXcLk2EzSVGhqsPot0zrTIpUividD4l2NKit2Enr96zaKR
	KYM1lIqv/UejwwFrWQEG7RxY+obTtDVAHGmKOfK/TAA9nlcjudsTck+wqD0RjuBOvE9q
	uS8r6/6CZuHn2H6qr76CooSWTJAXj8XHoxwQOZgAge+ebrmJV61724FeiDr5Osmi3VOt
	h8AYSWovWj+8IxzzZZlSMVoCIa87zTBoya5NifDu28dqLHkFyZVaM9Yq0MwOq2n9vCGv
	7kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DZsktly25PXVfFieTwaQVXHBf4N7VPRsEtFHiMfy+mU=;
	b=suFgudT8CJ/taZWeNh9YrcWwK7OWn0ck5BoEYWYaDd3NXV5eZVeMYJpjDuFLE2JXlY
	0aB4q+vnzkdZh60TbNXxxVzlQZosz0AvOLMXWB9ix8cekgy1wdE0+6Br6ZTy6BvnhKqH
	wvabxA7UTXew95dC1UiagBv+kAhMdCeTbCmrHmzfOKPJlQwjfMmAzzQDCXTi4WVyoe6w
	AYyIedCEBjiZiNwHMgGC1d/uQZpd2+CGHS3L5lWi+ypgE2aQNhp5x0HmM+dw/3vJFH6K
	FcGIovG6gJzawKObSuI4z7yYQY+wfmsIaIufdMX42QEO8+IY/YYilqAUEE6TcJfokmxM
	h/BQ==
X-Gm-Message-State: APzg51DTr2oCLKKNHOKo2+zr9ppjdOkChPTErLmrOlbc3M9VJB155qK7
	2SVvqQnUmoC5mY9w5CrVz6mjygsRBbmW1SrYP8DFuQ==
X-Google-Smtp-Source: ANB0VdbjeS4LsTnFDDRkc+ZQdB2KYrqV251XyJEASAf89V69a3Bd9N5W8LftIy0rUAZzp2yG/w8C53OGOuGkS1W3SDE=
X-Received: by 2002:aca:a04:: with SMTP id 4-v6mr4103450oik.203.1536786663104; 
	Wed, 12 Sep 2018 14:11:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Wed, 12 Sep 2018 14:10:42 -0700 (PDT)
In-Reply-To: <1536784825-4476-2-git-send-email-geissonator@gmail.com>
References: <1536784825-4476-1-git-send-email-geissonator@gmail.com>
	<1536784825-4476-2-git-send-email-geissonator@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2018 22:10:42 +0100
Message-ID: <CAJTo0LZo8o+RNJR1KgqfQybfcv-QfNDEs+6a5NaR0U1tQ6uSJQ@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python/python3: Add option to remove test files
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
X-List-Received-Date: Wed, 12 Sep 2018 21:11:02 -0000
Content-Type: text/plain; charset="UTF-8"

What are these files?  Are they needed by the test suite?  If so, lets
just put them into python-tests along with the test suite.

Ross

On 12 September 2018 at 21:40, Andrew Geissler <geissonator@gmail.com> wrote:
> A quick search in the python package shows the following test
> directories being included in the python image:
> ./Python-2.7.14/Lib/bsddb/test
> ./Python-2.7.14/Lib/sqlite3/test
> ./Python-2.7.14/Lib/ctypes/test
> ./Python-2.7.14/Lib/unittest/test
> ./Python-2.7.14/Lib/lib-tk/test
> ./Python-2.7.14/Lib/email/test
>
> In some distributions, the extra space taken up by these test files
> is very valuable.
>
> The default is to still include the test files.
>
> Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.5.bb | 9 +++++++++
>  meta/recipes-devtools/python/python_2.7.15.bb | 9 +++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
> index c919a97..5d1397a 100644
> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
> @@ -160,6 +160,11 @@ EOF
>         fi
>  }
>
> +# Some packages include test/ directories and files. Provide option
> +# to not include them.
> +
> +INCLUDE_TESTS ?= "1"
> +
>  do_install() {
>         # make install needs the original Makefile, or otherwise the inclues would
>         # go to ${D}${STAGING...}/...
> @@ -189,6 +194,10 @@ do_install() {
>         fi
>
>         oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> +
> +    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
> +        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
> +    fi
>  }
>
>  do_install_append_class-nativesdk () {
> diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> index 82b65d2..1839624 100644
> --- a/meta/recipes-devtools/python/python_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> @@ -90,6 +90,11 @@ do_compile() {
>                 OPT="${CFLAGS}"
>  }
>
> +# Some packages include test/ directories and files. Provide option
> +# to not include them.
> +
> +INCLUDE_TESTS ?= "1"
> +
>  do_install() {
>         # make install needs the original Makefile, or otherwise the inclues would
>         # go to ${D}${STAGING...}/...
> @@ -127,6 +132,10 @@ do_install() {
>      if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
>          rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
>      fi
> +
> +    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
> +        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
> +    fi
>  }
>
>  do_install_append_class-nativesdk () {
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


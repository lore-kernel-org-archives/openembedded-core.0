Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id AE8C177237
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 15:09:52 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id y9so85413791qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 07:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xVKDbXmtgZF75XTBMWBW/7+iPPD0nsq282xKq59HwgQ=;
	b=eQK6G49whwx2IMCRhSEV8UfZovP/yfRyXN/IyDu7OvO2uw5bdKi+9aqG0lsaE/eN97
	xw9ddz4voTHBFT1G4vec7RHEnwmvaeq5f4DjjCkD1ILboM5sbEFOPop7EbvFrHUxNm32
	gc/PMrwFe0rpY7wxDMs72g1phdH/daebPzA69UN91wvmR3xRbZnZjbJ4CQ5qcz/r9UA7
	qh66RIgRqTbNileHHR3mlACptbSD4PZMxHVa6uYAJ0mmu4zwlj05T2dbqcXcSH1xXUqr
	xYnnMyuyb3a9bcmp44KzMI6m41zDI0Y8qIq7bswHrKcaKfRk+MaXAT1Ly3BoMDBnHnYg
	RqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xVKDbXmtgZF75XTBMWBW/7+iPPD0nsq282xKq59HwgQ=;
	b=Qvc1/Ffxq4+GgUHduRDPu4YK91f0FxqJgpxRzFxMLCqw53oRXSaWjR8EnrZbcza2eq
	7arSYyUKp+DZsgknYC+UuV7UChQSEjfSGQSpjDYCiTXRUwT7lo+XFBl1GHB//U3bSTDO
	YcAouMQRV/hnxBULkphkrymy+rXFjRGJRX5/vJtduARPynzWUUXW1OLEq0dXE55QeFvn
	25chYNzhDFoy39Op5Pa1yvlkdfEBcBcr5GAqVqp/k0ygTux2PvlFVqEWPF/vd6NDn5G8
	t/909VNGtLoijLP/9cfRxL1yT6KC+ULluSPuV1AeSyWmeYO/uunf2TVwCApKOHcI+A7M
	OeJQ==
X-Gm-Message-State: AG10YOQsiF3Y0OW73I8ZiI4aCA8RImAd6sE0S4Oe2BzATedkMGkKQqP7dsw8pSnzfzANbZvkqnptOafbMVauJA==
X-Received: by 10.140.94.198 with SMTP id g64mr23631502qge.57.1454771393013;
	Sat, 06 Feb 2016 07:09:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 6 Feb 2016 07:09:23 -0800 (PST)
In-Reply-To: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
References: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Feb 2016 07:09:23 -0800
Message-ID: <CAMKF1srVb5AX4oX2_nEcpKm5icYLyAHwe5bBa8Fp1bqnj05Oww@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] cross-localedef-native: add ABI breaking glibc patch
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
X-List-Received-Date: Sat, 06 Feb 2016 15:09:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 2:25 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> Add patch from commit 96b1b5c127e9e0e637aaf7948cf3330a94a5cd57 to cross-localedef-native
> to avoid broken images built with ENABLE_BINARY_LOCALE_GENERATION set to 1:
>

can you send a github pull request to include this patch into
cross-localedef too ?

>     $ sh -c "export LANG=de_DE; ls -la"
>     sh: loadlocale.c:130: _nl_intern_locale_data: Assertion `cnt < (sizeof (_nl_value_type_LC_COLLATE) / sizeof (_nl_value_type_LC_COLLATE[0]))' failed.
>     Aborted
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> index 03be9c0..3aefe74 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> @@ -20,6 +20,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
>             file://fix_for_centos_5.8.patch \
> +          file://strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch \
>             ${EGLIBCPATCHES} \
>  "
>  EGLIBCPATCHES = "\
> --
> 1.9.1
>
> --
> Jens Rehsack - rehsack@gmail.com
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


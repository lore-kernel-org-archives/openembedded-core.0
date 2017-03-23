Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAD371A54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 16:32:52 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n37so30139819qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wRLomk3JB9vAPWPZrK0vswV7AMi+cI8lrTH8ypdD7A8=;
	b=EF9T241LQ+TsxSk/5eg/BU+wCFrz3FPLfL06mgt1u3iu8us8sf213fJGbgVgbHLEia
	8VJKZwqHFlwDi1zjnRBrw1DPp3Boh4HNrngvUIw/6GGUhSaIbloTjKkmIJkRuKzLyQKp
	eS14wixIjsue+YdQ/Hf13R+CPlAI556+LrNhM6j1l/94ZxRUVWKVpFCXmvLpfQ5ESnW6
	b0jLmDQ1yF3wEw4JdbVbOIrVJNHNyUhg37H5NRI+yjJE79Stw3C1buym84eSQc0MYNwv
	HgKQvZYpAJ2CTv4Y6auJWW2ZVI45KzFY9/2R4saUowewUkhz1fgtcEZQ3QaPOtM9TKM+
	Vm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wRLomk3JB9vAPWPZrK0vswV7AMi+cI8lrTH8ypdD7A8=;
	b=hMW8t1ljGqEMoirkZfsHXXh7Qu97g0Sjb/6t0MpNN917DflyDVa0EootNbMgN/qUBM
	gFPT2f+LHw00uzNPANSrbWkxQWc33haUJe8WfcoSPduKl6OcxRpSi5yo6xXNU4h9hxpH
	cJ8THYlfisP+AkP/PYnRxdAogO0xwKWgqSV4sw/NfeK7aQmMB0Qy400X2BVWneiAgUQe
	tvFVtnCiQmMp4tdMF9LKSygBkST2TSBuW0iVOJ58YkHN4iyunsBtAIr4nLNClotiMvpu
	4mHLwG2Gg6+WxpfiqePPojeZEAUo+U2bkLbdHEXqaJQFyfAiyFOSdET429bXRPfiBi3v
	y8fQ==
X-Gm-Message-State: AFeK/H2PhzjNjvcST3LT6rydLnInFgv64l/rPt/X9oiBhQXi3/bkzyJ1v2XBdioi7N1Eqz4uQowWj19ORBD7Kg==
X-Received: by 10.200.52.65 with SMTP id v1mr3551292qtb.166.1490286773211;
	Thu, 23 Mar 2017 09:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.134.130 with HTTP; Thu, 23 Mar 2017 09:32:52 -0700 (PDT)
In-Reply-To: <20170323161416.8400-1-nathan@nathanrossi.com>
References: <20170323161416.8400-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Fri, 24 Mar 2017 02:32:52 +1000
Message-ID: <CA+aJhH20gsc+zjS+LcaUKBhP7rBrP1jimwu=+A3DqymJWKF14w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uninative-tarball: glibc-gconv-{utf-16, cp1252} for binutils windres
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
X-List-Received-Date: Thu, 23 Mar 2017 16:32:52 -0000
Content-Type: text/plain; charset=UTF-8

On 24 March 2017 at 02:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
> The windres binutils binary which is used for Windows resource files
> requires utf-16 and cp1252 encoding support in order to correctly
> generate resource files with strings. As such when using uninative to
> build mingw resources for a nativesdk target the windres binary is
> executed on the native host, thus using the uninative libc and gconv
> modules.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---

Forgot to mention file size impact, which is less than 40K (for x86_64).

20K     ./x86_64-linux/usr/lib/gconv/UTF-16.so
16K     ./x86_64-linux/usr/lib/gconv/CP1252.so

Regards,
Nathan

>  meta/recipes-core/meta/uninative-tarball.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
> index bbde0d2150..f3fc1ebe62 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -5,10 +5,13 @@ TOOLCHAIN_TARGET_TASK = ""
>
>  # ibm850 - mcopy from mtools
>  # iso8859-1 - guile
> +# utf-16, cp1252 - binutils-windres
>  TOOLCHAIN_HOST_TASK = "\
>      nativesdk-glibc \
>      nativesdk-glibc-gconv-ibm850 \
>      nativesdk-glibc-gconv-iso8859-1 \
> +    nativesdk-glibc-gconv-utf-16 \
> +    nativesdk-glibc-gconv-cp1252 \
>      nativesdk-patchelf \
>      "
>
> --
> 2.11.0
>


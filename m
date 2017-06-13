Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9069E782D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 15:55:29 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z45so520485wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N7CSJaFq2v4np3fQ+fxxIbsWrHCjk/D1UY6FecN8wLw=;
	b=dvfRHOKKo3SiZ5Eiip7KzhBkdMLXLy4nyZaTiN3aNmMq9L8NhPZ3Whgigv+tVWY7gi
	XSsOvnvjyp0mOv5rsvwKt8ROqSoS1MscwhSJpzyW21hiML8GMn0oWsDKqQP3UNo53RQQ
	0jna7CfnD/JNwJvKZ5lIacpUy8nkbFBaaYY6CCwaeCXLVvcAH0uCRslRopf1Xux1vvLz
	ge4m5/e7GPv/gxwQZR/sXIDJUif7CK89iKPg1ws0W9gUVZJzsg3HVsNIx/N+LakB6Qgb
	rntS6Z75MpfYewCPXhK6CuvlN+l6ydpMnWFGsCXZRsVma2UkRmPKaOunIiY8vRuimitm
	l8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N7CSJaFq2v4np3fQ+fxxIbsWrHCjk/D1UY6FecN8wLw=;
	b=Lu+vQAvWWjAp7Q+BEYzfLjakXT6QZHUeeoYAIBsuRr/Wa5W7Du8ETfrNfIgKKFKmCi
	2MpE+RP+Jq5QyXeK0VnMUOFJ0vRf7g+6jLRQ017j+DrhcdhOaJszQSD6yjGxhjXoNnze
	da5lNF6KPoC9FKGGNRYH21mNm7AcWK2E1snEF66SSSkZiXl4lGamFT62LhlVWZO1aWhF
	TVTsdXk/hfRDKz0ZnMUTVo1V5huVDfasksVQubRmCs9tx7doii5eFViN6WpMlp140wSD
	Z1dRll4bQ2XoGrLvyj43tiTkEiYkwjhXF1I15U6+8aQ+irvetNy9nD37UoHyRezRjJc6
	JrjA==
X-Gm-Message-State: AKS2vOxbYkWQU8zcZEh7kUzU+oSHuDOfDithkMYs32dOyPOYecQvHaVR
	Q+7b5RJF8PHSL75Aa5TqJjLd5oACdw==
X-Received: by 10.223.136.131 with SMTP id f3mr3791577wrf.151.1497369330227;
	Tue, 13 Jun 2017 08:55:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.170 with HTTP; Tue, 13 Jun 2017 08:55:29 -0700 (PDT)
In-Reply-To: <1497347392-9776-4-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497347392-9776-4-git-send-email-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 13 Jun 2017 08:55:29 -0700
Message-ID: <CAJ86T=UvrqetBfC0_RgJJbiOUYzEatksZb7txh4H5d7RFaoeKQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] sstatetests: Use higher parallelism value
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
X-List-Received-Date: Tue, 13 Jun 2017 15:55:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 13, 2017 at 2:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Since the processing code for signature generation is now threaded,
> use higher thread values as examples in this code for better performance.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index 8d05e30..feadf3c 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -418,7 +418,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>
>          self.write_config("""
>  TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
> -BB_NUMBER_THREADS = "1"
> +BB_NUMBER_THREADS = "${@oe.utils.cpu_count()}"
>  PARALLEL_MAKE = "-j 1"
>  DL_DIR = "${TOPDIR}/download1"
>  TIME = "111111"
> @@ -431,7 +431,7 @@ http_proxy = ""
>          bitbake("world meta-toolchain -S none")
>          self.write_config("""
>  TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
> -BB_NUMBER_THREADS = "2"
> +BB_NUMBER_THREADS = "${@oe.utils.cpu_count()-1}"

What happens here if I have one CPU core?

>  PARALLEL_MAKE = "-j 2"
>  DL_DIR = "${TOPDIR}/download2"
>  TIME = "222222"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


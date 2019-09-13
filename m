Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1BE7ED81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 07:49:37 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l11so31007757wrx.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zcEfrSUmnVd0ckXzNzEmklsisd3YLSQxXUb4vWUMAZ8=;
	b=NtSfYQZbLW7CVgbaJcyYNlq1q27UYw0y1T1k9TF6IuH+SQN7qZPdmU83y/7x/vywjV
	Irc06WARBeATAmJqHAnqS9Hse1qOZyGkRzPbpgRkmlGc+NW49Ta92RgxwyvorBdVwjvU
	r+OfdOQM5x5xpGisw1DU+PpRB+uMCB2O8nJswbqWMDU1X7UqnuWGpRRJMcySSMxDPEzT
	bmz9GyTfzpoNPFHOUUcjuqnNtLRF5jOogCMoGellWi8u2WPa5fe3Njp2/EKEm+WO9t+s
	Ma1zIJxkH7oOD7qWmFOgbXIhehQYTqABqaPvI1yqeFkhEganhXmNhDBuXQaQKhxEzSqO
	U1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zcEfrSUmnVd0ckXzNzEmklsisd3YLSQxXUb4vWUMAZ8=;
	b=dScO8xuG7uUNLj+8i15iN7Rgd4AFRq7xxhN3Ddc4/c4si06c0KT0evIsKhrPNY+gNm
	kySsltNh7rB7r79VyLqwhfYThSW+RpTscH4BVEHOmmBLzbBlLjOHhE4318qbWhCY6QTX
	OqSGoOPSIeOxNYARsPRZBNEiPeLB6zBfuc1hs/6JPWeZyVORy2ChYfOkTnRBgnkjupXV
	owrhEJdhffIxWCnZGUhpQzuL/ajPB5arjQKuUJQYV3m1AqrE0xOnwB2eGhd9rNtp4mZW
	7Rp7wdV+2uc4LUPT0aW0CgQhFMMhOY9ayW8imlZc1tQKLibS9VYV2N1duFvpM4VQsmpT
	E5xA==
X-Gm-Message-State: APjAAAV3kJSDQN4gYJPzEBZ1Xxz4AqIM4qocXYnW06UGqjNfSN2MfjxM
	AZ+43YuoIhaMrmAI2VtzpwfRN/sQJa/pVPNQpQoQKw==
X-Google-Smtp-Source: APXvYqx9YJmFC4TQ8SByYAuKiPLdKnAxK+WzdM5IC3X2k62wZRg69ZjEocczdhl91DcyfB0/wFpexh+anXZESa/A5VE=
X-Received: by 2002:a5d:4985:: with SMTP id r5mr36252902wrq.71.1568360977180; 
	Fri, 13 Sep 2019 00:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190911160016.12916-1-pkj@axis.com>
In-Reply-To: <20190911160016.12916-1-pkj@axis.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Fri, 13 Sep 2019 17:49:25 +1000
Message-ID: <CA+aJhH1fqiDXgj_dFPSYZnF6rEi3pwAudvi8P6qwJBs6n68Jkg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc-testsuite: Depend on virtual/libc-locale instead of glibc-locale
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
X-List-Received-Date: Fri, 13 Sep 2019 07:49:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Sep 2019 at 02:00, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> This avoids the following error when using some other toolchain than
> the one provided by OE-Core:
>
>   ERROR: Nothing PROVIDES 'glibc-locale' (but
>   .../meta/recipes-core/glibc/glibc-testsuite_2.30.bb DEPENDS on or
>   otherwise requires it)
>   glibc-locale was skipped: PREFERRED_PROVIDER_virtual/libc-locale set
>   to some-other-glibc-locale, not glibc-locale
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> I doubt glibc-testsuite will work when another toolchain is used, but
> with this change it does at least not fail the build anymore.

Just thinking about this a bit more, this recipe really only works
correctly if libc == glibc. So this should instead be a skiprecipe
based on PREFRRED_PROVIDER_virtual/libc and _virtual/libc-locale. I
have sent out a patch that does that, please give it a test and let me
know if that does not resolve the errors you are getting.

Thanks,
Nathan

>
>  meta/recipes-core/glibc/glibc-testsuite_2.30.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> index 64fa8d87df..170e865cb0 100644
> --- a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> +++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> @@ -8,7 +8,7 @@ PROVIDES = ""
>  # setup depends
>  INHIBIT_DEFAULT_DEPS = ""
>
> -DEPENDS += "glibc-locale libgcc gcc-runtime"
> +DEPENDS += "virtual/libc-locale libgcc gcc-runtime"
>
>  # remove the initial depends
>  DEPENDS_remove = "libgcc-initial"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


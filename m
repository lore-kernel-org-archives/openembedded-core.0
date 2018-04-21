Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE736011A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 19:25:07 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f6-v6so6341812ita.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RCbk+ic2+gVRi3DSqxQ0PzNGX4Qh7DlCPHs3peEg8+I=;
	b=VQ/LHqAG+DZeDNcMTjhE1OCtzXN3DiBZYShN2mwq5TgBp8iIREOo5pncXY/7ztSrlb
	6hFu2W5C2ZtKPMzuR3vC9UtYV5ee+pgcJxyFDO1kOHUbiEOMxMgDs2iqnjguEtjBV3Jj
	YRWej64fsIcsfn2AKCJa8bNcSwqZ7P0H3HgmC94CdK/lNLuzG8xlLb4xjrsCYdyV43dr
	svtwnkQBOOleTyiYjM88gMeU1nJ/BaNNSOrN+Cf0rj/0IwuvKqp9Ms37PHktXwRsJCUz
	Y21GnWtmTsjEkcP4Nh5nvCBsAI82sfnz+ikVm1euHQ4oxEyLxvZQ4r5szEWf79XStv8e
	ZPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RCbk+ic2+gVRi3DSqxQ0PzNGX4Qh7DlCPHs3peEg8+I=;
	b=fP8ANGQzSztJG7CqhlKRYRSGTkqhJORTR6QzYG/Z/UckYrP1MPFDzMeWijL9FMySIu
	3pAMKtNUpda/zVxcoyN0FtzLEm9H/gI9ouXZcHrb/sKGfeqI9wYCozVHqM0rkVu0xL8i
	qCK0tfQXHRLzSilqB4APX37i/EI+uKkuaVlMU5Xux79K829JZiwpCxrGDIiYXIFcP75O
	Wm2csm2JSeKzXmAI0BTgVKzgPVKQmWgsUV8yAFOtUOJBu+v0MmZ+Sefh89Q5c7vIIFCD
	pjhCbR6o7vLLOsrJLyxl/n2TIEdQKIrP7aJkaeaw8gPRnmZ7tFQSHJ6JKIdfDgKdK0VC
	n/AQ==
X-Gm-Message-State: ALQs6tBf7WXJCL0WjjXNgGnQ+/6SDvYzRga9oZtZVtsXBRbY62HeMISw
	JX46pYEqjlaZ/bVpgHNs9AvOADfLk8A1+rm5VDlbGg==
X-Google-Smtp-Source: AIpwx4/K6x9RoqBB2jUxqsn501f7XHHl7y0BKhCKH+NVWghvc8USoYh/Y6GV8c0J6V7hYshYPPgbL/x9AIVAP12Rivk=
X-Received: by 2002:a24:9ac1:: with SMTP id
	l184-v6mr7729152ite.127.1524338708844; 
	Sat, 21 Apr 2018 12:25:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Sat, 21 Apr 2018 12:24:48 -0700 (PDT)
In-Reply-To: <20180421131937.13745-1-matt@madison.systems>
References: <20180421131937.13745-1-matt@madison.systems>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 Apr 2018 20:24:48 +0100
Message-ID: <CAJTo0Lam9qfn36w+B15kLFyLnc7srBHAQHxHKrQ3QrmX2=atog@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-runtime_1.9: pass BUILD_ flags to cgo for host-side build
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
X-List-Received-Date: Sat, 21 Apr 2018 19:25:08 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Matt!

On 21 April 2018 at 14:19, Matt Madison <matt@madison.systems> wrote:
> When running the make.bash script to build the host-side
> tools, make sure that cgo is using CFLAGS and LDFLAGS for
> the build host, rather than those for the target.
>
> [YOCTO #12704]
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/recipes-devtools/go/go-runtime_1.9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb b/meta/recipes-devtools/go/go-runtime_1.9.bb
> index a99cc30f63..d5279ea897 100644
> --- a/meta/recipes-devtools/go/go-runtime_1.9.bb
> +++ b/meta/recipes-devtools/go/go-runtime_1.9.bb
> @@ -11,7 +11,7 @@ do_compile() {
>         export CC=$BUILD_CC
>
>         cd src
> -       ./make.bash --host-only
> +       CGO_CFLAGS="${BUILD_CFLAGS}" CGO_LDFLAGS="${BUILD_LDFLAGS}" ./make.bash --host-only
>         cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
>         rm -rf ${B}/pkg/${TARGET_GOTUPLE}
>         ./make.bash --target-only
> --
> 2.14.1
>


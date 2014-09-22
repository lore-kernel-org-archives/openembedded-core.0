Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 090C465DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 16:01:10 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id ge10so6863798lab.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 09:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xHxJBh94hBncQbcumE8S6V3L+R+A/IBNOunprXtBqsg=;
	b=j7USE2F5oFptxKIZ3k543rN0uB5Tff74FzPA4/MEmDvSc/SMxrXOUxzsHNdNnjAbOw
	OADlSmbrUXft5dyEY/UunGRHmwMKs6XtQ6bKErYiKclHm8HwlD9wkeA7k5JOynK89ow2
	Y7MyJS4mAAgdBL2E5OIgYIUYXXyQqS1890KFPu0XgC3SgSGrRQ1vOggYUyIHtO/GxJhs
	CrC4DcRTXSnx9UwjElwtamnN2qyIWx4rB+zYa9yyXp7UnqunBrH9WkOZR0cHbOHrBEmc
	t8EhMAw64olYys5y9VoIQE11QsKwrC0ZeDX8klT7LDmQats1ix4dsAyVQhHO+nhgtn3p
	plqw==
X-Gm-Message-State: ALoCoQla8PXUFyHXVf2tBUZZBKVX625WDr1SKScFCP/bKBxL/82J+3ZIv0O8JJHB7m1IwwNHrKVg
MIME-Version: 1.0
X-Received: by 10.112.143.36 with SMTP id sb4mr25649964lbb.8.1411401670308;
	Mon, 22 Sep 2014 09:01:10 -0700 (PDT)
Received: by 10.112.205.165 with HTTP; Mon, 22 Sep 2014 09:01:10 -0700 (PDT)
In-Reply-To: <65b2b92067da54c7ae1c4dcfee22e317798e6371.1411117403.git.kai.kang@windriver.com>
References: <cover.1411117403.git.kai.kang@windriver.com>
	<65b2b92067da54c7ae1c4dcfee22e317798e6371.1411117403.git.kai.kang@windriver.com>
Date: Mon, 22 Sep 2014 19:01:10 +0300
Message-ID: <CAGNsrLCEAtiAW5GpN7K-6jTuK0EgOyduVAREUyVhVt1gb4A-xg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Kai Kang <kai.kang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] perf: disable libunwind support for aarch64
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
X-List-Received-Date: Mon, 22 Sep 2014 16:01:19 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2014 12:21, Kai Kang <kai.kang@windriver.com> wrote:
> Disable libunwind support of perl for aarch aarch64 that libunwind
> doesn't support aarch64.

typo:
perl -> perf
aarch -> arch

Otherwise, the patch doesn't seems correct. libunwind supports aarch64
since libunwind 1.1 (you need to build with --enable-debug-frame).

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf-features.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
> index 2dbbb47..7de35f3 100644
> --- a/meta/recipes-kernel/perf/perf-features.inc
> +++ b/meta/recipes-kernel/perf/perf-features.inc
> @@ -1,4 +1,5 @@
>  PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
> +PERF_FEATURES_ENABLE_remove_aarch64 = "perf-libunwind"
>
>  def perf_feature_enabled(feature, trueval, falseval, d):
>      """
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


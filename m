Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42D7E7ECE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 00:54:01 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d79so5174240qke.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 17:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0RrMotPt7kXCy0iVYLJuXRXF5REyJNMGUPmLjs+sFVw=;
	b=T2oV++Ta4xBWiLoUIX8oyKsbp+mmEv5IxZbhgJ++ZZ6GklE73PtXNnhH5hgxLIuADJ
	OHGbCLJzCvNWiAxyKqPU0HeRJU94TbeYX5lJPS5m581Gygw3g48rO4/+0uoMYyf+zX+2
	hcu7zXG33p0h3qQ8cwnpy4OHsuV9pDKFh7GHtAmJCL2LcxBfiut3dwcD+p/WCoyYkquQ
	7HsZ1ngpf/w9nKd+lJ+Rmq8qa+wMprnq08RZDa2zPgf9TE2mLkwcY2SeAkmrQW0I5756
	9ibETg2UAYk24XBh7ixgQtpYKlsK3YYBUaOfHuXqHrzxUX9cQb5uqOmmlYfh1z5zd9HS
	T8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0RrMotPt7kXCy0iVYLJuXRXF5REyJNMGUPmLjs+sFVw=;
	b=Sz3RvYGG43zXh+Qt1LrS11UTI2dhOxMx9DeezlYASd0uyBWivsoeBp+f6Ghy0jJFSg
	ZBD+j1+QbNHaWCdxjsHFaTDCy58FzuWQxEK+Y7rwO0jfjBloW09u9KvkuMiuL55WIDiv
	IbsICAmkHx82XCVdmhPvEgFkMtZmlbVzQauzblrCm3v2YFn3bpYIC7pV0WVmrAAl+Aio
	fIJb+v9aKdgc91lsbQ6esjT6oYo5XhWdWYZKYtd77VGZ/pSpqFTJx2sp878bq3s1IlLC
	6sLS7MD6TlfYL0VjBIYKA877Og/uDKhtugPfQUQ8DIAzdSnKBM6uEgOvfSc0riRPbgtm
	Xn7Q==
X-Gm-Message-State: APjAAAUYaEtnvadnZsVVyRFjVOWp0GNaZ2WikTqPjCShpYv+KlzgtQ+w
	lnjVJGru6Br7Nk8tDf3ayCSjcYNWAf0QsOdCrZ8=
X-Google-Smtp-Source: APXvYqzpzoKSBD84CrVhNrP5i+OKVz6AFOsqm0PVoTyEho1cUUjvl6HIzxQ3+HcYrC7KMCfJMNEy0Y8e3czMWwct7rE=
X-Received: by 2002:a37:4243:: with SMTP id p64mr4177681qka.9.1562892842805;
	Thu, 11 Jul 2019 17:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190711235423.23013-1-ross.burton@intel.com>
In-Reply-To: <20190711235423.23013-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2019 17:53:49 -0700
Message-ID: <CAMKF1srPCffyPSbQ+_QAd-3rDh4=X8TgDyp0abTPT0fS+9WBhg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ninja: use Python 3
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
X-List-Received-Date: Fri, 12 Jul 2019 00:54:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 11, 2019 at 4:55 PM Ross Burton <ross.burton@intel.com> wrote:
>
> As part of the mission to remove the use of Python 2, explicitly bootstrap Ninja
> with Python 3.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/ninja/ninja_1.9.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/ninja/ninja_1.9.0.bb b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> index 1b063289614..f1236e8ac82 100644
> --- a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> +++ b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> @@ -17,11 +17,11 @@ S = "${WORKDIR}/git"
>  do_configure[noexec] = "1"
>
>  do_compile_class-native() {
> -       ./configure.py --bootstrap
> +       python3 ./configure.py --bootstrap
>  }
>
>  do_compile() {
> -       ./configure.py
> +       python3 ./configure.py

Maybe we should encode it in interpreter section inside configure.py
itself and upstream it.

>         ninja
>  }
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


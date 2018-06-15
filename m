Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id A237871CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:54:55 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id k14-v6so7046393uao.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 11:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=AKjoJalzf8jqPueP4kPi/bDJP9GAbMpZ+7fZLXqEewY=;
	b=gOxOIo+R1gG5JVn5LAMDkCubD0BQyoWSCQPnNlPQgJ1+/4hRQYeGmQ1rmP3FNP/ejI
	tM7D/QqRVFUJ8BKHkj+Z8mtLbYy6xMv73vGBI7FSeJU4WllFZ5LbUj3v+B+fFNAIugSJ
	wxSnhh4BTWS7/x0BJAUrhX/E3PJDj4fQhNYvUowdOQ1cInfkatL3u6uvNjgLoQ4iNCbs
	LNgJ9uhZoEnh5eH1Iim/224QZwD/FIhmywNVnPctbEYMjlrKp+0VTHKh+45Is8SqZVuz
	jxRdMiKBdNsf2SVksD1Zrrs9DJ2my2C0X6qRGSHumP10uAyQrO0bxoYL0SK1G4XTzfm/
	Zw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=AKjoJalzf8jqPueP4kPi/bDJP9GAbMpZ+7fZLXqEewY=;
	b=SfuOGeSpA4qi7hqqRthVmKjDE5BtJqgnkEe2CkgxAkUXdv1Cm1JNfjdUMoejswDsTs
	NzJUEtp79aSwlnyYdCpGfu/P0rZUiEgNLtYeABZn+ofiBtKpZhPxZ/di4d694ZriECgP
	2++nlwXKlsZzvyQWeVZvAYpGFbdyJdEl0YKabayI9kA/4VBRVCkary+wVYwhv6z60OsI
	eWtxl7SR5gtNv5DtyL971nLb/4/18+sJy4772UfO8yaRwVUwY3411cp0GzTyqvuVCiAC
	/AzifLGmlREAHgl+hwXr8A6hh/SGDNY/DKBKxyAYNePsJtm7dYIKukLumNGZnLEsvMfn
	DI+g==
X-Gm-Message-State: APt69E1k4xR6ZvcjIXR46fcXbepKgsr2uc64HAPi6ZRDXqUXCoVzoQY5
	QfJaqdSeMZe7G17jSm6VyVgyFsWmggss3Q9MS60=
X-Google-Smtp-Source: ADUXVKK55SZUNG+iSRQzcbiF2n2dET1uYfLG914152Rw1aiVs/PWBe+my5eHYWauYK2iiAkj9kBI4TLQPVZpsMH8/n4=
X-Received: by 2002:ab0:50f0:: with SMTP id
	d45-v6mr1903449uaa.45.1529088896133; 
	Fri, 15 Jun 2018 11:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180615075618.GL31886@vctlabs.com>
In-Reply-To: <20180615075618.GL31886@vctlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 11:54:39 -0700
Message-ID: <CAMKF1sqHeUyehiWW+_WsXST4Az8m0Fq6sTQLp2U1cXfKm2QeHw@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: consistent set of features for nativesdk
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
X-List-Received-Date: Fri, 15 Jun 2018 18:54:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 12:58 AM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> Enable use of pread() and enable column metadata API for nativesdk builds.
> This brings nativesdk in line with target and native builds.
> ---
>  meta/recipes-support/sqlite/sqlite3.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index 95ec89c..30847b9 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -37,10 +37,12 @@ CFLAGS_append = " -fPIC"
>
>  # pread() is in POSIX.1-2001 so any reasonable system must surely support it
>  BUILD_CFLAGS += "-DUSE_PREAD"
> +BUILDSDK_CFLAGS += "-DUSE_PREAD"
>  TARGET_CFLAGS += "-DUSE_PREAD"
>

Perhaps, we can just add it to CPPFLAGS and remove all three lines above

>  # Provide column meta-data API
>  BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
> +BUILDSDK_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
>  TARGET_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
>

same as above

>  PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
> --
> 1.9.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


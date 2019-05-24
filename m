Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C188A7E4DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:59:03 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id i125so6666410qkd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZcB0skvA+XaVjBIXQlWy+qdBp7RW2dkumYnJSSvamWg=;
	b=mSgLW9nHxQE2IhmfaY75A7W04kimT0aZhvEDkopPQYzRKV1T1awgiPkM5LeDpL8IPY
	qttI/BM6TNlrIGIHK/qBRCCgB3/oYTMwAMIqBSXdKLb3uQGGdO+8ag7xwMIMucRUO9aJ
	0teVGo+xvQklk4xaB9iDrWU39chVWX5lmPZjfWm1ECMB/EraIYvhb8x0AmeI7T1tu5Jb
	gUnodHeO4oxSrn3GfhXmUL5wqpS+bXp4+YYqqFeJjhYZzVkICB5ACpT/99JAJLhwJbRg
	NYYJJlnVtHdljW//clIv3gXK2M0qFE2YeC67vgYlan30fSGWgY70JyKcXCmWjaJLkkH4
	WQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZcB0skvA+XaVjBIXQlWy+qdBp7RW2dkumYnJSSvamWg=;
	b=myjAxwCRkfCcv+hFPTwMrGCTHqGXwrlpjKDQ+e0Qs6A+h1TxQQCEzKrnLK63fwxgHw
	opFNgQjDYInlMpejyHR3zTY3x+ZCFNby1+8CQuvNLERRwQIJo4NwHML6/Ag2GbuXUGOd
	lryokbwix+BNQaTZW9xryP/F0AcIaPDf8BRHAG6bKN+NbljG5P5aIJFUmoHhlpgdAS1s
	liTdzXSgWKXFBYGvqQL0FXAyaAcucbx6XY3Jx3kz8MRoV3ec5IGGFIdTdFIV54IyBjka
	fb+1PCRE18q0rbatCZJMVbAC+NMEd0imxFtcZ1AS92UTukLzfWFjq6uZ3BHjWiR/Nqsg
	zK0w==
X-Gm-Message-State: APjAAAXkMJ1qVAbMn1rzoibJ5ordKp/Ftyrew5IeCKUO/GxBobR9Vwqk
	YM/tdgefY7SaNfvmdQo5/fvZxiR4+sx0fLaAB34=
X-Google-Smtp-Source: APXvYqzDb7Fc66QlFYl66OQEbq89l5ke+9QM6Qx2XSnPx7GhHlsaT2mysrtdW3rsrWSmobPc00wj+ZqBPt6RfoUGupg=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr82084656qkb.24.1558720744514;
	Fri, 24 May 2019 10:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558664136.git.Qi.Chen@windriver.com>
	<ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
	<17c3408af1ebd7edc0f9c99c0bbec3617e8885b9.camel@linuxfoundation.org>
In-Reply-To: <17c3408af1ebd7edc0f9c99c0bbec3617e8885b9.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 10:58:38 -0700
Message-ID: <CAMKF1so1cOr78PRop6cLi+w7GTSSnKgniOpNyJxgDU_EVSbkfw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: avoid musl specific patches affect glibc systems
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
X-List-Received-Date: Fri, 24 May 2019 17:59:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 10:31 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-05-24 at 10:17 +0800, Chen Qi wrote:
> > systemd upstream only care about glibc. We made musl specific
> > patches so that systemd could work. But currently these patches
> > contain potential security issues.
> >
> > So apply these patches only when the libc is musl.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-core/systemd/systemd_242.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-
> > core/systemd/systemd_242.bb
> > index 2dda0d0..adb592f 100644
> > --- a/meta/recipes-core/systemd/systemd_242.bb
> > +++ b/meta/recipes-core/systemd/systemd_242.bb
> > @@ -27,7 +27,7 @@ SRC_URI += "file://touchscreen.rules \
> >             "
> >
> >  # patches needed by musl
> > -SRC_URI += "${SRC_URI_MUSL}"
> > +SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') ==
> > 'musl' else ''}"
> >  SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-
> > available.patch \
> >                 file://0002-don-t-use-glibc-specific-qsort_r.patch \
> >                 file://0003-missing_type.h-add-__compare_fn_t-and-
> > comparison_fn_.patch \
>
> Doesn't the usual SRC_URI_append_libc-musl = "X" work?
>

yes this should be better, SRC_URI_MUSL was introduced so someone
could override it
but if we make it optional then using override is better I think

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


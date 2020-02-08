Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5716160B73
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 19:49:58 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id t17so2429859ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EXNY/UKtoSdCgE6ev4b7hQ+92Hdm5pwFZXwxNUbtRB0=;
	b=OyKoG1DsDbyimu+ESfPX7M9V45FKmID1u5HXvrJUzTH3genlGyyjAJ/5RpABSrHTzP
	z50Rssg92FySnuNmGDpVc0S9mogE0R06gK6n1Xqvt/Vaspynqo1qEcFiB3tbCdF40RLS
	F+HhyCV5td/Rcx9Tbci03l7/joIfjvDOpUBjBfCGPrcnUNvLlyFQXQxovwrKGpjcMx6r
	CWUz8GZ5U3r/xNTixpvxAEptOWX8p+aH2ShWpWDW9rJZaQxG7wEZNJ1BfbzdnVzsaiPy
	fqgKvOQnEsfVFuPU/LKEH2SSSnY7MIHAUZAIMMzEieP9fMAk5M22PK0brpqRPse6UglH
	lseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EXNY/UKtoSdCgE6ev4b7hQ+92Hdm5pwFZXwxNUbtRB0=;
	b=IMJQ/R14MxsqK+xn/uszNTnAzFyUWVctZfRLJVITZwWviY7/sRWTP+1XygQF7vbVCA
	WnioGfFhmuTYyY+i6UbcOSrkH15mHHf0fYXzU/ucLmVKkKebkfJpFKblha3pUWWkx9nm
	3Zq1VHS4+/hMmjwkrkx5nC4U9tgQ622kGEpi+hYfdG+bw2mqZCIXmmjnR5oiuGsL5ULN
	+XcjQn3u2dynWd0wbi8O16hGq3UNreEUCr255bcj2qOU3z57g4SY6up5pl3np41xe+qe
	I9bWWq53DimuI+g9hSKq61+KqYw1H6lDLfPWFiRIi8KSEnqNhHGdOVUr7PuNkOS0Gtll
	2E5A==
X-Gm-Message-State: APjAAAXE4ITHeeJ1qSF2orMchZuSJWPPqfItywxtmKrhz0WcMajIgTeR
	6JfgRaDT73r14U831qqZzE6W7gCG7YKi/Fdyvo17/Q==
X-Google-Smtp-Source: APXvYqyun4YmSiIdHeGJHoHJ/DrMswZbOqf1W6jaPzeKq4Y+LX098C858KmjXIfhGXejCmV5mlVprF0QBEXsUUv1p7A=
X-Received: by 2002:a92:1bd0:: with SMTP id f77mr5560443ill.115.1581191399262; 
	Sat, 08 Feb 2020 11:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20200130045446.44017-1-alex.kiernan@gmail.com>
	<6403172746ac0772f8c6d0f55838bebe5368e1e8.camel@linuxfoundation.org>
In-Reply-To: <6403172746ac0772f8c6d0f55838bebe5368e1e8.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 8 Feb 2020 19:49:48 +0000
Message-ID: <CAO5Uq5QyV41xO28M7VJSKpFqpOtPpY3sUcJmNk_kukAuW7xx9A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] rootfs-postcommands: Remove spaces before ; in -ROOTFS_..._COMMAND
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
X-List-Received-Date: Sat, 08 Feb 2020 19:49:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 8, 2020 at 1:25 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-01-30 at 04:54 +0000, Alex Kiernan wrote:
> > With spaces in ROOTFS_POSTPROCESS_COMMAND attempts to remove elements
> > using ROOTFS_POSTPROCESS_COMMAND_remove causes parse failures of the
> > form:
> >
> >   bb.pysh.sherrors.ShellSyntaxError: LexToken(COMMA,';',0,0)
> >   followed by:
> >     LexToken(TOKEN,'write_image_test_data',0,0)
> >     LexToken(COMMA,';',0,0)
> >     LexToken(TOKEN,'set_systemd_default_target',0,0)
> >     LexToken(COMMA,';',0,0)
> >     LexToken(TOKEN,'systemd_create_users',0,0)
> >
> > Removing the spaces between the function name and semicolon allows
> > the list to parse correctly.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/classes/rootfs-postcommands.bbclass | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> This does sound like you're working around a bug in shlex :/
>

Yeah, sorry...

I'll see if I can go and have a proper look at the underlying problem!

-- 
Alex Kiernan


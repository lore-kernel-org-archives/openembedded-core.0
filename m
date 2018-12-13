Return-Path: <anders.roxell@linaro.org>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id AB98D6C0C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 12:39:48 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id r11so713609ybp.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nuGjjqQ0Eqs3H4KzQROFFyYBbLTPOVIhuGXeCVd6aQE=;
	b=T3YrTRdH/cA/YPTsBRTSWwjX+NlPr7Vl1HaoDdRxvqNLQzXgW70OzfemzaD+Q22mwM
	aOiJj0uI6wQlnAhUuAkVL5aVokqm+Alu/mXcu/p+4aLLUu3yeZv+RKRAvmEvt8HzOFxa
	XFjl7wg2oLCA94R5cYAq5ZDs3M2FeQ1f6P+a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nuGjjqQ0Eqs3H4KzQROFFyYBbLTPOVIhuGXeCVd6aQE=;
	b=CThScMOkoDPUinulbGOw+Z7sMgMat46LQyus5oHMNjKxI8EbjycuA8LpfrY8uZFmdm
	i/D9LAu25CBwQO4alk22sxPdGivlfiM3Au8GM0urnLcgok0Wk8PF3WAqjTzH8JQh+3hm
	gqMcb+g+EMwjSJ/VHmpPFRrIwAIBRHeGj/RwStKl1uxzczwMmYA82ePhfjBcwz8gIzBW
	CsqeprAVfyi8X6X1P2rcVBkkGNaa1ycccdZtAXx4iUMnMceZEb96YlWkOGcxIFzguvrT
	6A8YiSMKOiJk5wPPHoZuevh2dOvsG7vggUeTj27PvKsVgqnU5SBfbZLT+z/oArOsFFWc
	9Gvw==
X-Gm-Message-State: AA+aEWY7fughvXlj24g9ER9UEpXFxvXx+D+hayeVr6tupKXndGQNz82j
	ybRR/hrgs7wBijaFG2XeJX9Ywb+lH6ZVWXA7iE6AZw==
X-Google-Smtp-Source: AFSGD/WMHowSYcPg/8uXfg6ERqXB9wxyYVM1f6doJcqpj0tFI1YEabcfsR0i5C6JRPapXVu/ghu3SjJp4ZmBB9QvqiA=
X-Received: by 2002:a25:af04:: with SMTP id a4mr9068874ybh.195.1544704789345; 
	Thu, 13 Dec 2018 04:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20181213105006.19131-1-anders.roxell@linaro.org>
	<CAJTo0Lat5WK1ne7B0evFMWu2mTzY7j+Tt48_9ACoCnOWr939jw@mail.gmail.com>
In-Reply-To: <CAJTo0Lat5WK1ne7B0evFMWu2mTzY7j+Tt48_9ACoCnOWr939jw@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 13 Dec 2018 13:39:37 +0100
Message-ID: <CADYN=9L-JFFH3SFLhHDhaSf1L4fa8V-5K3AedtH7wFe7BUcVOA@mail.gmail.com>
To: ross.burton@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: add coreutils to the HOSTTOOLS list
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
X-List-Received-Date: Thu, 13 Dec 2018 12:39:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Dec 2018 at 11:58, Burton, Ross <ross.burton@intel.com> wrote:
>
> Did you test this?

Yes, but _not_ I was in the wrong build.

I'm sorry. =/

Cheers,
Anders

>  HOSTTOOLS is a list of commands, not packages.
>
> Ross
> On Thu, 13 Dec 2018 at 10:50, Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > In newer kernels fold gets used, see output from a build:
> >
> > .../kernel-source/scripts/atomic/atomic-tbl.sh:
> >    line 183: fold: command not found
> >
> > Rework so that coreutils is in the HOSTTOOLS list.
> >
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  meta/conf/bitbake.conf | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 64800623545e..a825be4628b0 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -478,14 +478,14 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
> >  # Tools needed to run builds with OE-Core
> >  # python is special cased to point at python2
> >  HOSTTOOLS += " \
> > -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> > -    cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> > -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> > -    head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
> > -    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
> > -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
> > -    sleep sort split stat strings strip tail tar tee test touch tr true uname \
> > -    uniq wc wget which xargs \
> > +    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm
> > +    coreutils cp cpio cpp cut date dd diff diffstat dirname du echo egrep env
> > +    expand expr false fgrep file find flock g++ gawk gcc getconf getopt git
> > +    grep gunzip gzip head hostname id install ld ldd ln ls make makeinfo md5sum
> > +    mkdir mknod mktemp mv nm objcopy objdump od patch perl pod2man pr printf
> > +    pwd python2 python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed
> > +    sh sha256sum sleep sort split stat strings strip tail tar tee test touch tr
> > +    true uname uniq wc wget which xargs \
> >  "
> >
> >  # Tools needed to run testimage runtime image testing
> > --
> > 2.19.2
> >


Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 322EE6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 03:00:43 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s13so964929plq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 19:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4TTsXtUQW2KpuhYkzNPu9pduYG/JQF1BHWcDTGfA4zc=;
	b=QCp8hh5+2OS8lAsHSyj7ZR3lQvO8Z3hYyvSMdABiuRxDKoIY8XuBMzlKFeBjlI5I6O
	vuW9nwMiXuOdM2Qya30wnVR+sgTv9EAIcWywo9sSpgM6zxiD0GWLKCQaqxmE/WF7cFpM
	1bC6s+T3x/6CJ88RRIPy8lykTpoXu3xwViCvm++WQGVPJaKMHqgwkOM6dpVnM5DKGlYO
	olg1dAVpiYspChkzTs7tNn8QZ61nPhAzpH4Hdy/i80FdAFQDJ2oqQZOTJmdz+5SrZNnW
	UQZfPyI+5qbO7k4zQzwBokRzBhkR4wPhT6mGKYd2EZWCH15felGpbY5/ErlqUFKwhuWo
	p5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4TTsXtUQW2KpuhYkzNPu9pduYG/JQF1BHWcDTGfA4zc=;
	b=pa+8PtlkA5OF4/pzSHwEVKtR00iEukxS9CsjLf5VrIu6EBhQ0xtK+DGX+5POR4ckBt
	IGpomRvbul+N9QnuOYS+9JYEqNKkJklcGWTfOi+QgqjndsAMW6SFPX9ukuuEvpQu84OS
	wRtgeIyMRj2zJv0wNvETrWT56x0kYK7PGbUR6Le+ZmmtMA7IKDy4O++tDssWd5Zsuuyo
	s86dno5LSQ1CzOewGxcUOo1wbKUz4Vl8EpqadC3Y+de4/fCK3Xwi8FzNDYVDv5Fq3mFW
	h6Mj6crlejdQo2PR7Ih8moC1Z1gjnE1qI6bGvN1axG0w9miRPN4gv3mC6vO/nprHzoIm
	DlrA==
X-Gm-Message-State: APf1xPCiIEolydvO3b3HvEwsVhGlM4M/r1PhSXwLu6D6LrOj4TRdbHK9
	uXuwKcNcLJGBhe8/00ZdPzSESMI9zN5We/1DRbQ=
X-Google-Smtp-Source: AH8x226ABcY+ochUjeaTMdUcA1+Mh1VAlJHDmFmxjgkd+qTw6Vfp+owVEHM3j6+uL/AWFw8Wzs/DTFD1mMRkK15LqEw=
X-Received: by 2002:a17:902:51e9:: with SMTP id
	y96-v6mr4465463plh.344.1518750045345; 
	Thu, 15 Feb 2018 19:00:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.207.166 with HTTP; Thu, 15 Feb 2018 19:00:14 -0800 (PST)
In-Reply-To: <1518620874-23886-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1518620874-23886-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Feb 2018 19:00:14 -0800
Message-ID: <CAMKF1srMQk4f4hYqEG7985uWowBAYrQguPdBuK7cHZQauXgQcg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] package: Add INHIBIT_PACKAGE_STRIP_FILES to allow files to remain unstripped
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
X-List-Received-Date: Fri, 16 Feb 2018 03:00:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 14, 2018 at 7:07 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There are cases where its useful to allow only a select few files
> to be excluded from the package stripping mechanism. Currently
> this isn't possible so add a variable to allow this.
>
> This is to be used sparingly as in general the core code should be
> doing the right thing. This is better than the alternative of leaving the whole
> package unstripped.

This variable should be documented in manual as well IMO

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 6a7f35a..90e5236 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -946,6 +946,7 @@ python split_and_strip_files () {
>      inodes = {}
>      libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
>      baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
> +    skipfiles = (d.getVar("INHIBIT_PACKAGE_STRIP_FILES") or "").split()
>      if (d.getVar('INHIBIT_PACKAGE_STRIP') != '1' or \
>              d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
>          for root, dirs, files in cpath.walk(dvar):
> @@ -961,6 +962,9 @@ python split_and_strip_files () {
>                  if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
>                      continue
>
> +                if file in skipfiles:
> +                    continue
> +
>                  try:
>                      ltarget = cpath.realpath(file, dvar, False)
>                      s = cpath.lstat(ltarget)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 62B47795E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:29:27 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g13-v6so7869450qki.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MYt5znOJSCnYcyPLrV+ttRIc0rkeOVXGgsIYLhYDLpM=;
	b=RwfJ5zsO6r3WjikBmgPX7V9rwlaerc938r4UyNv8dhErbrIJ932ak3c7fG+ARrzIw1
	mJzFa4VZZkkOtvMMFbarle1oin9wcTfEIhO16zNxFIMLL20c21+9A7dh2LQdOXvYcmcr
	XPCo9dw3r0H6wtUmzAe9PhuPZ7GneBwWrnEnp/ETwuTllK8q7AWt29UPS4PVqhn7rkZn
	LIJHMJN8XX8IW1hZChOpJJDhLd0Jg7BBVSLk1Fjy6qNNZu5EH7kmXJEKNpX10K2TOpaE
	KCeMLK8oP83+i/DVsEEXCbregfRzKmR3H8B8nI+0QmlQ3SrHKmU3VgkM7q7mQKvACjY8
	qMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MYt5znOJSCnYcyPLrV+ttRIc0rkeOVXGgsIYLhYDLpM=;
	b=m8QHTT9BeldjOJ1xkfXqYhyV4BOEX51612LC4pS3+xSdFp9qRf+i8oTAfSA7g+McnJ
	GYQTQ7brdk6iOcYjgJRpWSqYCyn5MNNnrpwEsqm8K55z73c8Jp5lm3czt+Fs9RBF9urX
	JKFhBMF/nyet90GUtzITC75JFgIO4ZHle49exNo/yBNn3VaaJ44YGRR5Uoud9E6ma7Lw
	crfPe2fw/tR3uPWwUibjO04MUnXPde9uVFzqPye3OeLX6JHNNC18uP0cHgoxyqyMJLBX
	tEWFoVSrAnr8vDrUo124SFkaTMdRH108kk6W66cJhzanqOfqJJ3+Suo2kP3N69F9Yd2J
	ia7w==
X-Gm-Message-State: APzg51AKiMJDuaJaJIAR6XR4KnUXPz7bga9/GQhUs7T/utvU6qnhqZLT
	aao0wWYpRW9dJ211/w8FseN7Yw/71XY7nDAUImFC3Q==
X-Google-Smtp-Source: ANB0VdabvuZXLNDGfAAqgEjaZfMoxHgQHRMDDiejQlLdPitIHlC+JzmKa+0Xd1Gii7sz/Env2E72s7mkKdW8XNLWNKQ=
X-Received: by 2002:a37:c04f:: with SMTP id
	o76-v6mr2897308qki.315.1536254968106; 
	Thu, 06 Sep 2018 10:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180906135533.18664-1-trevor@toganlabs.com>
In-Reply-To: <20180906135533.18664-1-trevor@toganlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Sep 2018 10:29:00 -0700
Message-ID: <CAMKF1sqJ-ZS6K9CLf+dk9NP46tzdZT8Hg80yoD6_nO8D0pKVxw@mail.gmail.com>
To: trevor@toganlabs.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: PACKAGECONFIG for tui
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
X-List-Received-Date: Thu, 06 Sep 2018 17:29:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 6:56 AM Trevor Woerner <trevor@toganlabs.com> wrote:
>
> Allow the tui (Terminal User Interface) option to be set via a PACKAGECONFIG.
>

seems harmless

> Signed-off-by: Trevor Woerner <trevor@toganlabs.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 039577b8e2..52476b6146 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -20,7 +20,7 @@ EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
>
>  EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
>
> -EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
> +EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
>                  --with-curses --disable-multilib --disable-sim \
>                  --without-lzma --without-guile \
>                  ${GDBPROPREFIX} ${EXPAT} \
> @@ -36,6 +36,8 @@ PACKAGECONFIG ??= "readline"
>  PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
>  PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
>  PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
> +# ncurses is already a hard DEPENDS, but would be added here if it weren't
> +PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
>
>  GDBPROPREFIX = "--program-prefix=''"
>
> --
> 2.17.0.582.gccdcbd54c
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


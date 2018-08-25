Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6E71879164
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 00:17:22 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id g44-v6so11366563qtb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 17:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2vO4ds1dxl5XUT8zTej79EvCQVbY4BUQPh2J1Uspq1M=;
	b=QLFgft5IRhkiPbw0bY9d7EcdzCHu8YRL8+ng8mSeVttPBb/2Ja18p2OLwZBvDag0Bs
	lDS5P031D5EJulOxEJRe6qc4nCubU8QFUyVUyJmSjWgC10yL/JBxeRsW8QFTnVs8nD5u
	iJDmf2z7KbFfDTOosMlDu63PHsC/duDOMY1UyeiaeEEWl25HKC4uumT4xoWfcW8+z9QN
	6xW03mfoNK7mvNX9zcw/SJF1oSgXUS2df6KxXFZxUiBds+NBsiep57L15kKHNWbotjzZ
	+jGlfOKc1suaPwcK5Yp9+sgmF/2/g/K2xm+X7bMU8OJGroOPGLfpJoOLbWn90oyXiyxG
	zgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2vO4ds1dxl5XUT8zTej79EvCQVbY4BUQPh2J1Uspq1M=;
	b=RA+xxOqO2lLBxYV404feLLeUMsFhV2CnXzu3OOQDD2UFfaRR4M7XhXmw/uCp7YCHrW
	tjMWH8BqrYHho9VAS2yVF718vdQHYLMx+TgMDpnvJbeAQ06Vf0pY+1q2gXtKmM+IGcjv
	GboY2eqwuixHrzUlB1mvwB61fKed7Dq9EzhuCU0H8wxeH7/b8q2XxPCViSw9FJcFNzMx
	SSxfJsvV7MYpTWy4u+P8wRBvzooYQ3wHKOr/w4n4xjYXXpIenDbNKsN/PpnARpF0tuxX
	49hImZSD2xapRaPJVp+JjiAlqidO4w2Fw3F4y6iaGLZ6M4weIo0iVoS/oXbDZF73SF6l
	ylqw==
X-Gm-Message-State: APzg51CLuK4IiaOaB8o0vEjG+kh8bQlz5VDo4EAOtqhs54vQHPJFNtV0
	TirbIncEfDB12UeXZIXkpKZTSwtFuV/W6LiFTbI=
X-Google-Smtp-Source: ANB0Vdbx6cim/YsSrRJfI9lHQD5RbymMNsXqrlGt5JuAXnTHOCVXsR9aDCl3OSdBSTaZ8ykt6kFmTt4isWKPX0gx8iw=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr4227263qte.218.1535156243007; 
	Fri, 24 Aug 2018 17:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
In-Reply-To: <1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 17:16:57 -0700
Message-ID: <CAMKF1spvcJfbdET14z+cjR9P-rCyWtXnb87G9wg=GC3zxDbiYg@mail.gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][sumo][master][PATCH 2/2] base-files: respect PERSISTENT_LOG_DIR
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
X-List-Received-Date: Sat, 25 Aug 2018 00:17:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 17, 2018 at 6:00 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> Respect PERSISTENT_LOG_DIR variable. In this way, if the user overrides
> this variable to be e.g "/home/root/log", /var/log on the final image would
> be a link pointing to /home/root/log on persistent storage.
>

I would suggest to stick with VOLATILE_BINDS

> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 1c0863b..597fdaa 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
>             ${localstatedir}/backups ${localstatedir}/lib \
>             /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
>             ${localstatedir}/volatile \
> -           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> +           ${@'${localstatedir}/volatile/log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else '${PERSISTENT_LOG_DIR}' if d.getVar('PERSISTENT_LOG_DIR') else '${localstatedir}/log' } \
>             /home ${prefix}/src ${localstatedir}/local \
>             /media"
>
> @@ -106,6 +106,10 @@ do_install () {
>                 ln -sf volatile/$d ${D}${localstatedir}/$d
>         done
>
> +       if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False -a ! -z ${PERSISTENT_LOG_DIR} ]; then
> +               ln -sf ${PERSISTENT_LOG_DIR} ${D}/${localstatedir}/log
> +       fi
> +
>         ln -snf ../run ${D}${localstatedir}/run
>         ln -snf ../run/lock ${D}${localstatedir}/lock
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


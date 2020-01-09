Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id C921B7FE79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 02:30:44 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z193so5518965iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 18:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=5Neok7LCTfwtzB8/Vh54wz7MTWkfshOUS96r+/HRT3w=;
	b=g9Dzb693K5Df2gPaIgx/td7LcxqXfV11mvZ4I0KiUX94Ewi9YeFasn8aA3Spo6aSG1
	A7dzWprZhjr3Ig9XlzSJMTbiIazsJBpg5itDZ4iAP6fAfi7J7Z5jRgPBiLHpN1uBufdO
	oBzTTIxQ6zJ/uOxL2wWkhweR7bys6ciTV5J1OCFeETpp8LIQkLlXdKg1LDkyLNqztiog
	O16i7Fw0W0i+16vGSmsyutyDuAsGxgIZVIJdXxRJc5R7dZtAsVnQ2EkAR29F4U4UcPzy
	ssaqyBWV+nj7id/K1RHqD+DIZxW3Lu4U3//jG7nC7hGw5wEvBorjuaCsonx7ghf8h+aL
	UjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=5Neok7LCTfwtzB8/Vh54wz7MTWkfshOUS96r+/HRT3w=;
	b=sTN+CcyIGsSIWz3vZQq5JmQHWPtJR/q9qtAgaSZxcRffGqLitUpV3xW1pZMk8fTBJg
	C6WdAEOmJw29qQEd2kpJn62Qj+qOM1PYsGL/KLyIaHdIRVmLR5E06PvOi0c9yq7s6cOB
	3/NC126yIh2qt4V2FULSCzY6hHyq1ChpjX5DPgodtNo+MFhoLjj8bfYDVPAKCdiKTxa6
	YgYsii9pRkxT8bUpEdcd3r2feOk3W5FwlmwSOEPIPzVTYeInfImJSbcijlH5PjB4M6Hq
	X8Oz8J/t/IrycLuxopeplPWISJ+lXrRSS9V8oVToGhj7iwQBJ/pF5kgOAteJAgxazqIl
	jUtw==
X-Gm-Message-State: APjAAAVvdQCweHaokyXSsArcFEvH8DFFWltxN2DA9uV4GfJfuZR6ua25
	MV8cM+hl39b2fjcDQlnBqHhpnn3wcyYyJbaSFD4WGg==
X-Google-Smtp-Source: APXvYqxqUFxB+h8zcGiyi39F74hIE1Prg7ztvQQlfDHw/ClqJCZXdKhqjeCFeNbKCrYL0tGT/Yrtd/tIAOU3nDWhQIE=
X-Received: by 2002:a6b:7a45:: with SMTP id k5mr5853030iop.115.1578537045441; 
	Wed, 08 Jan 2020 18:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
In-Reply-To: <20191219221748.27079-1-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 9 Jan 2020 02:30:34 +0000
Message-ID: <CAO5Uq5SE6S+f6Xfctp-CGHd7+4j3J66YnxzL7J+QepbV-EKLdQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] manpages.bbclass: Fix rootfs host corruption
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
X-List-Received-Date: Thu, 09 Jan 2020 02:30:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 10:17 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> When running mandb we end up with files owned by the build user, correct
> this. Also pick up non-default locales and relocate their index.db files
> to /var/cache.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---

Ping?

>
>  meta/classes/manpages.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
> index 50c254763e89..1e66780646ea 100644
> --- a/meta/classes/manpages.bbclass
> +++ b/meta/classes/manpages.bbclass
> @@ -18,8 +18,15 @@ pkg_postinst_append_${MAN_PKG} () {
>                 if test -n "$D"; then
>                         if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
>                                 sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf | ${@qemu_run_binary(d, '$D', '${bindir}/mandb')} -C - -u -q $D${mandir}
> +                               chown -R root:root $D${mandir}
>                                 mkdir -p $D${localstatedir}/cache/man
> -                               mv $D${mandir}/index.db $D${localstatedir}/cache/man
> +                               cd $D${mandir}
> +                               find . -name index.db | while read index; do
> +                                       mkdir -p $D${localstatedir}/cache/man/$(dirname ${index})
> +                                       mv ${index} $D${localstatedir}/cache/man/${index}
> +                                       chown man:man $D${localstatedir}/cache/man/${index}
> +                               done
> +                               cd -
>                         else
>                                 $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
>                         fi
> --
> 2.17.1
>


-- 
Alex Kiernan


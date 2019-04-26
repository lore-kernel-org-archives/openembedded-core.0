Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBDD27D69B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:14:11 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id t23so1982790vso.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EyrNH0p9OLepySqWde0ujwNlvAi4Z7KbiRZzHo9g61w=;
	b=vXpEnl1aT/Zmvr9xDpEPEVLqv3O32SF2fC11Td0p4YqiQF8JW0jhq1BWOFV8Z50PqH
	p7/6cLUqExzxOR5VxTXjswIDin3T6hSOMKPfc2fOKSaJm92AR0ydpUoLva3qISCju7Zm
	iLoCgHL3unewAEGkiqgY+mQfOkJOeU7dv2eSaZnfVuPtP9ItFP6SnBzrsb8eESSeRVW4
	kJ4m6ZfoD5b3+IU2sp5Lr3ASqdl7dr7tx0eAe/S+rkC8jRCaql3Sp1eY/vuWEcJu/c5S
	F283nrs+KV05/l1rCfT03/lX4WBvQ/MbjHoWyo6RPUUTU4/dJgqwyIkg1fpOanOuFOVM
	Vt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EyrNH0p9OLepySqWde0ujwNlvAi4Z7KbiRZzHo9g61w=;
	b=JQUjDwWiMtqTjuYRNpBwlQtN6oYUHO1LmISHkFVVCvKvGHO7h7Mnq7fUdLBPp8kQMm
	rVy0x+dkAMemwV9h6W2b8nUqqVD8D9F94lFHgdviBTzy4EiQX+ypoeFDo4UKun7On3NP
	LjSe38l34Mp7lrvZC2yAEsvXzEUeI7AX+VeFOa2iFOrUjIOMD5i2fpEryYcltSHwId02
	ZUXOMDZ4CrzCyrA7bVsdfbUuExPKz+gdIRC68E+EKfmq0WDVvGNculsjUZm7zZJPXki4
	OkieO3Qqm4hE0l0Caz1ZShC2iCWiuw9W3v4yeAG8en5mMfifNng6VZuVPeXc0JAs+jgn
	5zlw==
X-Gm-Message-State: APjAAAX2M3KqsJgEzc9/yThL5vRmRApYFZREOiyQ+XiNAnevcjO9naKk
	Ij2zsUg7A5vk7bcqBSvilzTPoouG9zneVkv8M1Y=
X-Google-Smtp-Source: APXvYqy7Lnjb51UpXwfPQwPyRKVKd0ni8oRY7hAwMogUGlsPyOazXnFIF+VfcwVeodLB3KSEsn6nOwp6q2nif/phKig=
X-Received: by 2002:a67:fa4d:: with SMTP id j13mr24262153vsq.22.1556288052889; 
	Fri, 26 Apr 2019 07:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190418101906.15246-1-andrej.valek@siemens.com>
In-Reply-To: <20190418101906.15246-1-andrej.valek@siemens.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 26 Apr 2019 15:14:01 +0100
Message-ID: <CAO5Uq5QnNM5idDM5BafGQT7xSH5UXUdZb3KhhT2v8nQOVajXhg@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>, Jonas Bonn <jonas@norrbonn.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: upgrade to 242
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
X-List-Received-Date: Fri, 26 Apr 2019 14:14:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 18, 2019 at 11:22 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> PATCH REBASED:
> ==============
> 0001-do-not-disable-buffer-in-writing-files.patch
> 0002-don-t-use-glibc-specific-qsort_r.patch
> 0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> 0004-add-fallback-parse_printf_format-implementation.patch
> 0005-rules-watch-metadata-changes-in-ide-devices.patch
> 0005-src-basic-missing.h-check-for-missing-strndupa.patch
> 0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
> 0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> 0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> 0021-avoid-redefinition-of-prctl_mm_map-structure.patch
> 0024-test-json.c-define-M_PIl.patch
>
> PATCH DROPPED:
> ==============
> 0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
> 0001-meson-declare-version.h-as-dependency-for-systemd.patch
> 0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
>
> PATCH ADDED:
> 0025-fs-utilh-add-missing-sys-stat-include.patch
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---

This change in 242 means I'm no longer getting network up after
flashing a new image (I'm flashing the entire eMMC from an image):

* During package installation (with `ninja install`), we would create
symlinks for systemd-networkd.service, systemd-networkd.socket,
systemd-resolved.service, remote-cryptsetup.target, remote-fs.target,
systemd-networkd-wait-online.service, and systemd-timesyncd.service
in /etc, as if `systemctl enable` was called for those units, to make
the system usable immediately after installation. Now this is not
done anymore, and instead calling `systemctl preset-all` is
recommended after the first installation of systemd.

I don't know if Jonas is still working on this series:

https://patchwork.openembedded.org/series/15497/

as that looks like it has the kind of machinery we need (though I
don't think this problem is specific to read only rootfs now) - I'm
looking at the series in case he's not.

The quick-hack fix is to revert 01d2041e41f4 ("meson: stop creating
enablement symlinks in /etc during installation"), but clearly that's
not sustainable.

--
Alex Kiernan


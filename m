Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF55A7D8E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 15:36:44 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id j184so2148559vsd.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VH7kiC6ITAT73Ln5nAdqUhjoQeiP9o9e2YsUF2C+CUM=;
	b=gR9K7QcJJ9TFrP1WtnLFkBazLRH+L5azQdhV65R2Af5siwgX7NjMTlt2SUirehMvuK
	HLf9mr4ghEwTwIRbSFc/Zl4mT/67DJIg1uyn209OH5/SF5P9Ml1dXjkfbD4QPcBhpaed
	XSKiKmRJE3npDkSSHlPahY4Asc9uls02x1qU+dKB6bFX3d5aec5tirUOJ/6pZBRJtC/h
	fYGROd4ZjQ9CJP+cTFG8iopkNRTAmnu7eSKbTdhQHnFmEm2dog6X7ytsyZ3QIUjpF8uc
	MPaFMzeN5wkt22b8ZYkZMeKgloZr5YM92VqXRdA590McxJnvtvUWguCdEY0a3368XxOf
	X/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VH7kiC6ITAT73Ln5nAdqUhjoQeiP9o9e2YsUF2C+CUM=;
	b=ml0QHML6nUGfwE3HVqiy9FJOLVzktaAvhOT+cIUpgW5jatRmmXkL8N5y5S+RMvvCh+
	n3RN0MxLdcjgp1SgfsPi1I559w+pVO1bEF02D0iJ79faiuY9VNM711i9H0uRai2wBmDL
	PNfBfS7uS9Qek6tiwPMX66yhKeSOAx2u3mtheG/PJ8y1qtlf21WHbLdpBkM/7KRYJud/
	8qetXsz/sjVswcym+gz50luT4Ew+CB48sf0uf8MP7i+mv5q0pL7D46ZvvfRXQ0Dm5g18
	xIMuSvD266TYZMX317EhZf6v2WlTim7rOEVI+fdhGAFtHqjas+h+PJydRq3QD8hBxL/c
	MCdg==
X-Gm-Message-State: APjAAAVPyc3wb6nfIKys5eV4RwPkjsZzdEnXED6WIANIwnbUQzahGY+t
	MFEaFCB9cqXPvHmNadKZCq6lAzDbYBZKAIC7pE8=
X-Google-Smtp-Source: APXvYqzIkl9Apk1mhy2XPqpYQMAhuBnczW1TrlQicks61SCsBDZU+F70KBiON98a2G3e62KGV/tokJAMEThwOr8/Qng=
X-Received: by 2002:a67:bc01:: with SMTP id t1mr25377164vsn.149.1556293005445; 
	Fri, 26 Apr 2019 08:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190418101906.15246-1-andrej.valek@siemens.com>
	<CAO5Uq5QnNM5idDM5BafGQT7xSH5UXUdZb3KhhT2v8nQOVajXhg@mail.gmail.com>
	<5ba501db-0e29-80b5-93f7-9ebafc10416c@norrbonn.se>
In-Reply-To: <5ba501db-0e29-80b5-93f7-9ebafc10416c@norrbonn.se>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 26 Apr 2019 16:36:32 +0100
Message-ID: <CAO5Uq5Q1bG=KC0neU6LMP-xiWrGSwh8y1c_BdurYjY3crczL_w@mail.gmail.com>
To: Jonas Bonn <jonas@norrbonn.se>
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
X-List-Received-Date: Fri, 26 Apr 2019 15:36:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 26, 2019 at 3:45 PM Jonas Bonn <jonas@norrbonn.se> wrote:
>
> Hi Alex,
>
> On 26/04/2019 16:14, Alex Kiernan wrote:
> > On Thu, Apr 18, 2019 at 11:22 AM Andrej Valek <andrej.valek@siemens.com> wrote:
> >>
> >> PATCH REBASED:
> >> ==============
> >> 0001-do-not-disable-buffer-in-writing-files.patch
> >> 0002-don-t-use-glibc-specific-qsort_r.patch
> >> 0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
> >> 0004-add-fallback-parse_printf_format-implementation.patch
> >> 0005-rules-watch-metadata-changes-in-ide-devices.patch
> >> 0005-src-basic-missing.h-check-for-missing-strndupa.patch
> >> 0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
> >> 0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> >> 0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> >> 0021-avoid-redefinition-of-prctl_mm_map-structure.patch
> >> 0024-test-json.c-define-M_PIl.patch
> >>
> >> PATCH DROPPED:
> >> ==============
> >> 0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
> >> 0001-meson-declare-version.h-as-dependency-for-systemd.patch
> >> 0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
> >>
> >> PATCH ADDED:
> >> 0025-fs-utilh-add-missing-sys-stat-include.patch
> >>
> >> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> >> ---
> >
> > This change in 242 means I'm no longer getting network up after
> > flashing a new image (I'm flashing the entire eMMC from an image):
> >
> > * During package installation (with `ninja install`), we would create
> > symlinks for systemd-networkd.service, systemd-networkd.socket,
> > systemd-resolved.service, remote-cryptsetup.target, remote-fs.target,
> > systemd-networkd-wait-online.service, and systemd-timesyncd.service
> > in /etc, as if `systemctl enable` was called for those units, to make
> > the system usable immediately after installation. Now this is not
> > done anymore, and instead calling `systemctl preset-all` is
> > recommended after the first installation of systemd.
> >
> > I don't know if Jonas is still working on this series:
> >
> > https://patchwork.openembedded.org/series/15497/
>
> I haven't given up on it, but I had to put it aside for a bit due to
> more pressing matters.
>

Don't we all end up in those kind of problems!

> >
> > as that looks like it has the kind of machinery we need (though I
> > don't think this problem is specific to read only rootfs now) - I'm
> > looking at the series in case he's not.
>
> If you have a writable root, systemd will automatically do the
> preset-all for you; the catch is, systemd only does this if
> /etc/machine-id does not exist.

Ah... that's useful information that I didn't know.

Whilst I do have a writeable /etc, I'm running under OSTree, so I
don't want /etc mutated in the normal use case as I want to ensure
that changes in /etc are correctly propagated across upgrades (OSTree
does a three way merge of /etc using the current /etc and what was
shipped as defaults in the previous deployment and the new
deployment).

> OE forces an empty /etc/machine-id onto
> all root images so this doesn't work; as such, you'll need to do the
> preset-all magic manually for ALL filesystems irregardless of whether
> they are read-only or not.
>
> A better solution is drop the /etc/machine-id and let systemd create
> that automatically; then it will also do the automatic preset-all at
> first-boot.  The problem here is that the OE build farm detects images
> that stall at boot when /etc/machine-id isn't present; I wasn't able to
> find the cause of this but that's where you should be looking if you
> want to pursue this patch series.  Aside from that little glitch, I
> think the rest of it is fine.
>

Thanks, I'll see if I can chase that one down.

> And getting this working is also a big step towards making "stateless"
> systems (using the systemd terminology) work where /etc may be a tmpfs
> and gets populated at boot.
>

Yeah, that's something I'd like to get to.

--
Alex Kiernan


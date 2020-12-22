Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.9314.1608628144971113802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 01:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nr+mDeop;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: erik.boto@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id o17so30309485lfg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oIqrt7bhVkHhUu51SDNQF6qQFrUofMScC90+zllVK3I=;
        b=nr+mDeopIZ/C+0nWWwPvmC3Fk6ZMtqVZCkQQmUpOFwA9udsx9NgU69mpYX0w3zyRF0
         zQYc2soH4rjV0iufiUltC/ob6F2qGZqfbbytwABzY8D0SW4jLu/b5QYYnv4pb9p8DnMT
         JeodT6oQskwZGQAbht/QIXW+PpCgmZuPFqDVvVn0DD7X/5TXKyco4NPJwVNT+rRCOM9g
         IQaZisxlnKk3wxmU0a0lhwVvmzXZI2ERdhoopPDyFmnsD92Yyg0CtO2GvawEQNnNxG2e
         yBIaRFD062CnW839NeuyiUCoFR3akz+O/Uc88wh0so9AMbckw1f9iKiNeoK2JdRS04El
         dLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oIqrt7bhVkHhUu51SDNQF6qQFrUofMScC90+zllVK3I=;
        b=iliLdzuKnKW+yuikiD1wZkxDKoPiuDY6/OYgGY53z27w9ZRea4QGhN6yMR4QVlmTwY
         xkaRFYXqufSpBwz05t+VnrmSAmmVSQWi76Id1kgq4jyNL45NIFsHkvMaxZqn2dkNSeJF
         U62ySQaxZXVzEcL5ihxyz1lsDyUuSgGzowbh6QtDsxxqrW6LNP0Q/8Rhu+dEsfZvSBsa
         6248XBfTNbY385q1pfCxpt+CRCTNYxi7oXZ/FkVa1YiJTxhzt+KnGzaN4rWZ2GWi645a
         up93E5mDRj3FC43eMd8bClT/RZykW5Xm3LntmcMXhVhkmsFlScVVkn7u8hgQn+WPNYVC
         Jl6w==
X-Gm-Message-State: AOAM531xI5w52f1nTQduw8GD79g3SabTr4ei1mSA3ugZk4skWOc7EBLV
	T0OvRTeBq+EJ4Wd+f/KEbU/vrU1hwF9Ifor8y7E=
X-Google-Smtp-Source: ABdhPJwiCYjRlqEYcPIjcsOTLHX1Imh9Zr+wTMFyGBrYJ5NBsyGO38Y3I6YPPqb+WjMJd60UyJXPmyK9eMw0Vk+Im4I=
X-Received: by 2002:ac2:5a09:: with SMTP id q9mr7961128lfn.209.1608628142994;
 Tue, 22 Dec 2020 01:09:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607007208.git.steve@sakoman.com> <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
 <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
In-Reply-To: <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
From: "Erik Boto" <erik.boto@gmail.com>
Date: Tue, 22 Dec 2020 10:08:52 +0100
Message-ID: <CALNvYWMznudnN+_6yCkxcwxhtv=8M=hRC1nNpQP6Ww7ZTedvPg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
To: Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

There's a bug affecting wic in combination with --exclude-path /
--include-path that would then be backported into the LTS version. See
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14129.

Maybe the issue that is being fixed is more serious then the issue
being introduced so it's a valid trade-off, I just wanted to mention
it so it's known.

Cheers,
Erik

On Mon, Dec 21, 2020 at 4:06 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Mon, Dec 21, 2020 at 4:33 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Just curious, is this PR on hold or rejected completely?
> >
> > I don't have strong opinion either way, I was just wondering about this one when other newer PRs were already merged.
>
> This series is still actively being tested. I've been waiting for a
> couple of related patches from master to hit before sending a v2.
>
> If there are still no objections at that point I'll send a merge request.
>
> Steve
>
> > On Thu, Dec 3, 2020 at 4:08 PM Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> Issues with undetected file mode corruption in pseudo have been identified.
> >>
> >> Fixes have been merged into master and gatesgarth over the past couple of months and
> >> things seem to have stabilized enough that we can consider backporting these fixes
> >> to dunfell.
> >>
> >> This is a somewhat more invasive change than normal. Specifically the user will
> >> be required to clean TMPDIR after this merge. It may also expose issues with
> >> other layers, though master and gategarth have probably helped to pave the way for
> >> this change.
> >>
> >> Personally I think that this fixes a serious enough issue that we should consider
> >> this series for dunfell.
> >>
> >> Please have comments back by Monday morning.
> >>
> >> The following changes since commit 071806feb195961e59069f778c9ae8f27a739d9a:
> >>
> >>   e2fsprogs: Fix a ptest permissions determinism issue (2020-11-30 12:05:57 -1000)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
> >>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
> >>
> >> Jacob Kroon (1):
> >>   bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
> >>
> >> Joe Slater (1):
> >>   pseudo: fix renaming to self
> >>
> >> Martin Jansa (1):
> >>   base.bbclass: use os.path.normpath instead of just comparing WORKDIR
> >>     and S as strings
> >>
> >> Mingli Yu (2):
> >>   tcl: adapt to potential pseudo changes
> >>   bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database
> >>
> >> Ricardo Ribalda Delgado (3):
> >>   wic: Fix permissions when using exclude or include path
> >>   wic: Fix multi images .wks with bitbake
> >>   wic: Avoid creating invalid pseudo directory
> >>
> >> Richard Purdie (19):
> >>   pseudo: Switch to oe-core branch in git repo
> >>   pseudo: merge in fixes for setfacl issue
> >>   pseudo: Update to add OFC fcntl lock updates
> >>   pseudo: Ignore mismatched inodes from the db
> >>   pseudo: Add support for ignoring paths from the pseudo DB
> >>   pseudo: Abort on mismatch patch
> >>   psuedo: Add tracking of linked files for fds
> >>   pseudo: Fix xattr segfault
> >>   pseudo: Add may unlink patch
> >>   pseudo: Add pathfix patch
> >>   base/bitbake.conf: Enable pseudo path filtering
> >>   wic: Handle new PSEUDO_IGNORE_PATHS variable
> >>   pseudo: Fix statx function usage
> >>   bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
> >>   abi_version,sanity: Tell users TMPDIR must be clean after pseudo
> >>     changes
> >>   pseudo: Update to account for patches merged on branch
> >>   pseudo: Upgrade to include mkostemp64 wrapper
> >>   oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
> >>   uninative: Don't use single sstate for pseudo-native
> >>
> >> Ross Burton (1):
> >>   devtool: remove unused variable
> >>
> >>  meta/classes/archiver.bbclass                 |   2 +-
> >>  meta/classes/base.bbclass                     |   6 +
> >>  meta/classes/image_types_wic.bbclass          |  12 +-
> >>  meta/classes/populate_sdk_base.bbclass        |   2 +
> >>  meta/classes/sanity.bbclass                   |   3 +
> >>  meta/classes/sstate.bbclass                   |   4 +
> >>  meta/conf/abi_version.conf                    |   2 +-
> >>  meta/conf/bitbake.conf                        |  13 +-
> >>  meta/lib/oe/sstatesig.py                      |   4 +-
> >>  meta/lib/oeqa/selftest/cases/runtime_test.py  |   1 +
> >>  .../pseudo/files/0001-Add-statx.patch         | 106 --------------
> >>  ...001-maketables-wrappers-use-Python-3.patch |  34 -----
> >>  ...ixup-remove-files-that-do-not-exist-.patch |  49 -------
> >>  .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  |  31 ----
> >>  ...1-realpath.c-Remove-trailing-slashes.patch |  57 --------
> >>  ...xattr-adjust-for-attr-2.4.48-release.patch |  48 ------
> >>  .../pseudo/files/moreretries.patch            |  19 ---
> >>  .../pseudo/files/seccomp.patch                | 137 ------------------
> >>  .../pseudo/files/toomanyfiles.patch           |  71 ---------
> >>  .../pseudo/files/xattr_version.patch          |  54 -------
> >>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  14 +-
> >>  meta/recipes-devtools/tcltk/tcl_8.6.10.bb     |   1 +
> >>  scripts/lib/devtool/standard.py               |   1 -
> >>  scripts/lib/wic/partition.py                  |  23 +--
> >>  scripts/lib/wic/plugins/source/rootfs.py      |  37 ++++-
> >>  scripts/postinst-intercepts/update_font_cache |   2 +
> >>  26 files changed, 89 insertions(+), 644 deletions(-)
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/moreretries.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> >>  delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >>
> >>
>
> 
>

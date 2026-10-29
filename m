Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.560.1793315351318171019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gmnKLOT5;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53669f7b518so533861cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315350; x=1793920150; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g3Vci9HXT5usdno8bJQPfuk4UCzQC7QUGMZB3JtDm3I=;
        b=gmnKLOT5jdb+xRtzfor5w1TGjBO9A1NAYADK6Z+ZdAykqqyIC9HbDvzn8ityrGYeD9
         kc6MGQ4n8K/3IOqK9qX9AUmbSO/dSu8uveTpirZOjUHQAduaAYzVWrsqmbN/yUpj7JbD
         t4Pbv/f4ICfp757Gf8NpMc9+e/+WR6pGZHfH7Rdhg2zkqjQuFYJ8OzkmUnduxZAJdeMk
         BJYD7eC/VR4RYIoe0CPc0QsaQNhdbiXwA8ZENsszNvW2kb00yQXG1FKmAcwQ2qOhfynu
         iNaf7DACPDCyT4xNzP25gjIUmcDpK4JAGopC7NZZSIfXBMnlgetEeFVXG7Xo/Sag8hZ5
         gY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315350; x=1793920150;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g3Vci9HXT5usdno8bJQPfuk4UCzQC7QUGMZB3JtDm3I=;
        b=Tm+bb/F+QiP82B0GB/vOb77lXjvKX1QdzcauWawfGufVuwoo6dxTaShg/WaeExObRo
         9eF6UUi6PO+9f6B8iVZgDM1kC0AUaI461m4Ecl+zA/a9AoSZQiNIljO8zLBh7ltbkaQe
         y/BBxVk9ED+N87zWDhEVx2xSqy4hqkHO6pGRMVgcn0AHQu6pW8/vZVBS/lU6V5l8vWgT
         azmoglYA5DJHCLpJavlzffZroRU3hlS6uVnFtfdysk5ThC6elmHY7Tn4q7tVVqRdll7b
         Upkdf5IzRFNtVRpSdtOyWgFTgFct59FFyhGnUWzS1ZYhaf9GkzUZnsLWXWCvh9c+2qgo
         o3kw==
X-Gm-Message-State: AFq9FYKdCJbLcm/hJ5CDKBOntp2UsuytsJgvlT/E+oWUrMRg2fKQFUqx
	1R8uI/dKN5F+D5TYHCjjqy21lva3U3RcaNINU7HxLUT+ShQ20gHv6nRk
X-Gm-Gg: AYBFou2ggX+cNN+dfCfczP7EoO6BQNJcw0xH6+ttiEpTMOEFuhSxzm+DGSL1xBOIVeC
	9DLuR0BPbizHeF29s5RHVpulOXMrL8HioAyjx9F/2sZ2mE97VuN4cwerEgK39RA8JYLZkBMtmud
	sUyOv3DV9kwx6xE2CI2HSxkedRjqQfwx03cA7W+3YwQKLKXthFpBc54o7zsqRFZlA8+6shwcPe6
	h8QumMjQp0S2WwbEIxsQNLeMpRSFXkRvtaYnjuX6R+6BGEzdklSwCZpi9qKlZBmvgnCrlXxbaWJ
	ZjMoHcrRKQzeaW6CtT69MplSWkBwEbROjle0SV6p2aZVQ6UGJPOpn2LK6s7U4noTkvHE0iQD2d7
	628rExGI/f2Vdu3PL66GTS+rZ2FKdHel0yEGM3ToAbxlFgTKgTFQyAf+gS7pgRae0Xajp0c7d5P
	c+QzRML9FR3xuQodh2xfi3EGt/AFhcjdwNewautFLSZDNKdJ7jfHKE8wV/DSooFZ79Kj+TXRL9H
	3DfVZUXF/K19e3U5H4wKwROVEEJWHd91AwiTkbs6J2ncyGQC7ha+nZbbamN7GbRJYFbtst82EuS
	lwoMs5Fkt1dEWPofFm/atwsRezqX17WqD6jZgoHJSxlP5ESAaOKJS3xP9UqP2BpELYXDQjR7uh6
	N5BaTlr4Bif0c4vcEj3HFHFztG+LrAb89giU1wnqPgnGP+83hONgX
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr9436911cf.27.1793315349874;
        Thu, 29 Oct 2026 16:09:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca68bf170sm1128866d6.34.2026.10.29.16.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:09:09 -0700 (PDT)
Message-ID: <6ae3d215.cf61d36e.14493f.869f@mx.google.com>
Date: Thu, 29 Oct 2026 16:09:09 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v2 0/3] Fix kernel complementary package installation
In-Reply-To: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
References: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 23:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248978

On Wed, Sep 23, 2026 at 4:51 PM Adrian Freihofer wrote:
>
> Changes in comparison to v1: Completely different approach
> - Complementary package installation for kernel sources is disabled
> - The linux-yocto-src package can now be installed as a regular package whi=
ch
>   was not possible before.
> - Additionally, the kernel source files are now correctly included in the
>   linux-yocto-src package.

Sorry for the delay on this, I wanted to actually build and measure
before replying, since this is in master-next.

First, to make sure I have the use case right: this is TRACE32 (or
cross-gdb to qemu, it's a similar pattern) running on the host, with
rootfs-dbg extracted on the host as the debug sysroot. Nothing here runs
gdb on the target. Correct ?

As I said on IRC, I don't want a kernel -src package. It's a second copy
of the kernel tree that you can't build against, and the generic -src
machinery is the wrong tool for the kernel. But I'm not saying no to the
goal. I looked at why linux-yocto-src exists at all, and I think there's
a simpler way to get you there.

Where the kernel's debug info points today (7.2.13, qemux86-64):

  recorded root                      files   what they are
  /usr/src/kernel/                    9016   real source
  /usr/src/debug/linux-yocto/<PV>/     592   generated in ${B}

kernel-arch's KERNEL_CC maps STAGING_KERNEL_DIR and
STAGING_KERNEL_BUILDDIR to /usr/src/kernel, but not ${B}, where the
kernel actually builds. ${B} falls through to the generic debug prefix
map, and those 592 generated files are the only content of
linux-yocto-src. Everything real is already recorded under
/usr/src/kernel.

Are the 592 needed for debugging ? I went through them (with
grep and some AI help):

  files                                     count  content                  r=
egenerable from source?
  *.mod.c                                     557  modinfo boilerplate      n=
o (needs module objects + modpost)
  .vmlinux.export.c                             1  export table             n=
o (needs vmlinux.o)
  vdso32/64-image.c                             2  vdso byte arrays         n=
o (needs the vdso build)
  *.asn1.[ch]                                  14  ASN.1 decoder tables     y=
es
  capflags.c, inat-tables.c, crc32table.h,
  raid6 tables.c, consolemap_deftbl.c,
  defkeymap.c, ucs_*_table.h,
  oid_registry_data.c, shipped-certs.c,
  gen-kdb_cmds.c, syscalls_{32,64}.h           14  data tables              y=
es
  raid6 int{1,2,4,8}.c                          4  code (awk-unrolled)      y=
es

Only the raid6 int*.c files are code that you'd ever step through. A
debugger missing a file just shows no source for that frame. What's
useful can be regenerated by kbuild from the source (as a prerequisite
of the .o), and what can't be regenerated isn't useful. So I don't want
to package any of them. Shipping build output that can be regenerated
can lead to QA issues with mixed arches.

So, what I'm prototyping instead (and have tested):

1) kernel.bbclass:

     KERNEL_CC:append =3D " -ffile-prefix-map=3D${B}=3D${KERNEL_SRC_PATH}"

   All 9608 debug source paths are now under /usr/src/kernel.
   copydebugsources() finds nothing for the -src package, so
   linux-yocto-src isn't created at all. There's no special case in
   package.py. A generated file regenerated in the tree lands exactly
   where the debug info expects it.

   I did an A/B of the kernel built with and without it. In the loaded
   vmlinux sections and the 557 modules, the only differing bytes are
   the build-ids (vmlinux, the embedded vdso note, the modules) and the
   .gnu_debuglink CRC. That is expected, since both hash the debug info,
   which is what changed. There are no code or data changes.

2) For the source itself, I have been carrying an optional linux-source
   package in kernel-devsrc for a long time. It's off by default
   (PACKAGECONFIG), a full source tree at /usr/src/linux-source-<kver>,
   and it doesn't overlap with devsrc (which stays the curated, buildable
   subset). With:

     IMAGE_INSTALL_DEBUGFS =3D "kernel-dbg kernel-vmlinux linux-source"

   rootfs-dbg has the vmlinux and module .debug files plus the source.
   The debugger maps /usr/src/kernel to /usr/src/linux-source (TRACE32
   has source path translation for this).

   I'm not completely sold on sending this one yet, but I could be
   convinced to go that way rather than a -src package. If it covers
   your use case, that's the argument that would do it.

On the series:

 - 1/3: I'd drop it. With (1) there's no kernel -src package to make
   installable. Assuming I haven't screwed up the logic or misunderstood
   something.

 - 2/3: fine with me. Keeping the kernel out of the complementary
   install is what I asked for in v1, and with (1) it is a no-op.

 - 3/3: I'd drop it. It selects files by their recorded /usr/src/kernel
   path, but installs them under /usr/src/debug/linux-yocto/<PV>, so the
   debugger still needs a path substitution. That's the same cost as
   mapping to a source package. It also duplicates the whole tree (your
   8901 files) into a package that can't be built against. And it
   applies to every kernel-arch recipe (module-base, so out-of-tree
   modules, perf and make-mod-scripts), not just the kernel, so they all
   start carrying kernel sources in their -src packages.

   The linux-source package in (2) is what I'd propose in its place.
   It covers the same need (the full kernel source in rootfs-dbg), but
   it's opt-in, it's a single copy for the kernel only, it carries no
   generated files, and it isn't a -src package at all.

Richard: since 1/3 and 3/3 are in master-next, I'd ask that they be held
while we sort this out.

Two oe-core issues I hit along the way, which I'll report separately:

 - IMAGE_INSTALL_DEBUGFS installs with attempt_only, so a package that
   can't be installed is silently skipped. I hit this with a file
   dependency on a usrmerge distro.

 - An on-target postinst from a debugfs-only package leaks into the main
   rootfs postinst handling and fails do_rootfs.

If this direction works for you, I can send (1) and the linux-source
package as an RFC so you can try it with TRACE32.

Bruce

Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33204.1793881310204222403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 04:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BTfH/0Ke;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1103213f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 04:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793881308; x=1794486108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixqAVIffvGCp2dp11uEIS5r1WSq5s3wTH8OBderXmFI=;
        b=BTfH/0KebYV8feo8kf1ncWEHJEcRwqjMK6ho4rpC+n5W+q/TX22Ldq81M2IrHgEnME
         igahDC5LMtqozqnG8zP5qIpmQ1tSvNlmuVyCo92k8iCgDw6TL8t/1hTqAXf1sD6xKnaN
         CIxEinLiN3kH4E4aGWoWyGBpRbn4irpgGAGeBDcLiROym8ZLg+PUpn5u1s6GA3Ify2Vx
         IXA8vTwFkbOT2jT7IKF33Yf8YMxpgvWe6DsrZ75JZlmdzwQ6PdHtXD1s7twczYJXcmkX
         rhuUCJiPpNmRauUVoPtiBg4OIW6X1P57ByNPrsYfSSpvI4uQV1QDaaaW+SZZDYAznPlQ
         ybqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881308; x=1794486108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixqAVIffvGCp2dp11uEIS5r1WSq5s3wTH8OBderXmFI=;
        b=z1l1+sih0lYN9zwa88dSgcYuDoA5IkQalZMK3EtqAOZILXzNFCTV444FtB9tgjj5z/
         slq2BZax4yBrfOOjphDbmuQlzu55FkGK6uHsuq6GoUMCzG5vyqK/huDQsqZv4umAckCC
         jtut6gCsSCt8r/jlXNp7Ool5zuSzIJPnqXmw6eXhapFwwgmee7MV2MF04Z2BC0n7Y7nA
         PoNmFJDu6lKI7Pquau+ghdV0MFY8eTyAL6a+8wF1JUKcCkFygIU+xqfszIUPwP89MaNl
         BWFOm8MYV5jHGTdcVPe/X97qVWa7Sulplyg3Q2xbhIB8tWaUmURsdPQPyN9C2XkWNeu3
         9dzQ==
X-Gm-Message-State: APuU4Z9Ul86emX/oKPj4uhXFQinL3yEoH84xd0Q3pvpDf2Ns0oY4xJ35
	UVkefbojHXJCROq5eeRJ28rQrgiI5/PNoKA5gGGxcoe1RT6FwNkYqkItk+/iOJZ1
X-Gm-Gg: AYBFou30HXDTfqPOQh8uyn4GRCfgPkjq3ChjjQ7L3TQdC2vWk08VETmuOxNo3YL+a6R
	bxvoFPfLDh8/LAfpV04FKdnUl2K9e5VKPwc4ipm/UgYK78OR4YivhYarJVvt1B6CKw/TE4n+cg4
	Lbg9I7MJpVx5V3p1ifT+rstZgRqc9mDHzA6UMJPXTmwyd2iA7cfOp5mj+2tdoVCavJIfg/4Umqd
	mH24xYg4wHQmUtDwbtuYaAXlVfPBgAruToPCKvUeLvOyNgAV9zbw/5xzr01acbwnWWbNW5SFFVs
	W66K7eZp1DixkVy+jDL9QXQ7jUjOsA2/OGISYroFaCyOQWhFfpdwsjnRNyIAWuSxNNMbB32Iviy
	1W8a5TPJXsljfNf1y/sKTBBTioFAEYdoVjk7o166V0SbEl3HdI7RxcZYo5NHk6m+DhqKFSCv0tN
	dWKRR2mqhc1gqn2N/kau2aqKj1K7y54aw0u8cJlCWx5OuTD1YQnd3NiG1nkb0n6PEeKDuMLUWNW
	Hlxm59BmvjTkpsamwdIHC3NApEtR3g+A/SrEOAKhcxskTh8ZJr0DLE4frwWQKys7zlN0P7+k4qU
	yfrCchQH7tc=
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr372756865e9.16.1793881307922;
        Thu, 05 Nov 2026 04:21:47 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ea592fbsm53789855e9.4.2026.11.05.04.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:21:46 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	bitbake-devel@lists.openembedded.org,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Peter Marko <peter.marko@siemens.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: [RFC] spdx30: name, version and purl for dependency downloads
Date: Thu,  5 Nov 2026 13:21:45 +0100
Message-ID: <20261105122145.543282-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 12:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249543
Content-Type: text/plain; charset="utf-8"

Hi all,

I would like your opinion on a direction for the SPDX output of
recipes with language dependencies. I have working patches for it,
described below, but I would rather agree on the approach before
sending them.

Yocto already knows each language dependency at fetch time for the
recipes that list them in SRC_URI (crate://, gomod://, gomodgit://, and
npmsw:// through its shrinkwrap file). The SPDX output loses most of
that: the downloads are recorded, but without a name, version or
package URL that a scanner can use, and dependencies fetched
implicitly (git submodules, shrinkwrap dependencies) are not recorded
at all.

Measured on current master (oe-core 3a3eef7afb, bitbake 0f33b68cb,
meta-openembedded 33f74f5dc5), source downloads in the build SPDX of
each recipe, today and with the patches:

                  today                   with the patches
  python3-bcrypt  42 crates, none with    all 42 with name,
                  version or purl         version and purl
  crucible        36 Go modules, none     all 36 with name,
                  with version or purl    version and purl
  p11-kit         gitsm, submodule        submodule recorded with
                  pkcs11-json missing     its own revision
  webserver-oob   2 downloads, the 70     72 downloads, 71 with
                  shrinkwrap packages     a purl
                  missing

webserver-oob is from TI's meta-tisdk, built on qemux86-64 without its
am335x and meta-ti runtime dependencies and without one git.ti.com
source that failed to clone, since neither oe-core nor
meta-openembedded has an npmsw recipe. crucible also fetches 67
go.mod-only entries (;mod=1), which are not compiled in and stay
without an identity.

Today a crate shows up as name "cipher-0.4.4.crate" with download
location https://static.crates.io/crates/cipher/0.4.4/download, and a
Go module as gomod://github.com/felixge/httpsnoop, with the version
only in the file name "github.com.felixge.httpsnoop@v1.0.4.zip".
Consumers end up parsing URLs and file names per ecosystem to recover
what the fetcher already knew.

I am aware of two earlier threads and would like to build on them, not
reopen them:

- Joshua's "lib: spdx30_tasks: Use Fetch.expanded_urldata()" (March
  2025), which stalled on an intermittent edk2-firmware gitsm failure
  on the autobuilder. I think I found the cause: the patch passes each
  expanded URL to oe.patch.patch_path(), which calls
  Fetch.localpath(url). For a URL that is not in SRC_URI, that creates
  a new FetchData with the recipe datastore, where the
  SRCREV_<submodule> that the gitsm fetcher sets in its own datastore
  copy does not exist. A recipe with only named SRCREVs, like
  edk2-firmware, then fails with "Please set a valid SRCREV". It
  reproduces every time with meta-selftest's git-submodule-test given
  a named SRCREV. My guess for the intermittency is that gitsm only
  lists the submodules when the clone is in DL_DIR.
- Stefan's "Concept for tightly coupled package manager" RFC (December
  2024). My reading of that thread is that explicit SRC_URI lists
  generated in layers (go-mod-update-modules,
  cargo-update-recipe-crates) are the preferred model and that
  fetchers should stay thin. This proposal assumes that model and does
  not add any dependency resolution to bitbake.

The patches have two parts.

1. Record implicit downloads

   add_download_files() also records what implicit_urldata() returns
   for each SRC_URI entry, but keeps the patch check on the SRC_URI
   entries, so implicit downloads are never set up again with the
   recipe datastore. The npmsw fetcher gets an implicit_urldata(),
   since it already builds the list of URLs internally (ud.proxy). The
   gitsm fetcher warns when the repository is not in DL_DIR, instead
   of silently returning no submodules.

2. Let the fetcher state the identity of what it downloads

   FetchData gets a package_identity attribute, None by default and
   set in urldata_init() by the fetchers that know it:

     crate     ("cargo", "cipher", "0.4.4", {})
     gomod     ("golang", "github.com/felixge/httpsnoop", "v1.0.4", {})
     gomodgit  same as gomod
     npm       ("npm", "@scope/name", "1.2.3", {})
     npmsw     the same for each registry dependency

   The last element holds purl qualifiers, so a crate or npm package
   from another registry gets a repository_url. go.mod-only entries
   get None. create-spdx-3.0 sets the name, software_packageVersion and
   software_packageUrl from it and builds the purl in oe-core, so
   bitbake does not need to know the purl specification.

   I first had a FetchMethod method in mind, but npmsw fetches its
   dependencies through plain https URLs, so it has to attach the
   identity to each of them, and an attribute is enough for that. No
   URL syntax changes, unlike the dn=/dv= parameters in Stefan's
   series.

Both parts are small, about 35 lines in bitbake and 40 in oe-core plus
tests. I tested them on master with new bitbake fetcher unit tests and
new oe-selftest cases (submodules, including the named SRCREV case,
and crate identity), which fail without the patches, and with the
existing fetcher tests and the SPDX selftests closest to the change.
Two bugs I found in the existing Git handling while doing this (gitsm
skipped, changes not reaching the task signature) are fixed in a
separate series, which the oe-core part builds on:
https://lore.kernel.org/openembedded-core/20261104112257.866914-1-stondo@gmail.com/

Questions:

a) Is the fetcher the right place for the identity, or would you
   prefer oe-core to derive it from each fetcher's FetchData? The
   latter avoids touching bitbake, but for npmsw it means reading the
   internals of its proxy fetcher.

b) Should bitbake keep returning the parts and leave the purl to
   oe-core, as above, or return a purl directly?

c) For ecosystems without a fetcher (.NET/NuGet, Maven), would a
   fetcher plus an update class following go-mod-update-modules be
   welcome, or is that better kept in a layer?

d) Dependency scope. Identity alone does not give a correct SBOM: a
   lock file lists what may be needed on any platform. python3-bcrypt
   fetches wasi, wasip2 and wit-bindgen (WebAssembly only) and r-efi
   (UEFI), and with the patches they show up with a clean purl as if
   they were part of the product. As a follow-up I tried running
   cargo metadata --filter-platform ${RUST_HOST_SYS} in cargo.bbclass:
   of the 42 crates, 25 are runtime, 12 only run at build time (build
   scripts, proc-macros) and 5 are not used on the target. I recorded
   them as LifecycleScopedRelationship dependsOn with scope runtime or
   build, and an annotation on the unused ones. Go (go list -deps) and
   npm (dev, optional, os and cpu in the shrinkwrap) could work the
   same way. Does that split sound right: declared scope from the
   fetcher where the lock file has it, observed scope from the
   language classes? And is there a preferred SPDX representation for
   "fetched but not built"?

Thanks,
Stefano

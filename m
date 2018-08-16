Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3614778D86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 15:59:35 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j19-v6so4079593ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sTa9e9NZnWteOGAR4KbopdV/w4+TH+Zy65Y6hQDWQ6g=;
	b=TXJ+/Ggp+Cqmt0kse+C+PBrySlyKX/a561GZsTOUxsKEiS4vE/aOzQZb8KFd93OJbF
	CIB6j9QGfW9GorZlLS2i+/KEOFqksd0otgG68TTTfAJlaTJ9ug/NN+5fCKMzaN6l0U7v
	ixcRbXT1ZB9kKmHqxhGR6D8D9wLhUHaR4N/O3KETEjdH7yYieg+0mRart8u+HO0uQyei
	sjxO4AebgPtsUMKrt18nn8HkVtT8iRaESvTlGmJO1NeKnyNdVGMVv32NtLFN4VpCUM62
	nht4372fMkWPIzMIi6di/KJQHuhNKbz+2VWIEIhOWbAqVhfg40cB277w/6hmJF8hkmbM
	pmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sTa9e9NZnWteOGAR4KbopdV/w4+TH+Zy65Y6hQDWQ6g=;
	b=PSmr0qWl5VAQ1XMEqmbhH8aFY+Szv/MhyTvyh2CPGi59eRO62rHv5Z5CDJtfOVsg1U
	7sZoF2DZ0W4hB11wup3yNSUbVqlkuhiz1dOvQYM3+NkS+euGxuIyk/KY2FVIkw/WMnuI
	r55CjEr9/t7e77wY2Y7MWK7K3iM/Qb9i+mlfs+HA4j5jLsUBKmuT3me/Buo3mDFFX9d2
	/np2GpCBixV+DO2DdKKbBwpcbUKXwExGGjDm47nVgmI36/FbwJ2mWT0cEb+VN7cAFlxN
	7UmpREAkzgL/HbEaKUMRw5HyMO6V00Uei9lpru5Rky/kFL70VFFK26K9uulYUXEPuXpU
	4wbQ==
X-Gm-Message-State: AOUpUlHBokE86bq1VJjQ8qgTXFzHW6+97YXNiizUXHLGclyfmbm73iU5
	xcAwVDbLrujSyiKoXmA39lvQB/hI4ACPY1cBfFc=
X-Google-Smtp-Source: AA+uWPzMy6LPHGjQbJ+175RvHbJ/HOceNiUB3l/zFXA0CT6eV8+m6QnkospSU4nRhUdk/2Lijp7fJ5D3jVpIDjI1bc0=
X-Received: by 2002:a2e:84c6:: with SMTP id
	q6-v6mr22716382ljh.65.1534435175812; 
	Thu, 16 Aug 2018 08:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:285:0:0:0:0:0 with HTTP;
	Thu, 16 Aug 2018 08:59:05 -0700 (PDT)
In-Reply-To: <CAMKF1sr=HxiO0MuavSZq0n8-DQNjmxAeARKHDfv-NXFtBFvtFQ@mail.gmail.com>
References: <20180815222519.25303-1-alistair.francis@wdc.com>
	<a02d6015-c5c7-9987-1f44-4744c6a75887@windriver.com>
	<CAMKF1sr=HxiO0MuavSZq0n8-DQNjmxAeARKHDfv-NXFtBFvtFQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Aug 2018 08:59:05 -0700
Message-ID: <CAKmqyKOs=5OAC-J5fs-_A3urm1GaNDSNssExX03tRvkmJcRqSw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-devtools: Upgrade QEMU to 3.0
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
X-List-Received-Date: Thu, 16 Aug 2018 15:59:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 15, 2018 at 10:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Aug 15, 2018 at 9:05 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> LGTM.
>>
>> Patched and built on an ubu-16.04 box.
>> I was able to log into both qemux86-64 and qemuppc
>> using core-image-minimal.
>>
>> As people might expect, loads has changed:
>> qemu.git $ git diff v2.12.0..v3.0.0| diffstat| tail -1
>>   1825 files changed, 101360 insertions(+), 46333 deletions(-)
>>
>> Have you tested all of the oe-core qemu archs with the upgrade?

I tested it with x86 and RISC-V, no problems so far. I've been using
the RC for awhile now.

>>
>> Any concerns other than what is listed here:
>>     https://wiki.qemu.org/ChangeLog/3.0
>>
>
> incompatible changes and deprecated options seems ok since we do not
> use any of them
> other changes nothing is eye popping.

Agreed, I haven't seen anything that should cause alarm. Mostly just
improvements.

Alistair

>
>> ../Randy
>>
>>
>> On 08/15/2018 06:25 PM, Alistair Francis wrote:
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> >   meta/conf/distro/include/tcmode-default.inc   |  2 +-
>> >   ...1806-QEMU-slirp-heap-buffer-overflow.patch | 70 -------------------
>> >   .../qemu/{qemu_2.12.0.bb => qemu_3.0.0.bb}    |  7 +-
>> >   3 files changed, 4 insertions(+), 75 deletions(-)
>> >   delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
>> >   rename meta/recipes-devtools/qemu/{qemu_2.12.0.bb => qemu_3.0.0.bb} (88%)
>> >
>> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>> > index bed1594b7a..1c9226cb06 100644
>> > --- a/meta/conf/distro/include/tcmode-default.inc
>> > +++ b/meta/conf/distro/include/tcmode-default.inc
>> > @@ -28,7 +28,7 @@ BINUVERSION ?= "2.31%"
>> >   GDBVERSION ?= "8.1%"
>> >   GLIBCVERSION ?= "2.28%"
>> >   LINUXLIBCVERSION ?= "4.15%"
>> > -QEMUVERSION ?= "2.12%"
>> > +QEMUVERSION ?= "3.0%"
>> >
>> >   PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>> >   PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
>> > diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
>> > deleted file mode 100644
>> > index 837b65a79a..0000000000
>> > --- a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
>> > +++ /dev/null
>> > @@ -1,70 +0,0 @@
>> > -CVE: CVE-2018-11806
>> > -Upstream-Status: Backport
>> > -
>> > -https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01012.html
>> > -
>> > -From dc21a9d2951f0a2a7e63633e2b5c68c54e4edc4b Mon Sep 17 00:00:00 2001
>> > -From: Jeremy Puhlman <jpuhlman@mvista.com>
>> > -Date: Thu, 14 Jun 2018 01:28:49 +0000
>> > -Subject: [PATCH] CVE-2018-11806 QEMU: slirp: heap buffer overflow
>> > -
>> > -Subject: [Qemu-devel] [PATCH 1/2] slirp: correct size computation while concatenating mbuf
>> > -Date:        Tue, 5 Jun 2018 23:38:35 +0530
>> > -From: Prasad J Pandit <address@hidden>
>> > -
>> > -While reassembling incoming fragmented datagrams, 'm_cat' routine
>> > -extends the 'mbuf' buffer, if it has insufficient room. It computes
>> > -a wrong buffer size, which leads to overwriting adjacent heap buffer
>> > -area. Correct this size computation in m_cat.
>> > -
>> > -Reported-by: ZDI Disclosures <address@hidden>
>> > -Signed-off-by: Prasad J Pandit <address@hidden>
>> > ----
>> > - slirp/mbuf.c | 8 ++++----
>> > - 1 file changed, 4 insertions(+), 4 deletions(-)
>> > -
>> > -Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> > ----
>> > - slirp/mbuf.c | 8 ++++----
>> > - 1 file changed, 4 insertions(+), 4 deletions(-)
>> > -
>> > -diff --git a/slirp/mbuf.c b/slirp/mbuf.c
>> > -index 5ff2455..7fb4501 100644
>> > ---- a/slirp/mbuf.c
>> > -+++ b/slirp/mbuf.c
>> > -@@ -138,7 +138,7 @@ m_cat(struct mbuf *m, struct mbuf *n)
>> > -      * If there's no room, realloc
>> > -      */
>> > -     if (M_FREEROOM(m) < n->m_len)
>> > --            m_inc(m,m->m_size+MINCSIZE);
>> > -+               m_inc(m, m->m_len + n->m_len);
>> > -
>> > -     memcpy(m->m_data+m->m_len, n->m_data, n->m_len);
>> > -     m->m_len += n->m_len;
>> > -@@ -158,12 +158,12 @@ m_inc(struct mbuf *m, int size)
>> > -
>> > -         if (m->m_flags & M_EXT) {
>> > -       datasize = m->m_data - m->m_ext;
>> > --          m->m_ext = g_realloc(m->m_ext, size);
>> > -+          m->m_ext = g_realloc(m->m_ext, size + datasize);
>> > -       m->m_data = m->m_ext + datasize;
>> > -         } else {
>> > -       char *dat;
>> > -       datasize = m->m_data - m->m_dat;
>> > --          dat = g_malloc(size);
>> > -+          dat = g_malloc(size + datasize);
>> > -       memcpy(dat, m->m_dat, m->m_size);
>> > -
>> > -       m->m_ext = dat;
>> > -@@ -171,7 +171,7 @@ m_inc(struct mbuf *m, int size)
>> > -       m->m_flags |= M_EXT;
>> > -         }
>> > -
>> > --        m->m_size = size;
>> > -+        m->m_size = size + datasize;
>> > -
>> > - }
>> > -
>> > ---
>> > -2.13.3
>> > -
>> > diff --git a/meta/recipes-devtools/qemu/qemu_2.12.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
>> > similarity index 88%
>> > rename from meta/recipes-devtools/qemu/qemu_2.12.0.bb
>> > rename to meta/recipes-devtools/qemu/qemu_3.0.0.bb
>> > index 98db44a8ef..80da0810f1 100644
>> > --- a/meta/recipes-devtools/qemu/qemu_2.12.0.bb
>> > +++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
>> > @@ -7,7 +7,7 @@ RDEPENDS_${PN}-ptest = "bash make"
>> >   LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>> >                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>> >
>> > -SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
>> > +SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>> >              file://powerpc_rom.bin \
>> >              file://0001-sdl.c-allow-user-to-disable-pointer-grabs.patch \
>> >              file://0002-qemu-Add-missing-wacom-HID-descriptor.patch \
>> > @@ -21,7 +21,6 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
>> >              file://0009-apic-fixup-fallthrough-to-PIC.patch \
>> >              file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>> >              file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
>> > -           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
>> >              "
>> >   UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
>> >
>> > @@ -30,8 +29,8 @@ SRC_URI_append_class-native = " \
>> >               file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
>> >               "
>> >
>> > -SRC_URI[md5sum] = "122fd7cdf241ff7eb1e42c0b503b5d1b"
>> > -SRC_URI[sha256sum] = "c9f4a147bc915d24df9784affc611a115f42d24720a89210b479f1ba7a3f679c"
>> > +SRC_URI[md5sum] = "6a5c8df583406ea24ef25b239c3243e0"
>> > +SRC_URI[sha256sum] = "8d7af64fe8bd5ea5c3bdf17131a8b858491bcce1ee3839425a6d91fb821b5713"
>> >
>> >   COMPATIBLE_HOST_mipsarchn32 = "null"
>> >   COMPATIBLE_HOST_mipsarchn64 = "null"
>> >
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1217178F72
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 17:58:09 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id w6so12652553lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V2ODUN6PHB02+AMhJgwr5V+EYTQrfpvfBmy50svRMnA=;
	b=Oa1fAf7u2vhMdVpBz06kcVo4bUhHFOHSTMjObNJu9qPBclldmYTlFCniPPaqgRfKsh
	u+CP/9Oet2evDOOogKPg4AGxY1U5GUXsCF9nVO+L2Z700CATZUr7r9PgzFASph7LxrTT
	s+jn3EPFKWz5zh86lzv9k09lItpX0sWTh5wSS46BYDWxwVyAoaHMEcInLzctmB3idm9f
	P49tB1PLyUTRLH0pdI1xleVuaUw0ZqXgmIPg9inrY+RTXfGoF7Wsacuc4L+vmWonisRG
	TvewGYd7/CwmUiDNSJlRJ9mh7Viscw4DU/C5AT/HBx9ZHjmzIZWW6LlQC0Dfm88VYQ7K
	kGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V2ODUN6PHB02+AMhJgwr5V+EYTQrfpvfBmy50svRMnA=;
	b=EvczVR+4ZqKDiNTVPoyvslVXh34cIF3pSh0MlW+zwJdwriCmlBLHn5QlcmuFiqhIhI
	R+gDfYxsI/XRGUv/QYCINp9tGlbykFK0HI500wxL4hhB7pzhss0QIG4SreP0KkflJ3NR
	uhJUFwDWwzhAIqzl0x7j6OFMDU2q0WnaCywv2G3tRE/V+ueETRXLucUlI2HHKsf4BH9h
	EyFzTUR1x//XASXErclZn2TnZgNM3ZVQ1hhtle/j8xM+un0YB67sZBXZcxM8UBGWuCIS
	naGVEzIjxQ2JrExgKfFZUaFgA+7qLwPb9wIUorgYgLkkiKCixnK+2mJTCzOaoVbK8/14
	1Pfg==
X-Gm-Message-State: APjAAAUBT8gJNNKL0gFETMM3WQYe4iWkiGgLx4er2RG45+PEF1YP5pza
	b/1Y48nWX8xDQ+6K0W5TAsuDwf7jVQKBgnadDoY=
X-Google-Smtp-Source: APXvYqy8T5uga83UWD/vfNLglzdeYnV9OKTAs9+KNO8yGNwXK3ICJMzdBM64duJ2Zxan/lAKWbk9v+i/U27M1aoXqzw=
X-Received: by 2002:a19:98e:: with SMTP id 136mr21731954lfj.156.1570557490490; 
	Tue, 08 Oct 2019 10:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191008155015.15651-1-alistair.francis@wdc.com>
	<a3d0c2a3-a15f-5980-a5d0-c7b7a78895a1@gmail.com>
In-Reply-To: <a3d0c2a3-a15f-5980-a5d0-c7b7a78895a1@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Oct 2019 10:53:12 -0700
Message-ID: <CAKmqyKNm8x71xmAtj6zViiCh4QSAHrb_WSadnFdsR3M3zhuwSA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND] gdb: Bump from 8.3 to 8.3.1
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
X-List-Received-Date: Tue, 08 Oct 2019 17:58:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 8, 2019 at 10:49 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/8/19 8:50 AM, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .../gdb/{gdb-8.3.inc => gdb-8.3.1.inc}        |  5 +-
> >  ...ian_8.3.bb => gdb-cross-canadian_8.3.1.bb} |  0
> >  .../{gdb-cross_8.3.bb => gdb-cross_8.3.1.bb}  |  0
> >  .../gdb/gdb/CVE-2017-9778.patch               | 98 -------------------
> >  .../gdb/{gdb_8.3.bb => gdb_8.3.1.bb}          |  0
> >  5 files changed, 2 insertions(+), 101 deletions(-)
> >  rename meta/recipes-devtools/gdb/{gdb-8.3.inc => gdb-8.3.1.inc} (85%)
> >  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.3.bb => gdb-cross-canadian_8.3.1.bb} (100%)
> >  rename meta/recipes-devtools/gdb/{gdb-cross_8.3.bb => gdb-cross_8.3.1.bb} (100%)
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
> >  rename meta/recipes-devtools/gdb/{gdb_8.3.bb => gdb_8.3.1.bb} (100%)
>
> is this a bug fix only update?

I think so, but I don't know for sure.

Alistair

>
> - armin
> >
> > diff --git a/meta/recipes-devtools/gdb/gdb-8.3.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
> > similarity index 85%
> > rename from meta/recipes-devtools/gdb/gdb-8.3.inc
> > rename to meta/recipes-devtools/gdb/gdb-8.3.1.inc
> > index 070c17d4a1..39f1c48cc7 100644
> > --- a/meta/recipes-devtools/gdb/gdb-8.3.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
> > @@ -16,7 +16,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
> >             file://0009-Change-order-of-CFLAGS.patch \
> >             file://0010-resolve-restrict-keyword-conflict.patch \
> >             file://0011-Fix-invalid-sigprocmask-call.patch \
> > -           file://CVE-2017-9778.patch \
> >             "
> > -SRC_URI[md5sum] = "bbd95b2f9b34621ad7a19a3965476314"
> > -SRC_URI[sha256sum] = "802f7ee309dcc547d65a68d61ebd6526762d26c3051f52caebe2189ac1ffd72e"
> > +SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
> > +SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
> > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb
> > rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb
> > diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.3.bb b/meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gdb/gdb-cross_8.3.bb
> > rename to meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb
> > diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
> > deleted file mode 100644
> > index f142ed00d7..0000000000
> > --- a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
> > +++ /dev/null
> > @@ -1,98 +0,0 @@
> > -From 6ad3791f095cfc1b0294f62c4b3a524ba735595e Mon Sep 17 00:00:00 2001
> > -From: Sandra Loosemore <sandra@codesourcery.com>
> > -Date: Thu, 25 Apr 2019 07:27:02 -0700
> > -Subject: [PATCH] Detect invalid length field in debug frame FDE header.
> > -
> > -GDB was failing to catch cases where a corrupt ELF or core file
> > -contained an invalid length value in a Dwarf debug frame FDE header.
> > -It was checking for buffer overflow but not cases where the length was
> > -negative or caused pointer wrap-around.
> > -
> > -In addition to the additional validity check, this patch cleans up the
> > -multiple signed/unsigned conversions on the length field so that an
> > -unsigned representation is used consistently throughout.
> > -
> > -This patch fixes CVE-2017-9778 and PR gdb/21600.
> > -
> > -2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
> > -         Kang Li <kanglictf@gmail.com>
> > -
> > -     PR gdb/21600
> > -
> > -     * dwarf2-frame.c (read_initial_length): Be consistent about using
> > -     unsigned representation of length.
> > -     (decode_frame_entry_1): Likewise.  Check for wraparound of
> > -     end pointer as well as buffer overflow.
> > -
> > -Upstream-Status: Backport
> > -CVE: CVE-2017-9778
> > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ----
> > - gdb/ChangeLog      | 10 ++++++++++
> > - gdb/dwarf2-frame.c | 14 +++++++-------
> > - 2 files changed, 17 insertions(+), 7 deletions(-)
> > -
> > -diff --git a/gdb/ChangeLog b/gdb/ChangeLog
> > -index 1c125de..d028d2b 100644
> > ---- a/gdb/ChangeLog
> > -+++ b/gdb/ChangeLog
> > -@@ -1,3 +1,13 @@
> > -+2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
> > -+    Kang Li <kanglictf@gmail.com>
> > -+
> > -+    PR gdb/21600
> > -+
> > -+    * dwarf2-frame.c (read_initial_length): Be consistent about using
> > -+    unsigned representation of length.
> > -+    (decode_frame_entry_1): Likewise.  Check for wraparound of
> > -+    end pointer as well as buffer overflow.
> > -+
> > - 2019-05-11  Joel Brobecker  <brobecker@adacore.com>
> > -
> > -     * version.in: Set GDB version number to 8.3.
> > -diff --git a/gdb/dwarf2-frame.c b/gdb/dwarf2-frame.c
> > -index 178ac44..dc5d3b3 100644
> > ---- a/gdb/dwarf2-frame.c
> > -+++ b/gdb/dwarf2-frame.c
> > -@@ -1488,7 +1488,7 @@ static ULONGEST
> > - read_initial_length (bfd *abfd, const gdb_byte *buf,
> > -                  unsigned int *bytes_read_ptr)
> > - {
> > --  LONGEST result;
> > -+  ULONGEST result;
> > -
> > -   result = bfd_get_32 (abfd, buf);
> > -   if (result == 0xffffffff)
> > -@@ -1789,7 +1789,7 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
> > - {
> > -   struct gdbarch *gdbarch = get_objfile_arch (unit->objfile);
> > -   const gdb_byte *buf, *end;
> > --  LONGEST length;
> > -+  ULONGEST length;
> > -   unsigned int bytes_read;
> > -   int dwarf64_p;
> > -   ULONGEST cie_id;
> > -@@ -1800,15 +1800,15 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
> > -   buf = start;
> > -   length = read_initial_length (unit->abfd, buf, &bytes_read);
> > -   buf += bytes_read;
> > --  end = buf + length;
> > --
> > --  /* Are we still within the section?  */
> > --  if (end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
> > --    return NULL;
> > -+  end = buf + (size_t) length;
> > -
> > -   if (length == 0)
> > -     return end;
> > -
> > -+  /* Are we still within the section?  */
> > -+  if (end <= buf || end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
> > -+    return NULL;
> > -+
> > -   /* Distinguish between 32 and 64-bit encoded frame info.  */
> > -   dwarf64_p = (bytes_read == 12);
> > -
> > ---
> > -2.20.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb_8.3.bb b/meta/recipes-devtools/gdb/gdb_8.3.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gdb/gdb_8.3.bb
> > rename to meta/recipes-devtools/gdb/gdb_8.3.1.bb
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6226F60107
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 14:01:12 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y15-v6so36453940wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BhP2JPfxXqUJZV6iigKPUOW9+sfMeum7yAvJ/5F4Qps=;
	b=Jth3RFsc8Y9gyA3c92ZIZ6VP/q/ok4meZ8OEw0vDTYaNWbTM1Gzey6akvx1WedGAzf
	uEKEgEjrUdEFX2Q9zhcNujtimlsbGq+fSOwbLIMSOfKGAAlf0SqIYBgKtAVr7L2VgrOR
	Iacl5DUDOEnebF0OQcNpIQFfsCJZwJXUXZ/3UnkXZE4PMmjIRA18CsTVPCN7gBV20beI
	zVxvDU6N8pY0UtXHUmZhkfoN4DRJZ9lB1mECB+otQgPBHceMkO7Dk7/DgPBCwrYeJSpA
	G1o1Ere599AE1aPdfgRIwqo353U6Uc3DE/DhjUkYPcQyqOvQYXpbz9hhzDbrZjlSqUci
	NMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BhP2JPfxXqUJZV6iigKPUOW9+sfMeum7yAvJ/5F4Qps=;
	b=B++vrGySlb6VuoSdKz9KKtg4wQtlub5l8OItJCYORDxBSUJGpdrZRLd5X3PFOUz+4F
	BykuA4I4wshtishEvH6l3RMRYLlSZsVt8QURl1n66qu00EbbH0LDyK8O+kGJW29sf8R8
	b2peSm5yEFbHnmuh+dkRTJ4DHc1m/EPYCdLXQ7vSnLdKg+w+hYmjFZX7m03/tPheZ8RS
	Sn4m4LrrY7sO0/sJqGpxr6qBEoKOLGDV5iEqzUohrmlGQ09t8W9tXCthr7VCa/9nGKK0
	hKe/QHC5q1/MzLuXKig/hrIrkLlNeYE4pwhNa5cyfCh/ivtlgWJQd0hhN2/tHaZeTzjt
	kURw==
X-Gm-Message-State: ALKqPwd06T5babdcgK7VX8YG/KKNeXOMUqMN63eLGIpLd6JOJ6bSMNTY
	W3jTGEKig4QmI/QrY4Cqh1K2gBai8jvIhmHT7IU=
X-Google-Smtp-Source: ADUXVKJYtBEVHQVhmvgn7dNoSjXVD7OtQOWKlvyDoZKut66VFUuNJLwxc+3JoLKUpPKATkJ7UW1QV6gL+yrDva9cb2o=
X-Received: by 2002:adf:9561:: with SMTP id
	88-v6mr4488475wrs.223.1527861673668; 
	Fri, 01 Jun 2018 07:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20180528155833.24224-1-raj.khem@gmail.com>
	<CA+chaQdTQ8OCmXthjY_Fyq+7En9=GMk8A_KpmVwehuBy6oJvYQ@mail.gmail.com>
	<CAMKF1sq4xaHNsNBxuLWmhGiuwO2rpRZPbQQhZETnU17hTku=pA@mail.gmail.com>
In-Reply-To: <CAMKF1sq4xaHNsNBxuLWmhGiuwO2rpRZPbQQhZETnU17hTku=pA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Jun 2018 16:01:03 +0200
Message-ID: <CA+chaQccOte4qfnqP7gUxr7DYmweJ2yw0TNJQoZeYCLYTwD3vQ@mail.gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] systemd: Fix build with gcc8
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
X-List-Received-Date: Fri, 01 Jun 2018 14:01:13 -0000
Content-Type: multipart/alternative; boundary="000000000000533313056d950490"

--000000000000533313056d950490
Content-Type: text/plain; charset="UTF-8"

No change in PACKAGECONFIG, just default nodistro qemux86 with added
systemd and debug build:
DISTRO_FEATURES_append = " systemd"
DEBUG_BUILD = "1"


On Thu, May 31, 2018 at 6:17 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 31, 2018 at 9:05 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Unlike the previous version you had in your RFT branch (which added
> > -Wno-error=format-truncation) this doesn't seem to be complete fix.
> >
> > In qemux86 build which already includes this change I'm seeing:
> > ../git/src/basic/time-util.c: In function 'format_timespan':
> > ../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output
> > between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX'
> > [-Werror=format-truncation=]
> >
> > "%s"USEC_FMT".%0*"PRI_USEC"%s",
> >                                               ^~~~
> > ../git/src/basic/time-util.c:508:60: note: format string is defined here
> >
> > "%s"USEC_FMT".%0*"PRI_USEC"%s",
> > ../git/src/basic/time-util.c:508:46: note: directive argument in the
> range
> > [0, 18446744073709551614]
> >
> > "%s"USEC_FMT".%0*"PRI_USEC"%s",
> >                                               ^~~~
> >
> > And this part doesn't seem to be fixed upstream yet.
> >
>
> Its possible, that default config I build is not using this code. Do
> you enable/disable some specific packageconfig and what arch are you
> targetting
>
> > Cheers,
> >
> > On Mon, May 28, 2018 at 5:58 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  ...ange-the-default-device-timeout-to-2.patch |   9 +-
> >>  ...ation-compile-failure-by-typecasting.patch | 173 ++++++++++++++++++
> >>  meta/recipes-core/systemd/systemd_237.bb      |   1 +
> >>  3 files changed, 177 insertions(+), 6 deletions(-)
> >>  create mode 100644
> >>
> meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> >>
> >> diff --git
> >>
> a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> >>
> b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> >> index b7b1ea0886..98c83620ff 100644
> >> ---
> >>
> a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> >> +++
> >>
> b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> >> @@ -1,4 +1,4 @@
> >> -From 9820c165a9e559cf851e3beb60fad2571de4ded2 Mon Sep 17 00:00:00 2001
> >> +From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00 2001
> >>  From: Khem Raj <raj.khem@gmail.com>
> >>  Date: Mon, 14 Dec 2015 04:09:19 +0000
> >>  Subject: [PATCH] core/device.c: Change the default device timeout to
> 240
> >> sec.
> >> @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>  diff --git a/src/core/device.c b/src/core/device.c
> >> -index 77601c552..98bf49ba2 100644
> >> +index a43664d3b..4b16a8aec 100644
> >>  --- a/src/core/device.c
> >>  +++ b/src/core/device.c
> >> -@@ -112,7 +112,7 @@ static void device_init(Unit *u) {
> >> +@@ -113,7 +113,7 @@ static void device_init(Unit *u) {
> >>            * indefinitely for plugged in devices, something which cannot
> >>            * happen for the other units since their operations time out
> >>            * anyway. */
> >> @@ -28,6 +28,3 @@ index 77601c552..98bf49ba2 100644
> >>
> >>           u->ignore_on_isolate = true;
> >>   }
> >> ---
> >> -2.16.1
> >> -
> >> diff --git
> >>
> a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> >>
> b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> >> new file mode 100644
> >> index 0000000000..e56061f41b
> >> --- /dev/null
> >> +++
> >>
> b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> >> @@ -0,0 +1,173 @@
> >> +From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17 00:00:00 2001
> >> +From: Patrick Uiterwijk <patrick@puiterwijk.org>
> >> +Date: Thu, 22 Feb 2018 19:41:30 +0100
> >> +Subject: [PATCH] Fix format-truncation compile failure by typecasting
> USB
> >> IDs
> >> + (#8250)
> >> +
> >> +This patch adds safe_atoux16 for parsing an unsigned hexadecimal 16bit
> >> int, and
> >> +uses that for parsing USB device and vendor IDs.
> >> +
> >> +This fixes a compile error with gcc-8 because while we know that USB
> IDs
> >> are 2 bytes,
> >> +the compiler does not know that.
> >> +
> >> +../src/udev/udev-builtin-hwdb.c:80:38: error: '%04X' directive output
> may
> >> be
> >> +truncated writing between 4 and 8 bytes into a region of size between 2
> >> and 6
> >> +[-Werror=format-truncation=]
> >> +
> >> +Upstream-Status: Backport
> >> [
> https://github.com/systemd/systemd/commit/5547c12503a683290eaed47954ffcfb2d1bc03cd
> ]
> >> +
> >> +Signed-off-by: Adam Williamson <awilliam@redhat.com>
> >> +Signed-off-by: Patrick Uiterwijk <puiterwijk@redhat.com>
> >> +---
> >> + src/basic/parse-util.c       | 24 ++++++++++++++++++++++
> >> + src/basic/parse-util.h       |  2 ++
> >> + src/test/test-parse-util.c   | 39 ++++++++++++++++++++++++++++++++++++
> >> + src/udev/udev-builtin-hwdb.c | 13 ++++++------
> >> + 4 files changed, 71 insertions(+), 7 deletions(-)
> >> +
> >> +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> >> +index 97533721d..ff3fc298a 100644
> >> +--- a/src/basic/parse-util.c
> >> ++++ b/src/basic/parse-util.c
> >> +@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *ret) {
> >> +         return 0;
> >> + }
> >> +
> >> ++int safe_atoux16(const char *s, uint16_t *ret) {
> >> ++        char *x = NULL;
> >> ++        unsigned long l;
> >> ++
> >> ++        assert(s);
> >> ++        assert(ret);
> >> ++
> >> ++        s += strspn(s, WHITESPACE);
> >> ++
> >> ++        errno = 0;
> >> ++        l = strtoul(s, &x, 16);
> >> ++        if (errno > 0)
> >> ++                return -errno;
> >> ++        if (!x || x == s || *x != 0)
> >> ++                return -EINVAL;
> >> ++        if (s[0] == '-')
> >> ++                return -ERANGE;
> >> ++        if ((unsigned long) (uint16_t) l != l)
> >> ++                return -ERANGE;
> >> ++
> >> ++        *ret = (uint16_t) l;
> >> ++        return 0;
> >> ++}
> >> ++
> >> + int safe_atod(const char *s, double *ret_d) {
> >> +         _cleanup_(freelocalep) locale_t loc = (locale_t) 0;
> >> +         char *x = NULL;
> >> +diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h
> >> +index 1eda1d7f9..727422056 100644
> >> +--- a/src/basic/parse-util.h
> >> ++++ b/src/basic/parse-util.h
> >> +@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);
> >> + int safe_atou16(const char *s, uint16_t *ret);
> >> + int safe_atoi16(const char *s, int16_t *ret);
> >> +
> >> ++int safe_atoux16(const char *s, uint16_t *ret);
> >> ++
> >> + static inline int safe_atou32(const char *s, uint32_t *ret_u) {
> >> +         assert_cc(sizeof(uint32_t) == sizeof(unsigned));
> >> +         return safe_atou(s, (unsigned*) ret_u);
> >> +diff --git a/src/test/test-parse-util.c b/src/test/test-parse-util.c
> >> +index 937500213..a99cea5a1 100644
> >> +--- a/src/test/test-parse-util.c
> >> ++++ b/src/test/test-parse-util.c
> >> +@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {
> >> +         assert_se(r == -EINVAL);
> >> + }
> >> +
> >> ++static void test_safe_atoux16(void) {
> >> ++        int r;
> >> ++        uint16_t l;
> >> ++
> >> ++        r = safe_atoux16("1234", &l);
> >> ++        assert_se(r == 0);
> >> ++        assert_se(l == 0x1234);
> >> ++
> >> ++        r = safe_atoux16("abcd", &l);
> >> ++        assert_se(r == 0);
> >> ++        assert_se(l == 0xabcd);
> >> ++
> >> ++        r = safe_atoux16("  1234", &l);
> >> ++        assert_se(r == 0);
> >> ++        assert_se(l == 0x1234);
> >> ++
> >> ++        r = safe_atoux16("12345", &l);
> >> ++        assert_se(r == -ERANGE);
> >> ++
> >> ++        r = safe_atoux16("-1", &l);
> >> ++        assert_se(r == -ERANGE);
> >> ++
> >> ++        r = safe_atoux16("  -1", &l);
> >> ++        assert_se(r == -ERANGE);
> >> ++
> >> ++        r = safe_atoux16("junk", &l);
> >> ++        assert_se(r == -EINVAL);
> >> ++
> >> ++        r = safe_atoux16("123x", &l);
> >> ++        assert_se(r == -EINVAL);
> >> ++
> >> ++        r = safe_atoux16("12.3", &l);
> >> ++        assert_se(r == -EINVAL);
> >> ++
> >> ++        r = safe_atoux16("", &l);
> >> ++        assert_se(r == -EINVAL);
> >> ++}
> >> ++
> >> + static void test_safe_atou64(void) {
> >> +         int r;
> >> +         uint64_t l;
> >> +@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {
> >> +         test_safe_atolli();
> >> +         test_safe_atou16();
> >> +         test_safe_atoi16();
> >> ++        test_safe_atoux16();
> >> +         test_safe_atou64();
> >> +         test_safe_atoi64();
> >> +         test_safe_atod();
> >> +diff --git a/src/udev/udev-builtin-hwdb.c
> b/src/udev/udev-builtin-hwdb.c
> >> +index ca7f7c230..dbfe02429 100644
> >> +--- a/src/udev/udev-builtin-hwdb.c
> >> ++++ b/src/udev/udev-builtin-hwdb.c
> >> +@@ -27,6 +27,7 @@
> >> +
> >> + #include "alloc-util.h"
> >> + #include "hwdb-util.h"
> >> ++#include "parse-util.h"
> >> + #include "string-util.h"
> >> + #include "udev-util.h"
> >> + #include "udev.h"
> >> +@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct udev_device *dev,
> >> +
> >> + static const char *modalias_usb(struct udev_device *dev, char *s,
> size_t
> >> size) {
> >> +         const char *v, *p;
> >> +-        int vn, pn;
> >> ++        uint16_t vn, pn;
> >> +
> >> +         v = udev_device_get_sysattr_value(dev, "idVendor");
> >> +         if (!v)
> >> +@@ -71,12 +72,10 @@ static const char *modalias_usb(struct udev_device
> >> *dev, char *s, size_t size) {
> >> +         p = udev_device_get_sysattr_value(dev, "idProduct");
> >> +         if (!p)
> >> +                 return NULL;
> >> +-        vn = strtol(v, NULL, 16);
> >> +-        if (vn <= 0)
> >> +-                return NULL;
> >> +-        pn = strtol(p, NULL, 16);
> >> +-        if (pn <= 0)
> >> +-                return NULL;
> >> ++        if (safe_atoux16(v, &vn) < 0)
> >> ++              return NULL;
> >> ++        if (safe_atoux16(p, &pn) < 0)
> >> ++              return NULL;
> >> +         snprintf(s, size, "usb:v%04Xp%04X*", vn, pn);
> >> +         return s;
> >> + }
> >> +--
> >> +2.17.0
> >> +
> >> diff --git a/meta/recipes-core/systemd/systemd_237.bb
> >> b/meta/recipes-core/systemd/systemd_237.bb
> >> index b7c2113255..c4743a6b9d 100644
> >> --- a/meta/recipes-core/systemd/systemd_237.bb
> >> +++ b/meta/recipes-core/systemd/systemd_237.bb
> >> @@ -52,6 +52,7 @@ SRC_URI += "file://touchscreen.rules \
> >>             file://0032-memfd.patch \
> >>
> >> file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch \
> >>             file://libmount.patch \
> >> +
> >> file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
> >>             "
> >>  SRC_URI_append_qemuall = "
> >> file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
> >>
> >> --
> >> 2.17.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000533313056d950490
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No change in PACKAGECONFIG, just default nodistro qem=
ux86 with added systemd and debug build:</div><div><div>DISTRO_FEATURES_app=
end =3D &quot; systemd&quot;</div><div>DEBUG_BUILD =3D &quot;1&quot;</div><=
/div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Thu, May 31, 2018 at 6:17 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Thu, May 31, 2018 at 9:05 AM, Martin Jansa &lt;<=
a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gma=
il.com</a>&gt; wrote:<br>
&gt; Unlike the previous version you had in your RFT branch (which added<br=
>
&gt; -Wno-error=3Dformat-truncation) this doesn&#39;t seem to be complete f=
ix.<br>
&gt;<br>
&gt; In qemux86 build which already includes this change I&#39;m seeing:<br=
>
&gt; ../git/src/basic/time-util.c: In function &#39;format_timespan&#39;:<b=
r>
&gt; ../git/src/basic/time-util.c:508:46: error: &#39;%0*llu&#39; directive=
 output<br>
&gt; between 1 and 2147483647 bytes may cause result to exceed &#39;INT_MAX=
&#39;<br>
&gt; [-Werror=3Dformat-truncation=3D]<br>
&gt;<br>
&gt; &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt; ../git/src/basic/time-util.c:508:60: note: format string is defined he=
re<br>
&gt;<br>
&gt; &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&quot;,<br>
&gt; ../git/src/basic/time-util.c:508:46: note: directive argument in the r=
ange<br>
&gt; [0, 18446744073709551614]<br>
&gt;<br>
&gt; &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt;<br>
&gt; And this part doesn&#39;t seem to be fixed upstream yet.<br>
&gt;<br>
<br>
Its possible, that default config I build is not using this code. Do<br>
you enable/disable some specific packageconfig and what arch are you<br>
targetting<br>
<br>
&gt; Cheers,<br>
&gt;<br>
&gt; On Mon, May 28, 2018 at 5:58 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...ange-the-default-device-timeout-to-2.patch |=C2=A0 =C2=A0=
9 +-<br>
&gt;&gt;=C2=A0 ...ation-compile-failure-by-typecasting.patch | 173 ++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_237.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 3 files changed, 177 insertions(+), 6 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644<br>
&gt;&gt; meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compi=
le-failure-by-typecasting.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-=
default-device-timeout-to-2.patch<br>
&gt;&gt; b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-=
default-device-timeout-to-2.patch<br>
&gt;&gt; index b7b1ea0886..98c83620ff 100644<br>
&gt;&gt; ---<br>
&gt;&gt; a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-=
default-device-timeout-to-2.patch<br>
&gt;&gt; +++<br>
&gt;&gt; b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-=
default-device-timeout-to-2.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 9820c165a9e559cf851e3beb60fad2571de4ded2 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Mon, 14 Dec 2015 04:09:19 +0000<br>
&gt;&gt;=C2=A0 Subject: [PATCH] core/device.c: Change the default device ti=
meout to 240<br>
&gt;&gt; sec.<br>
&gt;&gt; @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 diff --git a/src/core/device.c b/src/core/device.c<br>
&gt;&gt; -index 77601c552..98bf49ba2 100644<br>
&gt;&gt; +index a43664d3b..4b16a8aec 100644<br>
&gt;&gt;=C2=A0 --- a/src/core/device.c<br>
&gt;&gt;=C2=A0 +++ b/src/core/device.c<br>
&gt;&gt; -@@ -112,7 +112,7 @@ static void device_init(Unit *u) {<br>
&gt;&gt; +@@ -113,7 +113,7 @@ static void device_init(Unit *u) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * indefinitely for plugge=
d in devices, something which cannot<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * happen for the other un=
its since their operations time out<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * anyway. */<br>
&gt;&gt; @@ -28,6 +28,3 @@ index 77601c552..98bf49ba2 100644<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u-&gt;ignore_on_isolate =
=3D true;<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt; ---<br>
&gt;&gt; -2.16.1<br>
&gt;&gt; -<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-com=
pile-failure-by-typecasting.patch<br>
&gt;&gt; b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-com=
pile-failure-by-typecasting.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..e56061f41b<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-com=
pile-failure-by-typecasting.patch<br>
&gt;&gt; @@ -0,0 +1,173 @@<br>
&gt;&gt; +From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Patrick Uiterwijk &lt;<a href=3D"mailto:patrick@puiterwijk.=
org" target=3D"_blank">patrick@puiterwijk.org</a>&gt;<br>
&gt;&gt; +Date: Thu, 22 Feb 2018 19:41:30 +0100<br>
&gt;&gt; +Subject: [PATCH] Fix format-truncation compile failure by typecas=
ting USB<br>
&gt;&gt; IDs<br>
&gt;&gt; + (#8250)<br>
&gt;&gt; +<br>
&gt;&gt; +This patch adds safe_atoux16 for parsing an unsigned hexadecimal =
16bit<br>
&gt;&gt; int, and<br>
&gt;&gt; +uses that for parsing USB device and vendor IDs.<br>
&gt;&gt; +<br>
&gt;&gt; +This fixes a compile error with gcc-8 because while we know that =
USB IDs<br>
&gt;&gt; are 2 bytes,<br>
&gt;&gt; +the compiler does not know that.<br>
&gt;&gt; +<br>
&gt;&gt; +../src/udev/udev-builtin-hwdb.c:80:38: error: &#39;%04X&#39; dire=
ctive output may<br>
&gt;&gt; be<br>
&gt;&gt; +truncated writing between 4 and 8 bytes into a region of size bet=
ween 2<br>
&gt;&gt; and 6<br>
&gt;&gt; +[-Werror=3Dformat-truncation=3D]<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport<br>
&gt;&gt; [<a href=3D"https://github.com/systemd/systemd/commit/5547c12503a6=
83290eaed47954ffcfb2d1bc03cd" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/systemd/systemd/commit/5547c12503a683290eaed47954ffcfb2d1bc03cd<=
/a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Adam Williamson &lt;<a href=3D"mailto:awilliam@red=
hat.com" target=3D"_blank">awilliam@redhat.com</a>&gt;<br>
&gt;&gt; +Signed-off-by: Patrick Uiterwijk &lt;<a href=3D"mailto:puiterwijk=
@redhat.com" target=3D"_blank">puiterwijk@redhat.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/basic/parse-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++=
++++++++++++<br>
&gt;&gt; + src/basic/parse-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br=
>
&gt;&gt; + src/test/test-parse-util.c=C2=A0 =C2=A0| 39 ++++++++++++++++++++=
++++++++++++++++<br>
&gt;&gt; + src/udev/udev-builtin-hwdb.c | 13 ++++++------<br>
&gt;&gt; + 4 files changed, 71 insertions(+), 7 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c<br>
&gt;&gt; +index 97533721d..ff3fc298a 100644<br>
&gt;&gt; +--- a/src/basic/parse-util.c<br>
&gt;&gt; ++++ b/src/basic/parse-util.c<br>
&gt;&gt; +@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *ret)=
 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; ++int safe_atoux16(const char *s, uint16_t *ret) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *x =3D NULL;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long l;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(s);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ret);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D strspn(s, WHITESPACE);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D strtoul(s, &amp;x, 16);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno &gt; 0)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -=
errno;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!x || x =3D=3D s || *x !=3D 0)<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -=
EINVAL;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s[0] =3D=3D &#39;-&#39;)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -=
ERANGE;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((unsigned long) (uint16_t) l !=
=3D l)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -=
ERANGE;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D (uint16_t) l;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; + int safe_atod(const char *s, double *ret_d) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_(freelocalep) locale_t=
 loc =3D (locale_t) 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *x =3D NULL;<br>
&gt;&gt; +diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h<br>
&gt;&gt; +index 1eda1d7f9..727422056 100644<br>
&gt;&gt; +--- a/src/basic/parse-util.h<br>
&gt;&gt; ++++ b/src/basic/parse-util.h<br>
&gt;&gt; +@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);<br=
>
&gt;&gt; + int safe_atou16(const char *s, uint16_t *ret);<br>
&gt;&gt; + int safe_atoi16(const char *s, int16_t *ret);<br>
&gt;&gt; +<br>
&gt;&gt; ++int safe_atoux16(const char *s, uint16_t *ret);<br>
&gt;&gt; ++<br>
&gt;&gt; + static inline int safe_atou32(const char *s, uint32_t *ret_u) {<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_cc(sizeof(uint32_t) =3D=
=3D sizeof(unsigned));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return safe_atou(s, (unsigned*)=
 ret_u);<br>
&gt;&gt; +diff --git a/src/test/test-parse-util.c b/src/test/test-parse-uti=
l.c<br>
&gt;&gt; +index 937500213..a99cea5a1 100644<br>
&gt;&gt; +--- a/src/test/test-parse-util.c<br>
&gt;&gt; ++++ b/src/test/test-parse-util.c<br>
&gt;&gt; +@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(r =3D=3D -EINVAL);<br=
>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; ++static void test_safe_atoux16(void) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t l;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;1234&quot;,=
 &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0x1234);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;abcd&quot;,=
 &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0xabcd);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;=C2=A0 1234=
&quot;, &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0x1234);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;12345&quot;=
, &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;-1&quot;, &=
amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;=C2=A0 -1&q=
uot;, &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;junk&quot;,=
 &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;123x&quot;,=
 &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;12.3&quot;,=
 &amp;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;&quot;, &am=
p;l);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; + static void test_safe_atou64(void) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t l;<br>
&gt;&gt; +@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atolli();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atou16();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atoi16();<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_safe_atoux16();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atou64();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atoi64();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atod();<br>
&gt;&gt; +diff --git a/src/udev/udev-builtin-hwdb.c b/src/udev/udev-builtin=
-hwdb.c<br>
&gt;&gt; +index ca7f7c230..dbfe02429 100644<br>
&gt;&gt; +--- a/src/udev/udev-builtin-hwdb.c<br>
&gt;&gt; ++++ b/src/udev/udev-builtin-hwdb.c<br>
&gt;&gt; +@@ -27,6 +27,7 @@<br>
&gt;&gt; +<br>
&gt;&gt; + #include &quot;alloc-util.h&quot;<br>
&gt;&gt; + #include &quot;hwdb-util.h&quot;<br>
&gt;&gt; ++#include &quot;parse-util.h&quot;<br>
&gt;&gt; + #include &quot;string-util.h&quot;<br>
&gt;&gt; + #include &quot;udev-util.h&quot;<br>
&gt;&gt; + #include &quot;udev.h&quot;<br>
&gt;&gt; +@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct udev_device=
 *dev,<br>
&gt;&gt; +<br>
&gt;&gt; + static const char *modalias_usb(struct udev_device *dev, char *s=
, size_t<br>
&gt;&gt; size) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *v, *p;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vn, pn;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t vn, pn;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v =3D udev_device_get_sysattr_v=
alue(dev, &quot;idVendor&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!v)<br>
&gt;&gt; +@@ -71,12 +72,10 @@ static const char *modalias_usb(struct udev_d=
evice<br>
&gt;&gt; *dev, char *s, size_t size) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D udev_device_get_sysattr_v=
alue(dev, &quot;idProduct&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn NULL;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vn =3D strtol(v, NULL, 16);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vn &lt;=3D 0)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return N=
ULL;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D strtol(p, NULL, 16);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pn &lt;=3D 0)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return N=
ULL;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (safe_atoux16(v, &amp;vn) &lt; 0)=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br=
>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (safe_atoux16(p, &amp;pn) &lt; 0)=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(s, size, &quot;usb:v%0=
4Xp%04X*&quot;, vn, pn);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s;<br>
&gt;&gt; + }<br>
&gt;&gt; +--<br>
&gt;&gt; +2.17.0<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_2=
37.bb" rel=3D"noreferrer" target=3D"_blank">systemd_237.bb</a><br>
&gt;&gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_237.bb</a><br>
&gt;&gt; index b7c2113255..c4743a6b9d 100644<br>
&gt;&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_237.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_237.bb</a><br>
&gt;&gt; @@ -52,6 +52,7 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-memfd.p=
atch \<br>
&gt;&gt;<br>
&gt;&gt; file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patc=
h \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libmount.pat=
ch \<br>
&gt;&gt; +<br>
&gt;&gt; file://0034-Fix-format-truncation-compile-failure-by-typecasting.p=
atch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI_append_qemuall =3D &quot;<br>
&gt;&gt; file://0001-core-device.c-Change-the-default-device-timeout-to-2.p=
atch&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000533313056d950490--

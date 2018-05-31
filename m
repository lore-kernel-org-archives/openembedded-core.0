Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id A323574DA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 16:05:13 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id v13-v6so21853356wrp.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zgke8oXQetAvpKpYEYOlrlOqnYnNCOcDvLGpPZBOaNQ=;
	b=svVhw97J2C4C3XhOco+91qOIKDcOz3fqibiu2FnaWY7V01G7ZhfxhQ+soepm6FvOHr
	RrwFdVdyjQ4M4VAcYmN7Funp+s2Gf2gsAI4urQoDwbkIjEj+tZrr+88YiMRxaGJogmBZ
	F2Pi3g1+KieFJcPdOEolUl0EMEp038o1A6pF+2bdbI6Uz+iqbfIvBTVF9QpW5zY1M1tS
	KUtBFXcc3PvjVUz6xXntIRNT1ds79f02vwRuF0RsJKHqF36nDzCRFBGuzMmpOvHNU1/z
	GqCAGwqptuCcCD92wkgvlNDZJVUhEiEm3UjH5p/9Xb/5Ymh51/U/W2yHbvtWaaGIsBA4
	nd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zgke8oXQetAvpKpYEYOlrlOqnYnNCOcDvLGpPZBOaNQ=;
	b=p6XGzTaP5vSqjwHNO41G1QAJbugTm2o/QfnvLkVlPV1f8ZB985sYGjKHxl8GY4u13N
	Qhnh+kMeCscYTZwAnPIyBbPIoq6TGE2KRLUCdIWGkzm6zKeAH9mLBav8HUBfn7NrEysO
	eaY2E58iJobfbGwXh5zwOJyjOc7VKOVoa6AqQpypehATbQ/qgpcsrdYyOQ+1PWqRVWEB
	hYTmn3OUmpOOnQCL9pVOygkXfBZ6RA59lpPHdGVXbHP8sODWAfdtN8Bcp+vt2396g28h
	dW5zS0CknIJwdKPeAy0aQBM7Y1AOu589ZsC1FBaFlU+i4QzFebKYXztndQkYndWYFChU
	GwZA==
X-Gm-Message-State: ALKqPwf+dEkbchHhbqAjASUlSjwwNnd1JhLkHOfsLEcoErj3B+ctc92H
	9GkGIiKT1Fag1qQyTeMkOpfUsCL2Qjg4gFmCoNU=
X-Google-Smtp-Source: ADUXVKKfP8JnkNm0BDy/xLxOhFET6YoJetX0z10kTnTv7nuD1R9mTHz1uQAtvITIDXpliWaS0Ul2WMassyS4R4c0IeE=
X-Received: by 2002:adf:f546:: with SMTP id
	j6-v6mr5473501wrp.241.1527782714103; 
	Thu, 31 May 2018 09:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180528155833.24224-1-raj.khem@gmail.com>
In-Reply-To: <20180528155833.24224-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 31 May 2018 18:05:03 +0200
Message-ID: <CA+chaQdTQ8OCmXthjY_Fyq+7En9=GMk8A_KpmVwehuBy6oJvYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 31 May 2018 16:05:14 -0000
Content-Type: multipart/alternative; boundary="000000000000f7da9c056d82a1d4"

--000000000000f7da9c056d82a1d4
Content-Type: text/plain; charset="UTF-8"

Unlike the previous version you had in your RFT branch (which
added -Wno-error=format-truncation) this doesn't seem to be complete fix.

In qemux86 build which already includes this change I'm seeing:
../git/src/basic/time-util.c: In function 'format_timespan':
../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output
between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX'
[-Werror=format-truncation=]

"%s"USEC_FMT".%0*"PRI_USEC"%s",
                                              ^~~~
../git/src/basic/time-util.c:508:60: note: format string is defined here

"%s"USEC_FMT".%0*"PRI_USEC"%s",
../git/src/basic/time-util.c:508:46: note: directive argument in the range
[0, 18446744073709551614]

"%s"USEC_FMT".%0*"PRI_USEC"%s",
                                              ^~~~

And this part doesn't seem to be fixed upstream yet.

Cheers,

On Mon, May 28, 2018 at 5:58 PM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ange-the-default-device-timeout-to-2.patch |   9 +-
>  ...ation-compile-failure-by-typecasting.patch | 173 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_237.bb      |   1 +
>  3 files changed, 177 insertions(+), 6 deletions(-)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> index b7b1ea0886..98c83620ff 100644
> ---
> a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> +++
> b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> @@ -1,4 +1,4 @@
> -From 9820c165a9e559cf851e3beb60fad2571de4ded2 Mon Sep 17 00:00:00 2001
> +From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 14 Dec 2015 04:09:19 +0000
>  Subject: [PATCH] core/device.c: Change the default device timeout to 240
> sec.
> @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/core/device.c b/src/core/device.c
> -index 77601c552..98bf49ba2 100644
> +index a43664d3b..4b16a8aec 100644
>  --- a/src/core/device.c
>  +++ b/src/core/device.c
> -@@ -112,7 +112,7 @@ static void device_init(Unit *u) {
> +@@ -113,7 +113,7 @@ static void device_init(Unit *u) {
>            * indefinitely for plugged in devices, something which cannot
>            * happen for the other units since their operations time out
>            * anyway. */
> @@ -28,6 +28,3 @@ index 77601c552..98bf49ba2 100644
>
>           u->ignore_on_isolate = true;
>   }
> ---
> -2.16.1
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> new file mode 100644
> index 0000000000..e56061f41b
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
> @@ -0,0 +1,173 @@
> +From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17 00:00:00 2001
> +From: Patrick Uiterwijk <patrick@puiterwijk.org>
> +Date: Thu, 22 Feb 2018 19:41:30 +0100
> +Subject: [PATCH] Fix format-truncation compile failure by typecasting USB
> IDs
> + (#8250)
> +
> +This patch adds safe_atoux16 for parsing an unsigned hexadecimal 16bit
> int, and
> +uses that for parsing USB device and vendor IDs.
> +
> +This fixes a compile error with gcc-8 because while we know that USB IDs
> are 2 bytes,
> +the compiler does not know that.
> +
> +../src/udev/udev-builtin-hwdb.c:80:38: error: '%04X' directive output may
> be
> +truncated writing between 4 and 8 bytes into a region of size between 2
> and 6
> +[-Werror=format-truncation=]
> +
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/commit/5547c12503a683290eaed47954ffcfb2d1bc03cd
> ]
> +
> +Signed-off-by: Adam Williamson <awilliam@redhat.com>
> +Signed-off-by: Patrick Uiterwijk <puiterwijk@redhat.com>
> +---
> + src/basic/parse-util.c       | 24 ++++++++++++++++++++++
> + src/basic/parse-util.h       |  2 ++
> + src/test/test-parse-util.c   | 39 ++++++++++++++++++++++++++++++++++++
> + src/udev/udev-builtin-hwdb.c | 13 ++++++------
> + 4 files changed, 71 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> +index 97533721d..ff3fc298a 100644
> +--- a/src/basic/parse-util.c
> ++++ b/src/basic/parse-util.c
> +@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *ret) {
> +         return 0;
> + }
> +
> ++int safe_atoux16(const char *s, uint16_t *ret) {
> ++        char *x = NULL;
> ++        unsigned long l;
> ++
> ++        assert(s);
> ++        assert(ret);
> ++
> ++        s += strspn(s, WHITESPACE);
> ++
> ++        errno = 0;
> ++        l = strtoul(s, &x, 16);
> ++        if (errno > 0)
> ++                return -errno;
> ++        if (!x || x == s || *x != 0)
> ++                return -EINVAL;
> ++        if (s[0] == '-')
> ++                return -ERANGE;
> ++        if ((unsigned long) (uint16_t) l != l)
> ++                return -ERANGE;
> ++
> ++        *ret = (uint16_t) l;
> ++        return 0;
> ++}
> ++
> + int safe_atod(const char *s, double *ret_d) {
> +         _cleanup_(freelocalep) locale_t loc = (locale_t) 0;
> +         char *x = NULL;
> +diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h
> +index 1eda1d7f9..727422056 100644
> +--- a/src/basic/parse-util.h
> ++++ b/src/basic/parse-util.h
> +@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);
> + int safe_atou16(const char *s, uint16_t *ret);
> + int safe_atoi16(const char *s, int16_t *ret);
> +
> ++int safe_atoux16(const char *s, uint16_t *ret);
> ++
> + static inline int safe_atou32(const char *s, uint32_t *ret_u) {
> +         assert_cc(sizeof(uint32_t) == sizeof(unsigned));
> +         return safe_atou(s, (unsigned*) ret_u);
> +diff --git a/src/test/test-parse-util.c b/src/test/test-parse-util.c
> +index 937500213..a99cea5a1 100644
> +--- a/src/test/test-parse-util.c
> ++++ b/src/test/test-parse-util.c
> +@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {
> +         assert_se(r == -EINVAL);
> + }
> +
> ++static void test_safe_atoux16(void) {
> ++        int r;
> ++        uint16_t l;
> ++
> ++        r = safe_atoux16("1234", &l);
> ++        assert_se(r == 0);
> ++        assert_se(l == 0x1234);
> ++
> ++        r = safe_atoux16("abcd", &l);
> ++        assert_se(r == 0);
> ++        assert_se(l == 0xabcd);
> ++
> ++        r = safe_atoux16("  1234", &l);
> ++        assert_se(r == 0);
> ++        assert_se(l == 0x1234);
> ++
> ++        r = safe_atoux16("12345", &l);
> ++        assert_se(r == -ERANGE);
> ++
> ++        r = safe_atoux16("-1", &l);
> ++        assert_se(r == -ERANGE);
> ++
> ++        r = safe_atoux16("  -1", &l);
> ++        assert_se(r == -ERANGE);
> ++
> ++        r = safe_atoux16("junk", &l);
> ++        assert_se(r == -EINVAL);
> ++
> ++        r = safe_atoux16("123x", &l);
> ++        assert_se(r == -EINVAL);
> ++
> ++        r = safe_atoux16("12.3", &l);
> ++        assert_se(r == -EINVAL);
> ++
> ++        r = safe_atoux16("", &l);
> ++        assert_se(r == -EINVAL);
> ++}
> ++
> + static void test_safe_atou64(void) {
> +         int r;
> +         uint64_t l;
> +@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {
> +         test_safe_atolli();
> +         test_safe_atou16();
> +         test_safe_atoi16();
> ++        test_safe_atoux16();
> +         test_safe_atou64();
> +         test_safe_atoi64();
> +         test_safe_atod();
> +diff --git a/src/udev/udev-builtin-hwdb.c b/src/udev/udev-builtin-hwdb.c
> +index ca7f7c230..dbfe02429 100644
> +--- a/src/udev/udev-builtin-hwdb.c
> ++++ b/src/udev/udev-builtin-hwdb.c
> +@@ -27,6 +27,7 @@
> +
> + #include "alloc-util.h"
> + #include "hwdb-util.h"
> ++#include "parse-util.h"
> + #include "string-util.h"
> + #include "udev-util.h"
> + #include "udev.h"
> +@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct udev_device *dev,
> +
> + static const char *modalias_usb(struct udev_device *dev, char *s, size_t
> size) {
> +         const char *v, *p;
> +-        int vn, pn;
> ++        uint16_t vn, pn;
> +
> +         v = udev_device_get_sysattr_value(dev, "idVendor");
> +         if (!v)
> +@@ -71,12 +72,10 @@ static const char *modalias_usb(struct udev_device
> *dev, char *s, size_t size) {
> +         p = udev_device_get_sysattr_value(dev, "idProduct");
> +         if (!p)
> +                 return NULL;
> +-        vn = strtol(v, NULL, 16);
> +-        if (vn <= 0)
> +-                return NULL;
> +-        pn = strtol(p, NULL, 16);
> +-        if (pn <= 0)
> +-                return NULL;
> ++        if (safe_atoux16(v, &vn) < 0)
> ++              return NULL;
> ++        if (safe_atoux16(p, &pn) < 0)
> ++              return NULL;
> +         snprintf(s, size, "usb:v%04Xp%04X*", vn, pn);
> +         return s;
> + }
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-core/systemd/systemd_237.bb
> b/meta/recipes-core/systemd/systemd_237.bb
> index b7c2113255..c4743a6b9d 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -52,6 +52,7 @@ SRC_URI += "file://touchscreen.rules \
>             file://0032-memfd.patch \
>
> file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch \
>             file://libmount.patch \
> +
>  file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
>             "
>  SRC_URI_append_qemuall = "
> file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f7da9c056d82a1d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Unlike the previous version you had in your RFT branch (wh=
ich added=C2=A0-Wno-error=3Dformat-truncation) this doesn&#39;t seem to be =
complete fix.<div><br></div><div>In qemux86 build which already includes th=
is change I&#39;m seeing:</div><div><div>../git/src/basic/time-util.c: In f=
unction &#39;format_timespan&#39;:</div><div>../git/src/basic/time-util.c:5=
08:46: error: &#39;%0*llu&#39; directive output between 1 and 2147483647 by=
tes may cause result to exceed &#39;INT_MAX&#39; [-Werror=3Dformat-truncati=
on=3D]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_U=
SEC&quot;%s&quot;,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~</div><div>../git/src/basic/t=
ime-util.c:508:60: note: format string is defined here</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&quot;,</div><div=
>../git/src/basic/time-util.c:508:46: note: directive argument in the range=
 [0, 18446744073709551614]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s&quot;USEC_FMT&quo=
t;.%0*&quot;PRI_USEC&quot;%s&quot;,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~</div></div=
><div><br></div><div>And this part doesn&#39;t seem to be fixed upstream ye=
t.</div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Mon, May 28, 2018 at 5:58 PM Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ange-the-default-device-timeout-to-2.patch |=C2=A0 =C2=A09 +-<br>
=C2=A0...ation-compile-failure-by-typecasting.patch | 173 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_237.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A03 files changed, 177 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0034-Fix-format-=
truncation-compile-failure-by-typecasting.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-th=
e-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/000=
1-core-device.c-Change-the-default-device-timeout-to-2.patch<br>
index b7b1ea0886..98c83620ff 100644<br>
--- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-defau=
lt-device-timeout-to-2.patch<br>
+++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-defau=
lt-device-timeout-to-2.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9820c165a9e559cf851e3beb60fad2571de4ded2 Mon Sep 17 00:00:00 2001<br>
+From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 14 Dec 2015 04:09:19 +0000<br>
=C2=A0Subject: [PATCH] core/device.c: Change the default device timeout to =
240 sec.<br>
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/src/core/device.c b/src/core/device.c<br>
-index 77601c552..98bf49ba2 100644<br>
+index a43664d3b..4b16a8aec 100644<br>
=C2=A0--- a/src/core/device.c<br>
=C2=A0+++ b/src/core/device.c<br>
-@@ -112,7 +112,7 @@ static void device_init(Unit *u) {<br>
+@@ -113,7 +113,7 @@ static void device_init(Unit *u) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* indefinitely for plugged in devi=
ces, something which cannot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* happen for the other units since=
 their operations time out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* anyway. */<br>
@@ -28,6 +28,3 @@ index 77601c552..98bf49ba2 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u-&gt;ignore_on_isolate =3D true;<br>
=C2=A0 }<br>
--- <br>
-2.16.1<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-c=
ompile-failure-by-typecasting.patch b/meta/recipes-core/systemd/systemd/003=
4-Fix-format-truncation-compile-failure-by-typecasting.patch<br>
new file mode 100644<br>
index 0000000000..e56061f41b<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-=
failure-by-typecasting.patch<br>
@@ -0,0 +1,173 @@<br>
+From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17 00:00:00 2001<br>
+From: Patrick Uiterwijk &lt;<a href=3D"mailto:patrick@puiterwijk.org" targ=
et=3D"_blank">patrick@puiterwijk.org</a>&gt;<br>
+Date: Thu, 22 Feb 2018 19:41:30 +0100<br>
+Subject: [PATCH] Fix format-truncation compile failure by typecasting USB =
IDs<br>
+ (#8250)<br>
+<br>
+This patch adds safe_atoux16 for parsing an unsigned hexadecimal 16bit int=
, and<br>
+uses that for parsing USB device and vendor IDs.<br>
+<br>
+This fixes a compile error with gcc-8 because while we know that USB IDs a=
re 2 bytes,<br>
+the compiler does not know that.<br>
+<br>
+../src/udev/udev-builtin-hwdb.c:80:38: error: &#39;%04X&#39; directive out=
put may be<br>
+truncated writing between 4 and 8 bytes into a region of size between 2 an=
d 6<br>
+[-Werror=3Dformat-truncation=3D]<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/c=
ommit/5547c12503a683290eaed47954ffcfb2d1bc03cd" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/systemd/systemd/commit/5547c12503a683290eaed=
47954ffcfb2d1bc03cd</a>]<br>
+<br>
+Signed-off-by: Adam Williamson &lt;<a href=3D"mailto:awilliam@redhat.com" =
target=3D"_blank">awilliam@redhat.com</a>&gt;<br>
+Signed-off-by: Patrick Uiterwijk &lt;<a href=3D"mailto:puiterwijk@redhat.c=
om" target=3D"_blank">puiterwijk@redhat.com</a>&gt;<br>
+---<br>
+ src/basic/parse-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 +++++++++++++++++++=
+++<br>
+ src/basic/parse-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
+ src/test/test-parse-util.c=C2=A0 =C2=A0| 39 +++++++++++++++++++++++++++++=
+++++++<br>
+ src/udev/udev-builtin-hwdb.c | 13 ++++++------<br>
+ 4 files changed, 71 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c<br>
+index 97533721d..ff3fc298a 100644<br>
+--- a/src/basic/parse-util.c<br>
++++ b/src/basic/parse-util.c<br>
+@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
++int safe_atoux16(const char *s, uint16_t *ret) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *x =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long l;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ret);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D strspn(s, WHITESPACE);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D strtoul(s, &amp;x, 16);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!x || x =3D=3D s || *x !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s[0] =3D=3D &#39;-&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ERANGE;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((unsigned long) (uint16_t) l !=3D l)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ERANGE;<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D (uint16_t) l;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
+ int safe_atod(const char *s, double *ret_d) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_(freelocalep) locale_t loc =3D =
(locale_t) 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *x =3D NULL;<br>
+diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h<br>
+index 1eda1d7f9..727422056 100644<br>
+--- a/src/basic/parse-util.h<br>
++++ b/src/basic/parse-util.h<br>
+@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);<br>
+ int safe_atou16(const char *s, uint16_t *ret);<br>
+ int safe_atoi16(const char *s, int16_t *ret);<br>
+ <br>
++int safe_atoux16(const char *s, uint16_t *ret);<br>
++<br>
+ static inline int safe_atou32(const char *s, uint32_t *ret_u) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_cc(sizeof(uint32_t) =3D=3D sizeof=
(unsigned));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return safe_atou(s, (unsigned*) ret_u);<=
br>
+diff --git a/src/test/test-parse-util.c b/src/test/test-parse-util.c<br>
+index 937500213..a99cea5a1 100644<br>
+--- a/src/test/test-parse-util.c<br>
++++ b/src/test/test-parse-util.c<br>
+@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(r =3D=3D -EINVAL);<br>
+ }<br>
+ <br>
++static void test_safe_atoux16(void) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t l;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;1234&quot;, &amp;l);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0x1234);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;abcd&quot;, &amp;l);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0xabcd);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;=C2=A0 1234&quot;, &=
amp;l);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0x1234);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;12345&quot;, &amp;l)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;-1&quot;, &amp;l);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;=C2=A0 -1&quot;, &am=
p;l);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;junk&quot;, &amp;l);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;123x&quot;, &amp;l);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;12.3&quot;, &amp;l);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16(&quot;&quot;, &amp;l);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);<br>
++}<br>
++<br>
+ static void test_safe_atou64(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t l;<br>
+@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atolli();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atou16();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atoi16();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_safe_atoux16();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atou64();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atoi64();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atod();<br>
+diff --git a/src/udev/udev-builtin-hwdb.c b/src/udev/udev-builtin-hwdb.c<b=
r>
+index ca7f7c230..dbfe02429 100644<br>
+--- a/src/udev/udev-builtin-hwdb.c<br>
++++ b/src/udev/udev-builtin-hwdb.c<br>
+@@ -27,6 +27,7 @@<br>
+ <br>
+ #include &quot;alloc-util.h&quot;<br>
+ #include &quot;hwdb-util.h&quot;<br>
++#include &quot;parse-util.h&quot;<br>
+ #include &quot;string-util.h&quot;<br>
+ #include &quot;udev-util.h&quot;<br>
+ #include &quot;udev.h&quot;<br>
+@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct udev_device *dev,<br=
>
+ <br>
+ static const char *modalias_usb(struct udev_device *dev, char *s, size_t =
size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *v, *p;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vn, pn;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t vn, pn;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v =3D udev_device_get_sysattr_value(dev,=
 &quot;idVendor&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!v)<br>
+@@ -71,12 +72,10 @@ static const char *modalias_usb(struct udev_device *de=
v, char *s, size_t size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D udev_device_get_sysattr_value(dev,=
 &quot;idProduct&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vn =3D strtol(v, NULL, 16);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vn &lt;=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D strtol(p, NULL, 16);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pn &lt;=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (safe_atoux16(v, &amp;vn) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (safe_atoux16(p, &amp;pn) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(s, size, &quot;usb:v%04Xp%04X*&=
quot;, vn, pn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s;<br>
+ }<br>
+-- <br>
+2.17.0<br>
+<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_237.bb</a> b/meta/recipes-core/s=
ystemd/<a href=3D"http://systemd_237.bb" rel=3D"noreferrer" target=3D"_blan=
k">systemd_237.bb</a><br>
index b7c2113255..c4743a6b9d 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_237.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_237.bb</a><br>
@@ -52,6 +52,7 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0032-memfd.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0033-basic-macros-rename-n=
oreturn-into-_noreturn_-8456.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libmount.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0034-Fix-format-truncation=
-compile-failure-by-typecasting.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI_append_qemuall =3D &quot; file://0001-core-device.c-Change-th=
e-default-device-timeout-to-2.patch&quot;<br>
<br>
-- <br>
2.17.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000f7da9c056d82a1d4--

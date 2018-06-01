Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC1074D3A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:09:25 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id z9-v6so12342505plk.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ySpBuCvFO/R0KdOVf3gcXsXyQcDl8oSKh+nTrDVqIRg=;
	b=Akl7lqcioBctwhyWwLQTiFBXVien8ocSy82+Uhy2/3Yxte7zqQeADbWeWsN8E5fBvp
	P82G78mHt5nAvJJULN5JGlwM5AehfxPNhIIrg1/W1A26cSNOSo9MzGRzDruVY4dk7/Kd
	usaZ9tKJitKAzoZuJBniWcSeiyeJAFTlVzs2hfkKV+X5tmFTXlMFVnQmcOSkggwGSPkv
	OXdz34dulO4uZ2/JVxrbd9sOS1BJOl1tfjaR1yiommhHKVPKPkv0OszOmR5TEBA8VQzz
	ccHKLbtlamJXgjCplWmr4ZVAUBkcaRKlUCq7UoMMlP6NRfeMCsi3RmT+QRO2/yGI9gtX
	VAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=ySpBuCvFO/R0KdOVf3gcXsXyQcDl8oSKh+nTrDVqIRg=;
	b=H3CNivEWKt6ATH0n7/+w1MueVBZHayHGPdDdwB3QmUVgX0LRcWTg8r7gojNKKt+5nl
	3B8h4YaRVKmKeqQa5oNsKqoixu0VlujSdMx6vA7Hpc6RHaDnzTcUHhTEIK71CNuUnT5C
	OnojsfPRYK3YngsT3MJaZ7WFO4XotG160DJTY69gTVDOcwDRDr793ZUhKR9b68IUmEL6
	7MMiS74eysNDdlUIm/owzJYFVeRMY/vX0uLkxCd+biJo6JB2ZHkbDgikcx6iyuBTtZMn
	m2u21cVLWXoLjiacH9VhWjQjQv3nFOZ7GWu8Xkt0ZZxu7MRNv68WyiabUwiwsTGV5gum
	H/Zg==
X-Gm-Message-State: ALKqPwcMY//JxzcVWvtWb79uVVrRQFJICsQ1hD2Hd8Q/MlxsdQLr+8lI
	QcRaTKOOMiWMozFaf8/WNI4Y0BO7
X-Google-Smtp-Source: ADUXVKIhXWQyCqHRn0eGM8kPdIfpRBppNR1y7gbyhF71cBJ7j0Y98Ffx7AhlAr7ClHwwX4xwKJAeqw==
X-Received: by 2002:a17:902:42c3:: with SMTP id
	h61-v6mr11928437pld.164.1527872965851; 
	Fri, 01 Jun 2018 10:09:25 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	t10-v6sm8750360pgn.20.2018.06.01.10.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 10:09:25 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180528155833.24224-1-raj.khem@gmail.com>
	<CA+chaQdTQ8OCmXthjY_Fyq+7En9=GMk8A_KpmVwehuBy6oJvYQ@mail.gmail.com>
	<CAMKF1sq4xaHNsNBxuLWmhGiuwO2rpRZPbQQhZETnU17hTku=pA@mail.gmail.com>
	<CA+chaQccOte4qfnqP7gUxr7DYmweJ2yw0TNJQoZeYCLYTwD3vQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <51123ef0-14ff-f6a0-c98a-b118ed319fc0@gmail.com>
Date: Fri, 1 Jun 2018 10:09:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQccOte4qfnqP7gUxr7DYmweJ2yw0TNJQoZeYCLYTwD3vQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jun 2018 17:09:25 -0000
X-Groupsio-MsgNum: 112028
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="aKcj2jHUSO6KaOKFYF0U0YvdQS7qWEKr6"

--aKcj2jHUSO6KaOKFYF0U0YvdQS7qWEKr6
Content-Type: multipart/mixed; boundary="A8tSQohetnNKaYW82wzCX4C5iJnYUPDjM";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <51123ef0-14ff-f6a0-c98a-b118ed319fc0@gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemd: Fix build with gcc8
References: <20180528155833.24224-1-raj.khem@gmail.com>
 <CA+chaQdTQ8OCmXthjY_Fyq+7En9=GMk8A_KpmVwehuBy6oJvYQ@mail.gmail.com>
 <CAMKF1sq4xaHNsNBxuLWmhGiuwO2rpRZPbQQhZETnU17hTku=pA@mail.gmail.com>
 <CA+chaQccOte4qfnqP7gUxr7DYmweJ2yw0TNJQoZeYCLYTwD3vQ@mail.gmail.com>
In-Reply-To: <CA+chaQccOte4qfnqP7gUxr7DYmweJ2yw0TNJQoZeYCLYTwD3vQ@mail.gmail.com>

--A8tSQohetnNKaYW82wzCX4C5iJnYUPDjM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/1/18 7:01 AM, Martin Jansa wrote:
> No change in PACKAGECONFIG, just default nodistro qemux86 with added
> systemd and debug build:
> DISTRO_FEATURES_append =3D " systemd"
> DEBUG_BUILD =3D "1"
>=20

hmm so must be some code which is eliminated by compiler optimizations
with -O2 since with debug build it will use -O1

>=20
> On Thu, May 31, 2018 at 6:17 PM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     On Thu, May 31, 2018 at 9:05 AM, Martin Jansa
>     <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>     > Unlike the previous version you had in your RFT branch (which add=
ed
>     > -Wno-error=3Dformat-truncation) this doesn't seem to be complete =
fix.
>     >
>     > In qemux86 build which already includes this change I'm seeing:
>     > ../git/src/basic/time-util.c: In function 'format_timespan':
>     > ../git/src/basic/time-util.c:508:46: error: '%0*llu' directive ou=
tput
>     > between 1 and 2147483647 bytes may cause result to exceed 'INT_MA=
X'
>     > [-Werror=3Dformat-truncation=3D]
>     >
>     > "%s"USEC_FMT".%0*"PRI_USEC"%s",
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~
>     > ../git/src/basic/time-util.c:508:60: note: format string is
>     defined here
>     >
>     > "%s"USEC_FMT".%0*"PRI_USEC"%s",
>     > ../git/src/basic/time-util.c:508:46: note: directive argument in
>     the range
>     > [0, 18446744073709551614]
>     >
>     > "%s"USEC_FMT".%0*"PRI_USEC"%s",
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~
>     >
>     > And this part doesn't seem to be fixed upstream yet.
>     >
>=20
>     Its possible, that default config I build is not using this code. D=
o
>     you enable/disable some specific packageconfig and what arch are yo=
u
>     targetting
>=20
>     > Cheers,
>     >
>     > On Mon, May 28, 2018 at 5:58 PM Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>     >>
>     >> Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     >> ---
>     >>=C2=A0 ...ange-the-default-device-timeout-to-2.patch |=C2=A0 =C2=A0=
9 +-
>     >>=C2=A0 ...ation-compile-failure-by-typecasting.patch | 173
>     ++++++++++++++++++
>     >>=C2=A0 meta/recipes-core/systemd/systemd_237.bb
>     <http://systemd_237.bb>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +
>     >>=C2=A0 3 files changed, 177 insertions(+), 6 deletions(-)
>     >>=C2=A0 create mode 100644
>     >>
>     meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compil=
e-failure-by-typecasting.patch
>     >>
>     >> diff --git
>     >>
>     a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
>     >>
>     b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
>     >> index b7b1ea0886..98c83620ff 100644
>     >> ---
>     >>
>     a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
>     >> +++
>     >>
>     b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-d=
efault-device-timeout-to-2.patch
>     >> @@ -1,4 +1,4 @@
>     >> -From 9820c165a9e559cf851e3beb60fad2571de4ded2 Mon Sep 17
>     00:00:00 2001
>     >> +From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17
>     00:00:00 2001
>     >>=C2=A0 From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.=
com>>
>     >>=C2=A0 Date: Mon, 14 Dec 2015 04:09:19 +0000
>     >>=C2=A0 Subject: [PATCH] core/device.c: Change the default device
>     timeout to 240
>     >> sec.
>     >> @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     >>=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>     >>
>     >>=C2=A0 diff --git a/src/core/device.c b/src/core/device.c
>     >> -index 77601c552..98bf49ba2 100644
>     >> +index a43664d3b..4b16a8aec 100644
>     >>=C2=A0 --- a/src/core/device.c
>     >>=C2=A0 +++ b/src/core/device.c
>     >> -@@ -112,7 +112,7 @@ static void device_init(Unit *u) {
>     >> +@@ -113,7 +113,7 @@ static void device_init(Unit *u) {
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * indefinitely for plug=
ged in devices, something which
>     cannot
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * happen for the other =
units since their operations
>     time out
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * anyway. */
>     >> @@ -28,6 +28,3 @@ index 77601c552..98bf49ba2 100644
>     >>
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u->ignore_on_isolate =3D=
 true;
>     >>=C2=A0 =C2=A0}
>     >> ---
>     >> -2.16.1
>     >> -
>     >> diff --git
>     >>
>     a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-comp=
ile-failure-by-typecasting.patch
>     >>
>     b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-comp=
ile-failure-by-typecasting.patch
>     >> new file mode 100644
>     >> index 0000000000..e56061f41b
>     >> --- /dev/null
>     >> +++
>     >>
>     b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-comp=
ile-failure-by-typecasting.patch
>     >> @@ -0,0 +1,173 @@
>     >> +From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17
>     00:00:00 2001
>     >> +From: Patrick Uiterwijk <patrick@puiterwijk.org
>     <mailto:patrick@puiterwijk.org>>
>     >> +Date: Thu, 22 Feb 2018 19:41:30 +0100
>     >> +Subject: [PATCH] Fix format-truncation compile failure by
>     typecasting USB
>     >> IDs
>     >> + (#8250)
>     >> +
>     >> +This patch adds safe_atoux16 for parsing an unsigned hexadecima=
l
>     16bit
>     >> int, and
>     >> +uses that for parsing USB device and vendor IDs.
>     >> +
>     >> +This fixes a compile error with gcc-8 because while we know tha=
t
>     USB IDs
>     >> are 2 bytes,
>     >> +the compiler does not know that.
>     >> +
>     >> +../src/udev/udev-builtin-hwdb.c:80:38: error: '%04X' directive
>     output may
>     >> be
>     >> +truncated writing between 4 and 8 bytes into a region of size
>     between 2
>     >> and 6
>     >> +[-Werror=3Dformat-truncation=3D]
>     >> +
>     >> +Upstream-Status: Backport
>     >>
>     [https://github.com/systemd/systemd/commit/5547c12503a683290eaed479=
54ffcfb2d1bc03cd]
>     >> +
>     >> +Signed-off-by: Adam Williamson <awilliam@redhat.com
>     <mailto:awilliam@redhat.com>>
>     >> +Signed-off-by: Patrick Uiterwijk <puiterwijk@redhat.com
>     <mailto:puiterwijk@redhat.com>>
>     >> +---
>     >> + src/basic/parse-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++=
++++++++++++++
>     >> + src/basic/parse-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++
>     >> + src/test/test-parse-util.c=C2=A0 =C2=A0| 39
>     ++++++++++++++++++++++++++++++++++++
>     >> + src/udev/udev-builtin-hwdb.c | 13 ++++++------
>     >> + 4 files changed, 71 insertions(+), 7 deletions(-)
>     >> +
>     >> +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
>     >> +index 97533721d..ff3fc298a 100644
>     >> +--- a/src/basic/parse-util.c
>     >> ++++ b/src/basic/parse-util.c
>     >> +@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *re=
t) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>     >> + }
>     >> +
>     >> ++int safe_atoux16(const char *s, uint16_t *ret) {
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *x =3D NULL;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long l;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(s);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ret);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D strspn(s, WHITESPACE);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D strtoul(s, &x, 16);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno > 0)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 -errno;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!x || x =3D=3D s || *x !=3D 0)=

>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 -EINVAL;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s[0] =3D=3D '-')
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 -ERANGE;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((unsigned long) (uint16_t) l !=
=3D l)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 -ERANGE;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D (uint16_t) l;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>     >> ++}
>     >> ++
>     >> + int safe_atod(const char *s, double *ret_d) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_(freelocalep) locale=
_t loc =3D (locale_t) 0;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *x =3D NULL;
>     >> +diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h
>     >> +index 1eda1d7f9..727422056 100644
>     >> +--- a/src/basic/parse-util.h
>     >> ++++ b/src/basic/parse-util.h
>     >> +@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);
>     >> + int safe_atou16(const char *s, uint16_t *ret);
>     >> + int safe_atoi16(const char *s, int16_t *ret);
>     >> +
>     >> ++int safe_atoux16(const char *s, uint16_t *ret);
>     >> ++
>     >> + static inline int safe_atou32(const char *s, uint32_t *ret_u) =
{
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_cc(sizeof(uint32_t) =3D=
=3D sizeof(unsigned));
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return safe_atou(s, (unsigned=
*) ret_u);
>     >> +diff --git a/src/test/test-parse-util.c b/src/test/test-parse-u=
til.c
>     >> +index 937500213..a99cea5a1 100644
>     >> +--- a/src/test/test-parse-util.c
>     >> ++++ b/src/test/test-parse-util.c
>     >> +@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(r =3D=3D -EINVAL);
>     >> + }
>     >> +
>     >> ++static void test_safe_atoux16(void) {
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t l;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("1234", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0x1234);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("abcd", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0xabcd);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("=C2=A0 1234", =
&l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D 0);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(l =3D=3D 0x1234);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("12345", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("-1", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("=C2=A0 -1", &l=
);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -ERANGE);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("junk", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("123x", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("12.3", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D safe_atoux16("", &l);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(r =3D=3D -EINVAL);
>     >> ++}
>     >> ++
>     >> + static void test_safe_atou64(void) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t l;
>     >> +@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atolli();
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atou16();
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atoi16();
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_safe_atoux16();
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atou64();
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atoi64();
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_safe_atod();
>     >> +diff --git a/src/udev/udev-builtin-hwdb.c
>     b/src/udev/udev-builtin-hwdb.c
>     >> +index ca7f7c230..dbfe02429 100644
>     >> +--- a/src/udev/udev-builtin-hwdb.c
>     >> ++++ b/src/udev/udev-builtin-hwdb.c
>     >> +@@ -27,6 +27,7 @@
>     >> +
>     >> + #include "alloc-util.h"
>     >> + #include "hwdb-util.h"
>     >> ++#include "parse-util.h"
>     >> + #include "string-util.h"
>     >> + #include "udev-util.h"
>     >> + #include "udev.h"
>     >> +@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct
>     udev_device *dev,
>     >> +
>     >> + static const char *modalias_usb(struct udev_device *dev, char
>     *s, size_t
>     >> size) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *v, *p;
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vn, pn;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t vn, pn;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v =3D udev_device_get_sysattr=
_value(dev, "idVendor");
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!v)
>     >> +@@ -71,12 +72,10 @@ static const char *modalias_usb(struct
>     udev_device
>     >> *dev, char *s, size_t size) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D udev_device_get_sysattr=
_value(dev, "idProduct");
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn NULL;
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vn =3D strtol(v, NULL, 16);
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vn <=3D 0)
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 NULL;
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D strtol(p, NULL, 16);
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pn <=3D 0)
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 NULL;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (safe_atoux16(v, &vn) < 0)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (safe_atoux16(p, &pn) < 0)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(s, size, "usb:v%04Xp=
%04X*", vn, pn);
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return s;
>     >> + }
>     >> +--
>     >> +2.17.0
>     >> +
>     >> diff --git a/meta/recipes-core/systemd/systemd_237.bb
>     <http://systemd_237.bb>
>     >> b/meta/recipes-core/systemd/systemd_237.bb <http://systemd_237.b=
b>
>     >> index b7c2113255..c4743a6b9d 100644
>     >> --- a/meta/recipes-core/systemd/systemd_237.bb
>     <http://systemd_237.bb>
>     >> +++ b/meta/recipes-core/systemd/systemd_237.bb
>     <http://systemd_237.bb>
>     >> @@ -52,6 +52,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-memfd=
=2Epatch \
>     >>
>     >> file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.pa=
tch \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libmount.p=
atch \
>     >> +
>     >>
>     file://0034-Fix-format-truncation-compile-failure-by-typecasting.pa=
tch \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     >>=C2=A0 SRC_URI_append_qemuall =3D "
>     >>
>     file://0001-core-device.c-Change-the-default-device-timeout-to-2.pa=
tch"
>     >>
>     >> --
>     >> 2.17.0
>     >>
>     >> --
>     >> _______________________________________________
>     >> Openembedded-core mailing list
>     >> Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

>=20



--A8tSQohetnNKaYW82wzCX4C5iJnYUPDjM--

--aKcj2jHUSO6KaOKFYF0U0YvdQS7qWEKr6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxF9vwAKCRC7BTNVkZ0z
FF/TAJ4psWp0JII7B8COZ5YwR8f83X3KKgCff2V7J/Xj6IKv3W0/BFl8iZJPL2w=
=Sx6s
-----END PGP SIGNATURE-----

--aKcj2jHUSO6KaOKFYF0U0YvdQS7qWEKr6--

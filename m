Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 512AC6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 280392E109;
	Tue, 10 May 2016 10:01:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id syAyaJByWnIJ; Tue, 10 May 2016 10:01:25 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id E63EF2E0A4;
	Tue, 10 May 2016 10:01:24 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C7EF51746;
	Tue, 10 May 2016 10:01:24 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id BBEA4146C;
	Tue, 10 May 2016 10:01:24 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id B9AA3102A;
	Tue, 10 May 2016 10:01:24 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 10 May 2016 10:01:24 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%22]) with mapi id
	15.00.1156.000; Tue, 10 May 2016 10:01:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ruslan Babayev <ruslan@babayev.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] edgerouter: libffi: fix build with
	soft-float tune
Thread-Index: AdGqkiPP/jzOwuf6SCeMJxKGzKuGaQ==
Date: Tue, 10 May 2016 08:01:24 +0000
Message-ID: <2fb8f088955e4ed582dd519e56484008@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] edgerouter: libffi: fix build with soft-float tune
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
X-List-Received-Date: Tue, 10 May 2016 08:01:27 -0000
X-Groupsio-MsgNum: 81790
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_2fb8f088955e4ed582dd519e56484008XBOX02axiscom_"

--_002_2fb8f088955e4ed582dd519e56484008XBOX02axiscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI, MIPS o32 softfloat does not build either. We have been using the=20
attached patch that I found on the net to fix this.

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Ruslan Babayev
> Sent: den 10 maj 2016 02:48
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] edgerouter: libffi: fix build with soft-
> float tune
>=20
> Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
> ---
>  .../recipes-support/libffi/libffi/mips-n32-soft-float.patch | 13
> +++++++++++++
>  meta/recipes-support/libffi/libffi_3.2.1.bb                 |  1 +
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-support/libffi/libffi/mips-n32-soft-
> float.patch
>=20
> diff --git a/meta/recipes-support/libffi/libffi/mips-n32-soft-
> float.patch b/meta/recipes-support/libffi/libffi/mips-n32-soft-
> float.patch
> new file mode 100644
> index 0000000..c901614
> --- /dev/null
> +++ b/meta/recipes-support/libffi/libffi/mips-n32-soft-float.patch
> @@ -0,0 +1,13 @@
> +Index: libffi-3.2.1/src/mips/n32.S
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libffi-3.2.1.orig/src/mips/n32.S
> ++++ libffi-3.2.1/src/mips/n32.S
> +@@ -30,7 +30,7 @@
> +
> + /* Only build this code if we are compiling for n32 */
> +
> +-#if defined(FFI_MIPS_N32)
> ++#if defined(FFI_MIPS_N32) && !defined(__mips_soft_float)
> +
> + #define callback a0
> + #define bytes	 a2
> diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb
> b/meta/recipes-support/libffi/libffi_3.2.1.bb
> index 72e25fb..5b57e79 100644
> --- a/meta/recipes-support/libffi/libffi_3.2.1.bb
> +++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3610bb17683a0089ed64055416b2ae1b"
>  SRC_URI =3D "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
>             file://not-win32.patch \
>  	   file://0001-mips-Use-compiler-internal-define-for-linux.patch
> \
> +           file://mips-n32-soft-float.patch \
>  	   "
>=20
>  SRC_URI[md5sum] =3D "83b89587607e3eb65c70d361f13bab43"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--_002_2fb8f088955e4ed582dd519e56484008XBOX02axiscom_
Content-Type: application/octet-stream; name="mips.softfloat.patch"
Content-Description: mips.softfloat.patch
Content-Disposition: attachment; filename="mips.softfloat.patch"; size=1979;
	creation-date="Tue, 10 May 2016 07:59:39 GMT";
	modification-date="Mon, 02 May 2016 13:22:26 GMT"
Content-Transfer-Encoding: base64

LS0tIGxpYmZmaS9zcmMvbWlwcy9vMzIuUy5vcmlnCTIwMTQtMTEtMDggMTQ6NDc6MjQuMDAwMDAw
MDAwICswMjAwCisrKyBsaWJmZmkvc3JjL21pcHMvbzMyLlMJMjAxNS0wNC0xNiAxMjowMzoxMS4z
MDIxMTYxMDQgKzAzMDAKQEAgLTgyLDEzICs4MiwxNiBAQAogCQkKIAlBRERVCSRzcCwgNCAqIEZG
SV9TSVpFT0ZfQVJHCQkjIGFkanVzdCAkc3AgdG8gbmV3IGFyZ3MKIAorI2lmbmRlZiBfX21pcHNf
c29mdF9mbG9hdAogCWJuZXoJdDAsIHBhc3NfZAkJCSMgbWFrZSBpdCBxdWljayBmb3IgaW50Cisj
ZW5kaWYKIAlSRUdfTAlhMCwgMCpGRklfU0laRU9GX0FSRygkc3ApCSMganVzdCBnbyBhaGVhZCBh
bmQgbG9hZCB0aGUKIAlSRUdfTAlhMSwgMSpGRklfU0laRU9GX0FSRygkc3ApCSMgZm91ciByZWdz
LgogCVJFR19MCWEyLCAyKkZGSV9TSVpFT0ZfQVJHKCRzcCkKIAlSRUdfTAlhMywgMypGRklfU0la
RU9GX0FSRygkc3ApCiAJYgljYWxsX2l0CiAKKyNpZm5kZWYgX19taXBzX3NvZnRfZmxvYXQKIHBh
c3NfZDoKIAlibmUJdDAsIEZGSV9BUkdTX0QsIHBhc3NfZgogCWwuZAkkZjEyLCAwKkZGSV9TSVpF
T0ZfQVJHKCRzcCkJIyBsb2FkICRmcCByZWdzIGZyb20gYXJncwpAQCAtMTMwLDYgKzEzMyw3IEBA
CiAgIwlibmUJdDAsIEZGSV9BUkdTX0ZfRCwgY2FsbF9pdAogCWwucwkkZjEyLCAwKkZGSV9TSVpF
T0ZfQVJHKCRzcCkJIyBsb2FkICRmcCByZWdzIGZyb20gYXJncwogCWwuZAkkZjE0LCAyKkZGSV9T
SVpFT0ZfQVJHKCRzcCkJIyBwYXNzaW5nIGRvdWJsZSBhbmQgZmxvYXQKKyNlbmRpZgogCiBjYWxs
X2l0OgkKIAkjIExvYWQgdGhlIGZ1bmN0aW9uIHBvaW50ZXIKQEAgLTE1OCwxNCArMTYyLDIzIEBA
CiAJYm5lICAgICB0MiwgRkZJX1RZUEVfRkxPQVQsIHJldGRvdWJsZQogCWphbHIJdDkKIAlSRUdf
TAl0MCwgU0laRU9GX0ZSQU1FICsgNCpGRklfU0laRU9GX0FSRygkZnApCisjaWZuZGVmIF9fbWlw
c19zb2Z0X2Zsb2F0CiAJcy5zCSRmMCwgMCh0MCkKKyNlbHNlCisJUkVHX1MJdjAsIDAodDApCisj
ZW5kaWYKIAliCWVwaWxvZ3VlCiAKIHJldGRvdWJsZToJCiAJYm5lCXQyLCBGRklfVFlQRV9ET1VC
TEUsIG5vcmV0dmFsCiAJamFscgl0OQogCVJFR19MCXQwLCBTSVpFT0ZfRlJBTUUgKyA0KkZGSV9T
SVpFT0ZfQVJHKCRmcCkKKyNpZm5kZWYgX19taXBzX3NvZnRfZmxvYXQKIAlzLmQJJGYwLCAwKHQw
KQorI2Vsc2UKKwlSRUdfUwl2MSwgNCh0MCkKKwlSRUdfUwl2MCwgMCh0MCkKKyNlbmRpZgogCWIJ
ZXBpbG9ndWUKIAkKIG5vcmV0dmFsOgkKQEAgLTI2MSw5ICsyNzQsMTEgQEAKIAlsaQkkMTMsIDEJ
CSMgRkZJX08zMgogCWJuZQkkMTYsICQxMywgMWYJIyBTa2lwIGZwIHNhdmUgaWYgRkZJX08zMl9T
T0ZUX0ZMT0FUCiAJCisjaWZuZGVmIF9fbWlwc19zb2Z0X2Zsb2F0CiAJIyBTdG9yZSBhbGwgcG9z
c2libGUgZmxvYXQvZG91YmxlIHJlZ2lzdGVycy4KIAlzLmQJJGYxMiwgRkFfMF8wX09GRjIoJGZw
KQogCXMuZAkkZjE0LCBGQV8xXzBfT0ZGMigkZnApCisjZW5kaWYKIDE6CQogCSMgQ2FsbCBmZmlf
Y2xvc3VyZV9taXBzX2lubmVyX08zMiB0byBkbyB0aGUgd29yay4KIAlsYQl0OSwgZmZpX2Nsb3N1
cmVfbWlwc19pbm5lcl9PMzIKQEAgLTI4MSw2ICsyOTYsNyBAQAogCWxpCSQxMywgMQkJIyBGRklf
TzMyCiAJYm5lCSQxNiwgJDEzLCAxZgkjIFNraXAgZnAgcmVzdG9yZSBpZiBGRklfTzMyX1NPRlRf
RkxPQVQKIAorI2lmbmRlZiBfX21pcHNfc29mdF9mbG9hdAogCWxpCSQ5LCBGRklfVFlQRV9GTE9B
VAogCWwucwkkZjAsIFYwX09GRjIoJGZwKQogCWJlcQkkOCwgJDksIGNsb3N1cmVfZG9uZQpAQCAt
Mjg4LDYgKzMwNCw3IEBACiAJbGkJJDksIEZGSV9UWVBFX0RPVUJMRQogCWwuZAkkZjAsIFYwX09G
RjIoJGZwKQogCWJlcQkkOCwgJDksIGNsb3N1cmVfZG9uZQorI2VuZGlmCiAxOgkKIAlSRUdfTAkk
MywgVjFfT0ZGMigkZnApCiAJUkVHX0wJJDIsIFYwX09GRjIoJGZwKQo=

--_002_2fb8f088955e4ed582dd519e56484008XBOX02axiscom_--

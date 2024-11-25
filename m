Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E48ED58094
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:32:44 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.web11.17768.1732537959226751355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=mIWh+Z7U;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=052d57505=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1732537959; x=1764073959;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=l7OuvzbnTp7C4DqKsWL/SQam8S34Pu3nC21dyS23kjY=;
  b=mIWh+Z7UwFkx8F8lmz/dnrJam4n/pv1I0UOitbia0QB34YJmJCkpZDFg
   OqZZvybPnL6oIwoqyvYRq4xucyQunnroGMRjoeAxxPmPr1sMxs8gXigNW
   oSGPU9T7vHz6NJ6ErIMrEsfbEnIOgn3kIm2AddVk93L56kh3dZ3DPuOQl
   G/VYZEoNgcvs5y9q7HxdO3LkbUz9hJYK7W7mi9NjkKxH80rle64uB0gP+
   /UIlpiX7e0vY0UNPgOqiQb2vT3BvP8GPyczDYs6aWXC1OJ4Fg18ow4dpQ
   qoknhgfQqPjXxfGTq9f0R5W3fw4O1t+nLKmHOUvuGa5wxHewOGmdcoHxm
   Q==;
X-CSE-ConnectionGUID: H9qJ2AATQ6mWuTZ0Iu/1ow==
X-CSE-MsgGUID: +nNCQ9JgRBup5WNlJCxeDg==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:P5BN2KxwFlPUBoiep5d6t+cExirEfRIJ4+MujC+fZmQN5Upzl3Vbl
 zFOHTDZZODCfyKuKJpxdc7vohRX/dOXm+bXenIv8HBoQjRS9tGt6b+xIhmoZ3nJd5KfERs2t
 pRCZIeac81pQ3OD/Ueja+Tq9XQk3/jWSuP1Vb7KanF4SQE9RX0o008ywLJl3d4y29LhWGth1
 fv7u9XbOVSsxz9zNCUM6KmY91Z0vfv0sS8FpFFWidVj5TcywFFOXcpPTU3IE1P4XpVMTKn9R
 OvS1/e1/27Z+1EmDdbimaz/NVEJB77lO06FkH4OM5RO+SOu1RHeqI5jcqJ0VG9XlymRzZc2y
 9hcrtq8SAopOuvHn+FaWANcVD19eK1x/vnMO3zn7I/SlyX6nwDXL4ZT4DseZctAkttfAX1S7
 a5fby8ScVaPhu+2xPSwTewrnscia5GDAG9kgZ0T8N2jJa5gGfj+fpj3Cf9kMBYY1p5CQfuEP
 sdDZGZkPEiZb0RGNglOUc5mw7vw1iD2K2EE8QLErqcJuGWClwYZPJoBkjb2UoHQGZ8Fzh7wS
 kbupTmR7sQybYTHoda92ivywLeJxWWjBdp6+ISQrpZCmEeUynEYFCoYXF66pejRokOlUrqzE
 WRNksYVhfZ0rRbDouXVBUXi/Cfd5EJEAbK8LsVhgO2z4vuNi+qmLjhcJtJxQIROnNM7QzUsy
 miIk7vBbRRzsKeYQG6q7bydqzW/I0A9dQfusgddEGPpS/G6yG0CpkqnouRLScZZvfWscd3E+
 A1mmQBl71klYWzn4I3glbzPq2rESpEk1WfZ7C2PNo6uxlsRiIJI++VEQLUUhBpNBN/xc7WPg
 JQLs+jP9cJUJLixrXKIf/gxLumI+rHcNyKJ1DaDH7F5n9is03Kmb4tf/2kkYkxuKN5CdT7kY
 EuVsgRUjHNRFCLyK/8tJdvhTZ1xl8AMFvy8PhzQRtZDZJlqMgic4Cx0YUeW00jhkUUslec0P
 pLzncOEXCdEWfQ9kGreq+E1krkN7Rlv52zpb43jkiuB1Zi1dHO5RuJQWLeJRqVjhE+emy3c9
 9tPcciDzRxBUevWbSze8IpVJlcPRVA8HZ3wpslde+KPLwYjE2Y7BtfVwKg9YMpih6lTm+LC8
 32xV0Mez0Dw7UArMi3TMjYzMvW2DdAm9ihT0TEQAGtEEkMLOe6HhJrzvbNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:zil59aNrN7ltDsBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztCWE9Qr5N0tQ++xoVJPwJE801KQFmbX5Xo3SJTUO2lHYSr2KhLGKq1GOe1ycygNE78
 ZdmsBFeaHN5DNB/KLHCWeDYrEdKe28gd6VbKrlvj5QZDAvT5slwxZyCw6dHEEzbA5aBaAhHJ
 7ZyttbqyGmcXE3aN3+InUeReDMq/DCiZqjOHc9dlUawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAvx3l6r6lu/SbzAaZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFcxccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiV7N57gUWN9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFP9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcEa+d
 FVfYLhDcttABynhjHizyVSKeWXLzkO98K9MwY/Us/86UkioJk29Tpb+CUlpAZyyHsMceg02w
 36CNUZqFg3dL5tUUtcPpZ3fSLlMB26ffqGWFjiXmgPUpt3cU4l0KSHm4kd6+mhctgJwfIJ6e
 b8bG8=
X-Talos-CUID: 9a23:5n2RlGNbtjZQ5+5DeHh+1hQ9M/wcLHji0Uvie26lTj9uV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A10TNLg12BYw5OqvujsMxI/XCPzUjoKKII3lcs5o?=
 =?us-ascii?q?8kdScaBNWPxW2nDmbTdpy?=
X-IronPort-AV: E=Sophos;i="6.12,182,1728943200"; 
   d="p7s'346?scan'346,208,346";a="99688248"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: RE: [EXT] Re: [OE-core] [PATCH 3/3] linux-yocto: add WITH
 Linux-syscall-note to LICENSE
Date: Mon, 25 Nov 2024 13:32:36 +0100 (CET)
Message-ID: <5cbad45fe23c4e52bb37e5547b6d8494@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----8A13A406445953256EE498356DF54D3A"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207786

This is an S/MIME signed message

------8A13A406445953256EE498356DF54D3A
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Most likely those:

$ git grep -E 'LICENSE.*-with-'
meta/recipes-connectivity/socat/socat_1.8.0.0.bb:LICENSE =
"GPL-2.0-with-OpenSSL-exception"
meta/recipes-core/newlib/newlib.inc:LICENSE = "GPL-2.0-only & LGPL-3.0-only
& GPL-3.0-only & LGPL-2.0-only & BSD-2-Clause & BSD-3-Clause & TCL &
Apache-2.0-with-LLVM-exception"
meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:LICENS
E = "GPL-3.0-with-autoconf-exception"
meta/recipes-devtools/gcc/gcc-14.2.inc:LICENSE = "GPL-3.0-with-GCC-exception
& GPL-3.0-only"
meta/recipes-devtools/gcc/gcc-runtime.inc:LICENSE =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gcc/libgcc-initial.inc:LICENSE =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gcc/libgcc.inc:LICENSE:${PN} =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gcc/libgcc.inc:LICENSE:${PN}-dev =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gcc/libgcc.inc:LICENSE:${PN}-dbg =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gcc/libgfortran.inc:LICENSE:${PN} =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gcc/libgfortran.inc:LICENSE:${PN}-dev =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gcc/libgfortran.inc:LICENSE:${PN}-dbg =
"GPL-3.0-with-GCC-exception"
meta/recipes-devtools/gnu-config/gnu-config_git.bb:LICENSE =
"GPL-3.0-with-autoconf-exception"
meta/recipes-devtools/llvm/llvm_19.1.3.bb:LICENSE =
"Apache-2.0-with-LLVM-exception"
meta/recipes-devtools/rust/rust-llvm_1.80.1.bb:LICENSE ?=
"Apache-2.0-with-LLVM-exception"
meta/recipes-extended/xz/xz_5.6.3.bb:LICENSE = "GPL-2.0-or-later &
GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & 0BSD"
meta/recipes-graphics/glslang/glslang_1.3.296.0.bb:LICENSE = "BSD-3-Clause &
BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
meta/recipes-support/libgit2/libgit2_1.8.2.bb:LICENSE =
"GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC &
LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"

To migrate Apache-2.0-with-LLVM-exception to Apache-2.0 WITH LLVM-exception
should be straight forward. [^1]
GPL-3.0-with-GCC-exception becomes "WITH GCC-exception-3.1", but we have to
check if it is GPL-3.0-only or GPL-3.0-or-later first. [^2]
GPL-3.0-with-autoconf-exception becomes "WITH Autoconf-exception-3.0" and
also the check first. [^3]
GPL-2.0-with-bison-exception becomes "WITH Bison-exception-2.2" and also the
check first. [^4]

This is from a SPDX point of view.
If the source explicitly states the deprecated license, it could be better
to stay with that one.

[^1]: https://spdx.org/licenses/LLVM-exception.html
[^2]: https://spdx.org/licenses/GPL-3.0-with-GCC-exception.html
[^3]: https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.html
[^4]: https://spdx.org/licenses/GPL-2.0-with-bison-exception.html

-----Original Message-----
From: Alexander Kanavin <alex.kanavin@gmail.com> 
Sent: Monday, November 25, 2024 12:59 PM
To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [EXT] Re: [OE-core] [PATCH 3/3] linux-yocto: add WITH
Linux-syscall-note to LICENSE

[EXTERNAL EMAIL]
 

Thanks, the patchset is fine, but I wonder if there are other recipes in
oe-core which would benefit from WITH suppport?

Alex

On Mon, 25 Nov 2024 at 12:58, Denis OSTERLAND-HEIM via
lists.openembedded.org <denis.osterland=diehl.com@lists.openembedded.org>
wrote:
>
> According to Linux COPYING file this exception is made to GPL v2.
>
> Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
> ---
>  meta/files/common-licenses/Linux-syscall-note | 25 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
>  2 files changed, 26 insertions(+), 1 deletion(-)  create mode 100644 
> meta/files/common-licenses/Linux-syscall-note
>
> diff --git a/meta/files/common-licenses/Linux-syscall-note
> b/meta/files/common-licenses/Linux-syscall-note
> new file mode 100644
> index 0000000000..9abdad71fa
> --- /dev/null
> +++ b/meta/files/common-licenses/Linux-syscall-note
> @@ -0,0 +1,25 @@
> +SPDX-Exception-Identifier: Linux-syscall-note
> +SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
> +SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+, 
> +LGPL-2.1,
> LGPL-2.1+, GPL-2.0-only, GPL-2.0-or-later
> +Usage-Guide:
> +  This exception is used together with one of the above SPDX-Licenses
> +  to mark user space API (uapi) header files so they can be included
> +  into non GPL compliant user space application code.
> +  To use this exception add it with the keyword WITH to one of the
> +  identifiers in the SPDX-Licenses tag:
> +    SPDX-License-Identifier: <SPDX-License> WITH Linux-syscall-note
> +License-Text:
> +
> +   NOTE! This copyright does *not* cover user programs that use 
> + kernel services by normal system calls - this is merely considered 
> + normal use of the kernel, and does *not* fall under the heading of
"derived work".
> + Also note that the GPL below is copyrighted by the Free Software 
> + Foundation, but the instance of code that it refers to (the Linux
> + kernel) is copyrighted by me and others who actually wrote it.
> +
> + Also note that the only valid version of the GPL as far as the 
> + kernel is concerned is _this_ particular version of the license (ie 
> + v2, not
> + v2.2 or v3.x or whatever), unless explicitly otherwise stated.
> +
> +                       Linus Torvalds
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 0132fcffb3..3de8318c39 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -1,6 +1,6 @@
>  SUMMARY = "Linux kernel"
>  SECTION = "kernel"
> -LICENSE = "GPL-2.0-only"
> +LICENSE = "GPL-2.0-only + Linux-syscall-note"
>  HOMEPAGE = "https://www.yoctoproject.org/"
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> --
> 2.45.2
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207746): 
> https://lists.openembedded.org/g/openembedded-core/message/207746
> Mute This Topic: https://lists.openembedded.org/mt/109769586/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub 
> [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

------8A13A406445953256EE498356DF54D3A
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIPQAYJKoZIhvcNAQcCoIIPMTCCDy0CAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggxWMIIGUTCCBDmgAwIBAgICMAAwDQYJKoZIhvcNAQELBQAwgaMx
ITAfBgNVBAMMGERpZWhsIEdyb3VwIE1haWwgUm9vdCBDQTELMAkGA1UEBhMCREUx
EjAQBgNVBAcMCU51ZXJuYmVyZzEUMBIGA1UECgwLRGllaGwgR3JvdXAxFDASBgNV
BAsMC0RpZWhsIEdyb3VwMQ8wDQYDVQQIDAZCYXllcm4xIDAeBgkqhkiG9w0BCQEW
EXg1MDktY2FAZGllaGwuY29tMB4XDTE4MDUyOTEyMzIzNVoXDTI4MDUyNjEyMzIz
NVowgZQxCzAJBgNVBAYTAkRFMQ8wDQYDVQQIDAZCYXllcm4xFDASBgNVBAoMC0Rp
ZWhsIEdyb3VwMRswGQYDVQQLDBJEaWVobCBNZXRlcmluZyBUS0gxHzAdBgNVBAMM
FkRpZWhsIE1ldGVyaW5nIE1haWwgQ0ExIDAeBgkqhkiG9w0BCQEWEXg1MDktY2FA
ZGllaGwuY29tMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtISPrKPL
Zjjh//2n9b+GXgrhijJV2knQVC0+/FS3zGl4p2fboB+Vr4YHz1uilEvhsS1oG4FV
f1u0dqdmLVxDHBPMO2K1NKKOJN/6LDDfyiZGNqDOJke6FzrmDyPXXTDtgzWZfdnD
esx63XSxprre30oJ3BxDFS+/8UpuI628SPc1N4125rHeUXG4scKFSjqRPcIOAQ2X
veGXU2dYHzq7B02NA8tssmtJNwXjyvMjOw6HGZ8SB87TrFQm6drEtM7QhI/mfpGe
nTZ4nc84n0yKuMveav8IOspYbkOXzi4JapiOUpmccNLZdIiMg5WJQ0Xt9NSp5yD5
CYKideGrWgX2wNEBpalgjZoPPQDImcWEJx88/yYZ4FwtRD3VueFqpBr4z/bxwVDr
N2a/sEqnocY9Tm2EQyHFHDCJ9JyYEXB8W0LTFcUAx+uHijwPk/oIB5EeH8UygXlX
qUqII+BUZ+q5m5sIc4eXQ10UpUEjG/ptIyO1Ee/E0kPOWzHp07pPgXCZohZb3y41
Ha2pO6rXOsOmPBK2r2++fLWz3NFyfEJCmn6FcBNi003HUEVCup1D9/9yaPHPSieN
27sjQcQ96GbOitC99p3xMnSlg4N11lGeuTXCZjIGXdZL5/dThQaxneVA+hr2X+i1
KmqnesMaSBEuBEBDmbDbakEgJFVWtVeXuk8CAwEAAaOBmzCBmDASBgNVHRMBAf8E
CDAGAQH/AgEAMAsGA1UdDwQEAwIBBjAdBgNVHQ4EFgQUn8t6NGPzWsF+oZYXxmfn
p4Ok7rIwHwYDVR0jBBgwFoAUZrrYQMMD50v/OCDMgDN7y/GT2P8wNQYDVR0fBC4w
LDAqoCigJoYkaHR0cDovL2tleXMuZGllaGwuY29tL2NybC90ay1oX24uY3JsMA0G
CSqGSIb3DQEBCwUAA4ICAQAl6hO6b6+GseZi3EAU+zPVhxNZP5Y+YsBnjf13jCGw
nUVvPz6giwXiCd9KIC4eCqqrJLTHwZe8c/9hSk5CCd6A5XAd3YudrPDvmIwms5Ex
OREMQkygZO6/qxfXO6IhfUO4HvYQtQexzHOLuxG/KdycVwWapA4acFzBurxFQ3aG
jvPRgvWxe2Mt3K9wLrEhvGrDmS8yg4bYNyBZGgax6LRhfW4/ShInVUa0koG2Sj+H
hKpppvqDK4FNgR2dKeCPoo28P9a+K9N3wkLKx4zxaxHegij0DsJOBAVbhk+vDWDO
gedjtT09c9bsykaXFzykyQeQz7cwrTQ1gDacdcDgywMDQzZKim9O3JpyzvXnD7mb
CvclM3xp9w6jIJbeaQE7HDlA9YIL/bSRIQq8mJcXArUevLK2MX/Mb+5m3UMU+zXc
ZqmaneeZeR4bOWrmmhK6bMuce6H+i2YB1vG3BAcSfKQUzZ1m6aKSW1FvjI3SZXQD
FzRzBwC5ql7i2ugtfOLNYjOO/fvAxNppIZb3IyWN1KBAI7YgS4nx0us/NIlWpTMW
91WeUtNBCp2sgi3VTi/TUel3RZ9x3tggMUhrksGkFXz2NUL85AdPV6BqJXXXHggd
121rnduE9ocMt0MFLuDPkMaHqKNzBAcKTcmFM8KYMJ5Z7NBqGtTAgHNVmEnU8gu3
czCCBf0wggPloAMCAQICAgtcMA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJE
RTEPMA0GA1UECAwGQmF5ZXJuMRQwEgYDVQQKDAtEaWVobCBHcm91cDEbMBkGA1UE
CwwSRGllaGwgTWV0ZXJpbmcgVEtIMR8wHQYDVQQDDBZEaWVobCBNZXRlcmluZyBN
YWlsIENBMSAwHgYJKoZIhvcNAQkBFhF4NTA5LWNhQGRpZWhsLmNvbTAeFw0yNDAx
MDIwOTE5MzlaFw0yNjAxMDIwOTE5MzlaMIG8MSIwIAYDVQQDDBlkZW5pcy5vc3Rl
cmxhbmRAZGllaGwuY29tMSgwJgYJKoZIhvcNAQkBFhlkZW5pcy5vc3RlcmxhbmRA
ZGllaGwuY29tMQswCQYDVQQGEwJERTEPMA0GA1UECAwGQmF5ZXJuMRwwGgYDVQQK
DBNEaWVobCBNZXRlcmluZyBUSy1IMRwwGgYDVQQLDBNEaWVobCBNZXRlcmluZyBU
Sy1IMRIwEAYDVQQHDAlOdWVybmJlcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDC4CfZJns8lrNXSkis30SmXgEPwIED4unjF8EoHzBRk5cQphMwuxVY
uFrZmkB8+FJ7kNnazQ5ddAH+7uh/w7vxEbch92iEpJxYRT6z9U7Mgw0sqGjzWQjd
sVzCSrWJrOdrHXc65BnAPOpjNDNe1dR8J9Z4a7OZU5NnQqJMT314j2gfGawGDakJ
Vph7S6v4AVmty1Fi4iRbaIamu8KJFrHQb5E1UVD5drrxW6TS0z/3YkrMQ6qA1fBB
Y271mRVq/1ByvJMgPJu7LtIyuGwGJw44RxF0JPLlqRWpsIa+z2cI48dkvwb8k0T1
rNSIj9urOmUEJGF5O8LioUy0vwmxeWF7AgMBAAGjggEtMIIBKTAfBgNVHSMEGDAW
gBSfy3o0Y/NawX6hlhfGZ+eng6TusjAJBgNVHRIEAjAAMCQGA1UdEQQdMBuBGWRl
bmlzLm9zdGVybGFuZEBkaWVobC5jb20wNQYDVR0fBC4wLDAqoCigJoYkaHR0cDov
L2tleXMuZGllaGwuY29tL2NybC90ay1oX24uY3JsMDUGCCsGAQUFBwEBBCkwJzAl
BggrBgEFBQcwAoYZaHR0cDovL3d3dy5kaWVobC5jb20vcGtpLzAJBgNVHRMEAjAA
MB0GA1UdDgQWBBQK9y4jVYoCDsL7lhhJKjEP5wv1nTALBgNVHQ8EBAMCBaAwHQYD
VR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGCWCGSAGG+EIBAQQEAwIFoDAN
BgkqhkiG9w0BAQsFAAOCAgEAB27J8TZvm6g0rtQpv4kqYwzkXOkCt27WHHWzl/JZ
knFwWH4mvlRSrQtKkx8cPb5xqqx7k4qXC7TAef4W5YmnpWDtw7YHQAygAsCV1+i8
uBhdnBVRYkLi0Brsqb/KaDVCFDAYn82kr8OlDaVl5GazIF5rTTUFVT7QEUewf5e7
Ej4tkepIMP8DW0mM9VRdiSd+DFQQQsQR91nJZS+Gd0jT2tW6SVtZEGnsdgKi9VOw
+/u7TPynQA3m70zel9t0RySfc5bfZGqEBK/nqU2g5n/qaHKT9cMM8vTAJOmzMv4W
p7j6RF851h+6c4kH0UsUR9LdbXsKS0KsKTmjPbmbuMAWSEafskq5lJdhIybBnGcp
FwOkXw6yLHhvmBQ27hVolbrAgLprlLBm8qLq0G3dPHlLwgnNlD6RAcjaVLOcqH3Q
HWHbKlVg310S75cll1rM+GAudWdsHWxOUbK7R0lwJf/E+FAXciAsExWzCQarpSFI
AYJjvnsYTiSWas6b5L/rKtyeWIz5wJ3ovxFaMglCtGNGh3sqKwVgb0PeGJ/hfXkV
Z3i06A/GFOMDvvZ4kI2OL2wwUftkvi8ID5g2nbX/WQh9y6zhlXtiOlA1IplU+PU3
OHrFL4SBW0X7j1l+9Jl9kGy/ukAr+9nWZ55nUoV/L9C1GLrAO5KF/fDpO2b7lidQ
mWUxggKuMIICqgIBATCBmzCBlDELMAkGA1UEBhMCREUxDzANBgNVBAgMBkJheWVy
bjEUMBIGA1UECgwLRGllaGwgR3JvdXAxGzAZBgNVBAsMEkRpZWhsIE1ldGVyaW5n
IFRLSDEfMB0GA1UEAwwWRGllaGwgTWV0ZXJpbmcgTWFpbCBDQTEgMB4GCSqGSIb3
DQEJARYReDUwOS1jYUBkaWVobC5jb20CAgtcMA0GCWCGSAFlAwQCAQUAoIHkMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTEyNTEy
MzIzNlowLwYJKoZIhvcNAQkEMSIEIIS6MBmZAUdvtZ4ExzPh3zVAJbMeRI3Mb9pG
ALsCbwLIMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBAKk+2Z7A5sZbsWiVN4PMCFzSMk3U90nnzSnbq0GCUwAxAzXPJ7ceIhcHwaQc
yLhFbwRIBF/IXIPHV7HTKxj2ggtdrVfKKjra9xEF/0wU+tUuSK5HeCPMW2gUA9ow
b00ZG+xdYfsh8LD3mxIZkXvQLqaEPxTmBIkZ2yPapnq6tNixYYvGZCaxedwvrwjJ
ZhTqbZ43UVHWCkhawk6RI4mfg/q8Dck8jEqyOMCn3EygnuvO/bssVVk3TcXg9pXC
OPYey1aXXszAG8vx3uiaaGwtoWDUwOAOcYVB00hWmyqi24a49R5dhUSRj4uo84H/
4alw2OrvhcPOl4TPY3SHIbxdzr8=

------8A13A406445953256EE498356DF54D3A--



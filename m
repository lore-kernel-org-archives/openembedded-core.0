Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13769.1794287752727129345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 21:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JHMzTNLw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Za3CVt6/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1c3e251f1-c299f9e6-840b-460b-af68-207f92c48989-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794287751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pMVQI2II2grg3CiW8bpN8vuGpCDqWeDfx1EFtODhRPw=;
	b=JHMzTNLwPa8bk+Xyc/OJdTKWkJ7Y+22YSPr38uI0258gW93KPjUfDxWZ08qLmo0F
	fP+gz12Rs10+icRiL8ZcnDtpTCY5Id3BMKdDYq0AbsIfYkcko4yoAZqFD0u39GC2D5F
	54E8G0al0AuDfMx79jBZwBhz1rp+TFtK7nZAb/Aw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794287751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pMVQI2II2grg3CiW8bpN8vuGpCDqWeDfx1EFtODhRPw=;
	b=Za3CVt6/FqbV69496oGX2cENZf7knckJTz8FcrwqbzUoKoqPx6ufW5DwSbE4VApb
	XtUo9aZ5RUmZ74DBCzODKNt09tYilsCNI5SwQDo7zc8ya002O/km5KwiphvFM40+vmA
	UoVQDN/+M+5w0xdJUQqOkeC64/le/0BG+WcbtJno=
Content-Type: multipart/mixed; boundary="===============1871175085591294601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libconvert-asn1-perl: upgrading to 0.36 SUCCEEDED
Message-ID: <010101a1c3e251f1-c299f9e6-840b-460b-af68-207f92c48989-000000@us-west-2.amazonses.com>
Date: Tue, 10 Nov 2026 05:15:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 05:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249895

--===============1871175085591294601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libconvert-asn1-perl* to *0.36* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libconvert-asn1-perl-upgrade-0.34-0.36.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f8294511092e0e6f1dd51a6dba85755f7883f03b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 10 Nov 2026 05:12:22 +0000
Subject: [PATCH] libconvert-asn1-perl: upgrade 0.34 -> 0.36

0.36 -- Mon Nov 09 18:44:55 AST 2026
Release 0.35 as production release.  Includes:
Bug Fixes
Thanks to Oliver Welter (@oliwel)
0.35 -- Sun Nov 08 12:05:15 AST 2026
Bug Fixes
Thanks to Oliver Welter (@oliwel)
---
 ...ibconvert-asn1-perl_0.34.bb => libconvert-asn1-perl_0.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.34.bb => libconvert-asn1-perl_0.36.bb} (91%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
similarity index 91%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
index 88f22fff37..6cb3ce9fd9 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
+SRC_URI[sha256sum] = "50439aedff4b403f24c9373eefd3c25770e33a9190d93a331e7a744f8b4e7cd3"
 
 S = "${UNPACKDIR}/Convert-ASN1-${PV}"
 
-- 
2.47.1


--===============1871175085591294601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: FILELIST: added "/usr/lib/libconvert-asn1-perl/ptest/t/gentime_9999.der /usr/lib/libconvert-asn1-perl/ptest/t/time_control.der /usr/lib/libconvert-asn1-perl/ptest/t/gentime_1900_1976.der /usr/lib/libconvert-asn1-perl/ptest/t/21x509time.t /usr/lib/libconvert-asn1-perl/ptest/t/gentime_2900.der /usr/lib/libconvert-asn1-perl/ptest/t/utctime_1950_1976.der"

--===============1871175085591294601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libconvert-asn1-perl: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl: SRC_URI changed from "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.34.tar.gz file://ptest-perl/run-ptest" to "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.36.tar.gz file://ptest-perl/run-ptest"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGSIZE changed from 16221 to 16369 (+1%)
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PKGSIZE changed from 69372 to 74022 (+7%)
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: FILELIST: added "/usr/lib/libconvert-asn1-perl/ptest/t/gentime_1900_1976.der /usr/lib/libconvert-asn1-perl/ptest/t/gentime_9999.der /usr/lib/libconvert-asn1-perl/ptest/t/time_control.der /usr/lib/libconvert-asn1-perl/ptest/t/gentime_2900.der /usr/lib/libconvert-asn1-perl/ptest/t/utctime_1950_1976.der /usr/lib/libconvert-asn1-perl/ptest/t/21x509time.t"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PV changed from "0.34" to "0.36"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGV changed from 0.34 [default] to 0.36 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGSIZE changed from 83571 to 83784 (+0%)
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PV changed from "0.34" to "0.36"

--===============1871175085591294601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libconvert-asn1-perl-upgrade-0.34-0.36.patch"

RnJvbSBmODI5NDUxMTA5MmUwZTZmMWRkNTFhNmRiYTg1NzU1Zjc4ODNmMDNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTAgTm92IDIwMjYgMDU6MTI6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb252ZXJ0LWFzbjEtcGVybDogdXBncmFkZSAwLjM0IC0+IDAuMzYKCjAuMzYgLS0gTW9uIE5v
diAwOSAxODo0NDo1NSBBU1QgMjAyNgpSZWxlYXNlIDAuMzUgYXMgcHJvZHVjdGlvbiByZWxlYXNl
LiAgSW5jbHVkZXM6CkJ1ZyBGaXhlcwpUaGFua3MgdG8gT2xpdmVyIFdlbHRlciAoQG9saXdlbCkK
MC4zNSAtLSBTdW4gTm92IDA4IDEyOjA1OjE1IEFTVCAyMDI2CkJ1ZyBGaXhlcwpUaGFua3MgdG8g
T2xpdmVyIFdlbHRlciAoQG9saXdlbCkKLS0tCiAuLi5pYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzQu
YmIgPT4gbGliY29udmVydC1hc24xLXBlcmxfMC4zNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvcGVybC97bGliY29udmVydC1hc24xLXBlcmxfMC4zNC5iYiA9PiBsaWJjb252ZXJ0LWFz
bjEtcGVybF8wLjM2LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9wZXJsL2xpYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvcGVybC9saWJjb252ZXJ0LWFzbjEtcGVybF8wLjM2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNvbnZlcnQtYXNuMS1w
ZXJsXzAuMzQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNvbnZl
cnQtYXNuMS1wZXJsXzAuMzYuYmIKaW5kZXggODhmMjJmZmYzNy4uNmNiM2NlOWZkOSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BlcmwvbGliY29udmVydC1hc24xLXBlcmxfMC4z
NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC9saWJjb252ZXJ0LWFzbjEtcGVy
bF8wLjM2LmJiCkBAIC03LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFE
TUUubWQ7YmVnaW5saW5lPTkxO2VuZGxpbmU9OTc7bWQ1PWNlZmY3ZmQyODZlYjZkOAogCiBTUkNf
VVJJID0gIiR7Q1BBTl9NSVJST1J9L2F1dGhvcnMvaWQvVC9USS9USU1MRUdHRS9Db252ZXJ0LUFT
TjEtJHtQVn0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTYyOGQ3YzlkMzkwNTY4
ZmI3NjM1OTk3NWZhMDNmNjI2Y2U1N2YxMGRjMTc5ODBlOGUzNTg3ZDc3MTNlNGVlNyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1MDQzOWFlZGZmNGI0MDNmMjRjOTM3M2VlZmQzYzI1NzcwZTMzYTkx
OTBkOTNhMzMxZTdhNzQ0ZjhiNGU3Y2QzIgogCiBTID0gIiR7VU5QQUNLRElSfS9Db252ZXJ0LUFT
TjEtJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============1871175085591294601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libconvert-asn1-perl-changelog.txt"

0.36 -- Mon Nov 09 18:44:55 AST 2026
Release 0.35 as production release.  Includes:
Bug Fixes
Thanks to Oliver Welter (@oliwel)
0.35 -- Sun Nov 08 12:05:15 AST 2026
Bug Fixes
Thanks to Oliver Welter (@oliwel)

--===============1871175085591294601==--

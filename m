Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1245.1795158390630922021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=j6ITDJI1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tz0crrw7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1f7c733cd-0cfceb75-2f28-4f23-8d49-76dae58bcb76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795158389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6EeyDn+ago7zw4lNQYrtHxfyq73+tbbq7JlseY8+OtA=;
	b=j6ITDJI1gpk/HXaCGR+AS/2IF5HpxAX2tinDcNnu4WfSM+QW0vDc/bXPuQIwVCGd
	T8WVZq58zQHkAF0Dt3kdStTRjIw4QPDoQeOnIaAAfFp/NvEfyFnreSA/nPLTF+8QVlK
	AsYIHzgifhn4+6spFL1vjW/LVbn7Tu/18yWmqhfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795158389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6EeyDn+ago7zw4lNQYrtHxfyq73+tbbq7JlseY8+OtA=;
	b=tz0crrw7U5+/kP1+MSqd42Y629wdlA6bXStYJZaT8FlWaZKYVAk/JkQ6dgGOlieQ
	RJTHjVOrWFA3Va5io3rD0Pmq8PB9CTdX48TpiAYYwsSh/TDiEdOKuIDPSL9i3L9ySs2
	OMWxk4fjrW9fnHlqq7LLEDL16VPXfVLW/u9RmCjw=
Content-Type: multipart/mixed; boundary="===============1554579173768702196=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libconvert-asn1-perl: upgrading to 0.37 SUCCEEDED
Message-ID: <010101a1f7c733cd-0cfceb75-2f28-4f23-8d49-76dae58bcb76-000000@us-west-2.amazonses.com>
Date: Fri, 20 Nov 2026 07:06:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250732

--===============1554579173768702196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libconvert-asn1-perl* to *0.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libconvert-asn1-perl-upgrade-0.36-0.37.patch
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
From 5ad9e898a3fb8b6acb495e93ec8c417b7d923dfc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 20 Nov 2026 06:07:07 +0000
Subject: [PATCH] libconvert-asn1-perl: upgrade 0.36 -> 0.37

0.37 -- Thu Nov 19 18:30:00 AST 2026
Security Fixes
Bug Fixes
Incompatible Changes
---
 ...ibconvert-asn1-perl_0.36.bb => libconvert-asn1-perl_0.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.36.bb => libconvert-asn1-perl_0.37.bb} (91%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.37.bb
similarity index 91%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.37.bb
index 6cb3ce9fd9..c628ef6856 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "50439aedff4b403f24c9373eefd3c25770e33a9190d93a331e7a744f8b4e7cd3"
+SRC_URI[sha256sum] = "012b90bbb931e049340a114dbc510f845309d9ca76cc6c4fad751d317b4bf0fa"
 
 S = "${UNPACKDIR}/Convert-ASN1-${PV}"
 
-- 
2.47.1


--===============1554579173768702196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libconvert-asn1-perl: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl: SRC_URI changed from "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.36.tar.gz file://ptest-perl/run-ptest" to "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.37.tar.gz file://ptest-perl/run-ptest"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGSIZE changed from 16369 to 20507 (+25%)
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PKGSIZE changed from 74022 to 97339 (+32%)
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: FILELIST: added "/usr/lib/libconvert-asn1-perl/ptest/t/24enc_integer_validate.t /usr/lib/libconvert-asn1-perl/ptest/t/26dec_depth_limit.t /usr/lib/libconvert-asn1-perl/ptest/t/27asn_read_length.t /usr/lib/libconvert-asn1-perl/ptest/t/25dec_bitstring_zero_len.t /usr/lib/libconvert-asn1-perl/ptest/t/23dec_real.t /usr/lib/libconvert-asn1-perl/ptest/t/22asn_recv_truncated.t /usr/lib/libconvert-asn1-perl/ptest/t/28oid_arc_limit.t /usr/lib/libconvert-asn1-perl/ptest/t/20integer_max_len.t"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGV changed from 0.36 [default] to 0.37 [default]
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PV changed from "0.36" to "0.37"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGSIZE changed from 83784 to 92211 (+10%)

--===============1554579173768702196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libconvert-asn1-perl-changelog.txt"

0.37 -- Thu Nov 19 18:30:00 AST 2026
Security Fixes
Bug Fixes
Incompatible Changes

--===============1554579173768702196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGSIZE changed from 16369 to 20507 (+25%)
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PKGSIZE changed from 74022 to 97339 (+32%)
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: FILELIST: added "/usr/lib/libconvert-asn1-perl/ptest/t/20integer_max_len.t /usr/lib/libconvert-asn1-perl/ptest/t/22asn_recv_truncated.t /usr/lib/libconvert-asn1-perl/ptest/t/26dec_depth_limit.t /usr/lib/libconvert-asn1-perl/ptest/t/24enc_integer_validate.t /usr/lib/libconvert-asn1-perl/ptest/t/25dec_bitstring_zero_len.t /usr/lib/libconvert-asn1-perl/ptest/t/27asn_read_length.t /usr/lib/libconvert-asn1-perl/ptest/t/28oid_arc_limit.t /usr/lib/libconvert-asn1-perl/ptest/t/23dec_real.t"
packages/x86-64-v3-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGSIZE changed from 83784 to 92211 (+10%)

--===============1554579173768702196==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libconvert-asn1-perl-upgrade-0.36-0.37.patch"

RnJvbSA1YWQ5ZTg5OGEzZmI4YjZhY2I0OTVlOTNlYzhjNDE3YjdkOTIzZGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjAgTm92IDIwMjYgMDY6MDc6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb252ZXJ0LWFzbjEtcGVybDogdXBncmFkZSAwLjM2IC0+IDAuMzcKCjAuMzcgLS0gVGh1IE5v
diAxOSAxODozMDowMCBBU1QgMjAyNgpTZWN1cml0eSBGaXhlcwpCdWcgRml4ZXMKSW5jb21wYXRp
YmxlIENoYW5nZXMKLS0tCiAuLi5pYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzYuYmIgPT4gbGliY29u
dmVydC1hc24xLXBlcmxfMC4zNy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC97
bGliY29udmVydC1hc24xLXBlcmxfMC4zNi5iYiA9PiBsaWJjb252ZXJ0LWFzbjEtcGVybF8wLjM3
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNv
bnZlcnQtYXNuMS1wZXJsXzAuMzYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC9saWJj
b252ZXJ0LWFzbjEtcGVybF8wLjM3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzYuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNvbnZlcnQtYXNuMS1wZXJs
XzAuMzcuYmIKaW5kZXggNmNiM2NlOWZkOS4uYzYyOGVmNjg1NiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3BlcmwvbGliY29udmVydC1hc24xLXBlcmxfMC4zNi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC9saWJjb252ZXJ0LWFzbjEtcGVybF8wLjM3LmJiCkBA
IC03LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubWQ7YmVnaW5s
aW5lPTkxO2VuZGxpbmU9OTc7bWQ1PWNlZmY3ZmQyODZlYjZkOAogCiBTUkNfVVJJID0gIiR7Q1BB
Tl9NSVJST1J9L2F1dGhvcnMvaWQvVC9USS9USU1MRUdHRS9Db252ZXJ0LUFTTjEtJHtQVn0udGFy
Lmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTA0MzlhZWRmZjRiNDAzZjI0YzkzNzNlZWZk
M2MyNTc3MGUzM2E5MTkwZDkzYTMzMWU3YTc0NGY4YjRlN2NkMyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIwMTJiOTBiYmI5MzFlMDQ5MzQwYTExNGRiYzUxMGY4NDUzMDlkOWNhNzZjYzZjNGZhZDc1
MWQzMTdiNGJmMGZhIgogCiBTID0gIiR7VU5QQUNLRElSfS9Db252ZXJ0LUFTTjEtJHtQVn0iCiAK
LS0gCjIuNDcuMQoK

--===============1554579173768702196==--

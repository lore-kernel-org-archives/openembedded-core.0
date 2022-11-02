Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24875C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.870.1667349631595276587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LiB6YbPk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018435c84e30-e286503c-c729-4d5c-b23c-3c16ed51ea40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349630;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hJEFvIgkwshQh9d0on24idvKQzeTxO9lfDBlmpOtsoU=;
	b=LiB6YbPk5aWi2E+ShI6Zy8sMgLCN6xrneAQKXE9MgJjl5IjQh/U5Df+VM0TPiAlW
	SjuR2pHFBImePkWWNTe4kCi9iSeSlP0zk0aAgB1A3IxDG/UuXAWXS/7gvbNFPh3XlGf
	B1Nip3Plv3d0fXWCMOVYWCRx1ac512wvIMlCrl3c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349630;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hJEFvIgkwshQh9d0on24idvKQzeTxO9lfDBlmpOtsoU=;
	b=TjRP2U7SNZn3sgka1RgYeHj1jdojJ0J0XILHuN/gqxuFnqY7J8I6pV7O2nC7ZH6T
	VlpmkXqkOpXTzpOQLrZLX/aKlgkzOremHz5IBzUa9UUr44ywKJjDcsLySE0olWMu8+w
	ShE9lJRDsLA2emD0+71gIMLmZxUNB42U/mSSYDJE=
Content-Type: multipart/mixed; boundary="===============2252757597902964134=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] inetutils: upgrading to 2.4 SUCCEEDED
Message-ID: <0101018435c84e30-e286503c-c729-4d5c-b23c-3c16ed51ea40-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172395

--===============2252757597902964134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *inetutils* to *2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-inetutils-upgrade-2.3-2.4.patch
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
--===============2252757597902964134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/inetutils/inetutils-dbg: PKGSIZE changed from 4042680 to 4045380 (+0%)
packages/core2-32-poky-linux/inetutils/inetutils-dbg: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-dbg: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-dev: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-dev: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-doc: PKGSIZE changed from 264763 to 265026 (+0%)
packages/core2-32-poky-linux/inetutils/inetutils-doc: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-doc: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-ftp: PKGSIZE changed from 170124 to 174220 (+2%)
packages/core2-32-poky-linux/inetutils/inetutils-ftp: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-ftp: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-ftpd: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-ftpd: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-hostname: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-hostname: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-ifconfig: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-ifconfig: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-inetd: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-inetd: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-locale: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-locale: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-logger: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-logger: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-ping: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-ping: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-ping6: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-ping6: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-rsh: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-rsh: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-rshd-dbg: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-rshd-dbg: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-rshd: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-rshd: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-src: PKGSIZE changed from 3052815 to 3056663 (+0%)
packages/core2-32-poky-linux/inetutils/inetutils-src: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-src: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-staticdev: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-staticdev: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-syslogd: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-syslogd: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-telnet: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-telnet: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-telnetd-dbg: PKGSIZE changed from 261592 to 261584 (-0%)
packages/core2-32-poky-linux/inetutils/inetutils-telnetd-dbg: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-telnetd-dbg: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-telnetd: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-telnetd: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-tftp: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-tftp: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-tftpd-dbg: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-tftpd-dbg: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-tftpd: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-tftpd: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils-traceroute: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils-traceroute: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils/inetutils: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils/inetutils: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/inetutils: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/inetutils: SRC_URI changed from "https://ftp.gnu.org/gnu/inetutils/inetutils-2.3.tar.xz file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch file://inetutils-1.8-0003-wchar.patch file://rexec.xinetd.inetutils file://rlogin.xinetd.inetutils file://rsh.xinetd.inetutils file://telnet.xinetd.inetutils file://tftpd.xinetd.inetutils file://inetutils-1.9-PATH_PROCNET_DEV.patch file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch file://CVE-2022-39028.patch" to "https://ftp.gnu.org/gnu/inetutils/inetutils-2.4.tar.xz file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch file://inetutils-1.8-0003-wchar.patch file://rexec.xinetd.inetutils file://rlogin.xinetd.inetutils file://rsh.xinetd.inetutils file://telnet.xinetd.inetutils file://tftpd.xinetd.inetutils file://inetutils-1.9-PATH_PROCNET_DEV.patch file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch"

--===============2252757597902964134==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-inetutils-upgrade-2.3-2.4.patch"

RnJvbSBkYjhkMGIyOTI0ZTQ1Zjg0NGY1ZmU3NzFjMWNmMGYxYzQzYzM1ODVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNjozODo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlu
ZXR1dGlsczogdXBncmFkZSAyLjMgLT4gMi40CgotLS0KIC4uLi9pbmV0dXRpbHMvaW5ldHV0aWxz
L0NWRS0yMDIyLTM5MDI4LnBhdGNoICB8IDU0IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi97aW5l
dHV0aWxzXzIuMy5iYiA9PiBpbmV0dXRpbHNfMi40LmJifSAgICB8IDEwICsrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2luZXR1dGlscy9pbmV0dXRpbHMvQ1ZFLTIw
MjItMzkwMjgucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2luZXR1dGls
cy97aW5ldHV0aWxzXzIuMy5iYiA9PiBpbmV0dXRpbHNfMi40LmJifSAoOTYlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaW5ldHV0aWxzL2luZXR1dGlscy9DVkUtMjAy
Mi0zOTAyOC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaW5ldHV0aWxzL2luZXR1
dGlscy9DVkUtMjAyMi0zOTAyOC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
M2IwNzUxNWM3Yi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lu
ZXR1dGlscy9pbmV0dXRpbHMvQ1ZFLTIwMjItMzkwMjgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSw1NCArMCwwIEBACi1Gcm9tIGQ1MjM0OWZhMWI2YmFhYzc3ZmZhMmM3NDc2OTYzNmFhMmVjZTJl
YzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBFcmlrIEF1ZXJzd2FsZCA8YXVlcnN3
YWxAdW5peC1hZy51bmkta2wuZGU+Ci1EYXRlOiBTYXQsIDMgU2VwIDIwMjIgMTY6NTg6MTYgKzAy
MDAKLVN1YmplY3Q6IFtQQVRDSF0gdGVsbmV0ZDogSGFuZGxlIGVhcmx5IElBQyBFQyBvciBJQUMg
RUwgcmVjZWlwdAotCi1GaXggdGVsbmV0ZCBjcmFzaCBpZiB0aGUgZmlyc3QgdHdvIGJ5dGVzIG9m
IGEgbmV3IGNvbm5lY3Rpb24KLWFyZSAweGZmIDB4ZjcgKElBQyBFQykgb3IgMHhmZiAweGY4IChJ
QUMgRUwpLgotCi1UaGUgcHJvYmxlbSB3YXMgcmVwb3J0ZWQgaW46Ci08aHR0cHM6Ly9waWVycmVr
aW0uZ2l0aHViLmlvL2Jsb2cvMjAyMi0wOC0yNC0yLWJ5dGUtZG9zLWZyZWVic2QtbmV0YnNkLXRl
bG5ldGQtbmV0a2l0LXRlbG5ldGQtaW5ldHV0aWxzLXRlbG5ldGQta2VyYmVyb3MtdGVsbmV0ZC5o
dG1sPi4KLQotKiBORVdTOiBNZW50aW9uIGZpeC4KLSogdGVsbmV0ZC9zdGF0ZS5jICh0ZWxyY3Yp
OiBIYW5kbGUgemVybyBzbGN0YWJbU0xDX0VDXS5zcHRyIGFuZAotemVybyBzbGN0YWJbU0xDX0VM
XS5zcHRyLgotCi1DVkU6IENWRS0yMDIyLTM5MDI4Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
IFtodHRwczovL2dpdC5zYXZhbm5haC5nbnUub3JnL2NnaXQvaW5ldHV0aWxzLmdpdC9jb21taXQv
P2lkPWZhZTgyNjNlNDY3MzgwNDgzYzI4NTEzYzBlNWZhYzE0M2U0NmY5NGZdCi1TaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gdGVsbmV0ZC9zdGF0ZS5j
IHwgMTIgKysrKysrKysrLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3RlbG5ldGQvc3RhdGUuYyBiL3RlbG5ldGQvc3Rh
dGUuYwotaW5kZXggZmZjNmNiYS4uYzJkNzYwZiAxMDA2NDQKLS0tLSBhL3RlbG5ldGQvc3RhdGUu
YwotKysrIGIvdGVsbmV0ZC9zdGF0ZS5jCi1AQCAtMzEyLDE1ICszMTIsMjEgQEAgdGVscmN2ICh2
b2lkKQotIAkgICAgY2FzZSBFQzoKLSAJICAgIGNhc2UgRUw6Ci0gCSAgICAgIHsKLS0JCWNjX3Qg
Y2g7Ci0rCQljY190IGNoID0gKGNjX3QpIChfUE9TSVhfVkRJU0FCTEUpOwotIAotIAkJREVCVUcg
KGRlYnVnX29wdGlvbnMsIDEsIHByaW50b3B0aW9uICgidGQ6IHJlY3YgSUFDIiwgYykpOwotIAkJ
cHR5Zmx1c2ggKCk7CS8qIGhhbGYtaGVhcnRlZCAqLwotIAkJaW5pdF90ZXJtYnVmICgpOwotIAkJ
aWYgKGMgPT0gRUMpCi0tCQkgIGNoID0gKnNsY3RhYltTTENfRUNdLnNwdHI7Ci0rCQkgIHsKLSsJ
CSAgICBpZiAoc2xjdGFiW1NMQ19FQ10uc3B0cikKLSsJCSAgICAgIGNoID0gKnNsY3RhYltTTENf
RUNdLnNwdHI7Ci0rCQkgIH0KLSAJCWVsc2UKLS0JCSAgY2ggPSAqc2xjdGFiW1NMQ19FTF0uc3B0
cjsKLSsJCSAgewotKwkJICAgIGlmIChzbGN0YWJbU0xDX0VMXS5zcHRyKQotKwkJICAgICAgY2gg
PSAqc2xjdGFiW1NMQ19FTF0uc3B0cjsKLSsJCSAgfQotIAkJaWYgKGNoICE9IChjY190KSAoX1BP
U0lYX1ZESVNBQkxFKSkKLSAJCSAgcHR5X291dHB1dF9ieXRlICgodW5zaWduZWQgY2hhcikgY2gp
OwotIAkJYnJlYWs7Ci0tLSAKLTIuMzcuMwotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2luZXR1dGlscy9pbmV0dXRpbHNfMi4zLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9pbmV0dXRpbHMvaW5ldHV0aWxzXzIuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2luZXR1dGlscy9pbmV0dXRpbHNf
Mi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2luZXR1dGlscy9pbmV0
dXRpbHNfMi40LmJiCmluZGV4IDJmY2U4NDM3NGQuLjZkMjA0NjZkMzggMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaW5ldHV0aWxzL2luZXR1dGlsc18yLjMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pbmV0dXRpbHMvaW5ldHV0aWxzXzIuNC5iYgpAQCAt
MTAsMjYgKzEwLDI0IEBAIExJQ0VOU0UgPSAiR1BMLTMuMC1vbmx5IgogCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0wYzcwNTFhZWY5MjE5ZGM3MjM3ZjIwNmM1YzQxNzlh
NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBiMDFiYjA4ZTI5NjIzYzRlM2I5NDBmMjMzYzk2
MTQ1MWQ5YWY4YzUwNjYzMDFhZGQ3NmE1MmE5NWQ1MTc3MmMiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMTc4OWQ2YjFiMWE1N2RmZTJhN2FiN2I1MzNlZTlmNWRmZDljYmY1YjU5YmIxYmIzYzI2MTJl
ZDA4ZDBmNjhiMiIKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9pbmV0dXRpbHMvaW5ldHV0aWxz
LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9pbmV0dXRpbHMtMS44LTAwMDEtcHJp
bnRmLXBhcnNlLXB1bGwtaW4tZmVhdHVyZXMuaC1mb3ItX19HTElCQ19fLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovL2luZXR1dGlscy0xLjgtMDAwMy13Y2hhci5wYXRjaCBcCi0gICAgICAgICAg
IGZpbGU6Ly9yZXhlYy54aW5ldGQuaW5ldHV0aWxzICBcCisgICAgICAgICAgIGZpbGU6Ly9yZXhl
Yy54aW5ldGQuaW5ldHV0aWxzIFwKICAgICAgICAgICAgZmlsZTovL3Jsb2dpbi54aW5ldGQuaW5l
dHV0aWxzIFwKICAgICAgICAgICAgZmlsZTovL3JzaC54aW5ldGQuaW5ldHV0aWxzIFwKICAgICAg
ICAgICAgZmlsZTovL3RlbG5ldC54aW5ldGQuaW5ldHV0aWxzIFwKICAgICAgICAgICAgZmlsZTov
L3RmdHBkLnhpbmV0ZC5pbmV0dXRpbHMgXAogICAgICAgICAgICBmaWxlOi8vaW5ldHV0aWxzLTEu
OS1QQVRIX1BST0NORVRfREVWLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2luZXR1dGlscy1v
bmx5LWNoZWNrLXBhbV9hcHBsLmgtd2hlbi1wYW0tZW5hYmxlZC5wYXRjaCBcCi0gICAgICAgICAg
IGZpbGU6Ly9DVkUtMjAyMi0zOTAyOC5wYXRjaCBcCi0iCisgICAgICAgICAgICR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsICcnLCAnZmlsZTovL2ZpeC1kaXNh
YmxlLWlwdjYucGF0Y2gnLCBkKX0gXAorICAgICAgICAgICAiCiAKIGluaGVyaXQgYXV0b3Rvb2xz
IGdldHRleHQgdXBkYXRlLWFsdGVybmF0aXZlcyB0ZXhpbmZvCiAKIGFjcGF0aHMgPSAiLUkgLi9t
NCIKIAotU1JDX1VSSSArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycs
ICdpcHY2JywgJycsICdmaWxlOi8vZml4LWRpc2FibGUtaXB2Ni5wYXRjaCcsIGQpfSIKLQogUEFD
S0FHRUNPTkZJRyA/Pz0gImZ0cCB1dWNwZCBcCiAgICAgICAgICAgICAgICAgICAgJHtAYmIudXRp
bHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywgZCl9IFwKICAgICAgICAgICAgICAg
ICAgICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCAnaXB2
NiBwaW5nNicsICcnLCBkKX0gXAotLSAKMi4zMS4xCgo=

--===============2252757597902964134==--


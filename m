Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F053C7EE32
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.24018.1677681913557890715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fJQDHYFx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101869da26ac1-0ca94617-260f-4363-9ef4-7cf57fa68867-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pp8REHhQSJwc1o7jf7xbAdAsJeiLSDenrRkUAAvXkVM=;
	b=fJQDHYFxOpqi0dvvCineQKszpiOY4jaMwpDFbBi0x9irxrwft9ed+aoKcv0kOrrE
	kZt2qeji+Q8rajHupuIYguXJyffEhVFY1SHM23KCtwlwtjw9nd8fbdZP+v+3KmiceNN
	WOcA1o823ew4SAwQvaHVC040hZelsuAANY3Dozo0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pp8REHhQSJwc1o7jf7xbAdAsJeiLSDenrRkUAAvXkVM=;
	b=BnnLqU8uL/6wrBzu4dRTDApP2IPtLFb3dUGF5jyKRJYk2tSP4tqlKV57VzonD67W
	2PZKnwOptnsMQ7bUkWVmWh35VMN6m3dYxsrJ0SIUHEUmJ33bt2vv6TJ9WWJ5GO//57U
	fJoc2nrFigJHwr22+XA3Sz1C1BEzMx2jGQai8l/U=
Content-Type: multipart/mixed; boundary="===============6468018022985520195=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.12 SUCCEEDED
Message-ID: <010101869da26ac1-0ca94617-260f-4363-9ef4-7cf57fa68867-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177890

--===============6468018022985520195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.11-9.18.12.patch
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
--===============6468018022985520195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libbind9-9.18.11.so /usr/lib/.debug/libisccc-9.18.11.so /usr/lib/.debug/libisccfg-9.18.11.so /usr/lib/.debug/libdns-9.18.11.so /usr/lib/.debug/libirs-9.18.11.so /usr/lib/.debug/libisc-9.18.11.so /usr/lib/.debug/libns-9.18.11.so", added "/usr/lib/.debug/libbind9-9.18.12.so /usr/lib/.debug/libisccfg-9.18.12.so /usr/lib/.debug/libisccc-9.18.12.so /usr/lib/.debug/libns-9.18.12.so /usr/lib/.debug/libdns-9.18.12.so /usr/lib/.debug/libirs-9.18.12.so /usr/lib/.debug/libisc-9.18.12.so"
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10874972 to 10880888 (+0%)
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1455912 to 1455299 (-0%)
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 307208 to 305244 (-1%)
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.18.11.so /usr/lib/libisc-9.18.11.so /usr/lib/libirs-9.18.11.so /usr/lib/libisccfg-9.18.11.so /usr/lib/libbind9-9.18.11.so /usr/lib/libns-9.18.11.so /usr/lib/libdns-9.18.11.so", added "/usr/lib/libisccfg-9.18.12.so /usr/lib/libisc-9.18.12.so /usr/lib/libirs-9.18.12.so /usr/lib/libbind9-9.18.12.so /usr/lib/libisccc-9.18.12.so /usr/lib/libns-9.18.12.so /usr/lib/libdns-9.18.12.so"
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.11.so", added "/usr/lib/*-9.18.12.so"
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9585814 to 9589230 (+0%)
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.11" to "9.18.12"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.11 [default] to 9.18.12 [default]
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.11/bind-9.18.11.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.12/bind-9.18.12.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PV changed from "9.18.11" to "9.18.12"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.11.so to libbind9-9.18.12.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.11.so to libdns-9.18.12.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.11.so to libirs-9.18.12.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.11.so to libisccc-9.18.12.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.11.so to libisccfg-9.18.12.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.11.so to libisc-9.18.12.so
  /usr/lib/libns.so changed symlink target from libns-9.18.11.so to libns-9.18.12.so
  /usr/lib/libbind9-9.18.11.so moved to /usr/lib/libbind9-9.18.12.so
  /usr/lib/libdns-9.18.11.so moved to /usr/lib/libdns-9.18.12.so
  /usr/lib/libirs-9.18.11.so moved to /usr/lib/libirs-9.18.12.so
  /usr/lib/libisc-9.18.11.so moved to /usr/lib/libisc-9.18.12.so
  /usr/lib/libisccc-9.18.11.so moved to /usr/lib/libisccc-9.18.12.so
  /usr/lib/libisccfg-9.18.11.so moved to /usr/lib/libisccfg-9.18.12.so
  /usr/lib/libns-9.18.11.so moved to /usr/lib/libns-9.18.12.so

--===============6468018022985520195==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.11-9.18.12.patch"

RnJvbSA1N2QyNmQ2MTVjMzk0MTU0NTYyNWI4N2MyN2IxM2IyMjZjNGI4Y2MxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwNjoxNzo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC4xMSAtPiA5LjE4LjEyCgotLS0KIC4uLi8wMDAxLWF2b2lkLXN0YXJ0
LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggICAgICAgICAgICAgICB8IDAKIC4uLi8wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoICB8
IDAKIC4uLi9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1z
eXNyLnBhdGNoICB8IDAKIC4uLi9iaW5kL3tiaW5kLTkuMTguMTEgPT4gYmluZC05LjE4LjEyfS9i
aW5kOSAgICAgICAgICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kLTkuMTguMTEgPT4gYmlu
ZC05LjE4LjEyfS9jb25mLnBhdGNoICAgICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kLTku
MTguMTEgPT4gYmluZC05LjE4LjEyfS9nZW5lcmF0ZS1ybmRjLWtleS5zaCAgICB8IDAKIC4uLi9p
bml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggICAgICAgICAgICAg
ICB8IDAKIC4uLi9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kLTkuMTguMTEgPT4gYmluZC05LjE4LjEy
fS9uYW1lZC5zZXJ2aWNlICAgICAgICAgICB8IDAKIC4uLi9iaW5kL3tiaW5kXzkuMTguMTEuYmIg
PT4gYmluZF85LjE4LjEyLmJifSAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEwIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTEgPT4gYmluZC05LjE4LjEyfS8wMDAxLWF2
b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTEgPT4gYmluZC05LjE4LjEy
fS8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBh
dGNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05
LjE4LjExID0+IGJpbmQtOS4xOC4xMn0vYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhl
YWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC4xMSA9PiBiaW5kLTkuMTguMTJ9L2JpbmQ5ICgxMDAl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjExID0+
IGJpbmQtOS4xOC4xMn0vY29uZi5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC4xMSA9PiBiaW5kLTkuMTguMTJ9L2dlbmVyYXRlLXJu
ZGMta2V5LnNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97
YmluZC05LjE4LjExID0+IGJpbmQtOS4xOC4xMn0vaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFk
LW9ubHktcm9vdGZzLnBhdGNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC97YmluZC05LjE4LjExID0+IGJpbmQtOS4xOC4xMn0vbWFrZS1ldGMtaW5pdGQtYmlu
ZC1zdG9wLXdvcmsucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL3tiaW5kLTkuMTguMTEgPT4gYmluZC05LjE4LjEyfS9uYW1lZC5zZXJ2aWNlICgxMDAl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjE4LjExLmJi
ID0+IGJpbmRfOS4xOC4xMi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjExLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRo
LWJpbmQtdXNlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguMTIvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjExLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5w
YXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4x
Mi8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTEvMDAwMS1uYW1l
ZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTIvMDAwMS1uYW1lZC1sd3Jlc2Qt
Vi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC4xMS8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25z
LnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4
LjEyLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMu
cGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguMTEvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTIvYmlu
ZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQtOS4xOC4xMS9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVy
cy1zZWFyY2hlcy1zeXNyLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC05LjE4LjEyL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJz
LXNlYXJjaGVzLXN5c3IucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kLTkuMTguMTEvYmluZDkgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjEyL2JpbmQ5CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjExL2JpbmQ5CnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjEyL2JpbmQ5CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjExL2NvbmYu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjEyL2NvbmYu
cGF0Y2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTEvY29uZi5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMi9jb25mLnBhdGNoCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjExL2dlbmVyYXRlLXJu
ZGMta2V5LnNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMi9n
ZW5lcmF0ZS1ybmRjLWtleS5zaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMS9nZW5lcmF0ZS1ybmRjLWtl
eS5zaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4x
Mi9nZW5lcmF0ZS1ybmRjLWtleS5zaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC4xMS9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1y
b290ZnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjEy
L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC4xMS9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTIvaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjExL21ha2UtZXRjLWluaXRk
LWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC4xMi9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC4xMS9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMi9tYWtlLWV0Yy1pbml0
ZC1iaW5kLXN0b3Atd29yay5wYXRjaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC4xMS9uYW1lZC5zZXJ2aWNlIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMi9uYW1lZC5zZXJ2aWNlCnNpbWlsYXJpdHkgaW5kZXgg
MTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4
LjExL25hbWVkLnNlcnZpY2UKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLTkuMTguMTIvbmFtZWQuc2VydmljZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xMS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kXzkuMTguMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xMi5iYgppbmRleCA1NWEw
NmVhZTVmLi5hYmNlMWMwZjQ1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZF85LjE4LjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kXzkuMTguMTIuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Z0
cC5pc2Mub3JnL2lzYy9iaW5kOS8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBc
CiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmZjMzNTI4MTIyMzBjYmNi
ZGE0MmRmODdjYWQ5NjFmOTQxNjNkM2RhNDU3YzVlNGJlZjgwNTdmZDVkZjIxNTgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDc3NjZiYjdiMDYzYWFiYmFkMDU0Mzg2YjE5MGFhN2Y2YzE0NTI0NDI3
YWZkNDI3YzMwZWM0MjY1MTIwMjdlNyIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8v
ZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyIKICMgZm9sbG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNp
YmxlIGJ5IDIKLS0gCjIuMzkuMgoK

--===============6468018022985520195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libbind9-9.18.11.so /usr/lib/libdns-9.18.11.so /usr/lib/libns-9.18.11.so /usr/lib/libirs-9.18.11.so /usr/lib/libisc-9.18.11.so /usr/lib/libisccfg-9.18.11.so /usr/lib/libisccc-9.18.11.so", added "/usr/lib/libbind9-9.18.12.so /usr/lib/libisccc-9.18.12.so /usr/lib/libisccfg-9.18.12.so /usr/lib/libisc-9.18.12.so /usr/lib/libdns-9.18.12.so /usr/lib/libirs-9.18.12.so /usr/lib/libns-9.18.12.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.11.so to libbind9-9.18.12.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.11.so to libdns-9.18.12.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.11.so to libirs-9.18.12.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.11.so to libisccc-9.18.12.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.11.so to libisccfg-9.18.12.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.11.so to libisc-9.18.12.so
  /usr/lib/libns.so changed symlink target from libns-9.18.11.so to libns-9.18.12.so
  /usr/lib/libbind9-9.18.11.so moved to /usr/lib/libbind9-9.18.12.so
  /usr/lib/libdns-9.18.11.so moved to /usr/lib/libdns-9.18.12.so
  /usr/lib/libirs-9.18.11.so moved to /usr/lib/libirs-9.18.12.so
  /usr/lib/libisc-9.18.11.so moved to /usr/lib/libisc-9.18.12.so
  /usr/lib/libisccc-9.18.11.so moved to /usr/lib/libisccc-9.18.12.so
  /usr/lib/libisccfg-9.18.11.so moved to /usr/lib/libisccfg-9.18.12.so
  /usr/lib/libns-9.18.11.so moved to /usr/lib/libns-9.18.12.so

--===============6468018022985520195==--


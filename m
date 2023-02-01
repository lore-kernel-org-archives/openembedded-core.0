Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838E1C7EE2A
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.30349.1675272853313208942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jgNJMruh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101860e0b1362-f510b2fc-8c57-4c04-8a2a-90a336e4ad58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yCq28LMX1y9ssYuBjSHz2Z86bhZ4iHyovgCA2HATt+g=;
	b=jgNJMruhTeAEEquTFF7ZG1OP4vhB3RPnacDkUGs2OV0sgBV1wC2XiUww9NCTEcy1
	YwTCKvipmMkvVIykL6KCUMxCFrchq0/ciK4apqsARMErMHi2aFLS+Tlb2qT9pYutqKz
	BAVacmqEtAdipGa5GKUwe+sK9PTKyMeLqu3zn7mc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yCq28LMX1y9ssYuBjSHz2Z86bhZ4iHyovgCA2HATt+g=;
	b=O7oGlOkDTCNc62O4fdYDcSPf3a3X5gLInT3n5UE8vRY3zEA5rdrT/2syITVs6fXR
	bf05x4CgEOgk6hg6NuD7sNqq+7jcEYRKgIg8Eza35JhPnO8dhG15n55x2l33RCISjsm
	VnaHV4NzKtPLEpLPAdRHltHbSVZ7+zS67ELx99gY=
Content-Type: multipart/mixed; boundary="===============8733748916567425282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.11 SUCCEEDED
Message-ID: <010101860e0b1362-f510b2fc-8c57-4c04-8a2a-90a336e4ad58-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176572

--===============8733748916567425282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.10-9.18.11.patch
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
--===============8733748916567425282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.18.10.so /usr/lib/.debug/libirs-9.18.10.so /usr/lib/.debug/libisc-9.18.10.so /usr/lib/.debug/libisccfg-9.18.10.so /usr/lib/.debug/libbind9-9.18.10.so /usr/lib/.debug/libisccc-9.18.10.so /usr/lib/.debug/libns-9.18.10.so", added "/usr/lib/.debug/libdns-9.18.11.so /usr/lib/.debug/libirs-9.18.11.so /usr/lib/.debug/libisc-9.18.11.so /usr/lib/.debug/libbind9-9.18.11.so /usr/lib/.debug/libisccc-9.18.11.so /usr/lib/.debug/libns-9.18.11.so /usr/lib/.debug/libisccfg-9.18.11.so"
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10862004 to 10874852 (+0%)
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1453858 to 1455912 (+0%)
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 308999 to 307208 (-1%)
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.18.10.so /usr/lib/libisc-9.18.10.so /usr/lib/libns-9.18.10.so /usr/lib/libisccfg-9.18.10.so /usr/lib/libbind9-9.18.10.so /usr/lib/libirs-9.18.10.so /usr/lib/libdns-9.18.10.so", added "/usr/lib/libisccfg-9.18.11.so /usr/lib/libisccc-9.18.11.so /usr/lib/libirs-9.18.11.so /usr/lib/libbind9-9.18.11.so /usr/lib/libns-9.18.11.so /usr/lib/libdns-9.18.11.so /usr/lib/libisc-9.18.11.so"
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.10.so", added "/usr/lib/*-9.18.11.so"
packages/core2-32-poky-linux/bind/bind-libs: PKGSIZE changed from 6405496 to 6397336 (-0%)
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9592801 to 9585814 (-0%)
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind/bind: PKGSIZE changed from 1220548 to 1212388 (-1%)
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.10" to "9.18.11"
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.10/bind-9.18.10.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.11/bind-9.18.11.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.10 [default] to 9.18.11 [default]
packages/core2-32-poky-linux/bind: PV changed from "9.18.10" to "9.18.11"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.10.so to libbind9-9.18.11.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.10.so to libdns-9.18.11.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.10.so to libirs-9.18.11.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.10.so to libisccc-9.18.11.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.10.so to libisccfg-9.18.11.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.10.so to libisc-9.18.11.so
  /usr/lib/libns.so changed symlink target from libns-9.18.10.so to libns-9.18.11.so
  /usr/lib/libbind9-9.18.10.so moved to /usr/lib/libbind9-9.18.11.so
  /usr/lib/libdns-9.18.10.so moved to /usr/lib/libdns-9.18.11.so
  /usr/lib/libirs-9.18.10.so moved to /usr/lib/libirs-9.18.11.so
  /usr/lib/libisc-9.18.10.so moved to /usr/lib/libisc-9.18.11.so
  /usr/lib/libisccc-9.18.10.so moved to /usr/lib/libisccc-9.18.11.so
  /usr/lib/libisccfg-9.18.10.so moved to /usr/lib/libisccfg-9.18.11.so
  /usr/lib/libns-9.18.10.so moved to /usr/lib/libns-9.18.11.so

--===============8733748916567425282==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.10-9.18.11.patch"

RnJvbSA5ZDgxNTc4MzI2ZTUwMDgyZWM0ODdjMDQwNDE2NzQ5NWU0ZmY3MjQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwNjoxNTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC4xMCAtPiA5LjE4LjExCgotLS0KIC4uLjEtYXZvaWQtc3RhcnQtZmFp
bHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCB8ICAwCiAuLi5kLVYtYW5kLXN0YXJ0LWxvZy1oaWRl
LWJ1aWxkLW9wdGlvbnMucGF0Y2ggfCAgMAogLi4uY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFy
Y2hlcy1zeXNyLnBhdGNoIHwgIDAKIC4uLi9iaW5kL3tiaW5kLTkuMTguMTAgPT4gYmluZC05LjE4
LjExfS9iaW5kOSB8ICAwCiAuLi4ve2JpbmQtOS4xOC4xMCA9PiBiaW5kLTkuMTguMTF9L2NvbmYu
cGF0Y2ggfCAgMAogLi4uL2dlbmVyYXRlLXJuZGMta2V5LnNoICAgICAgICAgICAgICAgICAgICAg
IHwgIDAKIC4uLnQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaCB8ICAw
CiAuLi4vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgfCAgMAogLi4u
L25hbWVkLnNlcnZpY2UgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDAKIC4uLi9iaW5k
L3tiaW5kXzkuMTguMTAuYmIgPT4gYmluZF85LjE4LjExLmJifSB8IDIzICsrKysrKysrKysrKysr
KysrLS0KIDEwIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTAgPT4g
YmluZC05LjE4LjExfS8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0
Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTku
MTguMTAgPT4gYmluZC05LjE4LjExfS8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ct
aGlkZS1idWlsZC1vcHRpb25zLnBhdGNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjEwID0+IGJpbmQtOS4xOC4xMX0vYmluZC1lbnN1cmUt
c2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCAoMTAwJSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC4xMCA9PiBiaW5k
LTkuMTguMTF9L2JpbmQ5ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC97YmluZC05LjE4LjEwID0+IGJpbmQtOS4xOC4xMX0vY29uZi5wYXRjaCAoMTAwJSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC4xMCA9PiBiaW5k
LTkuMTguMTF9L2dlbmVyYXRlLXJuZGMta2V5LnNoICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjEwID0+IGJpbmQtOS4xOC4xMX0vaW5pdC5k
LWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICgxMDAlKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjEwID0+IGJpbmQtOS4xOC4x
MX0vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguMTAgPT4gYmluZC05LjE4LjEx
fS9uYW1lZC5zZXJ2aWNlICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC97YmluZF85LjE4LjEwLmJiID0+IGJpbmRfOS4xOC4xMS5iYn0gKDgyJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjEwLzAwMDEtYXZv
aWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTEvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgt
YmluZC11c2VyLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjEwLzAwMDEtYXZvaWQtc3RhcnQtZmFp
bHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC4xMS8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5k
LXVzZXIucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLTkuMTguMTAvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQt
b3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTgu
MTEvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1s
b2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC05LjE4LjExLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxv
Zy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTAvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29u
LWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLTkuMTguMTEvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMt
c2VhcmNoZXMtc3lzci5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMC9iaW5kLWVuc3VyZS1zZWFy
Y2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjExL2JpbmQtZW5zdXJlLXNlYXJj
aGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTAvYmluZDkgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjExL2JpbmQ5CnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05
LjE4LjEwL2JpbmQ5CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC05LjE4LjExL2JpbmQ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjEwL2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjExL2NvbmYucGF0Y2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTAvY29uZi5wYXRj
aApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMS9j
b25mLnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC05LjE4LjEwL2dlbmVyYXRlLXJuZGMta2V5LnNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQtOS4xOC4xMS9nZW5lcmF0ZS1ybmRjLWtleS5zaApzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC4xMC9nZW5lcmF0ZS1ybmRjLWtleS5zaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC4xMS9nZW5lcmF0ZS1ybmRjLWtleS5zaApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMC9pbml0LmQtYWRkLXN1
cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC05LjE4LjExL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJv
b3Rmcy5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJl
YWQtb25seS1yb290ZnMucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLTkuMTguMTEvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZz
LnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05
LjE4LjEwL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMS9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3At
d29yay5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3At
d29yay5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQt
OS4xOC4xMS9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMC9uYW1lZC5zZXJ2aWNl
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC4xMS9uYW1lZC5zZXJ2
aWNlCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZC05LjE4LjEwL25hbWVkLnNlcnZpY2UKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguMTEvbmFtZWQuc2VydmljZQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xMC5iYiBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMTEuYmIKc2ltaWxhcml0eSBp
bmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRf
OS4xOC4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRf
OS4xOC4xMS5iYgppbmRleCBjYjBlMjUxZDUxLi4yYTgyOTNmMjRlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjEwLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMTEuYmIKQEAgLTEsMTAgKzEsMjkgQEAK
KyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBi
eSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRl
IHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBp
bgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4
YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMg
VGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZUklHSFQKKyMgKysrIENPUFlSSUdIVAorIyBAQCAt
MSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoQykgMTk5Ni0yMDIyICBJbnRlcm5ldCBTeXN0ZW1z
IENvbnNvcnRpdW0sIEluYy4gKCJJU0MiKQorIyArQ29weXJpZ2h0IChDKSAxOTk2LTIwMjMgIElu
dGVybmV0IFN5c3RlbXMgQ29uc29ydGl1bSwgSW5jLiAoIklTQyIpCisjICAKKyMgIFRoaXMgU291
cmNlIENvZGUgRm9ybSBpcyBzdWJqZWN0IHRvIHRoZSB0ZXJtcyBvZiB0aGUgTW96aWxsYSBQdWJs
aWMKKyMgIExpY2Vuc2UsIHYuIDIuMC4gSWYgYSBjb3B5IG9mIHRoZSBNUEwgd2FzIG5vdCBkaXN0
cmlidXRlZCB3aXRoIHRoaXMKKyMgCisjCisKIFNVTU1BUlkgPSAiSVNDIEludGVybmV0IERvbWFp
biBOYW1lIFNlcnZlciIKIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3LmlzYy5vcmcvYmluZC8iCiBE
RVNDUklQVElPTiA9ICJCSU5EIDkgcHJvdmlkZXMgYSBmdWxsLWZlYXR1cmVkIERvbWFpbiBOYW1l
IFNlcnZlciBzeXN0ZW0iCiBTRUNUSU9OID0gImNvbnNvbGUvbmV0d29yayIKIAogTElDRU5TRSA9
ICJNUEwtMi4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWVJJR0hUO21kNT05YTRh
ODk3ZjIwMmMwNzEwZTA3ZjJmMjgzNmJjMmI2MiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlSSUdIVDttZDU9ZDhjZjdiZDljNGZkNTQ3MWE1ODhlN2U2NmU2NzI0MDgiCiAKIERFUEVO
RFMgPSAib3BlbnNzbCBsaWJjYXAgemxpYiBsaWJ1diIKIApAQCAtMjAsNyArMzksNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50
YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgt
YmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZjQxNWE5MmZlYjYyNTY4YjUwODU0YTA2M2NiMjMxZTI1NzM1MWY4NjcyMTg2ZDBhYjAzMWE0OWIz
ZGUyY2FjNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZmYzMzUyODEyMjMwY2JjYmRhNDJkZjg3
Y2FkOTYxZjk0MTYzZDNkYTQ1N2M1ZTRiZWY4MDU3ZmQ1ZGYyMTU4IgogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVT
ViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi4zNy4zCgo=

--===============8733748916567425282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libbind9-9.18.10.so /usr/lib/libdns-9.18.10.so /usr/lib/libirs-9.18.10.so /usr/lib/libisc-9.18.10.so /usr/lib/libisccfg-9.18.10.so /usr/lib/libisccc-9.18.10.so /usr/lib/libns-9.18.10.so", added "/usr/lib/libdns-9.18.11.so /usr/lib/libisccc-9.18.11.so /usr/lib/libirs-9.18.11.so /usr/lib/libbind9-9.18.11.so /usr/lib/libisc-9.18.11.so /usr/lib/libisccfg-9.18.11.so /usr/lib/libns-9.18.11.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.10.so to libbind9-9.18.11.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.10.so to libdns-9.18.11.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.10.so to libirs-9.18.11.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.10.so to libisccc-9.18.11.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.10.so to libisccfg-9.18.11.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.10.so to libisc-9.18.11.so
  /usr/lib/libns.so changed symlink target from libns-9.18.10.so to libns-9.18.11.so
  /usr/lib/libbind9-9.18.10.so moved to /usr/lib/libbind9-9.18.11.so
  /usr/lib/libdns-9.18.10.so moved to /usr/lib/libdns-9.18.11.so
  /usr/lib/libirs-9.18.10.so moved to /usr/lib/libirs-9.18.11.so
  /usr/lib/libisc-9.18.10.so moved to /usr/lib/libisc-9.18.11.so
  /usr/lib/libisccc-9.18.10.so moved to /usr/lib/libisccc-9.18.11.so
  /usr/lib/libisccfg-9.18.10.so moved to /usr/lib/libisccfg-9.18.11.so
  /usr/lib/libns-9.18.10.so moved to /usr/lib/libns-9.18.11.so

--===============8733748916567425282==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBAAC6FA86
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.871.1667349631673906006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TnaxxPXn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c84e05-3eb823ba-7332-4b62-a3cf-acd3268d96ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349630;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=18XDXUX1oNAlGvN/JFATPRj+dlPw/GF9SOui7o+7rPI=;
	b=TnaxxPXncr04Yadq/h9knD99H1nSO7GzOvMW3PgBXxQo4rEFpAHKYwEb4efMMk8c
	yscHCFZkazZJA8LGrXXJLlM5V3oJSyC40OWExM19EQZC9bXlIdlsD8koXhlZI5gWDQx
	x7DvWEFkgKKDUaiK1mprlSubEIzoIkmvD+c8jZzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349630;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=18XDXUX1oNAlGvN/JFATPRj+dlPw/GF9SOui7o+7rPI=;
	b=GhlGte/xdooQ+53ljKr8xdUkh6wM1SNYt0m0VQ2vaYsXGE+AS1jeTX5WWtYKHb/q
	7oI2tcZXGnnM2yrjovKQ14eVVOEDM/kNvSHWp63+LE1SEltldUaXtgs3fPy4eHGr4T/
	Y9mEUatWSgHP0KEgr6ig3BjkEAs5z/9vSnscloE4=
Content-Type: multipart/mixed; boundary="===============8898122502767597309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.8 SUCCEEDED
Message-ID: <0101018435c84e05-3eb823ba-7332-4b62-a3cf-acd3268d96ab-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172396

--===============8898122502767597309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.7-9.18.8.patch
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
--===============8898122502767597309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10764404 to 10762932 (-0%)
packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libirs-9.18.7.so /usr/lib/.debug/libbind9-9.18.7.so /usr/lib/.debug/libns-9.18.7.so /usr/lib/.debug/libisccc-9.18.7.so /usr/lib/.debug/libisccfg-9.18.7.so /usr/lib/.debug/libdns-9.18.7.so /usr/lib/.debug/libisc-9.18.7.so", added "/usr/lib/.debug/libirs-9.18.8.so /usr/lib/.debug/libdns-9.18.8.so /usr/lib/.debug/libisccfg-9.18.8.so /usr/lib/.debug/libns-9.18.8.so /usr/lib/.debug/libbind9-9.18.8.so /usr/lib/.debug/libisc-9.18.8.so /usr/lib/.debug/libisccc-9.18.8.so"
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1459225 to 1452447 (-0%)
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 307939 to 308441 (+0%)
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind-libs: PKGSIZE changed from 6376816 to 6327664 (-1%)
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.18.7.so /usr/lib/libbind9-9.18.7.so /usr/lib/libns-9.18.7.so /usr/lib/libisc-9.18.7.so /usr/lib/libirs-9.18.7.so /usr/lib/libisccc-9.18.7.so /usr/lib/libdns-9.18.7.so", added "/usr/lib/libisc-9.18.8.so /usr/lib/libdns-9.18.8.so /usr/lib/libisccc-9.18.8.so /usr/lib/libisccfg-9.18.8.so /usr/lib/libbind9-9.18.8.so /usr/lib/libirs-9.18.8.so /usr/lib/libns-9.18.8.so"
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.7.so", added "/usr/lib/*-9.18.8.so"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9569456 to 9565235 (-0%)
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind-utils: PKGSIZE changed from 487528 to 491624 (+1%)
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind/bind: PKGSIZE changed from 1208260 to 1216452 (+1%)
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.7" to "9.18.8"
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.7/bind-9.18.7.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.8/bind-9.18.8.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.7 [default] to 9.18.8 [default]
packages/core2-32-poky-linux/bind: PV changed from "9.18.7" to "9.18.8"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.7.so to libbind9-9.18.8.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.7.so to libdns-9.18.8.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.7.so to libirs-9.18.8.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.7.so to libisccc-9.18.8.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.7.so to libisccfg-9.18.8.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.7.so to libisc-9.18.8.so
  /usr/lib/libns.so changed symlink target from libns-9.18.7.so to libns-9.18.8.so
  /usr/lib/libbind9-9.18.7.so moved to /usr/lib/libbind9-9.18.8.so
  /usr/lib/libdns-9.18.7.so moved to /usr/lib/libdns-9.18.8.so
  /usr/lib/libirs-9.18.7.so moved to /usr/lib/libirs-9.18.8.so
  /usr/lib/libisc-9.18.7.so moved to /usr/lib/libisc-9.18.8.so
  /usr/lib/libisccc-9.18.7.so moved to /usr/lib/libisccc-9.18.8.so
  /usr/lib/libisccfg-9.18.7.so moved to /usr/lib/libisccfg-9.18.8.so
  /usr/lib/libns-9.18.7.so moved to /usr/lib/libns-9.18.8.so

--===============8898122502767597309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.18.7.so /usr/lib/libdns-9.18.7.so /usr/lib/libisccfg-9.18.7.so /usr/lib/libisc-9.18.7.so /usr/lib/libbind9-9.18.7.so /usr/lib/libisccc-9.18.7.so /usr/lib/libirs-9.18.7.so", added "/usr/lib/libdns-9.18.8.so /usr/lib/libisccfg-9.18.8.so /usr/lib/libirs-9.18.8.so /usr/lib/libns-9.18.8.so /usr/lib/libisccc-9.18.8.so /usr/lib/libisc-9.18.8.so /usr/lib/libbind9-9.18.8.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.7.so to libbind9-9.18.8.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.7.so to libdns-9.18.8.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.7.so to libirs-9.18.8.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.7.so to libisccc-9.18.8.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.7.so to libisccfg-9.18.8.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.7.so to libisc-9.18.8.so
  /usr/lib/libns.so changed symlink target from libns-9.18.7.so to libns-9.18.8.so
  /usr/lib/libbind9-9.18.7.so moved to /usr/lib/libbind9-9.18.8.so
  /usr/lib/libdns-9.18.7.so moved to /usr/lib/libdns-9.18.8.so
  /usr/lib/libirs-9.18.7.so moved to /usr/lib/libirs-9.18.8.so
  /usr/lib/libisc-9.18.7.so moved to /usr/lib/libisc-9.18.8.so
  /usr/lib/libisccc-9.18.7.so moved to /usr/lib/libisccc-9.18.8.so
  /usr/lib/libisccfg-9.18.7.so moved to /usr/lib/libisccfg-9.18.8.so
  /usr/lib/libns-9.18.7.so moved to /usr/lib/libns-9.18.8.so

--===============8898122502767597309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.7-9.18.8.patch"

RnJvbSA0MjVhZGI1Yzc2ZmJjNGMyMDM3ZDg0YzI1YjNiYTRkYjg2ZjNiZmQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNjoxMzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC43IC0+IDkuMTguOAoKLS0tCiAuLi4vMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICAgICAgICAgICAgICAgfCAwCiAuLi4vMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCAgfCAw
CiAuLi4vYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjcgPT4gYmluZC05LjE4Ljh9L2JpbmQ5
ICAgICAgICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjcgPT4gYmluZC05
LjE4Ljh9L2NvbmYucGF0Y2ggICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4
LjcgPT4gYmluZC05LjE4Ljh9L2dlbmVyYXRlLXJuZGMta2V5LnNoICAgICAgfCAwCiAuLi4vaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgICAgICAgICAgICAg
fCAwCiAuLi4vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgICAgICAg
ICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjcgPT4gYmluZC05LjE4Ljh9L25h
bWVkLnNlcnZpY2UgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZF85LjE4LjcuYmIgPT4g
YmluZF85LjE4LjguYmJ9ICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAxMCBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjcgPT4gYmluZC05LjE4Ljh9LzAwMDEtYXZvaWQt
c3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC43ID0+IGJpbmQtOS4xOC44fS8wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoICgx
MDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4Ljcg
PT4gYmluZC05LjE4Ljh9L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNl
YXJjaGVzLXN5c3IucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL3tiaW5kLTkuMTguNyA9PiBiaW5kLTkuMTguOH0vYmluZDkgKDEwMCUpCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguNyA9PiBiaW5kLTkuMTgu
OH0vY29uZi5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQve2JpbmQtOS4xOC43ID0+IGJpbmQtOS4xOC44fS9nZW5lcmF0ZS1ybmRjLWtleS5zaCAoMTAw
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC43ID0+
IGJpbmQtOS4xOC44fS9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0
Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTku
MTguNyA9PiBiaW5kLTkuMTguOH0vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gg
KDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTgu
NyA9PiBiaW5kLTkuMTguOH0vbmFtZWQuc2VydmljZSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRfOS4xOC43LmJiID0+IGJpbmRfOS4xOC44LmJifSAo
OTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguNy8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjgvMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjcvMDAwMS1hdm9p
ZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjgvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJl
LXdpdGgtYmluZC11c2VyLnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC05LjE4LjcvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhp
ZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLTkuMTguOC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1v
cHRpb25zLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjcvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQt
c3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC44LzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0
YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNy9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9y
LWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC44L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFk
ZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNy9iaW5kLWVuc3VyZS1z
ZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjgvYmluZC1lbnN1cmUtc2Vh
cmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC43L2JpbmQ5IGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC44L2JpbmQ5CnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05
LjE4LjcvYmluZDkKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
LTkuMTguOC9iaW5kOQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQtOS4xOC43L2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC05LjE4LjgvY29uZi5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC43L2NvbmYucGF0Y2gKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguOC9jb25mLnBh
dGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4
LjcvZ2VuZXJhdGUtcm5kYy1rZXkuc2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC05LjE4LjgvZ2VuZXJhdGUtcm5kYy1rZXkuc2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNy9nZW5l
cmF0ZS1ybmRjLWtleS5zaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQtOS4xOC44L2dlbmVyYXRlLXJuZGMta2V5LnNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjcvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1y
ZWFkLW9ubHktcm9vdGZzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC44L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQtOS4xOC43L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rm
cy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC44L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC43L21ha2UtZXRj
LWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQtOS4xOC44L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjcvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguOC9tYWtlLWV0Yy1p
bml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQtOS4xOC43L25hbWVkLnNlcnZpY2UgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjgvbmFtZWQuc2VydmljZQpzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC43L25hbWVkLnNlcnZpY2UKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLTkuMTguOC9uYW1lZC5zZXJ2aWNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjcuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZF85LjE4LjguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC43LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjguYmIKaW5kZXggNGFiMTE0ODZi
Zi4uNDkyNWMwOTJjNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmRfOS4xOC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
XzkuMTguOC5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5v
cmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWUyYWNmMTY5OGY0OWQ3MGFkMTJmZmJh
ZDM5ZWM2NzE2YTdkYTUyNGU5ZWJkOTg0MjljN2M3MGJhMTI2Mjk4MSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwZTNjM2FiOTM3OGRiODRiYTBmMzcwNzNkNjdiYTEyNWFlNGYyZmY4ZGFmMzY2Yzlk
YjI4N2UzZjFiMmMzNWYwIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNj
Lm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkg
MgotLSAKMi4zMS4xCgo=

--===============8898122502767597309==--


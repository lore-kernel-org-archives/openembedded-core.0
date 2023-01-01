Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B82C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.20169.1672605965553683693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=na8EQBF9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101856f159940-c2a02b80-1139-46b4-8306-3806c84d6fd8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605964;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TGn4PlfaLXHl+LYFjwUvwr8/eHaiQTkQEZqXPQqBW20=;
	b=na8EQBF9ARJ5CLMiopPVP6IhZ0aZkv4z2X8UQrKGoQ3VMVedCe9RMMjZZvaik1a8
	8Lwm9M5YXpL57fHOeDEVRbPjV23kDRrPr88b5rym7+g+WXYQh+i0MtrbJjBckh3IIiz
	FdaOZWRLroAfkKeavDjhIK4M/ZezznZ57yUcdsLY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605964;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TGn4PlfaLXHl+LYFjwUvwr8/eHaiQTkQEZqXPQqBW20=;
	b=a09+1lYzAXQDgzQRRPwvK92ENWnO7AFs8DJ8GL7vt2kvPDiAuasle6YAlm7DNdC2
	ppu7Jb1tusEf/BuoJTZmspyk6AEERXnT7ZbQ8sB//d3LJQymfaxzDh3VhRCLOYWx2Ys
	xUU0xR8FCsYxPh58V5EQBQHrkiwA2QZYyfrsTGRE=
Content-Type: multipart/mixed; boundary="===============8218599066188557954=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcap: upgrading to 1.10.2 SUCCEEDED
Message-ID: <010101856f159940-c2a02b80-1139-46b4-8306-3806c84d6fd8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175238

--===============8218599066188557954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcap* to *1.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcap-upgrade-1.10.1-1.10.2.patch
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
--===============8218599066188557954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: added "/usr/include/pcap-util.h"
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.1", added "/usr/lib/libpcap.so.1.10.2"
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.1 to libpcap.so.1.10.2
  /usr/lib/libpcap.so.1.10.1 moved to /usr/lib/libpcap.so.1.10.2
  /usr/include/pcap-util.h was added

--===============8218599066188557954==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcap-upgrade-1.10.1-1.10.2.patch"

RnJvbSA0MTQ1ZmIzMDFiMGY1NDE0ZDI1ZDE3ZWQ4OWQwYzE5YTY3ZGM5MGM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwNjozNjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBjYXA6IHVwZ3JhZGUgMS4xMC4xIC0+IDEuMTAuMgoKLS0tCiAuLi4vbGlicGNhcC97bGlicGNh
cF8xLjEwLjEuYmIgPT4gbGlicGNhcF8xLjEwLjIuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAve2xpYnBjYXBfMS4xMC4xLmJiID0+IGxpYnBjYXBf
MS4xMC4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bGlicGNhcC9saWJwY2FwXzEuMTAuMS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGli
cGNhcC9saWJwY2FwXzEuMTAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwXzEuMTAuMi5iYgpp
bmRleCBkYmUyZmQ4MTU3Li40OGM5YmIwOWQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXBfMS4xMC4yLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTVlYjI4OTIxN2MxNjBlMjkyMGQy
ZTM1YmRkYzM2NDUzIFwKIERFUEVORFMgPSAiZmxleC1uYXRpdmUgYmlzb24tbmF0aXZlIgogCiBT
UkNfVVJJID0gImh0dHBzOi8vd3d3LnRjcGR1bXAub3JnL3JlbGVhc2UvJHtCUH0udGFyLmd6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImVkMjg1ZjRhY2NhZjA1MzQ0ZjkwOTc1NzU3YjNkYmZlNzcy
YmE0MWQxYzQwMWMyNjQ4YjdmYTQ1YjcxMWJkZDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGI2
ZDc5ZDRhZDAzYjhiMTVmYjE2YzQyNDQ3ZDA5M2FkMzUyMGMwZWMwYWUzZDMzMTEwNGRjZmIxY2U3
NzU2MCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgYmluY29uZmlnLWRpc2FibGVkIHBrZ2NvbmZpZwog
Ci0tIAoyLjM3LjMKCg==

--===============8218599066188557954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpcap: SRC_URI changed from "https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz" to "https://www.tcpdump.org/release/libpcap-1.10.2.tar.gz"
packages/core2-32-poky-linux/libpcap: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: FILELIST: removed "/usr/lib/.debug/libpcap.so.1.10.1", added "/usr/lib/.debug/libpcap.so.1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PKGSIZE changed from 784196 to 804472 (+3%)
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: added "/usr/include/pcap-util.h"
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGSIZE changed from 160600 to 168068 (+5%)
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dev: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap-doc: PKGSIZE changed from 240494 to 245528 (+2%)
packages/core2-32-poky-linux/libpcap/libpcap-doc: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap/libpcap-doc: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap-locale: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap/libpcap-locale: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap-src: FILELIST: directory renamed /usr/src/debug/libpcap/1.10.1-r0/missing -> /usr/src/debug/libpcap/1.10.2-r0/missing, directory renamed /usr/src/debug/libpcap/1.10.1-r0/pcap -> /usr/src/debug/libpcap/1.10.2-r0/pcap, removed "/usr/src/debug/libpcap/1.10.1-r0/pcap-bt-linux.h /usr/src/debug/libpcap/1.10.1-r0/pcap-bt-monitor-linux.c /usr/src/debug/libpcap/1.10.1-r0/savefile.c /usr/src/debug/libpcap/1.10.1-r0/optimize.c /usr/src/debug/libpcap/1.10.1-r0/pcap-bt-linux.c /usr/src/debug/libpcap/1.10.1-r0/pcap-bt-monitor-linux.h /usr/src/debug/libpcap/1.10.1-r0/pcap-linux.c /usr/src/debug/libpcap/1.10.1-r0/fad-getad.c /usr/src/debug/libpcap/1.10.1-r0/pcap-usb-linux.h /usr/src/debug/libpcap/1.10.1-r0/pcap-netfilter-linux.h /usr/src/debug/libpcap/1.10.1-r0/pcap-usb-linux.c /usr/src/debug/libpcap/1.10.1-r0/pcap.c /usr/src/debug/libpcap/1.10.1-r0/pcap-netfilter-linux.c /usr/src/debug/libpcap/1.10.1-r0/pcap-int.h /usr/src/debug/libpcap/1.10.1-r0/sf-pcap
 ng.c /usr/src/debug/libpcap/1.10.1-r0/portability.h /usr/src/debug/libpcap/1.10.1-r0/etherent.c /usr/src/debug/libpcap/1.10.1-r0/sf-pcapng.h /usr/src/debug/libpcap/1.10.1-r0/bpf_dump.c /usr/src/debug/libpcap/1.10.1-r0/fmtutils.h /usr/src/debug/libpcap/1.10.1-r0/fmtutils.c /usr/src/debug/libpcap/1.10.1-r0/nametoaddr.h /usr/src/debug/libpcap/1.10.1-r0/pcap-common.c /usr/src/debug/libpcap/1.10.1-r0/gencode.c /usr/src/debug/libpcap/1.10.1-r0/grammar.c /usr/src/debug/libpcap/1.10.1-r0/scanner.c /usr/src/debug/libpcap/1.10.1-r0/sf-pcap.c /usr/src/debug/libpcap/1.10.1-r0/nametoaddr.c /usr/src/debug/libpcap/1.10.1-r0/scanner.l /usr/src/debug/libpcap/1.10.1-r0/bpf_filter.c /usr/src/debug/libpcap/1.10.1-r0/extract.h /usr/src/debug/libpcap/1.10.1-r0/gencode.h /usr/src/debug/libpcap/1.10.1-r0/grammar.h /usr/src/debug/libpcap/1.10.1-r0/pcap-common.h /usr/src/debug/libpcap/1.10.1-r0/scanner.h /usr/src/debug/libpcap/1.10.1-r0/sf-pcap.h /usr/src/debug/libpcap/1.10.1-r0/bpf_image.c /usr/src/debug/li
 bpcap/1.10.1-r0/grammar.y", added "/usr/src/debug/libpcap/1.10.2-r0/pcap-bt-linux.h /usr/src/debug/libpcap/1.10.2-r0/pcap-bt-monitor-linux.c /usr/src/debug/libpcap/1.10.2-r0/pcap-util.h /usr/src/debug/libpcap/1.10.2-r0/savefile.c /usr/src/debug/libpcap/1.10.2-r0/optimize.c /usr/src/debug/libpcap/1.10.2-r0/pcap-bt-linux.c /usr/src/debug/libpcap/1.10.2-r0/pcap-bt-monitor-linux.h /usr/src/debug/libpcap/1.10.2-r0/pcap-util.c /usr/src/debug/libpcap/1.10.2-r0/pcap-linux.c /usr/src/debug/libpcap/1.10.2-r0/fad-getad.c /usr/src/debug/libpcap/1.10.2-r0/pcap-usb-linux.h /usr/src/debug/libpcap/1.10.2-r0/pcap-usb-linux-common.c /usr/src/debug/libpcap/1.10.2-r0/pcap-netfilter-linux.h /usr/src/debug/libpcap/1.10.2-r0/pcap-usb-linux.c /usr/src/debug/libpcap/1.10.2-r0/pcap.c /usr/src/debug/libpcap/1.10.2-r0/pcap-netfilter-linux.c /usr/src/debug/libpcap/1.10.2-r0/pcap-usb-linux-common.h /usr/src/debug/libpcap/1.10.2-r0/pcap-int.h /usr/src/debug/libpcap/1.10.2-r0/sf-pcapng.c /usr/src/debug/libpcap/1.1
 0.2-r0/etherent.c /usr/src/debug/libpcap/1.10.2-r0/portability.h /usr/src/debug/libpcap/1.10.2-r0/sf-pcapng.h /usr/src/debug/libpcap/1.10.2-r0/bpf_dump.c /usr/src/debug/libpcap/1.10.2-r0/fmtutils.h /usr/src/debug/libpcap/1.10.2-r0/pflog.h /usr/src/debug/libpcap/1.10.2-r0/fmtutils.c /usr/src/debug/libpcap/1.10.2-r0/nametoaddr.h /usr/src/debug/libpcap/1.10.2-r0/pcap-common.c /usr/src/debug/libpcap/1.10.2-r0/gencode.c /usr/src/debug/libpcap/1.10.2-r0/grammar.c /usr/src/debug/libpcap/1.10.2-r0/scanner.c /usr/src/debug/libpcap/1.10.2-r0/sf-pcap.c /usr/src/debug/libpcap/1.10.2-r0/nametoaddr.c /usr/src/debug/libpcap/1.10.2-r0/scanner.l /usr/src/debug/libpcap/1.10.2-r0/bpf_filter.c /usr/src/debug/libpcap/1.10.2-r0/extract.h /usr/src/debug/libpcap/1.10.2-r0/gencode.h /usr/src/debug/libpcap/1.10.2-r0/grammar.h /usr/src/debug/libpcap/1.10.2-r0/pcap-common.h /usr/src/debug/libpcap/1.10.2-r0/scanner.h /usr/src/debug/libpcap/1.10.2-r0/sf-pcap.h /usr/src/debug/libpcap/1.10.2-r0/bpf_image.c /usr/sr
 c/debug/libpcap/1.10.2-r0/grammar.y"
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGSIZE changed from 1461153 to 1492416 (+2%)
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap/libpcap-src: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGSIZE changed from 1156504 to 1186388 (+3%)
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PV changed from "1.10.1" to "1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.1", added "/usr/lib/libpcap.so.1.10.2"
packages/core2-32-poky-linux/libpcap/libpcap: PKGSIZE changed from 316965 to 321061 (+1%)
packages/core2-32-poky-linux/libpcap/libpcap: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-32-poky-linux/libpcap/libpcap: PV changed from "1.10.1" to "1.10.2"
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.1 to libpcap.so.1.10.2
  /usr/lib/libpcap.so.1.10.1 moved to /usr/lib/libpcap.so.1.10.2
  /usr/include/pcap-util.h was added

--===============8218599066188557954==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0DBC54EE5
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.36627.1709330716569207894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PjO/Rs1/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A51TD8Dg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dfc0cdd25-464bfca3-f974-4060-abe3-761dcf52b1c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LshV/V71xNIdnrt2bEq/nNDzq80IG+GzztBc4+J5HP4=;
	b=PjO/Rs1/V92Z6CzwdKz+yVmSybrgTBUcL3cbPKRpzX3cqBYCvLboG73MMRCtx52B
	Rq/9nMaayClKo/j6HZbJ2JOQv4juSlwrN+/6GfnHxq1woSBNylupdYveSx8S4XETCjn
	n8fk5INPRbJrKQBf5O5KjqTQrhFG55A+lqxmGcoo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LshV/V71xNIdnrt2bEq/nNDzq80IG+GzztBc4+J5HP4=;
	b=A51TD8DgXcq/n72omhqWDXkOTTo1YTYgzZcGw0XfDK/Gc3F/fLAmhToh5Xkc8UGq
	XWRoMCuf8h1JIwwB6sXrdM4CT8xp2qs3bhXmmCXN/hJ6A3Dzdyr2HuPR7FmX7vin71O
	8bXHIVYlfEcu1EUdX7tkKzUM0ZeK+AyKSF6xRl7U=
Content-Type: multipart/mixed; boundary="===============8488667503182730917=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libbsd: upgrading to 0.12.1 SUCCEEDED
Message-ID: <0101018dfc0cdd25-464bfca3-f974-4060-abe3-761dcf52b1c0-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196544

--===============8488667503182730917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpsaWJic2QqIHRvICowLjEyLjEqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWxpYmJzZC11cGdyYWRlLTAuMTEuOC0wLjEyLjEu
cGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3Vt
bWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdl
IHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0
eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0
IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlh
dGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBl
IHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBF
X05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9t
YXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmll
dyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3Vw
ZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9i
dWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQl
MjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0t
CkZyb20gMDg5MjAyZjU4NDcxYmM0NWEzOTFkMzY1OWE2ZmYzOWMwMjc3OTJmNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3Jn
PgpEYXRlOiBGcmksIDEgTWFyIDIwMjQgMjE6NDY6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJic2Q6IHVwZ3JhZGUgMC4xMS44IC0+IDAuMTIuMQoKLS0tCiAuLi4ve2xpYmJzZF8wLjExLjgu
YmIgPT4gbGliYnNkXzAuMTIuMS5iYn0gICAgfCAyNiArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJic2Qve2xpYmJzZF8wLjExLjguYmIgPT4gbGliYnNkXzAuMTIu
MS5iYn0gKDY4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGli
YnNkXzAuMTEuOC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggNjglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmJzZC9saWJic2RfMC4xMS44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJic2QvbGliYnNkXzAuMTIuMS5iYgppbmRleCAxNzA0OWM4YzI4Li40ZTA5N2EyOGM4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTEuOC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIuMS5iYgpAQCAtMSwzICsx
LDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBA
QCAtMyw3ICszLDcgQEAKKyMgIEZpbGVzOgorIyAgICoKKyMgIENvcHlyaWdodDoKKyMgLSBDb3B5
cmlnaHQgwqkgMjAwNC0yMDA2LCAyMDA4LTIwMjIgR3VpbGxlbSBKb3ZlciA8Z3VpbGxlbUBoYWRy
b25zLm9yZz4KKyMgKyBDb3B5cmlnaHQgwqkgMjAwNC0yMDI0IEd1aWxsZW0gSm92ZXIgPGd1aWxs
ZW1AaGFkcm9ucy5vcmc+CisjICBMaWNlbnNlOiBCU0QtMy1jbGF1c2UKKyMgIAorIyAgRmlsZXM6
CisjIAorIworCiBTVU1NQVJZID0gIkxpYnJhcnkgb2YgdXRpbGl0eSBmdW5jdGlvbnMgZnJvbSBC
U0Qgc3lzdGVtcyIKIERFU0NSSVBUSU9OID0gIlRoaXMgbGlicmFyeSBwcm92aWRlcyB1c2VmdWwg
ZnVuY3Rpb25zIGNvbW1vbmx5IGZvdW5kIG9uIEJTRCBzeXN0ZW1zLCBcCiAgICAgICAgICAgICAg
ICBhbmQgbGFja2luZyBvbiBvdGhlcnMgbGlrZSBHTlUgc3lzdGVtcywgdGh1cyBtYWtpbmcgaXQg
ZWFzaWVyIHRvIHBvcnQgXApAQCAtMzMsMTIgKzU1LDEyIEBAIExJQ0VOU0U6JHtQTn0tbG9jYWxl
ID0gIkJTRC0zLUNsYXVzZSAmIElTQyAmIFBEIgogTElDRU5TRToke1BOfS1zcmMgPSAiQlNELTMt
Q2xhdXNlICYgSVNDICYgUEQiCiBMSUNFTlNFOiR7UE59LXN0YXRpY2RldiA9ICJCU0QtMy1DbGF1
c2UgJiBJU0MgJiBQRCIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
YmVmZTA5ZmFkYTU3YmRjZjdmN2MxMmY1MTA4MWIwOGYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT05YjA4N2EwOTgxYTFmY2FkNDJlZmJiYTZkNDkyNWEwZiIKIFNFQ1RJ
T04gPSAibGlicyIKIAogU1JDX1VSSSA9ICJodHRwczovL2xpYmJzZC5mcmVlZGVza3RvcC5vcmcv
cmVsZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU1
ZmRmYTI2OTZmYjRkNTVhNTkyZmE5YWQxNGE5ZGY4OTdjN2IwMDA4ZGRiM2IzMGM0MTk5MTQ4NDFm
ODVmMzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc3NDdmOGVjMWJhYTZmZjVjMDk2YTlkZDU4
N2MwNjEyMzNkZWM5MGRhMGYxYWVkZDY2ZDgzMGY2ZGI2OTk2YSIKIAogaW5oZXJpdCBhdXRvdG9v
bHMgcGtnY29uZmlnCiAKLS0gCjIuNDIuMAoK

--===============8488667503182730917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libbsd: SRC_URI changed from "https://libbsd.freedesktop.org/releases/libbsd-0.11.8.tar.xz" to "https://libbsd.freedesktop.org/releases/libbsd-0.12.1.tar.xz"
packages/core2-64-poky-linux/libbsd: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd: PV changed from "0.11.8" to "0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-dbg: FILELIST: removed "/usr/lib/.debug/libbsd.so.0.11.8", added "/usr/lib/.debug/libbsd.so.0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-dbg: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd/libbsd-dbg: PV changed from "0.11.8" to "0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-dbg: PKGSIZE changed from 236696 to 237720 (+0%)
packages/core2-64-poky-linux/libbsd/libbsd-dev: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd/libbsd-dev: PV changed from "0.11.8" to "0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-dev: PKGSIZE changed from 136282 to 137403 (+1%)
packages/core2-64-poky-linux/libbsd/libbsd-doc: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd/libbsd-doc: PV changed from "0.11.8" to "0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-doc: PKGSIZE changed from 250639 to 251437 (+0%)
packages/core2-64-poky-linux/libbsd/libbsd-locale: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd/libbsd-locale: PV changed from "0.11.8" to "0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-src: FILELIST: removed "/usr/src/debug/libbsd/0.11.8/include/bsd/libutil.h /usr/src/debug/libbsd/0.11.8/include/bsd/pwd.h /usr/src/debug/libbsd/0.11.8/src/readpassphrase.c /usr/src/debug/libbsd/0.11.8/include/bsd/nlist.h /usr/src/debug/libbsd/0.11.8/src/humanize_number.c /usr/src/debug/libbsd/0.11.8/src/strtonum.c /usr/src/debug/libbsd/0.11.8/include/bsd/stdlib.h /usr/src/debug/libbsd/0.11.8/include/bsd/string.h /usr/src/debug/libbsd/0.11.8/include/bsd/unistd.h /usr/src/debug/libbsd/0.11.8/src/md5.c /usr/src/debug/libbsd/0.11.8/src/radixsort.c /usr/src/debug/libbsd/0.11.8/include/bsd/wchar.h /usr/src/debug/libbsd/0.11.8/include/bsd/err.h /usr/src/debug/libbsd/0.11.8/include/bsd/readpassphrase.h /usr/src/debug/libbsd/0.11.8/src/getbsize.c /usr/src/debug/libbsd/0.11.8/src/progname.c /usr/src/debug/libbsd/0.11.8/src/nlist.c /usr/src/debug/libbsd/0.11.8/src/closefrom.c /usr/src/debug/libbsd/0.11.8/src/expand_number.c /usr/src/debug/libbsd/0.11.8
 /src/inet_net_pton.c /usr/src/debug/libbsd/0.11.8/src/setproctitle_ctor.c /usr/src/debug/libbsd/0.11.8/src/reallocarray.c /usr/src/debug/libbsd/0.11.8/src/heapsort.c /usr/src/debug/libbsd/0.11.8/include/bsd/inttypes.h /usr/src/debug/libbsd/0.11.8/include/bsd/timeconv.h /usr/src/debug/libbsd/0.11.8/src/arc4random_uniform.c /usr/src/debug/libbsd/0.11.8/src/reallocf.c /usr/src/debug/libbsd/0.11.8/src/fmtcheck.c /usr/src/debug/libbsd/0.11.8/src/recallocarray.c /usr/src/debug/libbsd/0.11.8/src/setproctitle.c /usr/src/debug/libbsd/0.11.8/src/merge.c /usr/src/debug/libbsd/0.11.8/src/arc4random_linux.h /usr/src/debug/libbsd/0.11.8/src/fgetwln.c /usr/src/debug/libbsd/0.11.8/src/funopen.c /usr/src/debug/libbsd/0.11.8/src/chacha_private.h /usr/src/debug/libbsd/0.11.8/src/explicit_bzero.c /usr/src/debug/libbsd/0.11.8/src/pidfile.c /usr/src/debug/libbsd/0.11.8/src/pwcache.c /usr/src/debug/libbsd/0.11.8/src/setmode.c /usr/src/debug/libbsd/0.11.8/src/err.c /usr/src/debug/libbsd/0.11.8/include/bsd/
 grp.h /usr/src/debug/libbsd/0.11.8/src/stringlist.c /usr/src/debug/libbsd/0.11.8/src/strlcat.c /usr/src/debug/libbsd/0.11.8/src/strlcpy.c /usr/src/debug/libbsd/0.11.8/src/bsd_getopt.c /usr/src/debug/libbsd/0.11.8/src/strmode.c /usr/src/debug/libbsd/0.11.8/src/strnstr.c /usr/src/debug/libbsd/0.11.8/include/bsd/vis.h /usr/src/debug/libbsd/0.11.8/include/bsd/stdio.h /usr/src/debug/libbsd/0.11.8/src/fgetln.c /usr/src/debug/libbsd/0.11.8/src/flopen.c /usr/src/debug/libbsd/0.11.8/src/fpurge.c /usr/src/debug/libbsd/0.11.8/src/dehumanize_number.c /usr/src/debug/libbsd/0.11.8/src/strtoi.c /usr/src/debug/libbsd/0.11.8/src/strtou.c /usr/src/debug/libbsd/0.11.8/src/arc4random.c /usr/src/debug/libbsd/0.11.8/src/unvis.c /usr/src/debug/libbsd/0.11.8/include/bsd/stringlist.h /usr/src/debug/libbsd/0.11.8/src/freezero.c /usr/src/debug/libbsd/0.11.8/src/getpeereid.c /usr/src/debug/libbsd/0.11.8/src/fparseln.c /usr/src/debug/libbsd/0.11.8/src/wcslcat.c /usr/src/debug/libbsd/0.11.8/src/wcslcpy.c /usr/sr
 c/debug/libbsd/0.11.8/src/vis.c /usr/src/debug/libbsd/0.11.8/src/timeconv.c", added "/usr/src/debug/libbsd/0.12.1/include/bsd/libutil.h /usr/src/debug/libbsd/0.12.1/include/bsd/pwd.h /usr/src/debug/libbsd/0.12.1/src/readpassphrase.c /usr/src/debug/libbsd/0.12.1/include/bsd/nlist.h /usr/src/debug/libbsd/0.12.1/src/humanize_number.c /usr/src/debug/libbsd/0.12.1/src/strtonum.c /usr/src/debug/libbsd/0.12.1/include/bsd/stdlib.h /usr/src/debug/libbsd/0.12.1/include/bsd/string.h /usr/src/debug/libbsd/0.12.1/include/bsd/unistd.h /usr/src/debug/libbsd/0.12.1/src/md5.c /usr/src/debug/libbsd/0.12.1/src/radixsort.c /usr/src/debug/libbsd/0.12.1/include/bsd/wchar.h /usr/src/debug/libbsd/0.12.1/include/bsd/err.h /usr/src/debug/libbsd/0.12.1/include/bsd/readpassphrase.h /usr/src/debug/libbsd/0.12.1/src/progname.c /usr/src/debug/libbsd/0.12.1/src/getbsize.c /usr/src/debug/libbsd/0.12.1/src/nlist.c /usr/src/debug/libbsd/0.12.1/src/closefrom.c /usr/src/debug/libbsd/0.12.1/src/expand_number.c /usr/src/
 debug/libbsd/0.12.1/src/inet_net_pton.c /usr/src/debug/libbsd/0.12.1/src/setproctitle_ctor.c /usr/src/debug/libbsd/0.12.1/src/reallocarray.c /usr/src/debug/libbsd/0.12.1/src/heapsort.c /usr/src/debug/libbsd/0.12.1/src/setmode.c /usr/src/debug/libbsd/0.12.1/include/bsd/inttypes.h /usr/src/debug/libbsd/0.12.1/src/arc4random_uniform.c /usr/src/debug/libbsd/0.12.1/src/reallocf.c /usr/src/debug/libbsd/0.12.1/src/strlcat.c /usr/src/debug/libbsd/0.12.1/src/fmtcheck.c /usr/src/debug/libbsd/0.12.1/src/errc.c /usr/src/debug/libbsd/0.12.1/src/recallocarray.c /usr/src/debug/libbsd/0.12.1/src/setproctitle.c /usr/src/debug/libbsd/0.12.1/src/merge.c /usr/src/debug/libbsd/0.12.1/src/arc4random_linux.h /usr/src/debug/libbsd/0.12.1/src/wcslcat.c /usr/src/debug/libbsd/0.12.1/src/wcslcpy.c /usr/src/debug/libbsd/0.12.1/src/strlcpy.c /usr/src/debug/libbsd/0.12.1/src/strmode.c /usr/src/debug/libbsd/0.12.1/src/strnstr.c /usr/src/debug/libbsd/0.12.1/src/fgetwln.c /usr/src/debug/libbsd/0.12.1/src/funopen.c /
 usr/src/debug/libbsd/0.12.1/src/chacha_private.h /usr/src/debug/libbsd/0.12.1/src/explicit_bzero.c /usr/src/debug/libbsd/0.12.1/src/pidfile.c /usr/src/debug/libbsd/0.12.1/include/bsd/grp.h /usr/src/debug/libbsd/0.12.1/src/stringlist.c /usr/src/debug/libbsd/0.12.1/src/bsd_getopt.c /usr/src/debug/libbsd/0.12.1/include/bsd/vis.h /usr/src/debug/libbsd/0.12.1/include/bsd/stdio.h /usr/src/debug/libbsd/0.12.1/src/fgetln.c /usr/src/debug/libbsd/0.12.1/src/flopen.c /usr/src/debug/libbsd/0.12.1/src/fpurge.c /usr/src/debug/libbsd/0.12.1/src/dehumanize_number.c /usr/src/debug/libbsd/0.12.1/src/strtoi.c /usr/src/debug/libbsd/0.12.1/src/strtou.c /usr/src/debug/libbsd/0.12.1/src/arc4random.c /usr/src/debug/libbsd/0.12.1/src/unvis.c /usr/src/debug/libbsd/0.12.1/include/bsd/stringlist.h /usr/src/debug/libbsd/0.12.1/src/pwcache.c /usr/src/debug/libbsd/0.12.1/src/freezero.c /usr/src/debug/libbsd/0.12.1/src/getpeereid.c /usr/src/debug/libbsd/0.12.1/src/fparseln.c /usr/src/debug/libbsd/0.12.1/src/vis.c 
 /usr/src/debug/libbsd/0.12.1/src/timeconv.c"
packages/core2-64-poky-linux/libbsd/libbsd-src: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd/libbsd-src: PV changed from "0.11.8" to "0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-src: PKGSIZE changed from 270813 to 272139 (+0%)
packages/core2-64-poky-linux/libbsd/libbsd-staticdev: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd/libbsd-staticdev: PV changed from "0.11.8" to "0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd-staticdev: PKGSIZE changed from 3540 to 3532 (-0%)
packages/core2-64-poky-linux/libbsd/libbsd: FILELIST: removed "/usr/lib/libbsd.so.0.11.8", added "/usr/lib/libbsd.so.0.12.1"
packages/core2-64-poky-linux/libbsd/libbsd: PKGV changed from 0.11.8 [default] to 0.12.1 [default]
packages/core2-64-poky-linux/libbsd/libbsd: PV changed from "0.11.8" to "0.12.1"
Changes to packages/core2-64-poky-linux/libbsd (sysroot):
  /usr/lib/libbsd.so.0 changed symlink target from libbsd.so.0.11.8 to libbsd.so.0.12.1
  /usr/lib/libbsd.so.0.11.8 moved to /usr/lib/libbsd.so.0.12.1

--===============8488667503182730917==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libbsd-upgrade-0.11.8-0.12.1.patch"

RnJvbSAwODkyMDJmNTg0NzFiYzQ1YTM5MWQzNjU5YTZmZjM5YzAyNzc5MmY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAyMTo0NjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmJzZDogdXBncmFkZSAwLjExLjggLT4gMC4xMi4xCgotLS0KIC4uLi97bGliYnNkXzAuMTEuOC5i
YiA9PiBsaWJic2RfMC4xMi4xLmJifSAgICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmJzZC97bGliYnNkXzAuMTEuOC5iYiA9PiBsaWJic2RfMC4xMi4x
LmJifSAoNjglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJi
c2RfMC4xMS44LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEyLjEu
YmIKc2ltaWxhcml0eSBpbmRleCA2OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliYnNkL2xpYmJzZF8wLjExLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmJzZC9saWJic2RfMC4xMi4xLmJiCmluZGV4IDE3MDQ5YzhjMjguLjRlMDk3YTI4YzggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMS44LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4xLmJiCkBAIC0xLDMgKzEs
MjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBA
IC0zLDcgKzMsNyBAQAorIyAgRmlsZXM6CisjICAgKgorIyAgQ29weXJpZ2h0OgorIyAtIENvcHly
aWdodCDCqSAyMDA0LTIwMDYsIDIwMDgtMjAyMiBHdWlsbGVtIEpvdmVyIDxndWlsbGVtQGhhZHJv
bnMub3JnPgorIyArIENvcHlyaWdodCDCqSAyMDA0LTIwMjQgR3VpbGxlbSBKb3ZlciA8Z3VpbGxl
bUBoYWRyb25zLm9yZz4KKyMgIExpY2Vuc2U6IEJTRC0zLWNsYXVzZQorIyAgCisjICBGaWxlczoK
KyMgCisjCisKIFNVTU1BUlkgPSAiTGlicmFyeSBvZiB1dGlsaXR5IGZ1bmN0aW9ucyBmcm9tIEJT
RCBzeXN0ZW1zIgogREVTQ1JJUFRJT04gPSAiVGhpcyBsaWJyYXJ5IHByb3ZpZGVzIHVzZWZ1bCBm
dW5jdGlvbnMgY29tbW9ubHkgZm91bmQgb24gQlNEIHN5c3RlbXMsIFwKICAgICAgICAgICAgICAg
IGFuZCBsYWNraW5nIG9uIG90aGVycyBsaWtlIEdOVSBzeXN0ZW1zLCB0aHVzIG1ha2luZyBpdCBl
YXNpZXIgdG8gcG9ydCBcCkBAIC0zMywxMiArNTUsMTIgQEAgTElDRU5TRToke1BOfS1sb2NhbGUg
PSAiQlNELTMtQ2xhdXNlICYgSVNDICYgUEQiCiBMSUNFTlNFOiR7UE59LXNyYyA9ICJCU0QtMy1D
bGF1c2UgJiBJU0MgJiBQRCIKIExJQ0VOU0U6JHtQTn0tc3RhdGljZGV2ID0gIkJTRC0zLUNsYXVz
ZSAmIElTQyAmIFBEIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1i
ZWZlMDlmYWRhNTdiZGNmN2Y3YzEyZjUxMDgxYjA4ZiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PTliMDg3YTA5ODFhMWZjYWQ0MmVmYmJhNmQ0OTI1YTBmIgogU0VDVElP
TiA9ICJsaWJzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vbGliYnNkLmZyZWVkZXNrdG9wLm9yZy9y
ZWxlYXNlcy8ke0JQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTVm
ZGZhMjY5NmZiNGQ1NWE1OTJmYTlhZDE0YTlkZjg5N2M3YjAwMDhkZGIzYjMwYzQxOTkxNDg0MWY4
NWYzMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNzc0N2Y4ZWMxYmFhNmZmNWMwOTZhOWRkNTg3
YzA2MTIzM2RlYzkwZGEwZjFhZWRkNjZkODMwZjZkYjY5OTZhIgogCiBpbmhlcml0IGF1dG90b29s
cyBwa2djb25maWcKIAotLSAKMi40Mi4wCgo=

--===============8488667503182730917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libbsd/libbsd: FILELIST: removed "/usr/lib/libbsd.so.0.11.8", added "/usr/lib/libbsd.so.0.12.1"
Changes to packages/core2-64-poky-linux/libbsd (sysroot):
  /usr/lib/libbsd.so.0 changed symlink target from libbsd.so.0.11.8 to libbsd.so.0.12.1
  /usr/lib/libbsd.so.0.11.8 moved to /usr/lib/libbsd.so.0.12.1

--===============8488667503182730917==--


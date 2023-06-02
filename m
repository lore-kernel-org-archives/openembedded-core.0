Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE70C88C83
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.7638.1685693433507997356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E22vecKY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101887b288f7c-b5557da1-de2b-419e-aa59-335b3fb6008c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N+0SXQOI9JSdo6YKEcmnsnWpUa7njMRWA6sVF48aZEc=;
	b=E22vecKYvDH+BUZsvfJtf9YHSgQSs9DLEHNOk0sTB+NedIw1X5r/tIIkg5kc5bG/
	kJPQq5m2JzABb53G0Cw8tT6aHAz1y3IHO54cXdWGwCoyLy4dEvLPf1SoNPsO4twQ3gT
	p27DVgWtBfY9QZg7UsejeWJHngsS0MYHJS6iEV2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N+0SXQOI9JSdo6YKEcmnsnWpUa7njMRWA6sVF48aZEc=;
	b=CHdP5jy0rCPZetnGiok8rR1sfjWXa3fnw768AbobBrY/k44zQKUR/YKGc5TOaaE5
	92SBmOkQLoIqHPDfeTEbLgDzg/yEd9bDBjo/fx8FY0Lkynr0Qm4J6IYSM9VmS0FUG8N
	RUD5luxhQoglmHUUkT3vJfFAqNXpyUBhV67N0EUE=
Content-Type: multipart/mixed; boundary="===============7520996937186791780=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.22.3 SUCCEEDED
Message-ID: <010101887b288f7c-b5557da1-de2b-419e-aa59-335b3fb6008c-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182267

--===============7520996937186791780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.22.2-1.22.3.patch
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
--===============7520996937186791780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2202.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2203.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2202.0 to libgstrtspserver-1.0.so.0.2203.0
  /usr/lib/libgstrtspserver-1.0.so.0.2202.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2203.0

--===============7520996937186791780==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.22.2-1.22.3.patch"

RnJvbSAwYmE1YWMxODIxNTA5MTM5MzgwMGJjMmRhZDVjYTdlMDg5MjA0YTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNDozNjoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1ydHNwLXNlcnZlcjogdXBncmFkZSAxLjIyLjIgLT4gMS4yMi4zCgotLS0KIC4u
LnJ0c3Atc2VydmVyXzEuMjIuMi5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4z
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXJ0c3Atc2VydmVyXzEuMjIuMi5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4z
LmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIyLjMuYmIKc2ltaWxh
cml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIyLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4z
LmJiCmluZGV4IDAyYzJiYWRjMmEuLjBmOGE4OWRiN2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4yLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRz
cC1zZXJ2ZXJfMS4yMi4zLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJnc3QtcnRzcC1z
ZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjJiZTRhZWNmYjg4NzEwMTAwZWE3MTE1ZWQwMjE2NDAzZTgwOTQzNDRlYmYxNDYwOTQyNzFi
OGQ0ZDczODI4YmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDAyYTM5ZGZhOWJkYmY5OWEzZGQy
ZDM3OGUxNzk0MmIzY2U0MmRmZTM2ZmIwYzI3ZTJkMGIwMTcyMmZjNTYxZCIKIAogUyA9ICIke1dP
UktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============7520996937186791780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2202.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2203.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.3.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2202.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2203.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2202.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2203.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2202.0 to libgstrtspserver-1.0.so.0.2203.0
  /usr/lib/libgstrtspserver-1.0.so.0.2202.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2203.0

--===============7520996937186791780==--


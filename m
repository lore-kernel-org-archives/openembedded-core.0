Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.283.1794201493057759139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 21:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e1Bc+nvD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hr/Zo2yn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1bebe1a52-1cf51f96-c07b-40bb-a092-cf31466a599b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794201492;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=4XciAFC/SNQl4TH8GpL09ybHIzcjs16iziPDRoMmymQ=;
	b=e1Bc+nvDGlQNc3uboVDcxI+zItGvNmiYr9iG4m51jQx4iSmkFIJ3IvsGnAvlrsn1
	eSWTbkhy559Wxxf/f5fcBv1wEpMaRQN++y13SXk07fV2A9xUjlDZXTCcLVT/yWLTlqe
	8uvrSJs/vj/jwVHLruhuQCooGpfeojAz5kW5b9es=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794201492;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=4XciAFC/SNQl4TH8GpL09ybHIzcjs16iziPDRoMmymQ=;
	b=hr/Zo2ynD80FheSJavazW4StN3VPkQxlHM4QxQ6Ns/kLlbxYhb3mKSdCTr4514+y
	aMLGvPxIGdUfFq0dMa5eOi2HBbejp52Y8KdxBpANhcshwbOVeu3OM5zUlW71iK4VU6J
	+HTEPGerEnQ04VWuslYH9IcVt7w/KGdSQTT0vzDI=
Content-Type: multipart/mixed; boundary="===============5617492040898338778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] desktop-file-utils: upgrading to 0.29 SUCCEEDED
Message-ID: <010101a1bebe1a52-1cf51f96-c07b-40bb-a092-cf31466a599b-000000@us-west-2.amazonses.com>
Date: Mon, 9 Nov 2026 05:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.09-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 05:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249786

--===============5617492040898338778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpkZXNrdG9wLWZpbGUtdXRpbHMqIHRvICowLjI5KiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBz
dGVwczoKICAgIC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1kZXNrdG9wLWZpbGUtdXRp
bHMtdXBncmFkZS0wLjI4LTAuMjkucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBz
dHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAog
ICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVy
Zm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNp
Z24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2Vu
ZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5
b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1l
LAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNp
cGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0
ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5m
b3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZp
bGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5j
Z2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBn
cmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20gZDczNmU5NTE1MzcxOWUwOGUxM2VlOGY4MjJkZjRj
MGVlYjQ3NjRhNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIg
PGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBNb24sIDkgTm92IDIwMjYgMDU6MTE6NDMgKzAw
MDAKU3ViamVjdDogW1BBVENIXSBkZXNrdG9wLWZpbGUtdXRpbHM6IHVwZ3JhZGUgMC4yOCAtPiAw
LjI5Ck1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1V
VEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cgo9PT09PT09PT09PT0KVmVyc2lv
biAwLjI5Cj09PT09PT09PT09PQoKIGRlc2t0b3AtZmlsZS1pbnN0YWxsCiAgLSBBZGQgc3VwcG9y
dCBmb3IgLS1hZGQta2V5d29yZHMgYW5kIC0tcmVtb3ZlLWtleXdvcmRzIChmZG8jNzgpIChLbGZK
b2F0KS4KICAtIEFkZCAtLXNldC1leGVjIHNob3J0Y3V0IGZvciBzZXR0aW5nIHRoZSBFeGVjIGtl
eSAoSmFrb2JEZXYpLgoKIGRlc2t0b3AtZmlsZS12YWxpZGF0ZQogIC0gUmVxdWlyZSBFeGVjIGtl
eSB3aGVuIERCdXNBY3RpdmF0YWJsZSBpcyB1bnNldCAoQmFsbMOzIEd5w7ZyZ3kpLgogIC0gVmFs
aWRhdGUgdGhlIEtleXdvcmRzIGtleSAoS2xmSm9hdCkuCiAgLSBBZGQgUGhvc2ggdG8gbGlzdCBv
ZiB2YWxpZCBPbmx5U2hvd0luPSBlbnZpcm9ubWVudHMgKFNhbSBEYXkpLgogIC0gQWRkIG5ldyBn
YW1lIGNhdGVnb3JpZXMgKEpha29iRGV2KS4KICAtIEFkZCBIZWFsdGhGaXRuZXNzIGNhdGVnb3J5
IChKYWtvYkRldikuCgogdXBkYXRlLWRlc2t0b3AtZGF0YWJhc2UKICAtIEltcGxlbWVudCB0aGUg
aW50ZW50IGNhY2hlIGZyb20gdGhlIGludGVudC1hcHBzIHNwZWMgKFNlYmFzdGlhbiBXaWNrKS4K
ICAtIENvZGUgY2xlYW51cCBhbmQgbW9kZXJuaXphdGlvbiAoU2ViYXN0aWFuIFdpY2spLgoKIG1p
c2MKICAtIE1hbnBhZ2UgZml4ZXMgKGZkbyM3NiwgZmRvIzc3KSAoS2xmSm9hdCkuCi0tLQogLi4u
L3tkZXNrdG9wLWZpbGUtdXRpbHNfMC4yOC5iYiA9PiBkZXNrdG9wLWZpbGUtdXRpbHNfMC4yOS5i
Yn0gIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3AtZmlsZS11dGlscy97ZGVza3Rv
cC1maWxlLXV0aWxzXzAuMjguYmIgPT4gZGVza3RvcC1maWxlLXV0aWxzXzAuMjkuYmJ9ICg4OCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3AtZmlsZS11dGlscy9k
ZXNrdG9wLWZpbGUtdXRpbHNfMC4yOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9w
LWZpbGUtdXRpbHMvZGVza3RvcC1maWxlLXV0aWxzXzAuMjkuYmIKc2ltaWxhcml0eSBpbmRleCA4
OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3AtZmlsZS11dGlscy9k
ZXNrdG9wLWZpbGUtdXRpbHNfMC4yOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Rlc2t0b3AtZmlsZS11dGlscy9kZXNrdG9wLWZpbGUtdXRpbHNfMC4yOS5iYgppbmRleCAzNTUz
NzU3MmZlLi44ZTQxMzgzMTlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVz
a3RvcC1maWxlLXV0aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI4LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMvZGVza3RvcC1maWxlLXV0aWxzXzAuMjku
YmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL3NyYy92YWxpZGF0b3IuYztiZWdpbmxpbmU9NDtlbmRsaW5lPTI3O21kNT0yODFlMTEx
NGVlNmM0ODZhMWEwYTQyOTU5ODZiOTQxNiIKIAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LmZyZWVk
ZXNrdG9wLm9yZy9zb2Z0d2FyZS8ke0JQTn0vcmVsZWFzZXMvJHtCUH0udGFyLnh6IgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjQ0MDFkNGUyMzFkODQyYzJkZTgyNDIzOTVhNzRhMzk1Y2E0NjhjZDk2
ZjVmNjEwZDgyMmRmMzM1OTQ4OThhNzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjYxZjIyNWJl
NGM2NjdhYmM0OTYyZjA3NTcxN2RiNDI1MmI2M2M4NDQ4MGY2ZDM3YjI2MDUwZDAyOWRhOGZhMCIK
IAogREVQRU5EUyA9ICJnbGliLTIuMCIKIAotLSAKMi40Ny4xCgo=

--===============5617492040898338778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PV changed from "0.28" to "0.29"
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PKGSIZE changed from 328040 to 369960 (+13%)
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-dev: PV changed from "0.28" to "0.29"
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-dev: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-doc: PV changed from "0.28" to "0.29"
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-doc: PKGSIZE changed from 17856 to 18758 (+5%)
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-doc: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-locale: PV changed from "0.28" to "0.29"
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-locale: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-src: PV changed from "0.28" to "0.29"
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-src: PKGSIZE changed from 182436 to 197446 (+8%)
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-src: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-src: FILELIST: directory renamed /usr/src/debug/desktop-file-utils/0.28/src -> /usr/src/debug/desktop-file-utils/0.29/src
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-staticdev: PV changed from "0.28" to "0.29"
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-staticdev: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils: PV changed from "0.28" to "0.29"
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils: PKGSIZE changed from 207764 to 215956 (+4%)
packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils: SRC_URI changed from "http://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.28.tar.xz" to "http://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.29.tar.xz"
packages/x86-64-v3-poky-linux/desktop-file-utils: PKGV changed from 0.28 [default] to 0.29 [default]
packages/x86-64-v3-poky-linux/desktop-file-utils: PV changed from "0.28" to "0.29"

--===============5617492040898338778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/desktop-file-utils/desktop-file-utils-dbg: PKGSIZE changed from 328040 to 369960 (+13%)

--===============5617492040898338778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-desktop-file-utils-upgrade-0.28-0.29.patch"

RnJvbSBkNzM2ZTk1MTUzNzE5ZTA4ZTEzZWU4ZjgyMmRmNGMwZWViNDc2NGE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgOSBOb3YgMjAyNiAwNToxMTo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
c2t0b3AtZmlsZS11dGlsczogdXBncmFkZSAwLjI4IC0+IDAuMjkKTUlNRS1WZXJzaW9uOiAxLjAK
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKCj09PT09PT09PT09PQpWZXJzaW9uIDAuMjkKPT09PT09PT09PT09Cgog
ZGVza3RvcC1maWxlLWluc3RhbGwKICAtIEFkZCBzdXBwb3J0IGZvciAtLWFkZC1rZXl3b3JkcyBh
bmQgLS1yZW1vdmUta2V5d29yZHMgKGZkbyM3OCkgKEtsZkpvYXQpLgogIC0gQWRkIC0tc2V0LWV4
ZWMgc2hvcnRjdXQgZm9yIHNldHRpbmcgdGhlIEV4ZWMga2V5IChKYWtvYkRldikuCgogZGVza3Rv
cC1maWxlLXZhbGlkYXRlCiAgLSBSZXF1aXJlIEV4ZWMga2V5IHdoZW4gREJ1c0FjdGl2YXRhYmxl
IGlzIHVuc2V0IChCYWxsw7MgR3nDtnJneSkuCiAgLSBWYWxpZGF0ZSB0aGUgS2V5d29yZHMga2V5
IChLbGZKb2F0KS4KICAtIEFkZCBQaG9zaCB0byBsaXN0IG9mIHZhbGlkIE9ubHlTaG93SW49IGVu
dmlyb25tZW50cyAoU2FtIERheSkuCiAgLSBBZGQgbmV3IGdhbWUgY2F0ZWdvcmllcyAoSmFrb2JE
ZXYpLgogIC0gQWRkIEhlYWx0aEZpdG5lc3MgY2F0ZWdvcnkgKEpha29iRGV2KS4KCiB1cGRhdGUt
ZGVza3RvcC1kYXRhYmFzZQogIC0gSW1wbGVtZW50IHRoZSBpbnRlbnQgY2FjaGUgZnJvbSB0aGUg
aW50ZW50LWFwcHMgc3BlYyAoU2ViYXN0aWFuIFdpY2spLgogIC0gQ29kZSBjbGVhbnVwIGFuZCBt
b2Rlcm5pemF0aW9uIChTZWJhc3RpYW4gV2ljaykuCgogbWlzYwogIC0gTWFucGFnZSBmaXhlcyAo
ZmRvIzc2LCBmZG8jNzcpIChLbGZKb2F0KS4KLS0tCiAuLi4ve2Rlc2t0b3AtZmlsZS11dGlsc18w
LjI4LmJiID0+IGRlc2t0b3AtZmlsZS11dGlsc18wLjI5LmJifSAgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL3tkZXNrdG9wLWZpbGUtdXRpbHNfMC4yOC5iYiA9
PiBkZXNrdG9wLWZpbGUtdXRpbHNfMC4yOS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI4
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3AtZmlsZS11dGlscy9kZXNrdG9wLWZp
bGUtdXRpbHNfMC4yOS5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI4
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL2Rl
c2t0b3AtZmlsZS11dGlsc18wLjI5LmJiCmluZGV4IDM1NTM3NTcyZmUuLjhlNDEzODMxOWEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMvZGVza3Rv
cC1maWxlLXV0aWxzXzAuMjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3At
ZmlsZS11dGlscy9kZXNrdG9wLWZpbGUtdXRpbHNfMC4yOS5iYgpAQCAtOCw3ICs4LDcgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4
MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3ZhbGlkYXRvci5j
O2JlZ2lubGluZT00O2VuZGxpbmU9Mjc7bWQ1PTI4MWUxMTE0ZWU2YzQ4NmExYTBhNDI5NTk4NmI5
NDE2IgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3NvZnR3YXJlLyR7
QlBOfS9yZWxlYXNlcy8ke0JQfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDQwMWQ0
ZTIzMWQ4NDJjMmRlODI0MjM5NWE3NGEzOTVjYTQ2OGNkOTZmNWY2MTBkODIyZGYzMzU5NDg5OGE3
MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NjFmMjI1YmU0YzY2N2FiYzQ5NjJmMDc1NzE3ZGI0
MjUyYjYzYzg0NDgwZjZkMzdiMjYwNTBkMDI5ZGE4ZmEwIgogCiBERVBFTkRTID0gImdsaWItMi4w
IgogCi0tIAoyLjQ3LjEKCg==

--===============5617492040898338778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="desktop-file-utils-changelog.txt"

PT09PT09PT09PT09ClZlcnNpb24gMC4yOQo9PT09PT09PT09PT0KCiBkZXNrdG9wLWZpbGUtaW5z
dGFsbAogIC0gQWRkIHN1cHBvcnQgZm9yIC0tYWRkLWtleXdvcmRzIGFuZCAtLXJlbW92ZS1rZXl3
b3JkcyAoZmRvIzc4KSAoS2xmSm9hdCkuCiAgLSBBZGQgLS1zZXQtZXhlYyBzaG9ydGN1dCBmb3Ig
c2V0dGluZyB0aGUgRXhlYyBrZXkgKEpha29iRGV2KS4KCiBkZXNrdG9wLWZpbGUtdmFsaWRhdGUK
ICAtIFJlcXVpcmUgRXhlYyBrZXkgd2hlbiBEQnVzQWN0aXZhdGFibGUgaXMgdW5zZXQgKEJhbGzD
syBHecO2cmd5KS4KICAtIFZhbGlkYXRlIHRoZSBLZXl3b3JkcyBrZXkgKEtsZkpvYXQpLgogIC0g
QWRkIFBob3NoIHRvIGxpc3Qgb2YgdmFsaWQgT25seVNob3dJbj0gZW52aXJvbm1lbnRzIChTYW0g
RGF5KS4KICAtIEFkZCBuZXcgZ2FtZSBjYXRlZ29yaWVzIChKYWtvYkRldikuCiAgLSBBZGQgSGVh
bHRoRml0bmVzcyBjYXRlZ29yeSAoSmFrb2JEZXYpLgoKIHVwZGF0ZS1kZXNrdG9wLWRhdGFiYXNl
CiAgLSBJbXBsZW1lbnQgdGhlIGludGVudCBjYWNoZSBmcm9tIHRoZSBpbnRlbnQtYXBwcyBzcGVj
IChTZWJhc3RpYW4gV2ljaykuCiAgLSBDb2RlIGNsZWFudXAgYW5kIG1vZGVybml6YXRpb24gKFNl
YmFzdGlhbiBXaWNrKS4KCiBtaXNjCiAgLSBNYW5wYWdlIGZpeGVzIChmZG8jNzYsIGZkbyM3Nykg
KEtsZkpvYXQpLgo=

--===============5617492040898338778==--

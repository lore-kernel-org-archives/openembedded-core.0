Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0E9C5AD68
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 06:00:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4794.1786255199930643501
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 23:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QjW7yt6+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Co4YqCo6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fe51b4ac9-dd110c36-9784-4cf3-9774-109ea22e52dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786255199;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ps7pgglQCcz0icJ/bOkGHpw1fSFz1SXphoRldliMHFc=;
	b=QjW7yt6+p5aPiCL1aVlS1DW9pKSQdtVWuon3OuoL8661uUcS69FFw2sGhOH6E53k
	jczyE97lw3n3kfbz2FoH+LkLZ0ndgwibhPEVPG6epg0SsiEP3Fdi7Fc27Y5qWyRXqav
	ACPgVs29+gp4ob13ZLTuHSX/AOXdjTuMbxfZn8cc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786255199;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ps7pgglQCcz0icJ/bOkGHpw1fSFz1SXphoRldliMHFc=;
	b=Co4YqCo6QuI7XO1ES4y0Gr2FZgChNtbW0ijQEEy32+uQhYjzZSBPjcT9dRUFXv7Q
	uEhentDSZ5lLXJBY5ORoF5LpeYJVyYsrYdtHDN4KKKSd18VyhzfzGkEByonTXj1yQ0b
	htG3aSIVbhiKailZcDmEaMhDWSdSyBFz04nwH3cU=
Content-Type: multipart/mixed; boundary="===============1203162011098518025=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 84.0.0 SUCCEEDED
Message-ID: <0101019fe51b4ac9-dd110c36-9784-4cf3-9774-109ea22e52dd-000000@us-west-2.amazonses.com>
Date: Sun, 9 Aug 2026 05:59:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.09-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 06:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243058

--===============1203162011098518025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLXNldHVwdG9vbHMqIHRvICo4NC4wLjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0
IHN0ZXBzOgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXB5dGhvbjMtc2V0dXB0
b29scy11cGdyYWRlLTgzLjAuMC04NC4wLjAucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMg
dG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAg
IC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2gg
YW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAg
IC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5
LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhp
cyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2
ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIg
YmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRo
ZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxl
YXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVy
X2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApU
aGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20gZTg4NjdhNWM0ZmYxMTk3YjZhYWM5YWQ1
MmMyODA5ZDFlNWRjOTFhMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBI
ZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBTdW4sIDkgQXVnIDIwMjYgMDU6MzM6
MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBweXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgODMu
MC4wIC0+IDg0LjAuMApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKU291cmNlOiBO
RVdTLnJzdAoKdjg0LjAuMAo9PT09PT09CgpGZWF0dXJlcwotLS0tLS0tLQoKLSBOZXdsaW5lLXNl
cGFyYXRlZCBgYGtleXdvcmRzYGAgYW5kIGBgcGxhdGZvcm1zYGAsIHdoaWNoIGFyZSBpbnZhbGlk
IGFuZCBjb3JydXB0IHRoZSBnZW5lcmF0ZWQgbWV0YWRhdGEgKHB5cGEvc2V0dXB0b29scyM0ODg3
KSwgYXJlIG5vdyBoYW5kbGVkIGZvcmdpdmluZ2x5OiBlYWNoIGxpbmUgaXMgdHJlYXRlZCBhcyBh
IHNlcGFyYXRlIGl0ZW0gYW5kIGEgZGVwcmVjYXRpb24gd2FybmluZyBpcyBlbWl0dGVkLiBOZXds
aW5lcyB3ZXJlIG5ldmVyIGEgdmFsaWQgc2VwYXJhdG9yIGZvciB0aGVzZSBmaWVsZHMgLS0gdGhl
IGBvbGQgc3BlY2lmaWNhdGlvbiA8aHR0cHM6Ly9wZXBzLnB5dGhvbi5vcmcvcGVwLTAzNDUvPmBf
IHNlcGFyYXRlZCBpdGVtcyB3aXRoIHNwYWNlcyBhbmQgdGhlIGN1cnJlbnQgb25lIHVzZXMgY29t
bWFzLiAoIzQ4ODcpCi0gYGBFeHRlbnNpb25gYCBpcyBub3cgYSBkYXRhY2xhc3MsIGV4cG9zaW5n
IHR5cGUgYW5ub3RhdGlvbnMgZm9yIGl0cyBjb25zdHJ1Y3RvciBhcmd1bWVudHMgc28gc3ViY2xh
c3NlcyAoZS5nLiBpbiBTZXR1cHRvb2xzKSBjYW4gaW5oZXJpdCB0aGVtIHdpdGhvdXQgcmVkZWNs
YXJpbmcgZWFjaCBwYXJhbWV0ZXIuIFBhc3NpbmcgdW5rbm93biBrZXl3b3JkIGFyZ3VtZW50cyBp
cyBub3cgZGVwcmVjYXRlZC4gKHB5cGEvZGlzdHV0aWxzIzM3MykgKCM1MDIyKQotIFRoZSBDIGNv
bXBpbGVyIG1vZHVsZXMgbm93IGVtaXQgbG9nIG1lc3NhZ2VzIHRocm91Z2ggdGhlaXIgb3duIGBg
Y29tcGlsZXJzLkMuKmBgIGxvZ2dlcnMgaW5zdGVhZCBvZiB0aGUgZGlzdHV0aWxzIHJvb3QgbG9n
Z2VyLCBwYXJ0IG9mIGRlY291cGxpbmcgdGhlIGNvbXBpbGVycyBwYWNrYWdlIGZyb20gZGlzdHV0
aWxzLiBUaGUgbG9nZ2VyIG5hbWVzIGFyZSBub3JtYWxpemVkIHRvIGEgc3RhYmxlIGBgY29tcGls
ZXJzLkMuKmBgIHByZWZpeCBzbyB0aGV5IHJlbWFpbiBjb25zdGFudCBhcyB0aGUgcGFja2FnZSBt
aWdyYXRlcyB0b3dhcmQgYSBzdGFuZGFsb25lIGBgY29tcGlsZXJzLkNgYCBkaXN0cmlidXRpb24u
ICgjNTI2NikKLSBUaGUgQyBjb21waWxlcnMgZ2FpbmVkIGEgYGBDb21waWxlci5jYWxsYGAgbWV0
aG9kIC0tIGEgdGhpbiB3cmFwcGVyIG92ZXIgYGBzdWJwcm9jZXNzLmNoZWNrX2NhbGxgYCAod2l0
aCBtYWNPUyBkZXBsb3ltZW50LXRhcmdldCBlbnYgaW5qZWN0aW9uKSB0aGF0IGlzIHRoZSBtb2Rl
cm4gcmVwbGFjZW1lbnQgZm9yIGBgQ29tcGlsZXIuc3Bhd25gYC4gVGhlIGNvbXBpbGVycyBubyBs
b25nZXIgZGVwZW5kIG9uIGBgZGlzdHV0aWxzLnNwYXduYGAsIGBgZGlzdHV0aWxzLmRpcl91dGls
YGAsIGBgZGlzdHV0aWxzLmZpbGVfdXRpbGBgLCBgYGRpc3R1dGlscy5fbW9kaWZpZWRgYCwgb3Ig
YGBkaXN0dXRpbHMudXRpbC5leGVjdXRlYGAvYGBzcGxpdF9xdW90ZWRgYDogdGhlIGdlbmVyaWMg
YGBuZXdlcmBgL2BgbmV3ZXJfZ3JvdXBgYCBhbmQgYGBzcGxpdF9xdW90ZWRgYCBoZWxwZXJzIGFy
ZSB2ZW5kb3JlZCBpbnRvIHRoZSBgYGNvbXBpbGVyc2BgIHBhY2thZ2UsIGFuZCBgYENvbXBpbGVy
Lm1rcGF0aGBgL2BgbW92ZV9maWxlYGAvYGBleGVjdXRlYGAgYXJlIGltcGxlbWVudGVkIGRpcmVj
dGx5IG9uIHRoZSBzdGFuZGFyZCBsaWJyYXJ5IChgYG9zLm1ha2VkaXJzYGAvYGBzaHV0aWwubW92
ZWBgKS4gVGhlIG1ldGhvZHMgYXJlIHJldGFpbmVkIGZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5
LiAoIzUyNjcpCi0gVGhlIGNvbXBpbGVycyBubyBsb25nZXIgZGVwZW5kIG9uIGBgZGlzdHV0aWxz
LnV0aWxgYCwgYGBkaXN0dXRpbHMudmVyc2lvbmBgLCBgYGRpc3R1dGlscy5jb21wYXRgYCwgb3Ig
YGBkaXN0dXRpbHMuX21hY29zX2NvbXBhdGBgLiBUaGUgcGxhdGZvcm0taWRlbnRpZmljYXRpb24g
aGVscGVycyAoYGBnZXRfcGxhdGZvcm1gYC9gYGdldF9ob3N0X3BsYXRmb3JtYGAvYGBpc19taW5n
d2BgKSBub3cgbGl2ZSBpbiBgYGRpc3R1dGlscy5jb21waWxlcnMucGxhdGZvcm0uZGV0ZWN0YGAg
YW5kIHRoZSBtYWNPUyBkZXBsb3ltZW50LXRhcmdldCBsb2dpYyBhbmQgYGBjb21waWxlcl9maXh1
cGBgIGluIGBgZGlzdHV0aWxzLmNvbXBpbGVycy5wbGF0Zm9ybS5tYWNvc2BgOyBgYEN5Z3dpbkND
b21waWxlci5nY2NfdmVyc2lvbmBgIHJldHVybnMgYSBgYHBhY2thZ2luZy52ZXJzaW9uLlZlcnNp
b25gYC4gYGBkaXN0dXRpbHMudXRpbGBgIHJlLWV4cG9ydHMgdGhlIHBsYXRmb3JtL21hY09TIGhl
bHBlcnMgZnJvbSB0aGVpciBuZXcgaG9tZXMgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgcmF0
aGVyIHRoYW4ga2VlcGluZyBkdXBsaWNhdGUgY29waWVzLiAoc3lzY29uZmlnIGxvb2t1cHMgc3Rp
bGwgcm91dGUgdGhyb3VnaCBkaXN0dXRpbHMgcGVuZGluZyBpdHMgb3duIGRlY291cGxpbmcuKSAo
IzUyNjgpCi0gVGhlIGNvbXBpbGVycyBub3cgcmVhZCB0aGVpciBidWlsZCBjb25maWd1cmF0aW9u
IGZyb20gdGhlIHN0YW5kYXJkIGxpYnJhcnkncyBgYHN5c2NvbmZpZ2BgIGluc3RlYWQgb2YgYGBk
aXN0dXRpbHMuc3lzY29uZmlnYGAuIFBlci1jb21waWxlciBjdXN0b21pemF0aW9uIC0tIHByZXZp
b3VzbHkgYGBkaXN0dXRpbHMuc3lzY29uZmlnLmN1c3RvbWl6ZV9jb21waWxlcmBgIC0tIGhhcyBt
b3ZlZCBpbnRvIGBgQ29tcGlsZXIuY29uZmlndXJlX3N5c3RlbSgpYGA6IGEgbm8tb3Agb24gdGhl
IGJhc2UgY2xhc3MsIHdpdGggYGBVbml4Q0NvbXBpbGVyYGAgYXBwbHlpbmcgdGhlIGNvbXBpbGVy
L2ZsYWcvYXJjaGl2ZXIgc2V0dGluZ3MgQ1B5dGhvbiByZWNvcmRlZCBpbiBgYHN5c2NvbmZpZ2Bg
IChhbmQgdGhlIHVzdWFsIGBgQ0NgYC9gYENGTEFHU2BgL2BgTERTSEFSRURgYC/igKYgZW52aXJv
bm1lbnQgb3ZlcnJpZGVzKS4gYGBkaXN0dXRpbHMuc3lzY29uZmlnLmN1c3RvbWl6ZV9jb21waWxl
cmBgIGlzIHJldGFpbmVkIGFzIGEgdGhpbiB3cmEKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0
IGV4Y2VlZHMgMzAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5k
IGluIGFuIGF0dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4xLV9kaXN0dXRpbHMt
c3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2ggfCAyICstCiAu
Li55dGhvbjMtc2V0dXB0b29sc184My4wLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzg0LjAu
MC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVw
dG9vbHNfODMuMC4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc184NC4wLjAuYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0
aXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0
aXRlLnBhdGNoCmluZGV4IDZlMjQwYzQ3ZDIuLmY2MzEzZmIxYTkgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGls
cy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0
dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDAxNWZmNjhlNzkyOThjNTE0ODM1MGNmM2JmMGI3MmQxZDQwOWJh
NGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZlNjUxNTIxYjlkOTcwYTg0NDMyYjM3
ZDI3MzE5MzJhNDg2MmRlYjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2VkLCAxMSBNYXkgMjAyMiAy
MTo0MToxNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBfZGlzdHV0aWxzL3N5c2NvbmZpZy5weTog
bWFrZSBpdCBwb3NzaWJsZSB0byBzdWJzdGl0ZSB0aGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgzLjAuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzg0LjAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc184My4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzg0LjAuMC5iYgppbmRleCBlNTU5M2M5ZjczLi42
NDhiMDg0YTI3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc184My4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXNldHVwdG9vbHNfODQuMC4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIENWRV9QUk9E
VUNUID0gInB5dGhvbjMtc2V0dXB0b29scyBweXRob246c2V0dXB0b29scyIKIFNSQ19VUkkgKz0g
IiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtl
LWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MDI1YmNjYmJmMGZhMDViNjE5MmJjNjRhZTFlN2IxNmUwMDFmZDZkNmQ0ZDVkZTAzYzk3YjFjMWFk
ZTUyM2JlZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNDY5NWMyMTI1N2YwZDliNTM3ZWMyNjky
Yzk0MWQwMmVlMTQzYjdjYzEyNzY5NDEzNDlhNTQ2NTczYjJlZjczIgogCiBkb19pbnN0YWxsOmFw
cGVuZCgpIHsKIAkjIHNldHVwdG9vbHMgc2hpcHMgV2luZG93cyBsYXVuY2hlciBleGVjdXRhYmxl
cyAoY2xpKi5leGUsIGd1aSouZXhlKS4KLS0gCjIuNDcuMQoK

--===============1203162011098518025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 7291290 to 5612978 (-23%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info, removed "/usr/lib/python3.14/site-packages/setuptools/tests/config/test_setupcfg.py /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/preload.py /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_extern.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_namespaces.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py39.py /u
 sr/lib/python3.14/site-packages/setuptools/tests/environment.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_cygwin.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_unix.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_dist_info.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/unix_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_extension.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py39.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/support.py /usr/lib/python3.14/site-packages/setuptools/tests/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/test
 s/config/__pycache__/test_expand.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_clean.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__init__.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_msvc.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_editable_install.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/unix_compat.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__init__.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_ar
 chive_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_py.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_dist.py /usr/lib/python3.14/site-packages/setuptools/tests/config/setupcfg_examples.txt /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyprojecttoml.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_data.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sysconfig.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_find_packages.py /usr/lib/python3.14/site-packages/setuptools/tests/test_config_discovery.py /usr/lib/python3.14/site-packages/setuptools/_di
 stutils/tests/__pycache__/support.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_clib.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_meta.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_logging.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_version.py /usr/lib/python3.14/site-packages/setuptools/tests/test_egg_info.py /usr/lib/python3.14/site-packages/setuptools/tests/test_dist_info.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_config_cmd.py /usr/lib/python3.14/site-packages/setuptools/tests/test_sdist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-314.pyc /usr/l
 ib/python3.14/site-packages/setuptools/tests/test_virtualenv.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_mingw.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_filelist.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install.py /usr/lib/python3.14/site-packages/setuptools/tests/compat/py39.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_depends.py /usr/lib/python3.14/site-packages/setuptools/tests/test_develop.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/textwrap.py /usr/lib/python3.14/site-packa
 ges/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/script-with-bom.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_cygwin.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_base.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_msvc.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_unix.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_shutil_wrapper.cpython-
 314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pbr.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/textwrap.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/py39.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_file_util.py /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pbr.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_lib.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dir_util.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_insta
 ll_headers.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_develop.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_clib.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/text.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutil
 s/tests/__pycache__/test_build_scripts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_sdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/contexts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py /usr/lib/python3.14/site-packages/setuptools/tests/test_setuptools.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_ext.py /usr/lib/python3.14/site-packages/setuptools/tests/integration/helpers.py /usr/lib/python3.14/site-packages/setuptools/tests/test_glob.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_scripts.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_wheel.py /usr/lib/python3.14/site-package
 s/setuptools/tests/__pycache__/test_install_scripts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_manifest.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_scripts.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_wheel.py /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_build_meta.py /usr/lib/python3.14/site-packages/setuptools/tests/test_build_clib.py /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/t
 est_archive_util.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_scripts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_mingw.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__init__.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_spawn.py /usr/lib/python3.14/site-packages/setuptool
 s/_distutils/tests/test_bdist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/py39.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_check.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_clean.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sdist.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/text.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_unicode_utils.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_versionpredicate.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_text_file.py /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_egg.py /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pip_install_sdist
 .py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_scripts.py /usr/lib/python3.14/site-packages/setuptools/tests/test_windows_wrappers.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_dist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_glob.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__init__.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_cmd.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_log.py /usr/lib/python3.14/site-packages/setuptools/tests/test_extern.py /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyproject
 toml_dynamic_deps.py /usr/lib/python3.14/site-packages/setuptools/tests/namespaces.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_core.py /usr/lib/python3.14/site-packages/setuptools/tests/test_distutils_adoption.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_util.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html /usr/lib/python3.14/site-packages/setuptools/tests/test_warnings.py /usr/lib/python3.14/site-packages/setuptools/tests/test_build.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test
 _depends.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/namespaces.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_archive_util.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/mod_with_constant.py /usr/lib/python3.14/site-packages/setuptools/tests/test_build_py.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_de
 precations.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/contexts.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/__init__.py /usr/lib/python3.14/site-packages/setuptools/tests/test_build_ext.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/environment.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_modified.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_core_metadata.py /usr/lib/python3.14/site-packages/setuptools/tests/test_setopt.py /usr/lib/python3.14/site-packages/setuptools/
 _distutils/tests/__pycache__/test_bdist_rpm.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/fixtures.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/test_expand.py /usr/lib/python3.14/site-packages/setuptools/tests/test_find_py_modules.py /usr/lib/python3.14/site-packages/setuptools/tests/test_install_scripts.py /usr/lib/python3.14/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py /usr/lib/python3.14/site-packages/setuptools/tests/fixtures.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_py.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_modified.py /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/external.html /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-314.pyc /usr/lib/python3.14/si
 te-packages/setuptools/_distutils/compilers/C/tests/test_base.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_shutil_wrapper.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_logging.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/_modified.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_modified.cpython-314.pyc /usr/li
 b/python3.14/site-packages/setuptools/_distutils/__pycache__/_dataclass.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/detect.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/_util.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/macos.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py310.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/logging.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/detect.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/logging.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/errors.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py310.cpython-314.pyc /usr/l
 ib/python3.14/site-packages/setuptools/_distutils/_dataclass.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/macos.py"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py310.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py310.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/logging.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/_modified.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/detect.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/macos.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/detect.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/macos.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/logging.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_modified.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/_util.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/_dataclass.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/__pycache__/_dataclass.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py39.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py39.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_base.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_cygwin.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_mingw.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_msvc.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_unix.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_base.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_cygwin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_mingw.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_msvc.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_unix.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/py39.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/py39.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/support.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_rpm.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_clean.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_modified.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_sdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/unix_compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/support.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_archive_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_clib.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_ext.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_py.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_check.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_clean.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_cmd.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_config_cmd.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_core.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dir_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_extension.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_filelist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_file_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_data.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_headers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_lib.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_log.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_modified.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_spawn.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sysconfig.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_text_file.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_versionpredicate.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/unix_compat.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/py39.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/preload.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_expand.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/setupcfg_examples.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_expand.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyprojecttoml.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_setupcfg.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/contexts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/environment.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/fixtures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/external.html was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/helpers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pbr.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pbr.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pip_install_sdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/mod_with_constant.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/namespaces.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/contexts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/environment.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/fixtures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/namespaces.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_archive_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_clib.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_meta.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_py.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_depends.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_develop.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_dist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_dist_info.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_extern.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_glob.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_install_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_logging.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_shutil_wrapper.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/text.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/textwrap.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/script-with-bom.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_archive_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_deprecations.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_egg.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_wheel.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_clib.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_ext.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_meta.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_py.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_config_discovery.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_core_metadata.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_depends.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_develop.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_dist_info.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_dist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_distutils_adoption.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_editable_install.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_egg_info.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_extern.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_find_packages.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_find_py_modules.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_glob.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_install_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_logging.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_manifest.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_namespaces.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_sdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_setopt.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_setuptools.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_shutil_wrapper.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_unicode_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_virtualenv.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_warnings.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_wheel.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_windows_wrappers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/text.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/textwrap.py was removed

--===============1203162011098518025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-83.0.0.tar.gz;downloadfilename=setuptools-83.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-84.0.0.tar.gz;downloadfilename=setuptools-84.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/x86-64-v3-poky-linux/python3-setuptools: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 7291290 to 5612978 (-23%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PV changed from "83.0.0" to "84.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info, removed "/usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_extern.py /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_deprecations.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_fil
 e_util.py /usr/lib/python3.14/site-packages/setuptools/tests/test_dist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/unix_compat.py /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/preload.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/environment.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-
 314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_depends.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_logging.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_sdist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/tests/test_config_discovery.py /usr/lib/python3.14/site-packages/setuptools/tests/test_core_metadata.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_text_file.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_archive_util.py /usr/lib/python3.14/site-packages/setuptools/tests/integration/helpers.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test
 _dist_info.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pbr.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_scripts.py /usr/lib/python3.14/site-packages/setuptools/tests/test_scripts.py /usr/lib/python3.14/site-packages/setuptools/tests/textwrap.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_dist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/external.html /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_glob.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_scripts.cpyt
 hon-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_develop.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_clib.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_extern.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_build_py.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py39.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html /usr/lib/python3.14/site-packages/setuptools/_
 distutils/tests/__pycache__/test_modified.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/test_expand.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_py.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_dist_info.py /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_unix.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_base.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_shutil_wrapper.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/py39.py /usr/lib/python3.14/s
 ite-packages/setuptools/_distutils/tests/test_modified.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_unicode_utils.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/py39.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_distutils_adoption.py /usr/lib/python3.14/site-packages/setuptools/tests/namespaces.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_scripts.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_extension.py /usr/lib/python3.14/site-packages/setuptools/tests/test_manifest.py /usr/lib/python3.14/site-packages/setuptools/tests/test_logging.py /usr/lib/python3.14/site-packag
 es/setuptools/tests/__pycache__/test_build_py.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_egg_info.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_version.py /usr/lib/python3.14/site-packages/setuptools/tests/test_wheel.py /usr/lib/python3.14/site-packages/setuptools/tests/test_archive_util.py /usr/lib/python3.14/site-packages/setuptools/tests/test_depends.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/text.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_develop.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_core.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_util.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-
 314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_ext.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_cygwin.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_scripts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_data.py
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py39.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_filelist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_find_py_modules.py /usr/lib/python3.14/site-packages/setuptools/tests/test_build_ext.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_unix.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_check.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_clean.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sdist.py /usr/lib/python3.14/site-packag
 es/setuptools/_distutils/tests/test_spawn.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_base.py /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_install_scripts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_warnings.py /usr/lib/python3.14/site-packages/setuptools/tests/test_namespaces.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_clib.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_meta.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/te
 st_editable_install.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__init__.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/support.py /usr/lib/python3.14/site-packages/setuptools/tests/test_virtualenv.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__init__.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_egg.py /usr/lib/python3.14/site-packages/setuptools/tests/compat/py39.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_archive_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptoo
 ls/_distutils/tests/__pycache__/test_sdist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_config_cmd.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/contexts.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pip_install_sdist.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_mingw.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/text.py /usr/lib/python3.14/site-packages/setuptools/tests/test_setopt.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_build_clib.py /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_wheel.py /usr/lib/python3.14/site-p
 ackages/setuptools/tests/__pycache__/test_build.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__init__.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__init__.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/fixtures.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/environment.py /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py /usr/lib/python3.14/site-packages/setuptools/test
 s/contexts.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/textwrap.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dir_util.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pbr.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/mod_with_constant.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/support.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_mingw.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distut
 ils/tests/__pycache__/test_bdist_rpm.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/script-with-bom.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_clean.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/integration/__init__.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/namespaces.cpython-314.pyc /usr/li
 b/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_cygwin.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_build.py /usr/lib/python3.14/site-packages/setuptools/tests/config/setupcfg_examples.txt /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_expand.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyprojecttoml.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_headers.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py /usr/lib/python3.14/site-packages/setuptools/tests/test_windows_wrappers.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_cmd.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_log.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-314.
 pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_build_meta.py /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/unix_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_msvc.py /usr/lib/python3.14/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_setuptools.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/test_glob.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sysconfig.py /usr/lib/python3.14/site-packages/setuptools/tests/test_install_scripts.py /usr/lib/python3.14/site-packages/setuptools/test
 s/test_shutil_wrapper.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_lib.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/tests/fixtures.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_versionpredicate.py /usr/lib/python3.14/site-packages/setuptools/tests/test_find_packages.py /usr/lib/python3.14/site-packages/setuptools/tests/config/test_setupcfg.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_msvc.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py310.py /usr/lib/python3.14/site-packages/setuptools/_distutils/_dataclass.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/logging.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platfo
 rm/detect.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/macos.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/_util.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/macos.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/logging.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/errors.py /usr/lib/python3.14/site-packages/setuptools/_distutils/__pycache__/_dataclass.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_modified.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/detect.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-pac
 kages/setuptools/_distutils/compilers/_modified.py /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py310.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 83.0.0 [default] to 84.0.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py310.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py310.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/logging.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/_modified.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/detect.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/macos.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/detect.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/platform/__pycache__/macos.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/logging.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_modified.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/__pycache__/_util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/_util.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/_dataclass.py was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/__pycache__/_dataclass.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/py39.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compat/__pycache__/py39.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_base.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_cygwin.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_mingw.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_msvc.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/__pycache__/test_unix.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_base.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_cygwin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_mingw.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_msvc.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/tests/test_unix.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/py39.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/compat/__pycache__/py39.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/support.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_archive_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_dumb.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_bdist_rpm.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_clib.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_ext.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_py.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_build_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_check.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_clean.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_cmd.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_config_cmd.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_core.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dir_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_dist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_extension.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_filelist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_file_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_data.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_headers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_lib.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_install_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_log.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_modified.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_sdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_spawn.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_sysconfig.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_text_file.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/test_versionpredicate.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/__pycache__/unix_compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/support.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_archive_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_dumb.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_bdist_rpm.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_clib.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_ext.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_py.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_build_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_check.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_clean.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_cmd.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_config_cmd.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_core.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dir_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_dist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_extension.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_filelist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_file_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_data.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_headers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_lib.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_install_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_log.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_modified.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_spawn.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_sysconfig.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_text_file.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_versionpredicate.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/test_version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_distutils/tests/unix_compat.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/py39.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/compat/__pycache__/py39.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/preload.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/downloads/__pycache__/preload.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_apply_pyprojecttoml.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_expand.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_pyprojecttoml_dynamic_deps.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/__pycache__/test_setupcfg.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/setupcfg_examples.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_apply_pyprojecttoml.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_expand.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyprojecttoml_dynamic_deps.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_pyprojecttoml.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/config/test_setupcfg.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/contexts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/environment.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/fixtures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/external.html was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/indexes/test_links_priority/simple/foobar/index.html was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/helpers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/helpers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pbr.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/__pycache__/test_pip_install_sdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pbr.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/integration/test_pip_install_sdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/mod_with_constant.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/namespaces.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/contexts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/environment.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/fixtures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/mod_with_constant.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/namespaces.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/script-with-bom.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_archive_util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_deprecations.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_egg.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_bdist_wheel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_clib.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_ext.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_meta.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_build_py.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_config_discovery.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_core_metadata.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_depends.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_develop.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_dist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_dist_info.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_distutils_adoption.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_editable_install.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_egg_info.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_extern.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_packages.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_find_py_modules.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_glob.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_install_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_logging.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_manifest.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_namespaces.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_scripts.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_sdist.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setopt.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_setuptools.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_shutil_wrapper.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_unicode_utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_virtualenv.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_warnings.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_wheel.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/test_windows_wrappers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/text.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/__pycache__/textwrap.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/script-with-bom.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_archive_util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_deprecations.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_egg.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_bdist_wheel.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_clib.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_ext.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_meta.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_build_py.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_config_discovery.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_core_metadata.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_depends.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_develop.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_dist_info.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_dist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_distutils_adoption.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_editable_install.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_egg_info.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_extern.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_find_packages.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_find_py_modules.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_glob.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_install_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_logging.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_manifest.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_namespaces.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_scripts.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_sdist.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_setopt.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_setuptools.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_shutil_wrapper.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_unicode_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_virtualenv.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_warnings.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_wheel.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/test_windows_wrappers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/text.py was removed
  /usr/lib/python3.14/site-packages/setuptools/tests/textwrap.py was removed

--===============1203162011098518025==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-83.0.0-84.0.0.patch"

RnJvbSBlODg2N2E1YzRmZjExOTdiNmFhYzlhZDUyYzI4MDlkMWU1ZGM5MWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOSBBdWcgMjAyNiAwNTozMzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA4My4wLjAgLT4gODQuMC4wCk1JTUUtVmVyc2lvbjog
MS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0CgpTb3VyY2U6IE5FV1MucnN0Cgp2ODQuMC4wCj09PT09PT0KCkZl
YXR1cmVzCi0tLS0tLS0tCgotIE5ld2xpbmUtc2VwYXJhdGVkIGBga2V5d29yZHNgYCBhbmQgYGBw
bGF0Zm9ybXNgYCwgd2hpY2ggYXJlIGludmFsaWQgYW5kIGNvcnJ1cHQgdGhlIGdlbmVyYXRlZCBt
ZXRhZGF0YSAocHlwYS9zZXR1cHRvb2xzIzQ4ODcpLCBhcmUgbm93IGhhbmRsZWQgZm9yZ2l2aW5n
bHk6IGVhY2ggbGluZSBpcyB0cmVhdGVkIGFzIGEgc2VwYXJhdGUgaXRlbSBhbmQgYSBkZXByZWNh
dGlvbiB3YXJuaW5nIGlzIGVtaXR0ZWQuIE5ld2xpbmVzIHdlcmUgbmV2ZXIgYSB2YWxpZCBzZXBh
cmF0b3IgZm9yIHRoZXNlIGZpZWxkcyAtLSB0aGUgYG9sZCBzcGVjaWZpY2F0aW9uIDxodHRwczov
L3BlcHMucHl0aG9uLm9yZy9wZXAtMDM0NS8+YF8gc2VwYXJhdGVkIGl0ZW1zIHdpdGggc3BhY2Vz
IGFuZCB0aGUgY3VycmVudCBvbmUgdXNlcyBjb21tYXMuICgjNDg4NykKLSBgYEV4dGVuc2lvbmBg
IGlzIG5vdyBhIGRhdGFjbGFzcywgZXhwb3NpbmcgdHlwZSBhbm5vdGF0aW9ucyBmb3IgaXRzIGNv
bnN0cnVjdG9yIGFyZ3VtZW50cyBzbyBzdWJjbGFzc2VzIChlLmcuIGluIFNldHVwdG9vbHMpIGNh
biBpbmhlcml0IHRoZW0gd2l0aG91dCByZWRlY2xhcmluZyBlYWNoIHBhcmFtZXRlci4gUGFzc2lu
ZyB1bmtub3duIGtleXdvcmQgYXJndW1lbnRzIGlzIG5vdyBkZXByZWNhdGVkLiAocHlwYS9kaXN0
dXRpbHMjMzczKSAoIzUwMjIpCi0gVGhlIEMgY29tcGlsZXIgbW9kdWxlcyBub3cgZW1pdCBsb2cg
bWVzc2FnZXMgdGhyb3VnaCB0aGVpciBvd24gYGBjb21waWxlcnMuQy4qYGAgbG9nZ2VycyBpbnN0
ZWFkIG9mIHRoZSBkaXN0dXRpbHMgcm9vdCBsb2dnZXIsIHBhcnQgb2YgZGVjb3VwbGluZyB0aGUg
Y29tcGlsZXJzIHBhY2thZ2UgZnJvbSBkaXN0dXRpbHMuIFRoZSBsb2dnZXIgbmFtZXMgYXJlIG5v
cm1hbGl6ZWQgdG8gYSBzdGFibGUgYGBjb21waWxlcnMuQy4qYGAgcHJlZml4IHNvIHRoZXkgcmVt
YWluIGNvbnN0YW50IGFzIHRoZSBwYWNrYWdlIG1pZ3JhdGVzIHRvd2FyZCBhIHN0YW5kYWxvbmUg
YGBjb21waWxlcnMuQ2BgIGRpc3RyaWJ1dGlvbi4gKCM1MjY2KQotIFRoZSBDIGNvbXBpbGVycyBn
YWluZWQgYSBgYENvbXBpbGVyLmNhbGxgYCBtZXRob2QgLS0gYSB0aGluIHdyYXBwZXIgb3ZlciBg
YHN1YnByb2Nlc3MuY2hlY2tfY2FsbGBgICh3aXRoIG1hY09TIGRlcGxveW1lbnQtdGFyZ2V0IGVu
diBpbmplY3Rpb24pIHRoYXQgaXMgdGhlIG1vZGVybiByZXBsYWNlbWVudCBmb3IgYGBDb21waWxl
ci5zcGF3bmBgLiBUaGUgY29tcGlsZXJzIG5vIGxvbmdlciBkZXBlbmQgb24gYGBkaXN0dXRpbHMu
c3Bhd25gYCwgYGBkaXN0dXRpbHMuZGlyX3V0aWxgYCwgYGBkaXN0dXRpbHMuZmlsZV91dGlsYGAs
IGBgZGlzdHV0aWxzLl9tb2RpZmllZGBgLCBvciBgYGRpc3R1dGlscy51dGlsLmV4ZWN1dGVgYC9g
YHNwbGl0X3F1b3RlZGBgOiB0aGUgZ2VuZXJpYyBgYG5ld2VyYGAvYGBuZXdlcl9ncm91cGBgIGFu
ZCBgYHNwbGl0X3F1b3RlZGBgIGhlbHBlcnMgYXJlIHZlbmRvcmVkIGludG8gdGhlIGBgY29tcGls
ZXJzYGAgcGFja2FnZSwgYW5kIGBgQ29tcGlsZXIubWtwYXRoYGAvYGBtb3ZlX2ZpbGVgYC9gYGV4
ZWN1dGVgYCBhcmUgaW1wbGVtZW50ZWQgZGlyZWN0bHkgb24gdGhlIHN0YW5kYXJkIGxpYnJhcnkg
KGBgb3MubWFrZWRpcnNgYC9gYHNodXRpbC5tb3ZlYGApLiBUaGUgbWV0aG9kcyBhcmUgcmV0YWlu
ZWQgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuICgjNTI2NykKLSBUaGUgY29tcGlsZXJzIG5v
IGxvbmdlciBkZXBlbmQgb24gYGBkaXN0dXRpbHMudXRpbGBgLCBgYGRpc3R1dGlscy52ZXJzaW9u
YGAsIGBgZGlzdHV0aWxzLmNvbXBhdGBgLCBvciBgYGRpc3R1dGlscy5fbWFjb3NfY29tcGF0YGAu
IFRoZSBwbGF0Zm9ybS1pZGVudGlmaWNhdGlvbiBoZWxwZXJzIChgYGdldF9wbGF0Zm9ybWBgL2Bg
Z2V0X2hvc3RfcGxhdGZvcm1gYC9gYGlzX21pbmd3YGApIG5vdyBsaXZlIGluIGBgZGlzdHV0aWxz
LmNvbXBpbGVycy5wbGF0Zm9ybS5kZXRlY3RgYCBhbmQgdGhlIG1hY09TIGRlcGxveW1lbnQtdGFy
Z2V0IGxvZ2ljIGFuZCBgYGNvbXBpbGVyX2ZpeHVwYGAgaW4gYGBkaXN0dXRpbHMuY29tcGlsZXJz
LnBsYXRmb3JtLm1hY29zYGA7IGBgQ3lnd2luQ0NvbXBpbGVyLmdjY192ZXJzaW9uYGAgcmV0dXJu
cyBhIGBgcGFja2FnaW5nLnZlcnNpb24uVmVyc2lvbmBgLiBgYGRpc3R1dGlscy51dGlsYGAgcmUt
ZXhwb3J0cyB0aGUgcGxhdGZvcm0vbWFjT1MgaGVscGVycyBmcm9tIHRoZWlyIG5ldyBob21lcyBm
b3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSByYXRoZXIgdGhhbiBrZWVwaW5nIGR1cGxpY2F0ZSBj
b3BpZXMuIChzeXNjb25maWcgbG9va3VwcyBzdGlsbCByb3V0ZSB0aHJvdWdoIGRpc3R1dGlscyBw
ZW5kaW5nIGl0cyBvd24gZGVjb3VwbGluZy4pICgjNTI2OCkKLSBUaGUgY29tcGlsZXJzIG5vdyBy
ZWFkIHRoZWlyIGJ1aWxkIGNvbmZpZ3VyYXRpb24gZnJvbSB0aGUgc3RhbmRhcmQgbGlicmFyeSdz
IGBgc3lzY29uZmlnYGAgaW5zdGVhZCBvZiBgYGRpc3R1dGlscy5zeXNjb25maWdgYC4gUGVyLWNv
bXBpbGVyIGN1c3RvbWl6YXRpb24gLS0gcHJldmlvdXNseSBgYGRpc3R1dGlscy5zeXNjb25maWcu
Y3VzdG9taXplX2NvbXBpbGVyYGAgLS0gaGFzIG1vdmVkIGludG8gYGBDb21waWxlci5jb25maWd1
cmVfc3lzdGVtKClgYDogYSBuby1vcCBvbiB0aGUgYmFzZSBjbGFzcywgd2l0aCBgYFVuaXhDQ29t
cGlsZXJgYCBhcHBseWluZyB0aGUgY29tcGlsZXIvZmxhZy9hcmNoaXZlciBzZXR0aW5ncyBDUHl0
aG9uIHJlY29yZGVkIGluIGBgc3lzY29uZmlnYGAgKGFuZCB0aGUgdXN1YWwgYGBDQ2BgL2BgQ0ZM
QUdTYGAvYGBMRFNIQVJFRGBgL+KApiBlbnZpcm9ubWVudCBvdmVycmlkZXMpLiBgYGRpc3R1dGls
cy5zeXNjb25maWcuY3VzdG9taXplX2NvbXBpbGVyYGAgaXMgcmV0YWluZWQgYXMgYSB0aGluIHdy
YQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRo
ZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0byB0aGUgQVVI
IGVtYWlsXQotLS0KIC4uLjEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJs
ZS10by1zdWJzdGl0ZS5wYXRjaCB8IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzgzLjAuMC5i
YiA9PiBweXRob24zLXNldHVwdG9vbHNfODQuMC4wLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29sc184My4wLjAuYmIgPT4gcHl0aG9uMy1z
ZXR1cHRvb2xzXzg0LjAuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmln
LnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmln
LnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gKaW5kZXggNmUyNDBjNDdkMi4u
ZjYzMTNmYjFhOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDE1ZmY2OGU3
OTI5OGM1MTQ4MzUwY2YzYmYwYjcyZDFkNDA5YmE0YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZmU2NTE1MjFiOWQ5NzBhODQ0MzJiMzdkMjczMTkzMmE0ODYyZGViMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXgu
ZGU+CiBEYXRlOiBXZWQsIDExIE1heSAyMDIyIDIxOjQxOjE0ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIF9kaXN0dXRpbHMvc3lzY29uZmlnLnB5OiBtYWtlIGl0IHBvc3NpYmxlIHRvIHN1YnN0aXRl
IHRoZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHNfODMuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHNfODQuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgzLjAuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNf
ODQuMC4wLmJiCmluZGV4IGU1NTkzYzlmNzMuLjY0OGIwODRhMjcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgzLjAuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184NC4wLjAu
YmIKQEAgLTExLDcgKzExLDcgQEAgQ1ZFX1BST0RVQ1QgPSAicHl0aG9uMy1zZXR1cHRvb2xzIHB5
dGhvbjpzZXR1cHRvb2xzIgogU1JDX1VSSSArPSAiIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0
Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwMjViY2NiYmYwZmEwNWI2MTkyYmM2NGFlMWU3
YjE2ZTAwMWZkNmQ2ZDRkNWRlMDNjOTdiMWMxYWRlNTIzYmVmIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImY0Njk1YzIxMjU3ZjBkOWI1MzdlYzI2OTJjOTQxZDAyZWUxNDNiN2NjMTI3Njk0MTM0OWE1
NDY1NzNiMmVmNzMiCiAKIGRvX2luc3RhbGw6YXBwZW5kKCkgewogCSMgc2V0dXB0b29scyBzaGlw
cyBXaW5kb3dzIGxhdW5jaGVyIGV4ZWN1dGFibGVzIChjbGkqLmV4ZSwgZ3VpKi5leGUpLgotLSAK
Mi40Ny4xCgo=

--===============1203162011098518025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-setuptools-changelog.txt"

Q2hhbmdlbG9nIGZvciBweXRob24zLXNldHVwdG9vbHM6IDgzLjAuMCAtPiA4NC4wLjAKU291cmNl
OiBORVdTLnJzdAoKdjg0LjAuMAo9PT09PT09CgpGZWF0dXJlcwotLS0tLS0tLQoKLSBOZXdsaW5l
LXNlcGFyYXRlZCBgYGtleXdvcmRzYGAgYW5kIGBgcGxhdGZvcm1zYGAsIHdoaWNoIGFyZSBpbnZh
bGlkIGFuZCBjb3JydXB0IHRoZSBnZW5lcmF0ZWQgbWV0YWRhdGEgKHB5cGEvc2V0dXB0b29scyM0
ODg3KSwgYXJlIG5vdyBoYW5kbGVkIGZvcmdpdmluZ2x5OiBlYWNoIGxpbmUgaXMgdHJlYXRlZCBh
cyBhIHNlcGFyYXRlIGl0ZW0gYW5kIGEgZGVwcmVjYXRpb24gd2FybmluZyBpcyBlbWl0dGVkLiBO
ZXdsaW5lcyB3ZXJlIG5ldmVyIGEgdmFsaWQgc2VwYXJhdG9yIGZvciB0aGVzZSBmaWVsZHMgLS0g
dGhlIGBvbGQgc3BlY2lmaWNhdGlvbiA8aHR0cHM6Ly9wZXBzLnB5dGhvbi5vcmcvcGVwLTAzNDUv
PmBfIHNlcGFyYXRlZCBpdGVtcyB3aXRoIHNwYWNlcyBhbmQgdGhlIGN1cnJlbnQgb25lIHVzZXMg
Y29tbWFzLiAoIzQ4ODcpCi0gYGBFeHRlbnNpb25gYCBpcyBub3cgYSBkYXRhY2xhc3MsIGV4cG9z
aW5nIHR5cGUgYW5ub3RhdGlvbnMgZm9yIGl0cyBjb25zdHJ1Y3RvciBhcmd1bWVudHMgc28gc3Vi
Y2xhc3NlcyAoZS5nLiBpbiBTZXR1cHRvb2xzKSBjYW4gaW5oZXJpdCB0aGVtIHdpdGhvdXQgcmVk
ZWNsYXJpbmcgZWFjaCBwYXJhbWV0ZXIuIFBhc3NpbmcgdW5rbm93biBrZXl3b3JkIGFyZ3VtZW50
cyBpcyBub3cgZGVwcmVjYXRlZC4gKHB5cGEvZGlzdHV0aWxzIzM3MykgKCM1MDIyKQotIFRoZSBD
IGNvbXBpbGVyIG1vZHVsZXMgbm93IGVtaXQgbG9nIG1lc3NhZ2VzIHRocm91Z2ggdGhlaXIgb3du
IGBgY29tcGlsZXJzLkMuKmBgIGxvZ2dlcnMgaW5zdGVhZCBvZiB0aGUgZGlzdHV0aWxzIHJvb3Qg
bG9nZ2VyLCBwYXJ0IG9mIGRlY291cGxpbmcgdGhlIGNvbXBpbGVycyBwYWNrYWdlIGZyb20gZGlz
dHV0aWxzLiBUaGUgbG9nZ2VyIG5hbWVzIGFyZSBub3JtYWxpemVkIHRvIGEgc3RhYmxlIGBgY29t
cGlsZXJzLkMuKmBgIHByZWZpeCBzbyB0aGV5IHJlbWFpbiBjb25zdGFudCBhcyB0aGUgcGFja2Fn
ZSBtaWdyYXRlcyB0b3dhcmQgYSBzdGFuZGFsb25lIGBgY29tcGlsZXJzLkNgYCBkaXN0cmlidXRp
b24uICgjNTI2NikKLSBUaGUgQyBjb21waWxlcnMgZ2FpbmVkIGEgYGBDb21waWxlci5jYWxsYGAg
bWV0aG9kIC0tIGEgdGhpbiB3cmFwcGVyIG92ZXIgYGBzdWJwcm9jZXNzLmNoZWNrX2NhbGxgYCAo
d2l0aCBtYWNPUyBkZXBsb3ltZW50LXRhcmdldCBlbnYgaW5qZWN0aW9uKSB0aGF0IGlzIHRoZSBt
b2Rlcm4gcmVwbGFjZW1lbnQgZm9yIGBgQ29tcGlsZXIuc3Bhd25gYC4gVGhlIGNvbXBpbGVycyBu
byBsb25nZXIgZGVwZW5kIG9uIGBgZGlzdHV0aWxzLnNwYXduYGAsIGBgZGlzdHV0aWxzLmRpcl91
dGlsYGAsIGBgZGlzdHV0aWxzLmZpbGVfdXRpbGBgLCBgYGRpc3R1dGlscy5fbW9kaWZpZWRgYCwg
b3IgYGBkaXN0dXRpbHMudXRpbC5leGVjdXRlYGAvYGBzcGxpdF9xdW90ZWRgYDogdGhlIGdlbmVy
aWMgYGBuZXdlcmBgL2BgbmV3ZXJfZ3JvdXBgYCBhbmQgYGBzcGxpdF9xdW90ZWRgYCBoZWxwZXJz
IGFyZSB2ZW5kb3JlZCBpbnRvIHRoZSBgYGNvbXBpbGVyc2BgIHBhY2thZ2UsIGFuZCBgYENvbXBp
bGVyLm1rcGF0aGBgL2BgbW92ZV9maWxlYGAvYGBleGVjdXRlYGAgYXJlIGltcGxlbWVudGVkIGRp
cmVjdGx5IG9uIHRoZSBzdGFuZGFyZCBsaWJyYXJ5IChgYG9zLm1ha2VkaXJzYGAvYGBzaHV0aWwu
bW92ZWBgKS4gVGhlIG1ldGhvZHMgYXJlIHJldGFpbmVkIGZvciBiYWNrd2FyZCBjb21wYXRpYmls
aXR5LiAoIzUyNjcpCi0gVGhlIGNvbXBpbGVycyBubyBsb25nZXIgZGVwZW5kIG9uIGBgZGlzdHV0
aWxzLnV0aWxgYCwgYGBkaXN0dXRpbHMudmVyc2lvbmBgLCBgYGRpc3R1dGlscy5jb21wYXRgYCwg
b3IgYGBkaXN0dXRpbHMuX21hY29zX2NvbXBhdGBgLiBUaGUgcGxhdGZvcm0taWRlbnRpZmljYXRp
b24gaGVscGVycyAoYGBnZXRfcGxhdGZvcm1gYC9gYGdldF9ob3N0X3BsYXRmb3JtYGAvYGBpc19t
aW5nd2BgKSBub3cgbGl2ZSBpbiBgYGRpc3R1dGlscy5jb21waWxlcnMucGxhdGZvcm0uZGV0ZWN0
YGAgYW5kIHRoZSBtYWNPUyBkZXBsb3ltZW50LXRhcmdldCBsb2dpYyBhbmQgYGBjb21waWxlcl9m
aXh1cGBgIGluIGBgZGlzdHV0aWxzLmNvbXBpbGVycy5wbGF0Zm9ybS5tYWNvc2BgOyBgYEN5Z3dp
bkNDb21waWxlci5nY2NfdmVyc2lvbmBgIHJldHVybnMgYSBgYHBhY2thZ2luZy52ZXJzaW9uLlZl
cnNpb25gYC4gYGBkaXN0dXRpbHMudXRpbGBgIHJlLWV4cG9ydHMgdGhlIHBsYXRmb3JtL21hY09T
IGhlbHBlcnMgZnJvbSB0aGVpciBuZXcgaG9tZXMgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkg
cmF0aGVyIHRoYW4ga2VlcGluZyBkdXBsaWNhdGUgY29waWVzLiAoc3lzY29uZmlnIGxvb2t1cHMg
c3RpbGwgcm91dGUgdGhyb3VnaCBkaXN0dXRpbHMgcGVuZGluZyBpdHMgb3duIGRlY291cGxpbmcu
KSAoIzUyNjgpCi0gVGhlIGNvbXBpbGVycyBub3cgcmVhZCB0aGVpciBidWlsZCBjb25maWd1cmF0
aW9uIGZyb20gdGhlIHN0YW5kYXJkIGxpYnJhcnkncyBgYHN5c2NvbmZpZ2BgIGluc3RlYWQgb2Yg
YGBkaXN0dXRpbHMuc3lzY29uZmlnYGAuIFBlci1jb21waWxlciBjdXN0b21pemF0aW9uIC0tIHBy
ZXZpb3VzbHkgYGBkaXN0dXRpbHMuc3lzY29uZmlnLmN1c3RvbWl6ZV9jb21waWxlcmBgIC0tIGhh
cyBtb3ZlZCBpbnRvIGBgQ29tcGlsZXIuY29uZmlndXJlX3N5c3RlbSgpYGA6IGEgbm8tb3Agb24g
dGhlIGJhc2UgY2xhc3MsIHdpdGggYGBVbml4Q0NvbXBpbGVyYGAgYXBwbHlpbmcgdGhlIGNvbXBp
bGVyL2ZsYWcvYXJjaGl2ZXIgc2V0dGluZ3MgQ1B5dGhvbiByZWNvcmRlZCBpbiBgYHN5c2NvbmZp
Z2BgIChhbmQgdGhlIHVzdWFsIGBgQ0NgYC9gYENGTEFHU2BgL2BgTERTSEFSRURgYC/igKYgZW52
aXJvbm1lbnQgb3ZlcnJpZGVzKS4gYGBkaXN0dXRpbHMuc3lzY29uZmlnLmN1c3RvbWl6ZV9jb21w
aWxlcmBgIGlzIHJldGFpbmVkIGFzIGEgdGhpbiB3cmFwcGVyIHRoYXQgY2FsbHMgYGBjb21waWxl
ci5jb25maWd1cmVfc3lzdGVtKClgYC4gKCM1MjY5KQoKQnVnZml4ZXMKLS0tLS0tLS0KCi0gVGhl
IE1TVkMgbGlua2VyIG5vdyBwYXNzZXMgaXRzIGFyZ3VtZW50cyB0aHJvdWdoIGEgcmVzcG9uc2Ug
ZmlsZSB3aGVuIHRoZSBjb21tYW5kIGxpbmUgd291bGQgZXhjZWVkIHRoZSBXaW5kb3dzIG1heGlt
dW0gbGVuZ3RoLCBmaXhpbmcgZmFpbHVyZXMgd2hlbiBsaW5raW5nIGEgbGFyZ2UgbnVtYmVyIG9m
IG9iamVjdHMuICgjNDE3NykKLSBUaGUgQ3lnd2luIGFuZCBNaW5HVyBjb21waWxlcnMgbm93IHBh
c3MgYGAtTzFgYCBpbnN0ZWFkIG9mIGEgYmFyZSBgYC1PYGAuIFRoZSB0d28gYXJlIGVxdWl2YWxl
bnQgdG8gR0NDLCBidXQgYGBjYzFgYCByZWplY3RlZCB0aGUgYmFyZSBmb3JtIHdoZW4gYnVpbGRp
bmcgMzItYml0IGV4dGVuc2lvbnMgd2l0aCBgYC1tMzJgYC4gLS0gYnkgOnVzZXI6YGRjaGF1ZGhh
cmk3MTc3YCAoIzQ4NzMpCi0gYGBjb3B5X2ZpbGVgYCBub3cgcHJlc2VydmVzIHRoZSBmdWxsIHBy
ZWNpc2lvbiBvZiB0aGUgc291cmNlJ3MgbW9kaWZpY2F0aW9uIHRpbWUsIHNvIGEgY29weSBpcyBu
byBsb25nZXIgY29uc2lkZXJlZCBvbGRlciB0aGFuIGl0cyBzb3VyY2Ugb24gZmlsZXN5c3RlbXMg
d2l0aCBzdWItc2Vjb25kIHRpbWVzdGFtcCByZXNvbHV0aW9uLiAocHlwYS9kaXN0dXRpbHMjMzc5
KSAoIzUwNzkpCi0gU2V0dXB0b29scyB3aGVlbHMgbm8gbG9uZ2VyIGJ1bmRsZWQgdGhlIHByb2pl
Y3QncyBvd24gdGVzdCBtb2R1bGVzLiAtLSBieSA6dXNlcjpgaXRzY2xvdWQwYCAoIzUyMTIpCi0g
YGBidWlsZF9leHRgYCBubyBsb25nZXIgZmFpbHMgd2hlbiBjcm9zcy1jb21waWxpbmcgd2l0aCBh
IGNvbXBpbGVyIG90aGVyIHRoYW4gTVNWQyAoc3VjaCBhcyBNaW5HVykuIGBgQ29tcGlsZXJgYCBu
b3cgcHJvdmlkZXMgYSBuby1vcCBgYGluaXRpYWxpemUoKWBgIHRoYXQgbm9uLU1TVkMgY29tcGls
ZXJzIGluaGVyaXQuIChweXBhL2Rpc3R1dGlscyMzOTkpCgpJbXByb3ZlZCBEb2N1bWVudGF0aW9u
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi0gQ2xhcmlmaWVkIHdoYXQgImNvcnJlc3BvbmQgZXhh
Y3RseSB0byB0aGUgZGlyZWN0b3J5IHN0cnVjdHVyZSIgbWVhbnMgaW4KICB0aGUgYGBwYWNrYWdl
c2BgIHNlY3Rpb24gb2YgdGhlIFBhY2thZ2UgRGlzY292ZXJ5IHVzZXIgZ3VpZGUuICgjNDEwOSkK
LSBEb2N1bWVudGVkIGhvdyBgYGJkaXN0X3doZWVsYGAncyBgYHB5X2xpbWl0ZWRfYXBpYGAgb3B0
aW9uIGNvbnRyb2xzCiAgYGBhYmkzYGAgd2hlZWwgdGFnZ2luZyBmb3IgZXh0ZW5zaW9uIG1vZHVs
ZXMgLS0gYnkgOnVzZXI6YEhpbWFuc2h1YWdyYXdhbDRgICgjNDc0MSkKCkRlcHJlY2F0aW9ucyBh
bmQgUmVtb3ZhbHMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKLSBgYENvbXBpbGVyLnNwYXdu
YGAgaXMgZGVwcmVjYXRlZCBpbiBmYXZvciBvZiB0aGUgbmV3IGBgQ29tcGlsZXIuY2FsbGBgLiBg
YGNhbGxgYCByYWlzZXMgbmF0aXZlIGBgc3VicHJvY2Vzc2BgIGV4Y2VwdGlvbnM7IGBgc3Bhd25g
YCByZW1haW5zIGFzIGEgc2hpbSB0aGF0IGVtaXRzIGEgYGBEZXByZWNhdGlvbldhcm5pbmdgYCBh
bmQgdHJhbnNsYXRlcyB0aGVtIHRvIGBgRGlzdHV0aWxzRXhlY0Vycm9yYGAuIFRoZSBNU1ZDIGBg
c3Bhd25gYCBjb21wYXRpYmlsaXR5IHNoaW0gZm9yIHRoaXJkLXBhcnR5IG1vbmtleXBhdGNoZXMg
cHJlZGF0aW5nIHRoZSBgYGVudmBgIGFyZ3VtZW50IChudW1weS5kaXN0dXRpbHMgYmVmb3JlIDEu
MTksIHBlciBweXBhL2Rpc3R1dGlscyMxNSkgaGFzIGJlZW4gcmVtb3ZlZC4gYGBkaXN0dXRpbHMu
c3Bhd24uc3Bhd25gYCBpcyBsaWtld2lzZSByZWR1Y2VkIHRvIGEgdGhpbiB3cmFwcGVyIGFyb3Vu
ZCBgYHN1YnByb2Nlc3MuY2hlY2tfY2FsbGBgOiBpdCBubyBsb25nZXIgcmVzb2x2ZXMgYGBjbWRb
MF1gYCB2aWEgYGBzaHV0aWwud2hpY2hgYCAoYGBzdWJwcm9jZXNzYGAgc2VhcmNoZXMgYGBQQVRI
YGAgaXRzZWxmKSBub3IgaW5qZWN0cyBgYE1BQ09TWF9ERVBMT1lNRU5UX1RBUkdFVGBgICh0aGF0
IG5vdyBsaXZlcyB3aXRoIHRoZSBjb21waWxlcnMsIHRoZSBvbmx5IGNhbGxlcnMgdG8gd2hpY2gg
aXQgYXBwbGllZCkuICgjNTI2NykKLSBCdWlsZGluZyBhbiBleHRlbnNpb24gd2l0aCBhIGBgTUFD
T1NYX0RFUExPWU1FTlRfVEFSR0VUYGAgbG93ZXIgdGhhbiB0aGUgaW50ZXJwcmV0ZXIncyBjb25m
aWd1cmVkIHZhbHVlIG5vdyByYWlzZXMgYGBjb21waWxlcnMuZXJyb3JzLlBsYXRmb3JtRXJyb3Jg
YCBpbnN0ZWFkIG9mIGBgZGlzdHV0aWxzLmVycm9ycy5EaXN0dXRpbHNQbGF0Zm9ybUVycm9yYGAg
KHRoZSBtYWNPUyBkZXBsb3ltZW50LXRhcmdldCBjaGVjayBtb3ZlZCBpbnRvIHRoZSBjb21waWxl
cnMgcGFja2FnZSkuIGBgQ3lnd2luQ0NvbXBpbGVyLmdjY192ZXJzaW9uYGAgcmV0dXJucyBhIGBg
cGFja2FnaW5nLnZlcnNpb24uVmVyc2lvbmBgIHJhdGhlciB0aGFuIHRoZSByZW1vdmVkIGBgZGlz
dHV0aWxzLnZlcnNpb24uTG9vc2VWZXJzaW9uYGAuIENvbXBsZXRpbmcgdGhlIHRyYW5zaXRpb24g
YmVndW4gaW4gcHlwYS9kaXN0dXRpbHMjMjQ2LCBgYFVuaXhDQ29tcGlsZXIucnVudGltZV9saWJy
YXJ5X2Rpcl9vcHRpb25gYCBub3cgcmV0dXJucyB0aGUgYGBbIi1XbCwtLWVuYWJsZS1uZXctZHRh
Z3MiLCAiLVdsLC1ycGF0aCw8ZGlyPiJdYGAgbGlzdCBkaXJlY3RseSBmb3IgR05VIGxkIHJhdGhl
ciB0aGFuIGNvbGxhcHNpbmcgaXQgaW50byBhIHNpbmdsZSBzdHJpbmcsIGFuZCB0aGUgdGVtcG9y
YXJ5IGBgZGlzdHV0aWxzLmNvbXBhdC5jb25zb2xpZGF0ZV9saW5rZXJfYXJnc2BgIHNoaW0gaGFz
IGJlZW4gcmVtb3ZlZC4gKCM1MjY4KQotIFRoZSBjb21waWxlcnMgbm93IGRlZmluZSB0aGVpciBv
d24gZXhjZXB0aW9uIHZvY2FidWxhcnkgaW5zdGVhZCBvZiBib3Jyb3dpbmcgZGlzdHV0aWxzJyBm
cmFtZXdvcmsgZXJyb3JzLiBMYW5ndWFnZS1hZ25vc3RpYyBleGNlcHRpb25zIChgYEVycm9yYGAs
IGBgVW5rbm93bkZpbGVUeXBlYGAsIGFuZCBhIG5ldyBgYFBsYXRmb3JtRXJyb3JgYCkgbGl2ZSBh
dCBgYGRpc3R1dGlscy5jb21waWxlcnMuZXJyb3JzYGAsIGxlYXZpbmcgcm9vbSBmb3IgZnV0dXJl
IGBgY29tcGlsZXJzLjxsYW5ndWFnZT5gYCBzaWJsaW5nczsgdGhlIEMvQysrLXNwZWNpZmljIGBg
Q29tcGlsZUVycm9yYGAvYGBMaW5rRXJyb3JgYC9gYExpYkVycm9yYGAvYGBQcmVwcm9jZXNzRXJy
b3JgYCByZW1haW4gaW4gYGBkaXN0dXRpbHMuY29tcGlsZXJzLkMuZXJyb3JzYGAuIFRoZSBjb21w
aWxlcnMgbm93IHJhaXNlIGBgY29tcGlsZXJzLmVycm9ycy5QbGF0Zm9ybUVycm9yYGAgd2hlcmUg
dGhleSBwcmV2aW91c2x5IHJhaXNlZCBgYGRpc3R1dGlscy5lcnJvcnMuRGlzdHV0aWxzUGxhdGZv
cm1FcnJvcmBgL2BgRGlzdHV0aWxzTW9kdWxlRXJyb3JgYCwgYW5kIGBgY29tcGlsZXJzLl9tb2Rp
ZmllZC5uZXdlcmBgIHJhaXNlcyB0aGUgc3RkbGliIGBgRmlsZU5vdEZvdW5kRXJyb3JgYC4gYGBk
aXN0dXRpbHMuZXJyb3JzYGAga2VlcHMgaXRzIG93biBmcmFtZXdvcmsgZXhjZXB0aW9ucyBhbmQg
cmUtZXhwb3J0cyB0aGUgY29tcGlsZXIgb25lcyAoYGBDQ29tcGlsZXJFcnJvcmBgLCBgYENvbXBp
bGVFcnJvcmBgLCBldGMuKSBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eTsgYmVjYXVzZSBgYEND
b21waWxlckVycm9yYGAgaXMgYGBjb21waWxlcnMuZXJyb3JzLkVycm9yYGAsIGNvZGUgY2F0Y2hp
bmcgaXQgKGFzIGRpc3R1dGlscycgdG9wLWxldmVsIGhhbmRsZXJzIGRvKSBzdGlsbCBjYXRjaGVz
IHRoZSBuZXcgYGBQbGF0Zm9ybUVycm9yYGAuICgjNTI3MCkKLSBgYGN1c3RvbWl6ZV9jb21waWxl
cmBgIG5vdyBhc3NlcnRzIHRoYXQgdGhlIGNvbXBpbGVyLXJlbGF0ZWQgY29uZmlnIHZhcmlhYmxl
cyAoYGBDQ2BgLCBgYENYWGBgLCBgYENGTEFHU2BgLCBldGMuKSByZXNvbHZlIHRvIHN0cmluZ3Ms
IHJhaXNpbmcgYGBBc3NlcnRpb25FcnJvcmBgIGlmIGFueSBhcmUgdW5leHBlY3RlZGx5IGBgTm9u
ZWBgIHJhdGhlciB0aGFuIGZhaWxpbmcgbGF0ZXIgd2l0aCBhIGxlc3MgY2xlYXIgZXJyb3IuIChw
eXBhL2Rpc3R1dGlscyMzNjMpCg==

--===============1203162011098518025==--


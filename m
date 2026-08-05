Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB74C561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:47:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34095.1785908851605754606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hn8EBs6w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PiB/4keW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fd0766ded-e86f93f1-b35f-4399-a858-7f23240342aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785908850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=GyKZQb/Ia9oqmxFeI6dJm3wgPavGuulxxMl0NbPyycw=;
	b=Hn8EBs6wtwdI2HBNRNMg+lmioIzGYy/r8L6yfDoo3DIvy4C1jU+DCJo0pxbR8swU
	0fsmcer4U8md4y6ziTpD0OE3dLfhqakmu1MK0nfWn/NCiN3TvifKuFkCO07KcPcsYET
	hmE8m0ui5zuY9iVo+5b0weqygvsuXunB7RTsBK1E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785908850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=GyKZQb/Ia9oqmxFeI6dJm3wgPavGuulxxMl0NbPyycw=;
	b=PiB/4keW1bw+930FltZugJgY66bUQrwfurMU8bp5MdB4uEQX+RIWBVGulcyxhL6w
	MkIo6y9F2/4qYfY+tUNTQ2sZtjT6KSvzpTtuKxMDlfxOZVxvkJLtsa/vWE6CrMAtj7R
	gvRsaLZADy/xntQZFYlrwdWtTH2p+LjwJaNjnUoM=
Content-Type: multipart/mixed; boundary="===============6488254033898372711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxfont2: upgrading to 2.0.9 SUCCEEDED
Message-ID: <0101019fd0766ded-e86f93f1-b35f-4399-a858-7f23240342aa-000000@us-west-2.amazonses.com>
Date: Wed, 5 Aug 2026 05:47:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242813

--===============6488254033898372711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxfont2* to *2.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxfont2-upgrade-2.0.8-2.0.9.patch
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
From 83bc98b2fbd88b712a646d4124572300f35c677a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Aug 2026 05:09:07 +0000
Subject: [PATCH] libxfont2: upgrade 2.0.8 -> 2.0.9

Source: ChangeLog

commit 975cc6526e892c6fad8fa49d0fef58565fbaa003
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Wed Aug 5 10:57:21 2026 +1000

    libXfont2 2.0.9

    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

commit c2d222bb22c623d8a40f3275077fc7e6617f2c8a
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon Jul 13 15:50:09 2026 +1000

    fserve: bounds-check cumulative glyph data writes in fs_read_glyphs

    fs_read_glyphs() copies each glyph's bitmap into a single allbits
    buffer allocated to rep->nbytes bytes. The per-glyph guard validates
    only that the source slice (position, length) lies within the pbitmaps
    source buffer. It does not check whether the running destination cursor
    has exceeded the allocation.

    A malicious font server can send overlapping source offsets (e.g. 1000
    glyphs each referencing {position:0, length:64} with nbytes=64). Each
    individual source range passes validation, but the cumulative writes
    total 64000 bytes into a 64-byte destination buffer.

    Interestingly there was an unconditional debug printf in place that
    sort-of warned about this but didn't prevent this. Let's remove that and
    instead use the actual check to bail out before we run OOB.

    A regression test is included that sends 100 glyphs each referencing
    the same 64-byte source slice into a 64-byte destination buffer, and
    verifies the library rejects the overflow.

    CVE-2026-44950

    Found-by: Zhixi "Jace" Sun, independent security researcher
    Assisted-by: Claude:claude-opus-4-6
    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
    Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/36>

commit 668fea81f40bcb48ec67fb55d0b851049d265290
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon Jul 13 15:48:06 2026 +1000

    fserve: validate num_chars against encoding array size in fs_read_glyphs

    FS_QueryXExtents16 causes us to allocate the encoding[] array, later
    during the FS_QueryXBitmaps16 reply handling we fill in that array.
    There is no verification that the allocation is large enough, a
    malicious font server could send us a small numExtents and a
    large num_chars to force underallocation and OOB read/rwrite.

    A regression test is included that constructs a crafted
    FS_QueryXBitmaps16 reply with num_chars > num_encoding and verifies
    the library rejects it.

    CVE-2026-59679

    Found-by: Zhixi "Jace" Sun, independent security researcher
    Assisted-by: Claude:claude-opus-4-6
    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
    Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/36>

commit 2d4b37f525df41399cf2cd409fb97aa30c48546a
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Thu Jul 23 12:06:45 2026 +1000

    Disable fontserver support by default

    Debian has disabled this for over a dec

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../xorg-lib/{libxfont2_2.0.8.bb => libxfont2_2.0.9.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.8.bb => libxfont2_2.0.9.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
index 33cf5816e0..82ca4d5024 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
@@ -15,7 +15,7 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5"
+SRC_URI[sha256sum] = "f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.47.1


--===============6488254033898372711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PKGSIZE changed from 782296 to 607600 (-22%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PKGSIZE changed from 793993 to 659714 (-17%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PKGSIZE changed from 247218 to 193346 (-22%)

--===============6488254033898372711==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxfont2-upgrade-2.0.8-2.0.9.patch"

RnJvbSA4M2JjOThiMmZiZDg4YjcxMmE2NDZkNDEyNDU3MjMwMGYzNWM2NzdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBBdWcgMjAyNiAwNTowOTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ynhmb250MjogdXBncmFkZSAyLjAuOCAtPiAyLjAuOQoKU291cmNlOiBDaGFuZ2VMb2cKCmNvbW1p
dCA5NzVjYzY1MjZlODkyYzZmYWQ4ZmE0OWQwZmVmNTg1NjVmYmFhMDAzCkF1dGhvcjogUGV0ZXIg
SHV0dGVyZXIgPHBldGVyLmh1dHRlcmVyQHdoby10Lm5ldD4KRGF0ZTogICBXZWQgQXVnIDUgMTA6
NTc6MjEgMjAyNiArMTAwMAoKICAgIGxpYlhmb250MiAyLjAuOQoKICAgIFNpZ25lZC1vZmYtYnk6
IFBldGVyIEh1dHRlcmVyIDxwZXRlci5odXR0ZXJlckB3aG8tdC5uZXQ+Cgpjb21taXQgYzJkMjIy
YmIyMmM2MjNkOGE0MGYzMjc1MDc3ZmM3ZTY2MTdmMmM4YQpBdXRob3I6IFBldGVyIEh1dHRlcmVy
IDxwZXRlci5odXR0ZXJlckB3aG8tdC5uZXQ+CkRhdGU6ICAgTW9uIEp1bCAxMyAxNTo1MDowOSAy
MDI2ICsxMDAwCgogICAgZnNlcnZlOiBib3VuZHMtY2hlY2sgY3VtdWxhdGl2ZSBnbHlwaCBkYXRh
IHdyaXRlcyBpbiBmc19yZWFkX2dseXBocwoKICAgIGZzX3JlYWRfZ2x5cGhzKCkgY29waWVzIGVh
Y2ggZ2x5cGgncyBiaXRtYXAgaW50byBhIHNpbmdsZSBhbGxiaXRzCiAgICBidWZmZXIgYWxsb2Nh
dGVkIHRvIHJlcC0+bmJ5dGVzIGJ5dGVzLiBUaGUgcGVyLWdseXBoIGd1YXJkIHZhbGlkYXRlcwog
ICAgb25seSB0aGF0IHRoZSBzb3VyY2Ugc2xpY2UgKHBvc2l0aW9uLCBsZW5ndGgpIGxpZXMgd2l0
aGluIHRoZSBwYml0bWFwcwogICAgc291cmNlIGJ1ZmZlci4gSXQgZG9lcyBub3QgY2hlY2sgd2hl
dGhlciB0aGUgcnVubmluZyBkZXN0aW5hdGlvbiBjdXJzb3IKICAgIGhhcyBleGNlZWRlZCB0aGUg
YWxsb2NhdGlvbi4KCiAgICBBIG1hbGljaW91cyBmb250IHNlcnZlciBjYW4gc2VuZCBvdmVybGFw
cGluZyBzb3VyY2Ugb2Zmc2V0cyAoZS5nLiAxMDAwCiAgICBnbHlwaHMgZWFjaCByZWZlcmVuY2lu
ZyB7cG9zaXRpb246MCwgbGVuZ3RoOjY0fSB3aXRoIG5ieXRlcz02NCkuIEVhY2gKICAgIGluZGl2
aWR1YWwgc291cmNlIHJhbmdlIHBhc3NlcyB2YWxpZGF0aW9uLCBidXQgdGhlIGN1bXVsYXRpdmUg
d3JpdGVzCiAgICB0b3RhbCA2NDAwMCBieXRlcyBpbnRvIGEgNjQtYnl0ZSBkZXN0aW5hdGlvbiBi
dWZmZXIuCgogICAgSW50ZXJlc3RpbmdseSB0aGVyZSB3YXMgYW4gdW5jb25kaXRpb25hbCBkZWJ1
ZyBwcmludGYgaW4gcGxhY2UgdGhhdAogICAgc29ydC1vZiB3YXJuZWQgYWJvdXQgdGhpcyBidXQg
ZGlkbid0IHByZXZlbnQgdGhpcy4gTGV0J3MgcmVtb3ZlIHRoYXQgYW5kCiAgICBpbnN0ZWFkIHVz
ZSB0aGUgYWN0dWFsIGNoZWNrIHRvIGJhaWwgb3V0IGJlZm9yZSB3ZSBydW4gT09CLgoKICAgIEEg
cmVncmVzc2lvbiB0ZXN0IGlzIGluY2x1ZGVkIHRoYXQgc2VuZHMgMTAwIGdseXBocyBlYWNoIHJl
ZmVyZW5jaW5nCiAgICB0aGUgc2FtZSA2NC1ieXRlIHNvdXJjZSBzbGljZSBpbnRvIGEgNjQtYnl0
ZSBkZXN0aW5hdGlvbiBidWZmZXIsIGFuZAogICAgdmVyaWZpZXMgdGhlIGxpYnJhcnkgcmVqZWN0
cyB0aGUgb3ZlcmZsb3cuCgogICAgQ1ZFLTIwMjYtNDQ5NTAKCiAgICBGb3VuZC1ieTogWmhpeGkg
IkphY2UiIFN1biwgaW5kZXBlbmRlbnQgc2VjdXJpdHkgcmVzZWFyY2hlcgogICAgQXNzaXN0ZWQt
Ynk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKICAgIFNpZ25lZC1vZmYtYnk6IFBldGVyIEh1dHRl
cmVyIDxwZXRlci5odXR0ZXJlckB3aG8tdC5uZXQ+CiAgICBQYXJ0LW9mOiA8aHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcvbGliL2xpYnhmb250Ly0vbWVyZ2VfcmVxdWVzdHMvMzY+
Cgpjb21taXQgNjY4ZmVhODFmNDBiY2I0OGVjNjdmYjU1ZDBiODUxMDQ5ZDI2NTI5MApBdXRob3I6
IFBldGVyIEh1dHRlcmVyIDxwZXRlci5odXR0ZXJlckB3aG8tdC5uZXQ+CkRhdGU6ICAgTW9uIEp1
bCAxMyAxNTo0ODowNiAyMDI2ICsxMDAwCgogICAgZnNlcnZlOiB2YWxpZGF0ZSBudW1fY2hhcnMg
YWdhaW5zdCBlbmNvZGluZyBhcnJheSBzaXplIGluIGZzX3JlYWRfZ2x5cGhzCgogICAgRlNfUXVl
cnlYRXh0ZW50czE2IGNhdXNlcyB1cyB0byBhbGxvY2F0ZSB0aGUgZW5jb2RpbmdbXSBhcnJheSwg
bGF0ZXIKICAgIGR1cmluZyB0aGUgRlNfUXVlcnlYQml0bWFwczE2IHJlcGx5IGhhbmRsaW5nIHdl
IGZpbGwgaW4gdGhhdCBhcnJheS4KICAgIFRoZXJlIGlzIG5vIHZlcmlmaWNhdGlvbiB0aGF0IHRo
ZSBhbGxvY2F0aW9uIGlzIGxhcmdlIGVub3VnaCwgYQogICAgbWFsaWNpb3VzIGZvbnQgc2VydmVy
IGNvdWxkIHNlbmQgdXMgYSBzbWFsbCBudW1FeHRlbnRzIGFuZCBhCiAgICBsYXJnZSBudW1fY2hh
cnMgdG8gZm9yY2UgdW5kZXJhbGxvY2F0aW9uIGFuZCBPT0IgcmVhZC9yd3JpdGUuCgogICAgQSBy
ZWdyZXNzaW9uIHRlc3QgaXMgaW5jbHVkZWQgdGhhdCBjb25zdHJ1Y3RzIGEgY3JhZnRlZAogICAg
RlNfUXVlcnlYQml0bWFwczE2IHJlcGx5IHdpdGggbnVtX2NoYXJzID4gbnVtX2VuY29kaW5nIGFu
ZCB2ZXJpZmllcwogICAgdGhlIGxpYnJhcnkgcmVqZWN0cyBpdC4KCiAgICBDVkUtMjAyNi01OTY3
OQoKICAgIEZvdW5kLWJ5OiBaaGl4aSAiSmFjZSIgU3VuLCBpbmRlcGVuZGVudCBzZWN1cml0eSBy
ZXNlYXJjaGVyCiAgICBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgogICAgU2ln
bmVkLW9mZi1ieTogUGV0ZXIgSHV0dGVyZXIgPHBldGVyLmh1dHRlcmVyQHdoby10Lm5ldD4KICAg
IFBhcnQtb2Y6IDxodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy9saWIvbGlieGZv
bnQvLS9tZXJnZV9yZXF1ZXN0cy8zNj4KCmNvbW1pdCAyZDRiMzdmNTI1ZGY0MTM5OWNmMmNkNDA5
ZmI5N2FhMzBjNDg1NDZhCkF1dGhvcjogUGV0ZXIgSHV0dGVyZXIgPHBldGVyLmh1dHRlcmVyQHdo
by10Lm5ldD4KRGF0ZTogICBUaHUgSnVsIDIzIDEyOjA2OjQ1IDIwMjYgKzEwMDAKCiAgICBEaXNh
YmxlIGZvbnRzZXJ2ZXIgc3VwcG9ydCBieSBkZWZhdWx0CgogICAgRGViaWFuIGhhcyBkaXNhYmxl
ZCB0aGlzIGZvciBvdmVyIGEgZGVjCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRz
IDMwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBh
dHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL3hvcmctbGliL3tsaWJ4Zm9udDJf
Mi4wLjguYmIgPT4gbGlieGZvbnQyXzIuMC45LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4Zm9udDJfMi4wLjguYmIgPT4gbGlieGZvbnQyXzIuMC45
LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4Zm9udDJfMi4wLjguYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGZv
bnQyXzIuMC45LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Zm9udDJfMi4wLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Zm9udDJfMi4wLjkuYmIKaW5kZXggMzNjZjU4MTZl
MC4uODJjYTRkNTAyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGli
L2xpYnhmb250Ml8yLjAuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
bGlieGZvbnQyXzIuMC45LmJiCkBAIC0xNSw3ICsxNSw3IEBAIFhPUkdfUE4gPSAibGliWGZvbnQy
IgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1
NTZjMGUxMDkzYTRlNjkxMWNjOTBiYzRiMTA2ZDIwMTkwMmVlMTg3ZmQ3NGFmMjA2ZmYxNjJmN2U2
YTI0ZDUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjA0MmEzNzA2NjY4MTVlN2I5NDFlOWI3MDE5
MDI0NzU1YmQxYzZjMjk1NGFmYmZhNTE1YWYzNzgyNTE3OTllMiIKIAogUEFDS0FHRUNPTkZJRyA/
Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCiBQ
QUNLQUdFQ09ORklHW2lwdjZdID0gIi0tZW5hYmxlLWlwdjYsLS1kaXNhYmxlLWlwdjYsIgotLSAK
Mi40Ny4xCgo=

--===============6488254033898372711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxfont2: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXfont2-2.0.8.tar.xz" to "https://www.x.org/releases//individual/lib/libXfont2-2.0.9.tar.xz"
packages/x86-64-v3-poky-linux/libxfont2: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2: PV changed from "2.0.8" to "2.0.9"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PKGSIZE changed from 782296 to 607600 (-22%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PV changed from "2.0.8" to "2.0.9"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dev: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dev: PV changed from "2.0.8" to "2.0.9"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-doc: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-doc: PV changed from "2.0.8" to "2.0.9"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-locale: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-locale: PV changed from "2.0.8" to "2.0.9"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PKGSIZE changed from 793993 to 659714 (-17%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: FILELIST: directory renamed /usr/src/debug/libxfont2/2.0.8/src/bitmap -> /usr/src/debug/libxfont2/2.0.9/src/bitmap, directory renamed /usr/src/debug/libxfont2/2.0.8/src/util -> /usr/src/debug/libxfont2/2.0.9/src/util, directory renamed /usr/src/debug/libxfont2/2.0.8/src/fontfile -> /usr/src/debug/libxfont2/2.0.9/src/fontfile, directory renamed /usr/src/debug/libxfont2/2.0.8/include -> /usr/src/debug/libxfont2/2.0.9/include, directory renamed /usr/src/debug/libxfont2/2.0.8/include/X11/fonts -> /usr/src/debug/libxfont2/2.0.9/include/X11/fonts, directory renamed /usr/src/debug/libxfont2/2.0.8/src/FreeType -> /usr/src/debug/libxfont2/2.0.9/src/FreeType, directory renamed /usr/src/debug/libxfont2/2.0.8/src/builtins -> /usr/src/debug/libxfont2/2.0.9/src/builtins, directory renamed /usr/src/debug/libxfont2/2.0.8/src/stubs -> /usr/src/debug/libxfont2/2.0.9/src/stubs, removed all items "/usr/src/debug/libxfont2/2.0.8/src/fc/fservestr.h /u
 sr/src/debug/libxfont2/2.0.8/src/fc/fsio.h /usr/src/debug/libxfont2/2.0.8/src/fc/fserve.c /usr/src/debug/libxfont2/2.0.8/src/fc/fsio.c /usr/src/debug/libxfont2/2.0.8/src/fc/fsconvert.c /usr/src/debug/libxfont2/2.0.8/src/fc/fserve.h"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PV changed from "2.0.8" to "2.0.9"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-staticdev: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-staticdev: PV changed from "2.0.8" to "2.0.9"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PKGV changed from 2.0.8 [default] to 2.0.9 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PKGSIZE changed from 247218 to 193346 (-22%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PV changed from "2.0.8" to "2.0.9"

--===============6488254033898372711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxfont2-changelog.txt"

Changelog for libxfont2: 2.0.8 -> 2.0.9
Source: ChangeLog

commit 975cc6526e892c6fad8fa49d0fef58565fbaa003
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Wed Aug 5 10:57:21 2026 +1000

    libXfont2 2.0.9
    
    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

commit c2d222bb22c623d8a40f3275077fc7e6617f2c8a
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon Jul 13 15:50:09 2026 +1000

    fserve: bounds-check cumulative glyph data writes in fs_read_glyphs
    
    fs_read_glyphs() copies each glyph's bitmap into a single allbits
    buffer allocated to rep->nbytes bytes. The per-glyph guard validates
    only that the source slice (position, length) lies within the pbitmaps
    source buffer. It does not check whether the running destination cursor
    has exceeded the allocation.
    
    A malicious font server can send overlapping source offsets (e.g. 1000
    glyphs each referencing {position:0, length:64} with nbytes=64). Each
    individual source range passes validation, but the cumulative writes
    total 64000 bytes into a 64-byte destination buffer.
    
    Interestingly there was an unconditional debug printf in place that
    sort-of warned about this but didn't prevent this. Let's remove that and
    instead use the actual check to bail out before we run OOB.
    
    A regression test is included that sends 100 glyphs each referencing
    the same 64-byte source slice into a 64-byte destination buffer, and
    verifies the library rejects the overflow.
    
    CVE-2026-44950
    
    Found-by: Zhixi "Jace" Sun, independent security researcher
    Assisted-by: Claude:claude-opus-4-6
    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
    Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/36>

commit 668fea81f40bcb48ec67fb55d0b851049d265290
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon Jul 13 15:48:06 2026 +1000

    fserve: validate num_chars against encoding array size in fs_read_glyphs
    
    FS_QueryXExtents16 causes us to allocate the encoding[] array, later
    during the FS_QueryXBitmaps16 reply handling we fill in that array.
    There is no verification that the allocation is large enough, a
    malicious font server could send us a small numExtents and a
    large num_chars to force underallocation and OOB read/rwrite.
    
    A regression test is included that constructs a crafted
    FS_QueryXBitmaps16 reply with num_chars > num_encoding and verifies
    the library rejects it.
    
    CVE-2026-59679
    
    Found-by: Zhixi "Jace" Sun, independent security researcher
    Assisted-by: Claude:claude-opus-4-6
    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
    Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/36>

commit 2d4b37f525df41399cf2cd409fb97aa30c48546a
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Thu Jul 23 12:06:45 2026 +1000

    Disable fontserver support by default
    
    Debian has disabled this for over a decade by default and it removes
    another source of untrusted data that few, if any, users rely on
    anymore.
    
    Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
    Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/35>

commit c2fc759bbb6d2829ac10a145f0f9bc01a47d6eed
Author: Peter Hutterer <peter.hutterer@who-t.net>
Date:   Thu Jul 23 12:28:19 2026 +1000

    README: fix documentation for --enable-snfformat
    
    Disabled by default in 2014 in
      commit 37595cfd4fea ("Change default to disabling SNF support")
    
    Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/35>

--===============6488254033898372711==--


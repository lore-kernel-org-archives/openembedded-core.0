Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42A3C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 05:57:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15470.1787637418649215942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 22:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BtTJjzV6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xFQAGzIQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0377e4700-6865a06a-e15e-4e59-8a68-c06686816ad1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787637417;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=fUSNk8qvEa+ahdRhkqQ9OcGFf5/+3EwfFMWkiVrMtOQ=;
	b=BtTJjzV6EgXO6+lD1T3OcuQ/uCb8BMZN8SQ1PxYK1HMBce2si/7zb4xRi+KMQ3e8
	XPa4ypO4m7a3Lf5GNFXUHL4DQFaZ1twS6Qy/psgpf99Rs5ZeCLmACKCOudh05W2sTIo
	ClGsjeoaPJ1qkoQlm0hvgcVSNpMvr9bod4ecz7UE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787637417;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=fUSNk8qvEa+ahdRhkqQ9OcGFf5/+3EwfFMWkiVrMtOQ=;
	b=xFQAGzIQduQecDcrVsuGQeAlMhNfHxQ5BtXn2joNIJqwOcNsGvV5ZXlNO5tqNEdq
	89KwWP2+HaxAGomCtAGRUdNRddYBILCgCwrj1ER6TugHHjRW0a52oh1XtzW4GrXIgoq
	TvKXdE8HVdhYuoS1CVpXiAqfN4hk6HlGmDKEdhI8=
Content-Type: multipart/mixed; boundary="===============0374215182599534606=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] netbase: upgrading to 6.6 FAILED
Message-ID: <010101a0377e4700-6865a06a-e15e-4e59-8a68-c06686816ad1-000000@us-west-2.amazonses.com>
Date: Tue, 25 Aug 2026 05:56:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 05:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244193

--===============0374215182599534606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *netbase* to *6.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-netbase-upgrade-6.5-6.6.patch
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
From 1558d6a03035ef2d7980014e7505969e09911905 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 25 Aug 2026 05:15:34 +0000
Subject: [PATCH] netbase: upgrade 6.5 -> 6.6

Source: debian/changelog

netbase (6.6) unstable; urgency=medium

  * services: renamed datametrics (1645) to sightline, which is the
    official name.
  * services: renamed z3950 (143/tcp) to z39-50, which is the
    official name. The old name is kept as an alias.
  * services: renamed snmp-trap (162) to snmptrap, which is the
    official name. The old name is kept as an alias.
  * services: renamed imap2 (143/tcp) to imap, which is the official name.
    The old name is kept as an alias.
  * services: renamed sip-tls (5061) to sips, which is the official name.
    The old name is kept as an alias.
  * services: removed some historical or not actually used ports:
    rmtcfg (1236/tcp), rtcm-sc104 (2101/udp), sgi-cmsd (17001/udp),
    sgi-crsd (17002/udp), sgi-gcd (17003/udp), sgi-cad (17004/tcp),
    asp (27374).

 -- Marco d'Itri <md@linux.it>  Mon, 24 Aug 2026 00:53:38 +0200
---
 .../{netbase_6.5.bb => netbase_6.6.bb}        | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)
 rename meta/recipes-core/netbase/{netbase_6.5.bb => netbase_6.6.bb} (39%)

diff --git a/meta/recipes-core/netbase/netbase_6.5.bb b/meta/recipes-core/netbase/netbase_6.6.bb
similarity index 39%
rename from meta/recipes-core/netbase/netbase_6.5.bb
rename to meta/recipes-core/netbase/netbase_6.6.bb
index c6cf798421..0686f1164e 100644
--- a/meta/recipes-core/netbase/netbase_6.5.bb
+++ b/meta/recipes-core/netbase/netbase_6.6.bb
@@ -1,16 +1,39 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- debian/copyright
+# +++ debian/copyright
+# @@ -21,8 +21,7 @@
+#   GNU General Public License for more details.
+#   .
+#   You should have received a copy of the GNU General Public License along
+# - with this program; if not, write to the Free Software Foundation,
+# - Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+# + with this program; if not, see <https://www.gnu.org/licenses/>.
+#   .
+#   On Debian systems, the complete text of the GNU General Public License
+#   version 2 can be found in '/usr/share/common-licenses/GPL-2'.
+# 
+#
+
 SUMMARY = "Basic TCP/IP networking support"
 DESCRIPTION = "This package provides the necessary infrastructure for basic TCP/IP based networking"
 HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=78dd2c7c6f487348e4a0092c17a19d42"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=03a03b9cf1aa619e30b1c9d53141163e"
 PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
 inherit allarch
 
-SRC_URI[sha256sum] = "9116047aebbaa1698934052d01c6e09b4c3aed643e93df63d2ddcbec243c26d1"
+SRC_URI[sha256sum] = "31f7e8a37f3f07010e484f74bcbee503923b38d1a36c6a11326b804acc07224e"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 
-- 
2.47.1


--===============0374215182599534606==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-netbase-upgrade-6.5-6.6.patch"

RnJvbSAxNTU4ZDZhMDMwMzVlZjJkNzk4MDAxNGU3NTA1OTY5ZTA5OTExOTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjUgQXVnIDIwMjYgMDU6MTU6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZXRiYXNlOiB1cGdyYWRlIDYuNSAtPiA2LjYKClNvdXJjZTogZGViaWFuL2NoYW5nZWxvZwoKbmV0
YmFzZSAoNi42KSB1bnN0YWJsZTsgdXJnZW5jeT1tZWRpdW0KCiAgKiBzZXJ2aWNlczogcmVuYW1l
ZCBkYXRhbWV0cmljcyAoMTY0NSkgdG8gc2lnaHRsaW5lLCB3aGljaCBpcyB0aGUKICAgIG9mZmlj
aWFsIG5hbWUuCiAgKiBzZXJ2aWNlczogcmVuYW1lZCB6Mzk1MCAoMTQzL3RjcCkgdG8gejM5LTUw
LCB3aGljaCBpcyB0aGUKICAgIG9mZmljaWFsIG5hbWUuIFRoZSBvbGQgbmFtZSBpcyBrZXB0IGFz
IGFuIGFsaWFzLgogICogc2VydmljZXM6IHJlbmFtZWQgc25tcC10cmFwICgxNjIpIHRvIHNubXB0
cmFwLCB3aGljaCBpcyB0aGUKICAgIG9mZmljaWFsIG5hbWUuIFRoZSBvbGQgbmFtZSBpcyBrZXB0
IGFzIGFuIGFsaWFzLgogICogc2VydmljZXM6IHJlbmFtZWQgaW1hcDIgKDE0My90Y3ApIHRvIGlt
YXAsIHdoaWNoIGlzIHRoZSBvZmZpY2lhbCBuYW1lLgogICAgVGhlIG9sZCBuYW1lIGlzIGtlcHQg
YXMgYW4gYWxpYXMuCiAgKiBzZXJ2aWNlczogcmVuYW1lZCBzaXAtdGxzICg1MDYxKSB0byBzaXBz
LCB3aGljaCBpcyB0aGUgb2ZmaWNpYWwgbmFtZS4KICAgIFRoZSBvbGQgbmFtZSBpcyBrZXB0IGFz
IGFuIGFsaWFzLgogICogc2VydmljZXM6IHJlbW92ZWQgc29tZSBoaXN0b3JpY2FsIG9yIG5vdCBh
Y3R1YWxseSB1c2VkIHBvcnRzOgogICAgcm10Y2ZnICgxMjM2L3RjcCksIHJ0Y20tc2MxMDQgKDIx
MDEvdWRwKSwgc2dpLWNtc2QgKDE3MDAxL3VkcCksCiAgICBzZ2ktY3JzZCAoMTcwMDIvdWRwKSwg
c2dpLWdjZCAoMTcwMDMvdWRwKSwgc2dpLWNhZCAoMTcwMDQvdGNwKSwKICAgIGFzcCAoMjczNzQp
LgoKIC0tIE1hcmNvIGQnSXRyaSA8bWRAbGludXguaXQ+ICBNb24sIDI0IEF1ZyAyMDI2IDAwOjUz
OjM4ICswMjAwCi0tLQogLi4uL3tuZXRiYXNlXzYuNS5iYiA9PiBuZXRiYXNlXzYuNi5iYn0gICAg
ICAgIHwgMjcgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvbmV0YmFzZS97
bmV0YmFzZV82LjUuYmIgPT4gbmV0YmFzZV82LjYuYmJ9ICgzOSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlXzYuNS5iYiBiL21ldGEvcmVjaXBlcy1jb3Jl
L25ldGJhc2UvbmV0YmFzZV82LjYuYmIKc2ltaWxhcml0eSBpbmRleCAzOSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlXzYuNS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlXzYuNi5iYgppbmRleCBjNmNmNzk4NDIxLi4wNjg2
ZjExNjRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2VfNi41
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL25ldGJhc2UvbmV0YmFzZV82LjYuYmIKQEAgLTEs
MTYgKzEsMzkgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJl
ZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQ
bGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0
aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTon
IHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0
ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBkZWJpYW4vY29weXJpZ2h0CisjICsr
KyBkZWJpYW4vY29weXJpZ2h0CisjIEBAIC0yMSw4ICsyMSw3IEBACisjICAgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgICAuCisjICAgWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxv
bmcKKyMgLSB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLAorIyAtIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxv
b3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSwgVVNBLgorIyArIHdpdGggdGhpcyBwcm9ncmFtOyBp
ZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAgIC4KKyMgICBP
biBEZWJpYW4gc3lzdGVtcywgdGhlIGNvbXBsZXRlIHRleHQgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlCisjICAgdmVyc2lvbiAyIGNhbiBiZSBmb3VuZCBpbiAnL3Vzci9zaGFyZS9j
b21tb24tbGljZW5zZXMvR1BMLTInLgorIyAKKyMKKwogU1VNTUFSWSA9ICJCYXNpYyBUQ1AvSVAg
bmV0d29ya2luZyBzdXBwb3J0IgogREVTQ1JJUFRJT04gPSAiVGhpcyBwYWNrYWdlIHByb3ZpZGVz
IHRoZSBuZWNlc3NhcnkgaW5mcmFzdHJ1Y3R1cmUgZm9yIGJhc2ljIFRDUC9JUCBiYXNlZCBuZXR3
b3JraW5nIgogSE9NRVBBR0UgPSAiaHR0cDovL3BhY2thZ2VzLmRlYmlhbi5vcmcvbmV0YmFzZSIK
IFNFQ1RJT04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vZGViaWFuL2NvcHlyaWdodDttZDU9NzhkZDJjN2M2ZjQ4NzM0OGU0YTAw
OTJjMTdhMTlkNDIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0
O21kNT0wM2EwM2I5Y2YxYWE2MTllMzBiMWM5ZDUzMTQxMTYzZSIKIFBFID0gIjEiCiAKIFNSQ19V
UkkgPSAiJHtERUJJQU5fTUlSUk9SfS9tYWluL24vJHtCUE59LyR7QlBOfV8ke1BWfS50YXIueHoi
CiAKIGluaGVyaXQgYWxsYXJjaAogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTExNjA0N2FlYmJh
YTE2OTg5MzQwNTJkMDFjNmUwOWI0YzNhZWQ2NDNlOTNkZjYzZDJkZGNiZWMyNDNjMjZkMSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIzMWY3ZThhMzdmM2YwNzAxMGU0ODRmNzRiY2JlZTUwMzkyM2Iz
OGQxYTM2YzZhMTEzMjZiODA0YWNjMDcyMjRlIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiJHtE
RUJJQU5fTUlSUk9SfS9tYWluL24vbmV0YmFzZS8iCiAKLS0gCjIuNDcuMQoK

--===============0374215182599534606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7ddfb99fc6894c9ad7f4a0e5984dbc0423a0c3a5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7ddfb99fc6894c9ad7f4a0e5984dbc0423a0c3a5"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 100 Local 87 Mirrors 0 Missed 13 Current 144 (87% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 509 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_recipe_qa)
NOTE: Running task 759 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_create_recipe_spdx)
NOTE: recipe netbase-1_6.6-r0: task do_recipe_qa: Started
NOTE: recipe netbase-1_6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe netbase-1_6.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 778 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_fetch)
NOTE: recipe netbase-1_6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe netbase-1_6.6-r0: task do_fetch: Started
NOTE: recipe netbase-1_6.6-r0: task do_fetch: Succeeded
NOTE: Running task 779 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_unpack)
NOTE: Running task 780 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe netbase-1_6.6-r0: task do_unpack: Started
NOTE: recipe netbase-1_6.6-r0: task do_prepare_recipe_sysroot: Started
WARNING: netbase-1_6.6-r0 do_unpack: netbase: the directory ${UNPACKDIR}/netbase (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/sources/netbase) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: recipe netbase-1_6.6-r0: task do_unpack: Succeeded
NOTE: Running task 781 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_patch)
NOTE: recipe netbase-1_6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe netbase-1_6.6-r0: task do_patch: Started
NOTE: recipe netbase-1_6.6-r0: task do_patch: Succeeded
NOTE: Running task 782 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 783 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_populate_lic)
NOTE: recipe netbase-1_6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe netbase-1_6.6-r0: task do_populate_lic: Started
WARNING: netbase-1_6.6-r0 do_populate_lic: Could not copy license file /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/sources/netbase/debian/copyright to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/license-destdir/netbase/copyright: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/sources/netbase/debian/copyright'
NOTE: recipe netbase-1_6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 784 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_configure)
NOTE: recipe netbase-1_6.6-r0: task do_configure: Started
NOTE: recipe netbase-1_6.6-r0: task do_configure: Succeeded
NOTE: Running task 785 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_compile)
NOTE: recipe netbase-1_6.6-r0: task do_compile: Started
NOTE: recipe netbase-1_6.6-r0: task do_compile: Succeeded
NOTE: Running task 786 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_install)
NOTE: recipe netbase-1_6.6-r0: task do_install: Started
NOTE: recipe netbase-1_6.6-r0: task do_populate_lic: Failed
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'pseudo-native', 'attr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| install: cannot stat '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/sources/netbase/etc/rpc': No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/run.do_install.1151234:138 exit 1 from 'install -m 0644 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/sources/netbase/etc/rpc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/image/etc/rpc'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/run.do_install.1151234, line 138
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/run.do_install.1151234, line 145
NOTE: recipe netbase-1_6.6-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 786 tasks of which 775 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260825051521.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260825051521.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/log.do_populate_lic.1146950
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/log.do_install.1151234
Summary: There were 2 WARNING messages.
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: netbase-1_6.6-r0 do_populate_lic: QA Issue: netbase: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/sources/netbase/debian/copyright [license-checksum]
ERROR: netbase-1_6.6-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: netbase-1_6.6-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/run.do_install.1151234' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/log.do_populate_lic.1146950
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_populate_lic) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/netbase/6.6/temp/log.do_install.1151234
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.6.bb:do_install) failed with exit code '1'

--===============0374215182599534606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="netbase-changelog.txt"

Changelog for netbase: 6.5 -> 6.6
Source: debian/changelog

netbase (6.6) unstable; urgency=medium

  * services: renamed datametrics (1645) to sightline, which is the
    official name.
  * services: renamed z3950 (143/tcp) to z39-50, which is the
    official name. The old name is kept as an alias.
  * services: renamed snmp-trap (162) to snmptrap, which is the
    official name. The old name is kept as an alias.
  * services: renamed imap2 (143/tcp) to imap, which is the official name.
    The old name is kept as an alias.
  * services: renamed sip-tls (5061) to sips, which is the official name.
    The old name is kept as an alias.
  * services: removed some historical or not actually used ports:
    rmtcfg (1236/tcp), rtcm-sc104 (2101/udp), sgi-cmsd (17001/udp),
    sgi-crsd (17002/udp), sgi-gcd (17003/udp), sgi-cad (17004/tcp),
    asp (27374).

 -- Marco d'Itri <md@linux.it>  Mon, 24 Aug 2026 00:53:38 +0200

--===============0374215182599534606==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFE6C98306
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:15 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3739.1790055731472447269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 22:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kBzPvR/M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UN7Id9AN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0c7a2cd78-1efadc95-3a3c-4158-8390-5e21b12a8406-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790055730;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gr2P3WCLBS1mtPahs0HbI1U6jZ/D6p8WJOSfnqzgSPA=;
	b=kBzPvR/MVObBZ1AvmtOSZuuwBnKQVOOHbpAZa8C/jXixmcwQQ07ZSI7aReJvyKCr
	eMnN1MkA2lLQyAAG0J0F757F+auRqRMarIGvkw4Gl5gmGbAmrjWToSUT/IN9dy3CLeo
	TNNRr2suMVTZ8G8vSXc7SJidb+wkHcmcJSgRxgfw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790055730;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gr2P3WCLBS1mtPahs0HbI1U6jZ/D6p8WJOSfnqzgSPA=;
	b=UN7Id9ANuhvKljtXLGgbwWCCSOxQZEXO1T8H1b4Kkp4cLDty3DRInkgVg6WBkBTx
	lDcZKJYtSmY/nsK0mQ4fuB/CCjO5etQ2iwawj8DoF9RSJPm1nbaSbNsuLDxsn7d1pZ6
	jAKWTuUDs89okBaEssyzcIlv8HCz7/YqiWeRQ46A=
Content-Type: multipart/mixed; boundary="===============4829370877043195059=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.44.1 SUCCEEDED
Message-ID: <010101a0c7a2cd78-1efadc95-3a3c-4158-8390-5e21b12a8406-000000@us-west-2.amazonses.com>
Date: Tue, 22 Sep 2026 05:42:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.22-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246370

--===============4829370877043195059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.44.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.44.0-2.44.1.patch
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
From 6858b6a1aef5bc54cf70f3e427e3b3d44554c56f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 22 Sep 2026 05:18:46 +0000
Subject: [PATCH] ttyrun: upgrade 2.44.0 -> 2.44.1

For Linux kernel version: 7.2

  Changes of existing tools:
  - cpumf/lshwc: Add -c as short option for --counters
  - cpumf/lspai: Handle CPU hotplug gracefully
  - dbginfo.sh: Change grep for OS name
  - dbginfo.sh: Change tar generation via temp file
  - dbginfo.sh: Correct dump counter
  - dbginfo.sh: Detect the openCryptoki STDLL directory at runtime
  - dbginfo.sh: Redirect stderr on command existence checks
  - dbginfo.sh: Replace deprecated backtick command substitution
  - dbginfo.sh: Secure the directory input variable
  - zipl: Detect and display partition table type for disk and device

  Bug Fixes:
  - cmsfs-fuse: Fix out-of-bounds access when reading variable-length files
  - cpumf/lscpumf: Fix exit status and error reporting
  - cpumf/lshwc: Fix --allcpu to --all in man page
  - cpumf/lspai: Add input validation for interval parameter
  - cpumf/lspai: Fix --allcpu to --all in man page
  - cpumf/lspai: Fix integer overflow in file descriptor calculation
  - cpumf/lspai: Fix output formatting with minimum indent
  - dasdview: Fix buffer overflow in dasdview_read_vtoc()
  - dumpconf: Harden locking during delayed activation to prevent symlink
    attacks
  - fdasd: Fix potential buffer overflow in fdasd_change_part_type()
  - ipl_tools: Fix buffer overflow vulnerabilities in chreipl and is_lpar()
  - ip_watcher: Use mktemp for cleanup files to avoid collisions
  - libkmipclient: Fix NULL pointer dereference in kmip_v2_attr_from_v1_attr()
  - libkmipclient: Fix heap buffer overflow
  - libutil/util_lockfile: Prevent buffer overflow in lockfile handling
  - libzds: Add bounds checking and validate used_bytes in PDS directory parsing
  - pvattest: Write attestation request private key (arpk) with 0600 permissions
  - pvebc: Fix executable permission on sel-ebc-modules.conf
  - pvics: Fix incorrect exit values for --version and --help options
  - pvsecret: Write secret with 0600 permissions
  - sclpdbf: Harden against invalid trace data
  - vmur: Fix buffer over-read in get_minor()
  - zdump/dfi_s390: Add a check for zlib entry size in the dump header
  - zdump/dfi_s390: Fix out-of-bounds upon dump entry decompression
  - zdump/dfo_elf: Fix 32-bit truncation in ELF header allocation size
  - zdump: Reject multi-volume dumps with out-of-range vol_cnt
  - ziomon/ziomon_zfcpdd: Validate message lengths before processing
  - ziomon/ziorep_config: Replace unsafe open() and regex match with safer
    idioms
  - ziomon: Validate message layout and aggregate message lengths before
    processing
  - zipl: Fix memory leak in free_bootloader()
  - zipl: Replace popen(3) with safer invocation for targetbase scripts and
    ngdump
  - zkey-ekmfweb: Fix insecure default: TLS host name verification now enabled
    by default
  - zkey-kmip: Fix insecure default: TLS host name verification now enabled by
    default
  - zkey: Fix memory leaks when generating keys or reenciphering integrity
    volumes
  - zkey: Harden 'zkey kms unbind' command against sy

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 meta/recipes-core/ttyrun/{ttyrun_2.44.0.bb => ttyrun_2.44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.44.0.bb => ttyrun_2.44.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.44.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.44.1.bb
index 776698e1b6..a8b276c071 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.44.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "03f7566436b42c2f1a4ad717dcf610c1f926b8f4"
+SRCREV = "8840053a7bbaeea1de3834fbc7f84b16813fc409"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============4829370877043195059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ttyrun-changelog.txt"

For Linux kernel version: 7.2

  Changes of existing tools:
  - cpumf/lshwc: Add -c as short option for --counters
  - cpumf/lspai: Handle CPU hotplug gracefully
  - dbginfo.sh: Change grep for OS name
  - dbginfo.sh: Change tar generation via temp file
  - dbginfo.sh: Correct dump counter
  - dbginfo.sh: Detect the openCryptoki STDLL directory at runtime
  - dbginfo.sh: Redirect stderr on command existence checks
  - dbginfo.sh: Replace deprecated backtick command substitution
  - dbginfo.sh: Secure the directory input variable
  - zipl: Detect and display partition table type for disk and device

  Bug Fixes:
  - cmsfs-fuse: Fix out-of-bounds access when reading variable-length files
  - cpumf/lscpumf: Fix exit status and error reporting
  - cpumf/lshwc: Fix --allcpu to --all in man page
  - cpumf/lspai: Add input validation for interval parameter
  - cpumf/lspai: Fix --allcpu to --all in man page
  - cpumf/lspai: Fix integer overflow in file descriptor calculation
  - cpumf/lspai: Fix output formatting with minimum indent
  - dasdview: Fix buffer overflow in dasdview_read_vtoc()
  - dumpconf: Harden locking during delayed activation to prevent symlink
    attacks
  - fdasd: Fix potential buffer overflow in fdasd_change_part_type()
  - ipl_tools: Fix buffer overflow vulnerabilities in chreipl and is_lpar()
  - ip_watcher: Use mktemp for cleanup files to avoid collisions
  - libkmipclient: Fix NULL pointer dereference in kmip_v2_attr_from_v1_attr()
  - libkmipclient: Fix heap buffer overflow
  - libutil/util_lockfile: Prevent buffer overflow in lockfile handling
  - libzds: Add bounds checking and validate used_bytes in PDS directory parsing
  - pvattest: Write attestation request private key (arpk) with 0600 permissions
  - pvebc: Fix executable permission on sel-ebc-modules.conf
  - pvics: Fix incorrect exit values for --version and --help options
  - pvsecret: Write secret with 0600 permissions
  - sclpdbf: Harden against invalid trace data
  - vmur: Fix buffer over-read in get_minor()
  - zdump/dfi_s390: Add a check for zlib entry size in the dump header
  - zdump/dfi_s390: Fix out-of-bounds upon dump entry decompression
  - zdump/dfo_elf: Fix 32-bit truncation in ELF header allocation size
  - zdump: Reject multi-volume dumps with out-of-range vol_cnt
  - ziomon/ziomon_zfcpdd: Validate message lengths before processing
  - ziomon/ziorep_config: Replace unsafe open() and regex match with safer
    idioms
  - ziomon: Validate message layout and aggregate message lengths before
    processing
  - zipl: Fix memory leak in free_bootloader()
  - zipl: Replace popen(3) with safer invocation for targetbase scripts and
    ngdump
  - zkey-ekmfweb: Fix insecure default: TLS host name verification now enabled
    by default
  - zkey-kmip: Fix insecure default: TLS host name verification now enabled by
    default
  - zkey: Fix memory leaks when generating keys or reenciphering integrity
    volumes
  - zkey: Harden 'zkey kms unbind' command against symlink traversal
  - zkey: Harden KMS config directory handling against symlink attacks
  - zkey: Harden KMS plugin file handling against symlink attacks
  - zkey: Install initrd integration with the configured plugin directory

--===============4829370877043195059==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.44.0-2.44.1.patch"

RnJvbSA2ODU4YjZhMWFlZjViYzU0Y2Y3MGYzZTQyN2UzYjNkNDQ1NTRjNTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjIgU2VwIDIwMjYgMDU6MTg6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi40NC4wIC0+IDIuNDQuMQoKRm9yIExpbnV4IGtlcm5lbCB2ZXJzaW9u
OiA3LjIKCiAgQ2hhbmdlcyBvZiBleGlzdGluZyB0b29sczoKICAtIGNwdW1mL2xzaHdjOiBBZGQg
LWMgYXMgc2hvcnQgb3B0aW9uIGZvciAtLWNvdW50ZXJzCiAgLSBjcHVtZi9sc3BhaTogSGFuZGxl
IENQVSBob3RwbHVnIGdyYWNlZnVsbHkKICAtIGRiZ2luZm8uc2g6IENoYW5nZSBncmVwIGZvciBP
UyBuYW1lCiAgLSBkYmdpbmZvLnNoOiBDaGFuZ2UgdGFyIGdlbmVyYXRpb24gdmlhIHRlbXAgZmls
ZQogIC0gZGJnaW5mby5zaDogQ29ycmVjdCBkdW1wIGNvdW50ZXIKICAtIGRiZ2luZm8uc2g6IERl
dGVjdCB0aGUgb3BlbkNyeXB0b2tpIFNURExMIGRpcmVjdG9yeSBhdCBydW50aW1lCiAgLSBkYmdp
bmZvLnNoOiBSZWRpcmVjdCBzdGRlcnIgb24gY29tbWFuZCBleGlzdGVuY2UgY2hlY2tzCiAgLSBk
YmdpbmZvLnNoOiBSZXBsYWNlIGRlcHJlY2F0ZWQgYmFja3RpY2sgY29tbWFuZCBzdWJzdGl0dXRp
b24KICAtIGRiZ2luZm8uc2g6IFNlY3VyZSB0aGUgZGlyZWN0b3J5IGlucHV0IHZhcmlhYmxlCiAg
LSB6aXBsOiBEZXRlY3QgYW5kIGRpc3BsYXkgcGFydGl0aW9uIHRhYmxlIHR5cGUgZm9yIGRpc2sg
YW5kIGRldmljZQoKICBCdWcgRml4ZXM6CiAgLSBjbXNmcy1mdXNlOiBGaXggb3V0LW9mLWJvdW5k
cyBhY2Nlc3Mgd2hlbiByZWFkaW5nIHZhcmlhYmxlLWxlbmd0aCBmaWxlcwogIC0gY3B1bWYvbHNj
cHVtZjogRml4IGV4aXQgc3RhdHVzIGFuZCBlcnJvciByZXBvcnRpbmcKICAtIGNwdW1mL2xzaHdj
OiBGaXggLS1hbGxjcHUgdG8gLS1hbGwgaW4gbWFuIHBhZ2UKICAtIGNwdW1mL2xzcGFpOiBBZGQg
aW5wdXQgdmFsaWRhdGlvbiBmb3IgaW50ZXJ2YWwgcGFyYW1ldGVyCiAgLSBjcHVtZi9sc3BhaTog
Rml4IC0tYWxsY3B1IHRvIC0tYWxsIGluIG1hbiBwYWdlCiAgLSBjcHVtZi9sc3BhaTogRml4IGlu
dGVnZXIgb3ZlcmZsb3cgaW4gZmlsZSBkZXNjcmlwdG9yIGNhbGN1bGF0aW9uCiAgLSBjcHVtZi9s
c3BhaTogRml4IG91dHB1dCBmb3JtYXR0aW5nIHdpdGggbWluaW11bSBpbmRlbnQKICAtIGRhc2R2
aWV3OiBGaXggYnVmZmVyIG92ZXJmbG93IGluIGRhc2R2aWV3X3JlYWRfdnRvYygpCiAgLSBkdW1w
Y29uZjogSGFyZGVuIGxvY2tpbmcgZHVyaW5nIGRlbGF5ZWQgYWN0aXZhdGlvbiB0byBwcmV2ZW50
IHN5bWxpbmsKICAgIGF0dGFja3MKICAtIGZkYXNkOiBGaXggcG90ZW50aWFsIGJ1ZmZlciBvdmVy
ZmxvdyBpbiBmZGFzZF9jaGFuZ2VfcGFydF90eXBlKCkKICAtIGlwbF90b29sczogRml4IGJ1ZmZl
ciBvdmVyZmxvdyB2dWxuZXJhYmlsaXRpZXMgaW4gY2hyZWlwbCBhbmQgaXNfbHBhcigpCiAgLSBp
cF93YXRjaGVyOiBVc2UgbWt0ZW1wIGZvciBjbGVhbnVwIGZpbGVzIHRvIGF2b2lkIGNvbGxpc2lv
bnMKICAtIGxpYmttaXBjbGllbnQ6IEZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4ga21p
cF92Ml9hdHRyX2Zyb21fdjFfYXR0cigpCiAgLSBsaWJrbWlwY2xpZW50OiBGaXggaGVhcCBidWZm
ZXIgb3ZlcmZsb3cKICAtIGxpYnV0aWwvdXRpbF9sb2NrZmlsZTogUHJldmVudCBidWZmZXIgb3Zl
cmZsb3cgaW4gbG9ja2ZpbGUgaGFuZGxpbmcKICAtIGxpYnpkczogQWRkIGJvdW5kcyBjaGVja2lu
ZyBhbmQgdmFsaWRhdGUgdXNlZF9ieXRlcyBpbiBQRFMgZGlyZWN0b3J5IHBhcnNpbmcKICAtIHB2
YXR0ZXN0OiBXcml0ZSBhdHRlc3RhdGlvbiByZXF1ZXN0IHByaXZhdGUga2V5IChhcnBrKSB3aXRo
IDA2MDAgcGVybWlzc2lvbnMKICAtIHB2ZWJjOiBGaXggZXhlY3V0YWJsZSBwZXJtaXNzaW9uIG9u
IHNlbC1lYmMtbW9kdWxlcy5jb25mCiAgLSBwdmljczogRml4IGluY29ycmVjdCBleGl0IHZhbHVl
cyBmb3IgLS12ZXJzaW9uIGFuZCAtLWhlbHAgb3B0aW9ucwogIC0gcHZzZWNyZXQ6IFdyaXRlIHNl
Y3JldCB3aXRoIDA2MDAgcGVybWlzc2lvbnMKICAtIHNjbHBkYmY6IEhhcmRlbiBhZ2FpbnN0IGlu
dmFsaWQgdHJhY2UgZGF0YQogIC0gdm11cjogRml4IGJ1ZmZlciBvdmVyLXJlYWQgaW4gZ2V0X21p
bm9yKCkKICAtIHpkdW1wL2RmaV9zMzkwOiBBZGQgYSBjaGVjayBmb3IgemxpYiBlbnRyeSBzaXpl
IGluIHRoZSBkdW1wIGhlYWRlcgogIC0gemR1bXAvZGZpX3MzOTA6IEZpeCBvdXQtb2YtYm91bmRz
IHVwb24gZHVtcCBlbnRyeSBkZWNvbXByZXNzaW9uCiAgLSB6ZHVtcC9kZm9fZWxmOiBGaXggMzIt
Yml0IHRydW5jYXRpb24gaW4gRUxGIGhlYWRlciBhbGxvY2F0aW9uIHNpemUKICAtIHpkdW1wOiBS
ZWplY3QgbXVsdGktdm9sdW1lIGR1bXBzIHdpdGggb3V0LW9mLXJhbmdlIHZvbF9jbnQKICAtIHpp
b21vbi96aW9tb25femZjcGRkOiBWYWxpZGF0ZSBtZXNzYWdlIGxlbmd0aHMgYmVmb3JlIHByb2Nl
c3NpbmcKICAtIHppb21vbi96aW9yZXBfY29uZmlnOiBSZXBsYWNlIHVuc2FmZSBvcGVuKCkgYW5k
IHJlZ2V4IG1hdGNoIHdpdGggc2FmZXIKICAgIGlkaW9tcwogIC0gemlvbW9uOiBWYWxpZGF0ZSBt
ZXNzYWdlIGxheW91dCBhbmQgYWdncmVnYXRlIG1lc3NhZ2UgbGVuZ3RocyBiZWZvcmUKICAgIHBy
b2Nlc3NpbmcKICAtIHppcGw6IEZpeCBtZW1vcnkgbGVhayBpbiBmcmVlX2Jvb3Rsb2FkZXIoKQog
IC0gemlwbDogUmVwbGFjZSBwb3BlbigzKSB3aXRoIHNhZmVyIGludm9jYXRpb24gZm9yIHRhcmdl
dGJhc2Ugc2NyaXB0cyBhbmQKICAgIG5nZHVtcAogIC0gemtleS1la21md2ViOiBGaXggaW5zZWN1
cmUgZGVmYXVsdDogVExTIGhvc3QgbmFtZSB2ZXJpZmljYXRpb24gbm93IGVuYWJsZWQKICAgIGJ5
IGRlZmF1bHQKICAtIHprZXkta21pcDogRml4IGluc2VjdXJlIGRlZmF1bHQ6IFRMUyBob3N0IG5h
bWUgdmVyaWZpY2F0aW9uIG5vdyBlbmFibGVkIGJ5CiAgICBkZWZhdWx0CiAgLSB6a2V5OiBGaXgg
bWVtb3J5IGxlYWtzIHdoZW4gZ2VuZXJhdGluZyBrZXlzIG9yIHJlZW5jaXBoZXJpbmcgaW50ZWdy
aXR5CiAgICB2b2x1bWVzCiAgLSB6a2V5OiBIYXJkZW4gJ3prZXkga21zIHVuYmluZCcgY29tbWFu
ZCBhZ2FpbnN0IHN5CgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hh
cmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50
IHRvIHRoZSBBVUggZW1haWxdCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3t0dHlydW5f
Mi40NC4wLmJiID0+IHR0eXJ1bl8yLjQ0LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdHR5
cnVuL3t0dHlydW5fMi40NC4wLmJiID0+IHR0eXJ1bl8yLjQ0LjEuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjQ0LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDQuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjQ0LjEuYmIKaW5kZXggNzc2
Njk4ZTFiNi4uYThiMjc2YzA3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVu
L3R0eXJ1bl8yLjQ0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8y
LjQ0LjEuYmIKQEAgLTcsNyArNyw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZjUxMThmMTY3YjA1NWJmZDdjMzQ1MDgwM2YxODQ3YWYi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9pYm0tczM5MC1saW51eC9zMzkwLXRvb2xz
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSIKLVNSQ1JFViA9ICIwM2Y3
NTY2NDM2YjQyYzJmMWE0YWQ3MTdkY2Y2MTBjMWY5MjZiOGY0IgorU1JDUkVWID0gIjg4NDAwNTNh
N2JiYWVlYTFkZTM4MzRmYmM3Zjg0YjE2ODEzZmM0MDkiCiAKIENWRV9QUk9EVUNUID0gInMzOTAt
dG9vbHMiCiAKLS0gCjIuNDcuMQoK

--===============4829370877043195059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.44.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.44.0/iucvterm/src -> /usr/src/debug/ttyrun/2.44.1/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.44.0" to "2.44.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.44.0 [default] to 2.44.1 [default]

--===============4829370877043195059==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20F0CA600A
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:48:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1963.1791352117646477275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Mw6Nt/FR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=myrwfQrX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a114e815c4-560ef97e-2584-4203-9106-010ff21ad1eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791352116;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6UVsLyULZr25m/02G1hT9ziqrAOpYt7JBzlcGUvgv+M=;
	b=Mw6Nt/FRH7Oj3DPdGV1jAMOivLbyRXDtSMkf2u9G7X7CtG0ZEjjei2da9o2xyV9L
	uD1XRXTwOxAzAVAO2SkgmPXYjXacLjzcx9k0RDW92CdfbExfu3OI4y3AuVmT4Q7EYek
	YA4ukskQ1waoyw3xwdd2d+UZ8iNcXJQi4EFpHO2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791352116;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6UVsLyULZr25m/02G1hT9ziqrAOpYt7JBzlcGUvgv+M=;
	b=myrwfQrXQCw3yl/Myy6lfi1oE1CO2pyAUqhLvbKQ2wORacHIwqxMo2heFx76eLZu
	GH7Cq/XGGSyBiOFZRcCwnqK3e8/64gEgA/+KqWJnqZ1iC6hBUaUMsgkiaElUgTeldPz
	xVrMzs1O6L27qCeNynHopGju8aNPv7OwsR/+5bYo=
Content-Type: multipart/mixed; boundary="===============8853594108126803958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 10.6p1 SUCCEEDED
Message-ID: <010101a114e815c4-560ef97e-2584-4203-9106-010ff21ad1eb-000000@us-west-2.amazonses.com>
Date: Wed, 7 Oct 2026 05:48:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.07-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247360

--===============8853594108126803958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.6p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-10.5p1-10.6p1.patch
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
From dae49ade37fafe4dd27d3aec3d3fc39fe4ef6ad2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 7 Oct 2026 05:22:35 +0000
Subject: [PATCH] openssh: upgrade 10.5p1 -> 10.6p1

.depend
update RPM spec files
upstream: openssh-10.6
upstream: Add test for proxycommand percent expansions.
upstream: backout regress bits related to multiplexing change
remove the --disable-fd-passing configure option
disable features when post-auth sshd runs as root
Don't automatically enable FORTIFY_SOURCE.
upstream: Further restrict the characters allowed in a command-line
Remove NetBSD 9.0 test target.
Replace native ARM runner with remote runner.
Pull older NetBSD sudo package from archive.
upstream: make StreamLocalBindMask properly first-match-wins;
upstream: make StreamLocalBindMask properly respect Host/Match
upstream: start process of deprecating the -R flag. This was the
upstream: mention default KDF rounds is now 32
upstream: Implement a maximum number of KDF rounds that will be
upstream: fix the bit length of ML-DSA 44/Ed25519 keys that was
upstream: sftp: be stricter in accepting paths returned by the
upstream: handle max-pk-ok path identically when the incoming user
upstream: Disallow nul byte in received scp -O filename. Not
upstream: backout
upstream: Check that compressed payloads don't inflate beyond the
upstream: ssh-agent: no unlink(2) on empty filename
upstream: ssh-agent: fix socket cleanup for -a option (no pathspec)
upstream: Disable LZ77 dictionary coder to avoid a potential
upstream: check ssh's handling of stale multiplexing sockets From Jens
upstream: avoid race between multiple processes attempting to
upstream: Include local and remote versions in ~I connection info.
Remove the NetBSD BROKEN_READ_COMPARISON workaround.
Ignore build/install status of netcat in tests.
Add FreeBSD 15 test targets.
upstream: Better wording.
upstream: use Nm instead of Xr to self
Don't deref NULL on STREAMS tty alloc failure.
upstream: Plug leak. CID 913600.
upstream: an abbreviation ending in a dot at EOL requires escaping
upstream: tweak 1.406: minor wording and markup OK djm@
upstream: draft-ietf-sshm-ssh-agent became RFC 9987 ok dtucker@
Remove leftover from testing.
Add fallback for mkdir_path() without openat().
upstream: Use >= instead of > for max comparison so that the
upstream: Use equality not assignment in ternary. CID 913600.
upstream: spelling; ok deraadt@
Also skip scp3 test on Darwin 26 and 27.
upstream: convert channel timeouts to use floating points, allows
upstream: masking signals requried sigaddset, not sigdelset; bz3981
upstream: bz3635 - ssh-add -P to skip PIN entry
upstream: simpler
upstream: leaks on error paths; spotted by Coverity CID 913598
upstream: fix inverted logic that could cause a memleak; spotted en
upstream: Add missing semicolon after return. CID 913599, ok
upstream: correctly check sshauthopt->restricted merging
unbreak readpassphrase.c sync
sync readpassphrase(3) with OpenBSD libc
upstream: whitespace
upstream: adapt to libsodium ed25519 implementation
upstream: missing part of previous commit: update script to
upstream: switch from SUPERCOP ed25519 to libsodium
upstream: Only store GSSAPI creds when authn succeeds
upstream: Reset GSSAPI client state before authentication
upstream: Correctly handle some options that accept "none"
upstream: Propagate authorized_keys "resrict" keyword
upstream: Check key and CA sig type during key parsing
upstream: Add WarnWeakCrypto to sshd
upstream: Allow specification of agent socket directories
upstream: Account pubkey checks separately to auth attempts
upstream: Extend TCPKeepAlive to support forwardings too
upstream: Mask SIGTERM/SIGQUIT when processing a SIGHUP restart
fix merge botch that put lines in wrong function
upstream: Correct handling of DST when converting dates
upstream: sk-usbhid: preserve UV requirement for resident keys
upstream: Fix memory leak on an error path in mkdir_path
upstream: sftp: don't crash when glob(3) results lack stat information
openpty: mark inputs const
upstream: replace testing of vendor PQ signature algorithm
upstream: minor leak of fingerprint text when printing
upstream: the default KDF rounds for keys generated by ssh-keygen
Don't link sshd against libselinux
upstream: warnings fixes (static vs missing prototype, sign conversion)
sshd doesn't need sshpty.c any more
upstream: wrap line
upstream: g/c prototype
upstream: disconnect_controlling_tty() is the only thing from sshpty.c
upstream: Fix ChannelTimeout specificity
allow madvise(..., MADV_DONTNEED_LOCKED)
upstream: fix case for ssh -G option output; bz4005, reported by
upstream: mux proxy sockets also share in and out fds, so using
upstream: don't attempt to set TCP_NODELAY on non-AF_INET[6]
upstream: add a "hexdump" export mode that dumps the key blob in
upstream: Add '-p' to sftp mkdir/lmkdir to create directories as
upstream: Use getexecpath(3); if it fails use argv[0] as before
upstream: Change three paragraphs in different parts of the manual
upstream: update fingerprint example from RSA to Ed25519 host key
upstream: Remove scp '-s' flag from synopsis, the flag has been a
set -Wno-error=discarded-qualifiers
seccomp sandbox:

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.5p1.bb => openssh_10.6p1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.5p1.bb => openssh_10.6p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..aa25f09537 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From af460c6fc73213c41a498dc15f72e6e64f2342f1 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.6p1.bb
index 052686f289..6043f140b3 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
+SRC_URI[sha256sum] = "a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.47.1


--===============8853594108126803958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.5p1-10.6p1.patch"

RnJvbSBkYWU0OWFkZTM3ZmFmZTRkZDI3ZDNhZWMzZDNmYzM5ZmU0ZWY2YWQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNyBPY3QgMjAyNiAwNToyMjozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgMTAuNXAxIC0+IDEwLjZwMQoKLmRlcGVuZAp1cGRhdGUgUlBNIHNwZWMg
ZmlsZXMKdXBzdHJlYW06IG9wZW5zc2gtMTAuNgp1cHN0cmVhbTogQWRkIHRlc3QgZm9yIHByb3h5
Y29tbWFuZCBwZXJjZW50IGV4cGFuc2lvbnMuCnVwc3RyZWFtOiBiYWNrb3V0IHJlZ3Jlc3MgYml0
cyByZWxhdGVkIHRvIG11bHRpcGxleGluZyBjaGFuZ2UKcmVtb3ZlIHRoZSAtLWRpc2FibGUtZmQt
cGFzc2luZyBjb25maWd1cmUgb3B0aW9uCmRpc2FibGUgZmVhdHVyZXMgd2hlbiBwb3N0LWF1dGgg
c3NoZCBydW5zIGFzIHJvb3QKRG9uJ3QgYXV0b21hdGljYWxseSBlbmFibGUgRk9SVElGWV9TT1VS
Q0UuCnVwc3RyZWFtOiBGdXJ0aGVyIHJlc3RyaWN0IHRoZSBjaGFyYWN0ZXJzIGFsbG93ZWQgaW4g
YSBjb21tYW5kLWxpbmUKUmVtb3ZlIE5ldEJTRCA5LjAgdGVzdCB0YXJnZXQuClJlcGxhY2UgbmF0
aXZlIEFSTSBydW5uZXIgd2l0aCByZW1vdGUgcnVubmVyLgpQdWxsIG9sZGVyIE5ldEJTRCBzdWRv
IHBhY2thZ2UgZnJvbSBhcmNoaXZlLgp1cHN0cmVhbTogbWFrZSBTdHJlYW1Mb2NhbEJpbmRNYXNr
IHByb3Blcmx5IGZpcnN0LW1hdGNoLXdpbnM7CnVwc3RyZWFtOiBtYWtlIFN0cmVhbUxvY2FsQmlu
ZE1hc2sgcHJvcGVybHkgcmVzcGVjdCBIb3N0L01hdGNoCnVwc3RyZWFtOiBzdGFydCBwcm9jZXNz
IG9mIGRlcHJlY2F0aW5nIHRoZSAtUiBmbGFnLiBUaGlzIHdhcyB0aGUKdXBzdHJlYW06IG1lbnRp
b24gZGVmYXVsdCBLREYgcm91bmRzIGlzIG5vdyAzMgp1cHN0cmVhbTogSW1wbGVtZW50IGEgbWF4
aW11bSBudW1iZXIgb2YgS0RGIHJvdW5kcyB0aGF0IHdpbGwgYmUKdXBzdHJlYW06IGZpeCB0aGUg
Yml0IGxlbmd0aCBvZiBNTC1EU0EgNDQvRWQyNTUxOSBrZXlzIHRoYXQgd2FzCnVwc3RyZWFtOiBz
ZnRwOiBiZSBzdHJpY3RlciBpbiBhY2NlcHRpbmcgcGF0aHMgcmV0dXJuZWQgYnkgdGhlCnVwc3Ry
ZWFtOiBoYW5kbGUgbWF4LXBrLW9rIHBhdGggaWRlbnRpY2FsbHkgd2hlbiB0aGUgaW5jb21pbmcg
dXNlcgp1cHN0cmVhbTogRGlzYWxsb3cgbnVsIGJ5dGUgaW4gcmVjZWl2ZWQgc2NwIC1PIGZpbGVu
YW1lLiBOb3QKdXBzdHJlYW06IGJhY2tvdXQKdXBzdHJlYW06IENoZWNrIHRoYXQgY29tcHJlc3Nl
ZCBwYXlsb2FkcyBkb24ndCBpbmZsYXRlIGJleW9uZCB0aGUKdXBzdHJlYW06IHNzaC1hZ2VudDog
bm8gdW5saW5rKDIpIG9uIGVtcHR5IGZpbGVuYW1lCnVwc3RyZWFtOiBzc2gtYWdlbnQ6IGZpeCBz
b2NrZXQgY2xlYW51cCBmb3IgLWEgb3B0aW9uIChubyBwYXRoc3BlYykKdXBzdHJlYW06IERpc2Fi
bGUgTFo3NyBkaWN0aW9uYXJ5IGNvZGVyIHRvIGF2b2lkIGEgcG90ZW50aWFsCnVwc3RyZWFtOiBj
aGVjayBzc2gncyBoYW5kbGluZyBvZiBzdGFsZSBtdWx0aXBsZXhpbmcgc29ja2V0cyBGcm9tIEpl
bnMKdXBzdHJlYW06IGF2b2lkIHJhY2UgYmV0d2VlbiBtdWx0aXBsZSBwcm9jZXNzZXMgYXR0ZW1w
dGluZyB0bwp1cHN0cmVhbTogSW5jbHVkZSBsb2NhbCBhbmQgcmVtb3RlIHZlcnNpb25zIGluIH5J
IGNvbm5lY3Rpb24gaW5mby4KUmVtb3ZlIHRoZSBOZXRCU0QgQlJPS0VOX1JFQURfQ09NUEFSSVNP
TiB3b3JrYXJvdW5kLgpJZ25vcmUgYnVpbGQvaW5zdGFsbCBzdGF0dXMgb2YgbmV0Y2F0IGluIHRl
c3RzLgpBZGQgRnJlZUJTRCAxNSB0ZXN0IHRhcmdldHMuCnVwc3RyZWFtOiBCZXR0ZXIgd29yZGlu
Zy4KdXBzdHJlYW06IHVzZSBObSBpbnN0ZWFkIG9mIFhyIHRvIHNlbGYKRG9uJ3QgZGVyZWYgTlVM
TCBvbiBTVFJFQU1TIHR0eSBhbGxvYyBmYWlsdXJlLgp1cHN0cmVhbTogUGx1ZyBsZWFrLiBDSUQg
OTEzNjAwLgp1cHN0cmVhbTogYW4gYWJicmV2aWF0aW9uIGVuZGluZyBpbiBhIGRvdCBhdCBFT0wg
cmVxdWlyZXMgZXNjYXBpbmcKdXBzdHJlYW06IHR3ZWFrIDEuNDA2OiBtaW5vciB3b3JkaW5nIGFu
ZCBtYXJrdXAgT0sgZGptQAp1cHN0cmVhbTogZHJhZnQtaWV0Zi1zc2htLXNzaC1hZ2VudCBiZWNh
bWUgUkZDIDk5ODcgb2sgZHR1Y2tlckAKUmVtb3ZlIGxlZnRvdmVyIGZyb20gdGVzdGluZy4KQWRk
IGZhbGxiYWNrIGZvciBta2Rpcl9wYXRoKCkgd2l0aG91dCBvcGVuYXQoKS4KdXBzdHJlYW06IFVz
ZSA+PSBpbnN0ZWFkIG9mID4gZm9yIG1heCBjb21wYXJpc29uIHNvIHRoYXQgdGhlCnVwc3RyZWFt
OiBVc2UgZXF1YWxpdHkgbm90IGFzc2lnbm1lbnQgaW4gdGVybmFyeS4gQ0lEIDkxMzYwMC4KdXBz
dHJlYW06IHNwZWxsaW5nOyBvayBkZXJhYWR0QApBbHNvIHNraXAgc2NwMyB0ZXN0IG9uIERhcndp
biAyNiBhbmQgMjcuCnVwc3RyZWFtOiBjb252ZXJ0IGNoYW5uZWwgdGltZW91dHMgdG8gdXNlIGZs
b2F0aW5nIHBvaW50cywgYWxsb3dzCnVwc3RyZWFtOiBtYXNraW5nIHNpZ25hbHMgcmVxdXJpZWQg
c2lnYWRkc2V0LCBub3Qgc2lnZGVsc2V0OyBiejM5ODEKdXBzdHJlYW06IGJ6MzYzNSAtIHNzaC1h
ZGQgLVAgdG8gc2tpcCBQSU4gZW50cnkKdXBzdHJlYW06IHNpbXBsZXIKdXBzdHJlYW06IGxlYWtz
IG9uIGVycm9yIHBhdGhzOyBzcG90dGVkIGJ5IENvdmVyaXR5IENJRCA5MTM1OTgKdXBzdHJlYW06
IGZpeCBpbnZlcnRlZCBsb2dpYyB0aGF0IGNvdWxkIGNhdXNlIGEgbWVtbGVhazsgc3BvdHRlZCBl
bgp1cHN0cmVhbTogQWRkIG1pc3Npbmcgc2VtaWNvbG9uIGFmdGVyIHJldHVybi4gQ0lEIDkxMzU5
OSwgb2sKdXBzdHJlYW06IGNvcnJlY3RseSBjaGVjayBzc2hhdXRob3B0LT5yZXN0cmljdGVkIG1l
cmdpbmcKdW5icmVhayByZWFkcGFzc3BocmFzZS5jIHN5bmMKc3luYyByZWFkcGFzc3BocmFzZSgz
KSB3aXRoIE9wZW5CU0QgbGliYwp1cHN0cmVhbTogd2hpdGVzcGFjZQp1cHN0cmVhbTogYWRhcHQg
dG8gbGlic29kaXVtIGVkMjU1MTkgaW1wbGVtZW50YXRpb24KdXBzdHJlYW06IG1pc3NpbmcgcGFy
dCBvZiBwcmV2aW91cyBjb21taXQ6IHVwZGF0ZSBzY3JpcHQgdG8KdXBzdHJlYW06IHN3aXRjaCBm
cm9tIFNVUEVSQ09QIGVkMjU1MTkgdG8gbGlic29kaXVtCnVwc3RyZWFtOiBPbmx5IHN0b3JlIEdT
U0FQSSBjcmVkcyB3aGVuIGF1dGhuIHN1Y2NlZWRzCnVwc3RyZWFtOiBSZXNldCBHU1NBUEkgY2xp
ZW50IHN0YXRlIGJlZm9yZSBhdXRoZW50aWNhdGlvbgp1cHN0cmVhbTogQ29ycmVjdGx5IGhhbmRs
ZSBzb21lIG9wdGlvbnMgdGhhdCBhY2NlcHQgIm5vbmUiCnVwc3RyZWFtOiBQcm9wYWdhdGUgYXV0
aG9yaXplZF9rZXlzICJyZXNyaWN0IiBrZXl3b3JkCnVwc3RyZWFtOiBDaGVjayBrZXkgYW5kIENB
IHNpZyB0eXBlIGR1cmluZyBrZXkgcGFyc2luZwp1cHN0cmVhbTogQWRkIFdhcm5XZWFrQ3J5cHRv
IHRvIHNzaGQKdXBzdHJlYW06IEFsbG93IHNwZWNpZmljYXRpb24gb2YgYWdlbnQgc29ja2V0IGRp
cmVjdG9yaWVzCnVwc3RyZWFtOiBBY2NvdW50IHB1YmtleSBjaGVja3Mgc2VwYXJhdGVseSB0byBh
dXRoIGF0dGVtcHRzCnVwc3RyZWFtOiBFeHRlbmQgVENQS2VlcEFsaXZlIHRvIHN1cHBvcnQgZm9y
d2FyZGluZ3MgdG9vCnVwc3RyZWFtOiBNYXNrIFNJR1RFUk0vU0lHUVVJVCB3aGVuIHByb2Nlc3Np
bmcgYSBTSUdIVVAgcmVzdGFydApmaXggbWVyZ2UgYm90Y2ggdGhhdCBwdXQgbGluZXMgaW4gd3Jv
bmcgZnVuY3Rpb24KdXBzdHJlYW06IENvcnJlY3QgaGFuZGxpbmcgb2YgRFNUIHdoZW4gY29udmVy
dGluZyBkYXRlcwp1cHN0cmVhbTogc2stdXNiaGlkOiBwcmVzZXJ2ZSBVViByZXF1aXJlbWVudCBm
b3IgcmVzaWRlbnQga2V5cwp1cHN0cmVhbTogRml4IG1lbW9yeSBsZWFrIG9uIGFuIGVycm9yIHBh
dGggaW4gbWtkaXJfcGF0aAp1cHN0cmVhbTogc2Z0cDogZG9uJ3QgY3Jhc2ggd2hlbiBnbG9iKDMp
IHJlc3VsdHMgbGFjayBzdGF0IGluZm9ybWF0aW9uCm9wZW5wdHk6IG1hcmsgaW5wdXRzIGNvbnN0
CnVwc3RyZWFtOiByZXBsYWNlIHRlc3Rpbmcgb2YgdmVuZG9yIFBRIHNpZ25hdHVyZSBhbGdvcml0
aG0KdXBzdHJlYW06IG1pbm9yIGxlYWsgb2YgZmluZ2VycHJpbnQgdGV4dCB3aGVuIHByaW50aW5n
CnVwc3RyZWFtOiB0aGUgZGVmYXVsdCBLREYgcm91bmRzIGZvciBrZXlzIGdlbmVyYXRlZCBieSBz
c2gta2V5Z2VuCkRvbid0IGxpbmsgc3NoZCBhZ2FpbnN0IGxpYnNlbGludXgKdXBzdHJlYW06IHdh
cm5pbmdzIGZpeGVzIChzdGF0aWMgdnMgbWlzc2luZyBwcm90b3R5cGUsIHNpZ24gY29udmVyc2lv
bikKc3NoZCBkb2Vzbid0IG5lZWQgc3NocHR5LmMgYW55IG1vcmUKdXBzdHJlYW06IHdyYXAgbGlu
ZQp1cHN0cmVhbTogZy9jIHByb3RvdHlwZQp1cHN0cmVhbTogZGlzY29ubmVjdF9jb250cm9sbGlu
Z190dHkoKSBpcyB0aGUgb25seSB0aGluZyBmcm9tIHNzaHB0eS5jCnVwc3RyZWFtOiBGaXggQ2hh
bm5lbFRpbWVvdXQgc3BlY2lmaWNpdHkKYWxsb3cgbWFkdmlzZSguLi4sIE1BRFZfRE9OVE5FRURf
TE9DS0VEKQp1cHN0cmVhbTogZml4IGNhc2UgZm9yIHNzaCAtRyBvcHRpb24gb3V0cHV0OyBiejQw
MDUsIHJlcG9ydGVkIGJ5CnVwc3RyZWFtOiBtdXggcHJveHkgc29ja2V0cyBhbHNvIHNoYXJlIGlu
IGFuZCBvdXQgZmRzLCBzbyB1c2luZwp1cHN0cmVhbTogZG9uJ3QgYXR0ZW1wdCB0byBzZXQgVENQ
X05PREVMQVkgb24gbm9uLUFGX0lORVRbNl0KdXBzdHJlYW06IGFkZCBhICJoZXhkdW1wIiBleHBv
cnQgbW9kZSB0aGF0IGR1bXBzIHRoZSBrZXkgYmxvYiBpbgp1cHN0cmVhbTogQWRkICctcCcgdG8g
c2Z0cCBta2Rpci9sbWtkaXIgdG8gY3JlYXRlIGRpcmVjdG9yaWVzIGFzCnVwc3RyZWFtOiBVc2Ug
Z2V0ZXhlY3BhdGgoMyk7IGlmIGl0IGZhaWxzIHVzZSBhcmd2WzBdIGFzIGJlZm9yZQp1cHN0cmVh
bTogQ2hhbmdlIHRocmVlIHBhcmFncmFwaHMgaW4gZGlmZmVyZW50IHBhcnRzIG9mIHRoZSBtYW51
YWwKdXBzdHJlYW06IHVwZGF0ZSBmaW5nZXJwcmludCBleGFtcGxlIGZyb20gUlNBIHRvIEVkMjU1
MTkgaG9zdCBrZXkKdXBzdHJlYW06IFJlbW92ZSBzY3AgJy1zJyBmbGFnIGZyb20gc3lub3BzaXMs
IHRoZSBmbGFnIGhhcyBiZWVuIGEKc2V0IC1Xbm8tZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnMK
c2VjY29tcCBzYW5kYm94OgoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyA1MDAw
IGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNo
bWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLjEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlu
cHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCB8IDIgKy0KIC4uLi9vcGVuc3NoL3tv
cGVuc3NoXzEwLjVwMS5iYiA9PiBvcGVuc3NoXzEwLjZwMS5iYn0gICAgICAgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC97b3BlbnNzaF8xMC41cDEuYmIgPT4g
b3BlbnNzaF8xMC42cDEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQt
YW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91
dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoCmluZGV4IGY0MjQyODhlMzcuLmFhMjVmMDk1MzcgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEt
cmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJl
Z3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjYzg5N2ZlMmVmZmU1NDllMWUyODBjMmY2MDZiY2U4YjUz
MmI2MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGFmNDYwYzZmYzczMjEzYzQxYTQ5
OGRjMTVmNzJlNmU2NGYyMzQyZjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaWtr
byBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5hcm8ub3JnPgogRGF0ZTogTW9uLCAxMSBTZXAgMjAy
MyAwOTo1NToyMSArMDEwMAogU3ViamVjdDogW1BBVENIXSByZWdyZXNzL2Jhbm5lci5zaDogbG9n
IGlucHV0IGFuZCBvdXRwdXQgZmlsZXMgb24gZXJyb3IKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjVwMS5iYiBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjZwMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8x
MC41cDEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVu
c3NoXzEwLjZwMS5iYgppbmRleCAwNTI2ODZmMjg5Li42MDQzZjE0MGIzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC41cDEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuNnAxLmJiCkBAIC0y
NSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5C
U0QvT3BlblNTSC9wb3J0YWJsZS9vcGVuc3NoLSR7UFZ9LnRhCiAgICAgICAgICAgIGZpbGU6Ly9z
c2hkX2NoZWNrX2tleXMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1yZWdyZXNzLWJhbm5lci5z
aC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0NGQyOGE4MzllYTlkYWY5NjljYzY5MTUwZmRlNTk5
MTBiMmIzOTM2MWRhZDgxYTNiZDZjYmQxOTIxOGRiMTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YTlkYzk1NjVkZmZlODY0MGY2NGQ4NjNjZDI5YTMyYmM0YTNkYmRlYzA1NjZhN2ZjNDRjNWQ2ZWU3
NjdkNWYzOSIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAwNy0yNzY4XSA9ICJub3QtYXBwbGljYWJsZS1j
b25maWc6IFRoaXMgQ1ZFIGlzIHNwZWNpZmljIHRvIE9wZW5TU0ggd2l0aCB0aGUgcGFtIG9waWUg
d2hpY2ggd2UgZG9uJ3QgYnVpbGQvdXNlIGhlcmUuIgogCi0tIAoyLjQ3LjEKCg==

--===============8853594108126803958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.5p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.6p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch"
packages/x86-64-v3-poky-linux/openssh: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 41238880 to 41417456 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGSIZE changed from 359571 to 363454 (+1%)
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2481365 to 2501845 (+1%)
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 8473505 to 8499598 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGSIZE changed from 231864 to 235960 (+2%)
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PKGSIZE changed from 170160 to 174256 (+2%)
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/hostkeys -> /usr/src/debug/openssh/10.6p1/regress/unittests/hostkeys, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/bitmap -> /usr/src/debug/openssh/10.6p1/regress/unittests/bitmap, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/match -> /usr/src/debug/openssh/10.6p1/regress/unittests/match, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/crypto -> /usr/src/debug/openssh/10.6p1/regress/unittests/crypto, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/kex -> /usr/src/debug/openssh/10.6p1/regress/unittests/kex, directory renamed /usr/src/debug/openssh/10.5p1 -> /usr/src/debug/openssh/10.6p1, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/authopt -> /usr/src/debug/openssh/10.6p1/regress/unittests/authopt, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests
 /misc -> /usr/src/debug/openssh/10.6p1/regress/unittests/misc, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/test_helper -> /usr/src/debug/openssh/10.6p1/regress/unittests/test_helper, directory renamed /usr/src/debug/openssh/10.5p1/openbsd-compat -> /usr/src/debug/openssh/10.6p1/openbsd-compat, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/sshsig -> /usr/src/debug/openssh/10.6p1/regress/unittests/sshsig, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/sshkey -> /usr/src/debug/openssh/10.6p1/regress/unittests/sshkey, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/servconf -> /usr/src/debug/openssh/10.6p1/regress/unittests/servconf, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/sshbuf -> /usr/src/debug/openssh/10.6p1/regress/unittests/sshbuf, directory renamed /usr/src/debug/openssh/10.5p1/regress -> /usr/src/debug/openssh/10.6p1/regress, directory renamed /usr/src/debug/openssh/10.5p1/re
 gress/unittests/conversion -> /usr/src/debug/openssh/10.6p1/regress/unittests/conversion, directory renamed /usr/src/debug/openssh/10.5p1/regress/unittests/utf8 -> /usr/src/debug/openssh/10.6p1/regress/unittests/utf8
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGSIZE changed from 4839579 to 4856148 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-src: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 3490200 to 3506584 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PV changed from "10.5p1" to "10.6p1"
packages/x86-64-v3-poky-linux/openssh/openssh: PKGV changed from 10.5p1 [default] to 10.6p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh: PV changed from "10.5p1" to "10.6p1"

--===============8853594108126803958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="openssh-changelog.txt"

.depend
update RPM spec files
upstream: openssh-10.6
upstream: Add test for proxycommand percent expansions.
upstream: backout regress bits related to multiplexing change
remove the --disable-fd-passing configure option
disable features when post-auth sshd runs as root
Don't automatically enable FORTIFY_SOURCE.
upstream: Further restrict the characters allowed in a command-line
Remove NetBSD 9.0 test target.
Replace native ARM runner with remote runner.
Pull older NetBSD sudo package from archive.
upstream: make StreamLocalBindMask properly first-match-wins;
upstream: make StreamLocalBindMask properly respect Host/Match
upstream: start process of deprecating the -R flag. This was the
upstream: mention default KDF rounds is now 32
upstream: Implement a maximum number of KDF rounds that will be
upstream: fix the bit length of ML-DSA 44/Ed25519 keys that was
upstream: sftp: be stricter in accepting paths returned by the
upstream: handle max-pk-ok path identically when the incoming user
upstream: Disallow nul byte in received scp -O filename. Not
upstream: backout
upstream: Check that compressed payloads don't inflate beyond the
upstream: ssh-agent: no unlink(2) on empty filename
upstream: ssh-agent: fix socket cleanup for -a option (no pathspec)
upstream: Disable LZ77 dictionary coder to avoid a potential
upstream: check ssh's handling of stale multiplexing sockets From Jens
upstream: avoid race between multiple processes attempting to
upstream: Include local and remote versions in ~I connection info.
Remove the NetBSD BROKEN_READ_COMPARISON workaround.
Ignore build/install status of netcat in tests.
Add FreeBSD 15 test targets.
upstream: Better wording.
upstream: use Nm instead of Xr to self
Don't deref NULL on STREAMS tty alloc failure.
upstream: Plug leak. CID 913600.
upstream: an abbreviation ending in a dot at EOL requires escaping
upstream: tweak 1.406: minor wording and markup OK djm@
upstream: draft-ietf-sshm-ssh-agent became RFC 9987 ok dtucker@
Remove leftover from testing.
Add fallback for mkdir_path() without openat().
upstream: Use >= instead of > for max comparison so that the
upstream: Use equality not assignment in ternary. CID 913600.
upstream: spelling; ok deraadt@
Also skip scp3 test on Darwin 26 and 27.
upstream: convert channel timeouts to use floating points, allows
upstream: masking signals requried sigaddset, not sigdelset; bz3981
upstream: bz3635 - ssh-add -P to skip PIN entry
upstream: simpler
upstream: leaks on error paths; spotted by Coverity CID 913598
upstream: fix inverted logic that could cause a memleak; spotted en
upstream: Add missing semicolon after return. CID 913599, ok
upstream: correctly check sshauthopt->restricted merging
unbreak readpassphrase.c sync
sync readpassphrase(3) with OpenBSD libc
upstream: whitespace
upstream: adapt to libsodium ed25519 implementation
upstream: missing part of previous commit: update script to
upstream: switch from SUPERCOP ed25519 to libsodium
upstream: Only store GSSAPI creds when authn succeeds
upstream: Reset GSSAPI client state before authentication
upstream: Correctly handle some options that accept "none"
upstream: Propagate authorized_keys "resrict" keyword
upstream: Check key and CA sig type during key parsing
upstream: Add WarnWeakCrypto to sshd
upstream: Allow specification of agent socket directories
upstream: Account pubkey checks separately to auth attempts
upstream: Extend TCPKeepAlive to support forwardings too
upstream: Mask SIGTERM/SIGQUIT when processing a SIGHUP restart
fix merge botch that put lines in wrong function
upstream: Correct handling of DST when converting dates
upstream: sk-usbhid: preserve UV requirement for resident keys
upstream: Fix memory leak on an error path in mkdir_path
upstream: sftp: don't crash when glob(3) results lack stat information
openpty: mark inputs const
upstream: replace testing of vendor PQ signature algorithm
upstream: minor leak of fingerprint text when printing
upstream: the default KDF rounds for keys generated by ssh-keygen
Don't link sshd against libselinux
upstream: warnings fixes (static vs missing prototype, sign conversion)
sshd doesn't need sshpty.c any more
upstream: wrap line
upstream: g/c prototype
upstream: disconnect_controlling_tty() is the only thing from sshpty.c
upstream: Fix ChannelTimeout specificity
allow madvise(..., MADV_DONTNEED_LOCKED)
upstream: fix case for ssh -G option output; bz4005, reported by
upstream: mux proxy sockets also share in and out fds, so using
upstream: don't attempt to set TCP_NODELAY on non-AF_INET[6]
upstream: add a "hexdump" export mode that dumps the key blob in
upstream: Add '-p' to sftp mkdir/lmkdir to create directories as
upstream: Use getexecpath(3); if it fails use argv[0] as before
upstream: Change three paragraphs in different parts of the manual
upstream: update fingerprint example from RSA to Ed25519 host key
upstream: Remove scp '-s' flag from synopsis, the flag has been a
set -Wno-error=discarded-qualifiers
seccomp sandbox: restrict mremap flags
upstream: reenable ssh-mldsa44-ed25519 at a low priority position
upstream: IANA has allocated a non-vendor codepoint for
upstream: grammar; a -> an
upstream: Bump size of key comment buffers. Prevents warnings on
allow PAMServiceName in Match (regressed in 10.4)
Move le32toh and friends to after platform flags.
Skip scp3 test on macosx 26 until debugged.
Remove ubuntu-26.04-arm kitchensink test target.
special treatment for a more Turkic languages
Group command for Yubico PPA correctly.
Make FIDO2 packages optional.
Update dependencies for Debian derivatives.
Install libcrypt-dev package.
Fix quoting in failed log output step.
Add newer OS X and Ubunty 26.04 test targets.
Require kSBXProfilePureComputation for OS X sandbox.
upstream: Refer to id_mldsa44_ed25519.pub in the pubkey list. bz#3989.
Add instructions for pin_actions.
Update NetBSD vmaction pin to pick up 11.0 release.
Update x11-ssh-askpass upstream location.
Add NetBSD 11.0 test targets.
Add 10.5 branch to test status display.
whitespace at eol

--===============8853594108126803958==--


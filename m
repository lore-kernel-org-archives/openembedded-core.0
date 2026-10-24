Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1828.1792822996286428918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GdSb36tw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qXN9XAAu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a16c93e8ad-771992de-8202-4dcb-9615-9c6e6d1ff456-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822995;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=jzGFAYnR0M/9jffujVkoVs6kwOvIpfWE4uMRnneVZw4=;
	b=GdSb36tw9VomVAj0ApO8D5Odwrz4ku2pU3AsEIiW/aedBu+ZjMl6F4QwX7oWcoVm
	VibsJPyBM6h6Bj04j6zpiLz0HlehJDBy6UBbElf0d1lq4/Otq5txb+4qgSJPLFqQ3Fk
	c3QDMHVEaBG0wBP5sBjWHDDanF7T/7OEhv48PcA4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822995;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=jzGFAYnR0M/9jffujVkoVs6kwOvIpfWE4uMRnneVZw4=;
	b=qXN9XAAutQWeFmiL25m5BOwGl9o15FJje6eESnnczC7Wez3n7RTg4SJB40S8EeO2
	2nlkHapgf/Tv6dlAYlqfDdNFYPK8WgCMTKSmktqWNiDs62WfRGTRm8TCaPiks5S54ys
	UkWhC7+uKkZIf023SbkbccY86qvF9tQXb+Pjo5Uw=
Content-Type: multipart/mixed; boundary="===============8661318910553472812=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssl: upgrading to 4.1.0 FAILED
Message-ID: <010101a16c93e8ad-771992de-8202-4dcb-9615-9c6e6d1ff456-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248574

--===============8661318910553472812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssl* to *4.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe openssl failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1996 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-ae5cafacec8e99c5a27fa5b3b378eefc595910ef"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ae5cafacec8e99c5a27fa5b3b378eefc595910ef"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1997 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-ae5cafacec8e99c5a27fa5b3b378eefc595910ef"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ae5cafacec8e99c5a27fa5b3b378eefc595910ef"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   5% |##                                  | ETA:  0:00:02
Adding changed files:  11% |####                                | ETA:  0:00:01
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  22% |########                            | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:00
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching http://www.openssl.org/source/openssl-4.1.0.tar.gz...
INFO: Rebasing devtool onto 4cdf6078e01598a8e79d11b0ddbb66656d7865e4
WARNING: Command 'git rebase 4cdf6078e01598a8e79d11b0ddbb66656d7865e4' failed:
Auto-merging Configurations/unix-Makefile.tmpl
CONFLICT (content): Merge conflict in Configurations/unix-Makefile.tmpl
Auto-merging crypto/build.info

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 4cdf6078e01598a8e79d11b0ddbb66656d7865e4
WARNING: Command 'git rebase 4cdf6078e01598a8e79d11b0ddbb66656d7865e4' failed:
Auto-merging Configurations/unix-Makefile.tmpl
CONFLICT (content): Merge conflict in Configurations/unix-Makefile.tmpl
Auto-merging crypto/build.info

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/openssl
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/openssl/openssl_4.1.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/openssl.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/openssl.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8661318910553472812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="openssl-changelog.txt"

LSBbT3BlblNTTCA0LjFdKCNvcGVuc3NsLTQxKQpPcGVuU1NMIDQuMQotLS0tLS0tLS0tLQoKIyMj
IENoYW5nZXMgYmV0d2VlbiA0LjAgYW5kIDQuMS4wIFsyMyBPY3QgMjAyNl0KICAgKlNoYW5lIExv
bnRpcyBhbmQgUGF1bCBEYWxlKgoKICAgRml4ZWQgVExTIDEuMyBjbGllbnRzIHRvIHJlamVjdCBh
IGBwc2tfdXNlX3Nlc3Npb25gIGNhbGxiYWNrIFBTSyB3aG9zZSBtYXN0ZXIKICAga2V5IGlzIGVt
cHR5LCB3aXRoIGBTU0xfUl9CQURfUFNLYCwgaW5zdGVhZCBvZiBmYWlsaW5nIGxhdGVyIGluIGJp
bmRlcgogICBjb21wdXRhdGlvbi4KCiAgICpWaWt0b3IgRHVraG92bmkqCiAgICpGcmVkZXJpayBX
ZWRlbC1IZWluZW4gYW5kIFJ5YW4gSG9vcGVyKgogICAqV2lsbGlhbSBNY0Nvcm1hY2sqCiAgICpB
ZHJpYW5vIFNlbGEgQXZpbGVzKgogICAqUnlhbiBIb29wZXIqCiAgICpSeWFuIEhvb3BlcioKICAg
Kk5pa29sYXMgR2F1ZGVyKgoKICAgVGhlIHBvaW50IGNvbnZlcnNpb24gZm9ybSAoY29tcHJlc3Nl
ZCwgdW5jb21wcmVzc2VkLCBvciBoeWJyaWQpCiAgIGlzIG5vdyBhIHNpbmdsZSB2YWx1ZSBvbiB0
aGUgYEVDX0dST1VQYCBhbmQgcm91bmQtdHJpcHMKICAgdW5jaGFuZ2VkIHRocm91Z2ggaW1wb3J0
IGFuZCBleHBvcnQgb2YgYEVDX0tFWWAgb2JqZWN0cy4KCiAgIEZyZXNobHkgZ2VuZXJhdGVkIGtl
eXMgaGF2ZSB0aGVpciBwdWJsaWMgcG9pbnQgZW5jb2RlZAogICBpbiB1bmNvbXByZXNzZWQgZm9y
bS4gIEEgYHBvaW50LWZvcm1hdGAgc3VwcGxpZWQgYXQga2V5IGdlbmVyYXRpb24KICAgdGltZSB2
aWEgYE9TU0xfUEtFWV9QQVJBTV9FQ19QT0lOVF9DT05WRVJTSU9OX0ZPUk1BVGAKICAgaXMgdmFs
aWRhdGVkIChhbiBpbnZhbGlkIHZhbHVlIGlzIHJlamVjdGVkKSBidXQgb3RoZXJ3aXNlIGlnbm9y
ZWQKICAgb24gdGhlIGdlbmVyYXRlZCBrZXkuICBFQyBwYXJhbWV0ZXIgZ2VuZXJhdGlvbiBjb250
aW51ZXMKICAgdG8gaG9ub3VyIHRoZSByZXF1ZXN0ZWQgZm9ybSBvbiB0aGUgZ3JvdXAncyBnZW5l
cmF0b3I7ICBpbXBvcnRlZAogICBrZXlzIGtlZXAgdGhlaXIgZm9ybS4KCiAgIFRoZSBgZWNfcG9p
bnRfZm9ybWF0c2AgZXh0ZW5zaW9uIG5vIGxvbmdlciBhZmZlY3RzIFRMUyAxLjIKICAgWC41MDkg
Y2VydGlmaWNhdGUgc2VsZWN0aW9uIG9yIGFjY2VwdGFuY2UuICBPcGVuU1NMIG5vdwogICBhY2Nl
cHRzIGFuIEVDIGNlcnRpZmljYXRlIGluIGFueSBwb2ludCBmb3JtIGl0IGNhbiBkZWNvZGUsCiAg
IGFuZCBzZW5kcyBhbnkgRUMgY2VydGlmaWNhdGUgaXQgaGFzIHJlZ2FyZGxlc3Mgb2YgcG9pbnQg
Zm9ybS4KICAgVExTIDEuMyBkaXNyZWdhcmRzIHRoZSBleHRlbnNpb24gZW50aXJlbHkuCgogICBU
aGUgW1JGQyA0NDkyXVtSRkMgNDQ5MiBTZWN0aW9uIDUuMS4yXS9bODQyMiBzZWN0aW9uIDUuMS4y
XVtSRkMgODQyMiBTZWN0aW9uCiAgIDUuMS4yXQogICByZXF1aXJlbWVudCB0aGF0IHRoZSBwZWVy
J3MgcG9pbnQtZm9ybWF0IGxpc3QgY29udGFpbiAidW5jb21wcmVzc2VkIiBpcyBub3cKICAgZW5m
b3JjZWQgb24gYm90aCBzaWRlcyAocHJldmlvdXNseSBjbGllbnQtb25seSksIGFuZCBvbmx5IHdo
ZW4gYW4gRUNDIFRMUyAxLjIKICAgY2lwaGVyc3VpdGUgaXMgbmVnb3RpYXRlZOKAlGEgbWlzc2lu
ZyAidW5jb21wcmVzc2VkIiBpcyBpZ25vcmVkIHVuZGVyIFRMUyAxLjMKICAgb3Igd2l0aCBhIG5v
bi1FQ0MgY2lwaGVyLgogICA8IS0tIC0tPgoKICAgKlZpa3RvciBEdWtob3ZuaSoKICAgKkRhbmll
bCBLdWJlYyoKICAgKkRtaXRyeSBCZWx5YXZza2l5KgoKICAgSWYgdGhlIGBDTVNfVkVSSUZZX1BB
UlRJQUxgIGZsYWcgaXMgc2V0LCB0aGUgYENNU192ZXJpZnkoKWAgY2FsbAogICBpcyBzdWNjZXNz
ZnVsIGlmIGF0IGxlYXN0IG9uZSBvZiB0aGUgaW5kaXZpZHVhbCBzaWduYXR1cmVzIGNhbiBiZSB2
ZXJpZmllZAogICAoYXMgb3Bwb3NlZCB0byBhbGwgb2YgdGhlbSksIHdoaWNoIG1heSBiZSB1c2Vm
dWwgdG8gZ3JhY2VmdWxseSBoYW5kbGUgdmFyaW91cwogICBzaXR1YXRpb25zLCBsaWtlIG1pc3Np
bmcgQ0FzLCBleHBpcmVkIGNlcnRpZmljYXRlcywgb3IgdW5zdXBwb3J0ZWQKICAgYWxnb3JpdGht
czsgIGFwcGxpY2F0aW9ucyBjYW4gY2FsbCBgQ01TX2dldDBfc2lnbmVycygpYCB0byBjaGVjayBp
ZiB0aGUgc2V0CiAgIG9mIHZhbGlkIHNpZ25hdHVyZXMgc2F0aXNmaWVzIGl0cyBwb2xpY3ksIG9y
IHVzZQogICBgQ01TX1NpZ25lckluZm9fZ2V0X3ZlcmlmaWNhdGlvbl9yZXN1bHQoKWAKICAgYW5k
IGBDTVNfU2lnbmVySW5mb19nZXQwX3NpZ25lcl9jZXJ0KClgIGZ1bmN0aW9ucyB0byBhY2Nlc3Mg
dGhlIGRldGFpbGVkCiAgIHZlcmlmaWNhdGlvbiByZXN1bHRzLgogICA8IS0tIC0tPgoKICAgKkph
biBMw7xiYmUqCgogICBUaGlzIHdvcmsgd2FzIHNwb25zb3JlZCBieSBTaWVtZW5zIEFHLgogICA8
IS0tIC0tPgoKICAgKkRhdmlkIHZvbiBPaGVpbWIqCiAgICpQYXVsIExvdXZlbCoKICAgKkV2eSBH
YXJkZW4qCiAgICpKYWt1YiBaZWxlbmthKgogICAqSm9obiBDbGF1cywgVmlrdG9yIER1a2hvdm5p
LCBhbmQgRGF2aWQgdm9uIE9oZWltYioKCiAgIFdoZW4gYSBwcm92aWRlciByZXF1ZXN0cyBzZWVk
aW5nIG1hdGVyaWFsIGJlZm9yZSB0aGUgcHJpbWFyeSBEUkJHCiAgIGhhcyBiZWVuIGNyZWF0ZWQs
IHRoZSByZXF1ZXN0IGZhbGxzIGJhY2sgdG8gdGhlIG9wZXJhdGluZyBzeXN0ZW0gZW50cm9weQog
ICBzb3VyY2VzLCBiZWNhdXNlIHRoZSBzZWVkIHNvdXJjZSBvbmx5IGNvbWVzIGludG8gZXhpc3Rl
bmNlIGFzIGEgc2lkZQogICBlZmZlY3Qgb2YgY3JlYXRpbmcgdGhlIHByaW1hcnkgRFJCRy4gIFdo
ZXRoZXIgYSBjb25maWd1cmVkIHNlZWQgc291cmNlCiAgIGlzIHVzZWQgdGhlcmVmb3JlIGRlcGVu
ZHMgb24gb3BlcmF0aW9uIG9yZGVyLiAgV2l0aCBgc2VlZF9zdHJpY3RgIGVuYWJsZWQsCiAgIHRo
ZSBzZWVkIHNvdXJjZSBpcyBpbnN0ZWFkIGluc3RhbnRpYXRlZCBvbiBkZW1hbmQgYW5kIGFuIGVy
cm9yIGlzIHJlcG9ydGVkCiAgIGlmIGl0IGNhbm5vdCBiZSB1c2VkLiAgVGhlIG9wdGlvbiBpcyBv
ZmYgYnkgZGVmYXVsdCB3aXRoIHR3byBleGNlcHRpb25zOgogICB0aGUgYEpJVFRFUmAgc2VlZCBz
b3VyY2Ugc2VlZHMgc3RyaWN0bHkgdW5sZXNzIHRoZSBvcHRpb24gZGlzYWJsZXMgaXQsCiAgIGFu
ZCBgZW5hYmxlLWZpcHMtaml0dGVyYCBidWlsZHMgYWx3YXlzIHNlZWQgc3RyaWN0bHkuICBBZGRp
dGlvbmFsbHksCiAgIHRoZSBwcm9wZXJ0eSBxdWVyeSB1c2VkIHRvIGZldGNoIHRoZSBkZWZhdWx0
IHNlZWQgc291cmNlIGNhbiBub3cgYmUgc2V0CiAgIGF0IGJ1aWxkIHRpbWUgd2l0aCBgLURPUEVO
U1NMX0RFRkFVTFRfU0VFRF9QUk9QUWAuCiAgIDwhLS0gLS0+CgogICAqSmFrdWIgWmVsZW5rYSoK
ICAgKkhlbGVuIFpoYW5nKgogICAqTmVpbCBIb3JtYW4qCiAgICpJZ29yIFVzdGlub3YqCiAgICpM
ZW9uIFRpbW1lcm1hbnMqCiAgICpCb2IgQmVjayoKCiAgIFRoZSBuZXcgc2V0dGVyIGZ1bmN0aW9u
cyBkbyBub3QgYXBwZW5kIGEgdGVybWluYXRpbmcgTlVMIGJ5dGUgdG8gdGhlIG5ld2x5CiAgIGFs
bG9jYXRlZCBzdHJpbmdzLCBjb250cmFyeSB0byBoaXN0b3JpYyBgQVNOMV9TVFJJTkdfc2V0KClg
J3MgYmVoYXZpb3VyLAogICBzbyBgQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKClgIG1heSByZXR1cm4g
ZGF0YSBub3QgZm9sbG93ZWQKICAgYnkgYW4gb3V0LW9mLWBBU04xX1NUUklOR19nZXRfbGVuZ3Ro
KClgIGJvdW5kcyBOVUwgYnl0ZSAod2hvc2UgcHJlc2VuY2UKICAgaGFzIG5ldmVyIGJlZW4gZ3Vh
cmFudGVlZCB0aGVyZSBieSBBUEkgY29udHJhY3QpIGluIG1vcmUgY2FzZXMKICAgdGhhbiBpdCB1
c2VkIHRvIGJlZm9yZS4gIEEgZnV0dXJlIHJlbGVhc2Ugd2lsbCBzd2l0Y2ggdG8gdGhlIHVzYWdl
CiAgIG9mIHRoZSBuZXcgQVBJcyBpbnRlcm5hbGx5LgoKICAgV2hlbiBPcGVuU1NMIGlzIGJ1aWx0
IHdpdGggYEFkZHJlc3NTYW5pdGl6ZXJgIG9yIGBNZW1vcnlTYW5pdGl6ZXJgIHN1cHBvcnQsCiAg
IG9yIGlzIHJ1biB1bmRlciBWYWxncmluZCBoYXZpbmcgYmVlbiBidWlsdCB3aGVyZSB0aGUgVmFs
Z3JpbmQgaGVhZGVycwogICBhcmUgaW5zdGFsbGVkLCB0aGUgYWRkZWQgTlVMIGJ5dGUgaXMgbWFy
a2VkIGluYWNjZXNzaWJsZSwgc28gdHJlYXRpbmcKICAgdGhlIHJlc3VsdCBvZiBgQVNOMV9TVFJJ
TkdfZ2V0MF9kYXRhKClgIGFzIGEgQyBzdHJpbmcgKGBzdHJsZW4oKWAsIGAlc2AsCiAgIGBzdHJk
dXAoKWAgYW5kIHRoZSBsaWtlKSBpcyByZXBvcnRlZCBhcyBhbiBlcnJvci4gIEFsbCBzdWNoIHVz
ZXMKICAgbXVzdCBiZSBjaGFuZ2VkIHRvIGhvbm91ciBgQVNOMV9TVFJJTkdfZ2V0X2xlbmd0aCgp
YC4gVGhlIFZhbGdyaW5kCiAgIGNoZWNrIG1heSBiZSBkaXNhYmxlZCBieSBidWlsZGluZyB3aXRo
IGAtRE9QRU5TU0xfTk9fVkFMR1JJTkRfQ0hFQ0tgLgogICA8IS0tIC0tPgogICA8IS0tIC0tPgog
ICA8IS0tIC0tPgoKICAgKkJvYiBCZWNrKgogICAqVG9kZCBTaG9ydCoKICAgKlRpbSBQZXJyeSoK
ICAgKkRpbWl0cmkgSm9obiBMZWRrb3YqCiAgICpEciBQYXVsIERhbGUqCiAgICpDcmFpZyBMb3Jl
bnR6ZW4qCiAgICpEYW5pZWwgS3ViZWMqCiAgICpUb25nIExpKgogICAqQm9iIEJlY2sqCiAgICpH
bGViIFBvcG92KgoKICAgV2hlbiBidWlsZGluZyB3aXRoIGNvbXBpbGVycyB0aGF0IHN1cHBvcnQg
R0NTIChDbGFuZyAxOCssIEdDQyAxNSspLAogICBhc3NlbWJseSBtb2R1bGVzIGFyZSBtYXJrZWQg
YXMgY29tcGF0aWJsZSB3aGVuIGJyYW5jaCBwcm90ZWN0aW9uCiAgIGlzIGVuYWJsZWQgKGUuZy4g
YC1tYnJhbmNoLXByb3RlY3Rpb249c3RhbmRhcmRgKS4gIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcwog
ICB0byB0aGUgYXNzZW1ibHkgaW1wbGVtZW50YXRpb25zIGFyZSByZXF1aXJlZCwgYnV0IGNvbXBs
aWFuY2UgZW5zdXJlcwogICBjb3JyZWN0IG9wZXJhdGlvbiB3aXRoIHNoYWRvdyBzdGFjayBlbmZv
cmNlbWVudC4KICAgPCEtLSAtLT4KCiAgICpHdWlsbGF1bWUgR2FyZGV0IGFuZCBHb3d0aGFtIFN1
cmVzaCBLdW1hcioKICAgKkRhbm55IFRzZW4qCiAgICpNYXJjZWwgQ29ybnUgYW5kIFRvbWFzeiBL
YW50ZWNraSoKICAgKk1hcmNlbCBDb3JudSBhbmQgVG9tYXN6IEthbnRlY2tpKgogICAqTWFkYW4g
TW9oYW4gTWFub2thcioKICAgKkJvYiBCZWNrKgogICAqRW5qaSBDb29wZXIqCiAgICpKYWt1YiBa
ZWxlbmthKgogICAqSmFrdWIgWmVsZW5rYSoKICAgKkJvYiBCZWNrKgogICAqRGFuaWVsIEt1YmVj
IGFuZCBWaWt0b3IgRHVraG92bmkqCiAgICpNb3VuaXIgSURSQVNTSSoKICAgKk1vdW5pciBJRFJB
U1NJKgogICAqVmlrdG9yIER1a2hvdm5pKgogICAqRGFuaWVsIEt1YmVjKgogICAqVmlrdG9yIER1
a2hvdm5pKgogICAqVmlrdG9yIER1a2hvdm5pKgogICAqTW91bmlyIElEUkFTU0kqCiAgICpBZGFt
IFRhYmFrKgogICAqSm9obiBDbGF1cyoKICAgKkpha3ViIFplbGVua2EqCiAgICpNaWxhbiBCcm/F
vioKICAgKlBhdWwgR3J1YmJzKgogICAqQm9iIEJlY2sqCiAgICpTaHJlZW5pZGhpIFNoZWRpKgog
ICAqSmFrdWIgWmVsZW5rYSoKICAgKkJvYiBCZWNrKgogICAqQm9iIEJlY2sqCiAgICpTaGFuZSBM
b250aXMqCiAgICpCb2IgQmVjayoKICAgKk5vcmJlcnQgUMOzY3MqCiAgICpCb2IgQmVjayoKICAg
KkJvYiBCZWNrKgogICAqQm9iIEJlY2sqCiAgICpUb23DocWhIE1yw6F6KgogICBJc3N1ZSBzdW1t
YXJ5OiBUaGUgT3BlblNTTCBRVUlDIHNlcnZlciwgd2hlbiBjb25maWd1cmVkIHRvIG5vdCBwZXJm
b3JtCiAgIFRoaXMgd29yayB3YXMgc3BvbnNvcmVkIGJ5IFNpZW1lbnMgQUcuCiAgICpEYXZpZCB2
b24gT2hlaW1iKgoKICAgd2hlcmUgdGhlIChub24tZGVmYXVsdCkgZmxhZyBPQ1NQX05PQ0hFQ0tT
IGlzIHVzZWQgdG8gcmV0dXJuIGEgcG9zaXRpdmUKICAgICAgICAgICBOQ09ORl9nZXRfc2VjdGlv
biwgTkNPTkZfZ2V0X3N0cmluZywgTkNPTkZfZ2V0X251bWJlcgpbUkZDIDQ0OTIgU2VjdGlvbiA1
LjEuMl06Cmh0dHBzOi8vZGF0YXRyYWNrZXIuaWV0Zi5vcmcvZG9jL2h0bWwvcmZjNDQ5MiNzZWN0
aW9uLTUuMS4yCltSRkMgNTI4MF06IGh0dHBzOi8vZGF0YXRyYWNrZXIuaWV0Zi5vcmcvZG9jL2h0
bWwvcmZjNTI4MApbUkZDIDUyODAgU2VjdGlvbiA2LjMuM106Cmh0dHBzOi8vZGF0YXRyYWNrZXIu
aWV0Zi5vcmcvZG9jL2h0bWwvcmZjNTI4MCNzZWN0aW9uLTYuMy4zCltSRkMgNTY1Ml06IGh0dHBz
Oi8vZGF0YXRyYWNrZXIuaWV0Zi5vcmcvZG9jL2h0bWwvcmZjNTY1MgpbUkZDIDc2ODVdOiBodHRw
czovL2RhdGF0cmFja2VyLmlldGYub3JnL2RvYy9odG1sL3JmYzc2ODUKW1JGQyA4NDIyIFNlY3Rp
b24gNS4xLjJdOgpodHRwczovL2RhdGF0cmFja2VyLmlldGYub3JnL2RvYy9odG1sL3JmYzg0MjIj
c2VjdGlvbi01LjEuMgpbUkZDIDg3MDFdOiBodHRwczovL2RhdGF0cmFja2VyLmlldGYub3JnL2Rv
Yy9odG1sL3JmYzg3MDEKW1JGQyA5MTQ3XTogaHR0cHM6Ly9kYXRhdHJhY2tlci5pZXRmLm9yZy9k
b2MvaHRtbC9yZmM5MTQ3CltSRkMgOTE0OV06IGh0dHBzOi8vZGF0YXRyYWNrZXIuaWV0Zi5vcmcv
ZG9jL2h0bWwvcmZjOTE0OQpbUkZDIDk4NDZdOiBodHRwczovL2RhdGF0cmFja2VyLmlldGYub3Jn
L2RvYy9odG1sL3JmYzk4NDYKW1JGQyA5ODQ2IFNlY3Rpb24gNC4zLjEwXToKaHR0cHM6Ly9kYXRh
dHJhY2tlci5pZXRmLm9yZy9kb2MvaHRtbC9yZmM5ODQ2I3NlY3Rpb24tNC4zLjEwCltTRUNHIFNF
QyAxIFNlY3Rpb24gMi4zLjRdOiBodHRwczovL3d3dy5zZWNnLm9yZy9zZWMxLXYyLnBkZiNzdWJz
dWJzZWN0aW9uLjIuMy40CltUQ0cgQ3JlZGVudGlhbCBQcm9maWxlcyBzcGVjaWZpY2F0aW9uIFZl
cnNpb24gMS4yLCBTZWN0aW9uIDMuMi43XToKaHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3JvdXAu
b3JnL3dwLQpjb250ZW50L3VwbG9hZHMvQ3JlZGVudGlhbF9Qcm9maWxlc19WMS4yX0xldmVsMl9S
ZXZpc2lvbjgucGRmI3BhZ2U9MzUK

--===============8661318910553472812==--

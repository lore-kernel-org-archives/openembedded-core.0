Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD1AC79FA1
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:54:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33712.1789109657512467976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 23:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WtM4Nb1z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OaP8gYzp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a08f3edb73-99cb3823-a627-4b21-b56c-99ddaa8c2396-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789109656;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wP1p0whVF3nNwZeXRnpUMfZ/uIwFycowOO8Tj4uBhGo=;
	b=WtM4Nb1zEzTSmE5wD171cFZN8x08yMbcviwsibebkWn2ScQwaVqNqA4ZjJ9vsxLJ
	x7UZMo4oMCEMoqB1QnTNozYcNQzgXLC2aPzeYTztjiktynkzp1k3OnOYmAeBEgRKaSD
	OxvQu5Uztk846gEgCACDDrNUlwPPTuXco2vWARIs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789109656;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wP1p0whVF3nNwZeXRnpUMfZ/uIwFycowOO8Tj4uBhGo=;
	b=OaP8gYzpo1Tl02CqFWlqp/age72aHfzmbYPDZrfLES1ZK71Ewe8HqaQIBtxAnk1K
	+pmnGI8ATmu8nzK/ihmH5PxZkVyZvSK6iK+/7P8C4e2COel3z37NFzQgGEB13D8x471
	xTa1iRWMwmjk3moCwRY5v9BdQwmeINqLv3fbl8Uw=
Content-Type: multipart/mixed; boundary="===============7184045539531879410=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.90.0 FAILED
Message-ID: <010101a08f3edb73-99cb3823-a627-4b21-b56c-99ddaa8c2396-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2026 06:54:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245607

--===============7184045539531879410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-networking* to *2.90.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-networking failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-846c62545dbb3b02e371284836ae9032ca1bdebd"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:846c62545dbb3b02e371284836ae9032ca1bdebd"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-846c62545dbb3b02e371284836ae9032ca1bdebd"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:846c62545dbb3b02e371284836ae9032ca1bdebd"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
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
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib-networking/2.90/glib-networking-2.90.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 0edb7388afdf6f926426df1789ffd740b08100c8
WARNING: Command 'git rebase 0edb7388afdf6f926426df1789ffd740b08100c8' failed:
Auto-merging tls/openssl/gtlscertificate-openssl.c
CONFLICT (content): Merge conflict in tls/openssl/gtlscertificate-openssl.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-networking
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-networking/glib-networking_2.90.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/glib-networking.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7184045539531879410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="glib-networking-changelog.txt"

Q2hhbmdlbG9nIGZvciBnbGliLW5ldHdvcmtpbmc6IDIuODAuMSAtPiAyLjkwLjAKU291cmNlOiBO
RVdTCgoyLjkwLjAgLSBTZXB0ZW1iZXIgMTAsIDIwMjYKPT09PT09PT09PT09PT09PT09PT09PT09
PT09CgoqIEJ1Z3MgZml4ZWQ6CiAgLSAhMjg2IG1lc29uOiBSZW1vdmUgdmVyc2lvbiBjaGVja3Mg
dGhhdCBhcmUgYWx3YXlzIHRydWUgKGNvcnJlY3Rtb3N0KQoKKiBUcmFuc2xhdGlvbiB1cGRhdGVz
OgogIC0gQnVsZ2FyaWFuIChBbGV4YW5kZXIgQWxleGFuZHJvdiBTaG9wb3YpCiAgLSBDYXRhbGFu
IChYYXZpIEl2YXJzKQogIC0gQ2hpbmVzZSAoQ2hpbmEpIChsdW1pbmcgemgpCiAgLSBDemVjaCAo
RGFuaWVsIFJ1c2VrKQogIC0gRGFuaXNoIChBc2sgSGpvcnRoIExhcnNlbikKICAtIER1dGNoIChO
YXRoYW4gRm9sbGVucykKICAtIEZyZW5jaCAoR3VpbGxhdW1lIEJlcm5hcmQpCiAgLSBHYWxpY2lh
biAoRnJhbmNpc2NvIERpw6lndWV6IFNvdXRvKQogIC0gR2VvcmdpYW4gKEVrYXRlcmluZSBQYXBh
dmEpCiAgLSBIZWJyZXcgKFlhcm9uIFNoYWhyYWJhbmkpCiAgLSBIdW5nYXJpYW4gKEJhbMOhenMg
w5pyKQogIC0gS2F6YWtoIChCYXVyemhhbiBNdWZ0YWtoaWRpbm92KQogIC0gS29yZWFuIChDaGFu
Z3dvbyBSeXUpCiAgLSBMaXRodWFuaWFuIChBdXJpbWFzIMSMZXJuaXVzKQogIC0gT2NjaXRhbiAo
cG9zdCAxNTAwKSAoUXVlbnRpbiBQQUfDiFMpCiAgLSBQZXJzaWFuIChEYW5pYWwgQmVoemFkaSkK
ICAtIFBvcnR1Z3Vlc2UgKEJyYXppbCkgKGJ1cm5zKQogIC0gUnVzc2lhbiAoQXJ0dXIgUzApCiAg
LSBTZXJiaWFuICjQnNCw0YDQutC+INCa0L7RgdGC0LjRmykKICAtIFNwYW5pc2ggKERhbmllbCBN
dXN0aWVsZXMpCiAgLSBTd2VkaXNoIChBbmRlcnMgSm9uc3NvbikKICAtIFRoYWkgKEFlZmdoIFRo
cmVlbmluZSkKICAtIFR1cmtpc2ggKEVtaW4gVHVmYW4gw4dldGluKQogIC0gVWlnaHVyIChBYmR1
cWFkaXIgQWJsaXopCiAgLSBVa3JhaW5pYW4gKFl1cmkgQ2hvcm5vaXZhbikKCjIuOTAuYWxwaGEg
LSBKdW5lIDI1LCAyMDI2Cj09PT09PT09PT09PT09PT09PT09PT09PT09CgoqIEJ1Z3MgZml4ZWQ6
CiAgLSAjMjIyIHRlc3QgZmFpbHMgd2l0aCBvcGVuc3NsIDMuNC54IChNaWNoYWVsIENhdGFuemFy
bykKICAtICMyMjYgKENWRS0yMDI1LTYwMDE4KSAoI1lXSC1QR005ODY3LTEwNikgT3V0IG9mIEJv
bmQgUmVhZHMgb24gZ2xpYi0KICAgIG5ldHdvcmtpbmcgdGhyb3VnaCB0bHMvb3BlbnNzbC9ndGxz
Y2VydGlmaWNhdGUtb3BlbnNzbC5jIHZpYQogICAgImdfdGxzX2NlcnRpZmljYXRlX29wZW5zc2xf
Z2V0X3Byb3BlcnR5KCkiIGR1ZSB0byBJbmNvcnJlY3QgQklPX3dyaXRlIFJldHVybgogICAgVmFs
dWUgVmFsaWRhdGlvbiBpbiBDZXJ0aWZpY2F0ZSBQRU0gRXhwb3J0IChNaWNoYWVsIENhdGFuemFy
bykKICAtICMyMjggKENWRS0yMDI2LTI1NzQpICgjWVdILVBHTTk4NjctMTUwKSBPT0IgUmVhZCBv
biBnbGliLW5ldHdvcmtpbmcgdGhyb3VnaAogICAgdGxzL29wZW5zc2wvZ3Rsc2NsaWVudGNvbm5l
Y3Rpb24tb3BlbnNzbC5jIHZpYQogICAgZ190bHNfY2xpZW50X2Nvbm5lY3Rpb25fb3BlbnNzbF9n
ZXRfcHJvcGVydHkoKSAoTWljaGFlbCBDYXRhbnphcm8pCiAgLSAjMjMxIChDVkUtMjAyNi0xMDAy
OCkgKCNZV0gtUEdNOTg2Ny0yNzgpIEluZmluaXRlIGxvb3AgaW4gY2VydGlmaWNhdGlvbiBwYXRo
CiAgICBidWlsZGluZyAoTWljaGFlbCBDYXRhbnphcm8pCiAgLSAhMjYxIG1lc29uOiBJbnRyb2R1
Y2Ugb3B0aW9uIGZvciBlbmFibGUvZGlzYWJsZSB0ZXN0cyAoTGVvbmlkIFphYnVydW5vdikKICAt
ICEyNjMgb3BlbnNzbDogY2hlY2sgcmV0dXJuIHZhbHVlIG9mIGdfdGxzX2Jpb19hbGxvYygpIGFu
ZCBCSU9fbmV3KCkgKE1pY2hhZWwKICAgIENhdGFuemFybykKICAtICEyNjUgb3BlbnNzbDogZGVs
ZXRlIHN1cHBvcnQgZm9yIE9DU1Agc3RhcGxpbmcgKE1pY2hhZWwgQ2F0YW56YXJvKQogIC0gITI2
OCBGaXggZmlsZSBkYXRhYmFzZSBhbmQgUEtDUzExIHRlc3QgZmFpbHVyZXMgYW5kIHVwZGF0ZSBD
SSEgKE1pY2hhZWwKICAgIENhdGFuemFybykKICAtICEyNzAgRml4IG1pc2NlbGxhbmVvdXMgc2Fm
ZXR5IGlzc3VlcyByZXBvcnRlZCBieSBidWcgaHVudGVycyAoTWljaGFlbAogICAgQ2F0YW56YXJv
KQogIC0gITI3MSBEZWxldGUgZ3Rsc2h0dHAgKE1pY2hhZWwgQ2F0YW56YXJvKQogIC0gITI3MiBG
aXggY29ubmVjdGlvbiB0ZXN0IHJldXNpbmcgYSBHRXJyb3IgKE1pY2hhZWwgQ2F0YW56YXJvKQog
IC0gITI3MyBvcGVuc3NsOiBmaXggZXJyb3IgY29kZSBjb25mdXNpb24gKE1pY2hhZWwgQ2F0YW56
YXJvKQogIC0gITI3NCBjaTogYWRkIGNhdGNoIGZvciByZXBvcnRpbmcgc3RhY2sgdHJhY2VzIChN
aWNoYWVsIENhdGFuemFybykKICAtICEyNzcgUmVxdWlyZSBPcGVuU1NMIDEuMS4xIG9yIG5ld2Vy
IChNaWNoYWVsIENhdGFuemFybykKICAtICEyODAgU29tZSBmaXhlcyBmb3VuZCB3aXRoIGtpcm8g
KElnbmFjaW8gQ2FzYWwgUXVpbnRlaXJvKQogIC0gITI4MSBGaXggdmFyaW91cyBtZW1vcnkgbGVh
a3MgKE1pY2hhZWwgQ2F0YW56YXJvKQogIC0gITI4MyBvcGVuc3NsOiByZWZhY3RvciBlcnJvciBo
YW5kbGluZyBjb2RlIChNaWNoYWVsIENhdGFuemFybykKICAtICEyODQgb3BlbnNzbDogdXNlIEVS
Ul9jbGVhcl9lcnJvcigpIGFsbCBvdmVyIHRoZSBwbGFjZSAoTWljaGFlbCBDYXRhbnphcm8pCiAg
LSAhMjg1IGdudXRsczogYWx3YXlzIG5vdGlmeSBhY2NlcHRlZC1jYXMgcHJvcGVydHkgYWZ0ZXIg
aGFuZHNoYWtlIChNaWNoYWVsCiAgICBDYXRhbnphcm8pCgoqIFRyYW5zbGF0aW9uIHVwZGF0ZXM6
CiAgLSBBcmFiaWMgKEFobWVkIE5ham1hd2kpCiAgLSBCYXNxdWUgKEFzaWVyIFNhcmF0c3VhIEdh
cm1lbmRpYSkKICAtIEJlbGFydXNpYW4gKFZhc2lsIFB1cGtpbikKICAtIENvcm5pc2ggKEZseW5u
IFBlY2spCiAgLSBFc3BlcmFudG8gKEtyaXN0amFuIFNDSE1JRFQpCiAgLSBHcmVlaywgTW9kZXJu
ICgxNDUzLSkgKEVmc3RhdGhpb3MgSW9zaWZpZGlzKQogIC0gSmFwYW5lc2UgKFRha2F5dWtpIEt1
c2FubykKICAtIExhbyAoU2Fpa2VvIEthdmhhbnhheSkKICAtIFJvbWFuaWFuIChBbnRvbmlvIE1h
cmluKQogIC0gU2xvdmFrIChKb3NlIFJpaGEpCiAgLSBTbG92ZW5pYW4gKE1hcnRpbikKICAtIFRo
YWkgKEFlZmdoIFRocmVlbmluZSkKICAtIFVpZ2h1ciAoQWJkdXFhZGlyIEFibGl6KQogIC0gVXpi
ZWsgKEJheHJvbSBSYXhtYXRvdikK

--===============7184045539531879410==--


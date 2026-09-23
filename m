Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD79C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1222.1790144863509375643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JJzugB0H;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Lwe+1+Dh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0ccf2d91f-5984bd6e-1d09-4692-9286-aa060ccfb214-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rdg9tfJ+7X1MavEZLX4oRS0OV7TztUbtJZICDpsbHvc=;
	b=JJzugB0HMLKUkvsKVbKlAnYvfO4A7mFmSFoZZhetxqRqTSwjC0g4t1XODbrZ4mC4
	XyGJ8NsarQUMdsL4QV/DMK47Vnc++u2C+DgUMHF/3T7gxJa//Cz9+pnvB1TURGZXP+U
	0Brr6fYnschqwM2YljrhMBZ2gxyyNyy6wj8p48AE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rdg9tfJ+7X1MavEZLX4oRS0OV7TztUbtJZICDpsbHvc=;
	b=Lwe+1+DhgRZ+ola9QLmV+jyPpr5lmsfeEuNOQqm+ooC+EFW4sgJ2aEkbs1WPT8YM
	3pdQX/Jl1/LkbkxKSnd18mZYpgy2/5VfZIqHw0u0lZEYNuidMr/J3bqAqzf8C8rKWl4
	DgTWfZdBNv3xlUvKtHXU1YqX1o52AzKt3xSw5v9A=
Content-Type: multipart/mixed; boundary="===============7765031298352658574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sai Sireesha T <saisireesha.t@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Sai Sireesha T <saisireesha.t@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot,systemd-tools-native,systemd-boot-native,systemd:
 upgrading to 262,262,262,262 FAILED
Message-ID: <010101a0ccf2d91f-5984bd6e-1d09-4692-9286-aa060ccfb214-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246436

--===============7765031298352658574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot,systemd-tools-native,systemd-boot-native,systemd* to *262,262,262,262* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d931446dac36811ff08d610f5e5ab87b785840ef"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d931446dac36811ff08d610f5e5ab87b785840ef"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8cc40e0c5e9234bf45084751ac53b1fbfe70b492
WARNING: Command 'git rebase 8cc40e0c5e9234bf45084751ac53b1fbfe70b492' failed:
Auto-merging mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf
CONFLICT (content): Merge conflict in mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/systemd-boot_262.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-boot.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-boot.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7765031298352658574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="systemd-boot-changelog.txt"

Q0hBTkdFUyBXSVRIIDI2MjoKICAgICAgICBBbm5vdW5jZW1lbnRzIG9mIEZ1dHVyZSBGZWF0dXJl
IFJlbW92YWxzIGFuZCBJbmNvbXBhdGlibGUgQ2hhbmdlczoKICAgICAgICBGZWF0dXJlIFJlbW92
YWxzIGFuZCBJbmNvbXBhdGlibGUgQ2hhbmdlczoKCiAgICAgICAgICBUUE0tYm91bmQgY3JlZGVu
dGlhbHMgbWludGVkIGFmdGVyIHRoaXMgY2hhbmdlIGFyZSBub3QgcmVjb2duaXplZCBieQogICAg
ICAgICAgb2xkZXIgc3lzdGVtZCB2ZXJzaW9ucywgaG93ZXZlciBuZXcgc3lzdGVtZCBjb250aW51
ZXMgdG8gYWNjZXB0CiAgICAgICAgICBjcmVkZW50aWFscyB0aGF0IHdlcmUgY3JlYXRlZCBiZWZv
cmUgdGhpcyBjaGFuZ2UuCgogICAgICAgIENoYW5nZXMgaW4gdGhlIHN5c3RlbSBhbmQgc2Vydmlj
ZSBtYW5hZ2VyOgogICAgICAgIENoYW5nZXMgaW4gc2QtdmFybGluayBhbmQgdmFybGlua2N0bDoK
ICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtYm9vdCwgc3lzdGVtZC1zdHViICYgYm9vdGN0bDoK
ICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtaG9zdG5hbWVkOgogICAgICAgIENoYW5nZXMgaW4g
c3lzdGVtZC1uZXR3b3JrZDoKICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtam91cm5hbGQgYW5k
IGpvdXJuYWxjdGw6CiAgICAgICAgQ2hhbmdlcyBpbiBzeXN0ZW1kLWNvcmVkdW1wIGFuZCBjb3Jl
ZHVtcGN0bDoKICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtcmVzb2x2ZWQgYW5kIHJlc29sdmVj
dGw6CiAgICAgICAgQ2hhbmdlcyBpbiBzeXN0ZW1kLXVkZXZkOgogICAgICAgIENoYW5nZXMgaW4g
c3lzdGVtZC1ob21lZCBhbmQgaG9tZWN0bDoKICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtdG1w
ZmlsZXM6CiAgICAgICAgQ2hhbmdlcyBpbiB0aGUgVFBNIFN1YnN5c3RlbToKICAgICAgICBDaGFu
Z2VzIGluIHN5c3RlbWQtcGNybG9jazoKICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtY3J5cHRz
ZXR1cC9zeXN0ZW1kLWNyeXB0ZW5yb2xsOgogICAgICAgIENoYW5nZXMgaW4gc3lzdGVtZC1yZXBh
cnQgYW5kIHN5c3RlbWQtZGlzc2VjdDoKICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtbnNwYXdu
ICYgc3lzdGVtZC12bXNwYXduOgogICAgICAgIENoYW5nZXMgaW4gc3lzdGVtZC1yZXBvcnQ6CiAg
ICAgICAgQ2hhbmdlcyBpbiBsaWJzeXN0ZW1kOgogICAgICAgIHN5c3RlbWQtdXNlcmRiZCBhbmQg
dXNlcmRiY3RsOgogICAgICAgIENoYW5nZXMgaW4gc3lzdGVtZC1zeXN1cGRhdGU6CiAgICAgICAg
Q2hhbmdlcyBpbiBzeXN0ZW1kLXN5c2N0bDoKICAgICAgICBDaGFuZ2VzIGluIHN5c3RlbWQtc3lz
ZXh0OgogICAgICAgIE90aGVyIGNoYW5nZXM6CgogICAgICAgIENvbnRyaWJ1dGlvbnMgZnJvbTog
QWRhbcKgRGlud29vZGllLCBBa2FyaXRob3MsIEFsZWtzYcKgU2FyYWksCiAgICAgICAgQWxleGFu
ZGVywqBFZ29yb3YsIEFsZXhhbmRyZcKgU2FvdSwgQWxleGV5wqBTaGFiYWxpbiwKICAgICAgICBB
bHBlcmVuwqBLxLFsxLHDpywgQW3DqXJpY2/CoE1vbnRlaXJvLCBBbmFudGgsIEFuYW50aMKgQmhh
c2thcmFyYW1hbiwKICAgICAgICBBbmRlcnPCoEpvbnNzb24sIEFuZHJlwqBFaWttZXllciwgQW5k
cmVpwqBTdGVwYW5vdiwgQW5kcmVzwqBCZWx0cmFuLAogICAgICAgIEFuZHJlc8KgRGlheiwgQW5k
cmV3wqBEdW5uLCBBbmnCoFNpbmhhLCBBbnRvbsKgVGl1cmluLAogICAgICAgIEFudG9uaW/CoEFs
dmFyZXrCoEZlaWpvbywgQXJpYW7CoHZhbsKgUHV0dGVuLCBBcmlmwqBCdWRpbWFuLAogICAgICAg
IEFyaXRyYcKgQmFzdSwgQXJtYWFuwqBTYW5kaHUsIEFyc2VuaXnCoEtvc3RldmljaCwgQXN3aW7C
oE11cnVnYW4sIEF4ZWwsCiAgICAgICAgQmF1cnpoYW7CoE11ZnRha2hpZGlub3YsIEJlbmlhbWlu
b8KgR2FsdmFuaSwgQm9uZcKgTkksIENhdGhhbMKgTXVsbGFuLAogICAgICAgIENocmlzwqBBeW91
YiwgQ2hyaXPCoENvdWxzb24sIENocmlzwqBEb3duLCBDaHJpc8KgSGFzacWEc2tpLAogICAgICAg
IENocmlzdGlhbsKgQnJhdW5lciwgQ2hyaXN0aWFuwqBHbG9tYmVrLCBDaHJpc3RpYW7CoEhlc3Nl
LAogICAgICAgIENsYXl0b27CoENyYWZ0LCBDb25mdXNlZHBob3RvbiwgQ3J0bFRvbSwgRGFhbsKg
RGXCoE1leWVyLAogICAgICAgIERhbmllbMKgV2FnZW5rbmVjaHQsIERhbmllbDI4OTcyODk3LCBE
YXJhwqBBZGliLAogICAgICAgIERhdmlkwqAnZXF1aW5veCfCoExhbXBhcnRlciwgRGF2aWTCoFRh
cmRvbiwgRGF2aWRlwqBDYXZhbGNhLAogICAgICAgIERhdmlzLVJpcHBvbiwgRGVuaXrCoEfDtnpl
biwgRG9uZ1NoZW5neXVhbiwgRUrCoENhbXBiZWxsLAogICAgICAgIEVkdmFyZMKgSmFlZ3RuZXMs
IEVsbGlvdMKgQmVybWFuLCBFbWFudWVsZcKgUGV0cmlnbGlhLCBFbWFudWVsZcKgUm9jY2EsCiAg
ICAgICAgRW1pbGlvwqBTZXB1bHZlZGEsIEVyaWPCoEJvdWNoZXIsIEVyaWPCoEN1cnRpbiwgRXR0
b3JlwqBBdGFsYW4sCiAgICAgICAgRmFiaWFuwqBWb2d0LCBGY28uwqBKYXZpZXLCoEYuwqBTZXJy
YWRvciwgRmVkZTI3ODIsIEZyYW5ja8KgQnVpLAogICAgICAgIEZyYW50aXNla8KgU3Vtc2FsLCBH
YWJyaWVsLCBHdWlsbGF1bWXCoEtlaHJlbiwgSGFuc8KgZGXCoEdvZWRlLAogICAgICAgIEhhc2hp
bcKgS2hhbiwgSGlqYWXCoFNvbmcsIEhpbGFswqBSYWhtYXR1bGxhaCwgSG9uemHCoEhlanpsLAog
ICAgICAgIEjDvHNleWluwqBLdXRzacKgQmFsY8SxLCBJdmFuwqBLcnVnbG92LCBKYWt1YsKgU3Rh
c2lhaywgSmFuwqBLdXBhcmluZW4sCiAgICAgICAgSmFuwqBNYWNrdSwgSmFzb27CoFlhbmcsIEpl
bGxlwqB2YW7CoGRlcsKgV2FhLCBKZXNzZcKgR3VvLAogICAgICAgIEpvbmFzwqBEcmXDn2xlciwg
Sm9zaMKgSG9mZmVyLCBKb3VrZcKgV2l0dGV2ZWVuLCBKdWxpYW7CoEJvdXphcywKICAgICAgICBK
dWxpYW7CoFNwYXJiZXIsIEp1c3RpbsKgQ2FicmFsLCBKw7ZyZ8KgQmVocm1hbm4sIEthacKgTMO8
a2UsCiAgICAgICAgS2FpwqBXb2hsZmFocnQsIEtha3VlZWVuLCBLZXZpbsKgQ2hhcnBlbnRpZXIs
IEtpbmdQb2ludGVyLAogICAgICAgIEtvbnN0YW50aW7CoFNoa29sbnl5LCBMYXJzwqBTasO2c3Ry
b20sIExlZnRlcmlzwqBULAogICAgICAgIExlbm5hcnTCoFBvZXR0ZXJpbmcsIExpdcKgWmhhbmdq
aWFuLCBMaXXCoFpoZW5nLCBMb2tlc2jCoFBhdGVsLAogICAgICAgIEx1Y2HCoEJvY2Nhc3NpLCBM
dWNhc8KgQWRyaWFub8KgU2FsbGVzLCBMdWNhc1RhdmFyZXNBLCBMdWR3aWfCoE51c3NlbCwKICAg
ICAgICBMdW5hwqBKZXJuYmVyZywgTMOpYW5lwqBHUkFTU0VSLCBMxrDGoW5nwqBWaeG7h3TCoEhv
w6BuZywKICAgICAgICBNYXJla8KgQWRhbXNraSwgTWFya3VzwqBCb2VobWUsIE1hcnRpbsKgUGl0
dCwgTWFydGluwqBTcmVib3RuamFrLAogICAgICAgIE1hdHRoZXfCoFNjaHdhcnR6LCBNYXR0aGlh
c8KgUC7CoFdhbHRoZXIsIE1pY2hhZWzCoFJlbm5lciwKICAgICAgICBNaWNoYWVswqBWb2d0LCBN
aWNoYWzCoEtvdXRuw70sIE1pY2hhbMKgU2VrbGV0YcyBciwgTWljaGFswqDEjGloYcWZLAogICAg
ICAgIE1pa2XCoFl1YW4sIE1vcnRlemHCoFBvdXJrYXplbWksIE11aGFtbWVkwqBZYWt1cMKgw5Z6
bMO8aywgTcOpdmVuwqBDYXIsCiAgICAgICAgTmFuZGFrdW1hcsKgUmFnaGF2YW4sIE5pY2hvbGFz
wqBMaW0sIE5pY2vCoFJvc2Jyb29rLCBPxJ91esKgRXJzZW4sCiAgICAgICAgUGFyYWfCoEd1cHRh
LCBQYXVswqBNZW56ZWwsIFBhdWzCoE1leWVyLCBQYXZlbMKgQm9yZWNraSwgUGV0cnXCoFJlYmVq
YSwKICAgICAgICBQaGlsaXDCoFdpdGhuYWxsLCBQb3BheDIxLCBQcmFuYXnCoFBhd2FyLCBQw6l0
dXIsIFJhZmFlbMKgRm9udGVuZWxsZSwKICAgICAgICBSYWZhZWzCoFBhc3NvcywgUmFpdG/CoEJl
emFyaXVzLCBSYW1zZXMsIFJhc211c8KgVmlsbGVtb2VzLAogICAgICAgIFJlbmFuwqBQYWdhbmks
IFJvYmluwqBSaWNoYXJkwqBSYWphbiwgUm9ja2VywqBaaGFuZywgUm9tYW7CoFZpbm9ncmFkb3Ys
CiAgICAgICAgUm9uYW7CoFBpZ290dCwgUm9zc8KgQnVydG9uLCBTZW15b27CoEtsaW50c292LCBT
ZXJnZXnCoEEuLCBTaGloYW/CoFJlbiwKICAgICAgICBTaGlyb0tTSCwgU2hpdmFua8KgU2hhcm1h
LCBTaW1vbsKgZGXCoFZsaWVnZXIsIFNpbXJhbsKgU2luZ2gsIFNpbml0eSwKICAgICAgICBTaXRl
c2h3YXLCoFZhc2hpc2h0LCBTa3llwqBTb3NzLCBTcmlqYW7CoEtlc2hyaSwgU3RlZmFuwqBBZ25l
ciwKICAgICAgICBTdGVwaGFuaWXCoFdpbGRlLUhvYmJzLCBTdmVuwqBKb2FjaGltLCBTeWVkwqBN
b2hhbW1lZMKgTmF5eWFyLAogICAgICAgIFRlbXVyacKgRG9naG9uYWR6ZSwgVGhvbWFzwqBLb3Bw
LCBUaW3CoEN1bHZlcmhvdXNlLCBUaW3CoFNjaHVtYWNoZXIsCiAgICAgICAgVGltb27CoGRlwqBH
cm9vdCwgVG9iaWFzwqBIZWlkZXIsIFRvdG9ybywgVW11dMKgVGV6ZHV5YXLCoExpbmRza29nLAog
ICAgICAgIFZhbMKgUGFja2V0dCwgVmljdG9ywqBWZXJkYW4sIFZzZXZvbG9kwqBLb3psb3YsIFdh
bmfCoFl1LCBZdcKgV2F0YW5hYmUsCiAgICAgICAgWmJpZ25pZXfCoErEmWRyemVqZXdza2ktU3pt
ZWssIGFjYW5kb28sIGJlbmtpZ2VlaywgY2lka2lkbml4LAogICAgICAgIGNvdW50Z2l0bWljaywg
Y3Zlcm9yZywgZGlyaGFtdHJpeWFkaSwgZG9uZ3NoZW5neXVhbiwgZmVsaXjCoGgsIGZ1bGRla2Es
CiAgICAgICAgZ2tlaHJlbiwgZ3BlbnosIGd1b2xpbiwgaGFuamlucGVuZywgam1lc3R3YS1jb2Rl
ciwgam9vwqBlcywKICAgICAgICBsb2dpY2FsLW1pc2hhLCBsdWNpYS1odWFuZzcsIGx6d2luZCwg
bmw2NzIwLCBxdWFueWV5YW5nLCByLXZkcCwKICAgICAgICByYXNoaWRteWEsIHJvZGluLWlhLCB0
b3Rvcm8sIHR1bmFpY2hhbywgd2FuZ3poYW9odWksIHd5dSwgeGlhaHVhbGl1LAogICAgICAgIHpo
YW9zaHVhbmcsIHpvdWdlNjY2LCDQnNCw0YDQutC+wqDQmtC+0YHRgtC40ZvCoChNYXJrb8KgS29z
dGnEhyksCiAgICAgICAg6rmA7J247IiYCgogICAgICAgIOKAlCBMYXZhbnR0YWwgVGFsLCAyMDI2
LzA5LzIyCiAgICAgICAgICBQSUQxJ3MgZXZlbnQgbG9vcCByYXRlLWxpbWl0IGxvZ2ljLiBUaGlz
IHBlcm1pdHMgZmluZS10dW5pbmcgdGhlCg==

--===============7765031298352658574==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B32CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13634.1791178115307610271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LgVu27Yp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cBOQrg/y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a10a8904f7-dd946b80-c475-4cef-bd57-709856bc8488-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791178114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Xwui/UY82zEXqzCv+gCEs5/qUscw8g716dAHa44NSv0=;
	b=LgVu27Ypc8BPMRplte8RjFrVKGP/iP7EY5wOxp8+WamUOZOeU9mZVNj4ctasjsVw
	CeQ9tMMq3325obTYD2TsazcE80qOInOJLLQaowaBlMOf1gOaw7jrao/aXiIxaWevfrA
	azK9pZ8BJtJOb/d4f4gNL09LfdhmJ5NB6alAfXqw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791178114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Xwui/UY82zEXqzCv+gCEs5/qUscw8g716dAHa44NSv0=;
	b=cBOQrg/yqVvgcf1KC6VRs5F33Nb/X+0X6XqFR8LO1NlvOwRnWKU7LQXwjR/SjQYW
	FAojGNb2RdoQjIljX59863rdL3dRw13NOn8bJ0AmIsWV3dfFnFdfEuvf4PwyW3SYZfU
	oUxJhFtsG8elcl/7pAnKI/7LihSg0S4etaQmmuAs=
Content-Type: multipart/mixed; boundary="===============4006022588901563391=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] lrzsz: upgrading to 0.13.1 FAILED
Message-ID: <010101a10a8904f7-dd946b80-c475-4cef-bd57-709856bc8488-000000@us-west-2.amazonses.com>
Date: Mon, 5 Oct 2026 05:28:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247208

--===============4006022588901563391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lrzsz* to *0.13.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lrzsz failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1994 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-b904e11c8c33e2f44d6e36158dc201a84c00895e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b904e11c8c33e2f44d6e36158dc201a84c00895e"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1995 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-b904e11c8c33e2f44d6e36158dc201a84c00895e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b904e11c8c33e2f44d6e36158dc201a84c00895e"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
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
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.ohse.de/uwe/releases/lrzsz-0.13.1.tar.gz...
INFO: Rebasing devtool onto d6a3282387ec0dfe07189bce80db3916c1159125
WARNING: Command 'git rebase d6a3282387ec0dfe07189bce80db3916c1159125' failed:
Auto-merging Makefile.am
CONFLICT (content): Merge conflict in Makefile.am
CONFLICT (modify/delete): configure.in deleted in HEAD and modified in 0eb996f (Update autotools infrastructure (including gettext) to modern versions.).  Version 0eb996f (Update autotools infrastructure (including gettext) to modern versions.) of configure.in left in tree.
CONFLICT (modify/delete): lib/Makefile.am deleted in HEAD and modified in 0eb996f (Update autotools infrastructure (including gettext) to modern versions.).  Version 0eb996f (Update autotools infrastructure (including gettext) to modern versions.) of lib/Makefile.am left in tree.
Auto-merging po/Makevars
CONFLICT (add/add): Merge conflict in po/Makevars
CONFLICT (modify/delete): po/de.po deleted in HEAD and modified in 0eb996f (Update autotools infrastructure (including gettext) to modern versions.).  Version 0eb996f (Update autotools infrastructure (including gettext) to modern versions.) of po/de.po left in tree.
Auto-merging po/lrzsz.pot
CONFLICT (content): Merge conflict in po/lrzsz.pot
Auto-merging src/Makefile.am
CONFLICT (content): Merge conflict in src/Makefile.am
Auto-merging src/zglobal.h
CONFLICT (content): Merge conflict in src/zglobal.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/lrzsz
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lrzsz/lrzsz_0.13.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/lrzsz.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/lrzsz.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4006022588901563391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lrzsz-changelog.txt"

VmVyc2lvbiAwLjEzLjEgLSBPY3RvYmVyIDIwMjYsIFV3ZSBPaHNlCgpUaGlzIHJlbGVhc2Ugb25s
eSByZW1vdmVzIHRoZSBaTU9ERU0gOHRoLWJpdCBlc2NhcGluZyBjYXBhYmlsaXR5LAp3aGljaCB3
YXMgcmVjZW50bHkgaW1wbGVtZW50ZWQsIGFuZCBub3QgcGFydCBvZiBhbnkgYW5ub3VuY2VkIHJl
bGVhc2UsCmFmdGVyIFN0ZXBoZW4gSHVyZCBhbGVydGVkIG1lIHRvIHRoZSBmYWN0IHRoYXQgdGhl
IGltcGxlbWVudGF0aW9uIHdhcwppbmNvbXBhdGlibGUgd2l0aCB0aGUgKHByb3ByaWV0YXJ5IGFu
ZCB1bmRvY3VtZW50ZWQpIE9tZW4gaW1wbGVtZW50YXRpb24uClRoZSBpbmNvbXBhdGliaWxpdHkg
d291bGQgaGF2ZSBtYWRlIHRoZSBzZXNzaW9uIG11dHVhbGx5IHVuZGVjb2RhYmxlIGluCmJvdGgg
ZGlyZWN0aW9ucy4gVGhlIG9wdGlvbidzIHByYWN0aWNhbCBiZW5lZml0IChlc2NhcGluZyBieXRl
cyA+PSAweDgwLAp3aGljaCBrZWVwcyBiaXQgNyBzZXQgYW5kIHRodXMgY2Fubm90IGNyb3NzIDct
Yml0IGxpbmtzKSBpcyBuZWdsaWdpYmxlOgp0aGUgaGlzdG9yaWNhbGx5IHByb2JsZW1hdGljIGJ5
dGVzIChYT04vWE9GRiBsb29rYWxpa2VzKSBhcmUgZXNjYXBlZApieSBkZWZhdWx0LCBhbmQgdHJh
bnNwb3J0cyB0aGF0IGFjdCBvbiB0aGUgcmVtYWluaW5nIGhpZ2ggYnl0ZXMgYXJlCnByYWN0aWNh
bGx5IGV4dGluY3QuClRoYW5rIHlvdSwgU3RlcGhlbi4KClZlcnNpb24gMC4xMy4wIC0gU2VwdGVt
YmVyIDIwMjYsIFV3ZSBPaHNlCgpUaGlzIHJlbGVhc2UgZml4ZXMgYSBsYXJnZSBudW1iZXIgb2Yg
c2VjdXJpdHkgaXNzdWVzLiBUd28gb2YgdGhlIGNoYW5nZXMKd2FycmFudCBhbiBpbW1lZGlhdGUg
dXBkYXRlIGlmIHlvdSB1c2UgbHJ6IHRvIHJlY2VpdmUgZmlsZXMgZnJvbSBub3QKcGVyZmVjdGx5
IHRydXN0d29ydGh5IHNlbmRlcnMuCgpTZWN1cml0eSBmaXhlczoKICBUaGlzIHdhcyBhIHNlY3Vy
aXR5IGJ1ZyBmb3VuZCBieSBUcmlzdGFuIE1hZGFuaSAoVGFsZW5jZSBTZWN1cml0eSkuCgogIExp
a2V3aXNlIGxzeiBkaWQgbm90IGNvcnJlY3RseSBjaGVjayBwYXRocyBpbiB0aGUgcmVzdHJpY3Rl
ZCBtb2RlIGlmCiAgUFVCRElSIHN1cHBvcnQgd2FzIG5vdCBjb21waWxlZCBpbi4KCiAgVGhpcyB3
YXMgYSBzZWN1cml0eSBidWcgZm91bmQgYnkgVHJpc3RhbiBNYWRhbmkgKFRhbGVuY2UgU2VjdXJp
dHkpLgogIE5vdGU6IHRoaXMgc3RlbXMgZnJvbSB0aGUgb3JpZ2luYWwgcHVibGljIGRvbWFpbiBy
enN6IHN1aXRlICg4MHMpLgogIFRoaXMgd2FzIGEgc2VjdXJpdHkgYnVnIGZvdW5kIGJ5IFRyaXN0
YW4gTWFkYW5pIChUYWxlbmNlIFNlY3VyaXR5KS4KICBOb3RlOiB0aGlzIHN0ZW1zIGZyb20gdGhl
IG9yaWdpbmFsIHB1YmxpYyBkb21haW4gcnpzeiBzdWl0ZSAoODBzKS4KICBOb3RlOiB0aGlzIHN0
ZW1zIGZyb20gdGhlIG9yaWdpbmFsIHB1YmxpYyBkb21haW4gcnpzeiBzdWl0ZSAoODBzKS4KICBO
b3RlOiB0aGlzIHN0ZW1zIGZyb20gdGhlIG9yaWdpbmFsIHB1YmxpYyBkb21haW4gcnpzeiBzdWl0
ZSAoODBzKS4KICBOb3RlOiB0aGlzIHN0ZW1zIGZyb20gdGhlIG9yaWdpbmFsIHB1YmxpYyBkb21h
aW4gcnpzeiBzdWl0ZSAoODBzKS4KU2VjdXJpdHkgcmVsYXRlZCBjaGFuZ2VzOgogIE5vdGU6IHRo
aXMgc3RlbXMgZnJvbSB0aGUgb3JpZ2luYWwgcHVibGljIGRvbWFpbiByenN6IHN1aXRlICg4MHMp
LgpPdGhlciBjaGFuZ2VzOgoKICBOb3RlOiBscnpzeidzIDMxLWJpdCBmaWxlLXNpemUgbGltaXQg
c3RlbXMgZnJvbSB0aGUKICBvcmlnaW5hbCBwdWJsaWMgZG9tYWluIHJ6c3ogc3VpdGUgKDgwcyku
IFRoZSBzYW1lIGxpbWl0IGV4aXN0ZWQKICBpbiBsYXRlciBwdWJsaXNoZWQgb21lbiB0ZWNobm9s
b2d5IHNvdXJjZXMsIGFuZCBhdCBsZWFzdCBvbmUKICBpbmRlcGVuZGVudCBpbXBsZW1lbnRhdGlv
bi4KCiAgRXhwZWN0IGludGVyb3BlcmFiaWxpdHkgcHJvYmxlbXMgd2hlbiB0cmFuc2ZlcnJpbmcg
ZmlsZXMgb2YgdGhhdCBzaXplLgoKICBJJ20gd2lsbGluZyB0byB3b3JrIHdpdGggdHJhbnNsYXRv
cnMsIG5vdCBvbmx5IHRvIGluY2x1ZGUgdHJhbnNsYXRpb25zLAogIGJ1dCBhbHNvIHRvIG1ha2Ug
eW91ciBqb2IgZWFzaWVyIC0gYnV0IEkgYW0gbm90IGdvaW5nIHRvIGJ1cmRlbiBteXNlbGYKICB3
aXRoIGRvaW5nIHRyYW5zbGF0aW9ucy4KCiAgRnVuIGZhY3Q6IHRoZSBzYW1lIGltcGxlbWVudGF0
aW9ucyBsZWFkaW5nIHRoZSBwZXJmb3JtYW5jZSBzY29yZSBvbgogIGEgMTE1MjAwIGJwcyBsaW5l
IHdpdGggYSAyMG1zIGRlbGF5IGFyZSB0aGUgb25lcyBsb3Npbmcgb24gdGhlCiAgMW1iaXQgbGlu
ZSB3aXRoIDI1MG1zIGRlbGF5IGxpbmUuCgogIFRoZSBwYWNrYWdlIHJlZnVzZWQgdG8gZGllLiBD
VlMtMjAxOC0xMDE5NSBjYW1lLCBhbmQgaSB3b25kZXJlZCBmb3IgYQogIHdoaWxlIHdoeSBub3Ro
aW5nIHdvcnNlIGhhZCBiZWVuIGRldGVjdGVkLiBCdXQgdGhlbiBpIGRlY2lkZWQgdGhhdAogIGxy
enN6IGlzIG5vdCBteSBwcm9ibGVtIGFueW1vcmUuIEl0IGhhZCB0byBiZSB0aGUgcHJvYmxlbSBv
ZiBzb21lb25lCiAgZWxzZS4KCiAgVGhlbiBUcmlzdGFuIGNvbnRhY3RlZCBtZSBvbiAyMDI2LTA3
LTI3LCB3aGljaCB3YXMgOCBkYXlzIGFmdGVyIGkKICBkaWQgYSBtYWpvciBzY3Jld3VwIGF0IGh0
dHBzOi8vbmF0dXJmb3RvZ3JhZmVuLWZvcnVtLmRlIGJ5IHVwZGF0aW5nCiAgdGhlIHByb2R1Y3Rp
b24gc3lzdGVtIHRvIGEgc29mdHdhcmUgdmVyc2lvbiB3aGljaCBzaG91bGQgYmVlbiB0ZXN0ZWQK
ICBhbmQgZGVidWdnZWQgZm9yIGF0IGxlYXN0IDIgb3IgMyBhZGRpdGlvbmFsIHdlZWtzLCBhbmQg
d2hpY2ggY29udGFpbmVkCiAgb25lIGZlYXR1cmUgd2hpY2ggbWFkZSBhIHJvbGxiYWNrIGluZmVh
c2libGUuIEkgc2F3IGhpcyBtYWlsLCBhbmQKICB0aG91Z2h0ICdVaCwgdWjigKYgdGhpcyBpcyBu
b3QgYSBtaW5vciB0aGluZycuCiAgQnV0IGkgaGFkIG5vIHRpbWUsIGJlY2F1c2UgdGhlIGZvcnVt
IGlzIG1vcmUgaW1wb3J0YW50IHRvIG1lLgoKICAxNCBkYXlzIGxhdGVyIGkgZm91bmQgdGhlIHRp
bWUsIGFuZCB0aGUgcmVhbCBmdW4gc3RhcnRlZC4gSSBuZWVkZWQKICBmYXIgbGVzcyB0aW1lIHRv
IGZpeCB0aGUgdGhyZWUgdnVsbmVyYWJpbGl0aWVzIFRyaXN0YW4gcmVwb3J0ZWQgdGhhbgogIGkg
bmVlZGVkIHRvIGZpeCB0aGUgYXV0b2NvbmYgc3R1ZmYgc28gaSBjb3VsZCBjb21waWxlIHRoZSBw
YWNrYWdlLgogIFVwZGF0aW5nIHRoZSBnZXR0ZXh0IHN0dWZmIGFsc28gdG9vayBob3VycywgYW5k
IGkgd2FzdGVkIGhhbGYgYW4KICBldmVuaW5nIHRyeWluZyB0byB1cGRhdGUgdGhlIGRlamFnbnUg
dGVzdCBzdWl0ZSAod2hpY2ggaSBmYWlsZWQgYXQpLgoKICBUaGVuIGkgc2F0IGJhY2ssIGxvb2tl
ZCBhdCB0aGUgY29kZSwgZGVjaWRlZCB3aGF0IGNvbXBhdGliaWxpdHkgaGFja3MKICB0byB0aHJv
dyBvdXQsIGFuZCBzdGFydGVkIHRvIGNsZWFuIHVwIHRoZSBtZXNzLgoKICBUaGVuIGkgYXNrZWQg
cXdlbiAoY29kZXIgbmV4dCkgdG8gYmxvY2sgbXkgZ3JhcGhpY3MgY2FyZCBmb3IgYSBmZXcgZGF5
cywKICBpIG1lYW4sIGkgYXNrZWQgdGhlIExMTSB0byByZXZpZXcgdGhlIGNvZGUgKHRoZSBwcm9t
cHQgd2FzIHNvbWV3aGF0CiAgbG9uZ2VyIHRoYW4gdGhhdCksIHdoaWNoIG9uIG15IDQgR0IgZ3Jh
cGhpY3MgY2FyZCB0b29rIGEgbG9uZyB0aW1lLgogIEluIHRoZSBtZWFudGltZSBpIGZvdW5kIHRo
ZSBvbGQgcmVjb3JkeHl6IHRvb2wgKGEgcHJvdG9jb2wgdHJhY2VyKSwKICBhbmQgZXZlbiB0aGUg
dmVyc2lvbiAyIG9mIGl0IChhIHRvdGFsIHJld3JpdGUgd2hpY2ggd2FzIG11Y2ggd29yc2UgdGhh
bgogIHRoZSBvcmlnaW5hbCwgd2hpY2ggd2Fzbid0IHZlcnkgZ29vZCB0byBiZWdpbiB3aXRoKSwg
dG9vayBzb21lIHBhcnRzCiAgZnJvbSB0aGVtLCBhbmQgY3JlYXRlZCB6bW9kZW1zbmlmLgoKICBX
aGVuIHRoYXQgd2FzIGFib3V0IHJlYWR5LCBpIGdhdmUgdXAgb24gdGhlIGxvY2FsIHF3ZW4uIEl0
IGhhZCBwcm9kdWNlZAogIHNvbWUgaW50ZXJlc3RpbmcgZmluZGluZ3MsIGJ1dCBteSBtYWNoaW5l
IGlzIHRvbyBzbG93IGZvciB0aGF0LiBJIHVzZWQKICBhIGNsb3VkIGtpbWktazIuNiB0byBkbyBh
IHJldmlldywgYW5kIGxhdGVyIHVzZWQgZ2xtLTUuMiwga2ltaS1rMywKICBzb21lIHF3ZW4gYW5k
IGdsbS01LjMtZmxhc2ggZm9yIHRoZSBzYW1lLgoKICBGb3IgYWxsIHlvdSBMTE0gaGF0ZXJzIG9y
IHNjZXB0aWNzOiBpIGdldCBpdC4gSSBoYXRlIHRoZXNlIExMTSBjb21wYW5pZXMKICB3aXRoIGEg
cGFzc2lvbi4gVGhlc2UgcGVvcGxlIHN0ZWFsIGluIHRoZSBpbnRlcm5ldCAoYW5kIGZyb20gbXkg
b3duCiAgc2VydmVyLCB0b28pLCBhbmQgZ2l2ZSBub3RoaW5nIGJhY2ssIGJleW9uZCBuZWJ1bG91
cyBjbGFpbXMgYW5kIGxpZXMKICBhbmQgc2VydmVyIG92ZXJsb2Fkcy4gVGhleSBzcGVuZCBiaWxs
aW9ucyB0byBpbXByb3ZlIExMTXMsIHdoaWNoIHNob3VsZAogIGJlIHNwZW5kIHRvIGltcHJvdmUg
cGVvcGxlIGFuZCBzb2NpZXR5LiBUaGUgbGlzdCBvZiByZWFzb25hYmxlCiAgY29tcGxhaW50cyBp
cyBsb25nLiBJIGdldCBhbGwgdGhhdC4KCiAgQnV0IGkndmUgcnVuIG91dCBvZiBwZW9wbGUgaSBj
YW4gd29yayB3aXRoLiBUaGUgb25seSBwcm9ncmFtbWVyIHdob20KICBpIGNvdWxkIGhhdmUgcmVs
aWVkIG9uIHJldmlld2luZyBteSBjb2RlLCBhbmQgYW55IGNoYW5nZXMsIGluIHRpbWUgaGFzCiAg
ZGllZCBhIGZldyB5ZWFycyBhZ28gKGFuZCBpIHdvdWxkIGhhdmUgaGFkIHRvIHBheSBmb3IgYnkg
cmV2aWV3aW5nIGhpcwogIGNvZGUsIHdoaWNoIGlzIHNvbWV0aGluZyBpIHRyaWVkIHRvIGF2b2lk
LCBiZWNhdXNlIGhpcyBzdHVmZiB3YXMgcmVhbGx5CiAgY29tcGxpY2F0ZWQgLSBscnpzeiBpcyBx
dWl0ZSBzaW1wbGUgY29tcGFyZWQgdG8gdGhhdCkuCiAgQW5kIGkgYWJzb2x1dGVseSBfbmVlZGVk
XyBzb21lIGtpbmQgb2YgcmV2aWV3LiBJIHdhcyBvdXQgb2YgcHJhY3Rpc2UKICB3aXRoIEMgYW5k
IHRoZSB0b29sY2hhaW4sIGFuZCBnaXZlbiB0aGUgc29ycnkgc3RhdGUgb2YgdGhlIEMgbGFuZ3Vh
Z2UKICAod2h5LCBvaCB3aHksIGlzbid0ICctV3R1cm4tb24tYWxsIC1XZXJyb3InIHRoZSBkZWZh
dWx0PykgaXQgd291bGQgaGF2ZQogIGJlZW4gaXJyZXNwb25zaWJsZSB0byBub3QgdXNlIGFuIExM
TSBmb3IgdGhhdC4KICBUaGlzIGtpbmQgb2YgcmV2aWV3IGlzIHNvbWV0aGluZyBMTE1zIGFyZSBn
b29kIGF0LCBhbmQgdGhleSBmb3VuZCBtb3JlCiAgdGhhbiBhIGZldyBzZWN1cml0eSBpc3N1ZXMg
aW4gdGhlIGNvZGUgKGkgYWxzbyBmb3VuZCBzb21lLCBidXQgbm90IHRoYXQKICBtYW55KSwgYW5k
IHF1aXRlIGEgZmV3IGJ1Z3MuCgogIFRoZSBjb3JlIGNvZGUsIGFueSBjb2RlIGluIHRoZSBpbnN0
YWxsZWQgcHJvZ3JhbXMsIGlzIDEwMCUgaHVtYW4gd3JpdHRlbgogIChpJ20gbGF6eSBhbmQgaGF0
ZSBjb21tZW50aW5nLCBhbmQgY29waWVkIHNvbWUgTExNIGdlbmVyYXRlZCBjb21tZW50cywKICBi
dXQgbm8gY29kZSkuCgogIFRoZSBjb2RlIG9mIHRoZSBwcm9ncmFtcyBub3QgaW5zdGFsbGVkIGJ5
IGRlZmF1bHQgKHdoaWNoIGFyZSBub3QgdmVyeQogIHVzZWZ1bCBmb3IgYW55b25lIGJ1dCB0aGUg
bWFpbnRhaW5lcikgaXMgcGFydGlhbGx5IG9yIG1vc3RseSBodW1hbgogIHdyaXR0ZW46CiAgLSB6
bW9kZW1zbmlmZi5jIGlzIGFib3V0IDc1JSBodW1hbiB3cml0dGVuIChtYXliZSBtb3JlLCBpIGRv
bid0IGNhcmUpLgogIC0gbGluZXNpbXVsYXRvci5jIGlzIGFib3V0IDUwJSBodW1hbiB3cml0dGVu
LgogICAgW3RoaXMgdG9vbCBpcyBmb3IgdGhlIHRlc3Qgc3VpdGUsIGFuZCBzaW11bGF0ZXMgZGlm
ZmVyZW50IGxpbmUgdHlwZXMKICAgIHdpdGggZGlmZmVyZW50IGVycm9yIG1vZGVzXQogIC0gem1v
ZGVtZnV6ei5jIGlzIGFib3V0IDE1JSBodW1hbiB3cml0dGVuLCBtYXliZSBhIGJpdCBsZXNzLgog
IFRoZSByZWFzb24gdGhlIGxhdGVyIGhhcyBiZWVuIHdyaXR0ZW4gbW9zdGx5IGJ5IHRoZSBMTE1z
IGlzIHRoYXQgaSdtCiAgbm90IGZlZWxpbmcgYWJsZSB0byB0aGluayBhcyBhdHRhY2tlciBhbmQg
ZGVmZW5kZXIgYXQgdGhlIHNhbWUgdGltZS4KICBNYXliZSBpIGNvdWxkIC0gYnV0IGkgd291bGQg
bmV2ZXIgYmV0IG9uIGl0LgogIEkgYWxzbyB3b3VsZCBuZXZlciBiZXQgb24gdGhlIGZ1enplciBi
ZWluZyBhYmxlIHRvIGRldGVjdCBhbGwgcG9zc2libGUKICBob2xlcywgYnV0IGl0IGRpZCBoZWxw
IG1lIHRvIGZpeCBtYW55IGJvcmRlciBjYXNlcy4KCiAgSWYgeW91IGRvbid0IHdhbnQgdG8gdXNl
IGxyenN6IGJlY2F1c2Ugb2YgdGhlIExMTSB1c2FnZSwgeW91IGRvbid0CiAgaGF2ZSB0by4gSSB1
bmRlcnN0YW5kIHRoYXQuIE1heWJlIHlvdSBjYW4gYmFja3BvcnQgdGhlIHNlY3VyaXR5IGZpeGVz
CiAgdG8gbHJ6c3otMC4xMi4yMXJjIC0gYnV0IGkgd2lsbCBub3QgZG8gdGhhdC4KCiAgVGhpcyBy
ZWxlYXNlIGRpZCBjb3N0IGFib3V0IDYgd2Vla3Mgb2YgbXkgc3BhcmUgdGltZSwgaW5jbHVkaW5n
IHNvbWUKICBleHRyYSB0aW1lIGR1cmluZyBteSB2YWNhdGlvbi4gSW4gYWRkaXRpb24gaSBzcGVu
dCBhIGZldyBkYXlzIHJld3JpdGluZwogIHRoZSBaTU9ERU0gc3BlY2lmaWNhdGlvbi4KICBJZiB5
b3UgZmVlbCB0aGF0IGkgc2hvdWxkIG5vdCBoYXZlIHNwZW50IHRoYXQgbXVjaCB0aW1lIG9uIHRo
aXMgb2xkCiAgcGFja2FnZTogeW91IGFyZSBub3QgYWxvbmUuCgogIElmIHlvdSBmZWVsIHlvdSBz
aG91bGQgcGF5IHNvbWV0aGluZyBmb3IgdGhpczogcGxlYXNlIGNvbnNpZGVyIGRvbmF0aW5nCiAg
dG8gc29tZSBpbnRlcm5hdGlvbmFsIGhlbHAgb3JnYW5pemF0aW9uLCBmb3IgZXhhbXBsZSBBbW5l
c3R5CiAgSW50ZXJuYXRpb25hbCwgSW50ZXJuYXRpb25hbCBSZWQgQ3Jvc3MgYW5kIFJlZCBDcmVz
Y2VudCBNb3ZlbWVudCwKICBNw6lkZWNpbnMgU2FucyBGcm9udGnDqHJlcyAoRG9jdG9ycyBXaXRo
b3V0IEJvcmRlcnMpIG9yIFVOSUNFRi4KClZlcnNpb24gMC4xMi4yMXJjIC0gQXVndXN0IDE5OTks
IFV3ZSBPaHNlCg==

--===============4006022588901563391==--


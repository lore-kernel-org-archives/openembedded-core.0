Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F019EC88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:49:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16934.1789451370751473638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 22:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YEbvtstw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FGxdgSSd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0a39cfd9e-10e0a9e3-2b44-4dd5-b21f-43a85f6f0095-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789451370;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m2a9arzF+s0JBrqAN9XEco0h/zqs+ryLrzRHbCr7BvM=;
	b=YEbvtstwRzLkwmb0ESC+/eqwFr1vnBo3/NluY6PLgtGZIKhOwfxn6WD+JyoAq5fF
	E4s1H9p0XBTnTi7cKtHTFgHSl44Ag/r9SYMAn0cdkpSxgiGvgV8BTzacWyOXnUEZpKP
	3dFRylD1TX12j2AAfdlFqssnj2RgC13zPs9Cs3I4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789451370;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m2a9arzF+s0JBrqAN9XEco0h/zqs+ryLrzRHbCr7BvM=;
	b=FGxdgSSdglJ6zlg9s2P2K0YFzfO5WGEsVAvjaHlQra7b5ikabrwjE7elLCV+1nnN
	rsamWdiAqMi1Xu0cSRYYpZg5jFL6ll7YPraIgf++Dzs0qQ38rRF1/4fZAU0eTWYatjk
	Vn5vbGgQVFSMn/6IuuHj3WnRZXoGFDSU1Zxc+nsw=
Content-Type: multipart/mixed; boundary="===============5081679942061405749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.10.0 FAILED
Message-ID: <010101a0a39cfd9e-10e0a9e3-2b44-4dd5-b21f-43a85f6f0095-000000@us-west-2.amazonses.com>
Date: Tue, 15 Sep 2026 05:49:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245818

--===============5081679942061405749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.10.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.9.3-1.10.0.patch
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
From aaffa393c1605fb417c327f6581c738bfee39c45 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Sep 2026 05:49:20 +0000
Subject: [PATCH] libadwaita: upgrade 1.9.3 -> 1.10.0

Source: NEWS

==============
Version 1.10.0
==============
- AdwAnimation
  - Fix AdwCallbackAnimationTarget annotations
- AdwActionRow
  - Ensure :use-markup property is set in constructed()
- AdwStatusPage
  - Stop using :last-child in styles
- AdwSidebar/AdwViewSwitcherSidbar
  - Document how to display suffix at the bottom
- AdwTabBar/AdwTabGrid
  - Clear a dangling idle callback in dispose
- Build
  - Fix release builds requiring sassc
  - Depend on glib 2.89.3
- Stylesheet
  - Support .flat and .raised for GtkDropDown
- Update icons from devkit
- Translation updates
  - Basque
  - Bosnian
  - Brazilian Portuguese
  - Bulgarian
  - Catalan
  - Chinese (China)
  - Danish
  - Dutch
  - Finnish
  - French
  - Galician
  - Hebrew
  - Hungarian
  - Korean
  - Lithuanian
  - Persian
  - Polish
  - Serbian
  - Spanish
  - Swedish
  - Uighur

===================
Version 1.10.beta.1
===================

- Build
  - Ministream-related fixes
  - Animate showing/hiding the title on the main page
- AdwActionRow
  - Don't emit signals in dispose
- AdwPreferencesRow
  - Warn when placed
- AdwSidebarItem
  - Add :prefix
- AdwSidebarSection
  - Add :suffix
- Update internal icons
- Docs
  - Use more detailed placeholder comments in examples
  - Chinese (China)
  - Czech
  - Georgian
  - Kazakh
  - Occitan
  - Ukrainian
==================
Version 1.10.alpha.1
==================

Include ministream sources into release tarballs.
  - Turkish
==================
Version 1.10.alpha
==================
- Add translation comments across the project
- Add AdwCssClassBinding
- Deprecate AdwEnumListModel; switch everything to GtkEnumList
- Build
  - Require GTK 4.23.1
  - Depend on ministream instead of appstream
  - Make it possible to build on Android
  - Include prebuilt styles again
  - Resolve locale directory at runtime on Windows
- Adaptive preview
  - Try to contain window styles within the preview
  - Collapse the sidebar on small sizes
  - Fix casing in a message
  - Don't make device model names and Phosh names translatable
- AdwAboutDialog
  - Add :other-apps-title
- AdwAboutDialog and AdwAboutWindow
- AdwApplication
  - Speed up initial style loading
- AdwBreakpointBin
  - Fix initial focus
  - Reduce the number of notify::opacity emissions on children
- AdwOverlaySplitView
  - Add a unique style class to the overlay sidebar
- AdwShortcutLabel
  - Use a more natural modifier ordering
  - Improve key labels on macOS
  - Add :prefix and :suffix
- AdwSpinnerPaintable
  - Support icon weight
  - Implement Android settings backend
  - Speed up initial loading
- AdwSwipeTracker
  - Ignore mostly orthogonal touchpad scrolls
- AdwViewSwitcherSidebar
  - Add :prefix and :suffix
  - Fix a leak
- Demo
  - Adjust shortcuts on macOS
- Examples
  - Fix a build error
  - Reduce icon weight for large icons
  - Improve popover shadow
  - Fix svg asset rendering with newer GTK
  - Adapt to GtkSpinner changes in newer GTK
  - Fix a copypaste error
- Update internal icons
- Va

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../libadwaita/{libadwaita_1.9.3.bb => libadwaita_1.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.9.3.bb => libadwaita_1.10.0.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb
index 4752147402..21c0395b84 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "fc59b37028fe0126308e7b805d2f6e4e80227080a1797715e5e6286b8111e723"
+SRC_URI[archive.sha256sum] = "b1bf56239269d101a6391ad4553c910eff9cc6170b803916405477ef60a66c84"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.1


--===============5081679942061405749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libadwaita-changelog.txt"

Changelog for libadwaita: 1.9.3 -> 1.10.0
Source: NEWS

==============
Version 1.10.0
==============
- AdwAnimation
  - Fix AdwCallbackAnimationTarget annotations
- AdwActionRow
  - Ensure :use-markup property is set in constructed()
- AdwStatusPage
  - Stop using :last-child in styles
- AdwSidebar/AdwViewSwitcherSidbar
  - Document how to display suffix at the bottom
- AdwTabBar/AdwTabGrid
  - Clear a dangling idle callback in dispose
- Build
  - Fix release builds requiring sassc
  - Depend on glib 2.89.3
- Stylesheet
  - Support .flat and .raised for GtkDropDown
- Update icons from devkit
- Translation updates
  - Basque
  - Bosnian
  - Brazilian Portuguese
  - Bulgarian
  - Catalan
  - Chinese (China)
  - Danish
  - Dutch
  - Finnish
  - French
  - Galician
  - Hebrew
  - Hungarian
  - Korean
  - Lithuanian
  - Persian
  - Polish
  - Serbian
  - Spanish
  - Swedish
  - Uighur

===================
Version 1.10.beta.1
===================

- Build
  - Ministream-related fixes
  - Animate showing/hiding the title on the main page
- AdwActionRow
  - Don't emit signals in dispose
- AdwPreferencesRow
  - Warn when placed
- AdwSidebarItem
  - Add :prefix
- AdwSidebarSection
  - Add :suffix
- Update internal icons
- Docs
  - Use more detailed placeholder comments in examples
  - Chinese (China)
  - Czech
  - Georgian
  - Kazakh
  - Occitan
  - Ukrainian
==================
Version 1.10.alpha.1
==================

Include ministream sources into release tarballs.
  - Turkish
==================
Version 1.10.alpha
==================
- Add translation comments across the project
- Add AdwCssClassBinding
- Deprecate AdwEnumListModel; switch everything to GtkEnumList
- Build
  - Require GTK 4.23.1
  - Depend on ministream instead of appstream
  - Make it possible to build on Android
  - Include prebuilt styles again
  - Resolve locale directory at runtime on Windows
- Adaptive preview
  - Try to contain window styles within the preview
  - Collapse the sidebar on small sizes
  - Fix casing in a message
  - Don't make device model names and Phosh names translatable
- AdwAboutDialog
  - Add :other-apps-title
- AdwAboutDialog and AdwAboutWindow
- AdwApplication
  - Speed up initial style loading
- AdwBreakpointBin
  - Fix initial focus
  - Reduce the number of notify::opacity emissions on children
- AdwOverlaySplitView
  - Add a unique style class to the overlay sidebar
- AdwShortcutLabel
  - Use a more natural modifier ordering
  - Improve key labels on macOS
  - Add :prefix and :suffix
- AdwSpinnerPaintable
  - Support icon weight
  - Implement Android settings backend
  - Speed up initial loading
- AdwSwipeTracker
  - Ignore mostly orthogonal touchpad scrolls
- AdwViewSwitcherSidebar
  - Add :prefix and :suffix
  - Fix a leak
- Demo
  - Adjust shortcuts on macOS
- Examples
  - Fix a build error
  - Reduce icon weight for large icons
  - Improve popover shadow
  - Fix svg asset rendering with newer GTK
  - Adapt to GtkSpinner changes in newer GTK
  - Fix a copypaste error
- Update internal icons
- Various cleanups
  - Chinese (Taiwan)
  - Cornish
  - Filipino
  - Kabyle
  - Polish
  - Romanian
  - Russian
  - Slovenian

--===============5081679942061405749==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.9.3-1.10.0.patch"

RnJvbSBhYWZmYTM5M2MxNjA1ZmI0MTdjMzI3ZjY1ODFjNzM4YmZlZTM5YzQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgU2VwIDIwMjYgMDU6NDk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuOS4zIC0+IDEuMTAuMAoKU291cmNlOiBORVdTCgo9PT09PT09
PT09PT09PQpWZXJzaW9uIDEuMTAuMAo9PT09PT09PT09PT09PQotIEFkd0FuaW1hdGlvbgogIC0g
Rml4IEFkd0NhbGxiYWNrQW5pbWF0aW9uVGFyZ2V0IGFubm90YXRpb25zCi0gQWR3QWN0aW9uUm93
CiAgLSBFbnN1cmUgOnVzZS1tYXJrdXAgcHJvcGVydHkgaXMgc2V0IGluIGNvbnN0cnVjdGVkKCkK
LSBBZHdTdGF0dXNQYWdlCiAgLSBTdG9wIHVzaW5nIDpsYXN0LWNoaWxkIGluIHN0eWxlcwotIEFk
d1NpZGViYXIvQWR3Vmlld1N3aXRjaGVyU2lkYmFyCiAgLSBEb2N1bWVudCBob3cgdG8gZGlzcGxh
eSBzdWZmaXggYXQgdGhlIGJvdHRvbQotIEFkd1RhYkJhci9BZHdUYWJHcmlkCiAgLSBDbGVhciBh
IGRhbmdsaW5nIGlkbGUgY2FsbGJhY2sgaW4gZGlzcG9zZQotIEJ1aWxkCiAgLSBGaXggcmVsZWFz
ZSBidWlsZHMgcmVxdWlyaW5nIHNhc3NjCiAgLSBEZXBlbmQgb24gZ2xpYiAyLjg5LjMKLSBTdHls
ZXNoZWV0CiAgLSBTdXBwb3J0IC5mbGF0IGFuZCAucmFpc2VkIGZvciBHdGtEcm9wRG93bgotIFVw
ZGF0ZSBpY29ucyBmcm9tIGRldmtpdAotIFRyYW5zbGF0aW9uIHVwZGF0ZXMKICAtIEJhc3F1ZQog
IC0gQm9zbmlhbgogIC0gQnJhemlsaWFuIFBvcnR1Z3Vlc2UKICAtIEJ1bGdhcmlhbgogIC0gQ2F0
YWxhbgogIC0gQ2hpbmVzZSAoQ2hpbmEpCiAgLSBEYW5pc2gKICAtIER1dGNoCiAgLSBGaW5uaXNo
CiAgLSBGcmVuY2gKICAtIEdhbGljaWFuCiAgLSBIZWJyZXcKICAtIEh1bmdhcmlhbgogIC0gS29y
ZWFuCiAgLSBMaXRodWFuaWFuCiAgLSBQZXJzaWFuCiAgLSBQb2xpc2gKICAtIFNlcmJpYW4KICAt
IFNwYW5pc2gKICAtIFN3ZWRpc2gKICAtIFVpZ2h1cgoKPT09PT09PT09PT09PT09PT09PQpWZXJz
aW9uIDEuMTAuYmV0YS4xCj09PT09PT09PT09PT09PT09PT0KCi0gQnVpbGQKICAtIE1pbmlzdHJl
YW0tcmVsYXRlZCBmaXhlcwogIC0gQW5pbWF0ZSBzaG93aW5nL2hpZGluZyB0aGUgdGl0bGUgb24g
dGhlIG1haW4gcGFnZQotIEFkd0FjdGlvblJvdwogIC0gRG9uJ3QgZW1pdCBzaWduYWxzIGluIGRp
c3Bvc2UKLSBBZHdQcmVmZXJlbmNlc1JvdwogIC0gV2FybiB3aGVuIHBsYWNlZAotIEFkd1NpZGVi
YXJJdGVtCiAgLSBBZGQgOnByZWZpeAotIEFkd1NpZGViYXJTZWN0aW9uCiAgLSBBZGQgOnN1ZmZp
eAotIFVwZGF0ZSBpbnRlcm5hbCBpY29ucwotIERvY3MKICAtIFVzZSBtb3JlIGRldGFpbGVkIHBs
YWNlaG9sZGVyIGNvbW1lbnRzIGluIGV4YW1wbGVzCiAgLSBDaGluZXNlIChDaGluYSkKICAtIEN6
ZWNoCiAgLSBHZW9yZ2lhbgogIC0gS2F6YWtoCiAgLSBPY2NpdGFuCiAgLSBVa3JhaW5pYW4KPT09
PT09PT09PT09PT09PT09ClZlcnNpb24gMS4xMC5hbHBoYS4xCj09PT09PT09PT09PT09PT09PQoK
SW5jbHVkZSBtaW5pc3RyZWFtIHNvdXJjZXMgaW50byByZWxlYXNlIHRhcmJhbGxzLgogIC0gVHVy
a2lzaAo9PT09PT09PT09PT09PT09PT0KVmVyc2lvbiAxLjEwLmFscGhhCj09PT09PT09PT09PT09
PT09PQotIEFkZCB0cmFuc2xhdGlvbiBjb21tZW50cyBhY3Jvc3MgdGhlIHByb2plY3QKLSBBZGQg
QWR3Q3NzQ2xhc3NCaW5kaW5nCi0gRGVwcmVjYXRlIEFkd0VudW1MaXN0TW9kZWw7IHN3aXRjaCBl
dmVyeXRoaW5nIHRvIEd0a0VudW1MaXN0Ci0gQnVpbGQKICAtIFJlcXVpcmUgR1RLIDQuMjMuMQog
IC0gRGVwZW5kIG9uIG1pbmlzdHJlYW0gaW5zdGVhZCBvZiBhcHBzdHJlYW0KICAtIE1ha2UgaXQg
cG9zc2libGUgdG8gYnVpbGQgb24gQW5kcm9pZAogIC0gSW5jbHVkZSBwcmVidWlsdCBzdHlsZXMg
YWdhaW4KICAtIFJlc29sdmUgbG9jYWxlIGRpcmVjdG9yeSBhdCBydW50aW1lIG9uIFdpbmRvd3MK
LSBBZGFwdGl2ZSBwcmV2aWV3CiAgLSBUcnkgdG8gY29udGFpbiB3aW5kb3cgc3R5bGVzIHdpdGhp
biB0aGUgcHJldmlldwogIC0gQ29sbGFwc2UgdGhlIHNpZGViYXIgb24gc21hbGwgc2l6ZXMKICAt
IEZpeCBjYXNpbmcgaW4gYSBtZXNzYWdlCiAgLSBEb24ndCBtYWtlIGRldmljZSBtb2RlbCBuYW1l
cyBhbmQgUGhvc2ggbmFtZXMgdHJhbnNsYXRhYmxlCi0gQWR3QWJvdXREaWFsb2cKICAtIEFkZCA6
b3RoZXItYXBwcy10aXRsZQotIEFkd0Fib3V0RGlhbG9nIGFuZCBBZHdBYm91dFdpbmRvdwotIEFk
d0FwcGxpY2F0aW9uCiAgLSBTcGVlZCB1cCBpbml0aWFsIHN0eWxlIGxvYWRpbmcKLSBBZHdCcmVh
a3BvaW50QmluCiAgLSBGaXggaW5pdGlhbCBmb2N1cwogIC0gUmVkdWNlIHRoZSBudW1iZXIgb2Yg
bm90aWZ5OjpvcGFjaXR5IGVtaXNzaW9ucyBvbiBjaGlsZHJlbgotIEFkd092ZXJsYXlTcGxpdFZp
ZXcKICAtIEFkZCBhIHVuaXF1ZSBzdHlsZSBjbGFzcyB0byB0aGUgb3ZlcmxheSBzaWRlYmFyCi0g
QWR3U2hvcnRjdXRMYWJlbAogIC0gVXNlIGEgbW9yZSBuYXR1cmFsIG1vZGlmaWVyIG9yZGVyaW5n
CiAgLSBJbXByb3ZlIGtleSBsYWJlbHMgb24gbWFjT1MKICAtIEFkZCA6cHJlZml4IGFuZCA6c3Vm
Zml4Ci0gQWR3U3Bpbm5lclBhaW50YWJsZQogIC0gU3VwcG9ydCBpY29uIHdlaWdodAogIC0gSW1w
bGVtZW50IEFuZHJvaWQgc2V0dGluZ3MgYmFja2VuZAogIC0gU3BlZWQgdXAgaW5pdGlhbCBsb2Fk
aW5nCi0gQWR3U3dpcGVUcmFja2VyCiAgLSBJZ25vcmUgbW9zdGx5IG9ydGhvZ29uYWwgdG91Y2hw
YWQgc2Nyb2xscwotIEFkd1ZpZXdTd2l0Y2hlclNpZGViYXIKICAtIEFkZCA6cHJlZml4IGFuZCA6
c3VmZml4CiAgLSBGaXggYSBsZWFrCi0gRGVtbwogIC0gQWRqdXN0IHNob3J0Y3V0cyBvbiBtYWNP
UwotIEV4YW1wbGVzCiAgLSBGaXggYSBidWlsZCBlcnJvcgogIC0gUmVkdWNlIGljb24gd2VpZ2h0
IGZvciBsYXJnZSBpY29ucwogIC0gSW1wcm92ZSBwb3BvdmVyIHNoYWRvdwogIC0gRml4IHN2ZyBh
c3NldCByZW5kZXJpbmcgd2l0aCBuZXdlciBHVEsKICAtIEFkYXB0IHRvIEd0a1NwaW5uZXIgY2hh
bmdlcyBpbiBuZXdlciBHVEsKICAtIEZpeCBhIGNvcHlwYXN0ZSBlcnJvcgotIFVwZGF0ZSBpbnRl
cm5hbCBpY29ucwotIFZhCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAg
Y2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2ht
ZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL2xpYmFkd2FpdGEve2xpYmFkd2FpdGFfMS45
LjMuYmIgPT4gbGliYWR3YWl0YV8xLjEwLjAuYmJ9ICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21l
L2xpYmFkd2FpdGEve2xpYmFkd2FpdGFfMS45LjMuYmIgPT4gbGliYWR3YWl0YV8xLjEwLjAuYmJ9
ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3
YWl0YV8xLjkuMy5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFf
MS4xMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1n
bm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFfMS45LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFfMS4xMC4wLmJiCmluZGV4IDQ3NTIxNDc0MDIu
LjIxYzAzOTViODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL2xp
YmFkd2FpdGFfMS45LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGli
YWR3YWl0YV8xLjEwLjAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICIgXAogCiBpbmhl
cml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZhbGEgZmVhdHVy
ZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZmM1OWIzNzAyOGZlMDEy
NjMwOGU3YjgwNWQyZjZlNGU4MDIyNzA4MGExNzk3NzE1ZTVlNjI4NmI4MTExZTcyMyIKK1NSQ19V
UklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImIxYmY1NjIzOTI2OWQxMDFhNjM5MWFkNDU1M2M5MTBl
ZmY5Y2M2MTcwYjgwMzkxNjQwNTQ3N2VmNjBhNjZjODQiCiAKIEFOWV9PRl9ESVNUUk9fRkVBVFVS
RVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0g
Im9wZW5nbCIKLS0gCjIuNDcuMQoK

--===============5081679942061405749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-2c36b5234bf830db9a839114da9b4dc80ed425f7"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2c36b5234bf830db9a839114da9b4dc80ed425f7"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 778 Local 764 Mirrors 0 Missed 14 Current 943 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3663 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_recipe_qa)
NOTE: Running task 3865 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_write_config)
NOTE: Running task 4001 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_create_recipe_spdx)
NOTE: recipe libadwaita-1.10.0-r0: task do_recipe_qa: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.10.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4014 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_fetch)
NOTE: recipe libadwaita-1.10.0-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libadwaita-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 4015 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_unpack)
NOTE: Running task 4016 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libadwaita-1.10.0-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 4017 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_patch)
NOTE: recipe libadwaita-1.10.0-r0: task do_patch: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 4018 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4019 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_populate_lic)
NOTE: recipe libadwaita-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_populate_lic: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libadwaita-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libadwaita-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4020 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_configure)
NOTE: recipe libadwaita-1.10.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto
 -worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yo
 cto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sass/sassc_3.6.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'gtk4', 'libgudev', 'librsvg', 'libxmlb', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb
 ', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'appstream', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libfyaml', 'libgcrypt', 'libgpg-error', 'libical', 'libmicrohttpd', 'libpcre2', 'libpsl', 'libseccomp', 'libunistring', 'libusb1', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-nativ
 e', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-native', 'vala-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'acl-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'libsass-native', 'sassc-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=false -Dintrospection=enabled -Dvapi=true -Dexamples=false...
| The Meson build system
| Version: 1.12.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/sources/libadwaita-1.10.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/build
| Build type: cross build
| DEPRECATION: Option "gtk_doc" is replaced by 'documentation'
| Project name: libadwaita
| Project version: 1.10.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/recipe-sysroot (gcc 16.2.0 "x86_64-poky-linux-gcc (GCC) 16.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/recipe-sysroot ld.bfd 2.47.20260726
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/recipe-sysroot-native/usr/bin/pkg-config) 3.0.7
| Dependency glib-2.0 for host machine found: NO. Found 2.88.3 but need: '>= 2.89.3'
| Found CMake: NO
| Run-time dependency glib-2.0 found: NO
| 
| ../sources/libadwaita-1.10.0/meson.build:39:11: ERROR: Dependency lookup for glib-2.0 with method 'pkg-config' failed: Invalid version, need 'glib-2.0' ['>= 2.89.3'] found '2.88.3'.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Dependency glib-2.0 for host machine found: NO. Found 2.88.3 but need: '>= 2.89.3'
| Dependency lookup for glib-2.0 with method 'pkg-config' failed: Invalid version, need 'glib-2.0' ['>= 2.89.3'] found '2.88.3'.
| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| Dependency lookup for glib-2.0 with method 'cmake' failed: CMake binary for machine host machine not found. Giving up.
| Run-time dependency glib-2.0 found: NO
| 
| ../sources/libadwaita-1.10.0/meson.build:39:11: ERROR: Dependency lookup for glib-2.0 with method 'pkg-config' failed: Invalid version, need 'glib-2.0' ['>= 2.89.3'] found '2.88.3'.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/run.do_configure.398593:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/run.do_configure.398593, line 177
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/run.do_configure.398593, line 166
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/run.do_configure.398593, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/run.do_configure.398593, line 190
NOTE: recipe libadwaita-1.10.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4020 tasks of which 4010 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915054904.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915054904.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/log.do_configure.398593
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libadwaita-1.10.0-r0 do_configure: meson setup failed
ERROR: libadwaita-1.10.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/run.do_configure.398593' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.10.0/temp/log.do_configure.398593
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_configure) failed with exit code '1'

--===============5081679942061405749==--


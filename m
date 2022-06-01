Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDF5CCA484
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.618.1654100324468910120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ztr5Ss3J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010181200fed07-6aea7dc1-7d45-4033-b573-b502e039ac16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xj1vmtJhwq4oDyEOufW+kzZVA0ROEhWMjZIrJKIEmjY=;
	b=Ztr5Ss3JrYsrKQ0ekm4dyMpWRLq4FdUgYhx1GgrSe7Jmm8XJRueDpWNgH94V8DLJ
	wI16vLCc/ezyNmYr5/MNfcLazRxcOyEqCPxgf1/cBxZOd/skzZoUNSrgvRdWRpwxlkp
	RKAFyHhhVGk3ekOQQ0T+tgg3z0IaliPMkV6Yy32o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xj1vmtJhwq4oDyEOufW+kzZVA0ROEhWMjZIrJKIEmjY=;
	b=VHoYl30eerQj+yxODbm/bnc95uby2Dv89373fYbph0vi5i/gLM7NL0AbKH/wR17y
	UU+bnDTlVah8EZeEYUymS3DGsp7PwMCgLnuGRAmaoLJwJ0D6euPSIh6ftDfDJnPMCwx
	HMRNtHVjMOZNljqJ54vZ4QAQ9gIiTLzv5fBJ7GvE=
Content-Type: multipart/mixed; boundary="===============7693953358527745478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 42.0 SUCCEEDED
Message-ID: 
 <01010181200fed07-6aea7dc1-7d45-4033-b573-b502e039ac16-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166418

--===============7693953358527745478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *adwaita-icon-theme* to *42.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-adwaita-icon-theme-upgrade-41.0-42.0.patch
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
--===============7693953358527745478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PV changed from "41.0" to "42.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PKGV changed from 41.0 [default] to 42.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-hires: PV changed from "41.0" to "42.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-hires: FILELIST: removed "/usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/256x256/legacy/face-embarrassed.png /usr/share/icons/Adwaita/256x256/legacy/face-cool.png /usr/share/icons/Adwaita/256x256/legacy/face-smirk.png /usr/share/icons/Adwaita/256x256/legacy/help-browser.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/256x256/legacy/system-users.png /usr/share/icons/Adwaita/256x256/legacy/dialog-error.png /usr/share/icons/Adwaita/512x512/legacy/address-book-new.png /usr/share/icons/Adwaita/256x256/legacy/system-run.png /usr/share/icons/Adwaita/256x256/legacy/printer-printing.png /usr/share/icons/Adwaita/256x256/legacy/view-refresh.png /usr/share/icons/Adwaita/256x256/legacy/dialog-question.png /usr/share/icons/Adwaita/256x256/legacy/battery-low-charging.png /usr/share/icons/Adwaita/512x512/legacy/applications-system.p
 ng /usr/share/icons/Adwaita/256x256/legacy/face-surprise.png /usr/share/icons/Adwaita/256x256/legacy/emblem-synchronizing.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/256x256/legacy/network-idle.png /usr/share/icons/Adwaita/256x256/legacy/ac-adapter.png /usr/share/icons/Adwaita/256x256/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/256x256/legacy/battery-caution.png /usr/share/icons/Adwaita/256x256/legacy/face-laugh.png /usr/share/icons/Adwaita/256x256/legacy/user-idle.png /usr/share/icons/Adwaita/512x512/legacy/applications-internet.png /usr/share/icons/Adwaita/256x256/legacy/go-next.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/256x256/legacy/mail-message-new.png /usr/share/icons/Adwaita/256x256/legacy/security-medium.png /usr/share/icons/Adwaita/256x256/legacy/face-uncertain.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-privacy.png /usr/share/
 icons/Adwaita/256x256/legacy/network-error.png /usr/share/icons/Adwaita/256x256/legacy/document-print-preview.png /usr/share/icons/Adwaita/256x256/legacy/system-software-install.png /usr/share/icons/Adwaita/256x256/legacy/non-starred.png /usr/share/icons/Adwaita/256x256/legacy/face-wink.png /usr/share/icons/Adwaita/256x256/legacy/emblem-mail.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/512x512/legacy/folder-visiting.png /usr/share/icons/Adwaita/256x256/legacy/dialog-password.png /usr/share/icons/Adwaita/256x256/legacy/document-print.png /usr/share/icons/Adwaita/256x256/legacy/edit-delete.png /usr/share/icons/Adwaita/256x256/legacy/network-receive.png /usr/share/icons/Adwaita/256x256/legacy/emote-love.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/256x256/legacy/network-transmit.png /usr/share/icons/Adwaita/256x256/legacy/camera-photo.png /usr/share/icons/Adwaita/256x256/legacy/
 network-cellular-connected.png /usr/share/icons/Adwaita/256x256/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/256x256/legacy/network-offline.png /usr/share/icons/Adwaita/256x256/legacy/input-mouse.png /usr/share/icons/Adwaita/256x256/legacy/input-keyboard.png /usr/share/icons/Adwaita/512x512/legacy/document-properties.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-low.png /usr/share/icons/Adwaita/256x256/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/256x256/legacy/user-info.png /usr/share/icons/Adwaita/256x256/legacy/go-next-rtl.png /usr/share/icons/Adwaita/512x512/legacy/edit-select-all.png /usr/share/icons/Adwaita/512x512/legacy/accessories-character-map.png /usr/share/icons/Adwaita/512x512/legacy/input-dialpad.png /usr/share/icons/Adwaita/512x512/legacy/document-revert.png /usr/share/icons/Adwaita/256x256/legacy/dialog-information.png /usr/share/icons/Adwaita/256x256/legacy/drive-optical.png /usr/share/icons/Adwaita/256x256/legacy/system-l
 ock-screen.png /usr/share/icons/Adwaita/256x256/legacy/user-busy.png /usr/share/icons/Adwaita/256x256/legacy/applications-development.png /usr/share/icons/Adwaita/512x512/legacy/document-page-setup.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-network.png /usr/share/icons/Adwaita/512x512/legacy/accessories-calculator.png /usr/share/icons/Adwaita/256x256/legacy/go-previous.png /usr/share/icons/Adwaita/256x256/legacy/camera-web.png /usr/share/icons/Adwaita/256x256/legacy/process-stop.png /usr/share/icons/Adwaita/256x256/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/256x256/legacy/trophy-gold.png /usr/share/icons/Adwaita/512x512/legacy/document-save.png /usr/share/icons/Adwaita/256x256/legacy/battery-full-charging.png /usr/share/icons/Adwaita/256x256/legacy/go-last-rtl.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/256x256/legacy
 /security-low.png /usr/share/icons/Adwaita/256x256/legacy/face-glasses.png /usr/share/icons/Adwaita/256x256/legacy/face-angry.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/256x256/legacy/go-last.png /usr/share/icons/Adwaita/512x512/legacy/image-missing.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/256x256/legacy/face-angel.png /usr/share/icons/Adwaita/256x256/legacy/battery-good-charging.png /usr/share/icons/Adwaita/256x256/legacy/computer-fail.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system.png /usr/share/icons/Adwaita/256x256/legacy/applications-office.png /usr/share/icons/Adwaita/512x512/legacy/document-open.png /usr/share/icons/Adwaita/256x256/legacy/face-smile-big.png /usr/share/icons/Adwaita/256x256/legacy/battery-good.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/256x256/legacy/applets-scr
 eenshooter.png /usr/share/icons/Adwaita/256x256/legacy/system-log-out.png /usr/share/icons/Adwaita/256x256/legacy/input-gaming.png /usr/share/icons/Adwaita/256x256/legacy/media-flash.png /usr/share/icons/Adwaita/256x256/legacy/web-browser.png /usr/share/icons/Adwaita/512x512/legacy/document-save-as.png /usr/share/icons/Adwaita/512x512/legacy/mark-location.png /usr/share/icons/Adwaita/256x256/legacy/battery-full.png /usr/share/icons/Adwaita/256x256/legacy/video-display.png /usr/share/icons/Adwaita/256x256/legacy/face-plain.png /usr/share/icons/Adwaita/256x256/legacy/go-first-rtl.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-high.png /usr/share/icons/Adwaita/256x256/legacy/document-open-recent.png /usr/share/icons/Adwaita/256x256/legacy/user-available.png /usr/share/icons/Adwaita/512x512/legacy/folder-new.png /usr/share/icons/Adwaita/256x256/legacy/applications-graphics.png /usr/share/icons/Adwaita/256x256/legacy/scanner.png /usr/share/icons/Adwaita/256x256/legacy/appointme
 nt-missed.png /usr/share/icons/Adwaita/256x256/legacy/face-smile.png /usr/share/icons/Adwaita/256x256/legacy/face-tired.png /usr/share/icons/Adwaita/256x256/legacy/go-first.png /usr/share/icons/Adwaita/256x256/legacy/system-search.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/256x256/legacy/face-sick.png /usr/share/icons/Adwaita/256x256/legacy/starred.png /usr/share/icons/Adwaita/256x256/legacy/battery-missing.png /usr/share/icons/Adwaita/256x256/legacy/user-offline.png /usr/share/icons/Adwaita/256x256/legacy/system-software-update.png /usr/share/icons/Adwaita/256x256/legacy/face-devilish.png /usr/share/icons/Adwaita/256x256/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/256x256/legacy/software-update-urgent.png /usr/share/icons/Adwaita/512x512/legacy/document-new.png /usr/share/icons/Adwaita/512x512/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/256x256/legacy/face-crying.png /usr/share/icons/Adwaita/256x
 256/legacy/go-jump.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/256x256/legacy/face-sad.png /usr/share/icons/Adwaita/256x256/legacy/security-high.png /usr/share/icons/Adwaita/512x512/legacy/utilities-terminal.png /usr/share/icons/Adwaita/256x256/legacy/system-file-manager.png /usr/share/icons/Adwaita/256x256/legacy/printer-error.png /usr/share/icons/Adwaita/256x256/legacy/computer.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-search.png /usr/share/icons/Adwaita/256x256/legacy/media-floppy.png /usr/share/icons/Adwaita/256x256/legacy/battery-full-charged.png /usr/share/icons/Adwaita/256x256/legacy/battery.png /usr/share/icons/Adwaita/256x256/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/512x512/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/256x256/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/256x256/legacy/edit-find.png /usr/share/icons/Adwaita/256x256/legacy/battery-l
 ow.png /usr/share/icons/Adwaita/256x256/legacy/trophy-silver.png /usr/share/icons/Adwaita/256x256/legacy/drive-multidisk.png /usr/share/icons/Adwaita/256x256/legacy/battery-empty.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/256x256/legacy/input-tablet.png /usr/share/icons/Adwaita/256x256/legacy/software-update-available.png /usr/share/icons/Adwaita/256x256/legacy/mail-read.png /usr/share/icons/Adwaita/256x256/legacy/edit-find-replace.png /usr/share/icons/Adwaita/256x256/legacy/dialog-warning.png /usr/share/icons/Adwaita/256x256/legacy/trophy-bronze.png /usr/share/icons/Adwaita/512x512/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/256x256/legacy/user-away.png /usr/share/icons/Adwaita/256x256/legacy/audio-speakers.png /usr/share/icons/Adwaita/256x256/legacy/user-invisible.png /usr/share/icons/Adwaita/512x512/legacy/emblem-package.png /usr/share/icons/Adwaita/256x256/legacy/phone.png /usr/share/icons/Adwaita/256x256/legacy/acc
 essories-calculator.png /usr/share/icons/Adwaita/256x256/legacy/system-shutdown.png /usr/share/icons/Adwaita/256x256/legacy/appointment-soon.png /usr/share/icons/Adwaita/256x256/legacy/semi-starred.png /usr/share/icons/Adwaita/256x256/legacy/appointment-new.png /usr/share/icons/Adwaita/256x256/legacy/ebook-reader.png /usr/share/icons/Adwaita/512x512/legacy/multimedia-player.png", added "/usr/share/icons/Adwaita/512x512/devices/camera-web.png /usr/share/icons/Adwaita/512x512/devices/phone.png /usr/share/icons/Adwaita/512x512/devices/drive-optical.png /usr/share/icons/Adwaita/512x512/devices/input-mouse.png /usr/share/icons/Adwaita/512x512/devices/input-tablet.png /usr/share/icons/Adwaita/512x512/devices/media-flash.png /usr/share/icons/Adwaita/512x512/devices/drive-multidisk.png /usr/share/icons/Adwaita/512x512/devices/media-floppy.png /usr/share/icons/Adwaita/512x512/devices/scanner.png /usr/share/icons/Adwaita/512x512/devices/input-keyboard.png /usr/share/icons/Adwaita/512x512/devi
 ces/video-display.png /usr/share/icons/Adwaita/512x512/devices/ebook-reader.png"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-hires: PKGV changed from 41.0 [default] to 42.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-hires: PKGSIZE changed from 6541684 to 1546916 (-76%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PV changed from "41.0" to "42.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PKGV changed from 41.0 [default] to 42.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic-hires: PV changed from "41.0" to "42.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic-hires: FILELIST: removed "/usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/help-faq-symbolic.symbolic.png /usr/share/ico
 ns/Adwaita/96x96/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/ico
 ns/Adwaita/96x96/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/
 Adwaita/96x96/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessorie
 s-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons
 /Adwaita/64x64/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/ap
 ps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps
 /preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/app
 s/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/system-software-install-symbolic.symbolic.png /usr
 /share/icons/Adwaita/96x96/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessories-text-editor-symbolic.s
 ymbolic.png /usr/share/icons/Adwaita/32x32/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/
 apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/w
 eb-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/multimedia-volume-control-symbolic.
 symbolic.png /usr/share/icons/Adwaita/64x64/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessories-calculator-symbolic.symbolic.png", added "/usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-dictionary-symbolic.s
 ymbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/
 actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-rtl-symbolic.symb
 olic.png /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-low-rtl-symboli
 c.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/devices/audio-speakers-rtl-symbol
 ic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiri
 ng-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/statu
 s/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/leg
 acy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /
 usr/share/icons/Adwaita/32x32/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-symbolic-rtl
 .symbolic.png /usr/share/icons/Adwaita/64x64/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-vpn-disabled-symbolic.
 symbolic.png /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-w
 eak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-low-symbo
 lic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/devices/m
 edia-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96
 /legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-indent-less-rtl-symbolic.
 symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-des
 ktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Ad
 waita/32x32/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/
 icons/Adwaita/64x64/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-rtl-symbolic
 .symbolic.png /usr/share/icons/Adwaita/96x96/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cell
 ular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/security-medium-
 rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48
 /legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/system-switch-use
 r-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/
 Adwaita/48x48/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal
 -symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/prefere
 nces-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/ne
 twork-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferen
 ces-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/
 legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/networ
 k-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status
 /network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-symbolic-rtl.symbolic.pn
 g /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-high-symbolic-rtl.sym
 bolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-t
 ext-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-
 paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/system-log-out-rtl-symbolic.symbolic.p
 ng /usr/share/icons/Adwaita/64x64/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-performance-symbolic-rtl.symb
 olic.png /usr/share/icons/Adwaita/32x32/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-offli
 ne-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icon
 s/Adwaita/64x64/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-rtl-symboli
 c.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-deskto
 p-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/
 Adwaita/32x32/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-rtl-symbolic.symbolic.png"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic-hires: PKGV changed from 41.0 [default] to 42.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic-hires: PKGSIZE changed from 1645646 to 2027073 (+23%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PV changed from "41.0" to "42.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: FILELIST: removed "/usr/share/icons/Adwaita/16x16/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/help-faq-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/help-browser-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-details-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/accessories-cha
 racter-map-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-wired-offline-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-notifications-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/help-browser-symbolic.symbolic.
 png /usr/share/icons/Adwaita/16x16/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/goa-panel-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-sharing-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-locale-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/
 icons/Adwaita/scalable/actions/sidebar-show-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-display-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-time-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/web-browser-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-font-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-shortcuts-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/help-browser-symbol
 ic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-parental-controls-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons
 /Adwaita/16x16/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/gnome-power-manager-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/accessories-text-editor-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-devices-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/system-file-manager-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/applets-screenshooter-symbolic.svg /usr/
 share/icons/Adwaita/24x24/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-proxy-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/text-editor-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-accessibility-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-color-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-symbolic.symbolic.png /usr/s
 hare/icons/Adwaita/24x24/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-privacy-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/accessories-dictionary-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/accessories-calculator-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-apps-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/system-users-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-wallpaper-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-system-sharing-s
 ymbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/accessories-character-map-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/utilities-terminal-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/multimedia-volume-control-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/system-software-install-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-search-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adw
 aita/scalable/apps/preferences-desktop-remote-desktop-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/user-info-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-screensaver-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/accessories-text-editor-symbolic.symbolic.png", added "/usr/share/icons/Adwaita/
 16x16/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/format-text-direction-ltr-symbolic.svg /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/system-switch-user-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-apps-symbolic.svg /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/power-profile-balanced-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/view-wrapped-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/sh
 are/icons/Adwaita/24x24/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-shortcuts-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/system-log-out-rtl-symbolic.symbolic.png /u
 sr/share/icons/Adwaita/16x16/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-locale-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-accessibility-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/system-file-manager-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwait
 a/scalable/actions/selection-mode-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/audio-volume-low-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-display-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/orientation-portrait-left-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/actions/format-indent-less-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/image-missing-symbol
 ic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-high-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-remote-desktop-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/mail-
 reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-details-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/user-info-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/mail-replied-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/accessories-dictionary-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24
 x24/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/devices/tablet-symbolic.svg /usr/share/icons/Adwaita/16x16/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/go-jump-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-acquiring-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/orientation-por
 trait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/network-transmit-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/accessories-character-ma
 p-symbolic.svg /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adw
 aita/scalable/status/bluetooth-acquiring-symbolic.svg /usr/share/icons/Adwaita/scalable/status/mail-replied-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/devices/media-optical-cd-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/power-profile-performance-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwai
 ta/scalable/status/power-profile-balanced-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-devices-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/format-indent-more-rtl-symbolic.svg /us
 r/share/icons/Adwaita/scalable/devices/audio-speakers-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/applets-screenshooter-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/format-text-plaintext-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/mail-reply-sender-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/sidebar-show-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/legacy/text-editor-s
 ymbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-privacy-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-vpn-disabled-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-receive-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/semi-starred-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/system-software-install-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-appearance-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwa
 ita/24x24/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-symbolic-rtl.symbolic.png /u
 sr/share/icons/Adwaita/scalable/status/network-cellular-no-route-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/text-editor-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/view-paged-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/application-exit-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/netwo
 rk-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/goa-panel-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/help-browser-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-offline-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/view-list-bul
 let-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-color-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-vpn-disconnected-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/help-contents-s
 ymbolic.svg /usr/share/icons/Adwaita/16x16/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-acquiring-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/accessories-calculator-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-proxy-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-rtl-symbolic.
 symbolic.png /usr/share/icons/Adwaita/16x16/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/orientation-portrait-right-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-search-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal
 -excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/security-medium-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/help-faq-symbolic.svg /usr/share/icons/Adwaita/scalable/status/security-medium-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/format-text-
 rich-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-no-route-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/document-revert-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system
 -sharing-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwait
 a/scalable/actions/application-exit-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-multitasking-symbolic.svg /usr/share/icons/Adwaita/16x16/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-low-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-screensaver-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/system-log-out-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/legacy/goa-panel-s
 ymbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/accessories-text-editor-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-system-notifications-symbolic.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-list-symbolic-rtl.symbolic
 .png /usr/share/icons/Adwaita/24x24/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/power-profile-performance-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-wallpaper-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/system-users-symbolic.svg /usr/share/icons/Adwaita/24x24/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Ad
 waita/16x16/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-high-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-system-parental-controls-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/mail-forward-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-time-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-transmit-symbolic-rtl.symbolic.png /usr/sh
 are/icons/Adwaita/24x24/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/multimedia-volume-control-symbolic.svg /usr/share/icons/Adwaita/16x16/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/web-browser-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icon
 s/Adwaita/16x16/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/utilities-terminal-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/actions/view-paged-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/system-log-out-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/gnome-power-manager-symbolic.svg /usr/share/icons/Adwaita/scalable/device
 s/audio-speakers-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/format-text-rich-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display-symbolic.symbolic.pn
 g /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/system-switch-user-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/actions/format-text-direction-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/format-indent-less-rtl
 -symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-offline-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/acc
 essories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-font-symbolic.svg"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGV changed from 41.0 [default] to 42.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGSIZE changed from 1004609 to 1101599 (+10%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PV changed from "41.0" to "42.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: FILELIST: removed "/usr/share/icons/Adwaita/24x24/legacy/go-down.png /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/22x22/legacy/network-idle.png /usr/share/icons/Adwaita/22x22/legacy/camera-photo.png /usr/share/icons/Adwaita/22x22/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/32x32/legacy/help-about.png /usr/share/icons/Adwaita/32x32/legacy/edit-cut.png /usr/share/icons/Adwaita/24x24/legacy/document-open-recent.png /usr/share/icons/Adwaita/24x24/legacy/go-home.png /usr/share/icons/Adwaita/24x24/legacy/network-transmit.png /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map.png /usr/share/icons/Adwaita/24x24/legacy/mail-reply-all.png /usr/share/icons/Adwaita/48x48/legacy/insert-image.png /usr/share/icons/Adwaita/24x24/legacy/security-medium.png /usr/share/icons/Adwaita/16x16/legacy/face-surprise.png /usr/share/icons/Adwaita/16x16/legacy/format-text-strikethr
 ough.png /usr/share/icons/Adwaita/16x16/legacy/mail-signed-verified.png /usr/share/icons/Adwaita/32x32/legacy/document-open-recent.png /usr/share/icons/Adwaita/22x22/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/48x48/legacy/face-sad.png /usr/share/icons/Adwaita/22x22/legacy/emblem-urgent.png /usr/share/icons/Adwaita/24x24/legacy/view-restore.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/16x16/legacy/face-sad.png /usr/share/icons/Adwaita/22x22/legacy/emblem-favorite.png /usr/share/icons/Adwaita/32x32/legacy/face-devilish.png /usr/share/icons/Adwaita/48x48/legacy/applications-games.png /usr/share/icons/Adwaita/22x22/legacy/face-glasses.png /usr/share/icons/Adwaita/22x22/legacy/application-exit.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/22x22/legacy/network-receive.png /usr/share/icons/Adwaita/32x32/legacy/emblem-generic.png /usr/share/icons/Adwaita/48
 x48/legacy/go-previous.png /usr/share/icons/Adwaita/48x48/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/22x22/legacy/system-shutdown.png /usr/share/icons/Adwaita/24x24/legacy/emblem-web.png /usr/share/icons/Adwaita/22x22/legacy/media-eject.png /usr/share/icons/Adwaita/24x24/legacy/object-rotate-right.png /usr/share/icons/Adwaita/48x48/legacy/camera-web.png /usr/share/icons/Adwaita/48x48/legacy/system-users.png /usr/share/icons/Adwaita/22x22/legacy/system-software-update.png /usr/share/icons/Adwaita/48x48/legacy/emblem-mail.png /usr/share/icons/Adwaita/32x32/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/48x48/legacy/network-idle.png /usr/share/icons/Adwaita/32x32/legacy/dialog-warning.png /usr/share/icons/Adwaita/48x48/legacy/appointment-soon.png /usr/share/icons/Adwaita/32x32/legacy/edit-clear-all.png /usr/share/icons/Adwaita/16x16/legacy/edit-clear-all.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/24x24/legacy/system-run.p
 ng /usr/share/icons/Adwaita/32x32/legacy/network-transmit.png /usr/share/icons/Adwaita/32x32/legacy/appointment-missed.png /usr/share/icons/Adwaita/22x22/legacy/pda.png /usr/share/icons/Adwaita/16x16/legacy/camera-web.png /usr/share/icons/Adwaita/24x24/legacy/emblem-package.png /usr/share/icons/Adwaita/16x16/legacy/user-idle.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/48x48/legacy/help-contents.png /usr/share/icons/Adwaita/22x22/legacy/face-smirk.png /usr/share/icons/Adwaita/24x24/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/22x22/legacy/list-remove.png /usr/share/icons/Adwaita/16x16/legacy/go-home.png /usr/share/icons/Adwaita/32x32/legacy/applications-engineering.png /usr/share/icons/Adwaita/24x24/legacy/task-due.png /usr/share/icons/Adwaita/16x16/legacy/system-software-update.png /usr/share/icons/Adwaita/22x22/legacy/mail-signed.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-junk.png /usr/share/icons
 /Adwaita/32x32/legacy/camera-web.png /usr/share/icons/Adwaita/48x48/legacy/task-due.png /usr/share/icons/Adwaita/32x32/legacy/face-smirk.png /usr/share/icons/Adwaita/24x24/legacy/face-wink.png /usr/share/icons/Adwaita/48x48/legacy/media-playback-start.png /usr/share/icons/Adwaita/22x22/legacy/face-crying.png /usr/share/icons/Adwaita/22x22/legacy/edit-find-replace.png /usr/share/icons/Adwaita/48x48/legacy/emblem-downloads.png /usr/share/icons/Adwaita/16x16/legacy/applications-office.png /usr/share/icons/Adwaita/22x22/legacy/appointment-missed.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/32x32/legacy/edit-find-replace.png /usr/share/icons/Adwaita/16x16/legacy/go-last-rtl.png /usr/share/icons/Adwaita/22x22/legacy/insert-image.png /usr/share/icons/Adwaita/16x16/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/22x22/legacy/view-fullscreen.png /usr/share/icons/Adwaita/32x32/legacy/document-save.png /usr/share/icons/Adwaita/24x24/legacy
 /document-save.png /usr/share/icons/Adwaita/22x22/legacy/format-text-bold.png /usr/share/icons/Adwaita/24x24/legacy/user-idle.png /usr/share/icons/Adwaita/16x16/legacy/security-medium.png /usr/share/icons/Adwaita/22x22/legacy/drive-multidisk.png /usr/share/icons/Adwaita/24x24/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/24x24/legacy/pda.png /usr/share/icons/Adwaita/48x48/legacy/battery-full-charged.png /usr/share/icons/Adwaita/24x24/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/16x16/legacy/battery-full.png /usr/share/icons/Adwaita/16x16/legacy/help-about.png /usr/share/icons/Adwaita/24x24/legacy/image-missing.png /usr/share/icons/Adwaita/32x32/legacy/security-low.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-right.png /usr/share/icons/Adwaita/32x32/legacy/mail-unread.png /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal.png /usr/share/icons/Adwaita/22x22/legacy/face-smile.png /usr/share/icons/Adwaita/32x32/legacy/network-error.png
  /usr/share/icons/Adwaita/48x48/legacy/list-add.png /usr/share/icons/Adwaita/22x22/legacy/edit-clear.png /usr/share/icons/Adwaita/48x48/legacy/face-raspberry.png /usr/share/icons/Adwaita/32x32/legacy/dialog-password.png /usr/share/icons/Adwaita/24x24/legacy/format-text-bold.png /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-rtl.png /usr/share/icons/Adwaita/32x32/legacy/view-refresh.png /usr/share/icons/Adwaita/16x16/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/22x22/legacy/media-playback-stop.png /usr/share/icons/Adwaita/22x22/legacy/user-invisible.png /usr/share/icons/Adwaita/24x24/legacy/media-eject.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/16x16/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/24x24/legacy/face-crying.png /usr/share/icons/Adwaita/48x48/legacy/mail-forward.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desk
 top-wallpaper.png /usr/share/icons/Adwaita/16x16/legacy/face-crying.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system.png /usr/share/icons/Adwaita/22x22/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/32x32/legacy/document-revert.png /usr/share/icons/Adwaita/22x22/legacy/preferences-other.png /usr/share/icons/Adwaita/48x48/legacy/media-flash.png /usr/share/icons/Adwaita/24x24/legacy/window-new.png /usr/share/icons/Adwaita/24x24/legacy/insert-text.png /usr/share/icons/Adwaita/48x48/legacy/network-vpn.png /usr/share/icons/Adwaita/32x32/legacy/user-invisible.png /usr/share/icons/Adwaita/24x24/legacy/computer.png /usr/share/icons/Adwaita/16x16/legacy/ebook-reader.png /usr/share/icons/Adwaita/48x48/legacy/trophy-bronze.png /usr/share/icons/Adwaita/48x48/legacy/system-run.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/32x32/legacy/battery-low-charging.png /usr/share/icons/Adwaita/32x32/legacy/face-angel.png /usr/
 share/icons/Adwaita/16x16/legacy/dialog-information.png /usr/share/icons/Adwaita/32x32/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/22x22/legacy/help-about.png /usr/share/icons/Adwaita/48x48/legacy/call-start.png /usr/share/icons/Adwaita/48x48/legacy/window-close.png /usr/share/icons/Adwaita/24x24/legacy/mail-signed.png /usr/share/icons/Adwaita/16x16/legacy/user-offline.png /usr/share/icons/Adwaita/48x48/legacy/view-restore.png /usr/share/icons/Adwaita/24x24/legacy/software-update-available.png /usr/share/icons/Adwaita/32x32/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/24x24/legacy/emblem-documents.png /usr/share/icons/Adwaita/22x22/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/16x16/legacy/battery-full-charging.png /usr/share/icons/Adwaita/32x32/legacy/go-last.png /usr/share/icons/Adwaita/22x22/legacy/emblem-documents.png /usr/share/icons/Adwaita/24x24/legacy/docum
 ent-open.png /usr/share/icons/Adwaita/32x32/legacy/battery-empty.png /usr/share/icons/Adwaita/22x22/legacy/user-available.png /usr/share/icons/Adwaita/24x24/legacy/face-angry.png /usr/share/icons/Adwaita/32x32/legacy/go-first.png /usr/share/icons/Adwaita/24x24/legacy/battery-good-charging.png /usr/share/icons/Adwaita/16x16/legacy/emblem-generic.png /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/48x48/legacy/help-about.png /usr/share/icons/Adwaita/48x48/legacy/applications-internet.png /usr/share/icons/Adwaita/22x22/legacy/drive-optical.png /usr/share/icons/Adwaita/22x22/legacy/emblem-system.png /usr/share/icons/Adwaita/32x32/legacy/go-up.png /usr/share/icons/Adwaita/48x48/legacy/applications-science.png /usr/share/icons/Adwaita/22x22/legacy/user-idle.png /usr/share/icons/Adwaita/24x24/legacy/face-surprise.png /usr/share/icons/Adwaita/48x48/legacy/face-angry.png /usr/share/icons/Adwaita/22x22/legacy/battery-good-charging.png /usr/share/i
 cons/Adwaita/32x32/legacy/view-restore.png /usr/share/icons/Adwaita/22x22/legacy/ac-adapter.png /usr/share/icons/Adwaita/32x32/legacy/face-angry.png /usr/share/icons/Adwaita/32x32/legacy/applications-science.png /usr/share/icons/Adwaita/24x24/legacy/multimedia-player.png /usr/share/icons/Adwaita/48x48/legacy/bookmark-new.png /usr/share/icons/Adwaita/16x16/legacy/face-devilish.png /usr/share/icons/Adwaita/24x24/legacy/contact-new.png /usr/share/icons/Adwaita/48x48/legacy/media-playback-pause.png /usr/share/icons/Adwaita/24x24/legacy/edit-select-all.png /usr/share/icons/Adwaita/32x32/legacy/media-floppy.png /usr/share/icons/Adwaita/16x16/legacy/network-receive.png /usr/share/icons/Adwaita/22x22/legacy/user-info.png /usr/share/icons/Adwaita/22x22/legacy/mail-replied.png /usr/share/icons/Adwaita/32x32/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/22x22/legacy/video-display.png /usr/share/icons/Adwaita/16x16/legacy/emblem-documents.png /usr/share/icons/Adwaita/24x24/legacy/go-
 jump.png /usr/share/icons/Adwaita/48x48/legacy/system-software-update.png /usr/share/icons/Adwaita/48x48/legacy/document-open.png /usr/share/icons/Adwaita/22x22/legacy/emblem-mail.png /usr/share/icons/Adwaita/24x24/legacy/appointment-soon.png /usr/share/icons/Adwaita/32x32/legacy/trophy-gold.png /usr/share/icons/Adwaita/48x48/legacy/media-floppy.png /usr/share/icons/Adwaita/16x16/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/16x16/legacy/appointment-new.png /usr/share/icons/Adwaita/48x48/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/32x32/legacy/view-fullscreen.png /usr/share/icons/Adwaita/32x32/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/22x22/legacy/software-update-available.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/48x48/legacy/battery-good.png /usr/share/icons/Adwaita/22x22/legacy/security-low.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop.png /usr/share/icon
 s/Adwaita/22x22/legacy/zoom-in.png /usr/share/icons/Adwaita/24x24/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/32x32/legacy/battery-low.png /usr/share/icons/Adwaita/48x48/legacy/object-rotate-left.png /usr/share/icons/Adwaita/16x16/legacy/face-laugh.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-high.png /usr/share/icons/Adwaita/22x22/legacy/battery-low-charging.png /usr/share/icons/Adwaita/32x32/legacy/printer-error.png /usr/share/icons/Adwaita/32x32/legacy/scanner.png /usr/share/icons/Adwaita/32x32/legacy/face-uncertain.png /usr/share/icons/Adwaita/24x24/legacy/document-send.png /usr/share/icons/Adwaita/32x32/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/48x48/legacy/mark-location.png /usr/share/icons/Adwaita/16x16/legacy/face-angry.png /usr/share/icons/Adwaita/22x22/legacy/multimedia-player.png /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map.png /usr/share/icons/Adwaita/16x16/legacy/dialog-warning.png /usr/share/icons/Adwaita/3
 2x32/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/32x32/legacy/multimedia-player.png /usr/share/icons/Adwaita/48x48/legacy/user-busy.png /usr/share/icons/Adwaita/16x16/legacy/battery-empty.png /usr/share/icons/Adwaita/24x24/legacy/applications-system.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/16x16/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/16x16/legacy/mail-message-new.png /usr/share/icons/Adwaita/16x16/legacy/pda.png /usr/share/icons/Adwaita/48x48/legacy/edit-paste.png /usr/share/icons/Adwaita/48x48/legacy/system-help.png /usr/share/icons/Adwaita/22x22/legacy/face-cool.png /usr/share/icons/Adwaita/22x22/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/48x48/legacy/input-keyboard.png /usr/share/icons/Adwaita/32x32/legacy/camera-photo.png /usr/share/icons/Adwaita/22x22/legacy/document-new.png /usr/share/icons/Adwaita/32x32/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/16x16/lega
 cy/format-justify-left.png /usr/share/icons/Adwaita/48x48/legacy/document-open-recent.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/16x16/legacy/changes-allow.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-important.png /usr/share/icons/Adwaita/48x48/legacy/phone.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/48x48/legacy/applications-office.png /usr/share/icons/Adwaita/24x24/legacy/go-up.png /usr/share/icons/Adwaita/22x22/legacy/document-save.png /usr/share/icons/Adwaita/32x32/legacy/help-contents.png /usr/share/icons/Adwaita/22x22/legacy/printer-printing.png /usr/share/icons/Adwaita/24x24/legacy/media-tape.png /usr/share/icons/Adwaita/48x48/legacy/input-dialpad.png /usr/share/icons/Adwaita/32x32/legacy/audio-speakers.png /usr/share/icons/Adwaita/16x16/legacy/task-past-due.png /usr/share/icons/Adwaita/32x32/legacy/battery-good-charging.png /usr/share/icons/Adwaita/48x48/legacy/mic
 rophone-sensitivity-low.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/16x16/legacy/accessories-character-map.png /usr/share/icons/Adwaita/24x24/legacy/dialog-password.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/24x24/legacy/help-faq.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/48x48/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/16x16/legacy/emblem-urgent.png /usr/share/icons/Adwaita/24x24/legacy/battery-caution.png /usr/share/icons/Adwaita/16x16/legacy/network-wireless.png /usr/share/icons/Adwaita/24x24/legacy/battery-full-charging.png /usr/share/icons/Adwaita/32x32/legacy/battery-missing.png /usr/share/icons/Adwaita/32x32/legacy/changes-prevent.png /usr/share/icons/Adwaita/48x48/legacy/ebook-reader.png /usr/share/icons/Adwaita/22x22/legacy/format-justify-right.png /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary.png
  /usr/share/icons/Adwaita/22x22/legacy/input-tablet.png /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal.png /usr/share/icons/Adwaita/22x22/legacy/face-worried.png /usr/share/icons/Adwaita/48x48/legacy/edit-cut.png /usr/share/icons/Adwaita/22x22/legacy/media-playback-pause.png /usr/share/icons/Adwaita/24x24/legacy/document-print-preview.png /usr/share/icons/Adwaita/32x32/legacy/emblem-package.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/24x24/legacy/face-smile-big.png /usr/share/icons/Adwaita/48x48/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/48x48/legacy/go-last-rtl.png /usr/share/icons/Adwaita/24x24/legacy/address-book-new.png /usr/share/icons/Adwaita/16x16/legacy/emblem-mail.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/32x32/legacy/media-playback-stop.png /usr/share/icons/Adwaita/24x24/legacy/sta
 rred.png /usr/share/icons/Adwaita/48x48/legacy/media-seek-forward.png /usr/share/icons/Adwaita/24x24/legacy/face-tired.png /usr/share/icons/Adwaita/24x24/legacy/audio-card.png /usr/share/icons/Adwaita/32x32/legacy/call-stop.png /usr/share/icons/Adwaita/48x48/legacy/document-save.png /usr/share/icons/Adwaita/16x16/legacy/face-kiss.png /usr/share/icons/Adwaita/32x32/legacy/system-lock-screen.png /usr/share/icons/Adwaita/16x16/legacy/web-browser.png /usr/share/icons/Adwaita/24x24/legacy/applications-internet.png /usr/share/icons/Adwaita/24x24/legacy/user-offline.png /usr/share/icons/Adwaita/24x24/legacy/appointment-new.png /usr/share/icons/Adwaita/24x24/legacy/go-previous.png /usr/share/icons/Adwaita/48x48/legacy/face-devilish.png /usr/share/icons/Adwaita/16x16/legacy/applications-science.png /usr/share/icons/Adwaita/24x24/legacy/emblem-system.png /usr/share/icons/Adwaita/16x16/legacy/applications-accessories.png /usr/share/icons/Adwaita/16x16/legacy/user-info.png /usr/share/icons/Adwa
 ita/48x48/legacy/task-past-due.png /usr/share/icons/Adwaita/32x32/legacy/face-surprise.png /usr/share/icons/Adwaita/22x22/legacy/document-print.png /usr/share/icons/Adwaita/32x32/legacy/object-rotate-left.png /usr/share/icons/Adwaita/16x16/legacy/emblem-system.png /usr/share/icons/Adwaita/16x16/legacy/insert-link.png /usr/share/icons/Adwaita/24x24/legacy/trophy-gold.png /usr/share/icons/Adwaita/22x22/legacy/emote-love.png /usr/share/icons/Adwaita/24x24/legacy/media-seek-forward.png /usr/share/icons/Adwaita/22x22/legacy/edit-redo.png /usr/share/icons/Adwaita/48x48/legacy/emblem-default.png /usr/share/icons/Adwaita/22x22/legacy/address-book-new.png /usr/share/icons/Adwaita/48x48/legacy/document-send.png /usr/share/icons/Adwaita/22x22/legacy/go-next-rtl.png /usr/share/icons/Adwaita/32x32/legacy/input-dialpad.png /usr/share/icons/Adwaita/16x16/legacy/system-run.png /usr/share/icons/Adwaita/16x16/legacy/mail-reply-all.png /usr/share/icons/Adwaita/22x22/legacy/network-vpn.png /usr/share/i
 cons/Adwaita/22x22/legacy/go-previous.png /usr/share/icons/Adwaita/22x22/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/32x32/legacy/security-high.png /usr/share/icons/Adwaita/22x22/legacy/battery-caution.png /usr/share/icons/Adwaita/16x16/legacy/window-new.png /usr/share/icons/Adwaita/32x32/legacy/go-jump.png /usr/share/icons/Adwaita/32x32/legacy/insert-object.png /usr/share/icons/Adwaita/48x48/legacy/multimedia-player.png /usr/share/icons/Adwaita/22x22/legacy/go-up.png /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/22x22/legacy/system-help.png /usr/share/icons/Adwaita/48x48/legacy/software-update-urgent.png /usr/share/icons/Adwaita/32x32/legacy/task-due.png /usr/share/icons/Adwaita/32x32/legacy/face-smile-big.png /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/24x24/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/24x24/legacy/battery-empty.png /usr/share/icons/Adwaita/24x24/l
 egacy/user-away.png /usr/share/icons/Adwaita/48x48/legacy/emblem-new.png /usr/share/icons/Adwaita/48x48/legacy/emblem-favorite.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-read.png /usr/share/icons/Adwaita/32x32/legacy/zoom-in.png /usr/share/icons/Adwaita/24x24/legacy/help-browser.png /usr/share/icons/Adwaita/22x22/legacy/emblem-downloads.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/24x24/legacy/emblem-important.png /usr/share/icons/Adwaita/24x24/legacy/system-search.png /usr/share/icons/Adwaita/24x24/legacy/battery-full-charged.png /usr/share/icons/Adwaita/24x24/legacy/face-glasses.png /usr/share/icons/Adwaita/24x24/legacy/network-wired.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/16x16/legacy/phone.png /usr/share/icons/Adwaita/48x48/legacy/ins
 ert-link.png /usr/share/icons/Adwaita/48x48/legacy/mail-message-new.png /usr/share/icons/Adwaita/32x32/legacy/folder-new.png /usr/share/icons/Adwaita/32x32/legacy/printer-printing.png /usr/share/icons/Adwaita/32x32/legacy/emblem-favorite.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search.png /usr/share/icons/Adwaita/16x16/legacy/view-refresh.png /usr/share/icons/Adwaita/22x22/legacy/mail-forward.png /usr/share/icons/Adwaita/16x16/legacy/trophy-bronze.png /usr/share/icons/Adwaita/22x22/legacy/edit-clear-all.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-network.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/16x16/legacy/media-flash.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/22x22/legacy/system-software-install.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search.png /usr/share/icons/Adwaita/16x16/legacy/process-stop.png /usr/shar
 e/icons/Adwaita/48x48/legacy/emblem-urgent.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/16x16/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/48x48/legacy/applications-engineering.png /usr/share/icons/Adwaita/32x32/legacy/task-past-due.png /usr/share/icons/Adwaita/24x24/legacy/media-record.png /usr/share/icons/Adwaita/24x24/legacy/format-indent-more.png /usr/share/icons/Adwaita/32x32/legacy/face-embarrassed.png /usr/share/icons/Adwaita/32x32/legacy/security-medium.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-fill.png /usr/share/icons/Adwaita/48x48/legacy/non-starred.png /usr/share/icons/Adwaita/32x32/legacy/system-users.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/32x32/legacy/face-kiss.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/48x48/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/32x32/legacy/
 list-remove.png /usr/share/icons/Adwaita/24x24/legacy/input-mouse.png /usr/share/icons/Adwaita/16x16/legacy/go-jump.png /usr/share/icons/Adwaita/24x24/legacy/edit-undo.png /usr/share/icons/Adwaita/16x16/legacy/applications-system.png /usr/share/icons/Adwaita/24x24/legacy/system-shutdown.png /usr/share/icons/Adwaita/32x32/legacy/emblem-default.png /usr/share/icons/Adwaita/22x22/legacy/network-wireless.png /usr/share/icons/Adwaita/16x16/legacy/face-smirk.png /usr/share/icons/Adwaita/48x48/legacy/computer.png /usr/share/icons/Adwaita/16x16/legacy/call-stop.png /usr/share/icons/Adwaita/48x48/legacy/semi-starred.png /usr/share/icons/Adwaita/16x16/legacy/software-update-available.png /usr/share/icons/Adwaita/16x16/legacy/starred.png /usr/share/icons/Adwaita/16x16/legacy/preferences-other.png /usr/share/icons/Adwaita/22x22/legacy/window-new.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/22x22/legacy/face-wink.png /usr/share/icons/Adw
 aita/16x16/legacy/go-first.png /usr/share/icons/Adwaita/32x32/legacy/network-wireless.png /usr/share/icons/Adwaita/22x22/legacy/applications-other.png /usr/share/icons/Adwaita/24x24/legacy/printer-error.png /usr/share/icons/Adwaita/32x32/legacy/zoom-out.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/16x16/legacy/face-cool.png /usr/share/icons/Adwaita/24x24/legacy/emblem-photos.png /usr/share/icons/Adwaita/48x48/legacy/printer-printing.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/24x24/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/48x48/legacy/camera-photo.png /usr/share/icons/Adwaita/22x22/legacy/mail-unread.png /usr/share/icons/Adwaita/22x22/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/22x22/legacy/document-revert.png /usr/share/icons/Adwaita/48x48/legacy/go-jump.png /usr/share/icons/Adwaita/32x32/legacy/face-sick.png /usr/share/icons/Adwaita/24x24/legacy/c
 amera-photo.png /usr/share/icons/Adwaita/48x48/legacy/mail-replied.png /usr/share/icons/Adwaita/22x22/legacy/format-justify-left.png /usr/share/icons/Adwaita/48x48/legacy/preferences-other.png /usr/share/icons/Adwaita/32x32/legacy/list-add.png /usr/share/icons/Adwaita/32x32/legacy/window-new.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-high.png /usr/share/icons/Adwaita/32x32/legacy/face-tired.png /usr/share/icons/Adwaita/16x16/legacy/task-due.png /usr/share/icons/Adwaita/22x22/legacy/document-send.png /usr/share/icons/Adwaita/22x22/legacy/network-error.png /usr/share/icons/Adwaita/24x24/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/24x24/legacy/user-info.png /usr/share/icons/Adwaita/24x24/legacy/dialog-question.png /usr/share/icons/Adwaita/24x24/legacy/zoom-in.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/48x48/legacy/edit-clear.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-theme.png /usr/share/icons/A
 dwaita/48x48/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/48x48/legacy/face-smile.png /usr/share/icons/Adwaita/16x16/legacy/network-wireless-encrypted.png /usr/share/icons/Adwaita/32x32/legacy/applications-development.png /usr/share/icons/Adwaita/24x24/legacy/battery-full.png /usr/share/icons/Adwaita/32x32/legacy/ebook-reader.png /usr/share/icons/Adwaita/24x24/legacy/trophy-bronze.png /usr/share/icons/Adwaita/48x48/legacy/image-missing.png /usr/share/icons/Adwaita/22x22/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/22x22/legacy/applications-engineering.png /usr/share/icons/Adwaita/16x16/legacy/video-display.png /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-center.png /usr/share/icons/Adwaita/16x16/legacy/mail-replied.png /usr/share/icons/Adwaita/48x48/legacy/security-low.png /usr/share/icons/Adwaita/22x22/legacy/software-update-urgent.png /usr/share/icons/Adwaita/22x22/legacy/preferences
 -system-search.png /usr/share/icons/Adwaita/16x16/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/22x22/legacy/input-mouse.png /usr/share/icons/Adwaita/48x48/legacy/face-kiss.png /usr/share/icons/Adwaita/24x24/legacy/battery-missing.png /usr/share/icons/Adwaita/16x16/legacy/applications-internet.png /usr/share/icons/Adwaita/24x24/legacy/input-gaming.png /usr/share/icons/Adwaita/22x22/legacy/battery-missing.png /usr/share/icons/Adwaita/22x22/legacy/face-tired.png /usr/share/icons/Adwaita/22x22/legacy/emblem-photos.png /usr/share/icons/Adwaita/24x24/legacy/input-keyboard.png /usr/share/icons/Adwaita/22x22/legacy/help-contents.png /usr/share/icons/Adwaita/24x24/legacy/face-raspberry.png /usr/share/icons/Adwaita/24x24/legacy/emblem-default.png /usr/share/icons/Adwaita/24x24/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/24x24/legacy/face-laugh.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/16x16/lega
 cy/face-raspberry.png /usr/share/icons/Adwaita/24x24/legacy/network-receive.png /usr/share/icons/Adwaita/24x24/legacy/call-start.png /usr/share/icons/Adwaita/48x48/legacy/appointment-new.png /usr/share/icons/Adwaita/16x16/legacy/document-open.png /usr/share/icons/Adwaita/24x24/legacy/non-starred.png /usr/share/icons/Adwaita/16x16/legacy/input-touchpad.png /usr/share/icons/Adwaita/32x32/legacy/face-laugh.png /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/32x32/legacy/view-sort-descending.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/22x22/legacy/media-skip-forward.png /usr/share/icons/Adwaita/24x24/legacy/call-stop.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/24x24/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/48x48/legacy/process-stop.png /usr/share/icons/Adwaita/22x22/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/22x22/leg
 acy/format-justify-fill.png /usr/share/icons/Adwaita/16x16/legacy/go-bottom.png /usr/share/icons/Adwaita/24x24/legacy/applications-science.png /usr/share/icons/Adwaita/24x24/legacy/process-stop.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-left.png /usr/share/icons/Adwaita/16x16/legacy/battery-good-charging.png /usr/share/icons/Adwaita/16x16/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/32x32/legacy/insert-link.png /usr/share/icons/Adwaita/16x16/legacy/face-angel.png /usr/share/icons/Adwaita/24x24/legacy/format-text-italic.png /usr/share/icons/Adwaita/32x32/legacy/call-start.png /usr/share/icons/Adwaita/32x32/legacy/go-last-rtl.png /usr/share/icons/Adwaita/48x48/legacy/mail-attachment.png /usr/share/icons/Adwaita/22x22/legacy/modem.png /usr/share/icons/Adwaita/32x32/legacy/dialog-error.png /usr/share/icons/Adwaita/16x16/legacy/applications-engineering.png /usr/share/icons/Adwaita/16x16/legacy/format-text-underline.png /usr/share/icons/Adwaita/16x16/legacy/network-
 cellular-connected.png /usr/share/icons/Adwaita/32x32/legacy/help-browser.png /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/16x16/legacy/go-previous.png /usr/share/icons/Adwaita/16x16/legacy/format-text-italic.png /usr/share/icons/Adwaita/16x16/legacy/multimedia-player.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/22x22/legacy/face-uncertain.png /usr/share/icons/Adwaita/32x32/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/16x16/legacy/media-playback-start.png /usr/share/icons/Adwaita/32x32/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/16x16/legacy/document-revert.png /usr/share/icons/Adwaita/48x48/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/32x32/legacy/input-mouse.png /usr/share/icons/Adwaita/22x22/legacy/face-kiss.png /usr/share/icons/Adwaita/32x32/legacy/face-smile.png /usr/share/icons/Adwaita/32x32/legacy/document-print-preview.png /usr/
 share/icons/Adwaita/48x48/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/32x32/legacy/go-previous.png /usr/share/icons/Adwaita/48x48/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/16x16/legacy/software-update-urgent.png /usr/share/icons/Adwaita/22x22/legacy/battery.png /usr/share/icons/Adwaita/32x32/legacy/input-gaming.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/48x48/legacy/media-playback-stop.png /usr/share/icons/Adwaita/22x22/legacy/go-home.png /usr/share/icons/Adwaita/22x22/legacy/folder-visiting.png /usr/share/icons/Adwaita/32x32/legacy/bookmark-new.png /usr/share/icons/Adwaita/16x16/legacy/view-sort-descending.png /usr/share/icons/Adwaita/24x24/legacy/zoom-original.png /usr/share/icons/Adwaita/48x48/legacy/emblem-package.png /usr/share/icons/Adwaita/22x22/legacy/window-close.png /usr/share/icons/Adwaita/24x24/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-
 shortcuts.png /usr/share/icons/Adwaita/48x48/legacy/applications-other.png /usr/share/icons/Adwaita/32x32/legacy/applications-office.png /usr/share/icons/Adwaita/22x22/legacy/format-justify-center.png /usr/share/icons/Adwaita/16x16/legacy/go-down.png /usr/share/icons/Adwaita/16x16/legacy/security-high.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-fill.png /usr/share/icons/Adwaita/24x24/legacy/media-playback-start.png /usr/share/icons/Adwaita/48x48/legacy/emblem-documents.png /usr/share/icons/Adwaita/32x32/legacy/user-idle.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/24x24/legacy/document-print.png /usr/share/icons/Adwaita/32x32/legacy/applications-accessories.png /usr/share/icons/Adwaita/32x32/legacy/go-first-rtl.png /usr/share/icons/Adwaita/24x24/legacy/input-dialpad.png /usr/share/icons/Adwaita/24x24/legacy/edit-find-replace.png /usr/share/icons/Adwaita/24x24/legacy/face-embarrassed.png /usr/share/icons/Adwaita/48x48/l
 egacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/16x16/legacy/battery-low-charging.png /usr/share/icons/Adwaita/22x22/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/48x48/legacy/network-receive.png /usr/share/icons/Adwaita/48x48/legacy/edit-delete.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-left.png /usr/share/icons/Adwaita/24x24/legacy/dialog-warning.png /usr/share/icons/Adwaita/48x48/legacy/go-down.png /usr/share/icons/Adwaita/16x16/legacy/computer-fail.png /usr/share/icons/Adwaita/24x24/legacy/edit-find.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/32x32/legacy/emblem-urgent.png /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/22x22/legacy/applications-development.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-center.png /usr/share/icons/Adwaita/16x16/legacy/emblem-photo
 s.png /usr/share/icons/Adwaita/32x32/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/22x22/legacy/document-page-setup.png /usr/share/icons/Adwaita/24x24/legacy/go-last-rtl.png /usr/share/icons/Adwaita/48x48/legacy/insert-object.png /usr/share/icons/Adwaita/22x22/legacy/network-offline.png /usr/share/icons/Adwaita/32x32/legacy/emblem-new.png /usr/share/icons/Adwaita/22x22/legacy/audio-volume-low.png /usr/share/icons/Adwaita/48x48/legacy/folder-new.png /usr/share/icons/Adwaita/24x24/legacy/audio-speakers.png /usr/share/icons/Adwaita/48x48/legacy/security-high.png /usr/share/icons/Adwaita/22x22/legacy/format-indent-less.png /usr/share/icons/Adwaita/24x24/legacy/face-cool.png /usr/share/icons/Adwaita/16x16/legacy/window-close.png /usr/share/icons/Adwaita/32x32/legacy/edit-delete.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop.png /usr/share/icons/Adwaita/48x48/legacy/emote-love.png /usr/shar
 e/icons/Adwaita/32x32/legacy/trophy-silver.png /usr/share/icons/Adwaita/22x22/legacy/object-rotate-left.png /usr/share/icons/Adwaita/32x32/legacy/media-flash.png /usr/share/icons/Adwaita/16x16/legacy/emblem-default.png /usr/share/icons/Adwaita/22x22/legacy/format-indent-more.png /usr/share/icons/Adwaita/22x22/legacy/face-smile-big.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/16x16/legacy/face-tired.png /usr/share/icons/Adwaita/24x24/legacy/emblem-downloads.png /usr/share/icons/Adwaita/16x16/legacy/go-up.png /usr/share/icons/Adwaita/16x16/legacy/format-justify-fill.png /usr/share/icons/Adwaita/24x24/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/32x32/legacy/format-text-underline.png /usr/share/icons/Adwaita/24x24/legacy/insert-link.png /usr/share/icons/Adwaita/48x48/legacy/emblem-generic.png /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal.png /usr/share/icons/Adwaita/16x16/legacy/edit-redo.png /usr/share/icons/Adwaita/8x8
 /legacy/emblem-default.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network.png /usr/share/icons/Adwaita/24x24/legacy/help-contents.png /usr/share/icons/Adwaita/24x24/legacy/applications-graphics.png /usr/share/icons/Adwaita/16x16/legacy/media-skip-backward.png /usr/share/icons/Adwaita/22x22/legacy/emblem-package.png /usr/share/icons/Adwaita/48x48/legacy/edit-copy.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/22x22/legacy/system-search.png /usr/share/icons/Adwaita/16x16/legacy/object-rotate-left.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/16x16/legacy/media-seek-forward.png /usr/share/icons/Adwaita/32x32/legacy/network-vpn.png /usr/share/icons/Adwaita/24x24/legacy/media-floppy.png /usr/share/icons/Adwaita/16x16/legacy/ac-adapter.png /usr/share/icons/Adwaita/48x48/legacy/user-available.png /usr/share/icons/A
 dwaita/32x32/legacy/appointment-soon.png /usr/share/icons/Adwaita/32x32/legacy/system-software-install.png /usr/share/icons/Adwaita/16x16/legacy/mark-location.png /usr/share/icons/Adwaita/24x24/legacy/battery.png /usr/share/icons/Adwaita/32x32/legacy/edit-redo.png /usr/share/icons/Adwaita/16x16/legacy/face-uncertain.png /usr/share/icons/Adwaita/48x48/legacy/go-up.png /usr/share/icons/Adwaita/22x22/legacy/face-laugh.png /usr/share/icons/Adwaita/22x22/legacy/mark-location.png /usr/share/icons/Adwaita/16x16/legacy/media-seek-backward.png /usr/share/icons/Adwaita/22x22/legacy/changes-allow.png /usr/share/icons/Adwaita/48x48/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/22x22/legacy/dialog-warning.png /usr/share/icons/Adwaita/48x48/legacy/face-cool.png /usr/share/icons/Adwaita/48x48/legacy/view-sort-descending.png /usr/share/icons/Adwaita/48x48/legacy/system-file-manager.png /usr/share/icons/Adwaita/16x16/legacy/emblem-new.png /usr/share/icons/Adwaita/24x24/legacy/emblem-new.pn
 g /usr/share/icons/Adwaita/22x22/legacy/scanner.png /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/24x24/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/16x16/legacy/media-record.png /usr/share/icons/Adwaita/32x32/legacy/applications-internet.png /usr/share/icons/Adwaita/22x22/legacy/applications-graphics.png /usr/share/icons/Adwaita/24x24/legacy/media-flash.png /usr/share/icons/Adwaita/22x22/legacy/battery-empty.png /usr/share/icons/Adwaita/16x16/legacy/insert-text.png /usr/share/icons/Adwaita/48x48/legacy/view-refresh.png /usr/share/icons/Adwaita/22x22/legacy/object-rotate-right.png /usr/share/icons/Adwaita/22x22/legacy/go-last.png /usr/share/icons/Adwaita/32x32/legacy/face-monkey.png /usr/share/icons/Adwaita/48x48/legacy/computer-fail.png /usr/share/icons/Adwaita/22x22/legacy/edit-paste.png /usr/share/icons/Adwaita/32x32/legacy/go-home.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-important.png /usr/share/icons/Adwaita/
 48x48/legacy/format-text-bold.png /usr/share/icons/Adwaita/16x16/legacy/list-remove.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/16x16/legacy/edit-cut.png /usr/share/icons/Adwaita/32x32/legacy/emblem-system.png /usr/share/icons/Adwaita/16x16/legacy/trophy-gold.png /usr/share/icons/Adwaita/22x22/legacy/trophy-silver.png /usr/share/icons/Adwaita/24x24/legacy/media-skip-backward.png /usr/share/icons/Adwaita/32x32/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/22x22/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/48x48/legacy/drive-optical.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/32x32/legacy/emblem-downloads.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-less.png /usr/share/icons/Adwaita/16x16/
 legacy/document-save-as.png /usr/share/icons/Adwaita/22x22/legacy/applications-science.png /usr/share/icons/Adwaita/22x22/legacy/format-text-underline.png /usr/share/icons/Adwaita/48x48/legacy/scanner.png /usr/share/icons/Adwaita/32x32/legacy/mail-send-receive.png /usr/share/icons/Adwaita/22x22/legacy/insert-object.png /usr/share/icons/Adwaita/32x32/legacy/document-page-setup.png /usr/share/icons/Adwaita/48x48/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/32x32/legacy/video-display.png /usr/share/icons/Adwaita/32x32/legacy/applications-system.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/24x24/legacy/face-sick.png /usr/share/icons/Adwaita/48x48/legacy/pda.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-left.png /usr/share/icons/Adwaita/48x48/legacy/trophy-silver.png /usr/share/icons/Adwaita/22x22/legacy/battery-full-charged.png /usr/share/icons/Adwaita/8x8/legacy/emblem-synchronizing.png /usr/share/icons/Adw
 aita/48x48/legacy/starred.png /usr/share/icons/Adwaita/32x32/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/48x48/legacy/dialog-information.png /usr/share/icons/Adwaita/24x24/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/48x48/legacy/edit-select-all.png /usr/share/icons/Adwaita/32x32/legacy/modem.png /usr/share/icons/Adwaita/48x48/legacy/input-tablet.png /usr/share/icons/Adwaita/16x16/legacy/view-restore.png /usr/share/icons/Adwaita/22x22/legacy/ebook-reader.png /usr/share/icons/Adwaita/16x16/legacy/computer.png /usr/share/icons/Adwaita/32x32/legacy/input-tablet.png /usr/share/icons/Adwaita/24x24/legacy/insert-image.png /usr/share/icons/Adwaita/48x48/legacy/view-fullscreen.png /usr/share/icons/Adwaita/48x48/legacy/help-faq.png /usr/share/icons/Adwaita/24x24/legacy/help-about.png /usr/share/icons/Adwaita/22x22/legacy/mail-read.png /usr/share/icons/Adwaita/16x16/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/24x24/legacy/mail-attachment.png /usr/share/icons/Adw
 aita/48x48/legacy/mail-send-receive.png /usr/share/icons/Adwaita/22x22/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/22x22/legacy/input-gaming.png /usr/share/icons/Adwaita/48x48/legacy/application-exit.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/16x16/legacy/view-fullscreen.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/48x48/legacy/dialog-warning.png /usr/share/icons/Adwaita/48x48/legacy/go-first.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/32x32/legacy/appointment-new.png /usr/share/icons/Adwaita/16x16/legacy/format-justify-right.png /usr/share/icons/Adwaita/16x16/legacy/system-lock-screen.png /usr/share/icons/Adwaita/24x24/legacy/edit-cut.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop.png /usr/share/icons/Adwaita/48x48/lega
 cy/edit-find-replace.png /usr/share/icons/Adwaita/32x32/legacy/network-offline.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/48x48/legacy/printer-error.png /usr/share/icons/Adwaita/48x48/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/22x22/legacy/camera-video.png /usr/share/icons/Adwaita/22x22/legacy/call-start.png /usr/share/icons/Adwaita/22x22/legacy/go-first-rtl.png /usr/share/icons/Adwaita/32x32/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/16x16/legacy/user-available.png /usr/share/icons/Adwaita/32x32/legacy/face-wink.png /usr/share/icons/Adwaita/16x16/legacy/object-rotate-right.png /usr/share/icons/Adwaita/22x22/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/22x22/legacy/network-wireless-encrypted.png /usr/share/icons/Adwaita/48x48/legacy/zoom-in.png /usr/share/icons/Adwaita/48x48/legacy/emblem-desktop.png /usr/shar
 e/icons/Adwaita/22x22/legacy/appointment-new.png /usr/share/icons/Adwaita/24x24/legacy/user-invisible.png /usr/share/icons/Adwaita/24x24/legacy/applications-accessories.png /usr/share/icons/Adwaita/32x32/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/24x24/legacy/emblem-mail.png /usr/share/icons/Adwaita/16x16/legacy/emblem-web.png /usr/share/icons/Adwaita/22x22/legacy/media-skip-backward.png /usr/share/icons/Adwaita/32x32/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/48x48/legacy/input-gaming.png /usr/share/icons/Adwaita/22x22/legacy/applications-office.png /usr/share/icons/Adwaita/32x32/legacy/user-offline.png /usr/share/icons/Adwaita/32x32/legacy/network-idle.png /usr/share/icons/Adwaita/48x48/legacy/applications-accessories.png /usr/share/icons/Adwaita/22x22/legacy/computer-fail.png /usr/share/icons/Adwaita/24x24/legacy/face-worried.png /usr/share/icons/Adwaita/22x22/legacy/face-sick.png /usr/share
 /icons/Adwaita/22x22/legacy/edit-cut.png /usr/share/icons/Adwaita/22x22/legacy/battery-low.png /usr/share/icons/Adwaita/16x16/legacy/camera-video.png /usr/share/icons/Adwaita/32x32/legacy/mail-message-new.png /usr/share/icons/Adwaita/22x22/legacy/semi-starred.png /usr/share/icons/Adwaita/48x48/legacy/emblem-photos.png /usr/share/icons/Adwaita/22x22/legacy/contact-new.png /usr/share/icons/Adwaita/22x22/legacy/audio-speakers.png /usr/share/icons/Adwaita/32x32/legacy/media-record.png /usr/share/icons/Adwaita/22x22/legacy/go-next.png /usr/share/icons/Adwaita/22x22/legacy/zoom-original.png /usr/share/icons/Adwaita/24x24/legacy/computer-fail.png /usr/share/icons/Adwaita/32x32/legacy/document-open.png /usr/share/icons/Adwaita/48x48/legacy/system-log-out.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-more.png /usr/share/icons/Adwaita/22x22/legacy/applications-system.png /usr/share/icons/Adwaita/48x48/legacy/go-first-rtl.png /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivi
 ty-low.png /usr/share/icons/Adwaita/24x24/legacy/emblem-urgent.png /usr/share/icons/Adwaita/48x48/legacy/battery.png /usr/share/icons/Adwaita/24x24/legacy/face-smile.png /usr/share/icons/Adwaita/24x24/legacy/document-properties.png /usr/share/icons/Adwaita/32x32/legacy/document-print.png /usr/share/icons/Adwaita/16x16/legacy/help-contents.png /usr/share/icons/Adwaita/24x24/legacy/system-lock-screen.png /usr/share/icons/Adwaita/22x22/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/22x22/legacy/view-refresh.png /usr/share/icons/Adwaita/48x48/legacy/appointment-missed.png /usr/share/icons/Adwaita/32x32/legacy/media-skip-forward.png /usr/share/icons/Adwaita/16x16/legacy/face-embarrassed.png /usr/share/icons/Adwaita/32x32/legacy/software-update-urgent.png /usr/share/icons/Adwaita/48x48/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/48x48/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/48x48/
 legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/32x32/legacy/input-touchpad.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/22x22/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/48x48/legacy/face-sick.png /usr/share/icons/Adwaita/16x16/legacy/folder-new.png /usr/share/icons/Adwaita/22x22/legacy/document-open.png /usr/share/icons/Adwaita/48x48/legacy/edit-redo.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/22x22/legacy/view-sort-descending.png /usr/share/icons/Adwaita/16x16/legacy/document-page-setup.png /usr/share/icons/Adwaita/22x22/legacy/dialog-password.png /usr/share/icons/Adwaita/16x16/legacy/dialog-error.png /usr/share/icons/Adwaita/32x32/legacy/trophy-bronze.png /usr/share/icons/Adwaita/22x22/legacy/insert-text.png /usr/share/icons/Adwaita/48x48/legacy/system-shutdown.png /usr/share/icons/A
 dwaita/16x16/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/24x24/legacy/list-remove.png /usr/share/icons/Adwaita/32x32/legacy/edit-clear.png /usr/share/icons/Adwaita/32x32/legacy/edit-paste.png /usr/share/icons/Adwaita/24x24/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/24x24/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/24x24/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/22x22/legacy/system-run.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/32x32/legacy/computer.png /usr/share/icons/Adwaita/22x22/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/24x24/legacy/system-file-manager.png /usr/share/icons/Adwaita/22x22/legacy/user-offline.png /usr/share/icons/Adwaita/24x24/legacy/user-available.png /usr/share/icons/Adwaita/24x24/legacy/emblem-generic.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-accessibility.png /usr/share/icons/Ad
 waita/16x16/legacy/edit-delete.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/48x48/legacy/applications-development.png /usr/share/icons/Adwaita/32x32/legacy/starred.png /usr/share/icons/Adwaita/16x16/legacy/network-error.png /usr/share/icons/Adwaita/22x22/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/48x48/legacy/zoom-original.png /usr/share/icons/Adwaita/16x16/legacy/call-start.png /usr/share/icons/Adwaita/32x32/legacy/emblem-web.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/16x16/legacy/tab-new.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/16x16/legacy/format-text-bold.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/16x16/legacy/face-plain.png /usr/share/icons/Adwaita/48x48/legacy/inpu
 t-mouse.png /usr/share/icons/Adwaita/16x16/legacy/document-properties.png /usr/share/icons/Adwaita/48x48/legacy/battery-full-charging.png /usr/share/icons/Adwaita/16x16/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/48x48/legacy/object-rotate-right.png /usr/share/icons/Adwaita/16x16/legacy/user-away.png /usr/share/icons/Adwaita/32x32/legacy/document-properties.png /usr/share/icons/Adwaita/16x16/legacy/battery.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system.png /usr/share/icons/Adwaita/16x16/legacy/emblem-favorite.png /usr/share/icons/Adwaita/16x16/legacy/media-playback-pause.png /usr/share/icons/Adwaita/48x48/legacy/media-eject.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/16x16/legacy/go-last.png /usr/share/icons/Adwaita/16x16/legacy/face-monkey.png /usr/share/icons/Adwaita/32x32/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/48x48/legacy/media-tape.png /usr/share/icons/Adwaita/48x48/legacy/preferences-s
 ystem-sharing.png /usr/share/icons/Adwaita/24x24/legacy/bookmark-new.png /usr/share/icons/Adwaita/22x22/legacy/document-properties.png /usr/share/icons/Adwaita/22x22/legacy/user-busy.png /usr/share/icons/Adwaita/16x16/legacy/audio-speakers.png /usr/share/icons/Adwaita/22x22/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/22x22/legacy/help-faq.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system.png /usr/share/icons/Adwaita/22x22/legacy/document-save-as.png /usr/share/icons/Adwaita/16x16/legacy/input-mouse.png /usr/share/icons/Adwaita/32x32/legacy/phone.png /usr/share/icons/Adwaita/32x32/legacy/camera-video.png /usr/share/icons/Adwaita/48x48/legacy/system-lock-screen.png /usr/share/icons/Adwaita/48x48/legacy/mail-unread.png /usr/share/icons/Adwaita/48x48/legacy/insert-text.png /usr/share/icons/Adwaita/22x22/legacy/document-print-preview.png /usr/share/icons/Adwaita/22x22/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/32x32/legacy/format-text-bold.png 
 /usr/share/icons/Adwaita/22x22/legacy/list-add.png /usr/share/icons/Adwaita/22x22/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/22x22/legacy/go-first.png /usr/share/icons/Adwaita/32x32/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/24x24/legacy/input-tablet.png /usr/share/icons/Adwaita/22x22/legacy/system-file-manager.png /usr/share/icons/Adwaita/22x22/legacy/mail-send-receive.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system.png /usr/share/icons/Adwaita/16x16/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/16x16/legacy/mail-attachment.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/48x48/legacy/face-surprise.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-read.png /usr/share/icons/Adwaita/48x48/legacy/audio-card.png /usr/share/icons/Adwaita/16x16/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/22x22/legacy/media-seek-backward.png /usr/share/icons/Adwaita/32x32/legacy/insert-text.png /usr/sha
 re/icons/Adwaita/22x22/legacy/applications-games.png /usr/share/icons/Adwaita/32x32/legacy/emblem-documents.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-read.png /usr/share/icons/Adwaita/16x16/legacy/semi-starred.png /usr/share/icons/Adwaita/16x16/legacy/dialog-password.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network.png /usr/share/icons/Adwaita/22x22/legacy/applications-utilities.png /usr/share/icons/Adwaita/48x48/legacy/face-smirk.png /usr/share/icons/Adwaita/48x48/legacy/folder-visiting.png /usr/share/icons/Adwaita/24x24/legacy/mail-signed-verified.png /usr/share/icons/Adwaita/48x48/legacy/go-next-rtl.png /usr/share/icons/Adwaita/32x32/legacy/face-cool.png /usr/share/icons/Adwaita/24x24/legacy/document-page-setup.png /usr/share/icons/Adwaita/32x32/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/24x24/legacy/go-last.png /usr/share/icons/Adwaita/24x24/legacy/changes-allow.png /usr/share/icons/Adwaita/24x24/legacy/face-monkey.png /usr/share/i
 cons/Adwaita/48x48/legacy/mail-send.png /usr/share/icons/Adwaita/22x22/legacy/changes-prevent.png /usr/share/icons/Adwaita/24x24/legacy/task-past-due.png /usr/share/icons/Adwaita/16x16/legacy/edit-copy.png /usr/share/icons/Adwaita/48x48/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/32x32/legacy/ac-adapter.png /usr/share/icons/Adwaita/22x22/legacy/starred.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-fill.png /usr/share/icons/Adwaita/32x32/legacy/media-seek-forward.png /usr/share/icons/Adwaita/48x48/legacy/format-text-direction-rtl.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-low.png /usr/share/icons/Adwaita/32x32/legacy/battery-full-charged.png /usr/share/icons/Adwaita/22x22/legacy/emblem-important.png /usr/share/icons/Adwaita/24x24/legacy/application-exit.png /usr/share/icons/Adwaita/48x48/legacy/web-browser.png /usr/share/icons/Adwaita/22x22/legacy/emblem-new.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-high.png /usr/share/
 icons/Adwaita/48x48/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/16x16/legacy/face-smile-big.png /usr/share/icons/Adwaita/16x16/legacy/system-search.png /usr/share/icons/Adwaita/48x48/legacy/face-embarrassed.png /usr/share/icons/Adwaita/32x32/legacy/insert-image.png /usr/share/icons/Adwaita/48x48/legacy/document-print.png /usr/share/icons/Adwaita/22x22/legacy/emblem-web.png /usr/share/icons/Adwaita/24x24/legacy/modem.png /usr/share/icons/Adwaita/32x32/legacy/dialog-question.png /usr/share/icons/Adwaita/32x32/legacy/user-info.png /usr/share/icons/Adwaita/16x16/legacy/emote-love.png /usr/share/icons/Adwaita/32x32/legacy/face-sad.png /usr/share/icons/Adwaita/48x48/legacy/battery-full.png /usr/share/icons/Adwaita/32x32/legacy/applications-other.png /usr/share/icons/Adwaita/24x24/legacy/software-update-urgent.png /usr/share/icons/Adwaita/32x32/legacy/edit-copy.png /usr/share/icons/Adwaita/32x32/legacy/mail-replied.png /usr/share/icons/Adwaita/16x16/legacy/list-add.png /usr/shar
 e/icons/Adwaita/24x24/legacy/preferences-system-network.png /usr/share/icons/Adwaita/22x22/legacy/task-past-due.png /usr/share/icons/Adwaita/32x32/legacy/media-eject.png /usr/share/icons/Adwaita/32x32/legacy/face-plain.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/22x22/legacy/task-due.png /usr/share/icons/Adwaita/48x48/legacy/face-crying.png /usr/share/icons/Adwaita/22x22/legacy/web-browser.png /usr/share/icons/Adwaita/22x22/legacy/document-open-recent.png /usr/share/icons/Adwaita/16x16/legacy/go-next-rtl.png /usr/share/icons/Adwaita/16x16/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/16x16/legacy/zoom-out.png /usr/share/icons/Adwaita/24x24/legacy/ebook-reader.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/24x24/legacy/face-plain.png /usr/share/icons/Adwaita/22x22/legacy/mail-reply-all.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/24x24/lega
 cy/format-indent-less-rtl.png /usr/share/icons/Adwaita/22x22/legacy/user-away.png /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/32x32/legacy/document-send.png /usr/share/icons/Adwaita/16x16/legacy/drive-multidisk.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/16x16/legacy/document-save.png /usr/share/icons/Adwaita/48x48/legacy/modem.png /usr/share/icons/Adwaita/48x48/legacy/format-text-underline.png /usr/share/icons/Adwaita/24x24/legacy/system-software-update.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/32x32/legacy/format-text-direction-rtl.png /usr/share/icons/Adwaita/16x16/legacy/input-tablet.png /usr/share/icons/Adwaita/16x16/legacy/user-busy.png /usr/share/icons/Adwaita/32x32/legacy/preferences-
 system-network.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-right.png /usr/share/icons/Adwaita/32x32/legacy/document-new.png /usr/share/icons/Adwaita/22x22/legacy/face-angel.png /usr/share/icons/Adwaita/48x48/legacy/document-save-as.png /usr/share/icons/Adwaita/24x24/legacy/dialog-error.png /usr/share/icons/Adwaita/48x48/legacy/changes-prevent.png /usr/share/icons/Adwaita/24x24/legacy/camera-video.png /usr/share/icons/Adwaita/16x16/legacy/mail-signed.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/32x32/legacy/user-away.png /usr/share/icons/Adwaita/24x24/legacy/go-first-rtl.png /usr/share/icons/Adwaita/32x32/legacy/folder-visiting.png /usr/share/icons/Adwaita/22x22/legacy/mail-signed-verified.png /usr/share/icons/Adwaita/24x24/legacy/scanner.png /usr/share/icons/Adwaita/48x48/legacy/face-wink.png /usr/share/icons/Adwaita/16x16/legacy/drive-optical.png /usr/share/icons/Adwaita/24x24/legacy/folder-new.png /usr/share/ic
 ons/Adwaita/16x16/legacy/network-idle.png /usr/share/icons/Adwaita/16x16/legacy/system-help.png /usr/share/icons/Adwaita/22x22/legacy/folder-new.png /usr/share/icons/Adwaita/22x22/legacy/dialog-error.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-low.png /usr/share/icons/Adwaita/16x16/legacy/face-wink.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-important.png /usr/share/icons/Adwaita/24x24/legacy/web-browser.png /usr/share/icons/Adwaita/32x32/legacy/battery-good.png /usr/share/icons/Adwaita/16x16/legacy/emblem-package.png /usr/share/icons/Adwaita/16x16/legacy/network-offline.png /usr/share/icons/Adwaita/48x48/legacy/dialog-error.png /usr/share/icons/Adwaita/32x32/legacy/mail-send.png /usr/share/icons/Adwaita/32x32/legacy/accessories-calculator.png /usr/share/icons/Adwaita/48x48/legacy/user-invisible.png /usr/share/icons/Adwaita/22x22/legacy/zoom-out.png /usr/share/icons/Adwaita/32x32/legacy/document-save-as.png /usr/share/icons/Adwaita/22x22/legacy/phone.png /usr/shar
 e/icons/Adwaita/24x24/legacy/face-angel.png /usr/share/icons/Adwaita/32x32/legacy/window-close.png /usr/share/icons/Adwaita/16x16/legacy/applications-other.png /usr/share/icons/Adwaita/32x32/legacy/go-top.png /usr/share/icons/Adwaita/32x32/legacy/system-log-out.png /usr/share/icons/Adwaita/48x48/legacy/ac-adapter.png /usr/share/icons/Adwaita/32x32/legacy/system-help.png /usr/share/icons/Adwaita/32x32/legacy/system-run.png /usr/share/icons/Adwaita/16x16/legacy/media-skip-forward.png /usr/share/icons/Adwaita/22x22/legacy/security-high.png /usr/share/icons/Adwaita/24x24/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/16x16/legacy/media-floppy.png /usr/share/icons/Adwaita/48x48/legacy/drive-multidisk.png /usr/share/icons/Adwaita/32x32/legacy/help-faq.png /usr/share/icons/Adwaita/32x32/legacy/audio-card.png /usr/share/icons/Adwaita/22x22/legacy/system-users.png /usr/share/icons/Adwaita/32x32/legacy/mail-read.png /usr/share/icons/Adwaita/16x16/legacy/appointment-missed.png /us
 r/share/icons/Adwaita/22x22/legacy/process-stop.png /usr/share/icons/Adwaita/24x24/legacy/edit-copy.png /usr/share/icons/Adwaita/32x32/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/16x16/legacy/help-browser.png /usr/share/icons/Adwaita/16x16/legacy/user-invisible.png /usr/share/icons/Adwaita/32x32/legacy/system-software-update.png /usr/share/icons/Adwaita/24x24/legacy/camera-web.png /usr/share/icons/Adwaita/32x32/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-less.png /usr/share/icons/Adwaita/22x22/legacy/bookmark-new.png /usr/share/icons/Adwaita/48x48/legacy/format-text-italic.png /usr/share/icons/Adwaita/48x48/legacy/media-record.png /usr/share/icons/Adwaita/16x16/legacy/camera-photo.png /usr/share/icons/Adwaita/16x16/legacy/input-dialpad.png /usr/share/icons/Adwaita/22x22/legacy/system-log-out.png /usr/share/icons/Adwaita/24x24/legacy/document-save-as.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search.png /usr/share/ico
 ns/Adwaita/22x22/legacy/dialog-question.png /usr/share/icons/Adwaita/48x48/legacy/user-offline.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/32x32/legacy/user-available.png /usr/share/icons/Adwaita/22x22/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/24x24/legacy/video-display.png /usr/share/icons/Adwaita/16x16/legacy/application-exit.png /usr/share/icons/Adwaita/24x24/legacy/semi-starred.png /usr/share/icons/Adwaita/48x48/legacy/contact-new.png /usr/share/icons/Adwaita/32x32/legacy/mail-attachment.png /usr/share/icons/Adwaita/16x16/legacy/mail-unread.png /usr/share/icons/Adwaita/22x22/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/32x32/legacy/media-playback-pause.png /usr/share/icons/Adwaita/24x24/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/22x22/legacy/face-devilish.png /usr/share/icons/Adwaita/22x22/legacy/battery-good.png /usr/share/icons/Adwaita/48x48/legacy/audio-speakers.png /usr/share/icons
 /Adwaita/16x16/legacy/mail-mark-important.png /usr/share/icons/Adwaita/32x32/legacy/face-glasses.png /usr/share/icons/Adwaita/24x24/legacy/face-devilish.png /usr/share/icons/Adwaita/24x24/legacy/drive-optical.png /usr/share/icons/Adwaita/16x16/legacy/media-playback-stop.png /usr/share/icons/Adwaita/24x24/legacy/emblem-favorite.png /usr/share/icons/Adwaita/48x48/legacy/media-skip-forward.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-more.png /usr/share/icons/Adwaita/22x22/legacy/printer-error.png /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/32x32/legacy/mail-reply-all.png /usr/share/icons/Adwaita/22x22/legacy/media-seek-forward.png /usr/share/icons/Adwaita/22x22/legacy/network-wired.png /usr/share/icons/Adwaita/32x32/legacy/preferences-other.png /usr/share/icons/Adwaita/24x24/legacy/network-error.png /usr/share/icons/Adwaita/16x16/legacy/changes-prevent.png /usr/share/icons/Adwaita/32x32/legacy/mail-forward.png /usr/share/icons/A
 dwaita/24x24/legacy/preferences-other.png /usr/share/icons/Adwaita/16x16/legacy/format-justify-center.png /usr/share/icons/Adwaita/24x24/legacy/media-playback-stop.png /usr/share/icons/Adwaita/16x16/legacy/network-wired.png /usr/share/icons/Adwaita/16x16/legacy/system-log-out.png /usr/share/icons/Adwaita/22x22/legacy/emblem-generic.png /usr/share/icons/Adwaita/24x24/legacy/mail-forward.png /usr/share/icons/Adwaita/24x24/legacy/object-rotate-left.png /usr/share/icons/Adwaita/48x48/legacy/user-idle.png /usr/share/icons/Adwaita/32x32/legacy/format-text-italic.png /usr/share/icons/Adwaita/48x48/legacy/document-new.png /usr/share/icons/Adwaita/24x24/legacy/printer-printing.png /usr/share/icons/Adwaita/22x22/legacy/trophy-gold.png /usr/share/icons/Adwaita/24x24/legacy/list-add.png /usr/share/icons/Adwaita/16x16/legacy/network-transmit.png /usr/share/icons/Adwaita/32x32/legacy/pda.png /usr/share/icons/Adwaita/16x16/legacy/edit-paste.png /usr/share/icons/Adwaita/24x24/legacy/user-busy.png /
 usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/48x48/legacy/emblem-web.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/48x48/legacy/network-transmit.png /usr/share/icons/Adwaita/22x22/legacy/media-playback-start.png /usr/share/icons/Adwaita/48x48/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/24x24/legacy/window-close.png /usr/share/icons/Adwaita/22x22/legacy/mail-send.png /usr/share/icons/Adwaita/22x22/legacy/accessories-character-map.png /usr/share/icons/Adwaita/16x16/legacy/printer-error.png /usr/share/icons/Adwaita/48x48/legacy/input-touchpad.png /usr/share/icons/Adwaita/16x16/legacy/format-text-direction-rtl.png /usr/share/icons/Adwaita/22x22/legacy/applications-internet.png /usr/share/icons/Adwaita/16x16/legacy/applications-graphics.png /usr/share/icons/Adwaita/24x24/legacy/tab-new.png /usr/share/icons/Adwaita/24x24/legacy/network-wireless-encrypted.png /usr/share/icons
 /Adwaita/48x48/legacy/applications-system.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/16x16/legacy/face-sick.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-read.png /usr/share/icons/Adwaita/48x48/legacy/applications-utilities.png /usr/share/icons/Adwaita/16x16/legacy/emblem-downloads.png /usr/share/icons/Adwaita/32x32/legacy/applications-games.png /usr/share/icons/Adwaita/22x22/legacy/media-floppy.png /usr/share/icons/Adwaita/24x24/legacy/network-offline.png /usr/share/icons/Adwaita/48x48/legacy/edit-find.png /usr/share/icons/Adwaita/22x22/legacy/media-record.png /usr/share/icons/Adwaita/48x48/legacy/document-print-preview.png /usr/share/icons/Adwaita/32x32/legacy/user-busy.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/24x24/legacy/applications-utilities.png /usr/share/icons/Adwaita/24x24/legacy/format-indent-less.png /usr/share/icons/Adwaita/32x32/legacy/sy
 stem-search.png /usr/share/icons/Adwaita/22x22/legacy/help-browser.png /usr/share/icons/Adwaita/24x24/legacy/drive-multidisk.png /usr/share/icons/Adwaita/48x48/legacy/face-tired.png /usr/share/icons/Adwaita/22x22/legacy/face-raspberry.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-center.png /usr/share/icons/Adwaita/48x48/legacy/dialog-password.png /usr/share/icons/Adwaita/24x24/legacy/zoom-out.png /usr/share/icons/Adwaita/32x32/legacy/drive-optical.png /usr/share/icons/Adwaita/16x16/legacy/battery-full-charged.png /usr/share/icons/Adwaita/24x24/legacy/applications-office.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/24x24/legacy/go-top.png /usr/share/icons/Adwaita/24x24/legacy/view-sort-descending.png /usr/share/icons/Adwaita/22x22/legacy/face-monkey.png /usr/share/icons/Adwaita/32x32/legacy/media-playback-start.png /usr/share/icons/Adwaita/22x22/legacy/go-down.png /usr/share/icons/Adwaita/22x22/legacy/tab-new.png /usr
 /share/icons/Adwaita/16x16/legacy/insert-object.png /usr/share/icons/Adwaita/48x48/legacy/changes-allow.png /usr/share/icons/Adwaita/16x16/legacy/edit-find.png /usr/share/icons/Adwaita/22x22/legacy/edit-undo.png /usr/share/icons/Adwaita/22x22/legacy/network-transmit.png /usr/share/icons/Adwaita/32x32/legacy/object-rotate-right.png /usr/share/icons/Adwaita/32x32/legacy/edit-find.png /usr/share/icons/Adwaita/16x16/legacy/mail-forward.png /usr/share/icons/Adwaita/48x48/legacy/mail-read.png /usr/share/icons/Adwaita/48x48/legacy/call-stop.png /usr/share/icons/Adwaita/16x16/legacy/go-next.png /usr/share/icons/Adwaita/16x16/legacy/help-faq.png /usr/share/icons/Adwaita/48x48/legacy/document-properties.png /usr/share/icons/Adwaita/16x16/legacy/insert-image.png /usr/share/icons/Adwaita/16x16/legacy/system-software-install.png /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/16x16/legacy/trophy-silver.png /usr/share/icons/Adwaita/16x16/legacy/edit-cl
 ear.png /usr/share/icons/Adwaita/24x24/legacy/media-seek-backward.png /usr/share/icons/Adwaita/48x48/legacy/network-wired.png /usr/share/icons/Adwaita/22x22/legacy/call-stop.png /usr/share/icons/Adwaita/24x24/legacy/mail-unread.png /usr/share/icons/Adwaita/32x32/legacy/go-bottom.png /usr/share/icons/Adwaita/22x22/legacy/utilities-terminal.png /usr/share/icons/Adwaita/32x32/legacy/address-book-new.png /usr/share/icons/Adwaita/16x16/legacy/image-missing.png /usr/share/icons/Adwaita/22x22/legacy/emblem-default.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop.png /usr/share/icons/Adwaita/32x32/legacy/media-tape.png /usr/share/icons/Adwaita/22x22/legacy/face-angry.png /usr/share/icons/Adwaita/24x24/legacy/dialog-information.png /usr/share/icons/Adwaita/24x24/legacy/edit-redo.png /usr/share/icons/Adwaita/22x22/legacy/audio-volume-high.png /usr/share/icons/Adwaita/22x22/legacy/input-dialpad.png /usr/share/icons/Adwaita/16x16/legacy/input-keyboard.png /usr/share/icons/Adwaita/2
 2x22/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/32x32/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/32x32/legacy/go-next.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/48x48/legacy/go-home.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/32x32/legacy/image-missing.png /usr/share/icons/Adwaita/22x22/legacy/media-tape.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/16x16/legacy/scanner.png /usr/share/icons/Adwaita/24x24/legacy/edit-delete.png /usr/share/icons/Adwaita/48x48/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/48x48/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/22x22/legacy/face-surprise.png /usr/share/icons/Adwaita/22x22/legacy/applications-accessories.png /usr/share/icons/Adwaita/48x48/legacy/battery-low-chargin
 g.png /usr/share/icons/Adwaita/22x22/legacy/image-missing.png /usr/share/icons/Adwaita/24x24/legacy/document-revert.png /usr/share/icons/Adwaita/24x24/legacy/mail-read.png /usr/share/icons/Adwaita/32x32/legacy/network-wired.png /usr/share/icons/Adwaita/32x32/legacy/mark-location.png /usr/share/icons/Adwaita/48x48/legacy/document-revert.png /usr/share/icons/Adwaita/16x16/legacy/input-gaming.png /usr/share/icons/Adwaita/24x24/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/16x16/legacy/edit-select-all.png /usr/share/icons/Adwaita/24x24/legacy/go-next-rtl.png /usr/share/icons/Adwaita/48x48/legacy/face-uncertain.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/22x22/legacy/audio-card.png /usr/share/icons/Adwaita/48x48/legacy/window-new.png /usr/share/icons/Adwaita/22x22/legacy/battery-full-charging.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/16x16/legacy/media-eject.png /usr/share/icons/Adwait
 a/22x22/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/48x48/legacy/document-page-setup.png /usr/share/icons/Adwaita/32x32/legacy/media-skip-backward.png /usr/share/icons/Adwaita/16x16/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/24x24/legacy/battery-good.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/32x32/legacy/application-exit.png /usr/share/icons/Adwaita/24x24/legacy/ac-adapter.png /usr/share/icons/Adwaita/16x16/legacy/battery-low.png /usr/share/icons/Adwaita/22x22/legacy/accessories-calculator.png /usr/share/icons/Adwaita/24x24/legacy/view-fullscreen.png /usr/share/icons/Adwaita/22x22/legacy/security-medium.png /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/16x16/legacy/go-top.png /usr/share/icons/Adwaita/32x32/legacy/drive-multidisk.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-mut
 ed.png /usr/share/icons/Adwaita/48x48/legacy/edit-undo.png /usr/share/icons/Adwaita/22x22/legacy/insert-link.png /usr/share/icons/Adwaita/48x48/legacy/address-book-new.png /usr/share/icons/Adwaita/16x16/legacy/mail-send-receive.png /usr/share/icons/Adwaita/16x16/legacy/address-book-new.png /usr/share/icons/Adwaita/8x8/legacy/emblem-new.png /usr/share/icons/Adwaita/22x22/legacy/mail-attachment.png /usr/share/icons/Adwaita/32x32/legacy/system-file-manager.png /usr/share/icons/Adwaita/24x24/legacy/media-skip-forward.png /usr/share/icons/Adwaita/22x22/legacy/face-sad.png /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/48x48/legacy/software-update-available.png /usr/share/icons/Adwaita/32x32/legacy/edit-select-all.png /usr/share/icons/Adwaita/16x16/legacy/zoom-in.png /usr/share/icons/Adwaita/48x48/legacy/media-skip-backward.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/48x48/legacy/object-flip-vertical.p
 ng /usr/share/icons/Adwaita/24x24/legacy/face-sad.png /usr/share/icons/Adwaita/16x16/legacy/network-vpn.png /usr/share/icons/Adwaita/22x22/legacy/edit-select-all.png /usr/share/icons/Adwaita/16x16/legacy/security-low.png /usr/share/icons/Adwaita/24x24/legacy/media-playback-pause.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/22x22/legacy/trophy-bronze.png /usr/share/icons/Adwaita/32x32/legacy/emblem-important.png /usr/share/icons/Adwaita/32x32/legacy/emblem-photos.png /usr/share/icons/Adwaita/22x22/legacy/edit-delete.png /usr/share/icons/Adwaita/32x32/legacy/edit-undo.png /usr/share/icons/Adwaita/24x24/legacy/appointment-missed.png /usr/share/icons/Adwaita/32x32/legacy/network-receive.png /usr/share/icons/Adwaita/48x48/legacy/help-browser.png /usr/share/icons/Adwaita/48x48/legacy/zoom-out.png /usr/share/icons/Adwaita/24x24/legacy/network-idle.png /usr/share/icons/Adwaita/24x24/legacy/format-text-underline.png /usr/share/icons/Adwait
 a/48x48/legacy/battery-low.png /usr/share/icons/Adwaita/48x48/legacy/mail-reply-all.png /usr/share/icons/Adwaita/48x48/legacy/accessories-character-map.png /usr/share/icons/Adwaita/16x16/legacy/face-smile.png /usr/share/icons/Adwaita/22x22/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/24x24/legacy/battery-low.png /usr/share/icons/Adwaita/22x22/legacy/go-top.png /usr/share/icons/Adwaita/16x16/legacy/non-starred.png /usr/share/icons/Adwaita/24x24/legacy/go-next.png /usr/share/icons/Adwaita/48x48/legacy/system-search.png /usr/share/icons/Adwaita/32x32/legacy/process-stop.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-right.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/48x48/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/22x22/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/32x32/legacy/media-seek-backward.png /usr/share/icons/Adwaita/32x32/legacy/semi-starred.png /usr/share/icons/Adwaita/16x16/legacy
 /go-previous-rtl.png /usr/share/icons/Adwaita/16x16/legacy/accessories-calculator.png /usr/share/icons/Adwaita/16x16/legacy/folder-visiting.png /usr/share/icons/Adwaita/22x22/legacy/media-flash.png /usr/share/icons/Adwaita/32x32/legacy/battery-full-charging.png /usr/share/icons/Adwaita/22x22/legacy/battery-full.png /usr/share/icons/Adwaita/16x16/legacy/document-print-preview.png /usr/share/icons/Adwaita/32x32/legacy/applications-graphics.png /usr/share/icons/Adwaita/48x48/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/48x48/legacy/network-wireless.png /usr/share/icons/Adwaita/24x24/legacy/go-bottom.png /usr/share/icons/Adwaita/24x24/legacy/go-first.png /usr/share/icons/Adwaita/16x16/legacy/document-open-recent.png /usr/share/icons/Adwaita/22x22/legacy/appointment-soon.png /usr/share/icons/Adwaita/32x32/legacy/dialog-information.png /usr/share/icons/Adwaita/16x16/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/48x48/legacy/network-offline.png /usr/share/i
 cons/Adwaita/24x24/legacy/mail-message-new.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-low.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/24x24/legacy/folder-visiting.png /usr/share/icons/Adwaita/48x48/legacy/audio-volume-low.png /usr/share/icons/Adwaita/22x22/legacy/format-text-italic.png /usr/share/icons/Adwaita/48x48/legacy/emblem-system.png /usr/share/icons/Adwaita/48x48/legacy/battery-empty.png /usr/share/icons/Adwaita/22x22/legacy/mail-message-new.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/24x24/legacy/system-users.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/16x16/legacy/applications-games.png /usr/share/icons/Adwaita/16x16/legacy/emblem-important.png /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/32x32/legacy/contact-new.png /usr/share/icons/Adwaita/22x22/
 legacy/document-revert-rtl.png /usr/share/icons/Adwaita/22x22/legacy/camera-web.png /usr/share/icons/Adwaita/22x22/legacy/system-lock-screen.png /usr/share/icons/Adwaita/48x48/legacy/system-software-install.png /usr/share/icons/Adwaita/48x48/legacy/face-plain.png /usr/share/icons/Adwaita/48x48/legacy/list-remove.png /usr/share/icons/Adwaita/22x22/legacy/face-plain.png /usr/share/icons/Adwaita/48x48/legacy/applications-graphics.png /usr/share/icons/Adwaita/32x32/legacy/face-crying.png /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal.png /usr/share/icons/Adwaita/22x22/legacy/view-restore.png /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/48x48/legacy/dialog-question.png /usr/share/icons/Adwaita/48x48/legacy/face-laugh.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop.png /usr/share/icons/Adwaita/16x16/legacy/edit-find-replace.png /usr/share/icons/Adwaita/16x16/legacy/mail-read.png /usr/share/icons/Adwaita/48x48/legacy/prefe
 rences-desktop-personal.png /usr/share/icons/Adwaita/22x22/legacy/edit-find.png /usr/share/icons/Adwaita/24x24/legacy/changes-prevent.png /usr/share/icons/Adwaita/24x24/legacy/mail-replied.png /usr/share/icons/Adwaita/48x48/legacy/camera-video.png /usr/share/icons/Adwaita/16x16/legacy/contact-new.png /usr/share/icons/Adwaita/48x48/legacy/user-away.png /usr/share/icons/Adwaita/24x24/legacy/system-help.png /usr/share/icons/Adwaita/48x48/legacy/go-top.png /usr/share/icons/Adwaita/48x48/legacy/go-next.png /usr/share/icons/Adwaita/24x24/legacy/edit-paste.png /usr/share/icons/Adwaita/16x16/legacy/applications-utilities.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/32x32/legacy/input-keyboard.png /usr/share/icons/Adwaita/16x16/legacy/face-glasses.png /usr/share/icons/Adwaita/48x48/legacy/battery-missing.png /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/48x48/legacy/media-seek-backward.
 png /usr/share/icons/Adwaita/32x32/legacy/software-update-available.png /usr/share/icons/Adwaita/48x48/legacy/go-bottom.png /usr/share/icons/Adwaita/32x32/legacy/face-worried.png /usr/share/icons/Adwaita/16x16/legacy/bookmark-new.png /usr/share/icons/Adwaita/24x24/legacy/face-kiss.png /usr/share/icons/Adwaita/48x48/legacy/trophy-gold.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/32x32/legacy/go-next-rtl.png /usr/share/icons/Adwaita/48x48/legacy/face-glasses.png /usr/share/icons/Adwaita/22x22/legacy/non-starred.png /usr/share/icons/Adwaita/24x24/legacy/network-vpn.png /usr/share/icons/Adwaita/22x22/legacy/dialog-information.png /usr/share/icons/Adwaita/48x48/legacy/face-monkey.png /usr/share/icons/Adwaita/24x24/legacy/phone.png /usr/share/icons/Adwaita/16x16/legacy/document-send.png /usr/share/icons/Adwaita/24x24/legacy/input-touchpad.png /usr/share/icons/Adwaita/22x22/legacy/input-touchpad.png /usr/share/icons/Adwaita/16x16/le
 gacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/16x16/legacy/battery-caution.png /usr/share/icons/Adwaita/24x24/legacy/network-wireless.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/32x32/legacy/applications-utilities.png /usr/share/icons/Adwaita/24x24/legacy/face-smirk.png /usr/share/icons/Adwaita/32x32/legacy/emote-love.png /usr/share/icons/Adwaita/32x32/legacy/changes-allow.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-important.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-high.png /usr/share/icons/Adwaita/48x48/legacy/security-medium.png /usr/share/icons/Adwaita/22x22/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/22x22/legacy/edit-copy.png /usr/share/icons/Adwaita/24x24/legacy/document-new.png /usr/share/icons/Adwaita/32x32/legacy/computer-fail.png /usr/share/icons/Adwaita/16x16/legacy/printer-printing.png /usr/share/icons/Adwaita/48x48/legacy/edit-clear-all.png /usr/share/icons/Adwaita/16
 x16/legacy/go-first-rtl.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/22x22/legacy/computer.png /usr/share/icons/Adwaita/22x22/legacy/go-jump.png /usr/share/icons/Adwaita/16x16/legacy/system-shutdown.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-more.png /usr/share/icons/Adwaita/24x24/legacy/battery-low-charging.png /usr/share/icons/Adwaita/32x32/legacy/battery.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/16x16/legacy/system-file-manager.png /usr/share/icons/Adwaita/16x16/legacy/zoom-original.png /usr/share/icons/Adwaita/48x48/legacy/battery-good-charging.png /usr/share/icons/Adwaita/16x16/legacy/system-users.png /usr/share/icons/Adwaita/24x24/legacy/mail-send-receive.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-read.png /usr/share/icons/Adwaita/48x48/legacy/face-worried.png /usr/share/icons/Adwaita/16x16/legacy/face-worried.png /usr/share/icons/Adwaita/22
 x22/legacy/go-bottom.png /usr/share/icons/Adwaita/16x16/legacy/media-tape.png /usr/share/icons/Adwaita/32x32/legacy/zoom-original.png /usr/share/icons/Adwaita/48x48/legacy/user-info.png /usr/share/icons/Adwaita/16x16/legacy/edit-undo.png /usr/share/icons/Adwaita/22x22/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/24x24/legacy/system-log-out.png /usr/share/icons/Adwaita/48x48/legacy/emblem-important.png /usr/share/icons/Adwaita/22x22/legacy/face-embarrassed.png /usr/share/icons/Adwaita/48x48/legacy/face-smile-big.png /usr/share/icons/Adwaita/16x16/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/22x22/legacy/input-keyboard.png /usr/share/icons/Adwaita/24x24/legacy/security-low.png /usr/share/icons/Adwaita/16x16/legacy/battery-missing.png /usr/share/icons/Adwaita/16x16/legacy/mail-send.png /usr/share/icons/Adwaita/24x24/legacy/insert-object.png /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/22x22/legacy/go-last-rtl.
 png /usr/share/icons/Adwaita/16x16/legacy/dialog-question.png /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/48x48/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/16x16/legacy/audio-card.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-less.png /usr/share/icons/Adwaita/32x32/legacy/web-browser.png /usr/share/icons/Adwaita/32x32/legacy/non-starred.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system.png /usr/share/icons/Adwaita/32x32/legacy/system-shutdown.png /usr/share/icons/Adwaita/32x32/legacy/battery-caution.png /usr/share/icons/Adwaita/24x24/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/48x48/legacy/network-error.png /usr/share/icons/Adwaita/24x24/legacy/system-software-install.png /usr/share/icons/Adwaita/32x32/legacy/battery-full.png /usr/share/icons/Adwaita/24x24/legacy/security-high.png /usr/share/icons/Adwaita/32x32/leg
 acy/preferences-desktop-font.png /usr/share/icons/Adwaita/24x24/legacy/face-uncertain.png /usr/share/icons/Adwaita/48x48/legacy/audio-volume-high.png /usr/share/icons/Adwaita/16x16/legacy/applications-development.png /usr/share/icons/Adwaita/16x16/legacy/document-new.png /usr/share/icons/Adwaita/24x24/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/32x32/legacy/go-down.png /usr/share/icons/Adwaita/48x48/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/16x16/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/48x48/legacy/video-display.png /usr/share/icons/Adwaita/24x24/legacy/view-refresh.png /usr/share/icons/Adwaita/48x48/legacy/go-last.png /usr/share/icons/Adwaita/16x16/legacy/modem.png /usr/share/icons/Adwaita/32x32/legacy/emblem-mail.png /usr/share/icons/Adwaita/16x16/legacy/battery-good.png /usr/share/icons/Adwaita/24x24/legacy/mail-send.png /usr/share/icons/Adwaita/48x48/legacy/face-angel.png /usr/share/icons/Adwaita/24x24/legacy/trophy-silver.png /usr/shar
 e/icons/Adwaita/48x48/legacy/battery-caution.png /usr/share/icons/Adwaita/16x16/legacy/document-print.png /usr/share/icons/Adwaita/16x16/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/32x32/legacy/face-raspberry.png /usr/share/icons/Adwaita/16x16/legacy/appointment-soon.png"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGV changed from 41.0 [default] to 42.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGSIZE changed from 2213673 to 354644 (-84%)
packages/all-poky-linux/adwaita-icon-theme: PV changed from "41.0" to "42.0"
packages/all-poky-linux/adwaita-icon-theme: SRC_URI changed from "https://download.gnome.org/sources//adwaita-icon-theme/41/adwaita-icon-theme-41.0.tar.xz;name=archive file://0001-Don-t-use-AC_CANONICAL_HOST.patch file://0001-Run-installation-commands-as-shell-jobs.patch" to "https://download.gnome.org/sources//adwaita-icon-theme/42/adwaita-icon-theme-42.0.tar.xz;name=archive file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
packages/all-poky-linux/adwaita-icon-theme: PKGV changed from 41.0 [default] to 42.0 [default]
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/16x16/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/512x512/devices/camera-web.png was added
  /usr/share/icons/Adwaita/512x512/devices/drive-multidisk.png was added
  /usr/share/icons/Adwaita/512x512/devices/drive-optical.png was added
  /usr/share/icons/Adwaita/512x512/devices/ebook-reader.png was added
  /usr/share/icons/Adwaita/512x512/devices/input-keyboard.png was added
  /usr/share/icons/Adwaita/512x512/devices/input-mouse.png was added
  /usr/share/icons/Adwaita/512x512/devices/input-tablet.png was added
  /usr/share/icons/Adwaita/512x512/devices/media-flash.png was added
  /usr/share/icons/Adwaita/512x512/devices/media-floppy.png was added
  /usr/share/icons/Adwaita/512x512/devices/phone.png was added
  /usr/share/icons/Adwaita/512x512/devices/scanner.png was added
  /usr/share/icons/Adwaita/512x512/devices/video-display.png was added
  /usr/share/icons/Adwaita/64x64/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/scalable/actions/application-exit-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/application-exit-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/document-revert-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-indent-less-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-indent-more-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-direction-ltr-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-direction-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-plaintext-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-rich-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/go-jump-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-forward-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-reply-sender-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/selection-mode-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-log-out-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-log-out-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-switch-user-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-switch-user-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-paged-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-paged-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/devices/audio-speakers-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/devices/audio-speakers-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/devices/media-optical-cd-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/devices/tablet-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-calculator-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-character-map-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-dictionary-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-text-editor-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/applets-screenshooter-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/gnome-power-manager-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/goa-panel-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/help-browser-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/help-contents-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/help-faq-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/multimedia-volume-control-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-color-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-accessibility-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-appearance-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-apps-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-display-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-font-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-shortcuts-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-locale-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-multitasking-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-remote-desktop-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-screensaver-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-wallpaper-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-details-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-devices-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-proxy-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-notifications-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-parental-controls-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-privacy-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-search-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-sharing-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-time-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/system-file-manager-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/system-software-install-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/system-users-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/text-editor-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/user-info-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/utilities-terminal-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/web-browser-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-high-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-high-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-low-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-low-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/bluetooth-acquiring-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/image-missing-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/mail-replied-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/mail-replied-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-acquiring-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-acquiring-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-no-route-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-no-route-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-offline-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-offline-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-receive-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-transmit-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-vpn-disabled-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-vpn-disconnected-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/orientation-portrait-left-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/orientation-portrait-right-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-balanced-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-balanced-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-performance-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-performance-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/security-medium-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/security-medium-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/semi-starred-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/view-wrapped-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/computer.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-signed.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-signed-verified.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/modem.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wireless-encrypted.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/pda.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/phone.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/starred.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/tab-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/16x16/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/22x22/legacy was removed
  /usr/share/icons/Adwaita/22x22/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/computer.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-signed.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-signed-verified.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/modem.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wireless-encrypted.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/pda.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/phone.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/starred.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/tab-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/computer.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-signed.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-signed-verified.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/modem.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wireless-encrypted.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/pda.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/phone.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/starred.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/tab-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/24x24/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/256x256/legacy was removed
  /usr/share/icons/Adwaita/256x256/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/computer.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/emblem-synchronizing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/phone.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/starred.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/computer.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/modem.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/pda.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/phone.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/starred.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/32x32/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/computer.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-desktop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/modem.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/pda.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/phone.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/starred.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/48x48/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/512x512/legacy was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/8x8/legacy was removed
  /usr/share/icons/Adwaita/8x8/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/8x8/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/8x8/legacy/emblem-synchronizing.png was removed
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-rtl-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-rtl-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-calculator-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-character-map-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-dictionary-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-text-editor-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/applets-screenshooter-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/gnome-power-manager-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/goa-panel-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/help-browser-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/help-faq-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/multimedia-volume-control-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-color-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-accessibility-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-apps-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-display-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-font-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-shortcuts-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-locale-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-remote-desktop-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-screensaver-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-wallpaper-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-details-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-devices-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-proxy-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-notifications-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-parental-controls-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-privacy-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-search-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-sharing-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-time-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/system-file-manager-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/system-software-install-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/system-users-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/text-editor-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/user-info-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/utilities-terminal-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/web-browser-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/status/network-wired-offline-symbolic.svg was removed

--===============7693953358527745478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-hires: PKGSIZE changed from 6541684 to 1546916 (-76%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-hires: FILELIST: removed "/usr/share/icons/Adwaita/256x256/legacy/system-lock-screen.png /usr/share/icons/Adwaita/256x256/legacy/printer-error.png /usr/share/icons/Adwaita/256x256/legacy/network-offline.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/256x256/legacy/edit-delete.png /usr/share/icons/Adwaita/256x256/legacy/emblem-synchronizing.png /usr/share/icons/Adwaita/256x256/legacy/network-idle.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-network.png /usr/share/icons/Adwaita/256x256/legacy/go-first-rtl.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-low.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/256x256/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/512x512/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-font.png /usr/share/icons/Adwa
 ita/256x256/legacy/face-smile.png /usr/share/icons/Adwaita/256x256/legacy/emote-love.png /usr/share/icons/Adwaita/256x256/legacy/trophy-silver.png /usr/share/icons/Adwaita/256x256/legacy/appointment-soon.png /usr/share/icons/Adwaita/256x256/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/256x256/legacy/face-angel.png /usr/share/icons/Adwaita/256x256/legacy/applications-development.png /usr/share/icons/Adwaita/256x256/legacy/go-last-rtl.png /usr/share/icons/Adwaita/256x256/legacy/help-browser.png /usr/share/icons/Adwaita/512x512/legacy/edit-select-all.png /usr/share/icons/Adwaita/256x256/legacy/face-embarrassed.png /usr/share/icons/Adwaita/256x256/legacy/video-display.png /usr/share/icons/Adwaita/256x256/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/256x256/legacy/go-next.png /usr/share/icons/Adwaita/256x256/legacy/user-available.png /usr/share/icons/Adwaita/256x256/legacy/face-smile-big.png /usr/share/icons/Adwaita/512x512/legacy/folder-visiting.png /usr/sh
 are/icons/Adwaita/256x256/legacy/trophy-gold.png /usr/share/icons/Adwaita/256x256/legacy/user-offline.png /usr/share/icons/Adwaita/256x256/legacy/face-plain.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/256x256/legacy/face-surprise.png /usr/share/icons/Adwaita/256x256/legacy/battery-empty.png /usr/share/icons/Adwaita/256x256/legacy/input-tablet.png /usr/share/icons/Adwaita/256x256/legacy/system-software-install.png /usr/share/icons/Adwaita/512x512/legacy/applications-internet.png /usr/share/icons/Adwaita/256x256/legacy/appointment-missed.png /usr/share/icons/Adwaita/256x256/legacy/system-users.png /usr/share/icons/Adwaita/256x256/legacy/dialog-error.png /usr/share/icons/Adwaita/256x256/legacy/starred.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/256x256/legacy/trophy-bronze.png /usr/share/icons/Adwaita/256x256/legacy/view-refresh.png /usr/share/icons/Adwaita/256x256/lega
 cy/face-laugh.png /usr/share/icons/Adwaita/256x256/legacy/system-run.png /usr/share/icons/Adwaita/256x256/legacy/network-error.png /usr/share/icons/Adwaita/256x256/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/256x256/legacy/security-medium.png /usr/share/icons/Adwaita/512x512/legacy/mark-location.png /usr/share/icons/Adwaita/256x256/legacy/semi-starred.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/256x256/legacy/ebook-reader.png /usr/share/icons/Adwaita/256x256/legacy/software-update-urgent.png /usr/share/icons/Adwaita/256x256/legacy/software-update-available.png /usr/share/icons/Adwaita/512x512/legacy/utilities-terminal.png /usr/share/icons/Adwaita/256x256/legacy/document-print.png /usr/share/icons/Adwaita/256x256/legacy/audio-speakers.png /usr/share/icons/Adwaita/256x256/legacy/emblem-mail.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/256x256/legacy/face
 -devilish.png /usr/share/icons/Adwaita/256x256/legacy/scanner.png /usr/share/icons/Adwaita/256x256/legacy/face-smirk.png /usr/share/icons/Adwaita/256x256/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/256x256/legacy/network-transmit.png /usr/share/icons/Adwaita/256x256/legacy/go-next-rtl.png /usr/share/icons/Adwaita/256x256/legacy/computer.png /usr/share/icons/Adwaita/256x256/legacy/dialog-warning.png /usr/share/icons/Adwaita/256x256/legacy/drive-multidisk.png /usr/share/icons/Adwaita/256x256/legacy/drive-optical.png /usr/share/icons/Adwaita/256x256/legacy/face-uncertain.png /usr/share/icons/Adwaita/256x256/legacy/mail-read.png /usr/share/icons/Adwaita/256x256/legacy/input-gaming.png /usr/share/icons/Adwaita/256x256/legacy/system-file-manager.png /usr/share/icons/Adwaita/512x512/legacy/accessories-calculator.png /usr/share/icons/Adwaita/512x512/legacy/image-missing.png /usr/share/icons/Adwaita/256x256/legacy/process-stop.png /usr/share/icons/Adwaita/512x512/legacy/address-book
 -new.png /usr/share/icons/Adwaita/512x512/legacy/document-save.png /usr/share/icons/Adwaita/256x256/legacy/go-last.png /usr/share/icons/Adwaita/256x256/legacy/applications-office.png /usr/share/icons/Adwaita/256x256/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/512x512/legacy/document-page-setup.png /usr/share/icons/Adwaita/256x256/legacy/document-print-preview.png /usr/share/icons/Adwaita/512x512/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/512x512/legacy/applications-system.png /usr/share/icons/Adwaita/256x256/legacy/non-starred.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/256x256/legacy/user-invisible.png /usr/share/icons/Adwaita/256x256/legacy/battery-low-charging.png /usr/share/icons/Adwaita/256x256/legacy/computer-fail.png /usr/share/icons/Adwaita/256x256/legacy/battery-full-charging.png /usr/share/icons/Adwa
 ita/512x512/legacy/input-dialpad.png /usr/share/icons/Adwaita/256x256/legacy/dialog-password.png /usr/share/icons/Adwaita/256x256/legacy/user-idle.png /usr/share/icons/Adwaita/256x256/legacy/system-log-out.png /usr/share/icons/Adwaita/512x512/legacy/document-save-as.png /usr/share/icons/Adwaita/512x512/legacy/multimedia-player.png /usr/share/icons/Adwaita/512x512/legacy/document-properties.png /usr/share/icons/Adwaita/256x256/legacy/battery-good.png /usr/share/icons/Adwaita/256x256/legacy/web-browser.png /usr/share/icons/Adwaita/256x256/legacy/dialog-question.png /usr/share/icons/Adwaita/256x256/legacy/system-search.png /usr/share/icons/Adwaita/256x256/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/256x256/legacy/media-flash.png /usr/share/icons/Adwaita/256x256/legacy/face-angry.png /usr/share/icons/Adwaita/512x512/legacy/emblem-package.png /usr/share/icons/Adwaita/256x256/legacy/battery-missing.png /usr/share/icons/Adwaita/256x256/legacy/user-info.png /usr/share/icons
 /Adwaita/256x256/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/256x256/legacy/edit-find.png /usr/share/icons/Adwaita/256x256/legacy/dialog-information.png /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/256x256/legacy/battery-caution.png /usr/share/icons/Adwaita/256x256/legacy/input-keyboard.png /usr/share/icons/Adwaita/256x256/legacy/camera-web.png /usr/share/icons/Adwaita/256x256/legacy/go-jump.png /usr/share/icons/Adwaita/256x256/legacy/user-away.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/256x256/legacy/audio-volume-high.png /usr/share/icons/Adwaita/256x256/legacy/battery-full-charged.png /usr/share/icons/Adwaita/256x256/legacy/input-mouse.png /usr/share/icons/Adwaita/256x256/legacy/system-software-update.png /usr/share/icons/Adwaita/512x512/legacy/document-new.png /usr/share/icons/Adwaita/256x2
 56/legacy/face-cool.png /usr/share/icons/Adwaita/256x256/legacy/accessories-calculator.png /usr/share/icons/Adwaita/256x256/legacy/go-first.png /usr/share/icons/Adwaita/256x256/legacy/camera-photo.png /usr/share/icons/Adwaita/256x256/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/256x256/legacy/ac-adapter.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-search.png /usr/share/icons/Adwaita/256x256/legacy/battery-low.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system.png /usr/share/icons/Adwaita/256x256/legacy/appointment-new.png /usr/share/icons/Adwaita/256x256/legacy/face-sad.png /usr/share/icons/Adwaita/256x256/legacy/document-open-recent.png /usr/share/icons/Adwaita/256x256/legacy/battery-good-charging.png /usr/share/icons/Adwaita/512x512/legacy/folder-new.png /usr/share/icons/Adwaita/256x256/legacy/applications-graphics.png /usr/share/icons/Adwaita/256x256/legacy/mail-message-new.png /usr/share/icons/Adwaita/256x256/legacy/battery-full.
 png /usr/share/icons/Adwaita/512x512/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/256x256/legacy/face-tired.png /usr/share/icons/Adwaita/256x256/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/512x512/legacy/document-revert.png /usr/share/icons/Adwaita/256x256/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/512x512/legacy/document-open.png /usr/share/icons/Adwaita/256x256/legacy/battery.png /usr/share/icons/Adwaita/256x256/legacy/face-crying.png /usr/share/icons/Adwaita/256x256/legacy/phone.png /usr/share/icons/Adwaita/256x256/legacy/edit-find-replace.png /usr/share/icons/Adwaita/256x256/legacy/security-high.png /usr/share/icons/Adwaita/256x256/legacy/go-previous.png /usr/share/icons/Adwaita/256x256/legacy/media-floppy.png /usr/share/icons/Adwaita/256x256/legacy/network-receive.png /usr/share/icons/Adwaita/256x256/legacy/face-sick.png /usr/share/icons/Adwaita/256x256/legacy/face-wink.png /usr/share/icons/Adwaita/256x256/legacy/preferences-
 desktop-wallpaper.png /usr/share/icons/Adwaita/256x256/legacy/printer-printing.png /usr/share/icons/Adwaita/256x256/legacy/security-low.png /usr/share/icons/Adwaita/256x256/legacy/user-busy.png /usr/share/icons/Adwaita/256x256/legacy/system-shutdown.png /usr/share/icons/Adwaita/512x512/legacy/accessories-character-map.png /usr/share/icons/Adwaita/256x256/legacy/face-glasses.png", added "/usr/share/icons/Adwaita/512x512/devices/video-display.png /usr/share/icons/Adwaita/512x512/devices/scanner.png /usr/share/icons/Adwaita/512x512/devices/ebook-reader.png /usr/share/icons/Adwaita/512x512/devices/input-tablet.png /usr/share/icons/Adwaita/512x512/devices/drive-optical.png /usr/share/icons/Adwaita/512x512/devices/input-keyboard.png /usr/share/icons/Adwaita/512x512/devices/media-floppy.png /usr/share/icons/Adwaita/512x512/devices/input-mouse.png /usr/share/icons/Adwaita/512x512/devices/phone.png /usr/share/icons/Adwaita/512x512/devices/media-flash.png /usr/share/icons/Adwaita/512x512/devi
 ces/camera-web.png /usr/share/icons/Adwaita/512x512/devices/drive-multidisk.png"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic-hires: PKGSIZE changed from 1645646 to 2027073 (+23%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic-hires: FILELIST: removed "/usr/share/icons/Adwaita/96x96/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/system-software-install-symbolic.symbolic.png /usr
 /share/icons/Adwaita/64x64/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/applets-screenshooter-symbolic.symbo
 lic.png /usr/share/icons/Adwaita/96x96/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/pref
 erences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/help-browser-symbolic.symbolic.png /usr/share/icons
 /Adwaita/64x64/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/help-browser-symbolic.symbolic.png /usr/share/icons/Adwait
 a/32x32/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/system-
 users-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/web-br
 owser-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/prefer
 ences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/applets-screens
 hooter-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/applets-screenshooter-symbolic.sym
 bolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/help-
 browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system
 -devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/
 48x48/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png", added "/usr/share/icons/Adwaita/32x32/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-color-s
 ymbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32
 /legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/applets-screenshooter-symbolic.symboli
 c.png /usr/share/icons/Adwaita/48x48/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-transmit-symbolic-rtl.symbolic.
 png /usr/share/icons/Adwaita/48x48/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/semi-starred-rtl-symbolic.symbolic.png /
 usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-font-symbolic.symbolic.png /u
 sr/share/icons/Adwaita/96x96/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/mail-reply-sender-symbolic
 -rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network
 -vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons
 /Adwaita/32x32/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/
 devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwait
 a/48x48/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-rtl-symb
 olic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/security-medium-symbolic-
 rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/selection-mode-symbolic.symbolic.png /usr/share/ico
 ns/Adwaita/96x96/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons
 /Adwaita/48x48/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/ico
 ns/Adwaita/96x96/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-rtl-sym
 bolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/netw
 ork-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/sh
 are/icons/Adwaita/64x64/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferenc
 es-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-accessibility-symbolic.sy
 mbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferen
 ces-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x4
 8/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control-sy
 mbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita
 /32x32/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwa
 ita/32x32/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/ico
 ns/Adwaita/32x32/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-s
 ort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share
 /icons/Adwaita/96x96/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/shar
 e/icons/Adwaita/32x32/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories
 -dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic
 .png /usr/share/icons/Adwaita/48x48/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita
 /96x96/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/mail-replied-r
 tl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/system-file-manager-symbolic.symbolic.png /usr/shar
 e/icons/Adwaita/48x48/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-paged-symbolic-rtl.s
 ymbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/48x
 48/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferen
 ces-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/power-profile-balan
 ced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adw
 aita/96x96/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/act
 ions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/actions/mail-r
 eply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-receive-symbolic-rtl.symbolic.png 
 /usr/share/icons/Adwaita/64x64/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/32x32/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/64x64/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/96x96/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-none-symbolic-rtl.symbolic.png"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: FILELIST: removed "/usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/multimedia-volume-control-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/applets-screenshooter-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-details-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/system-file-manager-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share
 /icons/Adwaita/16x16/apps/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/utilities-terminal-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-wired-offline-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/text-editor-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/help-browser-symbolic.symbolic.p
 ng /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-shortcuts-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-search-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-screensaver-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/help-faq-symbolic.svg /usr/share/icons/Adw
 aita/24x24/apps/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-wallpaper-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/sidebar-show-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-apps-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/goa-panel-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-wired-offline-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/
 system-software-install-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/user-info-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/sidebar-show-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-parental-controls-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/help-browser-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita
 /16x16/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-privacy-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/system-users-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/applets-screenshooter-symbo
 lic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-color-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/accessories-calculator-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-time-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-accessibility-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-devices-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system
 -privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/accessories-text-editor-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/gnome-power-manager-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-sharing-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/web-browser-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/preferences-system-time-symbolic.symboli
 c.png /usr/share/icons/Adwaita/24x24/apps/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-system-notifications-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-display-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-font-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-accessibility-symbolic.symbolic.png /u
 sr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/apps/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/apps/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-remote-desktop-symbolic.svg /usr/share/icons/Adwaita/16x16/apps/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/accessories-character-map-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-proxy-symbolic.svg /usr/share/icons/Adwaita/scalable/apps/accessories-dictionary-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-locale-symbolic.svg /usr/share/icons/Adwaita/24x24/apps/system-users-symbolic.symbolic.png", added "/usr/share/icons/Adwaita/
 24x24/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-sharing-symbolic.svg /usr/share/icons/Adwaita/16x16/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-paged-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/mail-reply-sender-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24
 /actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/accessories-dictionary-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/24x
 24/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/accessories-dictionary-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/security-medium-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-devices-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/
 format-text-direction-ltr-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-vpn-disconnected-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/power-profile-balanced-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/system-software-install-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-multitasking-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-rtl-symbolic.svg /usr/share/icons/Adwaita/24x
 24/legacy/preferences-system-network-proxy-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/format-indent-less-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/audio-volume-high-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/system-switch-user-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/text-editor-symbolic.svg /usr/share/icons/Adwaita/24x24/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/system-users-symbolic.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications-symb
 olic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-font-symbolic.svg /usr/share/icons/Adwaita/16x16/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/view-wrapped-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons
 /Adwaita/16x16/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/view-wrapped-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/orientation-portrait-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/system-switch-user-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-parental-controls-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/orientation-portrait-right-symbolic-rtl.s
 ymbolic.png /usr/share/icons/Adwaita/16x16/actions/format-indent-less-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/power-profile-balanced-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/network-vpn-disabled-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-transmit-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/application-exit-symbolic-rtl.symbolic.png /us
 r/share/icons/Adwaita/24x24/legacy/user-info-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-shortcuts-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/mail-replied-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-high-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/bluetooth-acquiring-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-vpn-disconnected-symbolic
 .symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-notifications-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/system-log-out-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-acquiring-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/power-profile-performance-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/image-missing-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/system-log-out-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-multitasking-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-paged-symbolic-rtl.symbolic.
 png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-sort-descending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-vpn-disabled-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/application-exit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/network-vpn-disconnected-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-no-route-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-devices-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/help-faq-symbolic.svg /usr/share/ic
 ons/Adwaita/16x16/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/accessories-text-editor-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-rtl-symbolic.svg /usr/sh
 are/icons/Adwaita/scalable/legacy/preferences-desktop-wallpaper-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/sidebar-show-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/status/audio-volume-low-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/help-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/selection-mode-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/view-paged-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/audio-volume-high-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/applets-screenshooter-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-
 disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/devices/audio-speakers-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-transmit-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-low-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/format-text-plaintext-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/devices/media-optical-cd-symbolic.svg /usr
 /share/icons/Adwaita/16x16/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/system-log-out-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-locale-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/document-revert-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/legacy/accessories-calculator-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-apps-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/
 network-cellular-signal-excellent-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/application-exit-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/help-contents-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/devices/media-optical-cd-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/application-exit-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x
 16/actions/view-sort-descending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/semi-starred-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-parental-controls-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/format-text-direction-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-system-sharing-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/accessories-text-editor-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-paged-symbolic-rtl.svg /usr/share/icons/Adwaita/sca
 lable/legacy/user-info-symbolic.svg /usr/share/icons/Adwaita/16x16/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-accessibility-symbolic.svg /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/sidebar-show-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/help-browser-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/accessories-character-map-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/help-faq-symbo
 lic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/go-jump-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/gnome-power-manager-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/devices/audio-speakers-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-apps-symbolic.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-time-symbolic.svg /usr/share/i
 cons/Adwaita/scalable/devices/audio-speakers-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/status/orientation-portrait-right-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-low-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/format-indent-more-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/help-faq-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/selection-mode-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preference
 s-system-privacy-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/mail-reply-all-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-no-route-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/goa-panel-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-remote-desktop-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/system-switch-user-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-notifications-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-paged-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scala
 ble/status/network-cellular-offline-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-symbolic.svg /usr/share/icons/Adwaita/24x24/status/power-profile-performance-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/go-jump-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-proxy-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-offline-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/mail-replied-symbolic-rtl.symbolic.png /usr/shar
 e/icons/Adwaita/scalable/status/security-medium-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-screensaver-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/mail-replied-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/status/semi-starred-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/utilities-terminal-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24
 /legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-list-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/devices/tablet-symbolic.svg /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/system-users-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/mail-reply-all-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/mail-replied-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-rtl-symbolic.svg /usr/share/icons/Ad
 waita/24x24/status/power-profile-performance-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-rtl-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-details-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-receive-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-good-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/image-missing-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/goa-panel-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png /usr/share/icons
 /Adwaita/scalable/status/network-cellular-acquiring-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-appearance-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/accessories-character-map-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-privacy-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/web-browser-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-display-symbolic.svg /usr/share/icons/Adwaita/24x24/legacy/preferences-color-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/
 icons/Adwaita/16x16/legacy/web-browser-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/mail-forward-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/legacy/gnome-power-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/document-revert-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-time-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/audio-volume-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/system-file-manager-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/bluetooth-acquiring-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/mail-reply-sender-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/stat
 us/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-color-symbolic.svg /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/format-text-rich-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/system-software-install-symbolic.svg /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-offline-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/format-text-plaintext-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/system-log-out-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-receive-symbolic-rtl.svg /usr/share/icons/Adwaita/24x
 24/actions/system-switch-user-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/orientation-portrait-left-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/view-list-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-good-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/application-exit-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/devices/tablet-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-high-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/
 devices/audio-speakers-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/power-profile-performance-symbolic-rtl.svg /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-search-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/help-contents-symbolic.svg /usr/share/icons/Adwaita/16x16/actions/mail-forward-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/system-file-manager-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-appearance-symbolic.svg /usr/share/icons/Adwaita/24x24/status/security-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/format-indent-more-rtl-symbolic.svg /usr/share/icons/Adwaita/24x24/actions/view-sort-descendin
 g-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-rtl-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-symbolic.svg /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-screensaver-symbolic.svg /usr/share/icons/Adwaita/16x16/status/security-medium-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/legacy/preferences-system-details-symbolic.svg /usr/share/icons/Adwaita/16x16/status/orientation-portrait-left-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-low-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/le
 gacy/multimedia-volume-control-symbolic.svg /usr/share/icons/Adwaita/24x24/status/audio-volume-medium-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-symbolic-rtl.symbolic.png /usr/share/icons/Adwaita/16x16/actions/format-text-direction-rtl-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-symbolic-rtl.svg /usr/share/icons/Adwaita/24x24/actions/format-text-direction-ltr-symbolic.symbolic.png /usr/share/icons/Adwaita/scalable/status/mail-replied-symbolic-rtl.svg /usr/share/icons/Adwaita/scalable/actions/format-text-rich-symbolic.svg"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGSIZE changed from 2213673 to 354644 (-84%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: FILELIST: removed "/usr/share/icons/Adwaita/48x48/legacy/emblem-photos.png /usr/share/icons/Adwaita/22x22/legacy/go-first-rtl.png /usr/share/icons/Adwaita/22x22/legacy/image-missing.png /usr/share/icons/Adwaita/24x24/legacy/emblem-default.png /usr/share/icons/Adwaita/32x32/legacy/document-properties.png /usr/share/icons/Adwaita/48x48/legacy/format-text-bold.png /usr/share/icons/Adwaita/24x24/legacy/face-tired.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/24x24/legacy/camera-photo.png /usr/share/icons/Adwaita/22x22/legacy/applications-internet.png /usr/share/icons/Adwaita/32x32/legacy/document-open-recent.png /usr/share/icons/Adwaita/32x32/legacy/document-print-preview.png /usr/share/icons/Adwaita/32x32/legacy/help-about.png /usr/share/icons/Adwaita/32x32/legacy/battery-caution.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop.png /usr/share/icons/Adwaita/32x3
 2/legacy/system-file-manager.png /usr/share/icons/Adwaita/16x16/legacy/dialog-information.png /usr/share/icons/Adwaita/48x48/legacy/ac-adapter.png /usr/share/icons/Adwaita/32x32/legacy/applications-utilities.png /usr/share/icons/Adwaita/32x32/legacy/camera-video.png /usr/share/icons/Adwaita/22x22/legacy/object-rotate-right.png /usr/share/icons/Adwaita/16x16/legacy/go-first.png /usr/share/icons/Adwaita/32x32/legacy/face-angry.png /usr/share/icons/Adwaita/16x16/legacy/view-sort-descending.png /usr/share/icons/Adwaita/16x16/legacy/face-surprise.png /usr/share/icons/Adwaita/48x48/legacy/emblem-mail.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/32x32/legacy/media-playback-stop.png /usr/share/icons/Adwaita/32x32/legacy/view-fullscreen.png /usr/share/icons/Adwaita/48x48/legacy/zoom-original.png /usr/share/icons/Adwaita/24x24/legacy/document-send.png /usr/share/icons/Adwaita/32x32/legacy/emblem-default.png /usr/share/icons/Adwaita/32x32/
 legacy/emblem-web.png /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/24x24/legacy/non-starred.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/16x16/legacy/emblem-web.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/22x22/legacy/edit-copy.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/22x22/legacy/applications-graphics.png /usr/share/icons/Adwaita/24x24/legacy/mail-replied.png /usr/share/icons/Adwaita/22x22/legacy/view-refresh.png /usr/share/icons/Adwaita/24x24/legacy/emblem-package.png /usr/share/icons/Adwaita/22x22/legacy/computer.png /usr/share/icons/Adwaita/22x22/legacy/mail-send.png /usr/share/icons/Adwaita/32x32/legacy/edit-paste.png /usr/share/icons/Adwaita/32x32/legacy/face-monkey.png /usr/share/icons/Adwaita/24x24/legacy/web-browser.png /usr/share/icons/Adwaita/48x48/legacy/accessories-c
 haracter-map.png /usr/share/icons/Adwaita/16x16/legacy/computer-fail.png /usr/share/icons/Adwaita/24x24/legacy/go-home.png /usr/share/icons/Adwaita/24x24/legacy/audio-card.png /usr/share/icons/Adwaita/24x24/legacy/window-new.png /usr/share/icons/Adwaita/16x16/legacy/format-text-underline.png /usr/share/icons/Adwaita/48x48/legacy/applications-engineering.png /usr/share/icons/Adwaita/16x16/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/22x22/legacy/user-away.png /usr/share/icons/Adwaita/16x16/legacy/user-busy.png /usr/share/icons/Adwaita/24x24/legacy/media-record.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/24x24/legacy/battery-caution.png /usr/share/icons/Adwaita/32x32/legacy/emblem-favorite.png /usr/share/icons/Adwaita/24x24/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/48x48/legacy/go-top.png /usr/share/icons/Adwaita/22x22/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/32x32/legacy/mail-send.
 png /usr/share/icons/Adwaita/24x24/legacy/drive-optical.png /usr/share/icons/Adwaita/48x48/legacy/zoom-out.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/48x48/legacy/emblem-web.png /usr/share/icons/Adwaita/24x24/legacy/camera-web.png /usr/share/icons/Adwaita/22x22/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/22x22/legacy/network-wired.png /usr/share/icons/Adwaita/16x16/legacy/emblem-downloads.png /usr/share/icons/Adwaita/22x22/legacy/battery-full-charging.png /usr/share/icons/Adwaita/22x22/legacy/go-previous.png /usr/share/icons/Adwaita/32x32/legacy/applications-office.png /usr/share/icons/Adwaita/16x16/legacy/call-stop.png /usr/share/icons/Adwaita/22x22/legacy/media-playback-start.png /usr/share/icons/Adwaita/24x24/legacy/folder-visiting.png /usr/share/icons/Adwaita/16x16/legacy/face-tired.png /usr/share/icons/Adwaita/22x22/legacy/mail-replied.png /usr/share/icons/Adwaita/22x22/legacy/network-wireless-encrypted.png
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/22x22/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/24x24/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/32x32/legacy/system-users.png /usr/share/icons/Adwaita/24x24/legacy/face-kiss.png /usr/share/icons/Adwaita/32x32/legacy/printer-error.png /usr/share/icons/Adwaita/22x22/legacy/face-smile-big.png /usr/share/icons/Adwaita/24x24/legacy/insert-text.png /usr/share/icons/Adwaita/32x32/legacy/folder-new.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system.png /usr/share/icons/Adwaita/16x16/legacy/ac-adapter.png /usr/share/icons/Adwaita/24x24/legacy/battery-low-charging.png /usr/share/icons/Adwaita/24x24/legacy/dialog-question.png /usr/share/icons/Adwaita/24x24/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/48x48/legacy/dialog-information.png /usr/share/icons/Adwaita/32x32/legacy/format-tex
 t-direction-rtl.png /usr/share/icons/Adwaita/24x24/legacy/network-receive.png /usr/share/icons/Adwaita/48x48/legacy/system-run.png /usr/share/icons/Adwaita/48x48/legacy/mail-message-new.png /usr/share/icons/Adwaita/16x16/legacy/input-dialpad.png /usr/share/icons/Adwaita/48x48/legacy/system-help.png /usr/share/icons/Adwaita/24x24/legacy/computer.png /usr/share/icons/Adwaita/24x24/legacy/drive-multidisk.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/24x24/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/32x32/legacy/contact-new.png /usr/share/icons/Adwaita/24x24/legacy/dialog-password.png /usr/share/icons/Adwaita/48x48/legacy/go-bottom.png /usr/share/icons/Adwaita/48x48/legacy/battery-good.png /usr/share/icons/Adwaita/24x24/legacy/system-help.png /usr/share/icons/Adwaita/48x48/legacy/edit-redo.png /usr/share/icons/Adwaita/32x32/legacy/input-dialpad.png /usr/share/icons/Adwaita/32x32/legacy/computer-fail.png /usr/share/icons/Adwait
 a/32x32/legacy/mail-mark-important.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/24x24/legacy/media-tape.png /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/32x32/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/22x22/legacy/face-uncertain.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-right.png /usr/share/icons/Adwaita/48x48/legacy/trophy-bronze.png /usr/share/icons/Adwaita/32x32/legacy/face-angel.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-high.png /usr/share/icons/Adwaita/16x16/legacy/edit-paste.png /usr/share/icons/Adwaita/16x16/legacy/system-file-manager.png /usr/share/icons/Adwaita/16x16/legacy/security-medium.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-read.png /usr/share/icons/Adwaita/22x22/legacy/document-open-
 recent.png /usr/share/icons/Adwaita/16x16/legacy/camera-photo.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/16x16/legacy/emblem-package.png /usr/share/icons/Adwaita/16x16/legacy/face-wink.png /usr/share/icons/Adwaita/24x24/legacy/input-touchpad.png /usr/share/icons/Adwaita/32x32/legacy/media-playback-start.png /usr/share/icons/Adwaita/16x16/legacy/face-kiss.png /usr/share/icons/Adwaita/24x24/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/22x22/legacy/input-gaming.png /usr/share/icons/Adwaita/32x32/legacy/applications-internet.png /usr/share/icons/Adwaita/22x22/legacy/non-starred.png /usr/share/icons/Adwaita/32x32/legacy/battery-good.png /usr/share/icons/Adwaita/32x32/legacy/input-gaming.png /usr/share/icons/Adwaita/48x48/legacy/document-properties.png /usr/share/icons/Adwaita/32x32/legacy/battery-full.png /usr/share/icons/Adwaita/16x16/legacy/edit-copy.png /usr/sh
 are/icons/Adwaita/16x16/legacy/format-text-direction-rtl.png /usr/share/icons/Adwaita/24x24/legacy/user-away.png /usr/share/icons/Adwaita/48x48/legacy/battery-full-charged.png /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/22x22/legacy/input-tablet.png /usr/share/icons/Adwaita/22x22/legacy/changes-allow.png /usr/share/icons/Adwaita/32x32/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/22x22/legacy/face-sick.png /usr/share/icons/Adwaita/48x48/legacy/battery-low.png /usr/share/icons/Adwaita/32x32/legacy/mail-read.png /usr/share/icons/Adwaita/32x32/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/16x16/legacy/trophy-bronze.png /usr/share/icons/Adwaita/16x16/legacy/mail-send.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/24x24/legacy/network-transmit.png /usr/share/icons/Adwaita/16x16/legacy/battery-empty.png /usr/share/icons/Adwaita/24x24/legacy/contact-new.png /usr/share
 /icons/Adwaita/16x16/legacy/drive-optical.png /usr/share/icons/Adwaita/16x16/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/24x24/legacy/insert-link.png /usr/share/icons/Adwaita/24x24/legacy/battery-full.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/32x32/legacy/format-text-bold.png /usr/share/icons/Adwaita/32x32/legacy/mail-attachment.png /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal.png /usr/share/icons/Adwaita/16x16/legacy/phone.png /usr/share/icons/Adwaita/48x48/legacy/address-book-new.png /usr/share/icons/Adwaita/24x24/legacy/battery.png /usr/share/icons/Adwaita/32x32/legacy/emblem-downloads.png /usr/share/icons/Adwaita/48x48/legacy/starred.png /usr/share/icons/Adwaita/22x22/legacy/face-devilish.png /usr/share/icons/Adwaita/32x32/legacy/face-devilish.png /usr/share/icons/Adwaita/32x32/legacy/face-crying.png /usr/share/icons/Adwaita/48x48/l
 egacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/16x16/legacy/emblem-mail.png /usr/share/icons/Adwaita/32x32/legacy/view-restore.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/48x48/legacy/changes-prevent.png /usr/share/icons/Adwaita/32x32/legacy/dialog-password.png /usr/share/icons/Adwaita/16x16/legacy/document-send.png /usr/share/icons/Adwaita/32x32/legacy/bookmark-new.png /usr/share/icons/Adwaita/32x32/legacy/emblem-important.png /usr/share/icons/Adwaita/48x48/legacy/face-embarrassed.png /usr/share/icons/Adwaita/22x22/legacy/user-info.png /usr/share/icons/Adwaita/32x32/legacy/edit-clear.png /usr/share/icons/Adwaita/32x32/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/22x22/legacy/edit-delete.png /usr/share/icons/Adwaita/48x48/legacy/media-playback-start.png /usr/share/icons/Adwaita/22x22/legacy/format-justify-left.png /usr/share/icons/Adwaita/48x48/legacy/face-laugh.png /usr/share/icons/Adwaita/48x48/
 legacy/applications-development.png /usr/share/icons/Adwaita/24x24/legacy/network-wireless-encrypted.png /usr/share/icons/Adwaita/22x22/legacy/format-justify-center.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/24x24/legacy/security-medium.png /usr/share/icons/Adwaita/16x16/legacy/face-smirk.png /usr/share/icons/Adwaita/32x32/legacy/web-browser.png /usr/share/icons/Adwaita/22x22/legacy/network-idle.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/32x32/legacy/ac-adapter.png /usr/share/icons/Adwaita/16x16/legacy/trophy-gold.png /usr/share/icons/Adwaita/16x16/legacy/face-worried.png /usr/share/icons/Adwaita/32x32/legacy/appointment-new.png /usr/share/icons/Adwaita/16x16/legacy/media-eject.png /usr/share/icons/Adwaita/22x22/legacy/view-fullscreen.png /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator.png /usr/share/icons/Adwaita/24x24/legacy/applications-office.png /us
 r/share/icons/Adwaita/16x16/legacy/document-print.png /usr/share/icons/Adwaita/32x32/legacy/system-software-update.png /usr/share/icons/Adwaita/48x48/legacy/document-send.png /usr/share/icons/Adwaita/24x24/legacy/document-page-setup.png /usr/share/icons/Adwaita/16x16/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/22x22/legacy/user-invisible.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system.png /usr/share/icons/Adwaita/22x22/legacy/go-last-rtl.png /usr/share/icons/Adwaita/16x16/legacy/user-available.png /usr/share/icons/Adwaita/48x48/legacy/document-open-recent.png /usr/share/icons/Adwaita/22x22/legacy/emblem-favorite.png /usr/share/icons/Adwaita/32x32/legacy/media-eject.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-read.png /usr/share/icons/Adwaita/24x24/legacy/input-gaming.png /usr/share/icons/Adwaita/24x24/legacy/task-past-due.png /usr/share/icons/Adwaita/32x32/legacy/list-remove.
 png /usr/share/icons/Adwaita/16x16/legacy/insert-text.png /usr/share/icons/Adwaita/16x16/legacy/edit-find.png /usr/share/icons/Adwaita/48x48/legacy/audio-volume-high.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-network.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/48x48/legacy/applications-other.png /usr/share/icons/Adwaita/48x48/legacy/edit-copy.png /usr/share/icons/Adwaita/22x22/legacy/trophy-gold.png /usr/share/icons/Adwaita/24x24/legacy/dialog-information.png /usr/share/icons/Adwaita/48x48/legacy/network-wireless.png /usr/share/icons/Adwaita/24x24/legacy/system-lock-screen.png /usr/share/icons/Adwaita/32x32/legacy/battery-full-charging.png /usr/share/icons/Adwaita/24x24/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/48x48/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/48x48/legacy/format-text-underline.png /usr/share/icons/Adwaita/32x32/legacy/help-contents.png /usr/share/icons/Adwaita/48x48/lega
 cy/insert-image.png /usr/share/icons/Adwaita/16x16/legacy/system-software-install.png /usr/share/icons/Adwaita/22x22/legacy/ac-adapter.png /usr/share/icons/Adwaita/22x22/legacy/applications-development.png /usr/share/icons/Adwaita/16x16/legacy/media-floppy.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search.png /usr/share/icons/Adwaita/48x48/legacy/window-close.png /usr/share/icons/Adwaita/48x48/legacy/applications-office.png /usr/share/icons/Adwaita/48x48/legacy/audio-card.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-left.png /usr/share/icons/Adwaita/16x16/legacy/face-sad.png /usr/share/icons/Adwaita/16x16/legacy/window-close.png /usr/share/icons/Adwaita/16x16/legacy/system-shutdown.png /usr/share/icons/Adwaita/16x16/legacy/task-past-due.png /usr/share/icons/Adwaita/24x24/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/22x22/legacy/document-page-setup.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita
 /24x24/legacy/go-bottom.png /usr/share/icons/Adwaita/22x22/legacy/mail-send-receive.png /usr/share/icons/Adwaita/16x16/legacy/go-up.png /usr/share/icons/Adwaita/32x32/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/22x22/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/24x24/legacy/face-sick.png /usr/share/icons/Adwaita/22x22/legacy/contact-new.png /usr/share/icons/Adwaita/24x24/legacy/document-new.png /usr/share/icons/Adwaita/48x48/legacy/network-transmit.png /usr/share/icons/Adwaita/48x48/legacy/view-restore.png /usr/share/icons/Adwaita/32x32/legacy/emblem-mail.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/24x24/legacy/media-floppy.png /usr/share/icons/Adwaita/16x16/legacy/mail-send-receive.png /usr/share/icons/Adwaita/22x22/legacy/window-close.png /usr/share/icons/Adwaita/24x24/legacy/media-seek-forward.png /usr/share/icons/Adwaita/48x48/legacy/user-away.png /usr/share/icons/Adwaita/24x24/legacy/media-playback-stop.p
 ng /usr/share/icons/Adwaita/32x32/legacy/dialog-error.png /usr/share/icons/Adwaita/22x22/legacy/insert-image.png /usr/share/icons/Adwaita/22x22/legacy/go-top.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/24x24/legacy/mail-send-receive.png /usr/share/icons/Adwaita/22x22/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/32x32/legacy/software-update-available.png /usr/share/icons/Adwaita/24x24/legacy/battery-low.png /usr/share/icons/Adwaita/16x16/legacy/format-justify-fill.png /usr/share/icons/Adwaita/16x16/legacy/media-playback-stop.png /usr/share/icons/Adwaita/32x32/legacy/preferences-other.png /usr/share/icons/Adwaita/24x24/legacy/go-previous.png /usr/share/icons/Adwaita/16x16/legacy/applications-accessories.png /usr/share/icons/Adwaita/48x48/legacy/go-previous.png /usr/share/icons/Adwaita/32x32/legacy/face-laugh.png /usr/share/icons/Adwaita/24x24/legacy/face-crying.
 png /usr/share/icons/Adwaita/16x16/legacy/battery-good.png /usr/share/icons/Adwaita/16x16/legacy/user-invisible.png /usr/share/icons/Adwaita/22x22/legacy/appointment-soon.png /usr/share/icons/Adwaita/32x32/legacy/emblem-new.png /usr/share/icons/Adwaita/22x22/legacy/insert-link.png /usr/share/icons/Adwaita/32x32/legacy/insert-link.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/22x22/legacy/mail-unread.png /usr/share/icons/Adwaita/22x22/legacy/face-tired.png /usr/share/icons/Adwaita/16x16/legacy/accessories-calculator.png /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/16x16/legacy/application-exit.png /usr/share/icons/Adwaita/48x48/legacy/applications-utilities.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop.png /usr/share/icons/Adwaita/48x48/legacy/network-error.png /usr/share/icons/Adwaita/22x22/legacy/media-seek-forward.png /usr/share/icons/Adwaita/24x24/legacy/p
 references-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/24x24/legacy/system-file-manager.png /usr/share/icons/Adwaita/16x16/legacy/view-restore.png /usr/share/icons/Adwaita/48x48/legacy/face-cool.png /usr/share/icons/Adwaita/22x22/legacy/face-angry.png /usr/share/icons/Adwaita/16x16/legacy/trophy-silver.png /usr/share/icons/Adwaita/24x24/legacy/window-close.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/22x22/legacy/system-file-manager.png /usr/share/icons/Adwaita/22x22/legacy/battery.png /usr/share/icons/Adwaita/32x32/legacy/face-glasses.png /usr/share/icons/Adwaita/16x16/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/32x32/legacy/zoom-original.png /usr/share/icons/Adwaita/22x22/legacy/format-text-bold.png /usr/share/icons/Adwaita/48x48/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/32x32/legacy/go-last.png /usr/share/icons/Adwaita/16x16/legacy/emblem-system.png /usr/share/icons/Adwaita/16x16/legacy/sof
 tware-update-urgent.png /usr/share/icons/Adwaita/22x22/legacy/emblem-urgent.png /usr/share/icons/Adwaita/22x22/legacy/starred.png /usr/share/icons/Adwaita/22x22/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/32x32/legacy/media-record.png /usr/share/icons/Adwaita/22x22/legacy/face-monkey.png /usr/share/icons/Adwaita/24x24/legacy/view-fullscreen.png /usr/share/icons/Adwaita/48x48/legacy/battery-low-charging.png /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/22x22/legacy/call-stop.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-read.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/48x48/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/24x24/legacy/emblem-documents.png /usr/share/icons/Adwaita/16x16/legacy/edit-select-all.png /usr/share/icons/Adwaita/16x16/legacy/computer.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-theme.png /usr/share/icons/Adw
 aita/32x32/legacy/emblem-urgent.png /usr/share/icons/Adwaita/32x32/legacy/image-missing.png /usr/share/icons/Adwaita/48x48/legacy/trophy-silver.png /usr/share/icons/Adwaita/32x32/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/48x48/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/48x48/legacy/process-stop.png /usr/share/icons/Adwaita/48x48/legacy/battery-full.png /usr/share/icons/Adwaita/48x48/legacy/document-print.png /usr/share/icons/Adwaita/22x22/legacy/system-users.png /usr/share/icons/Adwaita/16x16/legacy/security-high.png /usr/share/icons/Adwaita/16x16/legacy/battery-good-charging.png /usr/share/icons/Adwaita/24x24/legacy/go-next-rtl.png /usr/share/icons/Adwaita/24x24/legacy/process-stop.png /usr/share/icons/Adwaita/16x16/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/24x24/legacy/changes-prevent.png /usr/share/icons/Adwaita/32x32/legacy/input-mouse.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/48x48/leg
 acy/semi-starred.png /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/16x16/legacy/bookmark-new.png /usr/share/icons/Adwaita/16x16/legacy/media-skip-forward.png /usr/share/icons/Adwaita/24x24/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/48x48/legacy/go-next-rtl.png /usr/share/icons/Adwaita/32x32/legacy/face-embarrassed.png /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/16x16/legacy/insert-object.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/24x24/legacy/edit-find-replace.png /usr/share/icons/Adwaita/22x22/legacy/applications-engineering.png /usr/share/icons/Adwaita/48x48/legacy/edit-undo.png /usr/share/icons/Adwaita/24x24/legacy/call-start.png /usr/share/icons/Adwaita/16x16/legacy/preferences-other.png /usr/share/icons/Adwaita/32x32/legacy/task-past-due.png /usr/share/icons/Adwaita/22x22/legacy/emblem-photos.png /us
 r/share/icons/Adwaita/32x32/legacy/media-skip-forward.png /usr/share/icons/Adwaita/48x48/legacy/face-glasses.png /usr/share/icons/Adwaita/32x32/legacy/semi-starred.png /usr/share/icons/Adwaita/22x22/legacy/media-record.png /usr/share/icons/Adwaita/22x22/legacy/process-stop.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/48x48/legacy/applications-science.png /usr/share/icons/Adwaita/32x32/legacy/network-error.png /usr/share/icons/Adwaita/24x24/legacy/dialog-warning.png /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/32x32/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/22x22/legacy/face-angel.png /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-less.png /usr/share/icons/Adwaita/24x24/legacy/user-info.png /usr/share/icons/Adwaita/16x16/legacy/face-laugh.png /usr
 /share/icons/Adwaita/32x32/legacy/media-floppy.png /usr/share/icons/Adwaita/16x16/legacy/security-low.png /usr/share/icons/Adwaita/32x32/legacy/go-up.png /usr/share/icons/Adwaita/32x32/legacy/modem.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-center.png /usr/share/icons/Adwaita/24x24/legacy/help-faq.png /usr/share/icons/Adwaita/24x24/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/32x32/legacy/appointment-missed.png /usr/share/icons/Adwaita/48x48/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/24x24/legacy/face-angel.png /usr/share/icons/Adwaita/48x48/legacy/modem.png /usr/share/icons/Adwaita/16x16/legacy/face-crying.png /usr/share/icons/Adwaita/24x24/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/16x16/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/16x16/legacy/face-smile-big.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-read.png /usr/share/icons/Adwa
 ita/24x24/legacy/media-playback-pause.png /usr/share/icons/Adwaita/24x24/legacy/system-run.png /usr/share/icons/Adwaita/22x22/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/22x22/legacy/mail-signed.png /usr/share/icons/Adwaita/48x48/legacy/drive-multidisk.png /usr/share/icons/Adwaita/22x22/legacy/emblem-documents.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/16x16/legacy/help-browser.png /usr/share/icons/Adwaita/16x16/legacy/pda.png /usr/share/icons/Adwaita/48x48/legacy/user-busy.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/48x48/legacy/call-stop.png /usr/share/icons/Adwaita/16x16/legacy/input-tablet.png /usr/share/icons/Adwaita/22x22/legacy/mail-reply-all.png /usr/share/icons/Adwaita/48x48/legacy/edit-clear-rtl.png /usr/share/icons/Adwaita/48x48/legacy/folder-visiting.png /usr/share/icons/Adwaita/24x24/legacy/user-idle.png /usr/share/icons/Adwaita/32x32/legacy/fac
 e-tired.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-fill.png /usr/share/icons/Adwaita/24x24/legacy/call-stop.png /usr/share/icons/Adwaita/32x32/legacy/applications-engineering.png /usr/share/icons/Adwaita/22x22/legacy/media-flash.png /usr/share/icons/Adwaita/32x32/legacy/system-help.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/24x24/legacy/face-worried.png /usr/share/icons/Adwaita/48x48/legacy/software-update-available.png /usr/share/icons/Adwaita/16x16/legacy/task-due.png /usr/share/icons/Adwaita/16x16/legacy/network-idle.png /usr/share/icons/Adwaita/32x32/legacy/document-page-setup.png /usr/share/icons/Adwaita/16x16/legacy/media-tape.png /usr/share/icons/Adwaita/24x24/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/22x22/legacy/media-tape.png /usr/share/icons/Adwaita/22x22/legacy/software-update-urgent.png /usr/share/icons/Adwaita/48x48/legacy/input-tablet.png /usr/share/icons/Adwaita/48x48/legacy/dialog-passw
 ord.png /usr/share/icons/Adwaita/48x48/legacy/go-down.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/48x48/legacy/security-low.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/22x22/legacy/media-eject.png /usr/share/icons/Adwaita/48x48/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/22x22/legacy/document-revert.png /usr/share/icons/Adwaita/24x24/legacy/starred.png /usr/share/icons/Adwaita/24x24/legacy/format-text-bold.png /usr/share/icons/Adwaita/22x22/legacy/system-lock-screen.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/16x16/legacy/system-lock-screen.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-less.png /usr/share/icons/Adwaita/22x22/legacy/security-low.png /usr/share/icons/Adwaita/22x22/legacy/mail
 -mark-notjunk.png /usr/share/icons/Adwaita/24x24/legacy/document-revert.png /usr/share/icons/Adwaita/48x48/legacy/edit-clear-all.png /usr/share/icons/Adwaita/16x16/legacy/face-glasses.png /usr/share/icons/Adwaita/24x24/legacy/modem.png /usr/share/icons/Adwaita/32x32/legacy/edit-cut.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-center.png /usr/share/icons/Adwaita/48x48/legacy/emblem-favorite.png /usr/share/icons/Adwaita/22x22/legacy/document-open.png /usr/share/icons/Adwaita/8x8/legacy/emblem-default.png /usr/share/icons/Adwaita/16x16/legacy/insert-link.png /usr/share/icons/Adwaita/32x32/legacy/folder-visiting.png /usr/share/icons/Adwaita/48x48/legacy/task-past-due.png /usr/share/icons/Adwaita/24x24/legacy/mail-signed-verified.png /usr/share/icons/Adwaita/24x24/legacy/audio-speakers.png /usr/share/icons/Adwaita/16x16/legacy/face-devilish.png /usr/share/icons/Adwaita/32x32/legacy/system-run.png /usr
 /share/icons/Adwaita/22x22/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/22x22/legacy/document-properties.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-right.png /usr/share/icons/Adwaita/48x48/legacy/security-high.png /usr/share/icons/Adwaita/8x8/legacy/emblem-synchronizing.png /usr/share/icons/Adwaita/22x22/legacy/applications-science.png /usr/share/icons/Adwaita/22x22/legacy/insert-object.png /usr/share/icons/Adwaita/24x24/legacy/edit-paste.png /usr/share/icons/Adwaita/24x24/legacy/security-high.png /usr/share/icons/Adwaita/16x16/legacy/document-open.png /usr/share/icons/Adwaita/32x32/legacy/security-low.png /usr/share/icons/Adwaita/22x22/legacy/zoom-out.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/22x22/legacy/network-transmit.png /usr/share/icons/Adwaita/32x32/legacy/face-raspberry.png /usr/share/icons/Adwaita/16x16/legacy/battery-low.png /usr
 /share/icons/Adwaita/16x16/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/48x48/legacy/face-sad.png /usr/share/icons/Adwaita/24x24/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/16x16/legacy/edit-delete.png /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/32x32/legacy/document-print.png /usr/share/icons/Adwaita/16x16/legacy/modem.png /usr/share/icons/Adwaita/24x24/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/24x24/legacy/image-missing.png /usr/share/icons/Adwaita/24x24/legacy/emblem-downloads.png /usr/share/icons/Adwaita/24x24/legacy/object-rotate-right.png /usr/share/icons/Adwaita/32x32/legacy/face-uncertain.png /usr/share/icons/Adwaita/32x32/legacy/mail-replied.png /usr/share/icons/Adwaita/24x24/legacy/view-sort-descending.png /usr/share/icons/Adwaita/24x24/l
 egacy/tab-new.png /usr/share/icons/Adwaita/22x22/legacy/mail-attachment.png /usr/share/icons/Adwaita/24x24/legacy/folder-new.png /usr/share/icons/Adwaita/16x16/legacy/go-next.png /usr/share/icons/Adwaita/16x16/legacy/list-add.png /usr/share/icons/Adwaita/32x32/legacy/applications-development.png /usr/share/icons/Adwaita/48x48/legacy/help-contents.png /usr/share/icons/Adwaita/32x32/legacy/document-save-as.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/24x24/legacy/go-top.png /usr/share/icons/Adwaita/24x24/legacy/mail-forward.png /usr/share/icons/Adwaita/48x48/legacy/applications-system.png /usr/share/icons/Adwaita/24x24/legacy/face-smirk.png /usr/share/icons/Adwaita/48x48/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/24x24/legacy/mail-signed.png /usr/share/icons/Adwaita/24x24/legacy/media-playback-start.png /usr/share/icons/Adwaita/16x16/legacy/go-jump.png /usr/share/icons/Adwaita/32x32/legacy/network-cellular-connected.png /us
 r/share/icons/Adwaita/22x22/legacy/dialog-information.png /usr/share/icons/Adwaita/24x24/legacy/emblem-new.png /usr/share/icons/Adwaita/32x32/legacy/user-idle.png /usr/share/icons/Adwaita/22x22/legacy/media-skip-backward.png /usr/share/icons/Adwaita/16x16/legacy/face-uncertain.png /usr/share/icons/Adwaita/22x22/legacy/accessories-calculator.png /usr/share/icons/Adwaita/22x22/legacy/list-remove.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/22x22/legacy/zoom-original.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-important.png /usr/share/icons/Adwaita/32x32/legacy/face-smile-big.png /usr/share/icons/Adwaita/24x24/legacy/network-wired.png /usr/share/icons/Adwaita/32x32/legacy/printer-printing.png /usr/share/icons/Adwaita/48x48/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/48x48/legacy/network-offline.png /usr/share/icons/Adwaita/48x48/legacy/emblem-urgent.png /usr/share/icons/Adwaita/16x16/legacy/window-new.png /usr/sh
 are/icons/Adwaita/22x22/legacy/edit-clear-all.png /usr/share/icons/Adwaita/22x22/legacy/document-print-preview.png /usr/share/icons/Adwaita/16x16/legacy/face-raspberry.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/32x32/legacy/insert-image.png /usr/share/icons/Adwaita/48x48/legacy/media-tape.png /usr/share/icons/Adwaita/16x16/legacy/video-display.png /usr/share/icons/Adwaita/24x24/legacy/face-embarrassed.png /usr/share/icons/Adwaita/24x24/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/16x16/legacy/applications-other.png /usr/share/icons/Adwaita/48x48/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/22x22/legacy/face-sad.png /usr/share/icons/Adwaita/32x32/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/48x48/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-low.png /usr/share/icons/Adwaita/16x16/legacy/applications-inte
 rnet.png /usr/share/icons/Adwaita/22x22/legacy/applications-system.png /usr/share/icons/Adwaita/16x16/legacy/object-rotate-right.png /usr/share/icons/Adwaita/48x48/legacy/format-text-direction-rtl.png /usr/share/icons/Adwaita/48x48/legacy/emblem-new.png /usr/share/icons/Adwaita/48x48/legacy/camera-video.png /usr/share/icons/Adwaita/48x48/legacy/audio-volume-low.png /usr/share/icons/Adwaita/48x48/legacy/applications-games.png /usr/share/icons/Adwaita/16x16/legacy/format-justify-left.png /usr/share/icons/Adwaita/16x16/legacy/go-last.png /usr/share/icons/Adwaita/32x32/legacy/face-worried.png /usr/share/icons/Adwaita/24x24/legacy/input-dialpad.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/24x24/legacy/list-add.png /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/16x16/legacy/applications-utilities.png /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor.png /usr/share/icons
 /Adwaita/24x24/legacy/face-laugh.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/22x22/legacy/edit-find-replace.png /usr/share/icons/Adwaita/32x32/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/16x16/legacy/mail-reply-all.png /usr/share/icons/Adwaita/48x48/legacy/web-browser.png /usr/share/icons/Adwaita/22x22/legacy/face-smile.png /usr/share/icons/Adwaita/22x22/legacy/folder-visiting.png /usr/share/icons/Adwaita/48x48/legacy/emblem-system.png /usr/share/icons/Adwaita/22x22/legacy/go-next.png /usr/share/icons/Adwaita/16x16/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/24x24/legacy/zoom-out.png /usr/share/icons/Adwaita/16x16/legacy/process-stop.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/48x48/legacy/edit-cut.png /usr/share/icons/Adwaita/48x48/legacy/video-display.png /usr/share/icons/Adwaita/22x22/legacy/edit-redo.png /usr/share/icons/Adwaita/48x48/legacy/inp
 ut-dialpad.png /usr/share/icons/Adwaita/24x24/legacy/edit-delete.png /usr/share/icons/Adwaita/16x16/legacy/appointment-soon.png /usr/share/icons/Adwaita/24x24/legacy/emblem-generic.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/32x32/legacy/applications-games.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/16x16/legacy/appointment-missed.png /usr/share/icons/Adwaita/24x24/legacy/system-search.png /usr/share/icons/Adwaita/22x22/legacy/document-save.png /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network.png /usr/share/icons/Adwaita/32x32/legacy/face-smile.png /usr/share/icons/Adwaita/32x32/legacy/go-first-rtl.png /usr/share/icons/Adwaita/16x16/legacy/system-search.png /usr/share/icons/Adwaita/22x22/legacy/edit-undo.png /usr/share/icons/Adwaita/22x22/legacy/audio-speakers.png /usr/share/icons/Adwaita/32x32/legacy/network-wired.png /usr/share/icons/Adwaita/22x22/legacy/zoo
 m-fit-best.png /usr/share/icons/Adwaita/16x16/legacy/input-keyboard.png /usr/share/icons/Adwaita/22x22/legacy/applications-utilities.png /usr/share/icons/Adwaita/32x32/legacy/battery-low-charging.png /usr/share/icons/Adwaita/16x16/legacy/format-text-italic.png /usr/share/icons/Adwaita/24x24/legacy/applications-science.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/32x32/legacy/address-book-new.png /usr/share/icons/Adwaita/16x16/legacy/media-playback-pause.png /usr/share/icons/Adwaita/48x48/legacy/mail-attachment.png /usr/share/icons/Adwaita/24x24/legacy/user-available.png /usr/share/icons/Adwaita/24x24/legacy/ac-adapter.png /usr/share/icons/Adwaita/32x32/legacy/process-stop.png /usr/share/icons/Adwaita/32x32/legacy/document-open.png /usr/share/icons/Adwaita/24x24/legacy/document-save-as.png /usr/share/icons/Adwaita/32x32/legacy/drive-optical.png /usr/share/icons/Adwaita/32x32/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/48x48
 /legacy/system-file-manager.png /usr/share/icons/Adwaita/24x24/legacy/object-rotate-left.png /usr/share/icons/Adwaita/16x16/legacy/system-log-out.png /usr/share/icons/Adwaita/32x32/legacy/media-seek-forward.png /usr/share/icons/Adwaita/24x24/legacy/zoom-fit-best.png /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map.png /usr/share/icons/Adwaita/32x32/legacy/list-add.png /usr/share/icons/Adwaita/16x16/legacy/media-record.png /usr/share/icons/Adwaita/24x24/legacy/security-low.png /usr/share/icons/Adwaita/24x24/legacy/emblem-favorite.png /usr/share/icons/Adwaita/24x24/legacy/face-devilish.png /usr/share/icons/Adwaita/16x16/legacy/go-bottom.png /usr/share/icons/Adwaita/48x48/legacy/phone.png /usr/share/icons/Adwaita/48x48/legacy/face-tired.png /usr/share/icons/Adwaita/22x22/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/32x32/legacy/battery.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/32x32/legacy/prefere
 nces-desktop.png /usr/share/icons/Adwaita/48x48/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/48x48/legacy/multimedia-player.png /usr/share/icons/Adwaita/32x32/legacy/applications-other.png /usr/share/icons/Adwaita/16x16/legacy/network-offline.png /usr/share/icons/Adwaita/24x24/legacy/applications-utilities.png /usr/share/icons/Adwaita/48x48/legacy/non-starred.png /usr/share/icons/Adwaita/32x32/legacy/trophy-silver.png /usr/share/icons/Adwaita/32x32/legacy/document-revert.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/24x24/legacy/media-flash.png /usr/share/icons/Adwaita/48x48/legacy/pda.png /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/48x48/legacy/input-touchpad.png /usr/share/icons/Adwaita/22x22/legacy/audio-card.png /usr/share/icons/Adwaita/16x16/legacy/go-home.png /usr/share/icons/Adwaita/48x48/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/48x48/legacy/emblem-impo
 rtant.png /usr/share/icons/Adwaita/24x24/legacy/applications-graphics.png /usr/share/icons/Adwaita/16x16/legacy/emblem-favorite.png /usr/share/icons/Adwaita/24x24/legacy/applications-internet.png /usr/share/icons/Adwaita/24x24/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/16x16/legacy/applications-science.png /usr/share/icons/Adwaita/22x22/legacy/emblem-mail.png /usr/share/icons/Adwaita/22x22/legacy/insert-text.png /usr/share/icons/Adwaita/16x16/legacy/web-browser.png /usr/share/icons/Adwaita/48x48/legacy/list-remove.png /usr/share/icons/Adwaita/22x22/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/22x22/legacy/help-browser.png /usr/share/icons/Adwaita/32x32/legacy/starred.png /usr/share/icons/Adwaita/22x22/legacy/camera-web.png /usr/share/icons/Adwaita/24x24/legacy/go-first-rtl.png /usr/share/icons/Adwaita/22x22/legacy/accessories-character-map.png /usr/share/icons/Adwaita/24x24/legacy/edit-cut
 .png /usr/share/icons/Adwaita/32x32/legacy/audio-speakers.png /usr/share/icons/Adwaita/32x32/legacy/mail-message-new.png /usr/share/icons/Adwaita/48x48/legacy/battery-full-charging.png /usr/share/icons/Adwaita/32x32/legacy/emblem-system.png /usr/share/icons/Adwaita/16x16/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/22x22/legacy/battery-full.png /usr/share/icons/Adwaita/22x22/legacy/applications-accessories.png /usr/share/icons/Adwaita/48x48/legacy/system-users.png /usr/share/icons/Adwaita/16x16/legacy/scanner.png /usr/share/icons/Adwaita/16x16/legacy/changes-prevent.png /usr/share/icons/Adwaita/24x24/legacy/ebook-reader.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/48x48/legacy/document-save.png /usr/share/icons/Adwaita/16x16/legacy/dialog-question.png /usr/share/icons/Adwaita/22x22/legacy/document-new.png /usr/share/icons/Adwaita/24x24/legacy/face-smile.png /usr/share/icons/Adwaita/48x48/legacy/network-receive.png 
 /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/16x16/legacy/go-previous.png /usr/share/icons/Adwaita/22x22/legacy/system-shutdown.png /usr/share/icons/Adwaita/48x48/legacy/audio-speakers.png /usr/share/icons/Adwaita/48x48/legacy/object-rotate-left.png /usr/share/icons/Adwaita/48x48/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/24x24/legacy/software-update-available.png /usr/share/icons/Adwaita/48x48/legacy/battery-empty.png /usr/share/icons/Adwaita/32x32/legacy/media-playback-pause.png /usr/share/icons/Adwaita/16x16/legacy/network-transmit.png /usr/share/icons/Adwaita/48x48/legacy/media-record.png /usr/share/icons/Adwaita/16x16/legacy/printer-error.png /usr/share/icons/Adwaita/24x24/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/32x32/legacy/go-top.png /usr/share/icons/A
 dwaita/48x48/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal.png /usr/share/icons/Adwaita/22x22/legacy/modem.png /usr/share/icons/Adwaita/16x16/legacy/battery-caution.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/22x22/legacy/audio-volume-low.png /usr/share/icons/Adwaita/48x48/legacy/emblem-desktop.png /usr/share/icons/Adwaita/32x32/legacy/insert-text.png /usr/share/icons/Adwaita/24x24/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/48x48/legacy/system-shutdown.png /usr/share/icons/Adwaita/22x22/legacy/changes-prevent.png /usr/share/icons/Adwaita/24x24/legacy/face-wink.png /usr/share/icons/Adwaita/48x48/legacy/computer-fail.png /usr/share/icons/Adwaita/24x24/legacy/system-shutdown.png /usr/share/icons/Adwaita/24x24/legacy/face-raspberry.png /usr/share/icons/Adwaita/32x32/legacy/face-sad.
 png /usr/share/icons/Adwaita/48x48/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/32x32/legacy/zoom-out.png /usr/share/icons/Adwaita/48x48/legacy/task-due.png /usr/share/icons/Adwaita/22x22/legacy/applications-office.png /usr/share/icons/Adwaita/24x24/legacy/face-smile-big.png /usr/share/icons/Adwaita/48x48/legacy/go-home.png /usr/share/icons/Adwaita/48x48/legacy/media-flash.png /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/16x16/legacy/mark-location.png /usr/share/icons/Adwaita/48x48/legacy/go-last.png /usr/share/icons/Adwaita/32x32/legacy/trophy-bronze.png /usr/share/icons/Adwaita/16x16/legacy/battery-full-charging.png /usr/share/icons/Adwaita/48x48/legacy/emote-love.png /usr/share/icons/Adwaita/16x16/legacy/folder-visiting.png /usr/share/icons/Adwaita/22x22/legacy/utilities-terminal.png /usr/sha
 re/icons/Adwaita/24x24/legacy/face-monkey.png /usr/share/icons/Adwaita/16x16/legacy/go-next-rtl.png /usr/share/icons/Adwaita/16x16/legacy/face-plain.png /usr/share/icons/Adwaita/22x22/legacy/face-embarrassed.png /usr/share/icons/Adwaita/22x22/legacy/network-vpn.png /usr/share/icons/Adwaita/32x32/legacy/face-kiss.png /usr/share/icons/Adwaita/16x16/legacy/help-faq.png /usr/share/icons/Adwaita/24x24/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/16x16/legacy/address-book-new.png /usr/share/icons/Adwaita/16x16/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/16x16/legacy/changes-allow.png /usr/share/icons/Adwaita/16x16/legacy/edit-cut.png /usr/share/icons/Adwaita/22x22/legacy/battery-good-charging.png /usr/share/icons/Adwaita/24x24/legacy/go-next.png /usr/share/icons/Adwaita/32x32/legacy/media-skip-backward.png /usr/share/icons/Adwaita/48x48/legacy/applications-accessories.png /usr/share/icons/Adwaita/48x48/legacy/emblem-package.png /usr/share/icons/Adwaita/16x16/legacy/m
 ail-signed.png /usr/share/icons/Adwaita/48x48/legacy/user-offline.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-more.png /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-low.png /usr/share/icons/Adwaita/32x32/legacy/security-high.png /usr/share/icons/Adwaita/22x22/legacy/system-help.png /usr/share/icons/Adwaita/22x22/legacy/battery-low.png /usr/share/icons/Adwaita/32x32/legacy/battery-low.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/32x32/legacy/window-close.png /usr/share/icons/Adwaita/24x24/legacy/edit-redo.png /usr/share/icons/Adwaita/16x16/legacy/document-open-recent.png /usr/share/icons/Adwaita/22x22/legacy/pda.png /usr/share/icons/Adwaita/48x48/legacy/call-start.png /usr/share/icons/Adwaita/22x22/legacy/battery-good.png /usr/share/icons/Adwaita/48x48/legacy/go-up.png /usr/share/icons/Adwaita/22x22/legacy/face-surprise.png /usr/share/icons/Adwaita/2
 2x22/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/32x32/legacy/applications-system.png /usr/share/icons/Adwaita/22x22/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/48x48/legacy/computer.png /usr/share/icons/Adwaita/24x24/legacy/system-users.png /usr/share/icons/Adwaita/48x48/legacy/help-about.png /usr/share/icons/Adwaita/16x16/legacy/call-start.png /usr/share/icons/Adwaita/22x22/legacy/edit-find.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-display.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-sharing.png /usr/share/icons/Adwaita/32x32/legacy/help-browser.png /usr/share/icons/Adwaita/22x22/legacy/document-print.png /usr/share/icons/Adwaita/16x16/legacy/object-flip-horizontal.png /usr/share/icons/Adwaita/24x24/legacy/media-seek-backward.png /usr/share/icons/Adwaita/24x24/legacy/software-update-urgent.png /usr/share/icons/Adwaita/22x22/legacy/call-start.png /u
 sr/share/icons/Adwaita/48x48/legacy/face-smile.png /usr/share/icons/Adwaita/48x48/legacy/view-refresh.png /usr/share/icons/Adwaita/22x22/legacy/video-display.png /usr/share/icons/Adwaita/48x48/legacy/window-new.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-search.png /usr/share/icons/Adwaita/48x48/legacy/camera-web.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop.png /usr/share/icons/Adwaita/48x48/legacy/document-open.png /usr/share/icons/Adwaita/48x48/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/48x48/legacy/user-invisible.png /usr/share/icons/Adwaita/32x32/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/22x22/legacy/face-smirk.png /usr/share/icons/Adwaita/48x48/legacy/document-save-as.png /usr/share/icons/Adwaita/22x22/legacy/input-touchpad.png /usr/share/icons/Adwaita/16x16/legacy/help-contents.png /usr/share/icons/Adwaita/48x48/legacy/contact-new.png /usr/share/icons/Adwaita/16x16/legacy/emblem-new.png /usr/share/icons/Adwaita/22
 x22/legacy/appointment-new.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/48x48/legacy/printer-printing.png /usr/share/icons/Adwaita/22x22/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/24x24/legacy/mail-message-new.png /usr/share/icons/Adwaita/16x16/legacy/face-angel.png /usr/share/icons/Adwaita/48x48/legacy/face-smile-big.png /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor.png /usr/share/icons/Adwaita/48x48/legacy/insert-link.png /usr/share/icons/Adwaita/24x24/legacy/battery-good-charging.png /usr/share/icons/Adwaita/24x24/legacy/document-open-recent.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/22x22/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/16x16/legacy/document-new.png /usr/share/icons/Adwaita/48x48/legacy/face-crying.png /usr/share/icons/Adwaita/16x16/legacy/network-vpn.png /usr/share/icons/Adwaita/22x22/legacy/go-d
 own.png /usr/share/icons/Adwaita/48x48/legacy/camera-photo.png /usr/share/icons/Adwaita/32x32/legacy/emblem-package.png /usr/share/icons/Adwaita/24x24/legacy/go-jump.png /usr/share/icons/Adwaita/16x16/legacy/user-info.png /usr/share/icons/Adwaita/32x32/legacy/appointment-soon.png /usr/share/icons/Adwaita/16x16/legacy/zoom-in.png /usr/share/icons/Adwaita/24x24/legacy/dialog-error.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-important.png /usr/share/icons/Adwaita/48x48/legacy/face-monkey.png /usr/share/icons/Adwaita/32x32/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/48x48/legacy/face-angel.png /usr/share/icons/Adwaita/22x22/legacy/user-busy.png /usr/share/icons/Adwaita/32x32/legacy/emblem-documents.png /usr/share/icons/Adwaita/22x22/legacy/network-offline.png /usr/share/icons/Adwaita/16x16/legacy/face-angry.png /usr/share/icons/Adwaita/32x32/legacy/network-wireless.png /usr/share/icons/Adwaita/16x16/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/16x16/legacy/media
 -skip-backward.png /usr/share/icons/Adwaita/16x16/legacy/view-fullscreen.png /usr/share/icons/Adwaita/22x22/legacy/battery-full-charged.png /usr/share/icons/Adwaita/32x32/legacy/network-offline.png /usr/share/icons/Adwaita/22x22/legacy/ebook-reader.png /usr/share/icons/Adwaita/32x32/legacy/media-flash.png /usr/share/icons/Adwaita/22x22/legacy/dialog-warning.png /usr/share/icons/Adwaita/32x32/legacy/camera-web.png /usr/share/icons/Adwaita/48x48/legacy/appointment-missed.png /usr/share/icons/Adwaita/48x48/legacy/user-available.png /usr/share/icons/Adwaita/16x16/legacy/emblem-default.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network.png /usr/share/icons/Adwaita/32x32/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/16x16/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/16x16/legacy/mail-read.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network.png /usr/share/icons/Adwaita/16x16/legacy/edit-undo-rtl.png /usr/share/icons/Adwaita/
 16x16/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/22x22/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/16x16/legacy/emblem-documents.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-read.png /usr/share/icons/Adwaita/24x24/legacy/edit-copy.png /usr/share/icons/Adwaita/24x24/legacy/mail-send.png /usr/share/icons/Adwaita/32x32/legacy/applications-graphics.png /usr/share/icons/Adwaita/32x32/legacy/go-home.png /usr/share/icons/Adwaita/32x32/legacy/user-invisible.png /usr/share/icons/Adwaita/32x32/legacy/applications-science.png /usr/share/icons/Adwaita/48x48/legacy/system-search.png /usr/share/icons/Adwaita/24x24/legacy/network-offline.png /usr/share/icons/Adwaita/48x48/legacy/network-wired.png /usr/share/icons/Adwaita/32x32/legacy/go-next.png /usr/share/icons/Adwaita/32x32/legacy/input-keyboard.png /usr/share/icons/Adwaita/32x32/legacy/m
 ultimedia-player.png /usr/share/icons/Adwaita/24x24/legacy/preferences-other.png /usr/share/icons/Adwaita/16x16/legacy/emblem-important.png /usr/share/icons/Adwaita/48x48/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/16x16/legacy/battery-low-charging.png /usr/share/icons/Adwaita/16x16/legacy/user-away.png /usr/share/icons/Adwaita/32x32/legacy/system-search.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/22x22/legacy/input-keyboard.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-accessibility.png /usr/share/icons/Adwaita/22x22/legacy/face-cool.png /usr/share/icons/Adwaita/32x32/legacy/applications-accessories.png /usr/share/icons/Adwaita/32x32/legacy/media-tape.png /usr/share/icons/Adwaita/48x48/legacy/bookmark-new.png /usr/share/icons/Adwaita/24x24/legacy/task-due.png /usr/share/icons/Adwaita/16x16/legacy/zoom-original.png /usr/share/icons/Adwaita/16x16/legacy/edit-redo.png /usr/share/icons/Adwaita/48x48/legac
 y/trophy-gold.png /usr/share/icons/Adwaita/22x22/legacy/help-about.png /usr/share/icons/Adwaita/32x32/legacy/application-exit.png /usr/share/icons/Adwaita/24x24/legacy/battery-full-charged.png /usr/share/icons/Adwaita/22x22/legacy/emblem-package.png /usr/share/icons/Adwaita/24x24/legacy/network-idle.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-high.png /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal.png /usr/share/icons/Adwaita/48x48/legacy/face-smirk.png /usr/share/icons/Adwaita/24x24/legacy/document-print.png /usr/share/icons/Adwaita/22x22/legacy/printer-printing.png /usr/share/icons/Adwaita/16x16/legacy/emblem-urgent.png /usr/share/icons/Adwaita/16x16/legacy/audio-card.png /usr/share/icons/Adwaita/32x32/legacy/edit-find.png /usr/share/icons/Adwaita/16x16/legacy/face-cool.png /usr/share/icons/Adwaita/24x24/legacy/format-text-italic.png /usr/share/icons/Adwaita/48x48/legacy/dialog-question.png /usr/share/icons/Adwaita/24x24/legacy/mail-read.png /usr/share/icons/A
 dwaita/22x22/legacy/folder-new.png /usr/share/icons/Adwaita/32x32/legacy/computer.png /usr/share/icons/Adwaita/24x24/legacy/document-print-preview.png /usr/share/icons/Adwaita/22x22/legacy/scanner.png /usr/share/icons/Adwaita/22x22/legacy/format-justify-right.png /usr/share/icons/Adwaita/32x32/legacy/media-playlist-shuffle.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/16x16/legacy/format-text-bold.png /usr/share/icons/Adwaita/16x16/legacy/audio-speakers.png /usr/share/icons/Adwaita/48x48/legacy/input-keyboard.png /usr/share/icons/Adwaita/32x32/legacy/format-justify-left.png /usr/share/icons/Adwaita/16x16/legacy/edit-undo.png /usr/share/icons/Adwaita/22x22/legacy/multimedia-player.png /usr/share/icons/Adwaita/22x22/legacy/tools-check-spelling.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-less.png /usr/share/icons/Adwaita/32x32/legacy/emblem-photos.png /usr/share/icons/Adwaita/16x16/legacy/object-rotate-left.png /usr/share/icons/Ad
 waita/48x48/legacy/application-exit.png /usr/share/icons/Adwaita/24x24/legacy/network-wireless.png /usr/share/icons/Adwaita/24x24/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/22x22/legacy/document-save-as.png /usr/share/icons/Adwaita/16x16/legacy/edit-find-replace.png /usr/share/icons/Adwaita/22x22/legacy/network-receive.png /usr/share/icons/Adwaita/48x48/legacy/appointment-new.png /usr/share/icons/Adwaita/48x48/legacy/go-first.png /usr/share/icons/Adwaita/32x32/legacy/edit-clear-all.png /usr/share/icons/Adwaita/16x16/legacy/media-flash.png /usr/share/icons/Adwaita/16x16/legacy/image-missing.png /usr/share/icons/Adwaita/16x16/legacy/dialog-password.png /usr/share/icons/Adwaita/16x16/legacy/help-about.png /usr/share/icons/Adwaita/32x32/legacy/trophy-gold.png /usr/share/icons/Adwaita/48x48/legacy/view-fullscreen.png /usr/share/icons/Adwaita/24x24/legacy/scanner.png /usr/share/icons/Adwaita/22x22/legacy/task-due.png /usr/share/icons/Adwaita/22x22/legacy/help-content
 s.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/48x48/legacy/printer-error.png /usr/share/icons/Adwaita/32x32/legacy/emblem-generic.png /usr/share/icons/Adwaita/22x22/legacy/system-log-out.png /usr/share/icons/Adwaita/48x48/legacy/media-eject.png /usr/share/icons/Adwaita/48x48/legacy/emblem-default.png /usr/share/icons/Adwaita/32x32/legacy/mail-send-receive.png /usr/share/icons/Adwaita/48x48/legacy/emblem-generic.png /usr/share/icons/Adwaita/32x32/legacy/audio-card.png /usr/share/icons/Adwaita/16x16/legacy/input-mouse.png /usr/share/icons/Adwaita/48x48/legacy/go-jump.png /usr/share/icons/Adwaita/32x32/legacy/system-software-install.png /usr/share/icons/Adwaita/24x24/legacy/face-plain.png /usr/share/icons/Adwaita/24x24/legacy/go-last-rtl.png /usr/share/icons/Adwaita/16x16/legacy/battery.png /usr/share/icons/Adwaita/48x48/legacy/drive-optical.png /usr/share/icons/Adwaita/16x16/legacy/edit-clear.png /usr/share/icons/Adwaita/22x22/le
 gacy/media-floppy.png /usr/share/icons/Adwaita/22x22/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/22x22/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/32x32/legacy/mail-reply-sender.png /usr/share/icons/Adwaita/24x24/legacy/printer-error.png /usr/share/icons/Adwaita/16x16/legacy/applications-games.png /usr/share/icons/Adwaita/48x48/legacy/media-skip-forward.png /usr/share/icons/Adwaita/32x32/legacy/system-shutdown.png /usr/share/icons/Adwaita/16x16/legacy/go-last-rtl.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-privacy.png /usr/share/icons/Adwaita/32x32/legacy/edit-copy.png /usr/share/icons/Adwaita/32x32/legacy/format-text-italic.png /usr/share/icons/Adwaita/22x22/legacy/system-search.png /usr/share/icons/Adwaita/16x16/legacy/network-receive.png /usr/share/icons/Adwaita/24x24/legacy/face-cool.png /usr/share/icons/Adwaita/32x32/legacy/dialog-warning.png /usr/share/icons/Adwaita/22x22/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/48x48/
 legacy/media-playback-pause.png /usr/share/icons/Adwaita/32x32/legacy/software-update-urgent.png /usr/share/icons/Adwaita/32x32/legacy/window-new.png /usr/share/icons/Adwaita/24x24/legacy/go-last.png /usr/share/icons/Adwaita/32x32/legacy/help-faq.png /usr/share/icons/Adwaita/16x16/legacy/go-first-rtl.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/32x32/legacy/user-busy.png /usr/share/icons/Adwaita/48x48/legacy/scanner.png /usr/share/icons/Adwaita/22x22/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/24x24/legacy/zoom-original.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications.png /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map.png /usr/share/icons/Adwaita/22x22/legacy/face-kiss.png /usr/share/icons/Adwaita/22x22/legacy/network-error.png /usr/share/icons/Adwaita/48x48/legacy/system-software-update.png /usr/share/icons/Adwaita/22x22/legacy/view-sort-descending.png /usr/share
 /icons/Adwaita/32x32/legacy/camera-photo.png /usr/share/icons/Adwaita/32x32/legacy/media-seek-backward.png /usr/share/icons/Adwaita/16x16/legacy/face-embarrassed.png /usr/share/icons/Adwaita/24x24/legacy/system-log-out.png /usr/share/icons/Adwaita/48x48/legacy/help-browser.png /usr/share/icons/Adwaita/48x48/legacy/battery-caution.png /usr/share/icons/Adwaita/22x22/legacy/drive-optical.png /usr/share/icons/Adwaita/16x16/legacy/emblem-photos.png /usr/share/icons/Adwaita/16x16/legacy/face-sick.png /usr/share/icons/Adwaita/16x16/legacy/document-page-setup.png /usr/share/icons/Adwaita/24x24/legacy/user-busy.png /usr/share/icons/Adwaita/48x48/legacy/dialog-warning.png /usr/share/icons/Adwaita/32x32/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/32x32/legacy/network-receive.png /usr/share/icons/Adwaita/16x16/legacy/list-remove.png /usr/share/icons/Adwaita/22x22/legacy/application-exit.png /usr/share/icons/Adwaita/32x32/legacy/go-bottom.png /usr/share/icons/Adwaita/16x16/l
 egacy/preferences-desktop-keyboard.png /usr/share/icons/Adwaita/16x16/legacy/network-wireless.png /usr/share/icons/Adwaita/48x48/legacy/emblem-documents.png /usr/share/icons/Adwaita/32x32/legacy/edit-find-replace.png /usr/share/icons/Adwaita/32x32/legacy/battery-empty.png /usr/share/icons/Adwaita/22x22/legacy/media-seek-backward.png /usr/share/icons/Adwaita/24x24/legacy/trophy-bronze.png /usr/share/icons/Adwaita/48x48/legacy/software-update-urgent.png /usr/share/icons/Adwaita/16x16/legacy/go-down.png /usr/share/icons/Adwaita/24x24/legacy/bookmark-new.png /usr/share/icons/Adwaita/32x32/legacy/input-tablet.png /usr/share/icons/Adwaita/48x48/legacy/format-text-italic.png /usr/share/icons/Adwaita/22x22/legacy/face-raspberry.png /usr/share/icons/Adwaita/24x24/legacy/emblem-mail.png /usr/share/icons/Adwaita/22x22/legacy/edit-paste.png /usr/share/icons/Adwaita/22x22/legacy/network-wireless.png /usr/share/icons/Adwaita/22x22/legacy/network-cellular-connected.png /usr/share/icons/Adwaita/22x
 22/legacy/preferences-desktop-remote-desktop.png /usr/share/icons/Adwaita/24x24/legacy/printer-printing.png /usr/share/icons/Adwaita/22x22/legacy/face-wink.png /usr/share/icons/Adwaita/24x24/legacy/edit-select-all.png /usr/share/icons/Adwaita/16x16/legacy/mail-attachment.png /usr/share/icons/Adwaita/24x24/legacy/face-glasses.png /usr/share/icons/Adwaita/22x22/legacy/printer-error.png /usr/share/icons/Adwaita/22x22/legacy/emblem-default.png /usr/share/icons/Adwaita/24x24/legacy/view-restore.png /usr/share/icons/Adwaita/32x32/legacy/object-rotate-right.png /usr/share/icons/Adwaita/24x24/legacy/battery-full-charging.png /usr/share/icons/Adwaita/24x24/legacy/document-properties.png /usr/share/icons/Adwaita/16x16/legacy/battery-full.png /usr/share/icons/Adwaita/32x32/legacy/document-new.png /usr/share/icons/Adwaita/22x22/legacy/tab-new.png /usr/share/icons/Adwaita/32x32/legacy/battery-caution-charging.png /usr/share/icons/Adwaita/16x16/legacy/battery-caution-charging.png /usr/share/icons
 /Adwaita/22x22/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/32x32/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/22x22/legacy/accessories-dictionary.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system.png /usr/share/icons/Adwaita/24x24/legacy/pda.png /usr/share/icons/Adwaita/22x22/legacy/audio-volume-high.png /usr/share/icons/Adwaita/48x48/legacy/mail-unread.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-peripherals.png /usr/share/icons/Adwaita/22x22/legacy/phone.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/16x16/legacy/starred.png /usr/share/icons/Adwaita/16x16/legacy/mail-signed-verified.png /usr/share/icons/Adwaita/22x22/legacy/object-rotate-left.png /usr/share/icons/Adwaita/22x22/legacy/system-run.png /usr/share/icons/Adwaita/22x22/legacy/go-
 next-rtl.png /usr/share/icons/Adwaita/32x32/legacy/go-next-rtl.png /usr/share/icons/Adwaita/32x32/legacy/go-down.png /usr/share/icons/Adwaita/32x32/legacy/object-flip-vertical.png /usr/share/icons/Adwaita/24x24/legacy/emblem-photos.png /usr/share/icons/Adwaita/32x32/legacy/user-offline.png /usr/share/icons/Adwaita/24x24/legacy/battery-missing.png /usr/share/icons/Adwaita/48x48/legacy/face-uncertain.png /usr/share/icons/Adwaita/16x16/legacy/mail-forward.png /usr/share/icons/Adwaita/48x48/legacy/face-surprise.png /usr/share/icons/Adwaita/22x22/legacy/task-past-due.png /usr/share/icons/Adwaita/16x16/legacy/format-indent-less-rtl.png /usr/share/icons/Adwaita/16x16/legacy/system-software-update.png /usr/share/icons/Adwaita/24x24/legacy/camera-video.png /usr/share/icons/Adwaita/22x22/legacy/help-faq.png /usr/share/icons/Adwaita/24x24/legacy/view-refresh.png /usr/share/icons/Adwaita/16x16/legacy/emote-love.png /usr/share/icons/Adwaita/22x22/legacy/emblem-web.png /usr/share/icons/Adwaita/16
 x16/legacy/folder-new.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-fill.png /usr/share/icons/Adwaita/48x48/legacy/face-angry.png /usr/share/icons/Adwaita/32x32/legacy/dialog-information.png /usr/share/icons/Adwaita/24x24/legacy/document-open.png /usr/share/icons/Adwaita/16x16/legacy/media-seek-backward.png /usr/share/icons/Adwaita/24x24/legacy/video-display.png /usr/share/icons/Adwaita/48x48/legacy/audio-volume-muted.png /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-left.png /usr/share/icons/Adwaita/22x22/legacy/preferences-system-windows.png /usr/share/icons/Adwaita/22x22/legacy/face-crying.png /usr/share/icons/Adwaita/32x32/legacy/battery-good-charging.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/32x32/legacy/call-stop.png /usr/share/icons/Adwaita/22x22/legacy/applications-games.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system.png 
 /usr/share/icons/Adwaita/16x16/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/16x16/legacy/insert-image.png /usr/share/icons/Adwaita/32x32/legacy/view-refresh.png /usr/share/icons/Adwaita/48x48/legacy/object-rotate-right.png /usr/share/icons/Adwaita/32x32/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/24x24/legacy/network-vpn.png /usr/share/icons/Adwaita/24x24/legacy/input-keyboard.png /usr/share/icons/Adwaita/24x24/legacy/face-surprise.png /usr/share/icons/Adwaita/24x24/legacy/trophy-silver.png /usr/share/icons/Adwaita/48x48/legacy/zoom-in.png /usr/share/icons/Adwaita/22x22/legacy/input-mouse.png /usr/share/icons/Adwaita/48x48/legacy/emblem-downloads.png /usr/share/icons/Adwaita/24x24/legacy/go-up.png /usr/share/icons/Adwaita/22x22/legacy/media-playback-pause.png /usr/share/icons/Adwaita/16x16/legacy/drive-multidisk.png /usr/share/icons/Adwaita/48x48/legacy/folder-new.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-theme.png /usr/share/icons/Ad
 waita/22x22/legacy/go-home.png /usr/share/icons/Adwaita/8x8/legacy/emblem-new.png /usr/share/icons/Adwaita/32x32/legacy/document-save.png /usr/share/icons/Adwaita/24x24/legacy/zoom-in.png /usr/share/icons/Adwaita/48x48/legacy/edit-find-replace.png /usr/share/icons/Adwaita/48x48/legacy/battery-good-charging.png /usr/share/icons/Adwaita/22x22/legacy/user-idle.png /usr/share/icons/Adwaita/22x22/legacy/list-add.png /usr/share/icons/Adwaita/16x16/legacy/document-save.png /usr/share/icons/Adwaita/16x16/legacy/system-run.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale.png /usr/share/icons/Adwaita/22x22/legacy/emblem-new.png /usr/share/icons/Adwaita/48x48/legacy/face-plain.png /usr/share/icons/Adwaita/24x24/legacy/application-exit.png /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/24x24/legacy/help-about.png /usr/share/icons/Adwaita/48x48/legacy/network-v
 pn.png /usr/share/icons/Adwaita/22x22/legacy/emblem-generic.png /usr/share/icons/Adwaita/32x32/legacy/scanner.png /usr/share/icons/Adwaita/24x24/legacy/computer-fail.png /usr/share/icons/Adwaita/22x22/legacy/mail-read.png /usr/share/icons/Adwaita/32x32/legacy/face-sick.png /usr/share/icons/Adwaita/22x22/legacy/mail-message-new.png /usr/share/icons/Adwaita/24x24/legacy/input-tablet.png /usr/share/icons/Adwaita/32x32/legacy/ebook-reader.png /usr/share/icons/Adwaita/32x32/legacy/accessories-calculator.png /usr/share/icons/Adwaita/48x48/legacy/appointment-soon.png /usr/share/icons/Adwaita/22x22/legacy/emblem-downloads.png /usr/share/icons/Adwaita/32x32/legacy/video-display.png /usr/share/icons/Adwaita/32x32/legacy/face-smirk.png /usr/share/icons/Adwaita/16x16/legacy/go-top.png /usr/share/icons/Adwaita/16x16/legacy/battery-missing.png /usr/share/icons/Adwaita/24x24/legacy/emblem-web.png /usr/share/icons/Adwaita/22x22/legacy/battery-caution.png /usr/share/icons/Adwaita/48x48/legacy/mail-r
 eplied.png /usr/share/icons/Adwaita/24x24/legacy/insert-object.png /usr/share/icons/Adwaita/16x16/legacy/system-users.png /usr/share/icons/Adwaita/16x16/legacy/dialog-warning.png /usr/share/icons/Adwaita/48x48/legacy/network-transmit-receive.png /usr/share/icons/Adwaita/24x24/legacy/emblem-important.png /usr/share/icons/Adwaita/32x32/legacy/battery-missing.png /usr/share/icons/Adwaita/16x16/legacy/format-justify-center.png /usr/share/icons/Adwaita/48x48/legacy/document-print-preview.png /usr/share/icons/Adwaita/24x24/legacy/face-angry.png /usr/share/icons/Adwaita/22x22/legacy/go-last.png /usr/share/icons/Adwaita/22x22/legacy/face-worried.png /usr/share/icons/Adwaita/32x32/legacy/mail-forward.png /usr/share/icons/Adwaita/22x22/legacy/zoom-in.png /usr/share/icons/Adwaita/16x16/legacy/document-revert.png /usr/share/icons/Adwaita/24x24/legacy/system-software-update.png /usr/share/icons/Adwaita/22x22/legacy/window-new.png /usr/share/icons/Adwaita/24x24/legacy/emblem-system.png /usr/share
 /icons/Adwaita/24x24/legacy/address-book-new.png /usr/share/icons/Adwaita/24x24/legacy/input-mouse.png /usr/share/icons/Adwaita/16x16/legacy/document-print-preview.png /usr/share/icons/Adwaita/22x22/legacy/edit-cut.png /usr/share/icons/Adwaita/16x16/legacy/appointment-new.png /usr/share/icons/Adwaita/22x22/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/24x24/legacy/list-remove.png /usr/share/icons/Adwaita/32x32/legacy/non-starred.png /usr/share/icons/Adwaita/48x48/legacy/network-idle.png /usr/share/icons/Adwaita/48x48/legacy/mail-send.png /usr/share/icons/Adwaita/24x24/legacy/insert-image.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-more.png /usr/share/icons/Adwaita/48x48/legacy/media-seek-forward.png /usr/share/icons/Adwaita/48x48/legacy/edit-paste.png /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter.png /usr/share/icons/Adwaita/22x22/legacy/view-restore.png /usr/share/icons/Adwaita/32x32/legacy/go-previous.png /usr/share/icons/Adwaita/24x24/
 legacy/face-sad.png /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-muted.png /usr/share/icons/Adwaita/16x16/legacy/battery-full-charged.png /usr/share/icons/Adwaita/24x24/legacy/applications-system.png /usr/share/icons/Adwaita/22x22/legacy/face-plain.png /usr/share/icons/Adwaita/16x16/legacy/user-idle.png /usr/share/icons/Adwaita/48x48/legacy/edit-delete.png /usr/share/icons/Adwaita/24x24/legacy/mail-reply-all.png /usr/share/icons/Adwaita/16x16/legacy/go-previous-rtl.png /usr/share/icons/Adwaita/24x24/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/24x24/legacy/multimedia-player.png /usr/share/icons/Adwaita/48x48/legacy/mark-location.png /usr/share/icons/Adwaita/32x32/legacy/edit-redo.png /usr/share/icons/Adwaita/24x24/legacy/mail-attachment.png /usr/share/icons/Adwaita/32x32/legacy/go-first.png /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-low.png /usr/share/icons/Adwaita/48x48/legacy/system-lock-screen.png /usr/share/icons/Adwaita/22x22/legacy/doc
 ument-send.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/22x22/legacy/user-offline.png /usr/share/icons/Adwaita/32x32/legacy/edit-undo.png /usr/share/icons/Adwaita/32x32/legacy/go-last-rtl.png /usr/share/icons/Adwaita/48x48/legacy/document-new.png /usr/share/icons/Adwaita/16x16/legacy/applications-development.png /usr/share/icons/Adwaita/32x32/legacy/edit-select-all.png /usr/share/icons/Adwaita/48x48/legacy/battery-missing.png /usr/share/icons/Adwaita/32x32/legacy/network-vpn.png /usr/share/icons/Adwaita/48x48/legacy/mail-reply-all.png /usr/share/icons/Adwaita/32x32/legacy/view-sort-descending.png /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-more.png /usr/share/icons/Adwaita/22x22/legacy/go-first.png /usr/share/icons/Adwaita/22x22/legacy/emote-love.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts.png /usr/share/icons/Adwaita/16x16/legac
 y/zoom-out.png /usr/share/icons/Adwaita/16x16/legacy/emblem-generic.png /usr/share/icons/Adwaita/22x22/legacy/dialog-error.png /usr/share/icons/Adwaita/22x22/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/22x22/legacy/battery-low-charging.png /usr/share/icons/Adwaita/32x32/legacy/face-plain.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/32x32/legacy/dialog-question.png /usr/share/icons/Adwaita/16x16/legacy/applications-office.png /usr/share/icons/Adwaita/24x24/legacy/appointment-new.png /usr/share/icons/Adwaita/24x24/legacy/face-uncertain.png /usr/share/icons/Adwaita/22x22/legacy/format-text-italic.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/48x48/legacy/ebook-reader.png /usr/share/icons/Adwaita/32x32/legacy/face-wink.png /usr/share/icons/Adwaita/48x48/legacy/go-last-rtl.png /usr/share/icons/Adwaita/48x48/legacy/document-revert.png /usr/share/icons/Adwaita/32x32/legacy/emote-love
 .png /usr/share/icons/Adwaita/16x16/legacy/camera-video.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-low.png /usr/share/icons/Adwaita/22x22/legacy/multimedia-volume-control.png /usr/share/icons/Adwaita/48x48/legacy/edit-select-all.png /usr/share/icons/Adwaita/16x16/legacy/semi-starred.png /usr/share/icons/Adwaita/48x48/legacy/media-playback-stop.png /usr/share/icons/Adwaita/32x32/legacy/network-transmit.png /usr/share/icons/Adwaita/32x32/legacy/mark-location.png /usr/share/icons/Adwaita/32x32/legacy/face-cool.png /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-rtl.png /usr/share/icons/Adwaita/24x24/legacy/changes-allow.png /usr/share/icons/Adwaita/32x32/legacy/drive-multidisk.png /usr/share/icons/Adwaita/24x24/legacy/system-software-install.png /usr/share/icons/Adwaita/32x32/legacy/user-info.png /usr/share/icons/Adwaita/48x48/legacy/edit-redo-rtl.png /usr/share/icons/Adwaita/16x16/legacy/face-monkey.png /usr/share/icons/Adwaita/24x24/legacy/phone.png /usr/share
 /icons/Adwaita/48x48/legacy/microphone-sensitivity-high.png /usr/share/icons/Adwaita/48x48/legacy/face-kiss.png /usr/share/icons/Adwaita/22x22/legacy/emblem-important.png /usr/share/icons/Adwaita/48x48/legacy/mail-send-receive.png /usr/share/icons/Adwaita/16x16/legacy/media-playlist-repeat.png /usr/share/icons/Adwaita/24x24/legacy/format-text-underline.png /usr/share/icons/Adwaita/48x48/legacy/input-mouse.png /usr/share/icons/Adwaita/48x48/legacy/media-floppy.png /usr/share/icons/Adwaita/32x32/legacy/system-lock-screen.png /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/32x32/legacy/call-start.png /usr/share/icons/Adwaita/16x16/legacy/document-revert-rtl.png /usr/share/icons/Adwaita/22x22/legacy/semi-starred.png /usr/share/icons/Adwaita/24x24/legacy/battery-good.png /usr/share/icons/Adwaita/48x48/legacy/edit-clear.png /usr/share/icons/Adwaita/48x48/legacy/face-devilish.png /usr/share/icons/Adwaita/48x48/legacy/document-page-setup.png /usr/
 share/icons/Adwaita/48x48/legacy/preferences-other.png /usr/share/icons/Adwaita/16x16/legacy/applications-engineering.png /usr/share/icons/Adwaita/22x22/legacy/preferences-other.png /usr/share/icons/Adwaita/48x48/legacy/input-gaming.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-center.png /usr/share/icons/Adwaita/32x32/legacy/input-touchpad.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-important.png /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-personal.png /usr/share/icons/Adwaita/22x22/legacy/edit-select-all.png /usr/share/icons/Adwaita/22x22/legacy/emblem-system.png /usr/share/icons/Adwaita/16x16/legacy/network-error.png /usr/share/icons/Adwaita/16x16/legacy/ebook-reader.png /usr/share/icons/Adwaita/48x48/legacy/applications-graphics.png /usr/share/icons/Adwaita/24x24/legacy/user-invisible.png /usr/share/icons/Adwaita/24x24/legacy/semi-starred.png /usr/share/icons/Adwaita/16x16/legacy/software-update-available.png /usr/share/icons/Adwaita/16x16/legacy
 /user-offline.png /usr/share/icons/Adwaita/32x32/legacy/battery-full-charged.png /usr/share/icons/Adwaita/22x22/legacy/input-dialpad.png /usr/share/icons/Adwaita/16x16/legacy/media-playback-start.png /usr/share/icons/Adwaita/16x16/legacy/network-wired.png /usr/share/icons/Adwaita/22x22/legacy/edit-clear.png /usr/share/icons/Adwaita/24x24/legacy/format-justify-fill.png /usr/share/icons/Adwaita/32x32/legacy/changes-prevent.png /usr/share/icons/Adwaita/22x22/legacy/media-skip-forward.png /usr/share/icons/Adwaita/24x24/legacy/audio-volume-high.png /usr/share/icons/Adwaita/32x32/legacy/user-available.png /usr/share/icons/Adwaita/16x16/legacy/multimedia-player.png /usr/share/icons/Adwaita/48x48/legacy/face-wink.png /usr/share/icons/Adwaita/24x24/legacy/media-skip-backward.png /usr/share/icons/Adwaita/32x32/legacy/audio-volume-medium.png /usr/share/icons/Adwaita/32x32/legacy/face-surprise.png /usr/share/icons/Adwaita/48x48/legacy/media-seek-backward.png /usr/share/icons/Adwaita/48x48/legac
 y/mail-read.png /usr/share/icons/Adwaita/16x16/legacy/network-wireless-encrypted.png /usr/share/icons/Adwaita/22x22/legacy/drive-multidisk.png /usr/share/icons/Adwaita/48x48/legacy/security-medium.png /usr/share/icons/Adwaita/24x24/legacy/help-browser.png /usr/share/icons/Adwaita/48x48/legacy/battery.png /usr/share/icons/Adwaita/16x16/legacy/document-properties.png /usr/share/icons/Adwaita/48x48/legacy/edit-find.png /usr/share/icons/Adwaita/16x16/legacy/format-justify-right.png /usr/share/icons/Adwaita/24x24/legacy/media-skip-forward.png /usr/share/icons/Adwaita/22x22/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/48x48/legacy/media-skip-backward.png /usr/share/icons/Adwaita/22x22/legacy/mark-location.png /usr/share/icons/Adwaita/22x22/legacy/address-book-new.png /usr/share/icons/Adwaita/24x24/legacy/network-error.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/24x24/legacy/go-down.png /usr/share/icons/Adwaita/22x22/legacy/camera-video.png
  /usr/share/icons/Adwaita/16x16/legacy/contact-new.png /usr/share/icons/Adwaita/22x22/legacy/face-glasses.png /usr/share/icons/Adwaita/16x16/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/24x24/legacy/format-indent-less.png /usr/share/icons/Adwaita/22x22/legacy/format-indent-more.png /usr/share/icons/Adwaita/24x24/legacy/trophy-gold.png /usr/share/icons/Adwaita/48x48/legacy/changes-allow.png /usr/share/icons/Adwaita/16x16/legacy/printer-printing.png /usr/share/icons/Adwaita/22x22/legacy/trophy-silver.png /usr/share/icons/Adwaita/22x22/legacy/semi-starred-rtl.png /usr/share/icons/Adwaita/48x48/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/24x24/legacy/mail-mark-unread.png /usr/share/icons/Adwaita/48x48/legacy/view-sort-descending.png /usr/share/icons/Adwaita/22x22/legacy/mail-forward.png /usr/share/icons/Adwaita/22x22/legacy/security-medium.png /usr/share/icons/Adwaita/16x16/legacy/media-seek-forward.png /usr/share/icons/Adwaita/24x24/legacy/battery-empty
 .png /usr/share/icons/Adwaita/48x48/legacy/user-idle.png /usr/share/icons/Adwaita/32x32/legacy/system-log-out.png /usr/share/icons/Adwaita/24x24/legacy/media-eject.png /usr/share/icons/Adwaita/22x22/legacy/user-available.png /usr/share/icons/Adwaita/24x24/legacy/help-contents.png /usr/share/icons/Adwaita/48x48/legacy/format-text-direction-ltr.png /usr/share/icons/Adwaita/16x16/legacy/applications-graphics.png /usr/share/icons/Adwaita/24x24/legacy/document-save.png /usr/share/icons/Adwaita/32x32/legacy/preferences-system.png /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search.png /usr/share/icons/Adwaita/16x16/legacy/system-help.png /usr/share/icons/Adwaita/16x16/legacy/applications-system.png /usr/share/icons/Adwaita/16x16/legacy/face-smile.png /usr/share/icons/Adwaita/32x32/legacy/security-medium.png /usr/share/icons/Adwaita/32x32/legacy/document-send.png /usr/share/icons/Adwaita/16x16/legacy/edit-clear-all.png /usr/share/icons/Adwaita/22x22/legacy/go-jump.png /usr/shar
 e/icons/Adwaita/32x32/legacy/phone.png /usr/share/icons/Adwaita/24x24/legacy/emblem-urgent.png /usr/share/icons/Adwaita/32x32/legacy/mail-unread.png /usr/share/icons/Adwaita/24x24/legacy/mail-unread.png /usr/share/icons/Adwaita/48x48/legacy/format-justify-right.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/48x48/legacy/image-missing.png /usr/share/icons/Adwaita/16x16/legacy/mail-message-new.png /usr/share/icons/Adwaita/48x48/legacy/help-faq.png /usr/share/icons/Adwaita/24x24/legacy/edit-undo.png /usr/share/icons/Adwaita/32x32/legacy/object-rotate-left.png /usr/share/icons/Adwaita/22x22/legacy/computer-fail.png /usr/share/icons/Adwaita/22x22/legacy/web-browser.png /usr/share/icons/Adwaita/16x16/legacy/mail-mark-junk.png /usr/share/icons/Adwaita/16x16/legacy/input-gaming.png /usr/share/icons/Adwaita/16x16/legacy/tab-new.png /usr/share/icons/Adwaita/24x24/legacy/appointment-missed.png /usr/share/icons/Adwaita/22x22/legacy/security-high.png /us
 r/share/icons/Adwaita/48x48/legacy/view-sort-ascending.png /usr/share/icons/Adwaita/24x24/legacy/edit-find.png /usr/share/icons/Adwaita/22x22/legacy/dialog-password.png /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver.png /usr/share/icons/Adwaita/32x32/legacy/changes-allow.png /usr/share/icons/Adwaita/32x32/legacy/zoom-in.png /usr/share/icons/Adwaita/22x22/legacy/system-software-update.png /usr/share/icons/Adwaita/48x48/legacy/mail-mark-important.png /usr/share/icons/Adwaita/22x22/legacy/camera-photo.png /usr/share/icons/Adwaita/22x22/legacy/appointment-missed.png /usr/share/icons/Adwaita/16x16/legacy/mail-unread.png /usr/share/icons/Adwaita/32x32/legacy/insert-object.png /usr/share/icons/Adwaita/22x22/legacy/system-software-install.png /usr/share/icons/Adwaita/48x48/legacy/list-add.png /usr/share/icons/Adwaita/22x22/legacy/dialog-question.png /usr/share/icons/Adwaita/48x48/legacy/mail-forward.png 
 /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper.png /usr/share/icons/Adwaita/48x48/legacy/system-software-install.png /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-medium.png /usr/share/icons/Adwaita/22x22/legacy/format-text-underline.png /usr/share/icons/Adwaita/22x22/legacy/battery-missing.png /usr/share/icons/Adwaita/22x22/legacy/face-laugh.png /usr/share/icons/Adwaita/16x16/legacy/camera-web.png /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-font.png /usr/share/icons/Adwaita/32x32/legacy/edit-delete.png /usr/share/icons/Adwaita/22x22/legacy/mail-signed-verified.png /usr/share/icons/Adwaita/48x48/legacy/go-first-rtl.png /usr/share/icons/Adwaita/32x32/legacy/pda.png /usr/share/icons/Adwaita/16x16/legacy/dialog-error.png /usr/share/icons/Adwaita/48x48/legacy/insert-object.png /usr/share/icons/Adwaita/48x48/legacy/applications-internet.png /usr/share/icons/Adwaita/22x22/legacy/bookmark-new.png /usr/share/icons/Adwaita/48x48/legacy/face-s
 ick.png /usr/share/icons/Adwaita/16x16/legacy/mail-replied.png /usr/share/icons/Adwaita/48x48/legacy/face-raspberry.png /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-theme.png /usr/share/icons/Adwaita/32x32/legacy/task-due.png /usr/share/icons/Adwaita/24x24/legacy/appointment-soon.png /usr/share/icons/Adwaita/24x24/legacy/applications-accessories.png /usr/share/icons/Adwaita/16x16/legacy/non-starred.png /usr/share/icons/Adwaita/22x22/legacy/go-bottom.png /usr/share/icons/Adwaita/22x22/legacy/applications-other.png /usr/share/icons/Adwaita/22x22/legacy/software-update-available.png /usr/share/icons/Adwaita/32x32/legacy/network-idle.png /usr/share/icons/Adwaita/24x24/legacy/format-indent-more.png /usr/share/icons/Adwaita/48x48/legacy/user-info.png /usr/share/icons/Adwaita/48x48/legacy/dialog-error.png /usr/share/icons/Adwaita/24x24/legacy/network-wired-disconnected.png /usr/share/icons/Adwaita/32x32/legacy/format-indent-more-rtl.png /usr/share/icons/Adwaita/16x16/legacy/ac
 cessories-character-map.png /usr/share/icons/Adwaita/22x22/legacy/format-indent-less.png /usr/share/icons/Adwaita/22x22/legacy/trophy-bronze.png /usr/share/icons/Adwaita/16x16/legacy/format-text-strikethrough.png /usr/share/icons/Adwaita/32x32/legacy/mail-mark-notjunk.png /usr/share/icons/Adwaita/16x16/legacy/view-refresh.png /usr/share/icons/Adwaita/22x22/legacy/media-playback-stop.png /usr/share/icons/Adwaita/32x32/legacy/user-away.png /usr/share/icons/Adwaita/24x24/legacy/user-offline.png /usr/share/icons/Adwaita/16x16/legacy/input-touchpad.png /usr/share/icons/Adwaita/16x16/legacy/uninterruptible-power-supply.png /usr/share/icons/Adwaita/22x22/legacy/battery-empty.png /usr/share/icons/Adwaita/22x22/legacy/format-justify-fill.png /usr/share/icons/Adwaita/48x48/legacy/go-next.png /usr/share/icons/Adwaita/48x48/legacy/system-log-out.png /usr/share/icons/Adwaita/32x32/legacy/go-jump.png /usr/share/icons/Adwaita/32x32/legacy/mail-reply-all.png /usr/share/icons/Adwaita/48x48/legacy/in
 sert-text.png /usr/share/icons/Adwaita/24x24/legacy/go-first.png /usr/share/icons/Adwaita/16x16/legacy/document-save-as.png /usr/share/icons/Adwaita/32x32/legacy/format-text-underline.png /usr/share/icons/Adwaita/22x22/legacy/go-up.png /usr/share/icons/Adwaita/48x48/legacy/face-worried.png"
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/16x16/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/16x16/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/24x24/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/32x32/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/48x48/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/512x512/devices/camera-web.png was added
  /usr/share/icons/Adwaita/512x512/devices/drive-multidisk.png was added
  /usr/share/icons/Adwaita/512x512/devices/drive-optical.png was added
  /usr/share/icons/Adwaita/512x512/devices/ebook-reader.png was added
  /usr/share/icons/Adwaita/512x512/devices/input-keyboard.png was added
  /usr/share/icons/Adwaita/512x512/devices/input-mouse.png was added
  /usr/share/icons/Adwaita/512x512/devices/input-tablet.png was added
  /usr/share/icons/Adwaita/512x512/devices/media-flash.png was added
  /usr/share/icons/Adwaita/512x512/devices/media-floppy.png was added
  /usr/share/icons/Adwaita/512x512/devices/phone.png was added
  /usr/share/icons/Adwaita/512x512/devices/scanner.png was added
  /usr/share/icons/Adwaita/512x512/devices/video-display.png was added
  /usr/share/icons/Adwaita/64x64/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/64x64/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/application-exit-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/application-exit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/document-revert-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-indent-less-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-indent-more-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-direction-ltr-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-direction-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-plaintext-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/format-text-rich-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/go-jump-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-forward-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-reply-all-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-reply-all-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/mail-reply-sender-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/selection-mode-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-log-out-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-log-out-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-switch-user-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/system-switch-user-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-bullet-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-ordered-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-list-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-paged-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-paged-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-ascending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/actions/view-sort-descending-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/audio-speakers-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/audio-speakers-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/media-optical-cd-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/devices/tablet-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-calculator-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-character-map-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-dictionary-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/accessories-text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/applets-screenshooter-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/gnome-power-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/goa-panel-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/help-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/help-contents-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/help-faq-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/multimedia-volume-control-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-color-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-accessibility-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-appearance-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-apps-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-display-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-font-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-keyboard-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-locale-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-multitasking-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-remote-desktop-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-screensaver-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-desktop-wallpaper-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-details-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-devices-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-proxy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-network-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-notifications-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-parental-controls-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-privacy-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-search-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-sharing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/preferences-system-time-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/system-file-manager-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/system-software-install-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/system-users-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/text-editor-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/user-info-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/utilities-terminal-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/legacy/web-browser-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-high-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-high-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-low-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-low-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-muted-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/audio-volume-overamplified-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/bluetooth-acquiring-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/image-missing-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/mail-replied-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/mail-replied-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-acquiring-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-hardware-disabled-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-no-route-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-no-route-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-offline-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-excellent-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-good-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-none-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-none-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-ok-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-weak-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-cellular-signal-weak-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-receive-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-transmit-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-vpn-disabled-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/network-vpn-disconnected-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/orientation-portrait-left-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/orientation-portrait-right-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-balanced-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-performance-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-performance-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/power-profile-power-saver-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/security-medium-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/security-medium-symbolic-rtl.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/semi-starred-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/96x96/status/view-wrapped-rtl-symbolic.symbolic.png was added
  /usr/share/icons/Adwaita/scalable/actions/application-exit-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/application-exit-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/document-revert-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-indent-less-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-indent-more-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-direction-ltr-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-direction-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-plaintext-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/format-text-rich-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/go-jump-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-forward-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-reply-all-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/mail-reply-sender-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/selection-mode-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-log-out-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-log-out-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-switch-user-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/system-switch-user-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-bullet-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-ordered-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-list-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-paged-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-paged-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-ascending-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/actions/view-sort-descending-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/devices/audio-speakers-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/devices/audio-speakers-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/devices/media-optical-cd-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/devices/tablet-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-calculator-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-character-map-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-dictionary-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/accessories-text-editor-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/applets-screenshooter-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/gnome-power-manager-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/goa-panel-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/help-browser-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/help-contents-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/help-faq-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/multimedia-volume-control-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-color-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-accessibility-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-appearance-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-apps-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-display-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-font-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-shortcuts-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-keyboard-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-locale-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-multitasking-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-remote-desktop-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-screensaver-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-desktop-wallpaper-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-details-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-devices-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-proxy-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-network-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-notifications-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-parental-controls-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-privacy-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-search-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-sharing-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/preferences-system-time-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/system-file-manager-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/system-software-install-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/system-users-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/text-editor-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/user-info-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/utilities-terminal-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/legacy/web-browser-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-high-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-high-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-low-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-low-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-medium-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-muted-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/audio-volume-overamplified-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/bluetooth-acquiring-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/image-missing-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/mail-replied-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/mail-replied-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-acquiring-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-acquiring-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-disabled-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-hardware-disabled-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-no-route-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-no-route-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-offline-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-offline-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-excellent-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-good-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-none-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-ok-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-cellular-signal-weak-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-receive-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-transmit-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-vpn-disabled-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/network-vpn-disconnected-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/orientation-portrait-left-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/orientation-portrait-right-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-balanced-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-balanced-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-performance-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-performance-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/power-profile-power-saver-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/security-medium-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/security-medium-symbolic-rtl.svg was added
  /usr/share/icons/Adwaita/scalable/status/semi-starred-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/scalable/status/view-wrapped-rtl-symbolic.svg was added
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/battery.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/computer.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-signed.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-signed-verified.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/modem.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wireless-encrypted.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/pda.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/phone.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/starred.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/tab-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/16x16/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/16x16/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/22x22/legacy was removed
  /usr/share/icons/Adwaita/22x22/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/battery.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/computer.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-signed.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-signed-verified.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/modem.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wireless-encrypted.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/pda.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/phone.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/starred.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/tab-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/22x22/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/battery.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/computer.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-signed.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-signed-verified.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/modem.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wireless-encrypted.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/pda.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/phone.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/starred.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/tab-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/24x24/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/24x24/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/256x256/legacy was removed
  /usr/share/icons/Adwaita/256x256/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/battery.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/computer.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/emblem-synchronizing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/phone.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/starred.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/256x256/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/battery.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/computer.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/modem.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/pda.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/phone.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/starred.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/32x32/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/32x32/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/ac-adapter.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applets-screenshooter.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/application-exit.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-accessories.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-development.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-engineering.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-games.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-graphics.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-office.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-other.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-science.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/applications-utilities.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/appointment-missed.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/appointment-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/appointment-soon.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-card.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-speakers.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-high.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-medium.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/audio-volume-muted.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-caution-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-caution.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-empty.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-full-charged.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-full-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-full.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-good-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-good.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-low-charging.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery-missing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/battery.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/bookmark-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/call-start.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/call-stop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/camera-photo.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/camera-video.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/camera-web.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/changes-allow.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/changes-prevent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/computer-fail.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/computer.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/contact-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-error.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-information.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-password.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-question.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/dialog-warning.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-open-recent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-print.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-print-preview.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/document-send.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/drive-multidisk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/drive-optical.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/ebook-reader.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-clear-all.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-clear.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-clear-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-copy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-cut.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-delete.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-find.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-find-replace.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-paste.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-redo.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-redo-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-undo.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/edit-undo-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-desktop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-documents.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-downloads.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-favorite.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-generic.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-important.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-mail.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-photos.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-system.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-urgent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emblem-web.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/emote-love.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-angel.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-angry.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-cool.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-crying.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-devilish.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-embarrassed.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-glasses.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-kiss.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-laugh.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-monkey.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-plain.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-raspberry.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-sad.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-sick.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-smile-big.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-smile.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-smirk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-surprise.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-tired.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-uncertain.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-wink.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/face-worried.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-less.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-less-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-more.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-indent-more-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-center.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-fill.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-left.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-justify-right.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-bold.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-direction-ltr.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-direction-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-italic.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-strikethrough.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/format-text-underline.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-bottom.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-down.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-first.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-first-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-home.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-jump.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-last.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-last-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-next.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-next-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-previous.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-previous-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-top.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/go-up.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-about.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-browser.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-contents.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/help-faq.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-gaming.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-keyboard.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-mouse.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-tablet.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/input-touchpad.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-image.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-link.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-object.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/insert-text.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/list-add.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/list-remove.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-attachment.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-forward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-important.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-junk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-notjunk.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-read.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-mark-unread.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-message-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-read.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-replied.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-reply-all.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-reply-sender.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-send.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-send-receive.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mail-unread.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-eject.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-flash.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-floppy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playback-pause.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playback-start.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playback-stop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playlist-repeat.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-playlist-shuffle.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-record.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-seek-backward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-seek-forward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-skip-backward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-skip-forward.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/media-tape.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-high.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-medium.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/microphone-sensitivity-muted.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/modem.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/multimedia-volume-control.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-cellular-connected.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-error.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-idle.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-offline.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-receive.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-transmit.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-transmit-receive.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-vpn.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-wired-disconnected.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-wired.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/network-wireless.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/non-starred.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-flip-horizontal.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-flip-vertical.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-rotate-left.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/object-rotate-right.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/pda.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/phone.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-accessibility.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-display.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-font.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-keyboard-shortcuts.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-locale.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-peripherals.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-personal.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-remote-desktop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-screensaver.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-theme.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-wallpaper.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-other.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-network.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-notifications.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-privacy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-search.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-sharing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/preferences-system-windows.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/printer-error.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/printer-printing.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/process-stop.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/scanner.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/security-high.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/security-low.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/security-medium.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/semi-starred.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/semi-starred-rtl.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/software-update-available.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/software-update-urgent.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/starred.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-file-manager.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-help.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-lock-screen.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-log-out.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-run.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-search.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-shutdown.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-software-install.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-software-update.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/system-users.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/task-due.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/task-past-due.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/tools-check-spelling.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/trophy-bronze.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/trophy-gold.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/trophy-silver.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/uninterruptible-power-supply.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-available.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-away.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-busy.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-idle.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-info.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-invisible.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/user-offline.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/video-display.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-fullscreen.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-refresh.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-restore.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-sort-ascending.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/view-sort-descending.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/web-browser.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/window-close.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/window-new.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-fit-best.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-in.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-original.png was removed
  /usr/share/icons/Adwaita/48x48/legacy/zoom-out.png was removed
  /usr/share/icons/Adwaita/48x48/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/512x512/legacy was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-calculator.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-character-map.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-dictionary.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/accessories-text-editor.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/address-book-new.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/applications-internet.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/applications-system.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-new.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-open.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-page-setup.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-properties.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-revert.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-revert-rtl.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-save-as.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/document-save.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/edit-select-all.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/emblem-package.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/folder-new.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/folder-visiting.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/image-missing.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/input-dialpad.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/mark-location.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/multimedia-player.png was removed
  /usr/share/icons/Adwaita/512x512/legacy/utilities-terminal.png was removed
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/64x64/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/8x8/legacy was removed
  /usr/share/icons/Adwaita/8x8/legacy/emblem-default.png was removed
  /usr/share/icons/Adwaita/8x8/legacy/emblem-new.png was removed
  /usr/share/icons/Adwaita/8x8/legacy/emblem-synchronizing.png was removed
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-right-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/actions/sidebar-show-rtl-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-calculator-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-character-map-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-dictionary-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/accessories-text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/applets-screenshooter-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/gnome-power-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/goa-panel-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/help-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/help-faq-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/multimedia-volume-control-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-color-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-accessibility-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-apps-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-display-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-font-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-shortcuts-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-keyboard-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-locale-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-remote-desktop-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-screensaver-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-desktop-wallpaper-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-details-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-devices-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-network-proxy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-network-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-notifications-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-parental-controls-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-privacy-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-search-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-sharing-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/preferences-system-time-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/system-file-manager-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/system-software-install-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/system-users-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/text-editor-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/user-info-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/utilities-terminal-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/apps/web-browser-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/96x96/status/network-wired-offline-symbolic.symbolic.png was removed
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-right-rtl-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/actions/sidebar-show-rtl-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-calculator-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-character-map-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-dictionary-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/accessories-text-editor-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/applets-screenshooter-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/gnome-power-manager-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/goa-panel-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/help-browser-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/help-faq-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/multimedia-volume-control-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-color-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-accessibility-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-apps-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-display-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-font-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-shortcuts-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-keyboard-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-locale-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-remote-desktop-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-screensaver-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-desktop-wallpaper-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-details-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-devices-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-proxy-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-network-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-notifications-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-parental-controls-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-privacy-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-search-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-sharing-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/preferences-system-time-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/system-file-manager-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/system-software-install-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/system-users-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/text-editor-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/user-info-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/utilities-terminal-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/apps/web-browser-symbolic.svg was removed
  /usr/share/icons/Adwaita/scalable/status/network-wired-offline-symbolic.svg was removed

--===============7693953358527745478==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-adwaita-icon-theme-upgrade-41.0-42.0.patch"

From 372595f4c3c017b48d6628024b212aa3efa90db5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 11:35:03 +0000
Subject: [PATCH] adwaita-icon-theme: upgrade 41.0 -> 42.0

---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    |  6 +-
 ...-installation-commands-as-shell-jobs.patch | 84 -------------------
 ...eme_41.0.bb => adwaita-icon-theme_42.0.bb} |  7 +-
 3 files changed, 5 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_41.0.bb => adwaita-icon-theme_42.0.bb} (87%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 5afba3c644..6100436444 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 63d97fefdbc90f5c68f67bdc30844776d9a1b720 Mon Sep 17 00:00:00 2001
+From d6f747d863cd8af03ae155ec1319d3fd2e518d38 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f2659a5..1e8b016 100644
+index 040975e..5f7b53a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [41.0],
+ AC_INIT([adwaita-icon-theme], [42.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
deleted file mode 100644
index a1d39cf558..0000000000
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 79da031e9811f3eef34b14cce419be93fea34319 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 13 Jun 2017 18:10:06 +0300
-Subject: [PATCH] Run installation commands as shell jobs
-
-This greatly speeds up installation time on multi-core systems.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/merge_requests/39]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- src/fullcolor/Makefile.am |  5 +++--
- src/spinner/Makefile.am   |  7 ++++---
- src/symbolic/Makefile.am  | 11 ++++++-----
- 3 files changed, 13 insertions(+), 10 deletions(-)
-
-diff --git a/src/fullcolor/Makefile.am b/src/fullcolor/Makefile.am
-index d73529b..b7d0808 100644
---- a/src/fullcolor/Makefile.am
-+++ b/src/fullcolor/Makefile.am
-@@ -9,9 +9,10 @@ install-data-local:
- 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size && find . -name "*.png"`; do \
- 			context="`dirname $$file`"; \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 		done; \
--	done;
-+	done; \
-+	wait
- 
- ## FIXME we should add a way to remove links generated by icon mapping
- uninstall-local:
-diff --git a/src/spinner/Makefile.am b/src/spinner/Makefile.am
-index c14caf6..322dc0d 100644
---- a/src/spinner/Makefile.am
-+++ b/src/spinner/Makefile.am
-@@ -24,13 +24,14 @@ install-data-local:
- 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
- 		      context="`dirname $$file`"; \
- 		      $(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 	      done; \
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
- 		context="`dirname $$file`"; \
- 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
--		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
--	done
-+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
-+	done; \
-+	wait
- 
- uninstall-local:
- 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
-diff --git a/src/symbolic/Makefile.am b/src/symbolic/Makefile.am
-index 957c0ee..e1f8818 100644
---- a/src/symbolic/Makefile.am
-+++ b/src/symbolic/Makefile.am
-@@ -34,18 +34,19 @@ install-data-local:
- 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
- 			context="`dirname $$file`"; \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
-+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
- 		done; \
--	done
-+	done; \
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
- 		context="`dirname $$file`"; \
- 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable/$$context; \
--		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file; \
-+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file & \
- 		for size in $(symbolic_encode_sizes); do \
- 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
--			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context; \
-+			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context & \
- 		done \
--	done
-+	done; \
-+	wait
- 
- uninstall-local:
- 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
similarity index 87%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
index 46f9f4772c..c4f3b1c999 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
@@ -12,12 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
 
-SRC_URI += " \
-           file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
-           file://0001-Run-installation-commands-as-shell-jobs.patch \
-           "
+SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
 
-SRC_URI[archive.sha256sum] = "ef5339d8c35fcad5d10481b70480803f0fa20b3d3cbc339238fcaceeaee01eba"
+SRC_URI[archive.sha256sum] = "5e85b5adc8dee666900fcaf271ba717f7dcb9d0a03d96dae08f9cbd27e18b1e0"
 
 DEPENDS += "librsvg-native"
 
-- 
2.31.1


--===============7693953358527745478==--


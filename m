Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A63FC982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:47:27 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4917.1789710432686680532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O1qCNJa2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CKrfg89U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0b30e0e5e-f76d2207-8deb-406f-90ae-4dcb9c6f5343-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789710438;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oDR/jZ13PDEmfeeTVqx75JXdBox591S3aiT9qu3fzDM=;
	b=O1qCNJa22P931NHFD52jMKfAotheAc7QOWTmOUGlg8PeBN6Mk++YnDX1DjuIJUBq
	YWDnoJ6ts+Qqd7YkMcJ5Ujv7+2aMeTbZnpQ0Lt0bxmM8mwjYGraI8eDN/cICFIa+nZP
	ggmv3MusIEg3tQf4DMzPtXuj4RyICaJuAt5PpW/4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789710438;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oDR/jZ13PDEmfeeTVqx75JXdBox591S3aiT9qu3fzDM=;
	b=CKrfg89UI3RaudAuzhEixEiwcH+pgoT23HD6O0BEWthfY5gIhohCIV71dZxFCF49
	HCpt3dM8PV6t5ls8/YwP+87TC5M3bRpqHEKPpFLoEuFcQPG726ZxfSaROsjrjyLYMp0
	Sjx7lEP81v/nbdvw/XmXXX/FRlaIkFzvUccvAPgE=
Content-Type: multipart/mixed; boundary="===============7359165728449120810=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.32.0 FAILED
Message-ID: <010101a0b30e0e5e-f76d2207-8deb-406f-90ae-4dcb9c6f5343-000000@us-west-2.amazonses.com>
Date: Fri, 18 Sep 2026 05:47:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246188

--===============7359165728449120810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.32.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
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
DISTRO_VERSION       = "6.0.99+snapshot-8bddd376f8111648d8264b3fcd2a7ec38154237d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8bddd376f8111648d8264b3fcd2a7ec38154237d"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5cf833b572f5a33663888da321dce0ba1abd82a2
WARNING: Command 'git rebase 5cf833b572f5a33663888da321dce0ba1abd82a2' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libinput
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libinput/libinput_1.32.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libinput.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7359165728449120810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libinput-changelog.txt"

Changelog for libinput: 1.31.3 -> 1.32.0

5cf833b5 libinput 1.32.0
0869b7b9 doc/user: Add docs for circular scrolling
6672cf15 libinput 1.31.901
f2cf4603 quirks: add pressure range for PixArt 093A:200F
39491253 quirks: Lenovo ThinkPad X1 Tablet Gen 3
1d4fb7ae touchpad: add circular scroll method for round touchpads
63f7f2a8 Ruff fixes for ruff 0.16
d0e6d43a touchpad: sync the slot's tool type when syncing touch state
c391bdef quirks: add PixArt 093A:4811 haptic touchpad
d9ecf9e1 tools/record: add support for --no-events
2b9e9b55 quirks: Add a touchpad quirk for the Positivo Master N8460
44072da3 touchpad: re-use a helper function
7dbced2a test: return LITEST_NOT_APPLICABLE from gesture test helpers
eed8ad70 touchpad: don't trigger dwt for ongoing pointer motion
c9590b3f touchpad: don't trigger dwt for ongoing gestures/drags/scrolls
5ba8ca3f tools/measure-fuzz: don't compare against the function itself
e9074f06 quirks: add keyboard integration for Acer Nitro ANV16-42
46d81853 quirks: disable touchpad-edge volume/brightness sliders on EAECIS NL60R
1d8abdf9 quirks: ignore the tool type axis on the Lenovo P14s Gen 6 touchpad
4c7f7b1e evdev: verify fd via cached devnum on FreeBSD
b12bc3b4 quirks: add HP haptic touchpad quirk
0c732173 tablet: fix a compiler warning for an unused variable
a487280e util: fix possible return of unsanitized input in str_sanitize
b577a773 Fall back to plain strtod(3) on NetBSD and OpenBSD
3cfc22b8 use FreeBSD's input.h for NetBSD and OpenBSD as well
76f0d8a7 libinput-device-group: sanitize phys before printing it
7c49e611 tools: sanitize device names in libinput-record YAML output
71a2c5ca util: sanitize control characters in str_sanitize()
af084f37 pad: ignore invalid strip axis values
04a35384 evdev: be stricter about devices with odd absinfo values
6efbf9ff totem: require both touch size axes to have resolution
29338d82 Add SECURITY.md directing to confidential GitLab issues
9ac197b5 tools/record: defer file creation until events arrive in autorestart mode
073d502c tools: update the libinput record man page for the latest changes
649d65db touchpad: fix the libwacom_is_reversible() check on the paired device
31658a34 tools/record: fix broken autorestart for timeouts >=5s
74e19109 tools/record: default to libinput-recording.yml with --autorestart
63781836 tools/record: replace the timestamp with usec_t
41b384d5 pre-commit: check for merge conflicts too
61b3b785 util: allow for uppercase 'E' in safe_atod strings too
089bc8ec tools: another close() -> xclose change
e88a16ea tools/debug-tablet: don't leak the udev_device on open() failure
e53c2141 util: add a free_clear() helper to reset after free
c2c84146 tools: update the tool option parsing test for newer options
86a775b3 tools/debug-tablet: guard against open() failures
0fa33460 tools: always open with O_CLOEXEC
a5a9d2d8 tools: guard against zero-length os-release files
8afdc52e tools: Use xclose() over close()
e53a78f7 tools/record: fix missing NULL check on tmpfile() return value
a51398cb tools: use save_atod instead of atof()
74b4ca13 tools/debug-tablet-pad: add bounds checks for array accesses
f899da75 tools/ptraccel-debug: replace atoi() with safe_atoi()
20b52ffa udev: use xclose() instead of close()
c276c957 plugin: use safe_strdup() instead of strdup()
d97983ee util: use lstat() instead of stat() in rmdir_r to prevent symlink attacks
b87532df touchpad: replace sprintf strv_join in the touch state debugging
75d4acfe util: allow for 'e' in safe_atod strings
cc72db48 doc/user: add an illustration of the touch arbitration rectangle
0e449215 doc: add HOLD_END to libinput_event_gesture_get_cancelled() doc
2da19a88 doc: remove ID_INPUT from lua plugin udev properties list
37e1dfd2 doc: update multi-device recording docs, --multiple is deprecated
f87bae4e doc: fix libinput replay output format in tools.rst
20a53db0 doc: fix ClickPad scroll method description in scrolling.rst
f854eb05 doc: fix typos and misspellings across documentation
60028ea5 doc: fix simplified hold gesture table in gestures.rst
2400a5c1 doc: fix reference to non-existent 'hold update' event in gestures.rst
fdd43a4f touchpad: time the 3fg fast swipe timeout from the initial contact
2bea0f3e tablet: extend touch arbitration rect to cover full tablet height
5f292575 util: use zalloc in stringbuf
2ea3fb1d tablet-pad: use strdup_printf in sysfs path construction
9d8a8b45 util: use snprintf for PID formatting in backtrace helper
e32202ee util: check for NULL on realloc in _infmask_ensure_size
aa04f67b plugin: guard against unsigned underflow in plugin_has_mask
8c06ceec quirks: add missing modification warning to a quirks file
356c498f lua: force text mode for loading plugins
45dfd0f0 lua: separate the API from the metatables
7face63b quirks: add positivo vaio fe15 right button
488c0c96 quirks: add quirk for the Wareus B15
baddf1e2 quirks: add support for Goodix touchpad GXTP5400:00 27C6:0F96
9baccdf4 touchpad: support automatic drag-lock when releasing at the edge
1486c7ae test: change where our finger ends up before releasing
f97d0e6d doc/user: document sticky vs timeout based drag lock a bit better
1c4040ff tools/debug-tablet: switch an snprintf to strvs
166201d9 util: fix remaininig usec computation on 32 bits
7d15503b evdev: fix rel axis disabling on accelerometers
2dc491de Fix various typos
bb7aa004 quirks: add clevetura clvx s touchpad quirk
a1c5f35a Add Goodix haptic touchpad 27C6:0F90 support
57c71c56 Add Elan haptic touchpad 04F3:3355 support
ef9624a1 evdev: store the SYN_REPORT value in the frame
dcbfbc4c util: fix usec computation on 32 bits
ad857a51 tools/record: fix delta times not being relative
a521d054 tools: fix leak of evdev_prev in libinput-record
f86d5ab2 test: add missing button state assertion for eraser button release
32fd9ec9 tools: Remove dead eraser_button_button initialization to BTN_STYLUS
45150cc6 tools: fix missing fd assignment in libinput-debug-tablet
c8c1c07a tools: fix swapped fread arguments causing DMI modalias to always be "unknown"
b1f478b8 tools: fix pencil tablet tool type in libinput-record
333d7131 tools: fix swapped strstartswith arguments in find_device()
cd9d6c66 tablet: fix eraser button get_default_mode/get_default_button return values
a0dc0997 meson.build: explicitly convert a boolean to string
c6813dc7 tools: add --compress-motion-events to the man page and zsh completion
8dd25ece Fold hold-to-scroll into existing scroll button lock mode
43547b46 quirks: add Goodix pressure pad quirk for 27C6:01E7
2ddc7341 test: set ID_INTEGRATION into test devices
819e943a evdev: use udev's ID_INTEGRATION
1c82aa16 quirks: add some more goodix haptic touchpads
526130fe quirks: hp omnibook ultra flip 14 touch pressure
b95840d3 quirks: hp omnibook ultra flip 14 improve rule set
77263504 tablet: allow for the eraser button to be any button
cdcb8273 Fix the evdev_usage_is_button check for the BTN_STYLUS group
0a3ecbea tablet: fix missing linebreak after an error message
db62bf7a quirks/apple: Add AttrSizeHint to Magic Trackpad USB-C
9eae99d4 quirks: microsoft surface keyboard event BTN_0
a86b8a00 doc: list-quirks should be quirks list
3428edf1 doc/user: document keypad slide switch support

--===============7359165728449120810==--


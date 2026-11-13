Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5924.1794551756385129334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZUsYhOq4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XsEjbpWu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1d39eb21b-9333e1fe-e1c0-4d6d-865a-b2400ebdf2df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794551755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NgXRChTSCYchEh2B8a0cvEZiAM+gXk4Gtk29QfZOKzc=;
	b=ZUsYhOq4P/u1t2BAK76e6Uc/+sIo2Fn4mzqe01VD9r+KklJdOScCOltP240qZCe7
	6r0Kp/T7FALhcYhRkzxrS43aQo5ezdShIWn3WGuGTakfqI1mbwdfFzf/zVWDS9w9BfG
	I+PdoYX/0k0yo4mC81HQpyOM2pJKn3xzYiOy4Niw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794551755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NgXRChTSCYchEh2B8a0cvEZiAM+gXk4Gtk29QfZOKzc=;
	b=XsEjbpWuOGvQ4Z/8rSKvKXW5SlX1nkUV16hE4THs2QgMqlXOf2Kb5aLh6tjNlbme
	4xHMWTnf4i2IiqS06U4UFEOksTK1QXQV5LWCFUrc6hm9/w7P9SqvHFDKrpA77rbvEls
	W2waiJM8WwxPtPshhc1UPi6HG9xkUoKi209oDWQE=
Content-Type: multipart/mixed; boundary="===============0633510703798228372=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-source-1.99.1: upgrading to 1.100.0 FAILED
Message-ID: <010101a1d39eb21b-9333e1fe-e1c0-4d6d-865a-b2400ebdf2df-000000@us-west-2.amazonses.com>
Date: Fri, 13 Nov 2026 06:35:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.13-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250141

--===============0633510703798228372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust-source-1.99.1* to *1.100.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rust-source-1.99.1 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-983fae4e31065308b044fde4ccee0ceb5e65bac5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:983fae4e31065308b044fde4ccee0ceb5e65bac5"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
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
Parsing of 961 .bb files complete (0 cached, 961 parsed). 2005 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-983fae4e31065308b044fde4ccee0ceb5e65bac5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:983fae4e31065308b044fde4ccee0ceb5e65bac5"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:02:37
Adding changed files:   1% |                                    | ETA:  0:01:57
Adding changed files:   1% |                                    | ETA:  0:01:43
Adding changed files:   2% |                                    | ETA:  0:01:37
Adding changed files:   2% |                                    | ETA:  0:01:31
Adding changed files:   3% |#                                   | ETA:  0:01:26
Adding changed files:   3% |#                                   | ETA:  0:01:24
Adding changed files:   4% |#                                   | ETA:  0:01:22
Adding changed files:   4% |#                                   | ETA:  0:01:21
Adding changed files:   5% |#                                   | ETA:  0:01:20
Adding changed files:   5% |##                                  | ETA:  0:01:19
Adding changed files:   6% |##                                  | ETA:  0:01:18
Adding changed files:   6% |##                                  | ETA:  0:01:17
Adding changed files:   7% |##                                  | ETA:  0:01:17
Adding changed files:   7% |##                                  | ETA:  0:01:16
Adding changed files:   8% |##                                  | ETA:  0:01:15
Adding changed files:   8% |###                                 | ETA:  0:01:14
Adding changed files:   9% |###                                 | ETA:  0:01:14
Adding changed files:   9% |###                                 | ETA:  0:01:13
Adding changed files:  10% |###                                 | ETA:  0:01:12
Adding changed files:  10% |###                                 | ETA:  0:01:12
Adding changed files:  11% |####                                | ETA:  0:01:11
Adding changed files:  11% |####                                | ETA:  0:01:11
Adding changed files:  12% |####                                | ETA:  0:01:10
Adding changed files:  12% |####                                | ETA:  0:01:10
Adding changed files:  13% |####                                | ETA:  0:01:09
Adding changed files:  13% |####                                | ETA:  0:01:09
Adding changed files:  14% |#####                               | ETA:  0:01:08
Adding changed files:  14% |#####                               | ETA:  0:01:08
Adding changed files:  15% |#####                               | ETA:  0:01:07
Adding changed files:  15% |#####                               | ETA:  0:01:07
Adding changed files:  16% |#####                               | ETA:  0:01:07
Adding changed files:  16% |######                              | ETA:  0:01:06
Adding changed files:  17% |######                              | ETA:  0:01:06
Adding changed files:  17% |######                              | ETA:  0:01:05
Adding changed files:  18% |######                              | ETA:  0:01:05
Adding changed files:  18% |######                              | ETA:  0:01:04
Adding changed files:  19% |######                              | ETA:  0:01:04
Adding changed files:  19% |#######                             | ETA:  0:01:03
Adding changed files:  20% |#######                             | ETA:  0:01:03
Adding changed files:  20% |#######                             | ETA:  0:01:03
Adding changed files:  21% |#######                             | ETA:  0:01:02
Adding changed files:  21% |#######                             | ETA:  0:01:02
Adding changed files:  22% |########                            | ETA:  0:01:01
Adding changed files:  22% |########                            | ETA:  0:01:01
Adding changed files:  23% |########                            | ETA:  0:01:00
Adding changed files:  23% |########                            | ETA:  0:01:01
Adding changed files:  24% |########                            | ETA:  0:01:00
Adding changed files:  24% |########                            | ETA:  0:01:00
Adding changed files:  25% |#########                           | ETA:  0:00:59
Adding changed files:  25% |#########                           | ETA:  0:00:58
Adding changed files:  26% |#########                           | ETA:  0:00:58
Adding changed files:  26% |#########                           | ETA:  0:00:57
Adding changed files:  27% |#########                           | ETA:  0:00:57
Adding changed files:  27% |##########                          | ETA:  0:00:56
Adding changed files:  28% |##########                          | ETA:  0:00:56
Adding changed files:  28% |##########                          | ETA:  0:00:55
Adding changed files:  29% |##########                          | ETA:  0:00:55
Adding changed files:  29% |##########                          | ETA:  0:00:54
Adding changed files:  30% |##########                          | ETA:  0:00:54
Adding changed files:  30% |###########                         | ETA:  0:00:53
Adding changed files:  31% |###########                         | ETA:  0:00:53
Adding changed files:  31% |###########                         | ETA:  0:00:53
Adding changed files:  32% |###########                         | ETA:  0:00:52
Adding changed files:  32% |###########                         | ETA:  0:00:52
Adding changed files:  33% |############                        | ETA:  0:00:51
Adding changed files:  33% |############                        | ETA:  0:00:51
Adding changed files:  34% |############                        | ETA:  0:00:50
Adding changed files:  34% |############                        | ETA:  0:00:50
Adding changed files:  35% |############                        | ETA:  0:00:49
Adding changed files:  35% |############                        | ETA:  0:00:49
Adding changed files:  36% |#############                       | ETA:  0:00:48
Adding changed files:  37% |#############                       | ETA:  0:00:48
Adding changed files:  37% |#############                       | ETA:  0:00:47
Adding changed files:  38% |#############                       | ETA:  0:00:47
Adding changed files:  38% |#############                       | ETA:  0:00:46
Adding changed files:  39% |##############                      | ETA:  0:00:46
Adding changed files:  39% |##############                      | ETA:  0:00:46
Adding changed files:  40% |##############                      | ETA:  0:00:45
Adding changed files:  40% |##############                      | ETA:  0:00:45
Adding changed files:  41% |##############                      | ETA:  0:00:44
Adding changed files:  41% |##############                      | ETA:  0:00:44
Adding changed files:  42% |###############                     | ETA:  0:00:43
Adding changed files:  42% |###############                     | ETA:  0:00:43
Adding changed files:  43% |###############                     | ETA:  0:00:42
Adding changed files:  43% |###############                     | ETA:  0:00:42
Adding changed files:  44% |###############                     | ETA:  0:00:42
Adding changed files:  44% |################                    | ETA:  0:00:41
Adding changed files:  45% |################                    | ETA:  0:00:41
Adding changed files:  45% |################                    | ETA:  0:00:40
Adding changed files:  46% |################                    | ETA:  0:00:40
Adding changed files:  46% |################                    | ETA:  0:00:40
Adding changed files:  47% |################                    | ETA:  0:00:39
Adding changed files:  47% |#################                   | ETA:  0:00:39
Adding changed files:  48% |#################                   | ETA:  0:00:39
Adding changed files:  48% |#################                   | ETA:  0:00:38
Adding changed files:  49% |#################                   | ETA:  0:00:38
Adding changed files:  49% |#################                   | ETA:  0:00:38
Adding changed files:  50% |##################                  | ETA:  0:00:37
Adding changed files:  50% |##################                  | ETA:  0:00:37
Adding changed files:  51% |##################                  | ETA:  0:00:37
Adding changed files:  51% |##################                  | ETA:  0:00:36
Adding changed files:  52% |##################                  | ETA:  0:00:36
Adding changed files:  52% |##################                  | ETA:  0:00:36
Adding changed files:  53% |###################                 | ETA:  0:00:35
Adding changed files:  53% |###################                 | ETA:  0:00:35
Adding changed files:  54% |###################                 | ETA:  0:00:34
Adding changed files:  54% |###################                 | ETA:  0:00:34
Adding changed files:  55% |###################                 | ETA:  0:00:34
Adding changed files:  55% |####################                | ETA:  0:00:33
Adding changed files:  56% |####################                | ETA:  0:00:33
Adding changed files:  56% |####################                | ETA:  0:00:33
Adding changed files:  57% |####################                | ETA:  0:00:32
Adding changed files:  57% |####################                | ETA:  0:00:32
Adding changed files:  58% |####################                | ETA:  0:00:32
Adding changed files:  58% |#####################               | ETA:  0:00:31
Adding changed files:  59% |#####################               | ETA:  0:00:31
Adding changed files:  59% |#####################               | ETA:  0:00:31
Adding changed files:  60% |#####################               | ETA:  0:00:30
Adding changed files:  60% |#####################               | ETA:  0:00:30
Adding changed files:  61% |######################              | ETA:  0:00:29
Adding changed files:  61% |######################              | ETA:  0:00:29
Adding changed files:  62% |######################              | ETA:  0:00:29
Adding changed files:  62% |######################              | ETA:  0:00:28
Adding changed files:  63% |######################              | ETA:  0:00:28
Adding changed files:  63% |######################              | ETA:  0:00:28
Adding changed files:  64% |#######################             | ETA:  0:00:27
Adding changed files:  64% |#######################             | ETA:  0:00:27
Adding changed files:  65% |#######################             | ETA:  0:00:26
Adding changed files:  65% |#######################             | ETA:  0:00:26
Adding changed files:  66% |#######################             | ETA:  0:00:26
Adding changed files:  66% |########################            | ETA:  0:00:25
Adding changed files:  67% |########################            | ETA:  0:00:25
Adding changed files:  67% |########################            | ETA:  0:00:25
Adding changed files:  68% |########################            | ETA:  0:00:24
Adding changed files:  68% |########################            | ETA:  0:00:24
Adding changed files:  69% |########################            | ETA:  0:00:23
Adding changed files:  69% |#########################           | ETA:  0:00:23
Adding changed files:  70% |#########################           | ETA:  0:00:23
Adding changed files:  70% |#########################           | ETA:  0:00:22
Adding changed files:  71% |#########################           | ETA:  0:00:22
Adding changed files:  71% |#########################           | ETA:  0:00:22
Adding changed files:  72% |##########################          | ETA:  0:00:21
Adding changed files:  72% |##########################          | ETA:  0:00:21
Adding changed files:  73% |##########################          | ETA:  0:00:20
Adding changed files:  74% |##########################          | ETA:  0:00:20
Adding changed files:  74% |##########################          | ETA:  0:00:20
Adding changed files:  75% |###########################         | ETA:  0:00:19
Adding changed files:  75% |###########################         | ETA:  0:00:19
Adding changed files:  76% |###########################         | ETA:  0:00:18
Adding changed files:  76% |###########################         | ETA:  0:00:18
Adding changed files:  77% |###########################         | ETA:  0:00:18
Adding changed files:  77% |###########################         | ETA:  0:00:17
Adding changed files:  78% |############################        | ETA:  0:00:17
Adding changed files:  78% |############################        | ETA:  0:00:17
Adding changed files:  79% |############################        | ETA:  0:00:16
Adding changed files:  79% |############################        | ETA:  0:00:16
Adding changed files:  80% |############################        | ETA:  0:00:15
Adding changed files:  80% |#############################       | ETA:  0:00:15
Adding changed files:  81% |#############################       | ETA:  0:00:15
Adding changed files:  81% |#############################       | ETA:  0:00:14
Adding changed files:  82% |#############################       | ETA:  0:00:14
Adding changed files:  82% |#############################       | ETA:  0:00:13
Adding changed files:  83% |#############################       | ETA:  0:00:13
Adding changed files:  83% |##############################      | ETA:  0:00:13
Adding changed files:  84% |##############################      | ETA:  0:00:12
Adding changed files:  84% |##############################      | ETA:  0:00:12
Adding changed files:  85% |##############################      | ETA:  0:00:11
Adding changed files:  85% |##############################      | ETA:  0:00:11
Adding changed files:  86% |###############################     | ETA:  0:00:11
Adding changed files:  86% |###############################     | ETA:  0:00:10
Adding changed files:  87% |###############################     | ETA:  0:00:10
Adding changed files:  87% |###############################     | ETA:  0:00:09
Adding changed files:  88% |###############################     | ETA:  0:00:09
Adding changed files:  88% |###############################     | ETA:  0:00:09
Adding changed files:  89% |################################    | ETA:  0:00:08
Adding changed files:  89% |################################    | ETA:  0:00:08
Adding changed files:  90% |################################    | ETA:  0:00:07
Adding changed files:  90% |################################    | ETA:  0:00:07
Adding changed files:  91% |################################    | ETA:  0:00:07
Adding changed files:  91% |#################################   | ETA:  0:00:06
Adding changed files:  92% |#################################   | ETA:  0:00:06
Adding changed files:  92% |#################################   | ETA:  0:00:05
Adding changed files:  93% |#################################   | ETA:  0:00:05
Adding changed files:  93% |#################################   | ETA:  0:00:05
Adding changed files:  94% |#################################   | ETA:  0:00:04
Adding changed files:  94% |##################################  | ETA:  0:00:04
Adding changed files:  95% |##################################  | ETA:  0:00:03
Adding changed files:  95% |##################################  | ETA:  0:00:03
Adding changed files:  96% |##################################  | ETA:  0:00:03
Adding changed files:  96% |##################################  | ETA:  0:00:02
Adding changed files:  97% |################################### | ETA:  0:00:02
Adding changed files:  97% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:01:21
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.100.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto c731b0a73fa5e916f9fc0545fd5432c1a0275a8c
WARNING: Command 'git rebase c731b0a73fa5e916f9fc0545fd5432c1a0275a8c' failed:
CONFLICT (modify/delete): vendor/cc-1.2.0/.cargo-checksum.json deleted in HEAD and modified in 52c676af7d (cc: hash object names relative to the root the source came from).  Version 52c676af7d (cc: hash object names relative to the root the source came from) of vendor/cc-1.2.0/.cargo-checksum.json left in tree.
Auto-merging vendor/cc-1.4.3/src/command_helpers.rs
CONFLICT (content): Merge conflict in vendor/cc-1.4.3/src/command_helpers.rs

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rust-source-1.99.1
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rust-source-1.99.1/rust-source-1.99.1_1.100.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/rust-source-1.99.1.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/rust-source-1.99.1.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0633510703798228372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rust-source-1.99.1-changelog.txt"

14.1.1 (2024-09-08)
===================
This is a minor release with a bug fix for a matching bug. In particular, a bug
was found that could cause ripgrep to ignore lines that should match. That is,
false negatives. It is difficult to characterize the specific set of regexes
in which this occurs as it requires multiple different optimization strategies
to collide and produce an incorrect result. But as one reported example, in
ripgrep, the regex `(?i:e.x|ex)` does not match `e-x` when it should. (This
bug is a result of an inner literal optimization performed in the `grep-regex`
crate and not in the `regex` crate.)

Bug fixes:
Miscellaneous:

14.1.0 (2024-01-06)
===================
This is a minor release with a few small new features and bug fixes. This
release contains a bug fix for unbounded memory growth while walking a
directory tree. This release also includes improvements to the completions for
the `fish` shell, and release binaries for several additional ARM targets.

Bug fixes:
Feature enhancements:

14.0.3 (2023-11-28)
===================
This is a patch release with a bug fix for the `--sortr` flag.

Bug fixes:

14.0.2 (2023-11-27)
===================
This is a patch release with a few small bug fixes.

Bug fixes:

14.0.1 (2023-11-26)
===================
This a patch release meant to fix `cargo install ripgrep` on Windows.

Bug fixes:

14.0.0 (2023-11-26)
===================
ripgrep 14 is a new major version release of ripgrep that has some new
features, performance improvements and a lot of bug fixes.

The headlining feature in this release is hyperlink support. In this release,
they are an opt-in feature but may change to an opt-out feature in the future.
To enable them, try passing `--hyperlink-format default`. If you use [VS Code],
then try passing `--hyperlink-format vscode`. Please [report your experience
with hyperlinks][report-hyperlinks], positive or negative.

[VS Code]: https://code.visualstudio.com/
[report-hyperlinks]: https://github.com/BurntSushi/ripgrep/discussions/2611

Another headlining development in this release is that it contains a rewrite
of its regex engine. You generally shouldn't notice any changes, except for
some searches may get faster. You can read more about the [regex engine rewrite
on my blog][regex-internals]. Please [report your performance improvements or
regressions that you notice][report-perf].

[report-perf]: https://github.com/BurntSushi/ripgrep/discussions/2652

Finally, ripgrep switched the library it uses for argument parsing. Users
should not notice a difference in most cases (error messages have changed
somewhat), but flag overrides should generally be more consistent. For example,
things like `--no-ignore --ignore-vcs` work as one would expect (disables all
filtering related to ignore rules except for rules found in version control
systems such as `git`).

[regex-internals]: https://blog.burntsushi.net/regex-internals/
**BREAKING CHANGES**:
Build process changes:
Performance improvements:
Feature enhancements:
Bug fixes:

13.0.0 (2021-06-12)
===================
ripgrep 13 is a new major version release of ripgrep that primarily contains
bug fixes, some performance improvements and a few minor breaking changes.
There is also a fix for a security vulnerability on Windows
([CVE-2021-3013](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3013)).

Some highlights:

A new short flag, `-.`, has been added. It is an alias for the `--hidden` flag,
which instructs ripgrep to search hidden files and directories.

ripgrep is now using a new
[vectorized implementation of `memmem`]( ),
which accelerates many common searches. If you notice any performance
regressions (or major improvements), I'd love to hear about them through an
issue report!

Also, for Windows users targeting MSVC, Cargo will now build fully static
executables of ripgrep. The release binaries for ripgrep 13 have been compiled
using this configuration.

**BREAKING CHANGES**:
**Binary detection output has changed slightly.**

In this release, a small tweak has been made to the output format when a binary
file is detected. Previously, it looked like this:

```
Binary file FOO matches (found "\0" byte around offset XXX)
```

Now it looks like this:

```
FOO: binary file matches (found "\0" byte around offset XXX)
```

**vimgrep output in multi-line now only prints the first line for each match.**

See [issue 1866]( ) for more
discussion on this. Previously, every line in a match was duplicated, even
when it spanned multiple lines. There are no changes to vimgrep output when
multi-line mode is disabled.

**In multi-line mode, --count is now equivalent to --count-matches.**

This appears to match how `pcre2grep` implements `--count`. Previously, ripgrep
would produce outright incorrect counts. Another alternative would be to simply
count the number of lines---even if it's more than the number of matches---but
that seems highly unintuitive.

**FULL LIST OF FIXES AND IMPROVEMENTS:**
Security fixes:
Performance improvements:
Feature enhancements:
Bug fixes:

12.1.1 (2020-05-29)
===================
ripgrep 12.1.1 is a patch release that fixes a couple small bugs. In
particular, the ripgrep 12.1.0 release did not tag new releases for all of its
in-tree dependencies. As a result, ripgrep built dependencies from crates.io
would produce a different build than compiling ripgrep from source on the
`12.1.0` tag. Namely, some crates like `grep-cli` had unreleased changes.

Bug fixes:

12.1.0 (2020-05-09)
===================
ripgrep 12.1.0 is a small minor version release that mostly includes bug fixes
and documentation improvements. This release also contains some important
notices for downstream packagers.

**Notices for downstream ripgrep package maintainers:**
Feature enhancements:
Bug fixes:

12.0.1 (2020-03-29)
===================
ripgrep 12.0.1 is a small patch release that includes a minor bug fix relating
to superfluous error messages when searching git repositories with sub-modules.
This was a regression introduced in the 12.0.0 release.

Bug fixes:

12.0.0 (2020-03-15)
===================
ripgrep 12 is a new major version release of ripgrep that contains many bug
fixes, several important performance improvements and a few minor new features.

In a near future release, I am hoping to add an
[indexing feature]( )
to ripgrep, which will dramatically speed up searching by building an index.
Feedback would very much be appreciated, especially on the user experience
which will be difficult to get right.

This release has no known breaking changes.
Deprecations:
Performance improvements:
Feature enhancements:
Bug fixes:

11.0.2 (2019-08-01)
===================
ripgrep 11.0.2 is a new patch release that fixes a few bugs, including a
performance regression and a matching bug when using the `-F/--fixed-strings`
flag.

Feature enhancements:
Bug fixes:

11.0.1 (2019-04-16)
===================
ripgrep 11.0.1 is a new patch release that fixes a search regression introduced
in the previous 11.0.0 release. In particular, ripgrep can enter an infinite
loop for some search patterns when searching invalid UTF-8.

Bug fixes:

11.0.0 (2019-04-15)
===================
ripgrep 11 is a new major version release of ripgrep that contains many bug
fixes, some performance improvements and a few feature enhancements. Notably,
ripgrep's user experience for binary file filtering has been improved. See the
[guide's new section on binary data](GUIDE.md#binary-data) for more details.

This release also marks a change in ripgrep's versioning. Where as the previous
version was `0.10.0`, this version is `11.0.0`. Moving forward, ripgrep's
major version will be increased a few times per year. ripgrep will continue to
be conservative with respect to backwards compatibility, but may occasionally
introduce breaking changes, which will always be documented in this CHANGELOG.
See [issue 1172]( ) for a bit
more detail on why this versioning change was made.

This release increases the **minimum supported Rust version** from 1.28.0 to
1.34.0.

**BREAKING CHANGES**:
Performance improvements:
Feature enhancements:
Bug fixes:

0.10.0 (2018-09-07)
===================
This is a new minor version release of ripgrep that contains some major new
features, a huge number of bug fixes, and is the first release based on
libripgrep. The entirety of ripgrep's core search and printing code has been
rewritten and generalized so that anyone can make use of it.

Major new features include PCRE2 support, multi-line search and a JSON output
format.

**BREAKING CHANGES**:
Feature enhancements:
Bug fixes:

0.9.0 (2018-08-03)
==================
This is a new minor version release of ripgrep that contains some minor new
features and a panoply of bug fixes.

Releases provided on Github for `x86_64` will now work on all target CPUs, and
will also automatically take advantage of features found on modern CPUs (such
as AVX2) for additional optimizations.

This release increases the **minimum supported Rust version** from 1.20.0 to
1.23.0.

It is anticipated that the next release of ripgrep (0.10.0) will provide
multi-line search support and a JSON output format.

**BREAKING CHANGES**:
Feature enhancements:
Bug fixes:

0.8.1 (2018-02-20)
==================
This is a patch release of ripgrep that primarily fixes regressions introduced
in 0.8.0 (#820 and #824) in directory traversal on Windows. These regressions
do not impact non-Windows users.

Feature enhancements:
Bug fixes:

0.8.0 (2018-02-11)
==================
This is a new minor version release of ripgrep that satisfies several popular
feature requests (config files, search compressed files, true colors), fixes
many bugs and improves the quality of life for ripgrep maintainers. This
release also includes greatly improved documentation in the form of a
[User Guide](GUIDE.md) and a [FAQ](FAQ.md).

This release increases the **minimum supported Rust version** from 1.17 to
1.20.

**BREAKING CHANGES**:
Note that these are all very minor and unlikely to impact most users.
Feature enhancements:
Bug fixes:
Maintenance fixes:
Friends of ripgrep:

I'd like to extend my gratitude to
[@balajisivaraman](https://github.com/balajisivaraman)
for their recent hard work in a number of areas, and in particular, for
implementing the "search compressed files" feature. Their work in sketching out
a specification for that and other work has been exemplary.

Thanks
[@balajisivaraman](https://github.com/balajisivaraman)!

0.7.1 (2017-10-22)
==================
This is a patch release of ripgrep that includes a fix to very bad regression
introduced in ripgrep 0.7.0.

Bug fixes:

0.7.0 (2017-10-20)
==================
This is a new minor version release of ripgrep that includes mostly bug fixes.

ripgrep continues to require Rust 1.17, and there are no known breaking changes
introduced in this release.

Feature enhancements:
Bug fixes:

0.6.0 (2017-08-23)
==================
This is a new minor version release of ripgrep that includes many bug fixes
and a few new features such as `--iglob` and `-x/--line-regexp`.

Note that this release increases the minimum supported Rust version from 1.12
to 1.17.

Feature enhancements:
Bug fixes:
Friends of ripgrep:

I'd like to give a big Thank You to @okdana for their recent hard work on
ripgrep. This includes new features like `--line-regexp`, heroic effort on
zsh auto-completion and thinking through some thorny argv issues with me.

I'd also like to thank @ericbn for their work on improving ripgrep's argv
parsing by allowing some flags to override others.

Thanks @okdana and @ericbn!

0.5.2 (2017-05-11)
==================
Feature enhancements:

Bug fixes:

0.5.1 (2017-04-09)
==================
Feature enhancements:

Bug fixes:

0.5.0 (2017-03-12)
==================
This is a new minor version release of ripgrep that includes one minor breaking
change, bug fixes and several new features including support for text encodings
other than UTF-8.

A notable accomplishment with respect to Rust is that ripgrep proper now only
contains a single `unsafe` use (for accessing the contents of a memory map).

The **breaking change** is:
Feature enhancements:
Bug fixes:

0.4.0
=====
This is a new minor version release of ripgrep that includes a couple very
minor breaking changes, a few new features and lots of bug fixes.

This version of ripgrep upgrades its `regex` dependency from `0.1` to `0.2`,
which includes a few minor syntax changes:

Feature enhancements:
Bug fixes:

0.3.2
=====
Feature enhancements:

Bug fixes:

0.3.1
=====
Bug fixes:

0.3.0
=====
This is a new minor version release of ripgrep that includes two breaking
changes with lots of bug fixes and some new features and performance
improvements. Notably, if you had a problem with colors or piping on Windows
before, then that should now be fixed in this release.

**BREAKING CHANGES**:
Performance improvements:
Feature enhancements:
Bug fixes:

0.2.9
=====
Bug fixes:

0.2.8
=====
Bug fixes:

0.2.7
=====
Performance improvements:

Feature enhancements:
Bug fixes:

0.2.6
=====
Feature enhancements:

Bug fixes:

0.2.5
=====
Feature enhancements:

Bug fixes:

0.2.4
=====
SKIPPED.

0.2.3
=====
Bug fixes:

0.2.2
=====
Packaging updates:

Feature enhancements:
Bug fixes:

0.2.1
=====
Feature enhancements:

Bug fixes:

0.2.0
=====
Feature enhancements:

Many many bug fixes. Thanks every for reporting these and helping make
`ripgrep` better! (Note that I haven't captured every tracking issue here,
some were closed as duplicates.)

# Release Checklist
Note that [`cargo-up` can be found in BurntSushi's dotfiles][dotfiles].
[dotfiles]: https://github.com/BurntSushi/dotfiles/blob/master/bin/cargo-up

--===============0633510703798228372==--

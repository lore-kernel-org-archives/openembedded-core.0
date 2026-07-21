Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF87FC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 05:21:28 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16168.1784611286767352514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 22:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RrG/Ghqn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mNDVsMYR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f831f2b78-a4470965-3900-4dfe-9791-7e8e4407a80b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784611286;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=PxELPISVpFntD9gmj+YB4/za8Zfq57gM1LH9dRYN+Cs=;
	b=RrG/GhqnHnOLMRHKyQSBvWBFxVR9bpVUBCw+OnaS5JwA+lwhVcczTv7KFBQIrDWN
	4giCAlB746ia6Knaiq3QiqWVSVjQm5FdFDEIaZ8wwKUpgtuLJaUXc47WMqfmvDSYtmQ
	Mug3eG8jDq3VKpFYHNkSADUo0TMk2AlCK4U8mDMQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784611286;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=PxELPISVpFntD9gmj+YB4/za8Zfq57gM1LH9dRYN+Cs=;
	b=mNDVsMYR9otBW9hdEM2kC/ZpMo3J8eemibpfw2dwj33f+cvPamZCGmZZGGmlvg1x
	kw0/77UGRtbhnDcHcN00YNBskH48lTivWbzi/dkpc7DOzjMkD/YjADqHPlcUKV23ZP1
	My+cD/ANIOi/Q5bZStQYM6FVodL47+LbdtClQTRU=
Content-Type: multipart/mixed; boundary="===============7371975871610581866=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.44.0 FAILED
Message-ID: <0101019f831f2b78-a4470965-3900-4dfe-9791-7e8e4407a80b-000000@us-west-2.amazonses.com>
Date: Tue, 21 Jul 2026 05:21:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.21-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 05:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241500

--===============7371975871610581866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.44.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe perl failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a6c162c3163c7f4f70871f472b63ac4af9d725d9"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a6c162c3163c7f4f70871f472b63ac4af9d725d9"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
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
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-as0ppqhy.bb: tmp-recipetool-as0ppqhy: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-as0ppqhy-CLOSED"
done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a6c162c3163c7f4f70871f472b63ac4af9d725d9"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a6c162c3163c7f4f70871f472b63ac4af9d725d9"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-as0ppqhy: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-as0ppqhy-CLOSED"
WARNING: tmp-recipetool-as0ppqhy: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-as0ppqhy-CLOSED"
WARNING: tmp-recipetool-as0ppqhy: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-as0ppqhy-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: tmp-recipetool-as0ppqhy: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-as0ppqhy-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  15% |#####                               | ETA:  0:00:01
Adding changed files:  23% |########                            | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  47% |################                    | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://www.cpan.org/src/5.0/perl-5.44.0.tar.gz;name=perl...
INFO: Rebasing devtool onto 08a5920a42557d4501f366f4df4515176c9f0770
WARNING: Command 'git rebase 08a5920a42557d4501f366f4df4515176c9f0770' failed:
Auto-merging t/re/pat_psycho.t
CONFLICT (content): Merge conflict in t/re/pat_psycho.t

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 08a5920a42557d4501f366f4df4515176c9f0770
WARNING: Command 'git rebase 08a5920a42557d4501f366f4df4515176c9f0770' failed:
Auto-merging t/re/pat_psycho.t
CONFLICT (content): Merge conflict in t/re/pat_psycho.t

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 08a5920a42557d4501f366f4df4515176c9f0770
WARNING: Command 'git rebase 08a5920a42557d4501f366f4df4515176c9f0770' failed:
Auto-merging t/re/pat_psycho.t
CONFLICT (content): Merge conflict in t/re/pat_psycho.t

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/perl
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/perl/perl_5.44.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/perl.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7371975871610581866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="perl-changelog.txt"

Changelog for perl: 5.42.2 -> 5.44.0
Source: dist/Attribute-Handlers/Changes

Revision history for Perl extension Attribute-Handlers
1.03 2022-10-17 (perl core only)
  - reduce how much code is in a string eval, to make debugging simpler
1.02 2022-02-25 (perl core only)
  - fix __CALLER__ handling in Attribute::Handlers
  - wrap any existing import in the Attribute::Handlers import
1.01 2017-09-12 (perl core only)
  - replace "use vars" with "our" variables
1.00 2016-01-18 (perl core only)
  - remove deprecated no-op :unique and :locked attributes
0.99 Fri Jul 24 18:44:48 EDT 2015
  - CPAN release of v0.97 code
0.97  Sun Jun  1 12:00:00 GMT 2015
  - fixes to deal with CVs without GVs
0.96  Fri Mar  7 08:30:00 CET 2014
  - Documentation fixes
  - Replace use of base.pm with parent.pm
0.93  Mon Dec 19 09:19:00 CET 2011
  - documentation: "my" should be "till" (Frederic Briere)
  - Spelling fixes (Father Chrysostomos)
  - Indentation fixes (Father Chrysostomos)
0.91  Fri May 20 20:00:00 CET 2011
  - Typo fixes in documentation
  - POD link fix.
0.88  Mon Apr  5 16:33:00 CET 2010
  - Avoid clobbering $_ (perl #74052, LanX)
0.87  Mon Sep 21 15:55:00 CET 2009
  - Promote to stable release
0.86_01  Thu Sep 17 10:01:00 CET 2009
  - From perl change 09330df80caf214f375fcf0c04857347e3b17c69 (Zefram):
    Fix [perl #66970] Incorrect coderef in MODIFY_CODE_ATTRIBUTES
    Attribute handlers being applied to a temporary CV has actually been
    reported as a bug, #66970.  The attached patch fixes the bug, by
    changing the order in which things happen: attributes are now
    applied after the temporary CV has been merged into the existing CV
    or has otherwise been added to the appropriate GV.
    The change breaks part of Attribute::Handlers.  Part of A:H searches
    the package to find the name of the sub to which a :ATTR attribute
    is being applied, and the correct time at which to launch that
    search depends crucially on the order in which the CV construction
    events occur. So this patch also includes a change to A:H, to make
    it detect which way things happen.  The resulting A:H works either
    way, which is essential for its dual-life nature.
0.86  Sat Aug  8 12:41:00 CET 2009
  - Add resources (bugtracker, ...) section to META.yml
0.85  Thu Jun 11 09:31:00 CET 2009
  - Document findsym for the sake of mod_perl. (David Wheeler)
  - Remove unused variable. (David Wheeler)
0.84  Wed Jun 10 15:14:00 CET 2009
  - Core-CPAN synchronization
0.83  Fri Mar 13 15:14:00 CET 2009
  - Re-add a TODO marker in the tests that would fail on 5.6.2.
0.82  Wed Mar 11 17:17:00 CET 2009
  - Bring test code in line with core perl.
0.81  Sun Nov  9 22:47:00 CET 2008
  - Fix to make tests work on 5.6.X (Eric Rybski, RT #40781)
0.80  Fri Oct 24 12:06:00 CEST 2008
  - CPAN release of the Attribute::Handlers version in bleadperl.
0.79
  - The version released with Perl 5.10.0
  - All interpreted attributes are now passed as array references,
    eventually nested.
  - Don't AUTOLOAD DESTROY (Jerry D Hedden, cpan bug #1911)
  - A::H is now able to report caller's file and line number
    (David Feldman)
0.78  Sat Oct  5 07:18:09 CEST 2002
  - [#17940] Includes :unique and :shared in the builtin types
  - From perl 5.8 { __CALLER__::foo => __PACKAGE } is missparsed, the
    proper approach is to use  { '__CALLER__::foo' => __PACKAGE }.  The
    documentation is updated to reflect this.  Reported by Dave Cross
0.77  Sat Jun  8 22:58:56 CEST 2002
  - Since Attribute::Handlers now is core, I will refer to changes with
    their patch number, please read  Porting/repository.pod from your a
    perl tarball for more information.
  - Brought up to date with perl 5.8RC1 version will be 5.8 if no more
    changes come in
  - [#13686] This changes the behaviour of lexical attributes.  Prior to
    this lexical attributes were done at a compile time, and they would
    loose their attribute on the next run over them.  Now perl 5.8 calls
    the attribute handler runtime whenever it hits my.
  - [#14448] Fixes cases with too high refcounts on lexical attributes
  - [#15945] Do not warn about too late CHECK and INIT block if
    A::H is pulled in using a require.
0.76  Thu Nov 15 06:31:51 2001
  - Fixed documentation nit (thanks Rick)
  - Improving intuitiveness of autotie mechanism (thanks Marcel)
  - Added $VERSION numbrs to demo modules (seems bizarre to me, but
    they're core too now).
0.75  Mon Sep  3 09:07:08 2001
  - Cleaned up AUTOLOAD
  - Numerous bug fixes (thanks Pete)
  - Fixed handling of attribute data that includes a newline (thanks Pete)
  - Added "autotieref" option (thanks Pete)
  - Switched off $DB::single
  - Changed licence for inclusion in core distribution
  - Fixed 'autotie' for tied classes with multi-level names (thanks Jeff)
0.70  Sun Jun  3 07:40:03 2001
  - Added __CALLER__ pseudo class for 'autotie'
  - Added multi-phasic attribute handlers (thanks Garrett)
  - Fixed nasty $SIG{__WARN__}-induced bug
  - Cached ref/symbol mapping for better performance and more
    reliable symbol identification under evil typeglob manipulations
  - Added option to pass arguments when autotied classes are imported
    (thanks Marcel)
  - Fixed bug in handling of lexical SCALAR refs
  - Cleaned up interactions with other class hierarchies
    (due to being base class of UNIVERSAL)
0.61  Thu May 10 16:28:06 2001
  - Critical doc patch
0.60  Thu May 10 15:46:02 2001
  - Added RAWDATA specifier
  - Cleaned up documentation (thanks Garrett)
  - Added warning for all-lowercase handlers (thanks Garrett)
  - Added autotie functionality
  - Tweaked handling of anon arrays as attribute args
0.51  Tue May  1 06:33:15 2001
  - Fixed fatal file path error in MANIFEST (thanks Marcel and Jost)
0.50  Sat Apr 21 16:09:31 2001
  - original version;

--===============7371975871610581866==--


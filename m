Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7362.1794460832594958625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 21:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bnvsADPE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xviuMbs0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1ce334f5a-b9e37af6-309e-4695-affe-846dfe49c8d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794460831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=avjh5TdbYcFA/++Lrp16mybHT4J4FpR8WUeBviursdU=;
	b=bnvsADPELpntcb4u5cElQvPCcsN6h5W0FGOfEdCyWQZjejB7UKCpsuKasEJl+ynS
	Dnllg8hSrB2RWIsvorpis7MZ1W+3/5vsXeXangxSBkl0OP4+hmCirf4fLbnaFZd7Ubr
	WlfWD04YzAs/XF/hTqGep4/loEnCjREQddmgCCQM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794460831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=avjh5TdbYcFA/++Lrp16mybHT4J4FpR8WUeBviursdU=;
	b=xviuMbs03QtxFF0sJqmsuPDFEfqriyUJpqLwiQi1dfGC0aU3TbDchrbh2bR/FluB
	XbwiKqoeowt3Rb1Z2XVAPqc+TNUcscvPgNO8b6yXcjk2MXcok9Pa8cofJh956xoxQNW
	zEea1Bp5QygHWTGtQNZRtCLaV7y1nS/Iz6BMFJy4=
Content-Type: multipart/mixed; boundary="===============6826839857160572921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] flex: upgrading to 2.6.9 FAILED
Message-ID: <010101a1ce334f5a-b9e37af6-309e-4695-affe-846dfe49c8d8-000000@us-west-2.amazonses.com>
Date: Thu, 12 Nov 2026 05:20:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.12-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250070

--===============6826839857160572921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *flex* to *2.6.9* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe flex failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.1.99+snapshot-073c150d8a55a1468261c975b69fe480eb743f3f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:073c150d8a55a1468261c975b69fe480eb743f3f"
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
DISTRO_VERSION       = "6.1.99+snapshot-073c150d8a55a1468261c975b69fe480eb743f3f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:073c150d8a55a1468261c975b69fe480eb743f3f"
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
Adding changed files:  27% |#########                           | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/westes/flex/releases/download/v2.6.9/flex-2.6.9.tar.gz...
INFO: Rebasing devtool onto 3c29ba0a731d561be089806a9a97352cd6ab3364
WARNING: Command 'git rebase 3c29ba0a731d561be089806a9a97352cd6ab3364' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/flex
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/flex/flex_2.6.9.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/flex.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/flex.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6826839857160572921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="flex-changelog.txt"

ghcr.io/westes/flex-
ci@sha256:83a5849088fb651a5cae4958c97c4de4496aeda904279fa445a71e98ad5935f0.

ghcr.io/westes/flex-
ci@sha256:8fabfd5186659b13b3c769a0b7d4b798862fabee59160c76aa22c0f0124e004b.

ghcr.io/westes/flex-
ci@sha256:89a63cd98e8c377a3041278518a1043084e0c08509100cfb9c4e651155ca5303.

[github/codeql-action/analyze](https://github.com/github/codeql-action).Updates
`github/codeql-action/init` from 4.39.1 to 4.39.3 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/9b3254085494b55a0f7c4c
2b3d2d52cc712ce370...33d7b85da1a04171e211befe2c739303b9a4c066)Updates
`github/codeql-action/analyze` from 4.39.1 to 4.39.3 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/9b3254085494b55a0f7c4c
2b3d2d52cc712ce370...33d7b85da1a04171e211befe2c739303b9a4c066)--- updated-
dependencies: - dependency-name: github/codeql-action/init   dependency-version:
4.39.3   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions - dependency-name:
github/codeql-action/analyze   dependency-version: 4.39.3   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[github/codeql-action/analyze](https://github.com/github/codeql-action).Updates
`github/codeql-action/init` from 4.37.4 to 4.39.1 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/f205ea1c3313d32999d8d6
a48b4f6530d4437b38...9b3254085494b55a0f7c4c2b3d2d52cc712ce370)Updates
`github/codeql-action/analyze` from 4.37.4 to 4.39.1 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/f205ea1c3313d32999d8d6
a48b4f6530d4437b38...9b3254085494b55a0f7c4c2b3d2d52cc712ce370)--- updated-
dependencies: - dependency-name: github/codeql-action/init   dependency-version:
4.39.1   dependency-type: direct:production   update-type: version-
update:semver-minor   dependency-group: github-actions - dependency-name:
github/codeql-action/analyze   dependency-version: 4.39.1   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[github/codeql-action/analyze](https://github.com/github/codeql-action).Updates
`github/codeql-action/init` from 4.37.3 to 4.37.4 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/e4fba868fa4b1b91e1fdab
776edc8cfbe6e9fb81...f205ea1c3313d32999d8d6a48b4f6530d4437b38)Updates
`github/codeql-action/analyze` from 4.37.3 to 4.37.4 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/e4fba868fa4b1b91e1fdab
776edc8cfbe6e9fb81...f205ea1c3313d32999d8d6a48b4f6530d4437b38)--- updated-
dependencies: - dependency-name: github/codeql-action/init   dependency-version:
4.37.4   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions - dependency-name:
github/codeql-action/analyze   dependency-version: 4.37.4   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[github/codeql-action/analyze](https://github.com/github/codeql-action).Updates
`actions/checkout` from 7.0.0 to 7.0.1 - [Release
notes](https://github.com/actions/checkout/releases) -

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/9c091bb21b7c1c1d1991bb908d
89e4e9dddfe3e0...3d3c42e5aac5ba805825da76410c181273ba90b1)Updates
`github/codeql-action/init` from 4.36.3 to 4.37.3 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/54f647b7e1bb85c95cddab
cd46b0c578ec92bc1a...e4fba868fa4b1b91e1fdab776edc8cfbe6e9fb81)Updates
`github/codeql-action/analyze` from 4.36.3 to 4.37.3 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/54f647b7e1bb85c95cddab
cd46b0c578ec92bc1a...e4fba868fa4b1b91e1fdab776edc8cfbe6e9fb81)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-version: 7.0.1
dependency-type: direct:production   update-type: version-update:semver-patch
dependency-group: github-actions - dependency-name: github/codeql-action/init
dependency-version: 4.37.3   dependency-type: direct:production   update-type:
version-update:semver-minor   dependency-group: github-actions - dependency-
name: github/codeql-action/analyze   dependency-version: 4.37.3   dependency-
type: direct:production   update-type: version-update:semver-minor   dependency-
group: github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[github/codeql-action/analyze](https://github.com/github/codeql-action).Updates
`github/codeql-action/init` from 4.36.2 to 4.36.3 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/8aad20d150bbac5944a9f9
d289da16a4b0d87c1e...54f647b7e1bb85c95cddabcd46b0c578ec92bc1a)Updates
`github/codeql-action/analyze` from 4.36.2 to 4.36.3 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/8aad20d150bbac5944a9f9
d289da16a4b0d87c1e...54f647b7e1bb85c95cddabcd46b0c578ec92bc1a)--- updated-
dependencies: - dependency-name: github/codeql-action/init   dependency-version:
4.36.3   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions - dependency-name:
github/codeql-action/analyze   dependency-version: 4.36.3   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/df4cb1c069e1874edd31b4311f
1884172cec0e10...9c091bb21b7c1c1d1991bb908d89e4e9dddfe3e0)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-version: 7.0.0
dependency-type: direct:production   update-type: version-update:semver-major
dependency-group: github-actions ...  Signed-off-by: dependabot[bot]
<support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/87557b9c84dde89fdd9b10
e88954ac2f4248e463...8aad20d150bbac5944a9f9d289da16a4b0d87c1e)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
4.36.2   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/de0fac2e4500dabe0009e67214
ff5f5447ce83dd...df4cb1c069e1874edd31b4311f1884172cec0e10)Updates
`github/codeql-action` from 4.36.0 to 4.36.1 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/7211b7c8077ea37d8641b6
271f6a365a22a5fbfa...87557b9c84dde89fdd9b10e88954ac2f4248e463)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-version: 6.0.3
dependency-type: direct:production   update-type: version-update:semver-patch
dependency-group: github-actions - dependency-name: github/codeql-action
dependency-version: 4.36.1   dependency-type: direct:production   update-type:
version-update:semver-patch   dependency-group: github-actions ...  Signed-off-
by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/9e0d7b8d25671d64c341c1
9c0152d693099fb5ba...7211b7c8077ea37d8641b6271f6a365a22a5fbfa)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
4.36.0   dependency-type: direct:production   update-type: version-
update:semver-minor   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/e46ed2cbd01164d986452f
91f178727624ae40d7...9e0d7b8d25671d64c341c19c0152d693099fb5ba)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
4.35.4   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/95e58e9a2cdfd71adc6e03
53d5c52f41a045d225...e46ed2cbd01164d986452f91f178727624ae40d7)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
4.35.3   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/c10b8064de6f491fea5242
54123dbe5e09572f13...95e58e9a2cdfd71adc6e0353d5c52f41a045d225)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
4.35.2   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/c793b717bc78562f491db7
b0e93a3a178b099162...c10b8064de6f491fea524254123dbe5e09572f13)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
4.35.1   dependency-type: direct:production   update-type: version-
update:semver-minor   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/89a39a4e59826350b863aa
6b6252a07ad50cf83e...c793b717bc78562f491db7b0e93a3a178b099162)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
4.32.5   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/08c6903cd8c0fde910a37f8832
2edcfb5dd907a8...de0fac2e4500dabe0009e67214ff5f5447ce83dd)Updates
`github/codeql-action` from 3.29.10 to 4.32.4 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/96f518a34f7a8700180577
16cc4d7a5c014bd61c...89a39a4e59826350b863aa6b6252a07ad50cf83e)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-version: 6.0.2
dependency-type: direct:production   update-type: version-update:semver-major
dependency-group: github-actions - dependency-name: github/codeql-action
dependency-version: 4.32.4   dependency-type: direct:production   update-type:
version-update:semver-major   dependency-group: github-actions ...  Signed-off-
by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/11bd71901bbe5b1630ceea73d2
7597364c9af683...08c6903cd8c0fde910a37f88322edcfb5dd907a8)Updates
`github/codeql-action` from 3.28.18 to 3.29.10 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/ff0a06e83cb2de871e5a09
832bc6a81e7276941f...96f518a34f7a870018057716cc4d7a5c014bd61c)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-version: 5.0.0
dependency-type: direct:production   update-type: version-update:semver-major
dependency-group: github-actions - dependency-name: github/codeql-action
dependency-version: 3.29.10   dependency-type: direct:production   update-type:
version-update:semver-minor   dependency-group: github-actions ...  Signed-off-
by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/1b549b9259bda1cb5ddde3
b41741a82a2d15a841...ff0a06e83cb2de871e5a09832bc6a81e7276941f)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-version:
3.28.18   dependency-type: direct:production   update-type: version-
update:semver-patch   dependency-group: github-actions ...  Signed-off-by:
dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/6bb031afdd8eb862ea3fc1
848194185e076637e5...1b549b9259bda1cb5ddde3b41741a82a2d15a841)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/b6a472f63d85b9c78a3ac5
e89422239fc15e9b3c...6bb031afdd8eb862ea3fc1848194185e076637e5)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/48ab28a6f5dbc2a99bf1e0
131198dd8f1df78169...b6a472f63d85b9c78a3ac5e89422239fc15e9b3c)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/f09c1c0a94de965c15400f
5634aa42fac8fb8f88...48ab28a6f5dbc2a99bf1e0131198dd8f1df78169)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/4f3212b61783c3c68e8309
a0f18a699764811cda...f09c1c0a94de965c15400f5634aa42fac8fb8f88)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/eef61447b9ff4aafe5dcd4e0bb
f5d482be7e7871...11bd71901bbe5b1630ceea73d27597364c9af683)Updates
`github/codeql-action` from 3.26.13 to 3.27.1 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/f779452ac5af1c261dce03
46a8f964149f49322b...4f3212b61783c3c68e8309a0f18a699764811cda)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/d632683dd7b4114ad314bca155
54477dd762a938...eef61447b9ff4aafe5dcd4e0bbf5d482be7e7871)Updates
`github/codeql-action` from 3.26.11 to 3.26.13 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/6db8d6351fd0be61f9ed8e
bd12ccd35dcec51fea...f779452ac5af1c261dce0346a8f964149f49322b)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/e2b3eafc8d227b0241d48b
e5f425d47c2d750a13...6db8d6351fd0be61f9ed8ebd12ccd35dcec51fea)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/692973e3d937129bcbf40652eb
9f2f61becf3332...d632683dd7b4114ad314bca15554477dd762a938)Updates
`github/codeql-action` from 3.26.8 to 3.26.10 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/294a9d92911152fe08befb
9ec03e240add280cb3...e2b3eafc8d227b0241d48be5f425d47c2d750a13)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/8214744c546c1e5c8f03dd
e8fab3a7353211988d...294a9d92911152fe08befb9ec03e240add280cb3)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/2c779ab0d087cd7fe7b826
087247c2c81f27bfa6...8214744c546c1e5c8f03dde8fab3a7353211988d)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/429e1977040da7a23b6822
b13c129cd1ba93dbb2...2c779ab0d087cd7fe7b826087247c2c81f27bfa6)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/eb055d739abdc2e8de2e5f
4ba1a8b246daa779aa...429e1977040da7a23b6822b13c129cd1ba93dbb2)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/afb54ba388a7dca6ecae48
f608c4ff05ff4cc77a...eb055d739abdc2e8de2e5f4ba1a8b246daa779aa)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/b611370bb5703a7efb587f
9d136a52ea24c5c38c...afb54ba388a7dca6ecae48f608c4ff05ff4cc77a)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/23acc5c183826b7a8a97bc
e3cecc52db901f8251...b611370bb5703a7efb587f9d136a52ea24c5c38c)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/a5ac7e51b41094c92402da3b24
376905380afc29...692973e3d937129bcbf40652eb9f2f61becf3332)Updates
`github/codeql-action` from 3.25.8 to 3.25.10 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/2e230e8fe0ad3a14a340ad
0815ddb96d599d2aff...23acc5c183826b7a8a97bce3cecc52db901f8251)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/f079b8493333aace61c814
88f8bd40919487bd9f...2e230e8fe0ad3a14a340ad0815ddb96d599d2aff)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/9fdb3e49720b44c48891d0
36bb502feb25684276...f079b8493333aace61c81488f8bd40919487bd9f)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/44c2b7a8a4ea60a981eaca3cf9
39b5f4305c123b...a5ac7e51b41094c92402da3b24376905380afc29)Updates
`github/codeql-action` from 3.25.5 to 3.25.6 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/b7cec7526559c32f161647
6ff32d17ba4c59b2d6...9fdb3e49720b44c48891d036bb502feb25684276)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/0ad4b8fadaa221de15dcec353f
45205ec38ea70b...44c2b7a8a4ea60a981eaca3cf939b5f4305c123b)Updates
`github/codeql-action` from 3.25.3 to 3.25.5 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/d39d31e687223d841ef683
f52467bd88e9b21c14...b7cec7526559c32f1616476ff32d17ba4c59b2d6)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/1d96c772d19495a3b5c517cd2b
c0cb401ea0529f...0ad4b8fadaa221de15dcec353f45205ec38ea70b)Updates
`github/codeql-action` from 3.25.1 to 3.25.3 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/c7f9125735019aa87cfc36
1530512d50ea439c71...d39d31e687223d841ef683f52467bd88e9b21c14)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

https://lists.defectivebydesign.org/archive/html/help-flex/2013-01/msg00000.html
[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/9bb56186c3b09b4f86b1c65136
769dd318469633...1d96c772d19495a3b5c517cd2bc0cb401ea0529f)Updates
`github/codeql-action` from 3.24.10 to 3.25.1 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/4355270be187e1b672a7a1
c7c7bae5afdc1ab94a...c7f9125735019aa87cfc361530512d50ea439c71)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/1b1aada464948af03b9508
97e5eb522f92603cc2...4355270be187e1b672a7a1c7c7bae5afdc1ab94a)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/05963f47d870e2cb19a537
396c1f668a348c7d8f...1b1aada464948af03b950897e5eb522f92603cc2)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/012739e5082ff0c22ca6d6
ab32e07c36df03c4a4...e5f05b81d5b6ff8cfa111c80c22c5fd02a384118)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/407ffafae6a767df3e0230
c3df91b6443ae8df75...c0d1daa7f7e14667747d73a7dbbe8c074bc8bfe2)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/74483a38d39275f33fcff5
f35b679b5ca4a26a99...407ffafae6a767df3e0230c3df91b6443ae8df75)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/8ade135a41bc03ea155e62e844
d188df1ea18608...b4ffde65f46336ab88eb53be808477a3936bae11)Updates
`github/codeql-action` from 2.22.3 to 2.22.5 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/0116bc2df50751f9724a2e
35ef1f24d22f90e4e1...74483a38d39275f33fcff5f35b679b5ca4a26a99)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/ddccb873888234080b77e9
bc2d4764d5ccaaccf9...0116bc2df50751f9724a2e35ef1f24d22f90e4e1)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)-

[Commits](https://github.com/actions/checkout/compare/3df4ab11eba7bda6032a0b82a6
bb43b11571feac...8ade135a41bc03ea155e62e844d188df1ea18608)Updates
`github/codeql-action` from 2.21.7 to 2.21.9 - [Release
notes](https://github.com/github/codeql-action/releases) -

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/04daf014b50eaf774287bf
3f0f1869d4b4c4b913...ddccb873888234080b77e9bc2d4764d5ccaaccf9)--- updated-
dependencies: - dependency-name: actions/checkout   dependency-type:
direct:production   update-type: version-update:semver-minor   dependency-group:
github-actions - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

[Changelog](https://github.com/github/codeql-action/blob/main/CHANGELOG.md)-

[Commits](https://github.com/github/codeql-action/compare/00e563ead9f72a8461b248
76bee2d0c2e8bd2ee8...04daf014b50eaf774287bf3f0f1869d4b4c4b913)--- updated-
dependencies: - dependency-name: github/codeql-action   dependency-type:
direct:production   update-type: version-update:semver-patch   dependency-group:
github-actions ...  Signed-off-by: dependabot[bot] <support@github.com>

<https://lists.gnu.org/archive/html/bug-autoconf/2018-02/msg00005.html>As a
workaround, let's move comments out of AC_CHECK_FUNCS.  Signed-off-by: Kang-Che
Sung <explorer09@gmail.com>

--===============6826839857160572921==--

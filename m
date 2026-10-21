Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5516.1792563747272380696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S1cxixux;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P4w7Nyng;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a15d201636-5271fb8d-6d37-4920-bc58-74e5fdceae0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bWUF8IQ5l7d6mUHnEHrug2GyDRMiZdzAQgMJtuSPeKQ=;
	b=S1cxixuxU7KnR+JZyAKxAkKY9obURmiXbGijHWPSgE8bwQPQHu7Imb545VEunuWs
	nAHjVMehKrJuLesvsHfUe36PdVfHMKChmURh4mSJTcDmNtm2rylYsvvuguYSk+ao4a0
	eJ1o+PuDFpSznz6vzd/K/R1WmNMc/BGP19QSEyrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bWUF8IQ5l7d6mUHnEHrug2GyDRMiZdzAQgMJtuSPeKQ=;
	b=P4w7NyngmK2W2TgvkB/yhQmKeE+hZjZwaVntU+vQAn4APQu9xkB3iRLRN4pTpBzB
	rifQ3igfZKyhMfG92YLDrUwg57QB+a5gZsT77huQRdhJEFaVxTzPjIxSNwfZxyGaTNr
	mt1IJqXKu8i1K84E1FOjNkNrMcEn9plHZYavvNLA=
Content-Type: multipart/mixed; boundary="===============8572336451294564320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-jsmath: upgrading to 2.0.0 FAILED
Message-ID: <010101a15d201636-5271fb8d-6d37-4920-bc58-74e5fdceae0f-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 06:22:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248357

--===============8572336451294564320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinxcontrib-jsmath* to *2.0.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-sphinxcontrib-jsmath -V 2.0.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-6cb9da4cbb8d1ae780adea28190cdfb1e08f75fc"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6cb9da4cbb8d1ae780adea28190cdfb1e08f75fc"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
DISTRO_VERSION       = "6.1.99+snapshot-6cb9da4cbb8d1ae780adea28190cdfb1e08f75fc"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6cb9da4cbb8d1ae780adea28190cdfb1e08f75fc"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-jsmath/sphinxcontrib-jsmath-2.0.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261021055615.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261021055615.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/sphinxcontrib-jsmath/sphinxcontrib-jsmath-2.0.0.tar.gz...
ERROR: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/sphinxcontrib-jsmath-2.0.0.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-jsmath/sphinxcontrib-jsmath-2.0.0.tar.gz', '--progress=dot', '--verbose'] failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-jsmath/sphinxcontrib-jsmath-2.0.0.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-xdjo8kjk/work/temp/log.do_fetch.3614122
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-jsmath/sphinxcontrib-jsmath-2.0.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8572336451294564320==--

Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.489.1793944902444010804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XZedNhEW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VCRphx6P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1af72d7d8-abf9a142-702d-4e27-8012-b24f49cd2fdf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944901;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jYHlkE35zY7s3EUsY3Bk7wgT4BrtbtVgNHZwNwTBfgw=;
	b=XZedNhEWltzUmAei0GIO+vRt6qqduMyWoUy+ZuxvFFd0w/wokbvG4+Bf+5VfoLiS
	xDhq+mU/lu1fLyZOuiAxZ2ekcBMeigEvQ63Sh0iXQximnSLcQDc6reLwlfEMjon/bnK
	9cOEaC3PsIrhFTKxIk9ctr+S88m6e5/JNdkcWi0s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944901;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jYHlkE35zY7s3EUsY3Bk7wgT4BrtbtVgNHZwNwTBfgw=;
	b=VCRphx6PzXORTzFXALexp1CKsQyHVm5nD7AlimH82vXOB40SwcR+gG/VoFGa1E+d
	xR+EuwDjkTcgYN2kuNUMTsA5jL0QU1xsLKeWpP69D5sL316IOc7FQ5ABmejTEaNMz6y
	/yJ0Bu46a+EkfAaW0MjHZpmF7QbnV2njbetz0Sl4=
Content-Type: multipart/mixed; boundary="===============8421951463235807840=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-subunit: upgrading to 1.4.6 FAILED
Message-ID: <010101a1af72d7d8-abf9a142-702d-4e27-8012-b24f49cd2fdf-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249594

--===============8421951463235807840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-subunit* to *1.4.6* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-subunit -V 1.4.6
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 2003 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-49dc32eba2a8257bbfe1711cbc1cfecbaf38d2b5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:49dc32eba2a8257bbfe1711cbc1cfecbaf38d2b5"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
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
Parsing of 961 .bb files complete (0 cached, 961 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-49dc32eba2a8257bbfe1711cbc1cfecbaf38d2b5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:49dc32eba2a8257bbfe1711cbc1cfecbaf38d2b5"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.6.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261106055631.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261106055631.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.6.tar.gz...
ERROR: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/python-subunit-1.4.6.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.6.tar.gz', '--progress=dot', '--verbose'] failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.6.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-t7xlxq80/work/temp/log.do_fetch.3001333
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.6.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8421951463235807840==--

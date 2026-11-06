Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.469.1793944899839147828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mFVPQ8M4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SCExk6mO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1af72cd68-f467220f-2885-4c6f-ba9d-53119ad21883-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sQNVhLcCCn68xjBsROzpU3VM26OAm8769yGdVSjUhXg=;
	b=mFVPQ8M48EGNAYa05GmWCGLr99DkGYbZ+P8af64Zogp/qmQGBjrLCiZxGfm+e4Al
	pRCp3w9u4K1CGVEOPPIlzCi7zG+g2Z4G5iY2y9QsKowWGozIHqImYxt6qMhtBXL2CMR
	1xkb5CTqT2JLeJbMR8mh/sRM2v4fjG8TAB3M9C4c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sQNVhLcCCn68xjBsROzpU3VM26OAm8769yGdVSjUhXg=;
	b=SCExk6mOWzwEcd9HcchVMQraKwi3qg2/bepeT5bjx8eqCcuIKw+fY3mj+r9iDKEW
	HRfJ4ctE04mPO0nFa/YZreUzUTbpTkP7JQ9fmPVSbkinue7yMG5B31OFYH7lxn4uw+z
	tNjdL2WGDPnmv2ymxQQupQC7+n7bi9Kn+r2Vi+dA=
Content-Type: multipart/mixed; boundary="===============2910680026218343130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 5.3 FAILED
Message-ID: <010101a1af72cd68-f467220f-2885-4c6f-ba9d-53119ad21883-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249590

--===============2910680026218343130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-libarchive-c* to *5.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-libarchive-c -V 5.3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2003 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-9dfcb63e08b19945c959985195988b37a4dfdf0f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9dfcb63e08b19945c959985195988b37a4dfdf0f"
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
DISTRO_VERSION       = "6.1.99+snapshot-9dfcb63e08b19945c959985195988b37a4dfdf0f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9dfcb63e08b19945c959985195988b37a4dfdf0f"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261106054747.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261106054747.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz...
ERROR: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-c-5.3.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz', '--progress=dot', '--verbose'] failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-q4af7i07/work/temp/log.do_fetch.2971235
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2910680026218343130==--

Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C7FEB64DC
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:27 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.840.1686887485178287345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=POgTy/JM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188c2544bd5-b61659c9-34a8-4c88-aad6-d7ac10d5422c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vedHeGH3BaeLcwYwuLGndEyBlDYriNL9jc8ql2Q++D8=;
	b=POgTy/JMsCzY7eq434L/UzyQ9My37m2lXNdFeGnoVDDoJZFFGmB2TLz7PXoPXbrV
	3JYcMgfutyZZocy6jWdyrByRDnzDCrAozWO/DpJuIiZL8VM0Ow10Z3cC0GyZj3bomHV
	svMSTBPePhT2cd0juNrt5ZWPa75ITMQisjJjQkn8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vedHeGH3BaeLcwYwuLGndEyBlDYriNL9jc8ql2Q++D8=;
	b=Tm8+2Bnd6ksUOM7ax+YZhjlQkU/WvY+SpTuCpRrJ788fGLaQrKzEnTo3AbfRSbjl
	/p2SVh0zkSU92Hi91sGzjYaGocmy7IXoiAxWYR8UaKq7oIxbRlFR6BJ714MJMLM5Ys6
	9Ruqb2s1CkK0GunGWp1hbvwtDExa2heChDWYoVBQ=
Content-Type: multipart/mixed; boundary="===============2533811019553226147=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 cc7b29696011e7499379695947b9e634ed61ea10 FAILED
Message-ID: <01010188c2544bd5-b61659c9-34a8-4c88-aad6-d7ac10d5422c-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182975

--===============2533811019553226147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *cc7b29696011e7499379695947b9e634ed61ea10* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S cc7b29696011e7499379695947b9e634ed61ea10
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (21:07:53.225190)
NOTE: Directory listing: ['conf', 'upgrade-helper', 'bitbake-cookerdaemon.log', 'buildhistory', 'workspace', 'cache', 'tmp', 'downloads', 'sstate-cache']
NOTE: Retrying server connection (#1)... (21:07:53.335132)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:612c76e3707abcd470fc607ffc5f687b93f941f3"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
ERROR: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:patch_do_patch(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes-global/patch.bbclass', lineno: 157, function: patch_do_patch
     0153:        except Exception as exc:
     0154:            bb.utils.remove(process_tmpdir, True)
     0155:            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], repr(exc).replace("\\n", "\n")))
     0156:        try:
 *** 0157:            resolver.Resolve()
     0158:        except bb.BBHandledException as e:
     0159:            bb.utils.remove(process_tmpdir, True)
     0160:            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, repr(e).replace("\\n", "\n")))
     0161:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/patch.py', lineno: 769, function: Resolve
     0765:    def Resolve(self):
     0766:        olddir = os.path.abspath(os.curdir)
     0767:        os.chdir(self.patchset.dir)
     0768:        try:
 *** 0769:            self.patchset.Push()
     0770:        except Exception:
     0771:            import sys
     0772:            os.chdir(olddir)
     0773:            raise
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/patch.py', lineno: 274, function: Push
     0270:            else:
     0271:                next = 0
     0272:
     0273:            bb.note("applying patch %s" % self.patches[next])
 *** 0274:            ret = self._applypatch(self.patches[next], force)
     0275:
     0276:            self._current = next
     0277:            return ret
     0278:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/patch.py', lineno: 556, function: _applypatch
     0552:        if os.path.lexists(hooks_dir_backup):
     0553:            raise Exception("Git hooks backup directory already exists: %s" % hooks_dir_backup)
     0554:        if os.path.lexists(hooks_dir):
     0555:            shutil.move(hooks_dir, hooks_dir_backup)
 *** 0556:        os.mkdir(hooks_dir)
     0557:        commithook = os.path.join(hooks_dir, 'commit-msg')
     0558:        applyhook = os.path.join(hooks_dir, 'applypatch-msg')
     0559:        with open(commithook, 'w') as f:
     0560:            # NOTE: the formatting here is significant; if you change it you'll also need to
Exception: NotADirectoryError: [Errno 20] Not a directory: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git-r0/devtooltmp-swb7796o/workdir/git/third_party/spdlog/.git/hooks'

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git-r0/devtooltmp-swb7796o/temp/log.do_patch.1962428
ERROR: Extracting source for vulkan-samples failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2533811019553226147==--


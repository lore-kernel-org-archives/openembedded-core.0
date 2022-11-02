Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB661C6FA98
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.880.1667349634889530602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QGPIv6I6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c866be-e9e9f9d0-c4ce-4e32-9d6a-30789fee2589-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zvdjmRs8zk4P1rDvfBUWD6AClG5WOGkX6uIeGlu2VJM=;
	b=QGPIv6I6IMk+BUT0C4NEOxzTUdE97OLSMLmXZKeEtnPhBkaA42h2aZBkiouKV05z
	Te7VBcEH3QmG/9+qtNF235hDATN4SU1UD5e+Cpvasizyz1uHvVwl/UtyOeRy4aXaqwu
	S00bHYs9KSgPLKzXuR5NGyktC5aMXVG6hhkBAzqE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zvdjmRs8zk4P1rDvfBUWD6AClG5WOGkX6uIeGlu2VJM=;
	b=jJFPxUeFO5pREjh9210V8pYz46evDPLbnygI7ZcPc+DPnVadA609zhH9ve/YXwqR
	BNl3lUFAGXUoE9Wo4YJnKnE+YJup+YJHe2Zr7Fj7OoO5Y22jSFVyrJW4nvGpb3+m5yC
	Y8JZHiNrIrKdvShdihARV/IunJb/4CqRnrtiDqS0=
Content-Type: multipart/mixed; boundary="===============0817296974118334745=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 72-1 FAILED
Message-ID: <0101018435c866be-e9e9f9d0-c4ce-4e32-9d6a-30789fee2589-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172528

--===============0817296974118334745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *icu* to *72-1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade icu -V 72-1
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a59e08c9a17ca37b60101b0ed500403c47ccb6f8"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 338, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 325, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 569, in upgrade
    tinfoil, rd)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 178, in _extract_new_source
    uri, rev = _get_uri(crd)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 143, in _get_uri
    srcuris = rd.getVar('SRC_URI').split()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/tinfoil.py", line 97, in remoteCommand
    ret = self.tinfoil.run_command('dataStoreConnectorCmd', self.dsindex, cmd, args, kwargs)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/tinfoil.py", line 479, in run_command
    raise TinfoilCommandFailed(result[1])
bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 454, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 144, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/utils.py", line 433, in better_eval
    return eval(source, ctx, locals)
  File "Var <ICU_FOLDER>", line 1, in <module>
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb", line 90, in icu_download_folder
    return pvsplit[0] + "-" + pvsplit[1]
IndexError: list index out of range

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/command.py", line 90, in runCommand
    result = command_method(self, commandline)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/command.py", line 495, in dataStoreConnectorCmd
    ret = getattr(d, method)(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 657, in getVar
    return self.getVarFlag(var, "_content", expand, noweakdefault, parsing)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 852, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 452, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 109, in var_sub
    var = self.d.getVarFlag(key, "_content")
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 852, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 452, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 109, in var_sub
    var = self.d.getVarFlag(key, "_content")
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 852, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 470, in expandWithRefs
    raise ExpansionError(varname, s, exc).with_traceback(tb) from exc
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 454, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 144, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/utils.py", line 433, in better_eval
    return eval(source, ctx, locals)
  File "Var <ICU_FOLDER>", line 1, in <module>
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb", line 90, in icu_download_folder
    return pvsplit[0] + "-" + pvsplit[1]
bb.data_smart.ExpansionError: Failure expanding variable ICU_FOLDER, expression was ${@icu_download_folder(d)} which triggered exception IndexError: list index out of range
The variable dependency chain for the failure is: ICU_FOLDER -> BASE_SRC_URI -> SRC_URI



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0817296974118334745==--


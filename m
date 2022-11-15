Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C1C63703
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.5248.1668517536269372822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CM9K8J6n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101847b6524b6-c146f16b-61b2-4741-9d78-93857213c232-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JXUGNlqmPlgBh5sy2zupLcV1aJoavnNK9Lacbe/nNw8=;
	b=CM9K8J6nVqqIH1z+XuyNCHipiOaR9jdsN7SERu/YkUW+RaFuGcncbKaWR4uWV9sm
	mK/JU5S3eTE3LpupX9aBW7Yhghr86lVysRSYnsrFmTv/caBofxlz7iQAdbQWUAv+C6I
	esrw7vhTJ/r8zLkyh5QnYjz2w0Pfw2iOsY16i9hE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JXUGNlqmPlgBh5sy2zupLcV1aJoavnNK9Lacbe/nNw8=;
	b=UaCiV1lk2lSooQKMlLQuLJj/41AYvAB5KSiLNgAi5hlYKU5V1tST8jaXzpmAAosb
	NkqcFJnwhKQjl/uIbI8nOScmiuz8+dA14j4RPFDdpy74zez8Ga0t1A/6rMEZoNS3zgu
	oUi2Dxe6Zx5g/j17ZfLIiM/sx3oWkinK4kImWq3I=
Content-Type: multipart/mixed; boundary="===============4808696589101014250=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 72-1 FAILED
Message-ID: <010101847b6524b6-c146f16b-61b2-4741-9d78-93857213c232-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173334

--===============4808696589101014250==
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
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:71b7d8f2cb48e92a2d8f64a7d65ff822b18f99c2"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

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
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 459, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 149, in python_sub
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
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 655, in getVar
    return self.getVarFlag(var, "_content", expand, noweakdefault, parsing)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 850, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 457, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 109, in var_sub
    var = self.d.getVarFlag(key, "_content")
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 850, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 457, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 109, in var_sub
    var = self.d.getVarFlag(key, "_content")
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 850, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 475, in expandWithRefs
    raise ExpansionError(varname, s, exc).with_traceback(tb) from exc
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 459, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/data_smart.py", line 149, in python_sub
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
--===============4808696589101014250==--


Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8185ED5C0EA
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17385.1765872131800834005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2gFwqEaz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OFWnsBN3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262eed1d-0d9e5cc2-5555-4aa8-b999-69451b05fba7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=04lvaatFEsMltoNah8pc9mxVDmmqlgDn3xex9EP13yw=;
	b=2gFwqEazYCIlGQM0n5w7SH/+r2cJR4kmPa/Anm3+3d5Ehx20G4X2tYfpA20GSRTo
	J9/cRj1cLIrxwaDOKA0vCDCwNfFDIpV84hwWtHp/EQbSwCiFzHewAQ6FdeMJZv6AeAj
	/inWRvwOcPgiM09geApPZmDWXcLy6t4l3olToRbw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=04lvaatFEsMltoNah8pc9mxVDmmqlgDn3xex9EP13yw=;
	b=OFWnsBN3mMk+cnONSVJIA5Vcm9DTwtKThcwOEjbyn/23gMgMawTBccMbfyc6qoOd
	k1RtoSMK5WB051lsTE7n7mZIQOkMUeWPvItBaeCR7eq021BZgZPUQEo91DGgDIphqxI
	HHB7GrGGQqaNO8imB8fJz58iaICBEKxEj7noRxTs=
Content-Type: multipart/mixed; boundary="===============6206934836980808419=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] icu: upgrading to 78.1 FAILED
Message-ID: <0101019b262eed1d-0d9e5cc2-5555-4aa8-b999-69451b05fba7-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227910

--===============6206934836980808419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *icu* to *78.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade icu -V 78.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-092035ed02fe79d852e4b403ab39047ac1c1ce9a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:092035ed02fe79d852e4b403ab39047ac1c1ce9a"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 607, in upgrade
    rev2, checksums, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                             ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                            args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                            tinfoil, rd)
                                            ^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 184, in _extract_new_source
    uri, rev = _get_uri(crd)
               ~~~~~~~~^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 148, in _get_uri
    srcuris = rd.getVar('SRC_URI').split()
              ~~~~~~~~~^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/tinfoil.py", line 228, in remoteCommand
    ret = self.tinfoil.run_command('dataStoreConnectorCmd', self.dsindex, cmd, args, kwargs)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/tinfoil.py", line 622, in run_command
    raise TinfoilCommandFailed(result[1])
bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 465, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 154, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/utils.py", line 489, in better_eval
    return eval(source, ctx, locals)
  File "Var <ICU_FOLDER>", line 1, in <module>
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb", line 103, in icu_download_folder
    return pvsplit[0] + "-" + pvsplit[1]
                              ~~~~~~~^^^
IndexError: list index out of range

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 91, in runCommand
    result = command_method(self, commandline)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 520, in dataStoreConnectorCmd
    ret = getattr(d, method)(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 662, in getVar
    return self.getVarFlag(var, "_content", expand, noweakdefault, parsing)
           ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 865, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 463, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 114, in var_sub
    var = self.d.getVarFlag(key, "_content")
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 865, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 463, in expandWithRefs
    s = __expand_var_regexp__.sub(varparse.var_sub, s)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 114, in var_sub
    var = self.d.getVarFlag(key, "_content")
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 865, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 481, in expandWithRefs
    raise ExpansionError(varname, s, exc).with_traceback(tb) from exc
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 465, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/data_smart.py", line 154, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/utils.py", line 489, in better_eval
    return eval(source, ctx, locals)
  File "Var <ICU_FOLDER>", line 1, in <module>
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb", line 103, in icu_download_folder
    return pvsplit[0] + "-" + pvsplit[1]
                              ~~~~~~~^^^
bb.data_smart.ExpansionError: Failure expanding variable ICU_FOLDER, expression was ${@icu_download_folder(d)} which triggered exception IndexError: list index out of range
The variable dependency chain for the failure is: ICU_FOLDER -> BASE_SRC_URI -> SRC_URI



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6206934836980808419==--


Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id 399EE6079F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 16:16:33 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id l12-v6so2113752lja.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=/8dKt6D7RKEIWS/9PsEq7CAWvQxWiyKlib+7yn0+hqk=;
	b=VRS1JR7IpLKhkG5W3GM0OQzyPIUTzI9FfZFewjLEXRxiMToydNmSVT3j3NDEfUwdrv
	0V+7R1spFforZcMbSyu+bvcqe9E4GGJnkVooxXOI8kdRXi25pFjd2eGsZPP4fnAmiMM3
	bvc4XQueTIBOmpPyNACzMiQE1S2jHahlZbd3e7W+xz7ufR5e14SQLvZaYBRxuxyETq91
	uHPLlD/7PXaM59TCoRhjF1cGyKyyapRhHRoa3R0mDI3m0WoOsMJbIPAjH6yLDXehhScL
	Ho2NJK5yGaRyAtr74lkZn7Am3L6J1PDfFt/m9cDTMghWXQb5/9B8G+lLff0PMOAsbl6M
	PcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/8dKt6D7RKEIWS/9PsEq7CAWvQxWiyKlib+7yn0+hqk=;
	b=cXU41UpJIC8vkLc3aW/86orYNArAo3kuo6DepOD7JSGkqN1i+QekitpYvl15WJsbqG
	TLhrGh84HPyuhdAJqaEWpR/UpsloXVuVLoHUCDCeO50KKheEwebNoEprLLbMvxSaiVGW
	YD8+eF4UV2mycmSm41aQceNvjR/r1H+AxahEmAe9AdUQynU+jTfNqc1Qa0tyDdPXlZlL
	ByHzJg2wd0UfgasIzVn0daq/o1noc+SC6shfKtL4Eab16LU8MgFwkT2Q8rcOfLn0B3kM
	Ragy6NFccfrHLDYr5UiyVn6NtrYlDhWagVH50fhODHJOACX2757mWe4c6RVf5KqZaSby
	YwTQ==
X-Gm-Message-State: APt69E0PVp9kqU7vcxt1AxJDR+fmCl2feDVTCDhNbGfvLQP+N4JXtyAq
	uCv4GP9BA3J0c99CG8d/W0n8nkeFmdEJArR6B1YynQ/q
X-Google-Smtp-Source: ADUXVKJldzjEOAXVrvM2E/g/ZVDSyFE0zXZ2Gjuk3ivDztqhRpiNsvz4RSnLn1ZsxqGP7yrPZdu7DbYkhOkt325XHjA=
X-Received: by 2002:a2e:2f02:: with SMTP id
	v2-v6mr8490004ljv.113.1529943394188; 
	Mon, 25 Jun 2018 09:16:34 -0700 (PDT)
MIME-Version: 1.0
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 25 Jun 2018 18:16:17 +0200
Message-ID: <CAPybu_0D812dEQsOZX8-o-w7roTkqpXdUNsHjM0eJ2R8f6Z+eA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Bug with multiconfig and allarch packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 16:16:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hello

I have a setup on sumo with 4 multiconfig, 3xX86 and 1xarm64. While
building recipes that are native and allarch at the same time (from
meta-java). I am having a lot of these errors. Is this something that
is currently beeing fixed? Am I the only one seeing this?

Thanks


pokyuser@d3d188f59a44:/workdir/build$ bitbake world
Loading cache: 100%
|#########################################################################################################|
Time: 0:00:01
Loaded 6496 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qt5122"
DISTRO               = "poky-qtec"
DISTRO_VERSION       = "2.5"
TUNE_FEATURES        = "dbfp4"
TARGET_FPU           = ""
meta
meta-poky            = "HEAD:9491680e244bee211d45d3d5a9ab7ed96b7b9b6a"
meta-qtec-bsp        = "HEAD:a10b73103c2baa58cc5c0c44bfd64b9d48919fe4"
meta-clang           = "HEAD:536536152263e06875722913548f9367f11ab51b"
meta-qtec-distro     = "HEAD:b916f2cd20010d57979b14837424c7edc53e0d54"
meta-java            = "HEAD:598499a6d222365417f1fd2e080d30277aec166c"
meta-qt5             = "HEAD:bc20e3dcd0176529740beb59ccf1f170b9f828a8"
meta-qtec-hockey     = "HEAD:4d6062504a6d9983d276e6b9d6d77ae6121600c0"
meta-qtec-bottle     = "HEAD:d235d301bfaa804b76a67d264e9f77b224c59104"


Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "inteli7"
DISTRO               = "poky-qtec"
DISTRO_VERSION       = "2.5"
TUNE_FEATURES        = "m64 corei7"
TARGET_FPU           = ""
meta
meta-poky            = "HEAD:9491680e244bee211d45d3d5a9ab7ed96b7b9b6a"
meta-qtec-bsp        = "HEAD:a10b73103c2baa58cc5c0c44bfd64b9d48919fe4"
meta-clang           = "HEAD:536536152263e06875722913548f9367f11ab51b"
meta-qtec-distro     = "HEAD:b916f2cd20010d57979b14837424c7edc53e0d54"
meta-java            = "HEAD:598499a6d222365417f1fd2e080d30277aec166c"
meta-qt5             = "HEAD:bc20e3dcd0176529740beb59ccf1f170b9f828a8"
meta-qtec-hockey     = "HEAD:4d6062504a6d9983d276e6b9d6d77ae6121600c0"
meta-qtec-bottle     = "HEAD:d235d301bfaa804b76a67d264e9f77b224c59104"


Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qt5506"
DISTRO               = "poky-qtec"
DISTRO_VERSION       = "2.5"
TUNE_FEATURES        = "aarch64"
TARGET_FPU           = ""
meta
meta-poky            = "HEAD:9491680e244bee211d45d3d5a9ab7ed96b7b9b6a"
meta-qtec-bsp        = "HEAD:a10b73103c2baa58cc5c0c44bfd64b9d48919fe4"
meta-clang           = "HEAD:536536152263e06875722913548f9367f11ab51b"
meta-qtec-distro     = "HEAD:b916f2cd20010d57979b14837424c7edc53e0d54"
meta-java            = "HEAD:598499a6d222365417f1fd2e080d30277aec166c"
meta-qt5             = "HEAD:bc20e3dcd0176529740beb59ccf1f170b9f828a8"
meta-qtec-hockey     = "HEAD:4d6062504a6d9983d276e6b9d6d77ae6121600c0"
meta-qtec-bottle     = "HEAD:d235d301bfaa804b76a67d264e9f77b224c59104"


Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qt5022"
DISTRO               = "poky-qtec"
DISTRO_VERSION       = "2.5"
TUNE_FEATURES        = "bobcat"
TARGET_FPU           = ""
meta
meta-poky            = "HEAD:9491680e244bee211d45d3d5a9ab7ed96b7b9b6a"
meta-qtec-bsp        = "HEAD:a10b73103c2baa58cc5c0c44bfd64b9d48919fe4"
meta-clang           = "HEAD:536536152263e06875722913548f9367f11ab51b"
meta-qtec-distro     = "HEAD:b916f2cd20010d57979b14837424c7edc53e0d54"
meta-java            = "HEAD:598499a6d222365417f1fd2e080d30277aec166c"
meta-qt5             = "HEAD:bc20e3dcd0176529740beb59ccf1f170b9f828a8"
meta-qtec-hockey     = "HEAD:4d6062504a6d9983d276e6b9d6d77ae6121600c0"
meta-qtec-bottle     = "HEAD:d235d301bfaa804b76a67d264e9f77b224c59104"

Initialising tasks: 100%
|####################################################################################################|
Time: 0:02:33
Checking sstate mirror object availability: 100%
|############################################################################|
Time: 0:00:00
NOTE: Executing SetScene Tasks
ERROR: mc:inteli7:cup-0.10k-r0 do_package_write_deb_setscene: Error
executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_package_write_deb_setscene(d)
     0003:
File: '/workdir/repo/poky/meta/classes/package_deb.bbclass', lineno:
345, function: do_package_write_deb_setscene
     0341:
     0342:    if os.access(os.path.join(tmpdir, "stamps",
"DEB_PACKAGE_INDEX_CLEAN"),os.R_OK):
     0343:        os.unlink(os.path.join(tmpdir, "stamps",
"DEB_PACKAGE_INDEX_CLEAN"))
     0344:
 *** 0345:    sstate_setscene(d)
     0346:}
     0347:addtask do_package_write_deb_setscene
     0348:
     0349:python () {
File: '/workdir/repo/poky/meta/classes/sstate.bbclass', lineno: 685,
function: sstate_setscene
     0681:            break
     0682:
     0683:def sstate_setscene(d):
     0684:    shared_state = sstate_state_fromvars(d)
 *** 0685:    accelerate = sstate_installpkg(shared_state, d)
     0686:    if not accelerate:
     0687:        bb.fatal("No suitable staging package found")
     0688:
     0689:python sstate_task_prefunc () {
File: '/workdir/repo/poky/meta/classes/sstate.bbclass', lineno: 332,
function: sstate_installpkg
     0328:    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split()
+ ['sstate_unpack_package']:
     0329:        # All hooks should run in the SSTATE_INSTDIR
     0330:        bb.build.exec_func(f, d, (sstateinst,))
     0331:
 *** 0332:    return sstate_installpkgdir(ss, d)
     0333:
     0334:def sstate_installpkgdir(ss, d):
     0335:    import oe.path
     0336:    import subprocess
File: '/workdir/repo/poky/meta/classes/sstate.bbclass', lineno: 354,
function: sstate_installpkgdir
     0350:        oe.path.remove(dir)
     0351:
     0352:    for state in ss['dirs']:
     0353:        prepdir(state[1])
 *** 0354:        os.rename(sstateinst + state[0], state[1])
     0355:    sstate_install(ss, d)
     0356:
     0357:    for plain in ss['plaindirs']:
     0358:        workdir = d.getVar('WORKDIR')
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/workdir/build/tmp/work/all-poky-linux/cup/0.10k-r0/sstate-install-package_write_deb/deploy-debs'
-> '/workdir/build/tmp/work/all-poky-linux/cup/0.10k-r0/deploy-debs'

WARNING: Logfile for failed setscene task is
/workdir/build/tmp/work/all-poky-linux/cup/0.10k-r0/temp/log.do_package_write_deb_setscene.5232
WARNING: Setscene task
(multiconfig:inteli7:/workdir/repo/poky/../meta-java/recipes-core/cup/cup_0.10k.bb:do_package_write_deb_setscene)
failed with exit code '1' - real task will be run instead
ERROR: mc:qt5022:cup-0.10k-r0 do_package_qa_setscene: Package already
staged (/workdir/build/tmp/sstate-control/manifest-allarch-cup.package_qa)?!
WARNING: Logfile for failed setscene task is
/workdir/build/tmp/work/all-poky-linux/cup/0.10k-r0/temp/log.do_package_qa_setscene.5298
WARNING: Setscene task
(multiconfig:qt5022:/workdir/repo/poky/../meta-java/recipes-core/cup/cup_0.10k.bb:do_package_qa_setscene)
failed with exit code '1' - real task will be run instead
ERROR: jlex-1.2.6-r0 do_package_qa_setscene: Package already staged
(/workdir/build/tmp/sstate-control/manifest-allarch-jlex.package_qa)?!
WARNING: Logfile for failed setscene task is
/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/temp/log.do_package_qa_setscene.5300
WARNING: Setscene task
(/workdir/repo/poky/../meta-java/recipes-core/jlex/jlex_1.2.6.bb:do_package_qa_setscene)
failed with exit code '1' - real task will be run instead
ERROR: mc:qt5506:jlex-1.2.6-r0 do_package_write_deb_setscene: Package
already staged (/workdir/build/tmp/sstate-control/manifest-allarch-jlex.package_write_deb)?!
WARNING: Logfile for failed setscene task is
/workdir/build/tmp/work/all-poky-linux/jlex/1.2.6-r0/temp/log.do_package_write_deb_setscene.5345
ERROR: mc:qt5022:rhino-1.7r4-r0 do_package_qa_setscene: Package
already staged (/workdir/build/tmp/sstate-control/manifest-allarch-rhino.package_qa)?!
WARNING: Logfile for failed setscene task is
/workdir/build/tmp/work/all-poky-linux/rhino/1.7r4-r0/temp/log.do_package_qa_setscene.5349
WARNING: Setscene task
(multiconfig:qt5506:/workdir/repo/poky/../meta-java/recipes-core/jlex/jlex_1.2.6.bb:do_package_write_deb_setscene)
failed with exit code '1' - real task will be run instead
WARNING: Setscene task
(multiconfig:qt5022:/workdir/repo/poky/../meta-java/recipes-core/rhino/rhino_1.7r4.bb:do_package_qa_setscene)
failed with exit code '1' - real task will be run instead
NOTE: Executing RunQueue Tasks
No currently running tasks (22732 of 22734)  99%
|#########################################################################################
|



-- 
Ricardo Ribalda


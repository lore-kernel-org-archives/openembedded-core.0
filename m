Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BDC1260621
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 19:49:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 20so8818430wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=y+gsDPjPatACgf65shPuMnf324EBjkxqfyK5UJmcJfc=;
	b=pQ2+YyJ9TRWX6HMYbkYWvg3jEKUw9dLMhQPU0sAdDV2R7l0ZULsyYpnLs46Cqt6WxU
	1/PfReNgCiOV9Iap9oC9tWwiD4NQRAexlHCR08TrRAL9GtJYlu+ULg5vYfJvO3TIJ8s8
	dslhACHxxYXovlZ2y+ejHG6PlSRWYzt/kNNBBVs/KghsuYEsjaHCUjsHjTjWa8khUDU5
	YyfV8+QFSgfIgwshGf7gwHRwt/RwO60WdSYjfJZESsc2dlTUgI+Xxas+i2JMy/Sla6V5
	lQfjmMWPVKsp59rOrjUpVTcRFYoWwv8GfF97x7xFi7qCxoqkiqrmYUV8J0/22sMdvqPy
	fYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=y+gsDPjPatACgf65shPuMnf324EBjkxqfyK5UJmcJfc=;
	b=I8DwIWNM4wto3LX0Lf8USexgEtxTmrbFGU6cX541q3LEthnVhU4vbdEhTt/qlyC0eR
	X4Uik5Tgoln+6oFrY15FKs2qYROVZWpEXYftXhjOFxRxN8S4l4a+IufE6oF+mHkQqYy+
	j7mzpcJ0bTF0oV55wfnVN6Iv+jhjrxtKMzq+kcg73oJj/Iwx79+fJ1x76vO3iWvRPgo9
	p5pGR117mxMtH01jOp3nAzuyXCjwbnSLhOwv94ya0wPpExi064GIneigp2Cylw3Tt6+0
	xZsSIrEPvxPnQDyFJwQplHj2wZk1hz4RGuO0Yef+Ezd30SCXChLuALDhWyxAmCWKETL9
	4VOQ==
X-Gm-Message-State: AD7BkJKJ9CrmJtsDLLGHkWJxvc1OIygcsOmi789wLdxbgcQbwed3du61/DJs338W53Lh5Q==
X-Received: by 10.194.187.71 with SMTP id fq7mr4476694wjc.97.1459280960766;
	Tue, 29 Mar 2016 12:49:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p189sm16160109wmb.7.2016.03.29.12.49.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 12:49:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Mar 2016 21:49:13 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20160329194913.GD2555@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: External modules fail to build when kernel is reused from sstate and rm_work is enabled
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
X-List-Received-Date: Tue, 29 Mar 2016 19:49:21 -0000
X-Groupsio-MsgNum: 80261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline

--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The same was filled as
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9352

It always fails like this:

NOTE: Executing RunQueue Tasks
ERROR: lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0 do_make_scripts: Functi=
on failed: do_make_scripts (log file is located at /home/jenkins/oe/world/s=
hr-core/tmp-glibc/work/qemux86-oe-linux/lttng-modules/2.7.1+gitAUTOINC+45e0=
ebd91f-r0/temp/log.do_make_scripts.24725)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/qemux86-oe-linux/lttng-modules/2.7.1+gitAUTOINC+45e0ebd91f-r0/temp=
/log.do_make_scripts.24725
Log data follows:
| DEBUG: Executing shell function do_make_scripts
| make: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work-=
shared/qemux86/kernel-source'
| make[1]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wo=
rk-shared/qemux86/kernel-build-artifacts'
|   GEN     ./Makefile
| scripts/kconfig/conf  --silentoldconfig Kconfig
| ***
| *** Configuration file ".config" not found!
| ***
| *** Please run some configurator (e.g. "make oldconfig" or
| *** "make menuconfig" or "make xconfig").
| ***
| make[3]: *** [silentoldconfig] Error 1
| make[2]: *** [silentoldconfig] Error 2
| make[1]: *** No rule to make target `include/config/auto.conf', needed by=
 `scripts'.  Stop.
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k-shared/qemux86/kernel-build-artifacts'
| make: *** [sub-make] Error 2
| make: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work-s=
hared/qemux86/kernel-source'
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_make_scripts (log file is located at /home/jen=
kins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/lttng-modules/2.7.1+=
gitAUTOINC+45e0ebd91f-r0/temp/log.do_make_scripts.24725)
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recip=
es-kernel/lttng/lttng-modules_git.bb, do_make_scripts) failed with exit cod=
e '1'
NOTE: Tasks Summary: Attempted 416 tasks of which 410 didn't need to be rer=
un and 1 failed.

It might be caused by:
commit 55b4f7fd217f0c65d457c731150340c18fb3fa19
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu May 14 10:31:51 2015 +0100

    kernel/rm_work: Improve interaction

As it's broken for months, various do_make_scripts failures were reported i=
n:
http://www.openembedded.org/wiki/Bitbake_World_Status (2016-03-12, 2016-03-=
09, 2016-03-05, 2016-02-21, 2016-02-14, 2016-02-04, 2016-01-25)

and less often in previous releases
http://www.openembedded.org/wiki/Bitbake_World_Status_Jethro (2015-09-13)
http://www.openembedded.org/wiki/Bitbake_World_Status_Fido (2014-12-30)

$ bitbake -c cleansstate linux-yocto lttng-modules; bitbake -c build lttng-=
modules
This works fine, but if you do:
$ rm -rf tmp-glibc
$ bitbake -c cleansstate lttng-modules; bitbake linux-yocto | tee; bitbake =
-c build lttng-modules | tee

Then you'll either see linux-yocto being completely rebuilt or lttng-module=
s failure like shown above.

I haven't found what conditions decide if it will be rebuilt or fail - now =
I did many
rebuilds with and without rm_work, with or without tmp-glibc populated and =
with or without
explicit clensstate before the build.

Middle build:

$ grep linux-yocto tmp-glibc/log/cooker/qemux86/20160329193141.log=20
NOTE: Running setscene task 3 of 120 (/home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_package_write=
_ipk_setscene)
NOTE: Running setscene task 4 of 120 (/home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_deploy_setsce=
ne)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_package_write_ipk_setscene: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_deploy_setscene: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_deploy_setscene: Succeeded
NOTE: Running setscene task 7 of 120 (/home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_populate_sysr=
oot_setscene)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 8 of 120 (/home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_packagedata_s=
etscene)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_packagedata_setscene: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_packagedata_setscene: Succeeded
NOTE: Running setscene task 13 of 120 (/home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_package_sets=
cene)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_package_setscene: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_package_setscene: Succeeded
NOTE: Running task 249 of 557 (ID: 6, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_fetch)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_fetch: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_fetch: Succeeded
NOTE: Running task 290 of 557 (ID: 2, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_unpack)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_unpack: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_unpack: Succeeded
NOTE: Running task 532 of 557 (ID: 27, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_kernel_check=
out)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_checkout: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_checkout: Succeeded
NOTE: Running task 533 of 557 (ID: 0, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_validate_bran=
ches)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_validate_branches: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_validate_branches: Succeeded
NOTE: Running task 534 of 557 (ID: 1, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_kernel_metada=
ta)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_metadata: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_metadata: Succeeded
NOTE: Running task 535 of 557 (ID: 3, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_patch)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_patch: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_patch: Succeeded
NOTE: Running task 553 of 557 (ID: 16, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_package_qa)
NOTE: Running task 554 of 557 (ID: 14, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_populate_lic)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_populate_lic: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_package_qa: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_populate_lic: Succeeded
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_package_qa: Succeeded
NOTE: Running noexec task 555 of 557 (ID: 17, /home/jenkins/oe/world/shr-co=
re/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_build)
NOTE: Running task 556 of 557 (ID: 18, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_rm_work)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_rm_work: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_rm_work: Succeeded
NOTE: Running task 557 of 557 (ID: 19, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_rm_work_all)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_rm_work_all: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_rm_work_all: Succeeded

3rd build:
NOTE: Executing RunQueue Tasks
NOTE: Running task 185 of 424 (ID: 27, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_fetch)
NOTE: Running task 364 of 424 (ID: 4, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_fetch)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_fetch: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_fetch: S=
tarted
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_fetch: S=
ucceeded
NOTE: Running task 390 of 424 (ID: 0, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_unpack)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_fetch: Succeeded
NOTE: Running task 391 of 424 (ID: 23, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_unpack)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_unpack: =
Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_unpack: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_unpack: =
Succeeded
NOTE: Running task 392 of 424 (ID: 1, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_patch)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_patch: S=
tarted
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_patch: S=
ucceeded
NOTE: Running task 393 of 424 (ID: 8, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_populate_li=
c)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_populate=
_lic: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_populate=
_lic: Succeeded
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_unpack: Succeeded
NOTE: Running task 394 of 424 (ID: 43, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_kernel_check=
out)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_checkout: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_checkout: Succeeded
NOTE: Running task 395 of 424 (ID: 21, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_validate_bra=
nches)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_validate_branches: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_validate_branches: Succeeded
NOTE: Running task 396 of 424 (ID: 22, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_kernel_metad=
ata)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_metadata: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_metadata: Succeeded
NOTE: Running task 397 of 424 (ID: 24, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_patch)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_patch: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_patch: Succeeded
NOTE: Running task 398 of 424 (ID: 28, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_kernel_confi=
gme)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_configme: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_configme: Succeeded
NOTE: Running task 399 of 424 (ID: 29, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_configure)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_configure: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_configure: Succeeded
NOTE: Running task 400 of 424 (ID: 30, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_kernel_confi=
gcheck)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_configcheck: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_configcheck: Succeeded
NOTE: Running task 401 of 424 (ID: 31, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_compile)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_compile: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_compile: Succeeded
NOTE: Running task 402 of 424 (ID: 39, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_shared_workd=
ir)
NOTE: Running task 403 of 424 (ID: 32, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_kernel_link_=
vmlinux)
NOTE: Running task 404 of 424 (ID: 34, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_uboot_mkimag=
e)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_shared_workdir: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_link_vmlinux: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_uboot_mkimage: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_shared_workdir: Succeeded
NOTE: Running task 405 of 424 (ID: 40, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_compile_kern=
elmodules)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_kernel_link_vmlinux: Succeeded
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_uboot_mkimage: Succeeded
NOTE: Running task 406 of 424 (ID: 6, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_make_script=
s)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_make_scr=
ipts: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_compile_kernelmodules: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_make_scr=
ipts: Succeeded
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_compile_kernelmodules: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_make_scr=
ipts: Succeeded
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_compile_kernelmodules: Succeeded
NOTE: Running task 407 of 424 (ID: 41, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_strip)
NOTE: Running task 408 of 424 (ID: 5, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_configure)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_strip: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_configur=
e: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_strip: Succeeded
NOTE: Running task 409 of 424 (ID: 33, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_sizecheck)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_configur=
e: Succeeded
NOTE: Running task 410 of 424 (ID: 7, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_compile)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_compile:=
 Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_sizecheck: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_sizecheck: Succeeded
NOTE: Running task 411 of 424 (ID: 25, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_install)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_install: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_install: Succeeded
NOTE: Running task 415 of 424 (ID: 26, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb, do_populate_sys=
root)
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_populate_sysroot: Started
NOTE: recipe linux-yocto-4.4.3+gitAUTOINC+32e84686fc_3d2455f9da-r0: task do=
_populate_sysroot: Succeeded
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_compile:=
 Succeeded
NOTE: Running task 418 of 424 (ID: 2, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_install)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_install:=
 Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_install:=
 Succeeded
NOTE: Running task 419 of 424 (ID: 12, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_package)
NOTE: Running task 420 of 424 (ID: 3, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_populate_sy=
sroot)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_populate=
_sysroot: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_package:=
 Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_populate=
_sysroot: Succeeded
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_package:=
 Succeeded
NOTE: Running task 421 of 424 (ID: 9, /home/jenkins/oe/world/shr-core/opene=
mbedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_packagedata)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_packaged=
ata: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_packaged=
ata: Succeeded
NOTE: Running task 422 of 424 (ID: 13, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_package_wr=
ite_ipk)
NOTE: Running task 423 of 424 (ID: 10, /home/jenkins/oe/world/shr-core/open=
embedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_package_qa)
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_package_=
write_ipk: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_package_=
qa: Started
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_package_=
qa: Succeeded
NOTE: recipe lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0: task do_package_=
write_ipk: Succeeded
NOTE: Running noexec task 424 of 424 (ID: 11, /home/jenkins/oe/world/shr-co=
re/openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do_bui=
ld)
NOTE: Tasks Summary: Attempted 424 tasks of which 392 didn't need to be rer=
un and all succeeded.
NOTE: Writing buildhistory


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb63DcACgkQN1Ujt2V2gBzaaACeMu7Zg/SyupJ9TA6X7FgtVHOb
v0QAoJtmV8DGHI5h4NuDr2rNlGWnq8eV
=fa5R
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--

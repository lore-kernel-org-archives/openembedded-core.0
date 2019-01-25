Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id C5EC27C3BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 16:18:28 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id a62so7320201wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=fsUKni2LPOWNgtZdMoEX11JfO8Q+ZhZV8nFO1Zt6MXI=;
	b=Cko49JhcJKDennRUHgXMMZMSd7Eq/dE2Kmnf3uMawDDfbcWRMtZ1lqZoRhuL1hUM36
	o7dadPfB797v6trvcy8fbrrfpd+WDo8MCNM/gjyaymFyGUj626BOfrw+BVrJYSrCfVSI
	LkzPlwagcN/UrNzRR9QFOQZkWRtqdd9E8tIs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fsUKni2LPOWNgtZdMoEX11JfO8Q+ZhZV8nFO1Zt6MXI=;
	b=ASW4ymbZzLoONJFPQuSmW53YeHOdgkL0B8WkhCEivNkDVSzLerIhA+hIIiyxSN486o
	ZqD2/k7X5WQIn2CSh2PMBYhO+bKPCZ1B6cFFm/7yblJlJwG/I/qTAChUufs0Pak05H8e
	zZZpJcmTnCZLDHZJc5/gisR1H6O9SSPi/qJi1pZUFIY/ccT6UObcb1QQ/dnrv7XLoiSX
	Vi4im85t5280593wbjEdApU+U/rzxlAM/Z146y4Gl/QtUWyeTmsazlky29/nCSktGGRP
	naxTBOj3FHkHqUDD+CvR8fOq/VBRbxILnjSx2Okg++0GuclVC9D9pwT3wJckBtrEAVqn
	36ig==
X-Gm-Message-State: AJcUukefFgwfKWPM7gEMjgvh7WKYbT6WPdJ820KNdjl4UNUuvtgjKEo1
	IHMIMLqCU/xvAbCphz+NVdyXRQ==
X-Google-Smtp-Source: ALg8bN6iUGtAp4SpHwi/NrVSTUNstZnVLFmCdDRQClf8Qpcj1/5FKrvjrfVS12xzJW9PsAMMrnRHOA==
X-Received: by 2002:a1c:9855:: with SMTP id a82mr7077852wme.20.1548433109127; 
	Fri, 25 Jan 2019 08:18:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v132sm64487281wme.20.2019.01.25.08.18.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Jan 2019 08:18:28 -0800 (PST)
Message-ID: <df9501fc99afe4974301fa544b8d416132d7e6d9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2019 16:18:26 +0000
In-Reply-To: <1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
References: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
	<1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 1/2 v5] resultstool: enable merge, store, report and regression analysis
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
X-List-Received-Date: Fri, 25 Jan 2019 16:18:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As a further example of this I wanted to experiment with a real world
example. We have:

https://autobuilder.yocto.io/pub/releases/yocto-2.6.1.rc1/testresults/qemux86/testresults.json
https://autobuilder.yocto.io/pub/releases/yocto-2.7_M1.rc1/testresults/qemux86/testresults.json
https://autobuilder.yocto.io/pub/releases/yocto-2.7_M2.rc1/testresults/qemux86/testresults.json

which are all results files for the same thing from 2.6.1, 2.7M1 and
2.7M2. I also have one for 2.6.0 locally but its the same as 2.6.1.

Running this gives:

resultstool regression qemux86-2.6.json qemux86-2.7-M2.json 
Successfully loaded base test results from: qemux86-2.6.json
Successfully loaded target test results from: qemux86-2.7-M2.json
Getting regression for base=runtime_core-image-minimal_qemux86_20181029181546 target=runtime_core-image-minimal_qemux86_20190124185230
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
==============================End Regression==============================
Getting regression for base=runtime_core-image-sato-sdk_qemux86_20181029181546 target=runtime_core-image-sato-sdk_qemux86_20190124185230
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
==============================End Regression==============================
Getting regression for base=runtime_core-image-sato_qemux86_20181029181546 target=runtime_core-image-sato_qemux86_20190124185230
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
==============================End Regression==============================
Getting regression for base=sdk_core-image-sato_i686_qemux86_20181029190813 target=sdk_core-image-sato_i686_qemux86_20190124185230
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
python.PythonTest.test_python3 : UNKNOWN -> None
==============================End Regression==============================
Getting regression for base=sdk_core-image-sato_x86_64_qemux86_20181029192305 target=sdk_core-image-sato_x86_64_qemux86_20190124192316
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
python.PythonTest.test_python3 : UNKNOWN -> None
==============================End Regression==============================
Getting regression for base=sdkext_core-image-minimal_x86_64_qemux86_20181029192305 target=sdkext_core-image-minimal_x86_64_qemux86_20190124192316
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
python.PythonTest.test_python3 : PASSED -> None
==============================End Regression==============================
Getting regression for base=sdkext_core-image-sato_x86_64_qemux86_20181029192305 target=sdkext_core-image-sato_x86_64_qemux86_20190124192316
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
python.PythonTest.test_python3 : PASSED -> None
==============================End Regression==============================

which shows that:

a) In the case of no regressions it may be better simply print that rather than a header and empty body
b) It does highlight that the "python3" test somehow disappeared
c) Its hard to know that in fact another python3 test started passing.

Maybe we also need a compare command to show "new" results to make it
easier to investigate these things?

For interest I ran the comparision backwards:


resultstool regression qemux86-2.7-M2.json qemux86-2.6.json 
Successfully loaded base test results from: qemux86-2.7-M2.json
Successfully loaded target test results from: qemux86-2.6.json
Getting regression for base=runtime_core-image-minimal_qemux86_20190124185230 target=runtime_core-image-minimal_qemux86_20181029181546
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
apt.AptRepoTest.test_apt_install_from_repo : SKIPPED -> None
buildcpio.BuildCpioTest.test_cpio : SKIPPED -> None
buildgalculator.GalculatorTest.test_galculator : SKIPPED -> None
buildlzip.BuildLzipTest.test_lzip : SKIPPED -> None
connman.ConnmanTest.test_connmand_help : SKIPPED -> None
connman.ConnmanTest.test_connmand_running : SKIPPED -> None
date.DateTest.test_date : SKIPPED -> None
df.DfTest.test_df : SKIPPED -> None
dnf.DnfBasicTest.test_dnf_help : SKIPPED -> None
dnf.DnfBasicTest.test_dnf_history : SKIPPED -> None
dnf.DnfBasicTest.test_dnf_info : SKIPPED -> None
dnf.DnfBasicTest.test_dnf_search : SKIPPED -> None
dnf.DnfBasicTest.test_dnf_version : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_exclude : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_install : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_install_dependency : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_install_from_disk : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_install_from_http : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_installroot : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_makecache : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_reinstall : SKIPPED -> None
dnf.DnfRepoTest.test_dnf_repoinfo : SKIPPED -> None
gcc.GccCompileTest.test_gcc_compile : SKIPPED -> None
gcc.GccCompileTest.test_gpp2_compile : SKIPPED -> None
gcc.GccCompileTest.test_gpp_compile : SKIPPED -> None
gcc.GccCompileTest.test_make : SKIPPED -> None
gi.GObjectIntrospectionTest.test_python : SKIPPED -> None
kernelmodule.KernelModuleTest.test_kernel_module : SKIPPED -> None
ldd.LddTest.test_ldd : SKIPPED -> None
logrotate.LogrotateTest.test_1_logrotate_setup : SKIPPED -> None
logrotate.LogrotateTest.test_2_logrotate : SKIPPED -> None
oe_syslog.SyslogTest.test_syslog_running : SKIPPED -> None
oe_syslog.SyslogTestConfig.test_syslog_logger : SKIPPED -> None
oe_syslog.SyslogTestConfig.test_syslog_restart : SKIPPED -> None
oe_syslog.SyslogTestConfig.test_syslog_startup_config : SKIPPED -> None
opkg.OpkgRepoTest.test_opkg_install_from_repo : SKIPPED -> None
pam.PamBasicTest.test_pam : SKIPPED -> None
parselogs.ParseLogsTest.test_parselogs : SKIPPED -> None
perl.PerlTest.test_perl_works : SKIPPED -> None
ptest.PtestRunnerTest.test_ptestrunner : SKIPPED -> None
python.PythonTest.test_python3 : SKIPPED -> None
rpm.RpmBasicTest.test_rpm_help : SKIPPED -> None
rpm.RpmBasicTest.test_rpm_query : SKIPPED -> None
rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size : SKIPPED -> None
rpm.RpmInstallRemoveTest.test_rpm_install : SKIPPED -> None
rpm.RpmInstallRemoveTest.test_rpm_query_nonroot : SKIPPED -> None
rpm.RpmInstallRemoveTest.test_rpm_remove : SKIPPED -> None
scp.ScpTest.test_scp_file : SKIPPED -> None
ssh.SSHTest.test_ssh : SKIPPED -> None
stap.StapTest.test_stap : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_basic : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_failed : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_list : SKIPPED -> None
systemd.SystemdJournalTests.test_systemd_boot_time : SKIPPED -> None
systemd.SystemdJournalTests.test_systemd_journal : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_disable_enable : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_status : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_stop_start : SKIPPED -> None
xorg.XorgTest.test_xorg_running : SKIPPED -> None
==============================End Regression==============================
Getting regression for base=runtime_core-image-sato-sdk_qemux86_20190124185230 target=runtime_core-image-sato-sdk_qemux86_20181029181546
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
apt.AptRepoTest.test_apt_install_from_repo : SKIPPED -> None
opkg.OpkgRepoTest.test_opkg_install_from_repo : SKIPPED -> None
pam.PamBasicTest.test_pam : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_basic : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_failed : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_list : SKIPPED -> None
systemd.SystemdJournalTests.test_systemd_boot_time : SKIPPED -> None
systemd.SystemdJournalTests.test_systemd_journal : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_disable_enable : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_status : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_stop_start : SKIPPED -> None
==============================End Regression==============================
Getting regression for base=runtime_core-image-sato_qemux86_20190124185230 target=runtime_core-image-sato_qemux86_20181029181546
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
apt.AptRepoTest.test_apt_install_from_repo : SKIPPED -> None
buildcpio.BuildCpioTest.test_cpio : SKIPPED -> None
buildgalculator.GalculatorTest.test_galculator : SKIPPED -> None
buildlzip.BuildLzipTest.test_lzip : SKIPPED -> None
gcc.GccCompileTest.test_gcc_compile : SKIPPED -> None
gcc.GccCompileTest.test_gpp2_compile : SKIPPED -> None
gcc.GccCompileTest.test_gpp_compile : SKIPPED -> None
gcc.GccCompileTest.test_make : SKIPPED -> None
kernelmodule.KernelModuleTest.test_kernel_module : SKIPPED -> None
ldd.LddTest.test_ldd : SKIPPED -> None
logrotate.LogrotateTest.test_1_logrotate_setup : SKIPPED -> None
logrotate.LogrotateTest.test_2_logrotate : SKIPPED -> None
opkg.OpkgRepoTest.test_opkg_install_from_repo : SKIPPED -> None
pam.PamBasicTest.test_pam : SKIPPED -> None
perl.PerlTest.test_perl_works : PASSED -> None
stap.StapTest.test_stap : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_basic : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_failed : SKIPPED -> None
systemd.SystemdBasicTests.test_systemd_list : SKIPPED -> None
systemd.SystemdJournalTests.test_systemd_boot_time : SKIPPED -> None
systemd.SystemdJournalTests.test_systemd_journal : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_disable_enable : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_status : SKIPPED -> None
systemd.SystemdServiceTests.test_systemd_stop_start : SKIPPED -> None
==============================End Regression==============================
Getting regression for base=sdk_core-image-sato_i686_qemux86_20190124185230 target=sdk_core-image-sato_i686_qemux86_20181029190813
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
buildepoxy.EpoxyTest.test_epoxy : PASSED -> None
python.Python2Test.test_python2 : SKIPPED -> None
python.Python3Test.test_python3 : PASSED -> None
==============================End Regression==============================
Getting regression for base=sdk_core-image-sato_x86_64_qemux86_20190124192316 target=sdk_core-image-sato_x86_64_qemux86_20181029192305
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
buildepoxy.EpoxyTest.test_epoxy : PASSED -> None
python.Python2Test.test_python2 : SKIPPED -> None
python.Python3Test.test_python3 : PASSED -> None
==============================End Regression==============================
Getting regression for base=sdkext_core-image-minimal_x86_64_qemux86_20190124192316 target=sdkext_core-image-minimal_x86_64_qemux86_20181029192305
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
buildepoxy.EpoxyTest.test_epoxy : SKIPPED -> None
python.Python2Test.test_python2 : SKIPPED -> None
python.Python3Test.test_python3 : SKIPPED -> None
==============================End Regression==============================
Getting regression for base=sdkext_core-image-sato_x86_64_qemux86_20190124192316 target=sdkext_core-image-sato_x86_64_qemux86_20181029192305
============================Start Regression============================
Only print regression if base status not equal target
<test case> : <base status> -> <target status>
========================================================================
buildepoxy.EpoxyTest.test_epoxy : SKIPPED -> None
python.Python2Test.test_python2 : SKIPPED -> None
python.Python3Test.test_python3 : SKIPPED -> None
==============================End Regression==============================


and this shows there were a number of things which started showing up
in the test results files, mostly more skips being logged which is
understandable given the chanegs we made in recent versions of the QA
code.

This does have a real world use in that we have been trying to figure
out if the ADT test result changes in 2.6.1 are a regression. Given the
data I've seen, I suspect the answer is now "no, its not a regression,
we just have some test improvements in 2.7 which we may want to
backport".

Cheers,

Richard



Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67BCA7F281
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:24:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7SKOoV9008967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2019 13:24:50 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 28 Aug 2019 13:24:49 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190821002750.52062-1-jason.wessel@windriver.com>
	<0f501dcaee763d8d33152fbd82af53385b8d0dc9.camel@linuxfoundation.org>
	<1bd6ab16-628d-2326-d6c3-c6097d7ba698@windriver.com>
	<fa27a4877d9dd0668e23873e02f8bd90bdf93ac0.camel@linuxfoundation.org>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <f4465a3a-87fc-3233-9add-8655a2c10ed1@windriver.com>
Date: Wed, 28 Aug 2019 15:24:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fa27a4877d9dd0668e23873e02f8bd90bdf93ac0.camel@linuxfoundation.org>
Subject: Re: [PATCH] serial-getty@.service: Allow device to fast fail if it does not exist
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
X-List-Received-Date: Wed, 28 Aug 2019 20:24:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/27/19 7:15 PM, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-08-27 at 19:03 -0500, Jason Wessel wrote:
>>
>> On 8/27/19 5:58 PM, Richard Purdie wrote:
>>> Hi Jason,
>>> Somehow this change is responsible for this build failure:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/976
>>>
>>> (steps 5c and 7c so failure during testimage).
>>>
>>> I have bisected it to this change, I haven't looked into why.
>>
>> Thanks for tracking it down.   I am sure how to try an duplicate
>> this.  I clicked around to try and find out a bit about what it is
>> running for these phases of the build but it is not very obvious.
>>
>> Is there a local.conf I can try along with what ever commands it ran?
> 
> The configuration its using is shown in
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/978/steps/8/logs/stdio
> for each step.
> 


I tried the configuration on my system but it seems to work fine, see below.   Is there a way to get complete log file of the boot on the broken host?  I am also curious if it fails every time or not.

/home/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/testimage/qemu_boot_log.20190827200002

I am not sure it will tell us anything further or not, but it certainly looks like the system didn't boot correctly in the first place.


Jason.


----


Initialising tasks: 100% |###############################################################################################
Sstate summary: Wanted 0 Found 0 Missed 0 Current 90 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
Started HTTPService on 128.224.149.46:38317
Test requires apt to be installed
Stopped HTTPService on 128.224.149.46:38317
Test requires autoconf to be installed
Test requires gtk+3 to be installed
Test requires autoconf to be installed
Started HTTPService on 128.224.149.46:32961
Stopped HTTPService on 128.224.149.46:32961
Test requires gcc to be installed
Test requires g++ to be installed
Test requires g++ to be installed
Test requires make to be installed
Test requires python3-pygobject to be installed
Test requires gcc to be installed
Test requires ldd to be installed
Test requires logrotate to be installed
Test case logrotate.LogrotateTest.test_2_logrotate depends on logrotate.LogrotateTest.test_1_logrotate_setup but it didn'
Not appropiate for systemd image
Test requires opkg to be installed
Test requires pam to be in DISTRO_FEATURES
Test requires ptest-runner to be installed
Test requires systemtap to be installed
Startup finished in 3.840s (kernel) + 2.157s (userspace) = 5.998s.
RESULTS:
RESULTS - connman.ConnmanTest.test_connmand_help: PASSED (0.11s)
RESULTS - connman.ConnmanTest.test_connmand_running: PASSED (0.11s)
RESULTS - date.DateTest.test_date: PASSED (0.63s)
RESULTS - df.DfTest.test_df: PASSED (0.11s)
RESULTS - dnf.DnfBasicTest.test_dnf_help: PASSED (0.78s)
RESULTS - dnf.DnfBasicTest.test_dnf_history: PASSED (0.44s)
RESULTS - dnf.DnfBasicTest.test_dnf_info: PASSED (0.37s)
RESULTS - dnf.DnfBasicTest.test_dnf_search: PASSED (0.35s)
RESULTS - dnf.DnfBasicTest.test_dnf_version: PASSED (0.32s)
RESULTS - dnf.DnfRepoTest.test_dnf_exclude: PASSED (5.03s)
RESULTS - dnf.DnfRepoTest.test_dnf_install: PASSED (0.78s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_dependency: PASSED (1.77s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_from_disk: PASSED (1.97s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_from_http: PASSED (1.52s)
RESULTS - dnf.DnfRepoTest.test_dnf_installroot: PASSED (6.91s)
RESULTS - dnf.DnfRepoTest.test_dnf_makecache: PASSED (0.42s)
RESULTS - dnf.DnfRepoTest.test_dnf_reinstall: PASSED (0.61s)
RESULTS - dnf.DnfRepoTest.test_dnf_repoinfo: PASSED (0.35s)
RESULTS - oe_syslog.SyslogTest.test_syslog_running: PASSED (0.12s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (1.21s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (0.21s)
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (1.91s)
RESULTS - perl.PerlTest.test_perl_works: PASSED (0.11s)
RESULTS - ping.PingTest.test_ping: PASSED (0.06s)
RESULTS - python.PythonTest.test_python3: PASSED (0.12s)
RESULTS - rpm.RpmBasicTest.test_rpm_help: PASSED (0.11s)
RESULTS - rpm.RpmBasicTest.test_rpm_query: PASSED (0.18s)
RESULTS - rpm.RpmBasicTest.test_rpm_query_nonroot: PASSED (0.89s)
RESULTS - rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size: PASSED (3.54s)
RESULTS - rpm.RpmInstallRemoveTest.test_rpm_install: PASSED (0.37s)
RESULTS - rpm.RpmInstallRemoveTest.test_rpm_remove: PASSED (0.15s)
RESULTS - scp.ScpTest.test_scp_file: PASSED (0.41s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (0.51s)
RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.12s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (0.21s)
RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (0.44s)
RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.11s)
RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.12s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: PASSED (0.68s)
RESULTS - systemd.SystemdServiceTests.test_systemd_status: PASSED (0.11s)
RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: PASSED (0.45s)
RESULTS - xorg.XorgTest.test_xorg_running: PASSED (0.20s)
RESULTS - apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
RESULTS - buildcpio.BuildCpioTest.test_cpio: SKIPPED (0.00s)
RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
RESULTS - buildlzip.BuildLzipTest.test_lzip: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_gcc_compile: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_gpp2_compile: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_gpp_compile: SKIPPED (0.00s)
RESULTS - gcc.GccCompileTest.test_make: SKIPPED (0.00s)
RESULTS - gi.GObjectIntrospectionTest.test_python: SKIPPED (0.00s)
RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: SKIPPED (0.00s)
RESULTS - ldd.LddTest.test_ldd: SKIPPED (0.00s)
RESULTS - logrotate.LogrotateTest.test_1_logrotate_setup: SKIPPED (0.00s)
RESULTS - logrotate.LogrotateTest.test_2_logrotate: SKIPPED (0.00s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config: SKIPPED (0.00s)
RESULTS - opkg.OpkgRepoTest.test_opkg_install_from_repo: SKIPPED (0.00s)
RESULTS - pam.PamBasicTest.test_pam: SKIPPED (0.00s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner: SKIPPED (0.00s)
RESULTS - stap.StapTest.test_stap: SKIPPED (0.00s)
SUMMARY:
core-image-sato () - Ran 60 tests in 35.370s
core-image-sato - OK - All required tests passed (successes=42, skipped=18, failures=0, errors=0)
NOTE: Tasks Summary: Attempted 731 tasks of which 730 didn't need to be rerun and all succeeded.


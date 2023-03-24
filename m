Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C20C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 17:34:26 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.3094.1679679261901474167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 10:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 8469E1D695;
	Fri, 24 Mar 2023 18:34:19 +0100 (CET)
Received: from [192.168.178.83] ([84.163.41.244]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pflIx-2rDkEy0; Fri, 24 Mar 2023 18:34:19 +0100
Date: Fri, 24 Mar 2023 18:34:13 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <1TC1SR.M6OX77V0K20W3@t-online.de>
In-Reply-To: 
	<CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	<9FONRR.ZLSABXKTP67E@t-online.de>
	<a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
	<B0EORR.JWJ884MGYK8G2@t-online.de>
	<CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
	<CHRXRR.A1NILQGNBS7P1@t-online.de>
	<CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tB0ieHHxNlFR7T6/hBk8"
X-TOI-EXPURGATEID: 150726::1679679259-79869C36-BC5C474F/0/0 CLEAN NORMAL
X-TOI-MSGID: fc22e29d-de66-4a4e-8aaa-87c7d4fa1890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 17:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179074

--=-tB0ieHHxNlFR7T6/hBk8
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Mi, 22. M=E4r 2023 um 20:11:34 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> If it does not fail, then submit the patch again with a revised commit
> message

It fails, but in the same way even without this patch being applied. It=20
looks like the tmpfs runs full and from then on the rest of the tests=20
are unsuccessful

file write error: No space left on device

RESULTS:
RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (29.67s)
RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (5.53s)
RESULTS - connman.ConnmanTest.test_connmand_help: PASSED (0.51s)
RESULTS - connman.ConnmanTest.test_connmand_running: PASSED (0.52s)
RESULTS - date.DateTest.test_date: PASSED (2.06s)
RESULTS - df.DfTest.test_df: PASSED (0.52s)
RESULTS - dnf.DnfBasicTest.test_dnf_help: PASSED (0.83s)
RESULTS - dnf.DnfBasicTest.test_dnf_history: PASSED (0.72s)
RESULTS - dnf.DnfBasicTest.test_dnf_info: PASSED (0.68s)
RESULTS - dnf.DnfBasicTest.test_dnf_search: PASSED (0.68s)
RESULTS - dnf.DnfBasicTest.test_dnf_version: PASSED (0.66s)
RESULTS - dnf.DnfRepoTest.test_dnf_exclude: PASSED (1.92s)
RESULTS - dnf.DnfRepoTest.test_dnf_install: PASSED (1.22s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_dependency: PASSED (1.86s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_from_disk: PASSED (2.33s)
RESULTS - dnf.DnfRepoTest.test_dnf_install_from_http: PASSED (1.24s)
RESULTS - dnf.DnfRepoTest.test_dnf_installroot: PASSED (7.57s)
RESULTS - dnf.DnfRepoTest.test_dnf_makecache: PASSED (0.57s)
RESULTS - dnf.DnfRepoTest.test_dnf_reinstall: PASSED (0.62s)
RESULTS - dnf.DnfRepoTest.test_dnf_repoinfo: PASSED (0.61s)
RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (1.75s)
RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (1.58s)
RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (1.81s)
RESULTS - gcc.GccCompileTest.test_make: PASSED (1.18s)
RESULTS - gi.GObjectIntrospectionTest.test_python: PASSED (0.59s)
RESULTS - go.GoHelloworldTest.test_gohelloworld: PASSED (0.54s)
RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: PASSED=20
(10.96s)
RESULTS - ldd.LddTest.test_ldd: PASSED (1.45s)
RESULTS - logrotate.LogrotateTest.test_logrotate_newlog: PASSED (2.29s)
RESULTS - logrotate.LogrotateTest.test_logrotate_wtmp: PASSED (1.97s)
RESULTS - oe_syslog.SyslogTest.test_syslog_running: PASSED (0.52s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (1.83s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (4.25s)
RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config: PASSED=20
(9.98s)
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.97s)
RESULTS - perl.PerlTest.test_perl_works: PASSED (0.52s)
RESULTS - ping.PingTest.test_ping: PASSED (0.01s)
RESULTS - python.PythonTest.test_python3: PASSED (0.53s)
RESULTS - rpm.RpmBasicTest.test_rpm_help: PASSED (0.52s)
RESULTS - rpm.RpmBasicTest.test_rpm_query: PASSED (1.05s)
RESULTS - rust.RustHelloworldTest.test_rusthelloworld: PASSED (0.51s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (1.02s)
RESULTS - stap.StapTest.test_stap: PASSED (1.62s)
RESULTS - apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED=20
(0.00s)
RESULTS - dnf.DnfRepoTest.test_dnf_installroot_usrmerge: SKIPPED (0.00s)
RESULTS - opkg.OpkgRepoTest.test_opkg_install_from_repo: SKIPPED (0.00s)
RESULTS - pam.PamBasicTest.test_pam: SKIPPED (0.00s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED=20
(0.00s)
RESULTS -=20
rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size:=20
SKIPPED (0.00s)
RESULTS - rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (0.00s)
RESULTS - rust.RustCompileTest.test_cargo_compile: SKIPPED (0.00s)
RESULTS - rust.RustCompileTest.test_rust_compile: SKIPPED (0.00s)
RESULTS - systemd.SystemdBasicTests.test_systemd_basic: SKIPPED (0.00s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: SKIPPED (0.00s)
RESULTS - systemd.SystemdBasicTests.test_systemd_list: SKIPPED (0.00s)
RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: SKIPPED=20
(0.00s)
RESULTS - systemd.SystemdJournalTests.test_systemd_journal: SKIPPED=20
(0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable:=20
SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro:=20
SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED=20
(0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED=20
(0.00s)
RESULTS - weston.WestonTest.test_wayland_info: SKIPPED (0.00s)
RESULTS -=20
weston.WestonTest.test_weston_can_initialize_new_wayland_compositor:=20
SKIPPED (0.00s)
RESULTS - weston.WestonTest.test_weston_running: SKIPPED (0.00s)
RESULTS - weston.WestonTest.test_weston_supports_xwayland: SKIPPED=20
(0.00s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: FAILED=20
(8407.07s)
RESULTS - rpm.RpmBasicTest.test_rpm_query_nonroot: FAILED (2.09s)
RESULTS - rpm.RpmInstallRemoveTest.test_rpm_install: FAILED (0.13s)
RESULTS - scp.ScpTest.test_scp_file: FAILED (0.19s)
RESULTS - xorg.XorgTest.test_xorg_running: FAILED (0.83s)
SUMMARY:
core-image-sato-sdk () - Ran 71 tests in 8524.357s
core-image-sato-sdk - FAIL - Required tests failed (successes=3D43,=20
skipped=3D23, failures=3D5, errors=3D0)





--=-tB0ieHHxNlFR7T6/hBk8
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Mi, 22. M=E4r 2023 um 20:11:34 +0100=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
If it does not fail, then submit the patch again with a revised commit
message</div></blockquote><div><br></div><div>It fails, but in the same way=
 even without this patch being applied. It looks like the tmpfs runs full a=
nd from then on the rest of the tests are unsuccessful</div><div><br></div>=
<div>file write error: No space left on device</div><div><br></div><div><di=
v>RESULTS:</div><div>RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (2=
9.67s)</div><div>RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (5.53s=
)</div><div>RESULTS - connman.ConnmanTest.test_connmand_help: PASSED (0.51s=
)</div><div>RESULTS - connman.ConnmanTest.test_connmand_running: PASSED (0.=
52s)</div><div>RESULTS - date.DateTest.test_date: PASSED (2.06s)</div><div>=
RESULTS - df.DfTest.test_df: PASSED (0.52s)</div><div>RESULTS - dnf.DnfBasi=
cTest.test_dnf_help: PASSED (0.83s)</div><div>RESULTS - dnf.DnfBasicTest.te=
st_dnf_history: PASSED (0.72s)</div><div>RESULTS - dnf.DnfBasicTest.test_dn=
f_info: PASSED (0.68s)</div><div>RESULTS - dnf.DnfBasicTest.test_dnf_search=
: PASSED (0.68s)</div><div>RESULTS - dnf.DnfBasicTest.test_dnf_version: PAS=
SED (0.66s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_exclude: PASSED (1=
.92s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_install: PASSED (1.22s)<=
/div><div>RESULTS - dnf.DnfRepoTest.test_dnf_install_dependency: PASSED (1.=
86s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_install_from_disk: PASSED=
 (2.33s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_install_from_http: PA=
SSED (1.24s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_installroot: PASS=
ED (7.57s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_makecache: PASSED (=
0.57s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_reinstall: PASSED (0.62=
s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf_repoinfo: PASSED (0.61s)</d=
iv><div>RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (1.75s)</div>=
<div>RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (1.58s)</div><d=
iv>RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (1.81s)</div><div>=
RESULTS - gcc.GccCompileTest.test_make: PASSED (1.18s)</div><div>RESULTS - =
gi.GObjectIntrospectionTest.test_python: PASSED (0.59s)</div><div>RESULTS -=
 go.GoHelloworldTest.test_gohelloworld: PASSED (0.54s)</div><div>RESULTS - =
kernelmodule.KernelModuleTest.test_kernel_module: PASSED (10.96s)</div><div=
>RESULTS - ldd.LddTest.test_ldd: PASSED (1.45s)</div><div>RESULTS - logrota=
te.LogrotateTest.test_logrotate_newlog: PASSED (2.29s)</div><div>RESULTS - =
logrotate.LogrotateTest.test_logrotate_wtmp: PASSED (1.97s)</div><div>RESUL=
TS - oe_syslog.SyslogTest.test_syslog_running: PASSED (0.52s)</div><div>RES=
ULTS - oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (1.83s)</div><=
div>RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (4.25s=
)</div><div>RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config=
: PASSED (9.98s)</div><div>RESULTS - parselogs.ParseLogsTest.test_parselogs=
: PASSED (4.97s)</div><div>RESULTS - perl.PerlTest.test_perl_works: PASSED =
(0.52s)</div><div>RESULTS - ping.PingTest.test_ping: PASSED (0.01s)</div><d=
iv>RESULTS - python.PythonTest.test_python3: PASSED (0.53s)</div><div>RESUL=
TS - rpm.RpmBasicTest.test_rpm_help: PASSED (0.52s)</div><div>RESULTS - rpm=
.RpmBasicTest.test_rpm_query: PASSED (1.05s)</div><div>RESULTS - rust.RustH=
elloworldTest.test_rusthelloworld: PASSED (0.51s)</div><div>RESULTS - ssh.S=
SHTest.test_ssh: PASSED (1.02s)</div><div>RESULTS - stap.StapTest.test_stap=
: PASSED (1.62s)</div><div>RESULTS - apt.AptRepoTest.test_apt_install_from_=
repo: SKIPPED (0.00s)</div><div>RESULTS - buildgalculator.GalculatorTest.te=
st_galculator: SKIPPED (0.00s)</div><div>RESULTS - dnf.DnfRepoTest.test_dnf=
_installroot_usrmerge: SKIPPED (0.00s)</div><div>RESULTS - opkg.OpkgRepoTes=
t.test_opkg_install_from_repo: SKIPPED (0.00s)</div><div>RESULTS - pam.PamB=
asicTest.test_pam: SKIPPED (0.00s)</div><div>RESULTS - ptest.PtestRunnerTes=
t.test_ptestrunner_expectfail: SKIPPED (0.00s)</div><div>RESULTS - rpm.RpmI=
nstallRemoveTest.test_check_rpm_install_removal_log_file_size: SKIPPED (0.0=
0s)</div><div>RESULTS - rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (=
0.00s)</div><div>RESULTS - rust.RustCompileTest.test_cargo_compile: SKIPPED=
 (0.00s)</div><div>RESULTS - rust.RustCompileTest.test_rust_compile: SKIPPE=
D (0.00s)</div><div>RESULTS - systemd.SystemdBasicTests.test_systemd_basic:=
 SKIPPED (0.00s)</div><div>RESULTS - systemd.SystemdBasicTests.test_systemd=
_failed: SKIPPED (0.00s)</div><div>RESULTS - systemd.SystemdBasicTests.test=
_systemd_list: SKIPPED (0.00s)</div><div>RESULTS - systemd.SystemdJournalTe=
sts.test_systemd_boot_time: SKIPPED (0.00s)</div><div>RESULTS - systemd.Sys=
temdJournalTests.test_systemd_journal: SKIPPED (0.00s)</div><div>RESULTS - =
systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPED (0.00s)</d=
iv><div>RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_r=
o: SKIPPED (0.00s)</div><div>RESULTS - systemd.SystemdServiceTests.test_sys=
temd_status: SKIPPED (0.00s)</div><div>RESULTS - systemd.SystemdServiceTest=
s.test_systemd_stop_start: SKIPPED (0.00s)</div><div>RESULTS - weston.Westo=
nTest.test_wayland_info: SKIPPED (0.00s)</div><div>RESULTS - weston.WestonT=
est.test_weston_can_initialize_new_wayland_compositor: SKIPPED (0.00s)</div=
><div>RESULTS - weston.WestonTest.test_weston_running: SKIPPED (0.00s)</div=
><div>RESULTS - weston.WestonTest.test_weston_supports_xwayland: SKIPPED (0=
.00s)</div><div>RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsucc=
ess: FAILED (8407.07s)</div><div>RESULTS - rpm.RpmBasicTest.test_rpm_query_=
nonroot: FAILED (2.09s)</div><div>RESULTS - rpm.RpmInstallRemoveTest.test_r=
pm_install: FAILED (0.13s)</div><div>RESULTS - scp.ScpTest.test_scp_file: F=
AILED (0.19s)</div><div>RESULTS - xorg.XorgTest.test_xorg_running: FAILED (=
0.83s)</div><div>SUMMARY:</div><div>core-image-sato-sdk () - Ran 71 tests i=
n 8524.357s</div><div>core-image-sato-sdk - FAIL - Required tests failed (s=
uccesses=3D43, skipped=3D23, failures=3D5, errors=3D0)</div></div><div><br>=
</div><div><br></div><div><br></div><div></div></div>
--=-tB0ieHHxNlFR7T6/hBk8--



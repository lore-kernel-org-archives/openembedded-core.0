Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3E7C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 11:15:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4952.1749122104329858953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 04:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82512ced31=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558SsVg032583
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 11:15:03 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t3utd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:15:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 04:15:01 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 04:15:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rpm: coorect tool path in macros for no usrmerge
Date: Thu, 5 Jun 2025 19:14:58 +0800
Message-ID: <20250605111458.2854909-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4-R1HBkyQuVA4o4Lqk6p91_3NOu9fKJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA5NyBTYWx0ZWRfXztnVTWeL30iW jMtMh9VkKqOmVjnNY44izm5msZX+BQa/FPrQIwhlP9jelkDQox7PDlf1C7b86QXFlECNzodo39g 7WqvvM2I5SZPrTDEzGENGvJ2zK4i9WfIShiuZu6/ShQRMIMKLCL5sv2TVl+Zeq5E2SI61RmWOGb
 5TF5YuEJJmvDSeHhjf394Db6ahNsSiL5hD/EKWr5A/myABf3JVA4f1M/6ljjk2+p50YQlbOhGiW C4VmrvCcsANGnXPn0u+omP4TJhJBw843tGbqpV/F1Dk/FibixK9H+QXVqtPF0DbosboxgMmuHTH JU4+lfOYfEXnTCOkTQy0RmdIx2ws/sKQBKV2Vef+Tbm1zFdrMXaih3kOyxizHT+Z7KfmURnbF9Y
 J/d2g8EdtTo6vx5Q/8SrqVxKYOjiU+5shO9xgAMV9WcIyblPNHWhSiX9IdOBquIVPeiIQtTf
X-Proofpoint-GUID: 4-R1HBkyQuVA4o4Lqk6p91_3NOu9fKJC
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=68417c37 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=f1hami8VAAAA:8 a=t7CeM3EgAAAA:8 a=nyH7KnfDRL1iecw7tCoA:9
 a=NS3OCI0N-QAA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FMFxGtP9trmfb28vA-lX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218008

While no usrmerge in sysvinit, some tools defined in rpm macro have wrong path

$ echo 'INIT_MANAGER="sysvinit"'  >> conf/local.conf
$ echo 'IMAGE_INSTALL:append = " rpm busybox"' >> conf/local.conf
$ bitbake core-image-minimal
$ runqemu tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.qemuboot.conf

root@qemux86-64:~# which sed tar rm mkdir cp cat chown chmod gzip grep mv
/bin/sed
/bin/tar
/bin/rm
/bin/mkdir
/bin/cp
/bin/cat
/bin/chown
/bin/chmod
/bin/gzip
/bin/grep
/bin/mv

root@qemux86-64:~# rpm --eval "%{__sed} %{__tar} %{__rm} %{__mkdir} %{__cp} %{__cat} %{__chown} %{__chmod} %{__gzip} %{__grep} %{__mv}"
/usr/bin/sed /usr/bin/tar /usr/bin/rm /usr/bin/mkdir /usr/bin/cp /usr/bin/cat /usr/bin/chown /usr/bin/chmod /usr/bin/gzip /usr/bin/grep /usr/bin/mv

Here to explain how __rm was set in rpm during build. The build system
of rpm is cmake. Take rpm rpm-4.19.x for example:

The '__RM rm' is defected by findutil [1], and function findutil
calls find_program to search for tool, if not found on host, then
hardcode with "/usr/bin" prefix [2]

Yocto explicitly set OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY" [3][4]
to search tools from CMAKE_FIND_ROOT_PATH [5] which locates in recipe sysroot,
if not found in recipe sysroot, hardcode with "/usr/bin" prefix

If "${base_bindir}" != "${bindir}, explicitly correct tools in rpm
macros, use ${base_bindir} to instead original ${bindir}. Only do the
operation for target, it is not necessary for native and nativesdk,
because most host distribution supports usrmerge

After applying this commit, on target:

root@qemux86-64:~# rpm --eval "%{__sed} %{__tar} %{__rm} %{__mkdir} %{__cp} %{__cat} %{__chown} %{__chmod} %{__gzip} %{__grep} %{__mv}"
/bin/sed /bin/tar /bin/rm /bin/mkdir /bin/cp /bin/cat /bin/chown /bin/chmod /bin/gzip /bin/grep /bin/mv

root@qemux86-64:~# ls /bin/sed /bin/tar /bin/rm /bin/mkdir /bin/cp /bin/cat /bin/chown /bin/chmod /bin/gzip /bin/grep /bin/mv
/bin/cat    /bin/chmod  /bin/chown  /bin/cp     /bin/grep   /bin/gzip   /bin/mkdir  /bin/mv     /bin/rm     /bin/sed    /bin/tar

In order to save size, this commit does not add these tools to
runtime depends, user should explicitly add them if necessary
(such as use rpm to build packages)

[1] https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/CMakeLists.txt#L121
[2] https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/CMakeLists.txt#L59
[3] https://git.openembedded.org/openembedded-core/commit/?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3
[4] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html
[5] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/cmake.bbclass?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3#n123

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index bcc138dab04..33966b97b41 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -101,6 +101,8 @@ WRAPPER_TOOLS = " \
    ${libdir}/rpm/rpmdeps \
 "
 
+base_bindir_progs = "sed tar rm mv mkdir cp cat chown chmod gzip grep"
+
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
@@ -123,9 +125,15 @@ do_install:append:class-nativesdk() {
 	EOF
 }
 
-# Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install:append:class-target() {
+    # Rpm's make install creates var/tmp which clashes with base-files packaging
     rm -rf ${D}/var
+
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        for prog in ${base_bindir_progs}; do
+            sed -i "s|^%__${prog}.*|%__${prog}  ${base_bindir}/${prog}|g" ${D}${libdir}/rpm/macros
+        done
+    fi
 }
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
-- 
2.34.1



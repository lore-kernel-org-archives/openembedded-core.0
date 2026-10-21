Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2355.1792547534267235779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 18:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WqnhG9QH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JwdZq+0H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtiiu2584153
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 01:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f2uxe1CkoQsZhChqqCSwVzp6QLkvdYWl/9f
	NuC4G5dg=; b=WqnhG9QH+pjK5m7iJXr6X/3fOUVXQNlBtSqbuIN7aylyhZNEhNB
	eAqph5VPpemlO9CWj+ESgEBrxE9ihD4zOk2d2SKux81aavzDXZsNN/GBB+ESKALA
	P2Nf6lUekywHOB8uJxSOG3uRdiiCweIbUDRFBsUVQF/W5nnH7RbjlYBBpm7mDv1s
	cC3oYosCrVEPJfllDLbSEL+iiD72hwMeLVJeTqEIIrZMVpIcbSsYa9jotjy5VF2H
	44yZBlLf4GTFemVcVlwqrkpVdg111vX6tw6PNDQ36MvU9AmaMdwSuNdGiMEL5e6z
	GT8div+roez6WAGbiJiKpJoTgbn+DPqnE8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1eap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 01:52:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88629a452e0so160273b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 18:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792547531; x=1793152331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2uxe1CkoQsZhChqqCSwVzp6QLkvdYWl/9fNuC4G5dg=;
        b=JwdZq+0HlIyvYY1jWyLkH+juBqylV9unwi53fDLNII6F4ebihXgejcLrxSnSeJJ5hs
         JuDsGn5mjPZa4GE3/k9zPkbo1SWwvw5AUuFrQssGAoQnRqGdd3xxDxm7fBGw6eij8ayx
         jL3Wu4OztYc+Gynq9CyNP/MjhKXmnCVhukrs0vc+7SHWkmRPTDD4tEvbp7vpsXUj7YpB
         o4TffYWy4OP7RzK+be6Kb6AP9WttG9lBvTsuKcPftDvQw3/4B3ZUej3u6y9bWspPNvYf
         kdqCEB7I+g8t8jlKiuaggFohL5hWtVdkLODOV8+kIRYxbshh0Y9PI/kQlVvmyQjjdawX
         1eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547531; x=1793152331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f2uxe1CkoQsZhChqqCSwVzp6QLkvdYWl/9fNuC4G5dg=;
        b=mg5LrWmnPE8leGE+KvMyzfj38o9znAtGWxqGOsyg47n/K4AaTp+CXEUMBgkmkVMdvr
         YFZdMYRfncTvjspbPcNH6XVnXI9W4tJseeiavgDd3VpWFN8YK/4+M6uzf4cJlR3qD4CO
         KE27QZ+WPJEY4gmTA1qLVMNPCCRq4xR+ZUzIhpss5QiJEPI4FJ3sPLXvyfOOcpWTX1Jy
         vptc9I//1HSMo+u759EinuoE3uW/1goWJh7JWGz820TkvEj0V0hu8c5Zkr3VBd0ofnt8
         GRgqH7I8h3XNWlV80aQJuim9WNfQXaFZ/OLhkeDAFRgvxqt0YvlQPJzGmLcidXm1kqhp
         5FTg==
X-Gm-Message-State: AFq9FYIiXxY3NJececYpDS6un63AoLctK996qaB2Zr6aS5YvAFy1dazI
	a4Lh0/qt6tuw2XDb8f9aCEiG3bG3d998xkHSDgkTTjsBPlAKokOdpooB1+3xTwBVLRCpdvO4+Js
	TRJWD7Tf8lW7BoHJ23cszChT3GqpGQqp0Z5sKDproawpHFQPhh4jz3lr/br5bnNo6sgRColMV3a
	9V3NfAo4Od5OUfNBHifw==
X-Gm-Gg: AYBFou37igjkGqWXvQ5ENashNt84wovsNn5eB6XwseK3e/O08wgqx4mvXdjCBINmmK5
	QpcEE14zcLqQbNTIv5BulmZSRFLvDN/cE1df2GRmYPLQidWLNhEgD4O6DHBNwIk1VxaZejiyxlI
	CoFEIvV+osTDEq1xE7k5e3B+dtv1Pqb7RNzeGn2KTOOgk7L7vkYWIIyqe4FSZHJH45jRS3j6S1H
	ViyY34jiIJet0aWi8IQV/WC2lZugFG+2VSmKFYkM/Ad+w7cMwjviGiwzRQOtULMp2yCOSuADMTs
	cAygCONNDR7OagbFf3yX/PO7JGA0oPF+8xwy0N0wmt2Vd2NJZ/wKWJptIF6OfM1WH4dCn6HRKns
	3QUG76XfGcTC4bjiBinBy5KYx9jKz1LTUuEVD3r6b/Ds9NwW78KBq6ytfT5OMk8DQUuAoTde5Gz
	sahZYV7K3n7BRfRsHBwfPaGN9bQwKJASOR/SEHzA==
X-Received: by 2002:a05:6a00:328a:b0:89e:99a6:4671 with SMTP id d2e1a72fcca58-8a089e8d017mr485875b3a.36.1792547531318;
        Tue, 20 Oct 2026 18:52:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:328a:b0:89e:99a6:4671 with SMTP id d2e1a72fcca58-8a089e8d017mr485854b3a.36.1792547530595;
        Tue, 20 Oct 2026 18:52:10 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a089611088sm211514b3a.54.2026.10.20.18.52.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:52:10 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: fix the audit type list generation when cross-compiling
Date: Wed, 21 Oct 2026 01:52:02 +0000
Message-ID: <20261021015202.615754-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwNyBTYWx0ZWRfXxWj/BDZN2G1N
 qnkLSHvv1doJbU6ZRRmr892+/VfTCH4CW6hmiqiqoN8pxSsqiM4CnTXcNleozVi3kSKs+rCxNDh
 FAhz4z8J99/jnmPq+NgK3Q4PwZt3ZoU=
X-Proofpoint-ORIG-GUID: bSFTpPf5vEgnn5tA1Kd9ZmZlZFpVvRFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwNyBTYWx0ZWRfXymOS+xv1s7yG
 v8zmm6zfnu+WC3gjALN0KqhRilPoilbCaKnqOXKIlMzvY1hMw7DEKu0fmIA/GwZt/aLJB0NzAiG
 vhM0N9EMHUewSpwPRWSKbtVHUPImek4bS3hN+FIPdvfBManWSwLkqJV7MdKvJKidiNwDgmvsJlu
 2ZOyRh3yaYtzdOA+eWRMOfgUZuiUujn8bIYhFQdS2Z3fDOSCc9Hc47HXv4DgP2DZLh3h0WNxq7P
 TvZBh8+nsluad24igrt6eZVfZZdZmFTI6fC0gFugvApz3rTsc/uLRpfFWC3PLNy4NFLx6C1uant
 jKdcQ1a72QhJNHgXfqUe5nZIbdf+L1TxVFGUdDMF+FC5Y5Cd3JcXuao0BgyR2tM2EI47OeMkutw
 p8ZC8QKYZbGPAEBldt01w6s3kAvZtna2A93cNEFr+otV5b+ZdOtiF0MEX2Rk/+zRboVA+41q4qE
 lb+eMMWI5ZfWoNDLa6g==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad81acc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=GDv2MW6ia1KVMAF9aCMA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bSFTpPf5vEgnn5tA1Kd9ZmZlZFpVvRFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 01:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248346
Content-Type: text/plain; charset="utf-8"

systemd 262 passes the includedir variable of audit.pc to the audit type
list generator. OE's pkg-config wrapper enables the freedesktop.org
sysroot rules, so that variable is not prefixed with the sysroot, and
the cross compiler gets -I/usr/include and fails with
-Werror=poison-system-directories when audit is in DISTRO_FEATURES.
Backport the upstream fix.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 ...the-sysroot-to-libaudit-s-includedir.patch | 63 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_262.bb      |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch

diff --git a/meta/recipes-core/systemd/systemd/0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch b/meta/recipes-core/systemd/systemd/0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch
new file mode 100644
index 0000000000..5212577955
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch
@@ -0,0 +1,63 @@
+From 492b3f38c3cea1054bffe5f9e203dcf73ee8e981 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Wed, 21 Oct 2026 05:09:48 +0900
+Subject: [PATCH] journal: prepend the sysroot to libaudit's includedir if
+ pkg-config did not
+
+The audit type list generator builds its -I flag from the includedir
+variable of audit.pc. When cross-compiling, that variable is not
+necessarily relocated into the sysroot: with the freedesktop.org
+sysroot rules, pkg-config applies PKG_CONFIG_SYSROOT_DIR only to the
+-I/-L flags in Cflags/Libs, and returns variables as is. pkgconf
+follows these rules when PKG_CONFIG_FDO_SYSROOT_RULES is set, which
+OpenEmbedded does in its pkg-config wrapper.
+
+The includedir then yields the unprefixed /usr/include. GCC does not
+apply --sysroot to a plain -I, so the build host's headers get picked
+up, and toolchains built with -Werror=poison-system-directories, as
+OpenEmbedded's is, reject it:
+
+  cc1: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]
+
+Query pc_sysrootdir, which pkgconf sets from PKG_CONFIG_SYSROOT_DIR,
+and prepend it to includedir unless includedir is already under it
+(pkgconf's default mode already relocates variables). This does not
+single out any particular directory, so a customized includedir is
+handled the same way.
+
+Follow-up for 0d06dbabc364fe58e4bd1b9696f3c5b823620dbc (v262).
+
+Co-authored-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/492b3f38c3cea1054bffe5f9e203dcf73ee8e981]
+Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
+---
+ src/journal/meson.build | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/journal/meson.build b/src/journal/meson.build
+index a27b359b61..d6bc742b3d 100644
+--- a/src/journal/meson.build
++++ b/src/journal/meson.build
+@@ -33,9 +33,17 @@ systemd_journald_export_sources += journald_gperf_c
+ generate_audit_type_list = files('generate-audit_type-list.sh')
+ generate_audit_type_command = [env, 'bash', generate_audit_type_list, cpp]
+ if libaudit.found()
++        # With the freedesktop.org sysroot rules (e.g. PKG_CONFIG_FDO_SYSROOT_RULES=1, as set by
++        # OpenEmbedded), pkg-config does not prepend the sysroot to variables. Do it ourselves.
++        libaudit_includedir = libaudit.get_variable('includedir')
++        libaudit_sysroot = libaudit.get_variable(pkgconfig : 'pc_sysrootdir', default_value : '')
++        if libaudit_sysroot not in ['', '/'] and not libaudit_includedir.startswith(libaudit_sysroot + '/')
++                libaudit_includedir = libaudit_sysroot + libaudit_includedir
++        endif
++
+         generate_audit_type_command += [
+                 '-include', 'libaudit.h',
+-                '-I' + libaudit.get_variable('includedir'),
++                '-I' + libaudit_includedir,
+         ]
+ endif
+ generate_audit_type_command += system_include_args
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.bb
index e1d64a5c94..d70053182f 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://touchscreen.rules \
            file://coredumpd-kernel-version.conf \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch \
            "
 
 PAM_PLUGINS = " \
-- 
2.43.0


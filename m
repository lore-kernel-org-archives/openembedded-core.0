Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21999.1793832395594459848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 14:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=juRyR15M;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=YBiwFuH8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4MCJ773208786
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Nov 2026 22:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fcKBGMuahZ4bYZe8F6Cn8I
	MGQCFc0UnfTO2Qx8twTTw=; b=juRyR15MSqy+fk9gWBEPWOk1JNCxdfxJiKeO8E
	wzpMDgWfIrFhCuYUfSDPbTuXQVNSEVnvSoWi8PTKOTShKilbud04YFLiZYfBW8yz
	IiLKakWDr7v2Fh3X+1PAcXSji+0AKB3DerHp9P35jEL/ux0ffWic11ZN5CLwogNx
	c8aFEtUbpv6FBIPYWtDfuy8f7mBqGspLOui3Fq1Npk9ABHkaBJ5CSBitrj403tyO
	jyE4VI1flNnxeQDfO6tTJDKQlhpUWSmtQ/lVVDkdsJk4t/fWKx/msT8UyC6AsFeC
	jxwIPXeReBGlBsFlMezBeNNIQHBoOGpdzXXmIhfUjvPF5vTw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj2080-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 22:46:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so64178a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 14:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793832394; x=1794437194; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcKBGMuahZ4bYZe8F6Cn8IMGQCFc0UnfTO2Qx8twTTw=;
        b=YBiwFuH8AMn3ZO9nlVOs3CmQQwJ19iYCUkjU2gFbgxgHA+u0+fTQQuGfIPs+2mk4Hm
         ZjU50t8jeaRs3KKRteIrvWckPrSnVjVIGKxNIofVIj5pr84VWZvTKwtsLeIAfvP+y888
         Q+wY+AUrrcHRtM53LzJD17C4uVv5pIRK4Gc3UFJWanD4FUtYthroY+z0uEhDbFEYdyhD
         Evffi90L+37udt3YiN0bkyhSvJrVgdrY0xrIl11LahB0stRXeZEuzMTvsTRzayYIPPfg
         GgSyQcjDOdFj3bmqNjRehOExJsv2SQr1iH7bTqbBa1FdXalZCDHpzxksNLu3+99T9k4f
         5Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832394; x=1794437194;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcKBGMuahZ4bYZe8F6Cn8IMGQCFc0UnfTO2Qx8twTTw=;
        b=2TNxPM3MWijXxdv8thij8Sgn0ShFyNmWrWNfcMiyOYop2kGydXounehgo5QNMrDpg/
         fixnUKr2UoWf+5OzYDJzjNoovmz2IssWEeFmInT5TiIJ+EVDVftXoaKV9FI2rfc35uOc
         NKs+udB1G9w41Kiiueomzs+dmJb2zOqTo3E4fPKZmXe7/2w9J/z+jm1vtIWFaQbygPsq
         tKH0fXa5ExEewlVeDTbuxaB4aaGQM8dDbc4o6afRqdOec19URBdLTvNAbEqYJY2V/lir
         vuZKbPVM2bSh3nYs+ygHZmJTJDP7wdAM69OiW4HUXWunYd4HNIzQl4sf5AWP9Ub0GtEi
         yaBg==
X-Gm-Message-State: APuU4Z9h25FijJHGB/uT7ogPFYDeAf7GVZpqIRj1afKD/8mBC+TB7lFY
	t262/0LXjC77+oDje8yQHpkv2lMWqwstQKhHj++DHESfINUEeyw9NvbeonYBS7Y4fHN0Vyo7W79
	+mEL5FGVvJPq84U1UWzoHUQp+/teaGGjIFXa5EPg409lqMgGA9pRwhADnHnxgiMQpSIDi/8f3U4
	R9fGhaw8eCrgVos8k=
X-Gm-Gg: AYBFou3pqqZ6hYRkFV6D02IAXnWNqEs0mL5wdOoXMeivl9OPNRhzVnBAE/7XNOIdvBh
	YtBHEwwGWoW1SCYYJik+NsPw8NY89ToezAzX5OjNdi5wxOXsoRnJCJ2PMFYQkxL7BLvLbFfv+Pb
	Zvlvc66WFyUR7A+vdCMYblYC08sm66ZlYXGCVz04ZdgWmV6usLo5ZYK22ni9RgI3V4LX2wtPC87
	1FJRmuCw+4OlBBrAQN82f9+H5zqXQ0JV+GEYnJ/c1k0UMS1IDgU+QXvLS/bvFGIcdAJCT8M5S0K
	NFbigT4MdaT3qAWWiy+xgwqeOp+SffrNE138WEgsV55k6LK8mRHj/cDKwiiKTJWK/IqqMgMNT3D
	XBLp6HKvsiYZ1VExwYyb+GzGbmiGFwY1/osrSey8laNVuDnMz15O1QeiNVamLRJ7ysL4qQrOaHt
	lO11PzslIw6MTxjrj2DQ6xtDTms13ekZ21bTTA5z3QbpiSvlw3NvKcqx85OuDOPj7POPwIG5QRn
	CIttwiD4zYkxkg=
X-Received: by 2002:a17:90b:1a8a:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3b0afc28fc2mr494466a91.13.1793832393905;
        Wed, 04 Nov 2026 14:46:33 -0800 (PST)
X-Received: by 2002:a17:90b:1a8a:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3b0afc28fc2mr494456a91.13.1793832393277;
        Wed, 04 Nov 2026 14:46:33 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31a3efasm798093a91.9.2026.11.04.14.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:46:32 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: joaomarcos.costa@bootlin.com, raj.khem@gmail.com
Subject: [PATCH] llvm-project-source: make do_preconfigure re-entrant
Date: Wed,  4 Nov 2026 22:46:26 +0000
Message-ID: <20261104224627.1280147-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX/EmnAe88mcJS
 mym4vC8AI2xhOtpKOSU8d/EjU3svHFxJKH65AFr+qTzRQPGFXTxD8Sl+GUN1FqQagaahBTBmjit
 0cCb5dsbpeUDLwvsOLCftpzzI9qWjsZQevy1oHmEzthce5OknUg/MUhYM/Gqt+t5GKu605SOsDt
 A/9dhrumOOvKsV8T2cGgJmmVZpnvsM7U6ru1akIbd+8hFQQUj1uB92MSvUEwuSoizgmhIqHKr/l
 X+emOaJBxrZhjqkXQdDUUD6wvrKb35exf21LvemfXfFaytKf+fcylSUlis3WrCx9JNlQZMiPS3n
 SBNn6Tfxo2EK20wlDilMCQNqdIdJDDiPEbN/5uQCIAIYG+WtglVsz1anSfaulAY28Mlk0KBRdnp
 FD3g8rNhfh6u6u+dIWxT8FluzGYycgEnWW25jQoN4sD0BVvYzylIDWV2DfkelfVyAIEJKXkcsK4
 Cl9zc+BqZolS5KneMsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX1fRJglS62Efk
 YsiExg/KFpXPv1j14wHpXmn5d3u+YuhwQ8f8OCgfi70rmn1X0YgtYBOKyz0zx8LglusqYl++S+I
 MgV796kUAFE+I+lcYP0Mt8UyOhNdclA=
X-Proofpoint-ORIG-GUID: hvm46hn6B_8JSImcw-vmBPpm3E7JnB8j
X-Proofpoint-GUID: hvm46hn6B_8JSImcw-vmBPpm3E7JnB8j
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aebb5ca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=TBm0vmeDsXzepllbaysA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6A4MCJ773208786
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249414

do_preconfigure replaces the //CLANG_EXTRA_OE_* anchors in the shared
source tree with the vendor and distro lists of the current
configuration, consuming the anchors, so it only works on a freshly
patched tree.

When the configuration changes in an existing TMPDIR, for example from
DISTRO=3Dnodistro to a DISTRO with TARGET_VENDOR =3D "-qcom", do_unpack a=
nd
do_patch stay valid and only do_preconfigure re-runs. Its seds find
nothing to replace, so the tree keeps the previous vendor list while
the task hash promises the new one. llvm-native and clang-native are
built from that tree and published to sstate under the new hash, from
where pristine builds of the same configuration restore them. That
clang does not treat aarch64-qcom-linux as an OpenEmbedded vendor,
skips the <sysroot>/usr/lib/<triple>/<version> GCC layout and finds no
libstdc++ headers; mesa's rusticl bindgen fails with "'cstddef' file
not found".

Keep the anchors in place and insert the generated lines before them,
each tagged with a comment naming its anchor, so that a run first
drops what the previous run inserted. The task can now run any number
of times, with any configuration, and always leaves the tree that
configuration describes, as suggested when adding vardeps was proposed
instead [1]. The generated code is unchanged apart from whitespace and
the tags; an empty CLANG_EXTRA_OE_DISTRO now yields an IsOpenEmbedded()
that returns false instead of invalid C++.

Move the Gnu.cpp anchor onto a line of its own like the others. The
changed patch also makes existing build directories, whose tree has
already lost its anchors, unpack and patch the sources again.

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/202606231208=
18.110754-5-joaomarcos.costa@bootlin.com/

Assisted-by: Claude Code:claude-fable-5-1
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 ...t-anchor-for-adding-OE-distro-vendor.patch | 11 +--
 .../clang/llvm-project-source.inc             | 83 ++++++++++---------
 2 files changed, 50 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anc=
hor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang=
/0013-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
index aba7488323..b7c8b8e536 100644
--- a/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for=
-adding-OE-distro-vendor.patch
+++ b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for=
-adding-OE-distro-vendor.patch
@@ -98,10 +98,10 @@ Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.cos=
ta@bootlin.com>
 ---
  clang/include/clang/Driver/Distro.h   | 2 ++
  clang/lib/Driver/Distro.cpp           | 1 +
- clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 2 ++
  clang/lib/Driver/ToolChains/Linux.cpp | 2 ++
  llvm/lib/TargetParser/Triple.cpp      | 1 +
- 5 files changed, 7 insertions(+)
+ 5 files changed, 8 insertions(+)
=20
 diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/D=
river/Distro.h
 index aa4b3e1..2d77a2b 100644
@@ -136,14 +136,15 @@ index 585497e..3b58ac7 100644
    return Version;
  }
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/Tool=
Chains/Gnu.cpp
-index f44663f..73ff1f4 100644
+index dfb0390..82a3bac 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2371,6 +2371,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
+@@ -2383,6 +2383,8 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
        "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
        "x86_64-redhat-linux",    "x86_64-suse-linux",
        "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
-+      "x86_64-oe-linux",//CLANG_EXTRA_OE_VENDORS_TRIPLES
++      "x86_64-oe-linux",
++      //CLANG_EXTRA_OE_VENDORS_TRIPLES
        "x86_64-unknown-linux",   "x86_64-amazon-linux"};
    static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
                                             "x86_64-pc-linux-gnux32"};
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index 5cd08d4085..370fbc493d 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -31,14 +31,30 @@ CLANG_EXTRA_OE_DISTRO ?=3D "poky:poky"
 # Match with MULTILIB_GLOBAL_VARIANTS
 ML_VARIANTS =3D "lib32 lib64 libx32"
=20
+# Insert lines before the //<anchor> comment in path. The anchor stays i=
n
+# place and every inserted line carries a comment naming it, so a later =
run
+# of do_preconfigure on the same shared tree first drops what the previo=
us
+# run inserted: the result only depends on the current configuration.
+def clang_oe_generate(path, anchor, lines):
+    anchor_comment =3D "//" + anchor
+    marker =3D "// do_preconfigure: " + anchor
+    with open(path) as f:
+        content =3D [line for line in f.read().split("\n") if not line.r=
strip().endswith(marker)]
+    anchors =3D [i for i, line in enumerate(content) if line.rstrip().en=
dswith(anchor_comment)]
+    if len(anchors) !=3D 1:
+        bb.fatal("Expected one %s anchor in %s, found %d" % (anchor_comm=
ent, path, len(anchors)))
+    i =3D anchors[0]
+    indent =3D content[i][:len(content[i]) - len(content[i].lstrip())]
+    content[i:i] =3D [indent + line + " " + marker for line in lines]
+    with open(path, "w") as f:
+        f.write("\n".join(content))
+
 python do_preconfigure() {
-    import subprocess
-    case =3D ""
-    triple =3D ""
-    vendors =3D d.getVar('CLANG_EXTRA_OE_VENDORS')
+    source =3D d.getVar("S")
     multilib_variants =3D (d.getVar("ML_VARIANTS") or "").split()
+
     vendors_to_add =3D []
-    for vendor in vendors.split():
+    for vendor in (d.getVar('CLANG_EXTRA_OE_VENDORS') or "").split():
         # convert -yoe into yoe
         vendor =3D vendor.lstrip('-')
         # generate possible multilib vendor names for yoe
@@ -48,45 +64,34 @@ python do_preconfigure() {
         if vendor !=3D "oe":
             vendors_to_add.append(vendor)
=20
-    for vendor_to_add in vendors_to_add:
-        case +=3D '\\n    .Case("' + vendor_to_add + '", Triple::OpenEmb=
edded)'
-        triple +=3D ' "x86_64-' + vendor_to_add + '-linux",'
-
     bb.note("Adding support following TARGET_VENDOR values")
     bb.note(str(vendors_to_add))
     bb.note("in llvm/lib/TargetParser/Triple.cpp and ${S}/clang/lib/Driv=
er/ToolChains/Gnu.cpp")
-    source =3D d.getVar("S")
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_VENDORS_TRIPLES#%s#g' % tr=
iple, source + '/clang/lib/Driver/ToolChains/Gnu.cpp']
-    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' % case=
, source + '/llvm/lib/TargetParser/Triple.cpp']
-    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
-
-    case =3D ""
-    triple =3D ""
-    name =3D ""
-    check =3D ""
-    oe_names =3D []
-    distros =3D d.getVar('CLANG_EXTRA_OE_DISTRO')
-    for distro in distros.split():
-        distro_id_raw =3D distro.split(":")[0]
-        distro_id =3D distro_id_raw.replace('-','_')
-        distro_triple =3D distro.split(":")[1]
-        case +=3D '\\n    .Case("' + distro_id_raw + '", Distro::' + dis=
tro_id.upper() + ')'
-        triple +=3D '\\n   if (Distro.Is' + distro_id.upper() + '())\\n =
    return "x86_64-' + distro_triple + '-linux";'
-        name +=3D '\\n    '+ distro_id.upper() + ','
-        check +=3D '\\nbool Is' + distro_id.upper() + '() const { return=
 DistroVal =3D=3D ' + distro_id.upper() + '; }'
-        oe_names.append('DistroVal =3D=3D ' + distro_id.upper())
+    clang_oe_generate(source + '/llvm/lib/TargetParser/Triple.cpp', 'CLA=
NG_EXTRA_OE_VENDORS_CASES',
+                      ['.Case("%s", Triple::OpenEmbedded)' % v for v in =
vendors_to_add])
+    clang_oe_generate(source + '/clang/lib/Driver/ToolChains/Gnu.cpp', '=
CLANG_EXTRA_OE_VENDORS_TRIPLES',
+                      ['"x86_64-%s-linux",' % v for v in vendors_to_add]=
)
=20
-    check +=3D '\\nbool IsOpenEmbedded() const { return ' + ' || '.join(=
oe_names) + '; }'
+    names =3D []
+    checks =3D []
+    cases =3D []
+    triples =3D []
+    oe_checks =3D []
+    for distro in (d.getVar('CLANG_EXTRA_OE_DISTRO') or "").split():
+        distro_id, distro_triple =3D distro.split(":")
+        # the ID doubles as a C++ enumerator name
+        enum =3D distro_id.replace('-', '_').upper()
+        names.append(enum + ",")
+        checks.append("bool Is%s() const { return DistroVal =3D=3D %s; }=
" % (enum, enum))
+        cases.append('.Case("%s", Distro::%s)' % (distro_id, enum))
+        triples.append('if (Distro.Is%s()) return "x86_64-%s-linux";' % =
(enum, distro_triple))
+        oe_checks.append("DistroVal =3D=3D " + enum)
+    checks.append("bool IsOpenEmbedded() const { return %s; }" % (" || "=
.join(oe_checks) or "false"))
=20
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' % name, =
source + '/clang/include/clang/Driver/Distro.h']
-    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' % check=
, source + '/clang/include/clang/Driver/Distro.h']
-    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_TRIPLE#%s#g' % trip=
le, source + '/clang/lib/Driver/ToolChains/Linux.cpp']
-    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CASE#%s#g' % case, =
source + '/clang/lib/Driver/Distro.cpp']
-    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
+    clang_oe_generate(source + '/clang/include/clang/Driver/Distro.h', '=
CLANG_EXTRA_OE_DISTRO_NAME', names)
+    clang_oe_generate(source + '/clang/include/clang/Driver/Distro.h', '=
CLANG_EXTRA_OE_DISTRO_CHECK', checks)
+    clang_oe_generate(source + '/clang/lib/Driver/Distro.cpp', 'CLANG_EX=
TRA_OE_DISTRO_CASE', cases)
+    clang_oe_generate(source + '/clang/lib/Driver/ToolChains/Linux.cpp',=
 'CLANG_EXTRA_OE_DISTRO_TRIPLE', triples)
 }
=20
 do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANTS"
--=20
2.43.0


Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285CEC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 16:44:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.352.1692981850840886421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 09:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C61CD1007;
	Fri, 25 Aug 2023 09:44:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 098263F64C;
	Fri, 25 Aug 2023 09:44:09 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 3/3] linux/cve-exclusion: remove obsolete manual entries
Date: Fri, 25 Aug 2023 17:44:03 +0100
Message-Id: <20230825164403.2145624-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825164403.2145624-1-ross.burton@arm.com>
References: <20230825164403.2145624-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 16:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186718

From: Ross Burton <ross.burton@arm.com>

The generated file covers all but one of these CVEs (which will be fixed
when [1] is resolved) so remove the redundant entries.

[1] https://github.com/nluedtke/linux_kernel_cves/issues/344

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 869 --------------------
 1 file changed, 869 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 45b7a3dffeb..c34928e1002 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -1,875 +1,6 @@
-# Kernel CVE exclusion file
-
-# https://nvd.nist.gov/vuln/detail/CVE-2021-3759
-# Patched in kernel since v5.15 18319498fdd4cdf8c1c2c48cd432863b1f915d6f
-# Backported in version v5.4.224 bad83d55134e647a739ebef2082541963f2cbc9=
2
-# Backported in version v5.10.154 836686e1a01d7e2fda6a5a18252243ff30a6e1=
96
-CVE_CHECK_IGNORE +=3D "CVE-2021-3759"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2021-4135
-# Patched in kernel since v5.16 481221775d53d6215a6e5e9ce1cce6d2b4ab9a46
-# Backported in version v5.4.168 699e794c12a3cd79045ff135bc87a53b97024e4=
3
-# Backported in version v5.10.88 1a34fb9e2bf3029f7c0882069d67ff69cbd645d=
8
-# Backported in version v5.15.11 27358aa81a7d60e6bd36f0bb1db65cd084c2cad=
0
-CVE_CHECK_IGNORE +=3D "CVE-2021-4135"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2021-4155
-# Patched in kernel since v5.16 983d8e60f50806f90534cc5373d0ce867e5aaf79
-# Backported in version v5.4.171 102af6edfd3a372db6e229177762a91f552e5f5=
e
-# Backported in version v5.10.91 16d8568378f9ee2d1e69216d39961aa72710209=
f
-# Backported in version v5.15.14 b0e72ba9e520b95346e68800afff0db65e766ca=
8
-CVE_CHECK_IGNORE +=3D "CVE-2021-4155"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-0168
-# Patched in kernel since v5.18 b92e358757b91c2827af112cae9af513f26a3f34
-# Backported in version v5.10.110 9963ccea6087268e1275b992dca5d0dd4b9387=
65
-# Backported in version v5.15.33 f143f8334fb9eb2f6c7c15b9da1472d9c965fd8=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-0168"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-0171
-# Patched in kernel since v5.18 683412ccf61294d727ead4a73d97397396e69a6b
-# Backported in version v5.10.146 a60babeb60ff276963d4756c7fd2e7bf242bb7=
77
-# Backported in version v5.15.70 39b0235284c7aa33a64e07b825add7a2c108094=
a
-CVE_CHECK_IGNORE +=3D "CVE-2022-0171"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1016
-# Patched in kernel since v5.18 4c905f6740a365464e91467aa50916555b28213d
-# Backported in version v5.4.188 06f0ff82c70241a766a811ae1acf07d6e2734dc=
b
-# Backported in version v5.10.109 2c74374c2e88c7b7992bf808d9f9391f7452f9=
d9
-# Backported in version v5.15.32 fafb904156fbb8f1dd34970cd5223e00b47c33b=
e
-CVE_CHECK_IGNORE +=3D "CVE-2022-1016"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1184
-# Patched in kernel since v6.1 61a1d87a324ad5e3ed27c6699dfc93218fcf3201
-# Backported in version v5.10.150 483831ad0440f62c10d1707c97ce824bd82d98=
ae
-# Backported in version v5.15.75 dd366295d1eca557e7a9000407ec3952f691d27=
b
-# Backported in version v5.19.17 edb71f055684f9023fd97e2f85c6f31380d163c=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-1184"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1198
-# Patched in kernel since v5.17 efe4186e6a1b54bf38b9e05450d43b0da1fd7739
-# Backported in version v5.4.189 28c8fd84bea13cbf238d7b19d392de2fcc31331=
c
-# Backported in version v5.10.110 f67a1400788f550d201c71aeaf56706afe57f0=
da
-# Backported in version v5.15.33 3eb18f8a1d02a9462a0e4903efc674ca3d0406d=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-1198"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1199
-# Patched in kernel since v5.17 71171ac8eb34ce7fe6b3267dce27c313ab3cb3ac
-# Backported in version v5.4.185 0a64aea5fe023cf1e4973676b11f49038b1f045=
b
-# Backported in version v5.10.106 e2201ef32f933944ee02e59205adb566bafcdf=
91
-# Backported in version v5.15.29 46ad629e58ce3a88c924ff3c5a7e9129b0df565=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-1199"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1462
-# Patched in kernel since v5.19 a501ab75e7624d133a5a3c7ec010687c8b961d23
-# Backported in version v5.4.208 f7785092cb7f022f59ebdaa181651f7c877df13=
2
-# Backported in version v5.10.134 08afa87f58d83dfe040572ed591b47e8cb9e22=
5c
-# Backported in version v5.15.58 b2d1e4cd558cffec6bfe318f5d74e6cffc374d2=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-1462"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1734
-# Patched in kernel since v5.18 d270453a0d9ec10bb8a802a142fb1b3601a83098
-# Backported in version v5.4.193 33d3e76fc7a7037f402246c824d750542e2eb37=
f
-# Backported in version v5.10.115 1961c5a688edb53fe3bc25cbda57f47adf1256=
3c
-# Backported in version v5.15.39 b8f2b836e7d0a553b886654e8b3925a85862d2e=
b
-CVE_CHECK_IGNORE +=3D "CVE-2022-1734"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1852
-# Patched in kernel since v5.19 fee060cd52d69c114b62d1a2948ea9648b5131f9
-# Backported in version v5.10.120 3d8fc6e28f321d753ab727e3c3e740daf36a8f=
a3
-# Backported in version v5.15.45 531d1070d864c78283b7597449e60ddc53319d8=
8
-CVE_CHECK_IGNORE +=3D "CVE-2022-1852"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1882
-# Patched in kernel since v5.19 353f7988dd8413c47718f7ca79c030b6fb62cfe5
-# Backported in version v5.10.134 0adf21eec59040b31af113e626efd85eb153c7=
28
-# Backported in version v5.15.58 ba3a8af8a21a81cfd0c8c689a81261caba934f9=
7
-CVE_CHECK_IGNORE +=3D "CVE-2022-1882"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-1998
-# Patched in kernel since v5.17 ee12595147ac1fbfb5bcb23837e26dd58d94b15d
-# Backported in version v5.10.97 7b4741644cf718c422187e74fb07661ef1d68e8=
5
-# Backported in version v5.15.20 60765e43e40fbf7a1df828116172440510fcc3e=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-1998"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2078
-# Patched in kernel since v5.19 fecf31ee395b0295f2d7260aa29946b7605f7c85
-# Backported in version v5.10.120 c0aff1faf66b6b7a19103f83e6a5d0fdc64b90=
48
-# Backported in version v5.15.45 89ef50fe03a55feccf5681c237673a2f9816116=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-2078"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2196
-# Patched in kernel since v6.2 2e7eab81425ad6c875f2ed47c0ce01e78afc38a5
-# Backported in version v5.4.233 f93a1a5bdcdd122aae0a3eab7a52c15b71fb725=
b
-# Backported in version v5.10.170 1b0cafaae8884726c597caded50af185ffc133=
49
-# Backported in version v5.15.96 6b539a7dbb49250f92515c2ba60aea239efc9e3=
5
-# Backported in version v6.1.14 63fada296062e91ad9f871970d4e7f19e21a6a15
-CVE_CHECK_IGNORE +=3D "CVE-2022-2196"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2318
-# Patched in kernel since v5.19 9cc02ede696272c5271a401e4f27c262359bc2f6
-# Backported in version v5.4.204 bb91556d2af066f8ca2e7fd8e334d652e731ee2=
9
-# Backported in version v5.10.129 8f74cb27c2b4872fd14bf046201fa7b36a4688=
5e
-# Backported in version v5.15.53 659d39545260100628d8a30020d09fb6bf63b91=
5
-CVE_CHECK_IGNORE +=3D "CVE-2022-2318"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2380
-# Patched in kernel since v5.18 bd771cf5c4254511cc4abb88f3dab3bd58bdf8e8
-# Backported in version v5.4.189 478154be3a8c21ff106310bb1037b1fc9d81dc6=
2
-# Backported in version v5.10.110 72af8810922eb143ed4f116db246789ead2d85=
43
-# Backported in version v5.15.33 46cdbff26c88fd75dccbf28df1d07cbe18007ea=
c
-CVE_CHECK_IGNORE +=3D "CVE-2022-2380"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2503
-# Patched in kernel since v5.19 4caae58406f8ceb741603eee460d79bacca9b1b5
-# Backported in version v5.4.197 fd2f7e9984850a0162bfb6948b98ffac9fb5fa5=
8
-# Backported in version v5.10.120 8df42bcd364cc3b41105215d841792aea787b1=
33
-# Backported in version v5.15.45 69712b170237ec5979f168149cd31e851a46585=
3
-CVE_CHECK_IGNORE +=3D "CVE-2022-2503"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2663
-# Patched in kernel since v6.0 e8d5dfd1d8747b56077d02664a8838c71ced948e
-# Backported in version v5.4.215 d0a24bc8e2aa703030d80affa3e5237fe3ad4dd=
2
-# Backported in version v5.10.146 9a5d7e0acb41bb2aac552f8eeb4b404177f3f6=
6d
-# Backported in version v5.15.71 dc33ffbc361e2579a8f31b8724ef85d4117440e=
4
-# Backported in version v5.19.12 510ea9eae5ee45f4e443023556532bda9938735=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-2663"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2873
-# Patched in kernel since v6.2 39244cc754829bf707dccd12e2ce37510f5b1f8d
-# Backported in version v5.4.229 cdcbae2c5003747ddfd14e29db9c1d5d7e7c44d=
d
-# Backported in version v5.10.163 9ac541a0898e8ec187a3fa7024b9701cffae6b=
f2
-# Backported in version v5.15.86 96c12fd0ec74641295e1c3c34dea3dce1b6c342=
2
-# Backported in version v6.1.2 233348a04becf133283f0076e20b317302de21d9
-CVE_CHECK_IGNORE +=3D "CVE-2022-2873"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2905
-# Patched in kernel since v6.0 a657182a5c5150cdfacb6640aad1d2712571a409
-# Backported in version v5.10.140 e8979807178434db8ceaa84dfcd44363e71e50=
bb
-# Backported in version v5.15.64 4f672112f8665102a5842c170be1713f8ff9591=
9
-# Backported in version v5.19.6 a36df92c7ff7ecde2fb362241d0ab024dddd0597
-CVE_CHECK_IGNORE +=3D "CVE-2022-2905"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-2959
-# Patched in kernel since v5.19 189b0ddc245139af81198d1a3637cac74f96e13a
-# Backported in version v5.10.120 8fbd54ab06c955d247c1a91d5d980cddc868f1=
e7
-# Backported in version v5.15.45 cf2fbc56c478a34a68ff1fa6ad08460054dfd49=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-2959"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3028
-# Patched in kernel since v6.0 ba953a9d89a00c078b85f4b190bc1dde66fe16b5
-# Backported in version v5.4.212 8ee27a4f0f1ad36d430221842767880df649414=
7
-# Backported in version v5.10.140 c5c4d4c9806dadac7bc82f9c29ef4e1b788947=
75
-# Backported in version v5.15.64 103bd319c0fc90f1cb013c3a508615e6df8af82=
3
-# Backported in version v5.19.6 6901885656c029c976498290b52f67f2c251e6a0
-CVE_CHECK_IGNORE +=3D "CVE-2022-3028"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3078
-# Patched in kernel since v5.18 e6a21a14106d9718aa4f8e115b1e474888eeba44
-# Backported in version v5.10.110 663e7a72871f89f7a10cc8d7b2f17f27c64e07=
1d
-# Backported in version v5.15.33 9dd2fd7a1f84c947561af29424c5ddcecfcf2cb=
e
-CVE_CHECK_IGNORE +=3D "CVE-2022-3078"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3104
-# Patched in kernel since v5.19 4a9800c81d2f34afb66b4b42e0330ae8298019a2
-# Backported in version v5.10.122 56ac04f35fc5dc8b5b67a1fa2f7204282aa887=
d5
-# Backported in version v5.15.47 1aeeca2b8397e3805c16a4ff26bf3cc8485f985=
3
-CVE_CHECK_IGNORE +=3D "CVE-2022-3104"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3105
-# Patched in kernel since v5.16 7694a7de22c53a312ea98960fcafc6ec62046531
-# Backported in version v5.4.171 7646a340b25bb68cfb6d2e087a608802346d0f7=
b
-# Backported in version v5.10.91 16e5cad6eca1e506c38c39dc256298643fa1852=
a
-# Backported in version v5.15.14 0ea8bb0811ba0ec22903cbb48ff2cd872382e8d=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-3105"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3106
-# Patched in kernel since v5.16 407ecd1bd726f240123f704620d46e285ff30dd9
-# Backported in version v5.10.88 734a3f3106053ee41cecae2a995b3d4d0c24676=
4
-# Backported in version v5.15.11 9a77c02d1d2147a76bd187af1bf5a34242662d1=
2
-CVE_CHECK_IGNORE +=3D "CVE-2022-3106"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3107
-# Patched in kernel since v5.17 886e44c9298a6b428ae046e2fa092ca52e822e6a
-# Backported in version v5.4.187 b01e2df5fbf68719dfb8e766c1ca6089234144c=
2
-# Backported in version v5.10.108 9b763ceda6f8963cc99df5772540c54ba46ba3=
7c
-# Backported in version v5.15.31 ab0ab176183191cffc69fe9dd8ac6c8db23f60d=
3
-CVE_CHECK_IGNORE +=3D "CVE-2022-3107"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3111
-# Patched in kernel since v5.18 6dee930f6f6776d1e5a7edf542c6863b47d9f078
-# Backported in version v5.4.189 90bec38f6a4c81814775c7f3dfc9acf281d5dcf=
a
-# Backported in version v5.10.110 48d23ef90116c8c702bfa4cad93744e4e5588d=
7d
-# Backported in version v5.15.33 4124966fbd95eeecca26d52433f393e2b9649a3=
3
-CVE_CHECK_IGNORE +=3D "CVE-2022-3111"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3112
-# Patched in kernel since v5.18 c8c80c996182239ff9b05eda4db50184cf3b2e99
-# Backported in version v5.10.110 032b141a91a82a5f0107ce664a35b201e60c5c=
e1
-# Backported in version v5.15.33 b0b890dd8df3b9a2fe726826980b1cffe17b967=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-3112"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3113
-# Patched in kernel since v5.18 e25a89f743b18c029bfbe5e1663ae0c7190912b0
-# Backported in version v5.10.110 bc2573abc691a269b54a6c14a2660f26d88876=
a5
-# Backported in version v5.15.33 0022dc8cafa5fcd156da8ae7bfc9ca99497bdff=
c
-CVE_CHECK_IGNORE +=3D "CVE-2022-3113"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3115
-# Patched in kernel since v5.19 73c3ed7495c67b8fbdc31cf58e6ca8757df31a33
-# Backported in version v5.4.198 fa0d7ba25a53ac2e4bb24ef31aec49ff3578b44=
f
-# Backported in version v5.10.121 b4c7dd0037e6aeecad9b947b30f0d9eaeda117=
62
-# Backported in version v5.15.46 4cb37f715f601cee5b026c6f9091a466266b5ba=
5
-CVE_CHECK_IGNORE +=3D "CVE-2022-3115"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3202
-# Patched in kernel since v5.18 a53046291020ec41e09181396c1e829287b48d47
-# Backported in version v5.4.189 e19c3149a80e4fc8df298d6546640e01601f375=
8
-# Backported in version v5.10.111 b9c5ac0a15f24d63b20f899072fa6dd8c93af1=
36
-# Backported in version v5.15.34 d925b7e78b62805fcc5440d1521181c82b6f03c=
b
-CVE_CHECK_IGNORE +=3D "CVE-2022-3202"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3303
-# Patched in kernel since v6.0 8423f0b6d513b259fdab9c9bf4aaa6188d054c2d
-# Backported in version v5.4.215 4051324a6dafd7053c74c475e80b3ba10ae672b=
0
-# Backported in version v5.10.148 fce793a056c604b41a298317cf704dae255f1b=
36
-# Backported in version v5.15.68 8015ef9e8a0ee5cecfd0cb6805834d007ab26f8=
6
-# Backported in version v5.19.9 723ac5ab2891b6c10dd6cc78ef5456af593490eb
-CVE_CHECK_IGNORE +=3D "CVE-2022-3303"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3424
-# Patched in kernel since v6.2 643a16a0eb1d6ac23744bb6e90a00fc21148a9dc
-# Backported in version v5.4.229 0078dd8758561540ed30b2c5daa1cb647e75897=
7
-# Backported in version v5.10.163 0f67ed565f20ea2fdd98e3b0b0169d9e580bb8=
3c
-# Backported in version v5.15.86 d5c8f9003a289ee2a9b564d109e021fc4d05d10=
6
-# Backported in version v6.1.2 4e947fc71bec7c7da791f8562d5da233b235ba5e
-CVE_CHECK_IGNORE +=3D "CVE-2022-3424"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3435
-# Patched in kernel since v6.1 61b91eb33a69c3be11b259c5ea484505cd79f883
-# Backported in version v5.4.226 cc3cd130ecfb8b0ae52e235e487bae3f16a24a3=
2
-# Backported in version v5.10.158 0b5394229ebae09afc07aabccb5ffd705ffd25=
0e
-# Backported in version v5.15.82 25174d91e4a32a24204060d283bd5fa6d0ddf13=
3
-CVE_CHECK_IGNORE +=3D "CVE-2022-3435"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3521
-# Patched in kernel since v6.1 ec7eede369fe5b0d085ac51fdbb95184f87bfc6c
-# Backported in version v5.4.225 ad39d09190a545d0f05ae0a82900eee96c5face=
a
-# Backported in version v5.10.156 7deb7a9d33e4941c5ff190108146d3a56bf69e=
9d
-# Backported in version v5.15.80 27d706b0d394a907ff8c4f83ffef9d3e5817fa8=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-3521"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3545
-# Patched in kernel since v6.0 02e1a114fdb71e59ee6770294166c30d437bf86a
-# Backported in version v5.4.228 3c837460f920a63165961d2b88b425703f59aff=
b
-# Backported in version v5.10.160 eb6313c12955c58c3d3d40f086c22e44ca1c9a=
1b
-# Backported in version v5.15.84 9d933af8fef33c32799b9f2d3ff6bf58a63d7f2=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-3545"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3564
-# Patched in kernel since v6.1 3aff8aaca4e36dc8b17eaa011684881a80238966
-# Backported in version v5.4.224 4cd094fd5d872862ca278e15b9b51b07e915ef3=
f
-# Backported in version v5.10.154 cb1c012099ef5904cd468bdb8d6fcdfdd9bcb5=
69
-# Backported in version v5.15.78 8278a87bb1eeea94350d675ef961ee5a03341fd=
e
-CVE_CHECK_IGNORE +=3D "CVE-2022-3564"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3586
-# Patched in kernel since v6.0 9efd23297cca530bb35e1848665805d3fcdd7889
-# Backported in version v5.4.213 279c7668e354fa151d5fd2e8c42b5153a1de313=
5
-# Backported in version v5.10.143 2ee85ac1b29dbd2ebd2d8e5ac1dd5793235d51=
6b
-# Backported in version v5.15.68 1a889da60afc017050e1f517b3b976b46284666=
8
-# Backported in version v5.19.9 8f796f36f5ba839c11eb4685150ebeed496c546f
-CVE_CHECK_IGNORE +=3D "CVE-2022-3586"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3594
-# Patched in kernel since v6.1 93e2be344a7db169b7119de21ac1bf253b8c6907
-# Backported in version v5.4.220 61fd56b0a1a3e923aced4455071177778dd59e8=
8
-# Backported in version v5.10.150 484400d433ca1903a87268c55f019e93229753=
8a
-# Backported in version v5.15.75 b3179865cf7e892b26eedab3d6c54b4747c774a=
2
-# Backported in version v5.19.17 2e896abccf99fef76691d8e1019bd44105a12e1=
f
-CVE_CHECK_IGNORE +=3D "CVE-2022-3594"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3621
-# Patched in kernel since v6.1 21a87d88c2253350e115029f14fe2a10a7e6c856
-# Backported in version v5.4.218 792211333ad77fcea50a44bb7f695783159fc63=
c
-# Backported in version v5.10.148 3f840480e31495ce674db4a69912882b5ac083=
f2
-# Backported in version v5.15.74 1e512c65b4adcdbdf7aead052f2162b079cc7f5=
5
-# Backported in version v5.19.16 caf2c6b580433b3d3e413a3d54b8414a94725dc=
d
-CVE_CHECK_IGNORE +=3D "CVE-2022-3621"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3623
-# Patched in kernel since v6.1 fac35ba763ed07ba93154c95ffc0c4a55023707f
-# Backported in version v5.4.228 176ba4c19d1bb153aa6baaa61d586e785b7d736=
c
-# Backported in version v5.10.159 fccee93eb20d72f5390432ecea7f8c16af88c8=
50
-# Backported in version v5.15.78 3a44ae4afaa5318baed3c6e2959f24454e0ae4f=
f
-# Backported in version v5.19.17 86a913d55c89dd13ba070a87f61a493563e94b5=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-3623"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3629
-# Patched in kernel since v6.0 7e97cfed9929eaabc41829c395eb0d1350fccb9d
-# Backported in version v5.4.211 f82f1e2042b397277cd39f16349950f5abade58=
d
-# Backported in version v5.10.138 38ddccbda5e8b762c8ee06670bb1f64f1be5ee=
50
-# Backported in version v5.15.63 e4c0428f8a6fc8c218d7fd72bddd163f05b2979=
5
-# Backported in version v5.19.4 8ff5db3c1b3d6797eda5cd326dcd31b9cd1c5f72
-CVE_CHECK_IGNORE +=3D "CVE-2022-3629"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3633
-# Patched in kernel since v6.0 8c21c54a53ab21842f5050fa090f26b03c0313d6
-# Backported in version v5.4.211 04e41b6bacf474f5431491f92e981096e8cc8e9=
3
-# Backported in version v5.10.138 a220ff343396bae8d3b6abee72ab51f1f34b30=
27
-# Backported in version v5.15.63 98dc8fb08299ab49e0b9c08daedadd2f4de1a2f=
2
-# Backported in version v5.19.4 a0278dbeaaf7ca60346c62a9add65ae7d62564de
-CVE_CHECK_IGNORE +=3D "CVE-2022-3633"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3635
-# Patched in kernel since v6.0 3f4093e2bf4673f218c0bf17d8362337c400e77b
-# Backported in version v5.4.211 9a6cbaa50f263b12df18a051b37f3f42f9fb525=
3
-# Backported in version v5.10.138 a0ae122e9aeccbff75014c4d36d11a9d32e7fb=
5e
-# Backported in version v5.15.63 a5d7ce086fe942c5ab422fd2c034968a152be4c=
4
-# Backported in version v5.19.4 af412b252550f9ac36d9add7b013c2a2c3463835
-CVE_CHECK_IGNORE +=3D "CVE-2022-3635"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3646
-# Patched in kernel since v6.1 d0d51a97063db4704a5ef6bc978dddab1636a306
-# Backported in version v5.4.218 b7e409d11db9ce9f8bc05fcdfa24d143f60cd39=
3
-# Backported in version v5.10.148 aad4c997857f1d4b6c1e296c07e4729d3f8058=
ee
-# Backported in version v5.15.74 44b1ee304bac03f1b879be5afe920e3a844e40f=
c
-# Backported in version v5.19.16 4755fcd844240857b525f6e8d8b65ee140fe957=
0
-CVE_CHECK_IGNORE +=3D "CVE-2022-3646"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3649
-# Patched in kernel since v6.1 d325dc6eb763c10f591c239550b8c7e5466a5d09
-# Backported in version v5.4.220 d1c2d820a2cd73867b7d352e89e92fb3ac29e92=
6
-# Backported in version v5.10.148 21ee3cffed8fbabb669435facfd576ba18ac86=
52
-# Backported in version v5.15.74 cb602c2b654e26763226d8bd27a702f79cff400=
6
-# Backported in version v5.19.16 394b2571e9a74ddaed55aa9c4d0f5772f81c21e=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-3649"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3707
-# Patched in kernel since v6.2 4a61648af68f5ba4884f0e3b494ee1cabc4b6620
-# Backported in version v5.4.233 787ef0db014085df8691e5aeb58ab0bb081e5ff=
0
-# Backported in version v5.10.170 3d743415c6fb092167df6c23e9c7e9f6df7db6=
25
-# Backported in version v5.15.96 0d3d5099a50badadad6837edda00e42149b2f65=
7
-# Backported in version v6.1.5 1022519da69d99d455c58ca181a6c499c562c70e
-CVE_CHECK_IGNORE +=3D "CVE-2022-3707"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-4095
-# Patched in kernel since v6.0 e230a4455ac3e9b112f0367d1b8e255e141afae0
-# Backported in version v5.4.213 d0aac7146e96bf39e79c65087d21dfa02ef8db3=
8
-# Backported in version v5.10.142 19e3f69d19801940abc2ac37c169882769ed97=
70
-# Backported in version v5.15.66 dc02aaf950015850e7589696521c7fca767cea7=
7
-# Backported in version v5.19.8 b1727def850904e4b8ba384043775672841663a1
-CVE_CHECK_IGNORE +=3D "CVE-2022-4095"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-4139
-# Patched in kernel since v6.1 04aa64375f48a5d430b5550d9271f8428883e550
-# Backported in version v5.4.226 3659e33c1e4f8cfc62c6c15aca5d797010c277a=
4
-# Backported in version v5.10.157 86f0082fb9470904b15546726417f28077088f=
ee
-# Backported in version v5.15.81 ee2d04f23bbb16208045c3de545c6127aaa1ed0=
e
-CVE_CHECK_IGNORE +=3D "CVE-2022-4139"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-4382
-# Patched in kernel since v6.2 d18dcfe9860e842f394e37ba01ca9440ab2178f4
-# Backported in version v5.4.230 9a39f4626b361ee7aa10fd990401c37ec3b466a=
e
-# Backported in version v5.10.165 856e4b5e53f21edbd15d275dde62228dd94fb2=
b4
-# Backported in version v5.15.90 a2e075f40122d8daf587db126c562a67abd69cf=
9
-# Backported in version v6.1.8 616fd34d017000ecf9097368b13d8a266f4920b3
-CVE_CHECK_IGNORE +=3D "CVE-2022-4382"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-4662
-# Patched in kernel since v6.0 9c6d778800b921bde3bff3cff5003d1650f942d1
-# Backported in version v5.4.213 df1875084898b15cbc42f712e93d7f113ae6271=
b
-# Backported in version v5.10.142 abe3cfb7a7c8e907b312c7dbd7bf4d142b745a=
a8
-# Backported in version v5.15.66 c548b99e1c37db6f7df86ecfe9a1f895d6c5966=
e
-# Backported in version v5.19.8 d5eb850b3e8836197a38475840725260b9783e94
-CVE_CHECK_IGNORE +=3D "CVE-2022-4662"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-26365
-# Patched in kernel since v5.19 2f446ffe9d737e9a844b97887919c4fda18246e7
-# Backported in version v5.4.204 42112e8f94617d83943f8f3b8de2b6604190550=
6
-# Backported in version v5.10.129 cfea428030be836d79a7690968232bb7fa4410=
f1
-# Backported in version v5.15.53 7ed65a4ad8fa9f40bc3979b32c54243d6a684ec=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-26365"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-32250
-# Patched in kernel since v5.19 520778042ccca019f3ffa136dd0ca565c486cedd
-# Backported in version v5.4.198 f36736fbd48491a8d85cd22f4740d542c5a1546=
e
-# Backported in version v5.10.120 ea62d169b6e731e0b54abda1d692406f6bc6a6=
96
-# Backported in version v5.15.45 f692bcffd1f2ce5488d24fbcb8eab5f351abf79=
d
-CVE_CHECK_IGNORE +=3D "CVE-2022-32250"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-32296
-# Patched in kernel since v5.18 4c2c8f03a5ab7cb04ec64724d7d176d00bcc91e5
-# Backported in version v5.4.201 c26e1addf15763ae404f4bbf131719a724e768a=
b
-# Backported in version v5.10.125 9429b75bc271b6f29e50dbb0ee0751800ff87d=
d9
-# Backported in version v5.15.41 952a238d779eea4ecb2f8deb5004c8f56be79bc=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-32296"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-32981
-# Patched in kernel since v5.19 8e1278444446fc97778a5e5c99bca1ce0bbc5ec9
-# Backported in version v5.4.198 0c4bc0a2f8257f79a70fe02b9a698eb14695a64=
b
-# Backported in version v5.10.122 3be74fc0afbeadc2aff8dc69f3bf9716fbe664=
86
-# Backported in version v5.15.47 2a0165d278973e30f2282c15c52d91788749d2d=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-32981"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33740
-# Patched in kernel since v5.19 307c8de2b02344805ebead3440d8feed28f2f010
-# Backported in version v5.4.204 04945b5beb73019145ac17a2565526afa7293c1=
4
-# Backported in version v5.10.129 728d68bfe68d92eae1407b8a9edc7817d62274=
04
-# Backported in version v5.15.53 5dd0993c36832d33820238fc8dc741ba801b796=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-33740"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33741
-# Patched in kernel since v5.19 4491001c2e0fa69efbb748c96ec96b100a5cdb7e
-# Backported in version v5.4.204 ede57be88a5fff42cd00e6bcd071503194d398d=
d
-# Backported in version v5.10.129 4923217af5742a796821272ee03f8d6de15c0c=
ca
-# Backported in version v5.15.53 ed3cfc690675d852c3416aedb271e0e7d179bf4=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-33741"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33742
-# Patched in kernel since v5.19 2400617da7eebf9167d71a46122828bc479d64c9
-# Backported in version v5.4.204 60ac50daad36ef3fe9d70d89cfe3b95d381db99=
7
-# Backported in version v5.10.129 cbbd2d2531539212ff090aecbea9877c996e6c=
e6
-# Backported in version v5.15.53 6d0a9127279a4533815202e30ad1b3a39f560ba=
3
-CVE_CHECK_IGNORE +=3D "CVE-2022-33742"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33743
-# Patched in kernel since v5.19 f63c2c2032c2e3caad9add3b82cc6e91c376fd26
-# Backported in version v5.10.129 547b7c640df545a344358ede93e491a89194cd=
fa
-# Backported in version v5.15.53 1052fc2b7391a43b25168ae69ad658fff5170f0=
4
-CVE_CHECK_IGNORE +=3D "CVE-2022-33743"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33744
-# Patched in kernel since v5.19 b75cd218274e01d026dc5240e86fdeb44bbed0c8
-# Backported in version v5.4.204 5c03cad51b84fb26ccea7fd99130d8ec47949cf=
c
-# Backported in version v5.10.129 43c8d33ce353091f15312cb6de3531517d7bba=
90
-# Backported in version v5.15.53 9f83c8f6ab14bbf4311b70bf1b7290d13105910=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-33744"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-33981
-# Patched in kernel since v5.18 233087ca063686964a53c829d547c7571e3f67bf
-# Backported in version v5.4.192 7dea5913000c6a2974a00d9af8e7ffb54e47eac=
1
-# Backported in version v5.10.114 54c028cfc49624bfc27a571b94edecc79bbaaa=
b4
-# Backported in version v5.15.37 e52da8e4632f9c8fe78bf1c5881ce6871c7e08f=
3
-CVE_CHECK_IGNORE +=3D "CVE-2022-33981"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-34918
-# Patched in kernel since v5.19 7e6bc1f6cabcd30aba0b11219d8e01b952eacbb6
-# Backported in version v5.10.130 0a5e36dbcb448a7a8ba63d1d4b6ade2c9d3cc8=
bf
-# Backported in version v5.15.54 c1784d2075138992b00c17ab4ffc6d855171fe6=
d
-CVE_CHECK_IGNORE +=3D "CVE-2022-34918"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-36123
-# Patched in kernel since v5.19 38fa5479b41376dc9d7f57e71c83514285a25ca0
-# Backported in version v5.4.207 a3c7c1a726a4c6b63b85e8c183f207543fd75e1=
b
-# Backported in version v5.10.132 136d7987fcfdeca73ee3c6a29e48f99fdd0f4d=
87
-# Backported in version v5.15.56 26bb7afc027ce6ac8ab6747babec674d55689ff=
0
-CVE_CHECK_IGNORE +=3D "CVE-2022-36123"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-36879
-# Patched in kernel since v5.19 f85daf0e725358be78dfd208dea5fd665d8cb901
-# Backported in version v5.4.208 f4248bdb7d5c1150a2a6f8c3d3b6da0b71f62a2=
0
-# Backported in version v5.10.134 47b696dd654450cdec3103a833e5bf29c4b83b=
fa
-# Backported in version v5.15.58 c8e32bca0676ac663266a3b16562cb017300adc=
d
-CVE_CHECK_IGNORE +=3D "CVE-2022-36879"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-36946
-# Patched in kernel since v5.19 99a63d36cb3ed5ca3aa6fcb64cffbeaf3b0fb164
-# Backported in version v5.4.209 52be29e8b6455788a4d0f501bd87aa679ca3ba3=
c
-# Backported in version v5.10.135 440dccd80f627e0e11ceb0429e4cdab61857d1=
7e
-# Backported in version v5.15.59 91c11008aab0282957b8b8ccb0707d90e74cc3b=
9
-CVE_CHECK_IGNORE +=3D "CVE-2022-36946"
-
 # https://nvd.nist.gov/vuln/detail/CVE-2022-39188
 # Patched in kernel since v5.19 b67fbebd4cf980aecbcc750e1462128bffe8ae15
 # Backported in version v5.4.212 c9c5501e815132530d741ec9fdd22657f91656b=
c
 # Backported in version v5.10.141 895428ee124ad70b9763259308354877b725c3=
1d
 # Backported in version v5.15.65 3ffb97fce282df03723995f5eed6a559d008078=
e
 CVE_CHECK_IGNORE +=3D "CVE-2022-39188"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-39190
-# Patched in kernel since v6.0 e02f0d3970404bfea385b6edb86f2d936db0ea2b
-# Backported in version v5.10.140 c08a104a8bce832f6e7a4e8d9ac091777b9982=
ea
-# Backported in version v5.15.64 51f192ae71c3431aa69a988449ee2fd288e5764=
8
-# Backported in version v5.19.6 fdca693fcf26c11596e7aa1e540af2b4a5288c76
-CVE_CHECK_IGNORE +=3D "CVE-2022-39190"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-39842
-# Patched in kernel since v5.19 a09d2d00af53b43c6f11e6ab3cb58443c2cac8a7
-# Backported in version v5.4.215 1878eaf0edb8c9e58a6ca0cf31b7a647ca346be=
9
-# Backported in version v5.10.145 06e194e1130c98f82d46beb40cdbc88a0d4fd6=
de
-# Backported in version v5.15.70 ab5140c6ddd7473509e12f468948de91138b124=
e
-CVE_CHECK_IGNORE +=3D "CVE-2022-39842"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-40307
-# Patched in kernel since v6.0 9cb636b5f6a8cc6d1b50809ec8f8d33ae0c84c95
-# Backported in version v5.4.213 8028ff4cdbb3f20d3c1c04be33a83bab0cb9499=
7
-# Backported in version v5.10.143 918d9c4a4bdf5205f2fb3f64dddfb56c9a1d01=
d6
-# Backported in version v5.15.68 dd291e070be0eca8807476b022bda00c891d906=
6
-# Backported in version v5.19.9 d46815a8f26ca6db2336106a148265239f73b0af
-CVE_CHECK_IGNORE +=3D "CVE-2022-40307"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-40768
-# Patched in kernel since v6.1 6022f210461fef67e6e676fd8544ca02d1bcfa7a
-# Backported in version v5.4.218 20a5bde605979af270f94b9151f753ec2caf8b0=
5
-# Backported in version v5.10.148 36b33c63515a93246487691046d18dd37a9f58=
9b
-# Backported in version v5.15.74 76efb4897bc38b2f16176bae27ae801037ebf49=
a
-# Backported in version v5.19.16 6ae8aa5dcf0d7ada07964c8638e55d3af5896a8=
6
-CVE_CHECK_IGNORE +=3D "CVE-2022-40768"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-41218
-# Patched in kernel since v6.2 fd3d91ab1c6ab0628fe642dd570b56302c30a792
-# Backported in version v5.4.229 a29d6213098816ed4574824b6adae94fb1c0457=
d
-# Backported in version v5.10.163 3df07728abde249e2d3f47cf22f134cb4d4f5f=
b1
-# Backported in version v5.15.87 8b45a3b19a2e909e830d09a90a7e1ec8601927d=
9
-# Backported in version v6.1.4 530ca64b44625f7d39eb1d5efb6f9ff21da991e2
-CVE_CHECK_IGNORE +=3D "CVE-2022-41218"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-41849
-# Patched in kernel since v6.1 5610bcfe8693c02e2e4c8b31427f1bdbdecc839c
-# Backported in version v5.4.220 3742e9fd552e6c4193ebc5eb3d2cd02d429cad9=
c
-# Backported in version v5.10.150 e50472949604f385e09ce3fa4e74dce9f44fb1=
9b
-# Backported in version v5.15.75 2b0897e33682a332167b7d355eec28693b62119=
e
-# Backported in version v5.19.17 02c871d44090c851b07770176f88c6f5564808a=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-41849"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-41850
-# Patched in kernel since v6.1 cacdb14b1c8d3804a3a7d31773bc7569837b71a4
-# Backported in version v5.4.220 e30c3a9a88818e5cf3df3fda6ab8388bef3bc6c=
d
-# Backported in version v5.10.150 dbcca76435a606a352c794956e6df62eedd3a3=
53
-# Backported in version v5.15.75 c61786dc727d1850336d12c85a032c9a36ae396=
d
-# Backported in version v5.19.17 2d38886ae0365463cdba3db669170eef1e3d55c=
0
-CVE_CHECK_IGNORE +=3D "CVE-2022-41850"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-41858
-# Patched in kernel since v5.18 ec4eb8a86ade4d22633e1da2a7d85a846b7d1798
-# Backported in version v5.4.190 d05cd68ed8460cb158cc62c41ffe39fe0ca1616=
9
-# Backported in version v5.10.112 ca24c5e8f0ac3d43ec0cff29e1c861be73aff1=
65
-# Backported in version v5.15.35 efb020924a71391fc12e6f204eaf25694cc116a=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-41858"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42328
-# Patched in kernel since v6.1 74e7e1efdad45580cc3839f2a155174cf158f9b5
-# Backported in version v5.4.227 50e1ab7e638f1009d953658af8f6b2d7813a788=
3
-# Backported in version v5.10.159 83632fc41449c480f2d0193683ec202caaa186=
c9
-# Backported in version v5.15.83 5d0fa6fc8899fe842329c0109f8ddd01144b1ed=
8
-CVE_CHECK_IGNORE +=3D "CVE-2022-42328"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42329
-# Patched in kernel since v6.1 74e7e1efdad45580cc3839f2a155174cf158f9b5
-# Backported in version v5.4.227 50e1ab7e638f1009d953658af8f6b2d7813a788=
3
-# Backported in version v5.10.159 83632fc41449c480f2d0193683ec202caaa186=
c9
-# Backported in version v5.15.83 5d0fa6fc8899fe842329c0109f8ddd01144b1ed=
8
-CVE_CHECK_IGNORE +=3D "CVE-2022-42329"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42703
-# Patched in kernel since v6.0 2555283eb40df89945557273121e9393ef9b542b
-# Backported in version v5.4.212 2fe3eee48899a890310177d54537d5b8e255eb3=
1
-# Backported in version v5.10.141 98f401d36396134c0c86e9e3bd00b6b6b028b5=
21
-# Backported in version v5.15.65 c18a209b56e37b2a60414f714bd70b084ef2583=
5
-# Backported in version v5.19.7 7877eaa1131147b4d6a063962f3aac0ab1b8ea1c
-CVE_CHECK_IGNORE +=3D "CVE-2022-42703"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42721
-# Patched in kernel since v6.1 bcca852027e5878aec911a347407ecc88d6fff7f
-# Backported in version v5.4.218 77bb20ccb9dfc9ed4f9c93788c90d08cfd891cd=
c
-# Backported in version v5.10.148 b0e5c5deb7880be5b8a459d584e13e1f9879d3=
07
-# Backported in version v5.15.74 0a8ee682e4f992eccce226b012bba600bb2251e=
2
-# Backported in version v5.19.16 1d73c990e9bafc2754b1ced71345f73f5beb178=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-42721"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42722
-# Patched in kernel since v6.1 b2d03cabe2b2e150ff5a381731ea0355459be09f
-# Backported in version v5.10.148 58c0306d0bcd5f541714bea8765d23111c9af6=
8a
-# Backported in version v5.15.74 93a3a32554079432b49cf87f326607b2a2fab4f=
2
-# Backported in version v5.19.16 fa63b5f6f8853ace755d9a23fb75817d5ba20df=
5
-CVE_CHECK_IGNORE +=3D "CVE-2022-42722"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-42895
-# Patched in kernel since v6.1 b1a2cd50c0357f243b7435a732b4e62ba3157a2e
-# Backported in version v5.4.224 6949400ec9feca7f88c0f6ca5cb5fdbcef419c8=
9
-# Backported in version v5.10.154 26ca2ac091b49281d73df86111d16e5a76e43b=
d7
-# Backported in version v5.15.78 3e4697ffdfbb38a2755012c4e571546c89ab642=
2
-CVE_CHECK_IGNORE +=3D "CVE-2022-42895"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-47518
-# Patched in kernel since v6.1 0cdfa9e6f0915e3d243e2393bfa8a22e12d553b0
-# Backported in version v5.10.157 3eb6b89a4e9f9e44c3170d70d8d16c3c8dc8c8=
00
-# Backported in version v5.15.81 7aed1dd5d221dabe3fe258f13ecf5fc7df393cb=
b
-CVE_CHECK_IGNORE +=3D "CVE-2022-47518"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-47519
-# Patched in kernel since v6.1 051ae669e4505abbe05165bebf6be7922de11f41
-# Backported in version v5.10.157 905f886eae4b065656a575e8a02544045cbaad=
cf
-# Backported in version v5.15.81 143232cb5a4c96d69a7d90b643568665463c619=
1
-CVE_CHECK_IGNORE +=3D "CVE-2022-47519"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-47520
-# Patched in kernel since v6.1 cd21d99e595ec1d8721e1058dcdd4f1f7de1d793
-# Backported in version v5.10.157 7c6535fb4d67ea37c98a1d1d24ca33dd5ec426=
93
-# Backported in version v5.15.81 cd9c4869710bb6e38cfae4478c23e64e9143844=
2
-CVE_CHECK_IGNORE +=3D "CVE-2022-47520"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2022-47929
-# Patched in kernel since v6.2 96398560f26aa07e8f2969d73c8197e6a6d10407
-# Backported in version v5.4.229 9b83ec63d0de7b1f379daa1571e128bc7b9570f=
8
-# Backported in version v5.10.163 9f7bc28a6b8afc2274e25650511555e93f4547=
0f
-# Backported in version v5.15.88 04941c1d5bb59d64165e09813de2947bdf6f4f2=
8
-# Backported in version v6.1.6 e8988e878af693ac13b0fa80ba2e72d22d68f2dd
-CVE_CHECK_IGNORE +=3D "CVE-2022-47929"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0179
-# Patched in kernel since v6.2 696e1a48b1a1b01edad542a1ef293665864a4dd0
-# Backported in version v5.10.164 550efeff989b041f3746118c0ddd863c39ddc1=
aa
-# Backported in version v5.15.89 a8acfe2c6fb99f9375a9325807a179cd8c32e6e=
3
-# Backported in version v6.1.7 76ef74d4a379faa451003621a84e3498044e7aa3
-CVE_CHECK_IGNORE +=3D "CVE-2023-0179"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0394
-# Patched in kernel since v6.2 cb3e9864cdbe35ff6378966660edbcbac955fe17
-# Backported in version v5.4.229 3998dba0f78a59922b0ef333ccfeb58d9410cd3=
d
-# Backported in version v5.10.164 6c9e2c11c33c35563d34d12b343d43b5c12200=
b5
-# Backported in version v5.15.89 456e3794e08a0b59b259da666e31d0884b376bc=
f
-# Backported in version v6.1.7 0afa5f0736584411771299074bbeca8c1f9706d4
-CVE_CHECK_IGNORE +=3D "CVE-2023-0394"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0461
-# Patched in kernel since v6.2 2c02d41d71f90a5168391b6a5f2954112ba2307c
-# Backported in version v5.4.229 c6d29a5ffdbc362314853462a0e24e63330a654=
d
-# Backported in version v5.10.163 f8ed0a93b5d576bbaf01639ad816473bdfd1dc=
b0
-# Backported in version v5.15.88 dadd0dcaa67d27f550131de95c8e182643d2c9d=
6
-# Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223c
-CVE_CHECK_IGNORE +=3D "CVE-2023-0461"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-0590
-# Patched in kernel since v6.1 ebda44da44f6f309d302522b049f43d6f829f7aa
-# Backported in version v5.10.152 7aa3d623c11b9ab60f86b7833666e5d55bac4b=
e9
-# Backported in version v5.15.76 ce1234573d183db1ebcab524668ca2d85543bf8=
0
-CVE_CHECK_IGNORE +=3D "CVE-2023-0590"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1073
-# Patched in kernel since v6.2 b12fece4c64857e5fab4290bf01b2e0317a88456
-# Backported in version v5.4.231 89e7fe3999e057c91f157b6ba663264f4cdfcb5=
5
-# Backported in version v5.10.166 5dc3469a1170dd1344d262a332b26994214eeb=
58
-# Backported in version v5.15.91 2b49568254365c9c247beb0eabbaa15d0e279d6=
4
-# Backported in version v6.1.9 cdcdc0531a51659527fea4b4d064af343452062d
-CVE_CHECK_IGNORE +=3D "CVE-2023-1073"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1074
-# Patched in kernel since v6.2 458e279f861d3f61796894cd158b780765a1569f
-# Backported in version v5.4.231 a7585028ac0a5836f39139c11594d79ede97d97=
5
-# Backported in version v5.10.166 6ef652f35dcfaa1ab2b2cf6c1694718595148e=
ee
-# Backported in version v5.15.91 3391bd42351be0beb14f438c7556912b9f96cb3=
2
-# Backported in version v6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
-CVE_CHECK_IGNORE +=3D "CVE-2023-1074"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1077
-# Patched in kernel since v6.3 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
-# Backported in version v5.4.235 084cd75643b61fb924f70cba98a71dea1494293=
8
-# Backported in version v5.10.173 80a1751730b302d8ab63a084b2fa52c820ad02=
73
-# Backported in version v5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f=
7
-# Backported in version v6.1.16 6b4fcc4e8a3016e85766c161daf0732fca16c3a3
-# Backported in version v6.2.3 1099004ae1664703ec573fc4c61ffb24144bcb63
-CVE_CHECK_IGNORE +=3D "CVE-2023-1077"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1078
-# Patched in kernel since v6.2 f753a68980cf4b59a80fe677619da2b1804f526d
-# Backported in version v5.4.232 ba38eacade35dd2316d77b37494e6e0c01bab59=
5
-# Backported in version v5.10.168 c53f34ec3fbf3e9f67574118a6bb35ae1146f7=
ca
-# Backported in version v5.15.94 528e3f3a4b53df36dafd10cdf6b8c0fe2aa1c4b=
a
-# Backported in version v6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
-CVE_CHECK_IGNORE +=3D "CVE-2023-1078"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1079
-# Patched in kernel since v6.3 4ab3a086d10eeec1424f2e8a968827a6336203df
-# Backported in version v5.4.235 dd08e68d04d08d2f42b09162c939a0b0841216c=
c
-# Backported in version v5.10.173 21a2eec4a440060a6eb294dc890eaf553101ba=
09
-# Backported in version v5.15.99 3959316f8ceb17866646abc6be4a33265540713=
8
-# Backported in version v6.1.16 ee907829b36949c452c6f89485cb2a58e97c048e
-# Backported in version v6.2.3 b08bcfb4c97d7bd41b362cff44b2c537ce9e8540
-CVE_CHECK_IGNORE +=3D "CVE-2023-1079"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1095
-# Patched in kernel since v6.0 580077855a40741cf511766129702d97ff02f4d9
-# Backported in version v5.4.211 a452bc3deb23bf93f8a13d3e24611b7ef39645d=
c
-# Backported in version v5.10.137 80977126bc20309f7f7bae6d8621356b393e8b=
41
-# Backported in version v5.15.61 8a2df34b5bf652566f2889d9fa321f3b398547e=
f
-# Backported in version v5.19.2 109539c9ba8497aad2948af4f09077f6a65059fe
-CVE_CHECK_IGNORE +=3D "CVE-2023-1095"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1118
-# Patched in kernel since v6.3 29b0589a865b6f66d141d79b2dd1373e4e50fe17
-# Backported in version v5.4.235 d120334278b370b6a1623a75ebe53b0c76cb247=
c
-# Backported in version v5.10.173 78da5a378bdacd5bf68c3a6389bdc1dd0c0f5b=
3c
-# Backported in version v5.15.99 29962c478e8b2e6a6154d8d84b8806dbe36f9c2=
8
-# Backported in version v6.1.16 029c1410e345ce579db5c007276340d072aac54a
-# Backported in version v6.2.3 182ea492aae5b64067277e60a4ea5995c4628555
-CVE_CHECK_IGNORE +=3D "CVE-2023-1118"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1249
-# Patched in kernel since v5.18 390031c942116d4733310f0684beb8db19885fe6
-# Backported in version v5.10.110 558564db44755dfb3e48b0d64de327d20981e9=
50
-# Backported in version v5.15.33 39fd0cc079c98dafcf355997ada7b5e67f0bb10=
a
-CVE_CHECK_IGNORE +=3D "CVE-2023-1249"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1252
-# Patched in kernel since v5.16 9a254403760041528bc8f69fe2f5e1ef86950991
-# Backported in version v5.10.80 4fd9f0509a1452b45e89c668e2bab854cb05cd2=
5
-# Backported in version v5.15.3 2f372e38f5724301056e005353c8beecc3f8d257
-CVE_CHECK_IGNORE +=3D "CVE-2023-1252"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1281
-# Patched in kernel since v6.2 ee059170b1f7e94e55fa6cadee544e176a6e59c2
-# Backported in version v5.10.169 eb8e9d8572d1d9df17272783ad8a84843ce559=
d4
-# Backported in version v5.15.95 becf55394f6acb60dd60634a1c797e73c747f9d=
a
-# Backported in version v6.1.13 bd662ba56187b5ef8a62a3511371cd38299a507f
-CVE_CHECK_IGNORE +=3D "CVE-2023-1281"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1382
-# Patched in kernel since v6.1 a7b42969d63f47320853a802efd879fbdc4e010e
-# Backported in version v5.4.226 59f9aad22fd743572bdafa37d3e1dd5dc5658e2=
6
-# Backported in version v5.10.157 4058e3b74ab3eabe0835cee9a0c6deda79e8a2=
95
-# Backported in version v5.15.81 33fb115a76ae6683e34f76f7e07f6f0734b2525=
f
-CVE_CHECK_IGNORE +=3D "CVE-2023-1382"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1513
-# Patched in kernel since v6.2 2c10b61421a28e95a46ab489fd56c0f442ff6952
-# Backported in version v5.4.232 9f95a161a7deef62d6d2f57b1a69f94e0546d8d=
8
-# Backported in version v5.10.169 6416c2108ba54d569e4c98d3b62ac78cb12e71=
07
-# Backported in version v5.15.95 35351e3060d67eed8af1575d74b71347a87425d=
8
-# Backported in version v6.1.13 747ca7c8a0c7bce004709143d1cd6596b79b1deb
-CVE_CHECK_IGNORE +=3D "CVE-2023-1513"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1829
-# Patched in kernel since v6.3 8c710f75256bb3cf05ac7b1672c82b92c43f3d28
-# Backported in version v5.4.235 7a6fb69bbcb21e9ce13bdf18c008c268874f048=
0
-# Backported in version v5.10.173 18c3fa7a7fdbb4d21dafc8a7710ae2c1680930=
f6
-# Backported in version v5.15.100 7c183dc0af472dec33d2c0786a5e356baa8cad=
19
-# Backported in version v6.1.18 3abebc503a5148072052c229c6b04b329a420ecd
-# Backported in version v6.2.5 372ae77cf11d11fb118cbe2d37def9dd5f826abd
-CVE_CHECK_IGNORE +=3D "CVE-2023-1829"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1838
-# Patched in kernel since v5.18 fb4554c2232e44d595920f4d5c66cf8f7d13f9bc
-# Backported in version v5.4.196 3a12b2c413b20c17832ec51cb836a0b713b916a=
c
-# Backported in version v5.10.118 ec0d801d1a44d9259377142c6218885ecd685e=
41
-# Backported in version v5.15.42 42d8a6dc45fc6619b8def1a70b7bd0800bcc457=
4
-CVE_CHECK_IGNORE +=3D "CVE-2023-1838"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-1998
-# Patched in kernel since v6.3 6921ed9049bc7457f66c1596c5b78aec0dae4a9d
-# Backported in version v5.4.235 34c1b60e7a80404056c03936dd9c2438da2789d=
4
-# Backported in version v5.10.173 abfed855f05863d292de2d0ebab4656791bab9=
c8
-# Backported in version v5.15.99 e7f1ddebd9f5b12de40bc37db9243957678f144=
8
-# Backported in version v6.1.16 08d87c87d6461d16827c9b88d84c48c26b6c994a
-# Backported in version v6.2.3 ead3c8e54d28fa1d5454b1f8a21b96b4a969b1cb
-CVE_CHECK_IGNORE +=3D "CVE-2023-1998"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-2006
-# Patched in kernel since v6.1 3bcd6c7eaa53b56c3f584da46a1f7652e759d0e5
-# Backported in version v5.10.157 3535c632e6d16c98f76e615da8dc0cb2750c66=
cc
-# Backported in version v5.15.81 38fe0988bd516f35c614ea9a5ff86c0d29f90c9=
a
-CVE_CHECK_IGNORE +=3D "CVE-2023-2006"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-2008
-# Patched in kernel since v5.19 05b252cccb2e5c3f56119d25de684b4f810ba40a
-# Backported in version v5.4.202 c7bdaad9cbfe17c83e4f56c7bb7a2d87d944f0f=
b
-# Backported in version v5.10.127 20119c1e0fff89542ff3272ace87e04cf6ee6b=
ea
-# Backported in version v5.15.51 5b45535865d62633e3816ee30eb8d3213038dc1=
7
-CVE_CHECK_IGNORE +=3D "CVE-2023-2008"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-2162
-# Patched in kernel since v6.2 f484a794e4ee2a9ce61f52a78e810ac45f3fe3b3
-# Backported in version v5.4.232 d4d765f4761f9e3a2d62992f825aeee593bcb6b=
9
-# Backported in version v5.10.168 9758ffe1c07b86aefd7ca8e40d9a461293427c=
a0
-# Backported in version v5.15.93 0aaabdb900c7415caa2006ef580322f7eac5f6b=
6
-# Backported in version v6.1.11 61e43ebfd243bcbad11be26bd921723027b77441
-CVE_CHECK_IGNORE +=3D "CVE-2023-2162"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-2166
-# Patched in kernel since v6.1 0acc442309a0a1b01bcdaa135e56e6398a49439c
-# Backported in version v5.4.227 3982652957e8d79ac32efcb725450580650a864=
4
-# Backported in version v5.10.159 c42221efb1159d6a3c89e96685ee38acdce86b=
6f
-# Backported in version v5.15.83 c142cba37de29f740a3852f01f59876af8ae462=
a
-CVE_CHECK_IGNORE +=3D "CVE-2023-2166"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-2177
-# Patched in kernel since v5.19 181d8d2066c000ba0a0e6940a7ad80f1a0e68e9d
-# Backported in version v5.4.209 8d6dab81ee3d0309c09987ff76164a25486c43e=
0
-# Backported in version v5.10.135 6f3505588d66b27220f07d0cab18da380fae2e=
2d
-# Backported in version v5.15.59 e796e1fe20ecaf6da419ef6a5841ba181bba7a0=
c
-CVE_CHECK_IGNORE +=3D "CVE-2023-2177"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-22999
-# Patched in kernel since v5.17 b52fe2dbb3e655eb1483000adfab68a219549e13
-# Backported in version v5.10.94 94177fcecc35e9e9d3aecaa5813556c6b5aed7b=
6
-# Backported in version v5.15.17 5157828d3975768b53a51cdf569203b95318402=
2
-CVE_CHECK_IGNORE +=3D "CVE-2023-22999"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-23002
-# Patched in kernel since v5.17 6845667146a28c09b5dfc401c1ad112374087944
-# Backported in version v5.10.94 4579954bf4cc0bdfc4a42c88b16fe596f1e7f82=
d
-# Backported in version v5.15.17 9186e6ba52af11ba7b5f432aa2321f36e00ad72=
1
-CVE_CHECK_IGNORE +=3D "CVE-2023-23002"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-23004
-# Patched in kernel since v5.19 15342f930ebebcfe36f2415049736a77d7d2e045
-# Backported in version v5.10.173 a5bbea50d622b8f49ab8ee3b0eb283107febcf=
1a
-# Backported in version v5.15.100 1c7988d5c79f72287177bb774cde15fde69f3c=
97
-CVE_CHECK_IGNORE +=3D "CVE-2023-23004"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-23454
-# Patched in kernel since v6.2 caa4b35b4317d5147b3ab0fbdc9c075c7d2e9c12
-# Backported in version v5.4.229 6b17b84634f932f4787f04578f5d030874b9ff3=
2
-# Backported in version v5.10.163 b2c917e510e5ddbc7896329c87d20036c8b829=
52
-# Backported in version v5.15.87 04dc4003e5df33fb38d3dd85568b763910c479d=
4
-# Backported in version v6.1.5 dc46e39b727fddc5aacc0272ef83ee872d51be16
-CVE_CHECK_IGNORE +=3D "CVE-2023-23454"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-23455
-# Patched in kernel since v6.2 a2965c7be0522eaa18808684b7b82b248515511b
-# Backported in version v5.4.229 63e469cb54a87df53edcfd85bb5bcdd84327ae4=
a
-# Backported in version v5.10.163 5f65f48516bfeebaab1ccc52c8fad698ddf212=
82
-# Backported in version v5.15.87 f02327a4877a06cbc8277e22d4834cb18956518=
7
-# Backported in version v6.1.5 85655c63877aeafdc23226510ea268a9fa0af807
-CVE_CHECK_IGNORE +=3D "CVE-2023-23455"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-23559
-# Patched in kernel since v6.2 b870e73a56c4cccbec33224233eaf295839f228c
-# Backported in version v5.4.231 9042a9a3f29c942387e6d6036551d90c9ae6ce4=
f
-# Backported in version v5.10.166 802fd7623e9ed19ee809b503e93fccc1e3f37b=
d6
-# Backported in version v5.15.91 8cbf932c5c40b0c20597fa623c308d5bde0848b=
5
-# Backported in version v6.1.9 7794efa358bca8b8a2a80070c6e088a74945f018
-CVE_CHECK_IGNORE +=3D "CVE-2023-23559"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-25012
-# Patched in kernel since v6.3 76ca8da989c7d97a7f76c75d475fe95a584439d7
-# Backported in version v5.4.235 25e14bf0c894f9003247e3475372f33d9be1e42=
4
-# Backported in version v5.10.173 fddde36316da8acb45a3cca2e5fda102f52158=
77
-# Backported in version v5.15.99 0fd9998052926ed24cfb30ab1a294cfeda4d0a8=
f
-# Backported in version v6.1.16 f2bf592ebd5077661e00aa11e12e054c4c8f6dd0
-# Backported in version v6.2.3 90289e71514e9533a9c44d694e2b492be9ed2b77
-CVE_CHECK_IGNORE +=3D "CVE-2023-25012"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-26545
-# Patched in kernel since v6.2 fda6c89fe3d9aca073495a664e1d5aea28cd4377
-# Backported in version v5.4.232 df099e65564aa47478eb1cacf81ba69024fb5c6=
9
-# Backported in version v5.10.169 7ff0fdba82298d1f456c685e24930da89703c0=
fb
-# Backported in version v5.15.95 59a74da8da75bdfb464cbdb399e87ba4f7500e9=
6
-# Backported in version v6.1.13 c376227845eef8f2e62e2c29c3cf2140d35dd8e8
-CVE_CHECK_IGNORE +=3D "CVE-2023-26545"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-28327
-# Patched in kernel since v6.1 b3abe42e94900bdd045c472f9c9be620ba5ce553
-# Backported in version v5.4.227 c66d78aee55dab72c92020ebfbebc464d4f5dd2=
a
-# Backported in version v5.10.159 575a6266f63dbb3b8eb1da03671451f0d81b80=
34
-# Backported in version v5.15.83 5c014eb0ed6c8c57f483e94cc6e90f34ce426d9=
1
-CVE_CHECK_IGNORE +=3D "CVE-2023-28327"
-
-# https://nvd.nist.gov/vuln/detail/CVE-2023-28328
-# Patched in kernel since v6.2 0ed554fd769a19ea8464bb83e9ac201002ef74ad
-# Backported in version v5.4.229 8b256d23361c51aa4b7fdb71176c1ca50966fb3=
9
-# Backported in version v5.10.163 559891d430e3f3a178040c4371ed419edbfa7d=
65
-# Backported in version v5.15.86 210fcf64be4db82c0e190e74b5111e4eef661a7=
a
-# Backported in version v6.1.2 6b60cf73a931af34b7a0a3f467a79d9fe0df2d70
-CVE_CHECK_IGNORE +=3D "CVE-2023-28328"
--=20
2.34.1



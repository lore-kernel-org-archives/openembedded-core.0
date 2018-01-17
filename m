Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0080.outbound.protection.outlook.com [104.47.40.80])
	by mail.openembedded.org (Postfix) with ESMTP id 4084178778
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WHwFg116Lixpk4zwec7VpGo76I8GkJNh6faR3mxg4s0=;
	b=Ax/jvuZT0+WV01+74co4/W2ZHnx6kFifBwV1eYhAqwR6QdhtO4HrbqUyKV2Y/gyT1PUAi7sZ/3otHRukRDkwqxWfTs8Oi3BGz1OIatQHKUXGtqXA6WZc68dfy9EP03CZFjG7JYR5lCrmRnss1iWTufacGTvIKuKFyeGS91U56co=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Wed, 17 Jan 2018 19:23:41 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 11:22:56 -0800
Message-Id: <20180117192257.12472-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180117192257.12472-1-mkelly@xevo.com>
References: <20180117192257.12472-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR19CA0005.namprd19.prod.outlook.com (10.173.246.143) To
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e5062e-e3fb-4434-95d1-08d55ddfd13e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	3:1H2aWYplYpDNwkIYPQ5ZZf/phHYlKxKzH44wq8uqlso3Vy6QyN9T5t5V+QbRs4jCVNcuXEtuhvRDNhBbqWw/HcS61HrZQ6ZyxuEJxP2/eFqMXM3FnBmgc4UqoEU95VTbtf4evoeZ+iL0rqCq7h7Z1HFX3qvzKMxvuYoacHH06kMbpPnvS0kcMyimVBUt07jKg/2JYsqlOGcOPdadLeNBGelSjT4i8ATu4PEL8mKP1EO+ffMCm9pkf397ylDpoSwZ;
	25:B3ToAZHA0z4iyA+288V3bbGeHAyS2OZSYRHQw9GdtpaiG886xdksTKJtiK1QOQIzJqFn52zwq8gVeGjtMwsht2DyfSBkLGZY1SZLj10vqgwq3E/e75gRXOq9kEG3iaFguUzT1Wu1cmcJwGOkpv/h+oqgJShVHUJyCW8sCzAg1YGchWoVW6x3f3ngI/jAMQjfObxhI7tDjD3VTzu6BKm9MZ842FVXNdIEC0sOr0TN0UyedLTEk3b7QVt9DlN1niY+5VpNGf8/WbmtQangMJn6uk6nXDVdqMELPlAGYphP82G16ugeZrLc6otauUcmBOFHTCDvdal+Uhp+bdNlgggRlw==;
	31:d7IqbwCLIrExEaNLC0tOIjORQRg8JMt2A8yzt4nmdEggVtx1npyLvCjxHlDkoXOkK9+rDirnj8YsgzKVcAsI8WsO+mnry8sNgxBoNcaA5j5GNjmR35cAxfI2wZBK/sT/5nf5cXv2Tu6+iPNeCHZ1tDfyj7qmwzvrhhDjmyNYIi0/Ai4fDXWgpmK1rVyG5A995j3KAA74yYDswAqWdJG+m4qUTGmCawnq85fjII16gZM=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2941:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	20:smmDBZXt8HPBqFZNZwjBXba7gy0RcxTLOFJGPK1vmCrlJDlg9yUpcz9Pk+O7GnpcLUnDsBe/j5WuCueGcjza70mrHIUaC0Pq4u0XgSJFQ9cQTGeItbH2jTo2zIiluxjGs1kehHOJUo82yUpFd/HO1NDB2G5NHjJ4VaCh7Xi3aWA0e5b8oqQXhma1Gx381b0QIuur4dAy4/a/H8TrG3fD/RtueM1E/Hc/e8vnM9TtSsu+LyYtHX7eVD17z4v/HKOrgFoI50xToHwyojlyZjYiDHYQD0EphoG0jUOm7p+Hpr3rCYeQMYWNsKpKoNlUmyZXXQ2Yb6hubqnOyukORJvnfrv0NPIVxiUtSOqXW+p1VVYx2+aeGvm/+fzARzrEC/EzVCPqQRV/I8VNGWvv5ddD0si1Hb375hNOVXv8BQ5h6Ok=;
	4:1iuzjYsd9vjQig5wGBWKkCENSL5Wt0IUTkfJ3tIXrM5ekE+T2kq4fnpg7aS3b8pif8GQEOqim9iMzRiozIiM1jhM25qQODcLHKS6p7p5rOH/de2+dGsa6YDsRpMokYzXuWp3AflrDmLL8MS508aC6/mkKVAGKus8N6UNybE45ZkDJqtE3skIMiXbU+d+BDpiyuIFT9pqGkVmFjkwDfOfejb9DyvpDYQ/kmFL26agHkO3JmoMjPBucxNZYf1WcuN+PYzcQKQb/RuaJS9dttDNsQ==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB294105FEAD3B71740EF2C08EABE90@MWHPR0101MB2941.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231023)(944501161)(3002001)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2941; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR0101MB2941; 
X-Forefront-PRVS: 0555EC8317
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(39380400002)(366004)(396003)(376002)(346002)(199004)(189003)(16586007)(305945005)(25786009)(81166006)(16526018)(86362001)(8936002)(53936002)(107886003)(4326008)(316002)(2361001)(68736007)(97736004)(386003)(2351001)(7736002)(81156014)(6916009)(2950100002)(6116002)(3846002)(76176011)(5660300001)(478600001)(36756003)(26005)(6666003)(2906002)(6486002)(1076002)(48376002)(106356001)(54906003)(8676002)(59450400001)(50226002)(7696005)(52116002)(66066001)(47776003)(105586002)(50466002)(51416003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2941;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2941;
	23:VjQ7SXPBX4TH9rqPEEgUns34GTv/csp6fGzvTan?=
	=?us-ascii?Q?BTtgpOzP1+sjZpTXpJUXI12LLIAb+/2Unmbf4afc2ARxY83IzNexz5tgaEIs?=
	=?us-ascii?Q?LoAhklnrcpqUBt1X7816pC3jBx1+BeBLz4l8n4KAoF3xb/m3gMf9PaNWwnVC?=
	=?us-ascii?Q?f7sWx14UErUkp4ifbeg4Ba5Bj5UNWWEuWcXTcCoCAAHGR6dwX1+MssQARWjh?=
	=?us-ascii?Q?0eXi5hnDkTQi6RltvXuSmrt45eKnpMHx2jrwBm1H42nLu3hohsduENYtgagz?=
	=?us-ascii?Q?5G6acViYY1TJmmgjfnzP5jBzl90w+dsFsvhh8Zck93AGIh8pkbp3Y05vKRmw?=
	=?us-ascii?Q?M1UAIeGmLU3B66GnZRQqULukc/1AQes8ejJGQPKeV33k//8cHTcmqY0+U8G7?=
	=?us-ascii?Q?doCXweNP5uYZJnh+Qp/TPKhco7GdBOPJbKIVeDppOpagUdiY8BZ+uB8p7kkI?=
	=?us-ascii?Q?eCsrEoD5+Gddfrs6WwuGUagMYWSwzD9vW3Q+ixfiC1x2L/kIHxEAL9P5CM+b?=
	=?us-ascii?Q?TUItPlm1Uss+8NokRBjbQa3sOsqSGnkll766lCZ8KPcflxXdFaIgpZb1wqYA?=
	=?us-ascii?Q?lTARYgW54GQDcSOOn+lv8OcNkjLQu1YDLzLtOcE7704BpX8Z08YnAqABk+6T?=
	=?us-ascii?Q?lHAomky9ZPd816jDMaENLY2/kyYoEVJTSfLXGbQSxVsSQUV/ZhaVwkKPuVpv?=
	=?us-ascii?Q?UMX9vY9RMxEGCzHGghfDmnW6GZEEVF5Xr45LCOkJRjN3I/+mGEAS5ADBRSlQ?=
	=?us-ascii?Q?C/oImqa/2kD5S57UbXKDsGSP2aR/Ig3SsjDEr2ZLywdQDnXAlBHX1q7fBelk?=
	=?us-ascii?Q?I5+mO6gyD2dt2sa8hrsSc4LhXh7UAznJFVz1OQw7do+J+3Wb/RBmfoDSM3JK?=
	=?us-ascii?Q?1lwdyq6wV5Y++IDU5fDympjrmwibwXYK/GNqVo1oucCMVFEHUrxk5PQJxB1o?=
	=?us-ascii?Q?2Ca8dJAz6vnc5BcTvlEvaj4GA5Mie2wRFJtMCYtF02LI9dSjZXO59fdIAhYV?=
	=?us-ascii?Q?/I/0Hp7SdR0M24vaECg98aohtPJZGOr5UO4uVIuTRSvYBvkyXwyN8It622Gr?=
	=?us-ascii?Q?40g/9svMKANCfeIrE2j/OQzVfUVRIlgfr50f0d5HwZaFteZ2QaVl04OoscJQ?=
	=?us-ascii?Q?yNH17PYny7mpJOQ0dLnMf2HW3g3RamXRzDn0VoLbl6HM0LkxotCyPQE8wHeZ?=
	=?us-ascii?Q?bfZvr7KhQ3/T5OB4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	6:mgC/D0upV082FtC4CjUZbkUVNnIpIjMP/LVK51BE2cHusHap84LdYlv+CM0UTxA4MlxqHH10GrOf4o0WKhvXxbHTLj3ObCzAStMM5QrdiWMCh/tEhekUvlQKF6nfB/cOaA0on2KtqfA2iQxqX7heLbmdFlfAhc55kqCWtm/yZI8FRLTKDr92vY3tfLIal7uDbAvJzrhBhYP5qwYGEUtd+vNogfIYkL1sZSAs+BMNOTMX75MXI6bQ+YIhaPznmdViYDt6ctTKr8ICIcfQNsUbfq8svoU3iwOL5fMJznHNvids7xHTpXjZimSjSDMlxu62O4TpvR08F31sjDBxUc5k+WsOXOjyqQZLiqop8Mdsacc=;
	5:U9TOy3oAXSDUqFMXugbIlTTWSBgNSsqbLFuEoNLNUr2niy3JcCQ4JGrwfkjNLsMi9TDm5Y33EFSfb6rCI4i31qD/mKlmgUnWyRpqpegKADUIS6w0IFXbpCNcvDDf1AmvlmmwTpd0nTtbWOA/22szR9KXnFAnbYLO8tGPrh+5p24=;
	24:f/QtNnLWRtkbKh8p2ock037g9/kYdoWamZJwRsKOT2Igyljl/Y/reDywisE0yRmUNtpT6+r+v8tuqJxeRRNOIgcuztsvWsrJ1tl3w0LK4Rk=;
	7:d61mrlo+yKpH8D16H1zrII1hdTFTO3lw5n0qE0mh6vOi8nKISbacyg7yRoSVsHiEMdnd4/c3er77YNBGtMUTO5JWOgz2KV/VZqTX9KNrz6CzLNBqriE8JbczHLzwNmz3Ude56DKAw5kqEcCyle1SA59dl0LRhLBk1kYqGpOxNtCwFwGtF31y9FRJJ0bsbjHtnqXGDgd6jDw9a+syldEcEckQLlQGl9j6m5+plqFEpKtSMpIua0q+vMSjQvnq2cAL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2018 19:23:41.0860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e5062e-e3fb-4434-95d1-08d55ddfd13e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2941
Subject: [PATCH 2/3] meson.bbclass: include C{, XX}FLAGS in cross args
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
X-List-Received-Date: Wed, 17 Jan 2018 19:23:41 -0000
Content-Type: text/plain

Currently, CFLAGS and CXXFLAGS are not making it into the compile line.
This is because meson appends CFLAGS/CXXFLAGS from the environment only
for native but not for cross builds (probably to keep cross-builds more
isolated). As a result, we need to make sure these vars goes into
meson.cross. This is similar to what cmake.bbclass does with
OECMAKE_C_FLAGS and OECMAKE_CXX_FLAGS.

Change c_args and cpp_args in meson.cross to include these vars, and
update write_config[vardeps] accordingly.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/meson.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index f9cee00c07..4ab242dcfd 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -26,8 +26,10 @@ MESONOPTS = " --prefix ${prefix} \
               --localstatedir ${localstatedir} \
               --sharedstatedir ${sharedstatedir}"
 
-MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
+MESON_TOOLCHAIN_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
+MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
+MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
 
 # both are required but not used by meson
 MESON_HOST_ENDIAN = "bogus-endian"
@@ -42,7 +44,7 @@ def meson_array(var, d):
     return "', '".join(d.getVar(var).split()).join(("'", "'"))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
+do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS TOOLCHAIN_OPTIONS"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -59,7 +61,7 @@ pkgconfig = 'pkg-config'
 needs_exe_wrapper = true
 c_args = [${@meson_array('MESON_C_ARGS', d)}]
 c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
-cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
+cpp_args = [${@meson_array('MESON_CPP_ARGS', d)}]
 cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
 gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
-- 
2.11.0



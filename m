Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0052.outbound.protection.outlook.com [104.47.40.52])
	by mail.openembedded.org (Postfix) with ESMTP id CFCFD7847F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MVMIKGrege38vvZjYPYehnzuB2zxt3H2+cWTnmn5hrU=;
	b=DkumqZdrWwMPpvtjQPvWiUUOgLexyE2k4KYGaFXHsLyE6JVAMGyJFzfuJUYruAACcALQ7VeqfAS6kPfa7eNfJdSb+JaCCXWR+5rtL3dJIjIZyDKqcwGAT9U9EGMEBupF36mSt4kQRoH/yVX80sw1PqKWIGCVvCEdXpHaCI8B64o=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Wed, 15 Nov 2017 17:53:29 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 09:53:03 -0800
Message-Id: <20171115175303.3557-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171115175303.3557-1-mkelly@xevo.com>
References: <20171115175303.3557-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CO2PR07CA0084.namprd07.prod.outlook.com (10.174.192.52) To
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d14e3b7-597a-4adb-51be-08d52c51c79d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	3:b1BIdW4zCcmnxOvWXYE9Kj+oXzOFqIR/T7HQzRkK4v0ku5IG7pdnmBfpVkGRza1g4ajX5whCuAIXMnWX8OrcM2R0anYIMLgi6w9/JMnNj0Bw0GbtNo2fXKVGIc1XyNja3N6PoPN54arHGPWvE4Wxn8bCvWaVpzCwWi6Mjk2XkGHCTrJVQn+g2ycySgnoJYRpE3qfOsENC5iY1LZcxnJFwI+Ib+TvLctGEwXLGWTKRKnL+X+ht1U6+SUi94utSRfO;
	25:A9KlMgVJDXNXdVB+iHTFjNyo8vMfdUTEWLZ/qX6Rj2FZ9vufJb9+9roo+RbWdVO5jZImv+jQOBXJeK0ROhFFMGSJ4LYd5Q6lfHWbgRP+xj5yXUM+5SFv7F5oZEQk+qM9F89Px66/zOQmR9Lqy1P6jutaR5xUqveSVqAYjUjvDrs7Bh8q3uOUT9zJm+LfN1KmuGOCkv2hC4ECTY9DzAFJfFMHnvehWDABnEawRJ0LlTYVOhD7G6BWj+kTqLCH7rY+BJliH3ymcjDtlRzmpapIXTRN/LmR4gnXrIxKL1QLRFID7FmlIdFD7pj3Fnqke3DFGLhfWPoF43iE6dLccqRsmg==;
	31:Jg4Um1R0wpsMcf0oIml/M4AMAsrILnsZWCJcNrB0qOLMa2oq4A92LoYYCjKuEYanfl78XeAQDOZKEHkNEr6ZuTLaAUGVgR/TuVKu+t9HIa/3KV9XcmkKPINn8BbVfWDUJ1VIcFycZUJOX2noi8A/NaVGvaR3d3bVxUCyiQiPvdt4TSNL0bxkziG1C3J0qW8mkIICKuVxwCAeI5rNk/huEsO5QIVOugHiMyJoOZlfKkk=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2940:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	20:2HFtt0beOhm66sbpzOerzRxVbRLHAxWL0POYftfDwXoJF0pEi01w45zclLbV0NP920qfmO4d/Wha8eHZ4eBNeAR07FMbmryiXYcDcb4Kc1sjiMbmS/C0Y9s2V7ckbXXGtVMauHISOBMSA+oI41T/isTyfZl0UjgeTOJvOcbsk+UyxRaBDd4ly3rSAW8nYBp8rUbAYt4S8MpeT+rVY7kuZLSck/dNstut28tGCqysLGSBNzVJU5Gv/xfW65asEj2Mou1yNILJoSHGzWFPNXAUE/fvrkuV45xFt2qrQpLMRjTz5/lC3KwsvGrWK3s2lE7GnDAnu7xRpXTYOoHstJuOR3HW5+55qkwqB2UDaJhv0As/FXG04sx3hVDNe+FIThDJWONkbG2WDUDyx8d/6xoKGRE8zzkF5HcIoX+DpqW1tUA=;
	4:BJkcTeJbCrhSZE5mKx8PC5V922cpBbIF9msQ0lbIaSnn8oGhfm4icf/WEgfmuvl2lnIXPNuIUCuNp4+wVMooApxnTQcg2mmMiyhxGdF/lvHZp0/0yOvwkdjJnAN7UoQQBzgAcK2TMNEfaIQoFo8IJ8EZSSFY/TXOLDCSK/Etz0KdIXUi1niDTsR0ag8PFodf4A7KVrdFVigRPRwKw1gEoUTQxZUkQM0mcaYuTKxW4Yei1CkMsg0/Ack4COkqc+X+IohqBiWwDRzaqW8IFnIdYkwjBlsdUW1azme5ay+pJunTc8Bj6pvHrEN1T6Br0oMT
X-Microsoft-Antispam-PRVS: <DM5PR0101MB294018593B7B5142FD970F09AB290@DM5PR0101MB2940.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(3231022)(3002001)(10201501046)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2940; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2940; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(39830400002)(376002)(346002)(199003)(43544003)(189002)(54906003)(53936002)(478600001)(69596002)(36756003)(101416001)(21086003)(8676002)(6512007)(81156014)(86362001)(81166006)(50986999)(316002)(5003940100001)(16526018)(76176999)(16586007)(2950100002)(6666003)(6916009)(107886003)(68736007)(1076002)(33646002)(25786009)(4326008)(189998001)(8936002)(2906002)(47776003)(305945005)(6116002)(6486002)(2351001)(50466002)(6506006)(7736002)(3846002)(106356001)(105586002)(5660300001)(50226002)(2361001)(66066001)(97736004)(48376002)(11771545001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2940;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0101MB2940;
	23:E7pW72EHi8vfo4CkSrgLr+qsDt3HHfhk+cgmSXl?=
	=?us-ascii?Q?fFtVBKMxRkDvLMHExZ+qvy7oYu/wZv6YTOV+OM1jGDaYoNGf03A892BnmRPt?=
	=?us-ascii?Q?1WMtf0mhcDmRwz4fyaY2f+vCx+M8xI/ytLcMvJGP+ePCIw1zx7AKa2q22hqU?=
	=?us-ascii?Q?MKom4M7kjWc432+qUehKJOeCBEmfwML6mp7S2TgFm8vN7Ceng4HQIKmUlkRf?=
	=?us-ascii?Q?w6uO2Tomvxh6AHc6m8u1GN3mY864CDzy561gTujrVfpw1qRnKiSg/7iuHaYc?=
	=?us-ascii?Q?3MLgGcs1d1CNcHqZ/OWiT3mLYJWQaMzUjYHPSqwuungXGGWPpjcZL2FafODc?=
	=?us-ascii?Q?5+jAkGKXYlMYpgH/U/MccCwRctRS+DhnlrcuZv+2qP4rKTo67r0EZgna21fx?=
	=?us-ascii?Q?r0BrEWmhKOvxpAC0R2JRQNjh+g4Tg85p1MrXJPlaTjD6O/fVMo90GmiX6n1r?=
	=?us-ascii?Q?XopMvt96I12toqnpvVSWmkOwjAnJwcRkOb+4p+cpBuIJsE2FBsmAEsDWN8Bb?=
	=?us-ascii?Q?YEC1O6Gi/EAx6qbZ9lVDLBYEjtaiydRVUCEUb7KtmXgBmgOy60oAc3LbEb5E?=
	=?us-ascii?Q?tCX0wn99yQKcH5ruKk/gNfZ9Z1Je9+pwvV37rMjzq7v/wanw4Be8Pcxy8gcp?=
	=?us-ascii?Q?CYTgO31Sts/uattVi6ABb/SEAoLai58WX3Yj5oPCQeEku1uHrhPgecCBYVxY?=
	=?us-ascii?Q?MWbP0wB+nLe1iZ/doN2ZZV3Ff7chx8jH5YRb7x36YZkT/+owXn00/1JqIGjU?=
	=?us-ascii?Q?ChNQnvp8W15gLNYoRFPuuseWG1wQEny2uVGn6jFQHZafcd4VMWZcqi1dcPaI?=
	=?us-ascii?Q?Sqf+YgaO0SXt6jERFg0hvsrtzRmy+uNlseqsbIuxktBWqvzXz6FmURNdjj7r?=
	=?us-ascii?Q?feLOtk5t6Xpk9WoIF18gbCHQMMtvnqudz1EZ0SKWb4s6ohNsrgaBLzfe408z?=
	=?us-ascii?Q?n1E35Ag422C+Z+7NbR4GyfX6Xoba1Nh9Nh84qG2AMqGmhrQCeW04aQ/+EL9z?=
	=?us-ascii?Q?A+14fHQSTG+6khxe1nCdw9/Fk8vcDvE6m5ZH2c/pUh3mqnLPPd0yE6JnHyFY?=
	=?us-ascii?Q?ItZsUgtY4xBebZs/0j1Pr8Ffoh1hGLMcUloot/RXXzaSiF1GYgBCEKhAvXQz?=
	=?us-ascii?Q?fZ5PzPVNr1v4uPy7/ZZamEUlU4XqYck5HXzEx0SN+6+uo71jXdeRGT+6b9nf?=
	=?us-ascii?Q?0gvYFnjrdOMz9vWfJ6ApwuYoZ9EnFuYYWQhnuZW4Nu+3ws3dGgKXKg+DY8es?=
	=?us-ascii?Q?R59uCqO6l4gmVc+2qu17gkKBd4tSsiLZlxmW/kI4axshkJH0/leHI4811ys0?=
	=?us-ascii?Q?zfA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	6:m0u7BKkcm28U3yArzw1qtrWoQvkH9agf28xBfM4un7yaIVOVEbgSknkwHYHrjXFnlYOH4E1vc4xq4fBGYUltv5rBNFeZudzfBeckKViJ28a54384asJ2B1XLdniYgGjthpHseyh/SjeHa60o1c4LoVsREdzOCCPvx6hqUEeiXnI9xgTRq+nmqRINNUVPa5hjXaP8f70wO1BtkI4xeAsSQsJlaAVvniufufs7ftItACGUtr4FuEAexutEUItcckZND4vfZFq41TlzL27Lodl9ZO5A9rxHngGFAVRjGFTau4QaqgTc/dwZokQGqIiAVh1EGNcTU+77juKK96Xc1a0h8gCLS4ERR7uQgL46XX3eQSI=;
	5:oPrgjv2ZAJiLH0BQiTUn8PmUoMzEPTskv60gZLA2RYe2Y7lbzRZF5sjrFfVSuqwP8n7/ydyDXmjrIK9c2WfJxxlWWbH1C3oMxXRVamkY/S3R26y28JfTojam41rnBNzhe6QZKGzO/By1lENks7/WZuV17Sochhp7QM0i7tU4hjE=;
	24:GROeiayhBZi3MRXJrMPR81hph8bwWqQhXhIm8ikWCTM6OQYZ6gxXZYrQaWo48wjqzAs5YeIl0ezyWO9ShjR/MyR/eIhD+PR5vIboV93m3j4=;
	7:q0ecc60sGTb1Mv2ufToeO3K+OtvABGistzE6et0VeNrNa5enoKmWknc7oK4X3+EUx3zFi2YdxzDTtNnvtpqjNWJArSHBZCoRhq5iiLzKS1zatG26c97rdDzapy8TtrsOpgg+M7dD+b8Bb7WbJwelWSGpY09C91uKI0WIO5XU3Yq3/cagrMjL7blfEsIryqf0uydSJ59C37dAyt7/fDJIMKBZ/etifwOxVeqU6MLz8eOEdQkmLh3E8Z+DSn+blIQy
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 17:53:29.3554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d14e3b7-597a-4adb-51be-08d52c51c79d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2940
Subject: [PATCH 1/1] meson: export native env only for native build
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
X-List-Received-Date: Wed, 15 Nov 2017 17:53:29 -0000
Content-Type: text/plain

Although the meson crossfile should take care of setting the right cross
environment for a target build, meson slurps any set CFLAGS, CXXFLAGS,
LDFLAGS, and CPPFLAGS from the environment and injects them into the
build (see mesonbuild/environment.py:get_args_from_envvars for details).

This means that we are seeing native CFLAGS, CXXFLAGS, LDFLAGS, and
CPPFLAGS in the target build, which is wrong and causes build failures
when target and native have libraries in common (the linker gets
confused and bails).

That said, we *do* need to set certain vars for all builds so that meson
can find the right build tools. Without this, meson will fail during its
sanity checking step because it will determine the build tools to be
unrunnable since they output target instead of native artifacts.

The solution to all of this is to set CC, CXX, LD, and AR globally to
the native tools while setting the other native vars *only* for the
native build. For target builds, these vars will get overridden by the
cross file as we expect.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/meson.bbclass | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index f6cf24c33a7..f64377efcba 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -9,13 +9,6 @@ do_configure[cleandirs] = "${B}"
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
-# These variables in the environment override meson's *native* tools settings.
-# We have to unset them, so that meson doesn't pick up the cross tools and
-# use them for native builds.
-unset CC
-unset CXX
-unset AR
-
 def noprefix(var, d):
     return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
 
@@ -91,6 +84,22 @@ meson_do_configure() {
     fi
 }
 
+meson_do_configure_prepend_class-target() {
+    # Set these so that meson uses the native tools for its build sanity tests,
+    # which require executables to be runnable. The cross file will still
+    # override these for the target build. Note that we do *not* set CFLAGS,
+    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
+    # target build, causing errors.
+    export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
+    export LD="${BUILD_LD}"
+    export AR="${BUILD_AR}"
+}
+
+meson_do_configure_prepend_class-native() {
+    export PKG_CONFIG="pkg-config-native"
+}
+
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
     ninja ${PARALLEL_MAKE}
-- 
2.11.0



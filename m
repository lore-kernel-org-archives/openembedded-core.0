Return-Path: <tom.hochstein@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0066.outbound.protection.outlook.com [157.55.234.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA826FF56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=etETkPiKWo/StHAUMRj0UO1c7Qs5QscnQEU7Zlk3Mh0=;
	b=vL3sWbuonbDgCE1aEii38jvhFAFeCWMkiwxjKRCcDUByEuwpGOoacqsbfoQqLtCDieJQMh2crU5qA+MrHczG5Cl1cEgyzObXIe6lYCt2nwSQ9bpRxfp5PgycvcINRjDAIQJ+XuI12MxnkoDZhJb/9xOB9mzHSZb/bC5e1rqYptY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Thu, 9 Jun 2016 19:30:41 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2016 14:27:05 -0500
Message-ID: <1465500426-27684-2-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
References: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY1PR14CA0012.namprd14.prod.outlook.com (10.161.91.22) To
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146)
X-MS-Office365-Filtering-Correlation-Id: 07abfce1-cd99-4a58-33cd-08d3909c8b74
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	2:bIPYEMk+mlA2SNPIl67qOcJ5/AAtw/O5Ah7qWqIleJXvncvIjw5SkwlN4LTp6l1GPqPEnTgS/4wAL42yv6rJgb1EdH3JxRX7WYB3nTeppCF2hDkM+IIxIAO18Ju8bmsp8gwFvrVxTEtLVjMNu3TZKKNV5Jw8M6guJelgwMYHmj3oIkSo+EMB06mRLbDjXSyG;
	3:v0hFm1PBI14o3uLJGAbSwNovXWiidDAkRH97ADOh7FgDwG3P142WbOTTqVaa++2fJFDWpry0UsKA5/mjWbNGsnwc2L0B1WNuR9RxchKnwmSpnDIvJMHAXfyZ8htsJWLf
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB313;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	25:BJ3LD2wCSNnVshpXW/DOOEMYS6tQFSObIg1g3AA5xfXSRmtV1xixu4Evce4Q9PNPiNSHHZn6ekkNZKVfTUUf7rv1bjcaXR3nL5gpuvIwAjsqNd2zGeKKaR7H4lnUtqIa7/VQruRdlejasP3gc0IsvzlhWajrvPOxz8G8YwrwATbnEsidTxZ2N4fOYVsa3XYKhlFD3oxS9Not3rq5mi9i8C7QHGdMSWQaSUprxBDT/1hU8B7zctgSIquE70e4B8xLcjvlIn7rR+z0Q+EX1jDS32sj+0GOsxEFTYgnUETe+ujVT38LdQ5snDxIGNlM+q7bARvGKTFCt8MsAmoVgGulxsw/JGfhWrXbMBCEJ1PR+9OmYvFCeA62V2sRsE9/TEZJFrDAKGkkZPqDGHvkYlfFXACZ7r9XbqJ2MDjDG0ACwexh2lLhOQvUz/tSDmCabaSTLaJht3E54OfAoVAjeuJPITTsh8Io3c9i/bM+ilQCL3l53e1nwEs+Qk3XUUxk/ivHyV0YS6de9yNnNy7Cckgxa2Co67I2aBhbTG+HICfEJGGchvFWs7vu1wwjbEDfUJR3+l3Z2RgWFUMSDoRWqHa3yqVM0LnDmjYz+LI3d1mCnE16jCnSCqbKgdAE0W2nFSiNBdpDeDlUWRBxCDaL93hxeVN0YP5KDRFU4hEkMVj74Fm9CPQiBGrQys+rQ/+8EJfDrm4H7r4k5nnZtNBj/X4RlA==
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	20:aSIB+uyDdaKH7t4EYzApARGdJSp+mAtovjtuhZpDLaQsOEdDB459V1dvH2bRyksUpekWHTFqETibdzJRk6jjVmYNdYQxnjTxOqYv3fCYDcJ7EkpmQRzfJ08BGjyR2AwU2aHvwmX8WLOCSmXwKw3FomVAAhH9/2nKUWVuMUVbODethcfey3RSVcLrUJRNZCeHcpwiiLwpMiQ8P4MGs+Kr7tWoay/MfceeQIWNQ2FG8yHILI0Ikk7DBrwqv+2LPHqfcVNdd/smbjk2ryjqb+m4aqutqtqLuDM73hKHKZxGX1EMyy5ol9rNVUNgv5n4X68fpW7SLmUFYRQMx3O1IDe/XEnggqm+Yfo919JOoYOvDQEoWVi9ReUGlYvNE9+TPDRLtVNsYnbsWVR36tkB3xrMZR1ALw+wr/O/nkNToHk06QZwkajhyv/kSmsTYK6o7Mr7Jje91rzXWQ70iDEpTolgFynx8mfvoGpM78cm0cJvONAH0EG3icdFF9UGfXQq8j8K;
	4:gW6mLEB8TAmz80/4dD5rCquGJxjsma98ytHbB38sYk8rb0uJstn7AO64/mLoouq7DDFNlNdsgfrjLV8jceYoRhEjRbHScp7lCv+Z2hTF2d3Kqzlxt/U+tC4FDFunvURvsVzgWdP0QaSM2yoGFQWHGoCjerASEqRq4Rc6Hju4eZX7WNXEnECQxWV/MzotWN0gPtT/y8yxo2LBc/Jxv/vPqvF0JqNQmw3xQHZzSmI1vxvzk3pnAulEio+V127bjF01ukMpt38u4zydI+DYnxBzpq9lrjASSvOkger1Y7HCtKuhlbTxq4dAMQffXnSCM9Zt2gKY67ir+Sk/ZElvFlETGnFG0d3R4vQmKVPutev5aZcEiE1BvzLJXNr8PaRUtesQye0EpuNi17lCHW6inc2Ycg/8wB+K4VFa1ZCLnW3BLfCnYibpSAxlRFsVyFuzlJ1e
X-Microsoft-Antispam-PRVS: <DB4PR04MB313C52A12ACA9132BD0181AE25F0@DB4PR04MB313.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DB4PR04MB313; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB313; 
X-Forefront-PRVS: 0968D37274
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(199003)(189002)(76176999)(50986999)(3846002)(97736004)(586003)(68736007)(6116002)(8676002)(47776003)(36756003)(5004730100002)(5008740100001)(19580405001)(19580395003)(5003940100001)(81156014)(2906002)(42186005)(92566002)(50226002)(450100001)(81166006)(229853001)(33646002)(2950100001)(2351001)(4326007)(101416001)(106356001)(105586002)(86362001)(110136002)(77096005)(66066001)(48376002)(50466002)(189998001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB313;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR04MB313;
	23:ENxIDj9AZ4qLeNambA7SZJNoryk5Dtv1gCFNCOTUil?=
	=?us-ascii?Q?liHexmL+t3+LeOzHs8L73PYHH63ywCOPa9lqnp0Q8tuyjo073h5Fx5qWlGuI?=
	=?us-ascii?Q?0em+WbzWqFg/ExS7orf23q1k3e9tV+xKqBp3Vq2fahk7KGxCMZiqntyrZnBM?=
	=?us-ascii?Q?CRpKmakhxkhJw0a3PIAwhKqVgLD9xcljXiu//b2qz3B8JlAhERYwrCRQubxn?=
	=?us-ascii?Q?BnXqubAPuHCqtEflugHCpU/LeMeXk+ZBaqMbCvl94MqsVyjMoAL2Fp4o3LdS?=
	=?us-ascii?Q?3eI1iPznsl+Da3UF4eWzE4/owtDXZ2pFmoKUMAat5GO4Epr3zEtRrLEP6zoL?=
	=?us-ascii?Q?G/VFyH3NVmvzQGyNrN5qiLalZaf3BYBJANvWVuR87OCJtYAGsCnBi+a3E70T?=
	=?us-ascii?Q?ucTUhI/90/XU1jNlNnYaCLptjScdvkDrntmwhbqgre++SXrSHiY8G5UWDZXm?=
	=?us-ascii?Q?nqZvYbKPeU6AwC10k/RUyGzxa95VW899M67IOV/02kNerjXv0UlLiW5+D/OX?=
	=?us-ascii?Q?WSlCUHKILzZZ5PnexJFFleQPWy9Gup55YyeeN/HKJOYEwbPwIwxI1Gfq5+Vy?=
	=?us-ascii?Q?UmqGaHV4Yv883En/vQhiLhbnCIyF8SsZ5bMAv9xV3QWgv3mTFZLQZMqCFbgq?=
	=?us-ascii?Q?H/RdbQcfmow+Vsmvq1vIn5HUlaHi24DUaSaWAmkk7hRhh7U4+qroAPDqgRjT?=
	=?us-ascii?Q?egjWFy1e2P/oUgcVZyw/8GsxOR3DZf+kGCn0r+9yUgTCLlB3g61OZvtfJpFg?=
	=?us-ascii?Q?drNeTPQlb55O96wTrtAemmCQ2UrGT0zhK/2REkiXc2EuKoQrgPZAMQkPqw/B?=
	=?us-ascii?Q?95SKsf0IvUPTCXJ0uT3K/eSmwFXV/N2b9aAHGXClPWz5UJxVCZfK1avOeoOZ?=
	=?us-ascii?Q?mbS3X+JltXE3pomuUrP+uisY9rIIgpXWLjuSKehH6/Vp2ymzm2IM3ux8+apQ?=
	=?us-ascii?Q?jNVmGUf4FFbtBJ2WH+S2WSm/L3HMd2vah79sVX5sfrDPwzduRPdZWlar7lt9?=
	=?us-ascii?Q?na4mKYv0DfzlKs2597n9xqvCb0ahoN160HEzmIwHLjM+j+anb6kAvV0QlfRx?=
	=?us-ascii?Q?NrhviGWQxBg3iw8Ll8c/5PqPOL?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	5:ip9nEeSjvIUrnJyG2GB3bSa9vxjvLCaf6KVxEZNXSNxu/2aMOB9aMFBk4ZNB4QccPCQXvZHHpcwYCx4KHUth5SWL/cB48BoXzqiyNOhD9sRntHp+AUEnUjs9FmRdZ4agvsmY7aBkyAQ6bQbODiiKCg==;
	24:/+nS+fKrVHpEzwfZrbpgPun9vkUUpHeXXjhOkTenN+XSD6Bh1f2FscLjMBo7vwnwpxSdasGlQ21eyPG1EOL0KdTIjccZ8eHoDLQRzwQxOqI=;
	7:JmHOHiXD32XTCGE/QU6Id4SWOP1PnEgPAmUFuvjhwe2SXjBu+QX/CwjzsYbojwZsJG/01r8gOUVxSfFIhPSeFSMTMD8g0bClCN7QmBMKZRVhP8TetlUdKeq+fzgE1JICy8cH2a/mugLX851brDsqgYcA/yV1RHbQhPK+QoIYi54jNTrr4sMFXRrPIO/9LlCv7hcltJ10V60w6DtVEv7U9A==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2016 19:30:41.0661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB313
Subject: [PATCH 2/3] weston-init: Use bitbake path variable
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
X-List-Received-Date: Thu, 09 Jun 2016 19:30:43 -0000
Content-Type: text/plain

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init.bb           | 1 +
 meta/recipes-graphics/wayland/weston-init/weston-start | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e4e2701..291cd16 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -15,6 +15,7 @@ do_install() {
 	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
+	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
 }
 
 inherit allarch update-rc.d distro_features_check systemd
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 72ba4b7..4b41576 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -69,4 +69,4 @@ if test -z "$XDG_RUNTIME_DIR"; then
     chmod 0700 $XDG_RUNTIME_DIR
 fi
 
-exec openvt $openvt_args -- $launcher $weston_args --log=/var/log/weston.log
+exec openvt $openvt_args -- $launcher $weston_args --log=@LOCALSTATEDIR@/log/weston.log
-- 
1.9.1



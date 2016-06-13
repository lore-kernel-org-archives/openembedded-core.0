Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 95750 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Jun 2016 12:02:44 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0072.outbound.protection.outlook.com [207.46.100.72])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC55600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 12:02:44 +0000 (UTC)
Received: from BY2PR03CA004.namprd03.prod.outlook.com (10.255.93.21) by
	BN3PR03MB1445.namprd03.prod.outlook.com (10.163.34.28) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.517.8; Mon, 13 Jun 2016 11:47:39 +0000
Received: from BL2FFO11FD011.protection.gbl (10.255.93.4) by
	BY2PR03CA004.outlook.office365.com (10.255.93.21) with Microsoft SMTP
	Server (TLS) id 15.1.497.12 via Frontend Transport;
	Mon, 13 Jun 2016 11:47:39 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD011.mail.protection.outlook.com (10.173.161.17) with
	Microsoft SMTP Server (TLS) id 15.1.511.7 via Frontend Transport;
	Mon, 13 Jun 2016 11:47:38 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5DBlZXI011077; Mon, 13 Jun 2016 04:47:37 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jun 2016 19:47:34 +0800
Message-ID: <1465818454-5673-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.4.11
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131102920586515727;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(106466001)(110136002)(48376002)(87936001)(77096005)(92566002)(11100500001)(5008740100001)(50226002)(229853001)(5003940100001)(8936002)(2351001)(81166006)(104016004)(6806005)(8666004)(81156014)(8676002)(189998001)(85426001)(105606002)(50986999)(2906002)(19580395003)(86362001)(356003)(50466002)(97736004)(19580405001)(36756003)(33646002)(47776003)(586003)(4326007)(68736007)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB1445;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; CAT:NONE; LANG:en;
	CAT:NONE; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD011;
	1:6YIUpbniK5/4vEtrCDHGQe6JsX/2QUhbQ8iwCvQ2vXdPMcUG3R7FIDS3oNRlV7DIW3ZlIj2p3F8FqGwuA98KTh0GCVgSFYtUbeOCito6t5NO4pybLTRFwpxu0WrmWD4WyGnJ0BlDI5XyaOK4pRmMg00GGThMojGPiuqouN7ToxGfbcFQLFo082aUtBvsTG5vAV03//eeR2kheLeTjpkFW+fExwR0QD8Dy+6TjUqT3zShaMuBbIUViX0roXAflLCjkmrk445WCcageSUF9d5LAkoWRI6AmLytspQrRBOxMLiQT4Kko7ber2eOYgNLESGKhaSbNyjiGz+6t7fPJvAMzo6n8Io+DrhAF2ZmACMYjlarOWH+YaWtnk5M0LTqW8j7V7atODAcT6yjUKqtn7cELHXKrT9A/yB0UglgOVPRc17FqS3Vcp4z1G2q7MiyVcb57wAayCLRll1dtBIdumLc/6Qpw1kU6ZlSOwVTWCc+HVm4R3iarzek1D6GZ8y0a4j4FPiGw/vfyXM7lzdZtv9EU9MVmiMr7tVLp3Ka7AHQIFsbyp8jpm6z+zPLH/OxVVUi20+TZx4xmmpMvAo89j9apuvRAgngNygptKIdEQBFcEf7aSYvLycQuSyNZ3MiLSAmUYobhubr6RyG2zpS1ejUULRtS/wdSeEGPC/AOQm+ASLaX+xxT0ehIibK/JWmKVOY
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1e80db0f-e89a-4c68-550f-08d39380850a
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1445;
	2:mX5y4H1zUD9g3k28zHGj3VzPsZYFLC4zw3ApogzpDThja5Tko0F/q1nOiOrpFsi5GNOOjFroF0wS40hBrSxz3cPS3Bv/1RKBkeJJOma2rYVCiOcZgl5Dv4ix4VRBHfRuh4UsyNlkYboxPDpxSircJiK6N1PwJI8q/6CvkEj6O6OCN5yGMH/tPtLjZ+t9FL5q;
	3:uqewdq6cr2jZUbizPs8d9oktIc0LsweehrbWvqfQeq5VBPcyDZlSEDAuF0C5g4SiGOBC+rbyy2LMjdRM4xJ++s3/sqiEBWGvJhcDNIy71AdfHlQCmsnOC09ujAyaTFCjPryZG0C0vwu2HVNCNXYjoP5MaHCg+SMYpt9SQcm82SQe3hEM0gAi2bdPgUBNgJTNChhtqxTfPvOwjAIAFzOxset+zGxDYassN14XHWhKkp8=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1445;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1445;
	25:YUbSl9D5DrbRPrlUbwNrXxg71qQqr8kQr3XeLAKEpvrJiN5/xSdkNNUZUz5NhRiS2uxTiOrwYZBmvpTinNhGLLvgtsHr/oHjL9CzBYcHvOoRXWJlgl5nrwONIeo9MNWTyi9ybg2Vi6voeTXwPxEtsutLTivqGq7271QLZfGkVkyBXP1oTvi3A67PI3NTstEK1If+Swr+mfk9WVKGrt944PqZR45bqRy/IV6dlP4+M9aS1PMYGeaJOzP1uXc1rOgp5s1Tymv+ya+dwICkDnfWCUdGYuVClWMp1Lkf/hs9RehgTArt9Ygab4ljIYoSQ8rDFurjyuZY/aX99XfZ9jN1FzqstDpJqMwvJavgA0e9xUsM6lUVejVMGPn46tTNV62B7jGDtEM6yxRlgSiKmHcL3vDw1dIUuyWwjA3EyEAIQPmGDEP4aEMFESpgRAgR0F/ZtlTclKgIR0sU34s8Evn51opK82tXkoECN8QlarYv73Y+BMc5fJLr28+5uS7aVlLRMmEs5ku8OY/61lX0oazLBIcoYL0AqTUQwux1JuOKGrzUDefC72EOgU9RlU2HUD+LZZN/+yyaoMQ+LS56HxrtL+fxFJA9KdYm9Hd/3O8AjXfOxhdqukRQrYiZONL5VPezqrInVSvt6VSfbtuieErWbEwh6kh/p3EgEHYzTzl9gxSQexjdZtsUrH1UR8mu/UDP38Y3Npd1m9eqniOglmZWxIR81yPPZH7IDVHQVtr7KRM=
X-Microsoft-Antispam-PRVS: <BN3PR03MB14457D23E3AF9D8A6633BC02EE530@BN3PR03MB1445.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13015025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BN3PR03MB1445; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN3PR03MB1445; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1445;
	4:1qJTvsMDOf/fWxFjN7MehmcB85d363gglXOK9uZ3sVmSdRGg/i6YxAub2qkW3WNY88VjF1bL9T0/xUcs3F4YqysQwj7FO8iyZbuGxPPTYAHcj8SfRDTM9jJik6uRqtzCbxzF9HHGMtc30t6xLmCC9XLu6Vi/gk2yJRqZxH0TiBQRqkg6lVzLBsr/OpzxnoKqCUxd0FjXGscjfSuPYWJNBvVlXl5P/wbqa/0el5aEJxRTLah4ZlwoKxod2VlKyOzoIQi+Sk0pNMPwwXACPeW+/tEYW47QRkIdS64GLamBKgrPgUrx27Wh0YTBrH9++LcJUcNTcEjV3OxI07H0aaVW3fqTIaC1VcDkNuudlDAbKHUkV5liaaufwmDeblWB2x958P9sncla5GLjmrawawT2cD5//nwl1TTOok4lCv6NQHuJZk854Rb4tu3km85rt5OL+IMF203k3QHny5x52mq2zRv0tcltkp1g1UWHM3+DId225g8UIrQL9x5hOa63K4GGB8TJDPFpIvwGq0lNvzjb8g==
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1445;
	23:fh/f2Pq1RmSZwvySlFOQ2bjhkx+CJEAcAXD7MDcEO?=
	=?us-ascii?Q?cUEt4RwtJ4pVoIsXEikVxVSVae+CCJibYQh2pvG+bNycsBYQPNOuGpYmTAxQ?=
	=?us-ascii?Q?hV/TXhWzVemUMhRqHXvibRkB372CGHTzETKuoGEVFAoq97weyu5TBhgDVTni?=
	=?us-ascii?Q?PegZChQpRUjMXVCslSEwm8Uszxo65wc4eQzpPqxBhxbXdrDZ63wxPX7Peqov?=
	=?us-ascii?Q?K85zhiWeTMG62dSa8SdBdYYtywlK4MHMwBuYL2pUkCI01KlcPf7x9G2WaEul?=
	=?us-ascii?Q?fPbzZ73QlmUu/59u0sCbnA8469+3rJmzlbto/douvBNCrVdAEdrjxpiHc43I?=
	=?us-ascii?Q?2biS0FnsuDle/G2pwMSOtjlbIVPu3oOVAOnf2bCsgz0giKEuoL66xKhGplxr?=
	=?us-ascii?Q?I3PehtEvoesTng3QJPFFQRHkOannuWdQJnm5JC19ablbvVQjwDoHxHgi+AHt?=
	=?us-ascii?Q?gwNUHk9SgK+I+dYfAPFG+jmJNcQxHztHmiYQ5n7fXm2uJO9PN98VkbC7tEtM?=
	=?us-ascii?Q?pVGb8jov+hmMGRR/eh/qWnoQk5aH0lC9HBRx9j9oPQYEF1eMnYt25HUCTf63?=
	=?us-ascii?Q?szLG3yqJ4rpc7GYq/Nos7GpHvkESphmEbFJ34idPasZkf1S0Mx5hsnVbN3sq?=
	=?us-ascii?Q?mGeles0c2BSl5rNWN/rkJPh+yeY6XNRP4xV26eSz4m2u74x1nXSt0VkMEe6O?=
	=?us-ascii?Q?NLs1TefnwZaemZZSRigUiPjm+q6af2bfwN+71m0KhFGl7GThfcOBQETFuSEs?=
	=?us-ascii?Q?e7tUAN2ZUCeNujqUNSs7feZfQTHUl/S26+Vdzqx1P1e49b8WDiUzwUQqhCEH?=
	=?us-ascii?Q?SGub/9GUY9i4SX4JdR0TZs4QsfW/lzXX6AvSw6NQQQXp0jIGsGkTmTmaCgR+?=
	=?us-ascii?Q?9/wMnJIuH+WKU0WrLh1aTLWeKCTQS3Fs94szmvJZWomhwfpgJYvx6knioGTR?=
	=?us-ascii?Q?5AgBa5Q2Cd09/PN1hlkeMMHyVHd7NMQnQ+1T8MbDWOnacE3/XxLATqSstrwp?=
	=?us-ascii?Q?yxKsUskNctkKaeA5Mtiky0gKPwDYsd0Ws/bMjSYhuCKBV/NETTDfQNN2Q0vs?=
	=?us-ascii?Q?0MS1Ou0zyOhXUzTfoyGjbnH7WCfxhloisuEJU0e1nQNzWvYyj1/3YdnFuO9G?=
	=?us-ascii?Q?TLoFP008S9XnPOQ3tPf6rRbb4N8eesA?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1445;
	6:L7aenNKp1lK77Fl6ou2wi6Q3+H3NLg6gfMs0fRITFUpsUbBFr57z9YHneLOXcEUuHKUbqeD2upNeVZ0GzX/tU7OFB7lm+wSUYA+wbDAhRZEOvhtQmkFc1eqZ9AimkMaiMJFljv8igln+Gvq0Tm4xPIeofKphefWXog+pSkQzY4n5QmCiBPb8baBDBH/xsgcagIrySONR7PWUmC5huePgT0BwvGcyFT4VBRRyPNQwVen9IkJNBcJ0KUO/yOJ2TZYArBzcvsuKjnpukzlpQvjZGlJkGz2w0jjozkv6EigpsHw=;
	5:35g4DeKJeJTdJ9imeDA1v7CWIwN+qFLGIu4PUSx+fvWnAjIf1sn2myKuvNc31L/3xQiHp9tgWIiOj82yNVYqC8W1XvZitrec+ovxwetJBUaRyDg0VrH79dqOjaqYeFKVpKhaVgA5DqgNuVpuYoBCtZSDCqy42pzTIaMVATuCPVw=;
	24:UyihcuyoFfERtUpRDOZCgOeJfioINgCl+apQ3pBEOxL7c2UgnnVTiTCMNpcGwtkVYLrgEz+9Z6vNmq1oN2xB0FAo2SLX7FFrU5ituBAUrr4=;
	7:k4zH+qOwp/XMWKuacjf8LuVH8i+v2dtVwkovTF9TPR6zpgOZJL6sX8EVeacEut5uljGbJr8kx4S70geYTN/x7ijiMkaYBxlHYp6Fp/Q0VZ4S/oOmxQIyZW7fBqE73Ck0grzMEsRHW/R3EsKZpGXWtqIyIBymivT7YgC4qcgp0I8UKfEvM5lbxC8/0GA9jSyscTwk26gsO5ABn4fGsPmbIOAQSNRAOwRyEbcs7cM1SHw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2016 11:47:38.4799 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1445
Subject: [PATCH] image.bbclass: do exact match for rootfs type
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
X-List-Received-Date: Mon, 13 Jun 2016 12:02:46 -0000
Content-Type: text/plain

Do exact match for rootfs type, instead of pattern match, to avoid
unexpected build error due to redundant rootfs type build.

E.g. when building ext2.gz.u-boot, both .gz.u-boot and .u-boot are matched,
the following build error will appear, actually .u-boot is not needed.
| mkimage: Can't open .../core-image-minimal-<machine>-<yyyymmddhhmmss>.rootfs.ext2.gz: No such file or directory

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 65ce6bb..2577cca 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -404,7 +404,7 @@ python () {
         rm_tmp_images = set()
         def gen_conversion_cmds(bt):
             for ctype in ctypes:
-                if bt.endswith("." + ctype):
+                if bt[bt.find('.') + 1:] == ctype:
                     type = bt[0:-len(ctype) - 1]
                     if type.startswith("debugfs_"):
                         type = type[8:]
-- 
2.4.11



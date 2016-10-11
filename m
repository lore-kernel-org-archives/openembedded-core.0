Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 7163 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Oct 2016 18:47:18 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0109.outbound.protection.outlook.com [104.47.2.109])
	by mail.openembedded.org (Postfix) with ESMTP id E38F371976
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wyasxX11Bf1p+h3oEflZ1GWwUXTDnT4bsVl09CYo83U=;
	b=iCHL+Qc7sk4+gy5k+eHyysQ2Jk9QNdHpW8zCzltbuhkFOm5tb8YqNdZIloBvjJvKJkgccTRTdIaMwbRQFbclEflYXeQHTzxJ6V1glFaZsbL9S1eEmsFAHj6DkYTfJ6QiaGe8QzmzJwSYPyTr1XDudK4e+ICjPGytC6hrihET/MM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt.io (192.89.120.53) by
	DB6PR0202MB2728.eurprd02.prod.outlook.com (10.171.71.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.659.11; Tue, 11 Oct 2016 15:14:45 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 18:14:10 +0300
Message-ID: <1476198850-1529-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0501CA0024.eurprd05.prod.outlook.com (10.164.187.34)
	To DB6PR0202MB2728.eurprd02.prod.outlook.com (10.171.71.138)
X-MS-Office365-Filtering-Correlation-Id: 4aa93173-87be-498c-d49a-08d3f1e9558d
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	2:n/4f5WRfb9nGYvo6fzMJr8d38F55W6dfQyK/g5lvMXyUxGBrjQ82yAFJQJvRch1Uxjt9T9xwUR0EMy7Z8mVAwo8xSl7YheiyiTlU0lFhFX0zfiR1tMPpShkMW9x89ikmUdveX1xMU/DB52gkiP2omsxVHU9G0GY3zG9mXxLpMb0DokwqcV87G1jfHA5IM+MYdcJaxYIZneRsrO0W7eYZgg==;
	3:MOV8cjKfWb5cOfrE0qxzvrzo1dYPdDar5/xhuZSGprC6V8byHxMlHXAkSy3XhrQC01LQIwNLCyEL7mCAthfQuO5oooYNCACgQ6uE3nQ03M0JtNDedo8Wj++9iWw4QXrf30J/LHzDvrsco6GkFzKa3A==;
	25:bmD4lnEsPmmMn7FWJRc1E8eOyIPOSZ7pjkXzI+0GSxVOTo11ZEiyhBAa7RnfqntMGmkRY99jdLSMqUqF5vaPEt5MnatlznnoTb45ywl4bgmSM1U6eas2AS84lVAE0wm76SjzIjsfO5VraF+AEUs+npAjr1F4Gzx9PfQ5rsLifHgPSdUSQH5sqtpmcCNHV2lsustXUi2kZoOaAwbtBR3zWkKMsIABH3s5yqIWgLC4l4VOWwIfA/Tg7RWuyOX78wtxaS5ctZbqrpMcTSdP29thrM0g2OLYAZId028j2u4Xfn8DlwaOdf3Zx83bB14U5S5iTjb8hNGuQ9sCA80fohj3gldu5z/IYDhDygLSxfWQg7SALrD2pgIG/k9VV29upc8vPkawE3/G63FAAZd9l6jDRKfLusmbOJkD4F1dRWsNBuUeXX8IY+ifZfqKQns6Henq
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB6PR0202MB2728;
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	31:nUMTecF2YK9W8IgNsLl4seNvAK53XlqOt/4r43Y8OQ1LkcqvvEuHUtMiumrMtjxX/wLsgz4RXG2HhXunRSBMArVbdAKaIiidDdFsXkebsNYQIAexrW/uEZxGccr8/aznS0wir4NkFJ/G+AGJsGQAU+xx4pcwO9gEA27Z/jLgFH7DWeVWceHfCc6ztofiILiAqzTeR16jxOqDMyqAaZCkYWGchIEmsWZW9CUJiac/my5wOlSCyI3CKCz40ZvZqB2V;
	20:KQfpgRcvMsuRFrUPaAJhSlBfV7hqSEARLGbl21eXM9Z4NCPTecJMnLeqEQvzwh4qr08Fw+4uXSoMj8a2Ah8mnAKFSqixcGFtjBAhE8PPmviThnfkavRKcZ2E6iWxAfyBxKksEJwtdUZ+wpJZ9q+eyY3i4KXczU2a+npaWactJnp/qKjGOntlVwQzyu4PoaCclSYDbwcZYD9BpbDr5u92CHKAziHeQbyozt8V7EsMDI+FHX+KhKeYrSMl+taPTRF9;
	4:lBAIFF0xMclCMKZsfg9NwAblI/IvZ3/0vvcv6+c6F+FmB/zjri/X8Py9o48aU9SD3y16ueWk99qB/81UdJ1f915DUUlJUMgfowLF1r+Pp6d49/1Wn6lCeiNVBEmRe5hI4F0T2EauV4EKQS/RNzlDxtu0Kc/vJG+dqvyhL2o1UHE/rwBy8TjVneWzeqFyJ3hSZmBXE/on6xXZENM1QdGgOfMUtZTsbRwO2TbZTHy2nNscoOO6j+2YmvHfOcEV5QoSSA300sEHMPDeTqDd++8xCrBLPNXYAHW0tngM9TXVt9VS2RyfZyQ7m7Gb/Ods4N3jcoZukyGwtBIq4slr5+Q6lAYdReduF2LRdXMF7v6nhOT8eEktYR6U3y+XNs/b+KwKFfeHQK7d7RrGaZXL66++x29ZbXRiK7Zs7HtuttxYxqFfVC+TCrAngWsKmyqqhbHs
X-Microsoft-Antispam-PRVS: <DB6PR0202MB27284E616AAF3B9341EFE5ACE9DA0@DB6PR0202MB2728.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6043046)(6042046);
	SRVR:DB6PR0202MB2728; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0202MB2728; 
X-Forefront-PRVS: 00922518D8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(586003)(68736007)(3846002)(5003940100001)(6116002)(69596002)(19580405001)(36756003)(107886002)(189998001)(19580395003)(450100001)(110136003)(6916009)(6666003)(77096005)(5660300001)(7736002)(305945005)(47776003)(97736004)(8676002)(50986999)(7846002)(53416004)(81156014)(229853001)(81166006)(2351001)(92566002)(86362001)(105586002)(106356001)(48376002)(66066001)(74482002)(42186005)(50466002)(33646002)(2906002)(50226002)(101416001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2728;
	H:piippo.intra.qt.io; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2728;
	23:bg8DtcqfsvlMHL4Jv7yB02RtsW0j6KsUITWZgYt?=
	=?us-ascii?Q?ydbPO9OWuMTs3xR+z+aYybdq83NsYqVLRzFXoUa1N4/SUOGmtJOacv/a5uE+?=
	=?us-ascii?Q?7JLTss7zDUhWtDnxj4Z5pv3WtZ+HWtr0McK1kR0w9IwAywAsBuGtnHQeJB3L?=
	=?us-ascii?Q?rYim/WzsOio6D0TbUAXb2i7EKGErASzs3ySGJvLrmcLNUaIjo4syVFb8yxgo?=
	=?us-ascii?Q?c/E3Ot6AJdKQvzXKAno2+YKnpo3a7ReSHgaDOYQJEhWSTkg/x6KLE16+jMJn?=
	=?us-ascii?Q?gSpXuuaQdm3EMRrXza3JQw+TWDjqnWz2OdAtr9LuMfOiHMeG+nVxWF/8t0NN?=
	=?us-ascii?Q?LsWmKFLLldT9ed+I+313R2fhVRUWQTYzQsOAXOze068wxfITe0WEBxW+jMMW?=
	=?us-ascii?Q?saPyqL6aRLfaWVyXmcYnBxMZPW4bIScqJNgoR5JCoLOpMFIt+ZFyaa1y/D+O?=
	=?us-ascii?Q?GaMQWSGp4seJVzdK+PM1dGpUJ7R35OaKkXkKDInUpK/DaLvqJT1+SpmVt9J2?=
	=?us-ascii?Q?FLbBAJpvD7EqS7CylkNJuZnv7PKWSa0OlYsz4VqTZrAoIZeLdzNJQldUSP49?=
	=?us-ascii?Q?u+3QOtMB8ASNNJsvjN0WDvM9CpXPfEWcXTTFD2nKyiAlcJqRUjUMMi+Ir4WY?=
	=?us-ascii?Q?+5KnPavyw4v0L2dqBgdU+ZTe1jUaZezmyqwc+PdGckJOqi+MqJU4x1xAzdu+?=
	=?us-ascii?Q?fpJQbCiiqUSEInb7a3FEqlE/yEGgdBwiixYt0zUTiob7suq2ffatYDVLMUwF?=
	=?us-ascii?Q?UD2d3hvUfSFJd+j15ONK/WXSW/lSqaXchMT03wX+cN2TDoivMn4ws6TnxUNX?=
	=?us-ascii?Q?nHcGZQ+bct2z/TlqB6i3mogU/4Zeu8fkRYv9Tf87VmQyoFdTK9q0NbyrDKJ8?=
	=?us-ascii?Q?iPDWPkEK+bn+jJfgpyisBPLIypm5qvGSW8b8JoZ4rBxUuMe9f9G5yjVuCdAu?=
	=?us-ascii?Q?GwhYdW5cl51yJBOIbBFuy+CiVLXGbyi1RBcz6bkwv5a0w9W13zEmaP8J0KqF?=
	=?us-ascii?Q?QSjahog4c4950F87SxkOglJ3m3Wmyh45MJJucLKNdTrUKBO2j8PEXE/im7Oz?=
	=?us-ascii?Q?dqvbUKmv51bdGa/ieleeLS0KCp21Mra7JYrqlCdGBzIqJjfvZ2f7ftJWdTmu?=
	=?us-ascii?Q?+8EwH9lfIh+uQ2rgXf/3FZResghWveEmv?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	6:+hp3BUWIHNbc7J2gL9dB2wZbA8Zrib5FYAowt6YRpZjj8tHMdrPLOQjNKixheDaVa6EDtDKnlqwyJxe9wN44J9Fm377VoRLDlvhY32SslebiEreGoo6P2Fr76fWId77d4/l6Tc/NkmQAylU8z7V3n/7OAUV+/Z7Cxf7e6XTS46Iokr9hmbQ/0v/5N1T2hS+koPLgSOXasa2KxYmsVKAtAcrF7cQHGytfUTYGXnCrOTYvXZ9V3E4k9sYmhV6b3TKqhBSO/M1gCjQTxfEL+Pmt8kuUwTynKFAKBgg0Iw6o4KJBc51/fa77oXpZrz7kkSglaPzqdFSdOKiJS7tgtxdqiA==;
	5:8TUgFvN06LfgkUrxeU3Rgk9KesOFfJZovRyU9bbkIugAZr/+h1PVnTp9i2QUejeQkuvfKh7HgMVWvShD2F1bO6Q+6jfNwPDObjfVxLOnAHUGYM+LToIRZvHmiR3O3dSE88q6yPNP7oz/JDCtC56i4w==;
	24:d4TKAPn9ei463UyDdAdjymFh2IMmAwPu9p89KZg3JoFJJTwKws5O+8Qz6/9gWKqvSzj3mHZguvYsuDw3i5qSr9yHJ3xCJ+LEQh75RWn91Lc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2728;
	7:AkiTIE6c3ADg507IWNiYXd8CqLUrZy7kwn1HAFuivpGCecvYZpYXsmPu/rYY2X1h2qQkioFhIQuzr/g91c5OZOJaID7zRNAu75rNLDAy6seXdhC+Ifhx8KSHIALkGRQRzLHc/VgQOi1nHF5RgU5LX/MoGazFtysH83ldlJg6dIj3aIYoutmZAK6GYs3PCu14KOIMjIsv+pH6IQYYHxpEEvHovdwKSMEst2s7tVyW5nbYN0l0x8npQPtqWnGgBVdUKSRD9CpNFr2we2m1wpli7TQyO3RWRn8hwMvTGJdnQwnenPTKV6lfNW7aOATf5vktywRZLp7HJTCO/8YuePdTwE15u9NF/sjUqyksg4fNjM8=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2016 15:14:45.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2728
Subject: [meta-oe][PATCH] systemd-serialgetty: add dependency to agetty
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
X-List-Received-Date: Tue, 11 Oct 2016 18:47:19 -0000
Content-Type: text/plain

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 768b130..c4e5310 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -38,7 +38,7 @@ do_install() {
 	fi
 }
 
-RDEPENDS_${PN} = "systemd"
+RDEPENDS_${PN} = "systemd util-linux-agetty"
 
 # This is a machine specific file
 FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
-- 
1.9.1



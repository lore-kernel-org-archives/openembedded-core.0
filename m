Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0075.outbound.protection.outlook.com
	[104.47.37.75])
	by mail.openembedded.org (Postfix) with ESMTP id 304E2605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 00:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LNGnPYr+OMv3Z2JNjTs5wancNRpCzCZAaxnSfedqmmE=;
	b=vfmn73436BkGmKb8ROsSfmLa6t6ifLAL1rfFVl8MDqiokmMPCYsixSQVUk5T/m5yRmVjAu1Hjz1zhMoN3X/W3n6OvVvDpL/zDvXj4DjwD104OMFZ8vyE3uNWcZVSlq5AIajw+vN4VA6CHkCfSdL8NgONSC72JcQVjXlpICypOrg=
Received: from CY4PR02CA0014.namprd02.prod.outlook.com (2603:10b6:903:18::24)
	by SN1PR02MB1312.namprd02.prod.outlook.com (2a01:111:e400:583e::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.527.15;
	Wed, 28 Feb 2018 00:18:23 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by CY4PR02CA0014.outlook.office365.com
	(2603:10b6:903:18::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.527.15 via
	Frontend Transport; Wed, 28 Feb 2018 00:18:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT040.mail.protection.outlook.com (10.152.75.135) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Wed, 28 Feb 2018 00:18:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eqpRt-0001Y2-3H for openembedded-core@lists.openembedded.org;
	Tue, 27 Feb 2018 16:18:21 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eqpRs-0008Jx-69 for openembedded-core@lists.openembedded.org;
	Tue, 27 Feb 2018 16:18:20 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w1S0ICYV021761; Tue, 27 Feb 2018 16:18:12 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eqpRk-0008I4-21; Tue, 27 Feb 2018 16:18:12 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Feb 2018 16:17:59 -0800
Message-ID: <1519777079-7821-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(39380400002)(396003)(376002)(2980300002)(438002)(189003)(199004)(50466002)(186003)(47776003)(26005)(77096007)(1857600001)(336011)(63266004)(7696005)(51416003)(36386004)(6306002)(575784001)(59450400001)(107886003)(5660300001)(356003)(5890100001)(2906002)(106466001)(6916009)(966005)(6666003)(4326008)(316002)(72206003)(54906003)(36756003)(8746002)(305945005)(8676002)(50226002)(81166006)(478600001)(48376002)(8936002)(81156014)(106002)(2351001)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1312; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT040;
	1:Yxver2k7/aFV1U4nKRzcxCtk3kwoijL3d/89trI2TRtn+YKFtiEItohIcPM2UZg2doTOWmVWurjUcUTUeBwjA7kmjbAUIRTsbU538DYOiduOVqNXmwKmAblFvXqGATmo
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a452f10-63e7-4999-5fa2-08d57e40c6f1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:SN1PR02MB1312; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1312;
	3:hvY1OSZ4a1FjZrYE4LWgFslBa2lcBEn5sk08aiffPbE3AAd14mOy2+VlA6ZtUcRhidn8kHjFu88Re45U10wZgQ7FhLbLZBKRTPvWCcgWRHiOZfmUI13EbhQCl4W3ilQjzTpoBgwnYpko6CAKSVS3nyVBHjqYe+x9dzvY80JxQjxE/IM0ONG+1laqcLoUew+2OFreS4KRD56PkLlahQjvxHSU9CsgzGb9BSxhzVlOw2MR8YFmSAGyHq9SzVXfpJiHIowy9BcNFw6jne9F0kPW/6LypyaI2NQFhkG3mnb58ZxKIfeH/BiUuF1CLEOQFeVc0A0DbOaeJyG3rjud50KzSk5FZp7e7BMuJrqBLIE9184=;
	25:V2342QPBCSg/bn2+Vt+2nrRbSeycYnVhxNFXWuTbekR9/kKDnwafoNyAYkudWD/+S0LsZmhUkEFSb6LwHS5Q3GhzqUH8ccUcf13e70niACGJ6sPQ9uZ2iAK0dGguTLLrVxaQmvQPJ2lZPNzPnXdsK6rlIZGi7Qi6azgFBAQHJRj9q9NfcoB9k06SysEge6nBDIKNuhrTxM3DtQfQX3dyq93H1m+bX4Pf+sIkwuBMIRlMMdWMS9POFiS1xQYVa+M89WqYlH115lzvWZruveZ5fEOARkBI0h3DR05+gfx1KQMGC4yvshI1C4ZfWoIhtydhwnh56tW/HrrE6vM7OZ014LnzrwjljkX74NDWJlJSKfM=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1312:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1312;
	31:Fa2mCwD4ed1mgJirG7Ee5QI+tKtQ0vGhZEHXgj8r+MfSMyx5OiyG4bxYzb2gDGHh2ZzXz0yI8koYOgEQc/UuUxh+XlBGXi+FPQwxhhRIeYq4dltznzj2hNn/FLBFMv/76YEk1gkCMtUqSEP0WeI/GEB4AgyukumhGOr3QKEu7J4aEC/6q18uBpde3071HOBpxSw+psJSceTfyySE0fSSY9e5Oy9YzyIoVW12oY1sDts=;
	20:AwJSsPSRovh1/btS2UzAW27GDDRugMXTePGgAqw+fUbtgpUM7O/09Nr6qwZ6AvxeAa6SMIrvjleVfZHA3umuDF7aepqSzzUtaErCXaa+IvAQDCEp4JEYEtJYZcwG3nnb5GPd6VIJMb7G0Wv6xxLwjRcW7nEW/jlg2RoLUAt5nRv2Z6vsG8YleGLycjJI939gBY55fztW4IRLUrYM/0x/pq7youLfhSsH/nRPOh7nanfaadQjUZmyDRu8QYut8MQYF4At8cjZfiXZStYwo64efPRRaMst/2iFO1XY+ofay+rdhoc/U8V3lzFk79Cr8zOmYU+EI2kU5KtctltfDXFejzf4otX4SQ2LyTdibuHVtknV5Km4KJ13hnYauTlgn5kU3pTEHphPp5BTtvvrG4TevcxxrJlCfp1yDL7K5T/dijHul4aKxKsHHlW63vWyfdI84002EeFLKhKLf0VbbWSv+jV3v2tMRzJUFQI8tvSDxBZeY++Byj+q9a41VIVSFA6K
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB1312E1BA88F801D8CFEF3A14B0C70@SN1PR02MB1312.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231220)(944501209)(52105095)(3002001)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:SN1PR02MB1312; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB1312; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1312;
	4:NejdU+uWhu/y+t/irtEo6m0gX3gti1Q/hyOesMPNhsbygucSuREQUJqQQdnwouQmW0kzeAmHPWcimLSEsMBOAnNHv9DKMtWuT2Gjt2E4/w1AT3DhvgVJEDB9mRYpgklVim6Y+gsenuMoI5eZpJT+wcA/HtN6/L6lQ32pIV6My7VCpzPWC2PU9Q1dvWnBexSjVQWTQo212SqcBpa3OVwyxuyi3xNseY5zMY6DC+rDe8c+nx8PcaPYyFsoLqdUQK+7wgQPxevNjbFDObh731qgEs5+VbEy1VtkzMNLb4Fh93FY5RkNkJrDud4Ik2oJmfj+
X-Forefront-PRVS: 0597911EE1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1312;
	23:7a3cgMG4qUSB0rZYPbj9OLGW4/IW1tJR3iAz+edJa?=
	=?us-ascii?Q?A2fMEs1YN6s3v0xupAQ6y9Acd77dX7Bj+DEQV1geBnsSur8qomLMI79YbNYA?=
	=?us-ascii?Q?PJkTH8a2O8mBh+ayZaYvftr8zPpH2ntUSw5/IRXC/oEfkUxB8fBigjv0NDkR?=
	=?us-ascii?Q?BMesrg2UW175WnSj6CvPWR9DTXC8U9oAi7fOIDucNxMw4Ht5BLdSH0Hu+7mk?=
	=?us-ascii?Q?GXoifDbyzG/OXTjZv+9zAQ+BPScxwVt4Hh+TOg6p3tDfRQUJuYl/vAvZBajc?=
	=?us-ascii?Q?+9ZmxupUXjcQJ0HP90ovfuciSp7M+wg0eqwcmoEkNT+sihz98nT32WObgsnd?=
	=?us-ascii?Q?DLFrjH3IHayb823eFAV/yfpj0pZXoX+nwxY03OfvxlbvitfwRpHhL4Dcs471?=
	=?us-ascii?Q?TjRV1ZuUW2vKSIXybqyOpJVHg7TP69jp2VBG2j9TXIjitLdnpATYDKWuSj2z?=
	=?us-ascii?Q?59uavcgXupdkHoHGIMRSnNOJMU5g29vjnQX1+4TixBtX/3Mil1Imsx0nkRmD?=
	=?us-ascii?Q?EdrdCp8jAm5d5AOXMo6kg3M1xaxWiK8HvFDNue68giT1W8DBeJn86t1b720X?=
	=?us-ascii?Q?30E4g73fGgPo3YrwAd1ldC0xW8+Ya0oQw0bJBtfMi5d74rWkQ2wSYTp1CEjd?=
	=?us-ascii?Q?2+mqF7o0UO1/zqkG1hyDPHbn6raADHNOEkuNav+P6IvT9IGaolvqYt0eo9No?=
	=?us-ascii?Q?LzolwlYHNp0jR2mja7AQk2VQcmvzt8FYu0wFnVunfZ5tt7jhpmhFJxnBcOpn?=
	=?us-ascii?Q?QBRLmgyH46NrVpxFoQsflt4oBXnIYlpLB3lftRT27NSe8kaS94H+Dpy/P4sW?=
	=?us-ascii?Q?4NSTNLraQz3J+0WpEy/OWN6AohSaflxe14/qQjCb+BD76S60fHJE7J5rvOR/?=
	=?us-ascii?Q?dC/j1/57/SFrZfSHxXwYgX+ZrXBLEG6R0fm4OvQ3JwjsYfN4Y/Che68jn9QX?=
	=?us-ascii?Q?4OzZ2/zW7p4StwWDiExkw9wjwRAWEMkuaMNXw670250WPY+hq9dFvWHntvaw?=
	=?us-ascii?Q?XAgyCyWPmXzKs/UX9vrh76u87upmqo3wEb8xgmOKyTaUdr96IyYh9QeqvSrT?=
	=?us-ascii?Q?3ots9yBp9wF1pVVsf4GRwSr6DYwrpnTg/znWFf/h1rZjrfsZGGgZPOyWQawr?=
	=?us-ascii?Q?qIVxfWsGB4eNXy8b5RqsjAmrq/2zZAY?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1312;
	6:Yi0+h9709rmf16WLQbASeKffDtwyzLHN2SASQE+n1wvv+ijZajR+RrAlkQNhz36Lvnu8rmmDan/bAonM09ok04aa2qebQu15J1XqDaEeZDOSJ8TCwMwL43uEWMT3PlQh0E8TUo76e+uEtS93OReGDKz9aZqiSyTixCAIniet3osguagO8oBCg+3rp4Iec3WxP+CAoxfbhXaH4kPA4+ld04dTKxxQXLm2nuTRKGoa62g5f+00wBR75cg8IOur+VG/Ye52UxkTYmQGMmnIISc3KaAXQebV/hIv7jKNw7fr8wBsEl/Jl2jpOWftlKAc9/UBL3TeJIhkpMieCuBIAZ/wM9dAJI9jfqSixE87SZXwPT0=;
	5:NGVlL+GkFotsAA9sq+iCfOA1VsXgK6u/oUSpa6xevlcyu+mnlbioLtHXvYx9/UdD2tvcQQpK5Qybjd/dgNRSJmP6SshKsc+/scTiP7tPSLLil400mTGRVYNUW0zqiHbQi0UvSokOe/f2VEW7fRylAzmpIOWlWqYtmvR8qnr7TFo=;
	24:EAqktdGGWcLrk5DkP0mn5X0bjQxz2CbLFiTtcp/y4SiC+UuRmolvT5S4X+y6InRm5FakgmB6nqEc82ep9C1SL+gFKWNZE/w0EAVg67coFxk=;
	7:nBV1+P6Zuy+S3oG9+IgyzKQO0Y5q0XnCQdAPv1lwrq17QutjBk8TfUZXjjdErkkh7ycW2TQfdXAHykt9zS6vka2Ck29bjC18M16smYU/E4lFZrzQl2bHKRqq1a0IdjG7JiUpL024puVCLzsbWrKIP0LVSmjXlFYwDgdKUSp5SNloq31zVjQjcCX24yo/GxZG7ttJFJf9Jhp5qWTX3RKrfj7ODaLWijWZL5mTQ44urm4QX8eGgfvltc+VKM/irwav
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2018 00:18:21.8507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a452f10-63e7-4999-5fa2-08d57e40c6f1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1312
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH] webkitgtk_2.16.6.bb: Remove gl3.h header reference
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
X-List-Received-Date: Wed, 28 Feb 2018 00:50:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

GLES 2 application cannot use gl3.h header files, remove including gl3.h
when OpenGLESv2 is enabled in webkitgtk

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 ...01-Fix-gles3-header-when-gles2-is-enabled.patch | 38 ++++++++++++++++++=
++++
 meta/recipes-sato/webkit/webkitgtk_2.18.6.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-heade=
r-when-gles2-is-enabled.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-=
gles2-is-enabled.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-=
header-when-gles2-is-enabled.patch
new file mode 100644
index 0000000..021e465
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-gles2-i=
s-enabled.patch
@@ -0,0 +1,38 @@
+From adf3d4c9d4133bd6995590d921c0ccaec5254da9 Mon Sep 17 00:00:00 2001
+From: Bhargava Sreekantappa Gayathri
+ <bhargava.sreekantappa-gayathri@xilinx.com>
+Date: Tue, 27 Feb 2018 16:09:31 -0800
+Subject: [PATCH] Fix gles3 header when gles2 is enabled
+
+A GLES 2 application should not use gl3.h.
+Fix the gles3 header failure while compiling webkitgtk.
+
+FAILED:
+Source/WebCore/CMakeFiles/WebCore.dir/platform/graphics/GLContext.cpp.o
+           ^~~~~~~~~~~~~
+compilation terminated.
+
+Upstream-Status: Backport
+Imported patch from: https://bugs.webkit.org/show_bug.cgi?id=3D183008
+
+Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayat=
hri@xilinx.com>
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+ Source/WebCore/platform/graphics/GLContext.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/graphics/GLContext.cpp b/Source/WebCo=
re/platform/graphics/GLContext.cpp
+index 599dcc0..46d2fd4 100644
+--- a/Source/WebCore/platform/graphics/GLContext.cpp
++++ b/Source/WebCore/platform/graphics/GLContext.cpp
+@@ -31,7 +31,6 @@
+ #elif USE(OPENGL_ES_2)
+ #define GL_GLEXT_PROTOTYPES 1
+ #include <GLES2/gl2.h>
+-#include <GLES3/gl3.h>
+ #endif
+
+ #if USE(GLX)
+--
+2.7.4
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.18.6.bb
index 9fac044..c29fa7f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "http://www.webkitgtk.org/releases/${BPN}-${P=
V}.tar.xz \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
            file://fix-configure-failure-aarch64.patch \
+           file://0001-Fix-gles3-header-when-gles2-is-enabled.patch \
            "

 SRC_URI[md5sum] =3D "c1a548595135ee75ad3bf2e18ac83112"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


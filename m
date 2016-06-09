Return-Path: <tom.hochstein@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0066.outbound.protection.outlook.com [157.55.234.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB8571951
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3tfJhPb62/E6wPtrJwKDWrC+h5ndZH+qpGGLvXtFzJE=;
	b=nUlPdYz/dEEzJucR+6yRBH7PJD2mZ8t0+3M6lb2xzwdPZXIoRoh8Yev93AUcfuu0c/UA6Pf+0FCOKui6KEYZlFat9oWm237NI+ouVJ7OWi5nQOyRP1vInzCDa/ydW9RuQSXqWg8zaYJdEvRGfGE6BW2oX9zHw/b0WMEQiCxspEw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Thu, 9 Jun 2016 19:30:42 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2016 14:27:06 -0500
Message-ID: <1465500426-27684-3-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
References: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY1PR14CA0012.namprd14.prod.outlook.com (10.161.91.22) To
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146)
X-MS-Office365-Filtering-Correlation-Id: 3305a500-fb92-420c-5380-08d3909c8c35
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	2:PFfBveXYN6h1ZqK60yreed4VDJ/RgtzKyl30kxUHs+5CN/zM1D5FbdnI9oHkFRc34rpJvb/eO8Wubd3AkREQ2MXZa06NTMNlup5A0Bn9oXz/2+tavtnydhLTG8XPwu62VMvr/ocy+0BFd2Y4SlaNKqVsozszr7Dh0sX86CL/NcJhjkcHPEt/bA7HxEic8k57;
	3:f81fTKGgLvageJdy47+Ltd7FdAh7VtgzhEjjz4dl0bQhClfN/X8rnV2euBA8/pU/jZKqWq1DxrTVpmI/cqFgQQz2JxjfNg89R/79QIXHE2xzfmGfkJ3exx68mo+bIycM;
	25:E3P/V/QuKGiCnefFypGHoWt6qpkaKh2+V/RvHZzZQHwrbPv47I+dEySVkX3tYHd5JcUcsYVlHl5u57WxOBGCZac/uIPAyRixSx9F1RQI5R4rQzBMHR2MpPgV555Ok/SLuD0GEvhYBELUpZJ3jhbUmk99TtbEP4y5PYIuFu2z05VSgJ7N2sC69K7eSB1ThMQOP53ReoeJVRXgE3jKLKrGaJtIWbxbvjDumnx+4e9Ti/dfK4UV/Fhqw1DSDUmWDGYB/c4HvfFa9d2uuirwD/W5YUdeokWIbJRfnohzMXZyIzp16ITjUj2DUv2sCultXx5BcDwOCYqhkVtu9ICBFyOuWVCD7zQDCUgJDQcNe7tb6RUi9szKwIja1CZ1g345491tz75hQB6JBWZbns/osmcGwb9mxQ3LpO2rT9eK5mWsgls=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB313;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	20:fSadne+7sgzKI7G5SCXv4paIZvO6O7weGksgkK/HWsy1/I8vYzRKZ5hyam8a+SsH9X02MvkOKQdLceIjmPfYjnlSJ4fY65ZWTryvBRNYMgFznCWPNPX89n90UBr7GxrZ4sdiZLvDN9OomvaHzV7l4HVJn29ZM/ZtCk29rbHgThgvI5OGKJlWomlJI/U6ysIbfleX4bRx2GwuX3LNRudiki2vRf60aSNaF8iGQYYR/baL+TB/6KYtZEdON1IS8K42lhj+yn6jkR6EYORiWwyMbfkxJ+FRBiUgVso+IXrIB4nd364ANBaIM+8NGOx5SGDuRwp70kVTfy+HCTlwFrDiBSIjt/txa2TqWNL3f50ei/3j3MW1NXpw8ria+SyhmJUPMGXC7y+LTaLlv/z4pJV63KMuRkPcZ2iBwZucd9WvUo9ZIywOgZxRFUunFWqQTl1L896JnPE/UAqwqhPM1fZcX8F8TSKwjSLLkvW2c5d6hU+pQGb65XA8rin5ryyKSIjd;
	4:Yw0tce2AqhOyY6+4dtYp7ztg96WUymWC0OvQAEt2yDnkbVEwPGv9cbVW/sPxL3AMKkejO27jWZMsUxiTGbJAuioHbnap9NCO9NGVTSH+OIwU7LGutTUf13SXmEmee9Cp4dm5Hd2wBY1dAV+AXNLFnB6n56NJ3qjo9ngYZ00i//HzTjn28Spdrtk/tv/2neg3GTlE2/yLdEupH1f3VZpC5rHeGg7yRkucfPOEhPtvVsJFGc9YFWjJPeagkXCdHuK6H9R8bgrp5GHiOGI6wxKpXKmqe65xIVR5kYm4hWlLyDdQ63jT5eM0Jehmb6qbrsQ3cvdrH1IGOng41n114bXdUhH2dsb+HjHKaoyxnHG9jnWeuzjsrB0mbiUrgYMwTRL0Wp8gsk+4un+TEt8lf3ikQkYu9DjN7Yt/YFeTP6B+zYjQWZ9cOsn1tTrrnBMr5xU2
X-Microsoft-Antispam-PRVS: <DB4PR04MB3132BF8CE2625EED663F1CBE25F0@DB4PR04MB313.eurprd04.prod.outlook.com>
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
	23:2Yp3FN3lxa1haCzN5i4ZnaYV5+vM58hpcsxgLWWWuu?=
	=?us-ascii?Q?PXRkhDmdyM24cMaBNkZ2Yc6rMHwOvR9X3oQko0ARv4CZlC1CCekVUq4qf91A?=
	=?us-ascii?Q?vgAdOiy1mNuw0lvv3jSQ9+eG/ycdOgzppMklyR9TUaiClUZ54imBvDG+RwtF?=
	=?us-ascii?Q?a05KMwPvlz4qHqqHRs7p2SwAK+IaLwm/I8BJWlreRS+G05McXfK01IBW7KEv?=
	=?us-ascii?Q?gHk6fEPIjeqivWfI2Qdk1QTfNOeomTcA5t7SnZuMzIu5/C19WzZaxHiTQC8Q?=
	=?us-ascii?Q?1cB4MkB+3qwakRcsShnKU6Q9mYz7t66WYfgN+OSL81NOHl/Tq6Ms0tIFGXON?=
	=?us-ascii?Q?G4T8+gL7JM/B5QXe8aXCn6SCaGvUkcwJw6S8kg0VjbgEbksOQw2owWNMV0Fx?=
	=?us-ascii?Q?ynTOgECWCOYsCzcc7F+s3ZrD7tuf/+sbcpod97jE5jD1mu+3WECZ8h+FRdRe?=
	=?us-ascii?Q?CbU3yWCTap8fFbUHu4uURFYALkzGB5JLFmtvIbNFb1YqdhkOplPCVVmw5iAc?=
	=?us-ascii?Q?/xTCTl1igQlEsNm6sH4ukY08yClqU874cAm/dhqt3sBXaDk/A0c2GO3lZbGS?=
	=?us-ascii?Q?FZ58bwNav22DznNVkexvBYk6KPGytYa+dkCrAtsxYpK3PSbMG6S8wyf78KOi?=
	=?us-ascii?Q?vTWkrM8uTzGV44HSFt4O2HNUr3xSphJEAb/Aygi9SLklqlok1NToKYKzfssL?=
	=?us-ascii?Q?yrDU667STduArHFX5XItP6zfQCWOnrEnQxALXiNmko0/Ho0eEokpd5iFxLhN?=
	=?us-ascii?Q?g8kHuM0f86ZY0jUc1f/iJnfMdxqbOGMAUsznK1yWhJ5wAP+6KpfE9JBkdq+w?=
	=?us-ascii?Q?iDyZ1WZp+FdRw//J4mesXV+TBt+M/BkXkwMBaA+jtLoPrylLlBshuVJhMGCc?=
	=?us-ascii?Q?NXlHsL1CgV3xAO0UFevF3zECBcxQ15C2ww0O0ybxwLHTlCzVP4LkrH9zEr4g?=
	=?us-ascii?Q?5hHBgvhso2kDvbRx+x5j7+nDDRCbQx0ec/S4N/lolIk7b8Y+YRHb1vrZ/hxT?=
	=?us-ascii?Q?bYCNr/pNx4sVXWI8GFhNYtAX8WBqvDoZfiwCfAjWaT0Zb2kPai9iR7RjgUeb?=
	=?us-ascii?Q?vciH6gCBT/yoC8vVgbO0trvVTd?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	5:tzGdxNXW0FETCCxTlsBsuyGynQ6KII7JGax81IRyrBwyJoDW6m7Oh7jWZ0ti06s9Zxdu0SaJZfKtGlsUIocy6YQRrH+h1XftoyjaTKZv9mqMSulUcbA5WSBJbPqVJmJ+3s0cGaLqOXisCAZRgE9sGA==;
	24:fNFI99K0aitLzUsuV8BbWVjuihCJRQ0MP/JeLgjDvl22gEb/icsd1R/n9zPAoFYq5Ebh4OpFGdG6u0W8d68B11ybKczoR1eZW5VTx/zA/kg=;
	7:vu5cZjLsSkWdUIImDzRLZfFVRi25SoSa2Ib29r4yY3CYH2kKvxzjNA7vh8UFv9QVabs2Odo8at+GKT94iugStyv4pH+cytmSkfGgse8vzmAXuSzQ+zH7RfHUt1PJk0spryuw47PkdrBovhiD9FmAVdGK4DGSC1gWoI5/EbH0IZGsDNoRqddjqRFZu/qkC1Oia0TeJi5jv49yImg5EKHuxA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2016 19:30:42.3318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB313
Subject: [PATCH 3/3] weston-init: Don't change XDG_RUNTIME_DIR if it already exists
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

In the case that XDG_RUNTIME_DIR already exists, the mkdir --parents
at least does nothing, but the chmod could overwrite the desired
file mode settings.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 4b41576..5b7604f 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -65,8 +65,10 @@ fi
 
 if test -z "$XDG_RUNTIME_DIR"; then
     export XDG_RUNTIME_DIR=/run/user/`id -u`
-    mkdir --parents $XDG_RUNTIME_DIR
-    chmod 0700 $XDG_RUNTIME_DIR
+    if ! test -d "$XDG_RUNTIME_DIR"; then
+        mkdir --parents $XDG_RUNTIME_DIR
+        chmod 0700 $XDG_RUNTIME_DIR
+    fi
 fi
 
 exec openvt $openvt_args -- $launcher $weston_args --log=@LOCALSTATEDIR@/log/weston.log
-- 
1.9.1



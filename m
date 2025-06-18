Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFE6C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6230.1750250593478941973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264ad95c1=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I3e2HZ011628;
	Wed, 18 Jun 2025 05:43:12 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkm966-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Jun 2025 05:43:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Jun 2025 05:43:11 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 05:43:08 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Niko Mauno <niko.mauno@vaisala.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/7] default-providers: Add VIRTUAL-RUNTIME_dbus variable
Date: Wed, 18 Jun 2025 18:12:50 +0530
Message-ID: <20250618124256.3261625-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YD1HBUa_1HietmZNs3IYm3Z7iQomXjsL
X-Proofpoint-ORIG-GUID: YD1HBUa_1HietmZNs3IYm3Z7iQomXjsL
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=6852b460 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=vTr9H3xdAAAA:8 a=eWRtdWc1AAAA:8 a=e5mUnYsNAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=U7KmoYdRlzV8C53nEpoA:9 a=fQEa9puXOWAy-YWvlEz7:22 a=Vxmtnl_E_bksehYqCbjh:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfXwn5w3d6tMXDS urGlJ2MLeIrJ7jfUjre9ZO+WPNAaJeQxIV7HI9kU6T3sSvLAZkio+KisNFxc8cN2qm4kI2+ep/d 1Dd/bVSwHjPWw7B4z4GKiFlA+F5q1o3Cw+D0cM5KPj0nj19GlWbIbpU5Mt62hWphQe1hciWSDvK
 aS8CD8oELDoJbsgxNj7vPSyHvRWSzz3a+JrsOA26QvFJmkkNuQ/+IhVh5yqfGsePgxWaAovho97 5Lc5r+FX54rWEB+Xypd02tW91lrVAJXvv9M4QoCxCIgrW8WTeTSTKobbT1mFgXqrYUZtyDJZMJa /0gkfdkD26ZucrgfhFRn8qZpQaAe5ZCbc198D4WciF4CPDMFBQ89RSE9UFW03NDDCEC4feOvM07
 zN6mlQzeU6GTZGvHdkqmrvry3qyvMOVv1Own9f0MXqfcFWj00Ayi41EoLlIVi+JfYsfuLr1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219000

From: Niko Mauno <niko.mauno@vaisala.com>

The purpose of the new variable is to facilitate oe-core users who wish
to use an alternative runtime D-Bus implementation instead of the
default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
is currently available under
meta-openembedded/meta-oe/recipes-core/dbus/

While introducing this facilitation the intent is to preserve the
existing functionality, while allowing the user to optionally select an
alternative runtime D-Bus implementation by adding the following line
e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus = "dbus-broker"

As a background, for example the Fedora distribution uses dbus-broker
instead of Freedesktop.org's D-Bus implementation. The following
excerpts from
https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementation
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in place of the reference implementation.
  The reference implementation suffers from long-standing issues including potential dead-locks and susceptibility to denial of service attacks, which the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log messages.
  Any visibly different behavior to `dbus-daemon` should be reported as a regression.
  Ideally, this change should only improve the performance and security of the message bus.

(From OE-Core rev: 81fd917ac05be19d8345fff272a2ffc17a257880)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?= "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
+VIRTUAL-RUNTIME_dbus ?= "dbus"
 
 #
 # Default recipe providers
-- 
2.40.0



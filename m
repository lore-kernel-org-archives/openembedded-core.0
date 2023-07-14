Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2627C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 07:15:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13445.1689318910802415786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 00:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SrgfBDEJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6559fb2604=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36E7APBD025454
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 07:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YOR+p
	g7L/+U4Y6xJbGS+ebbn+RuYq1hCHrELqKa9i38=; b=SrgfBDEJVuuKrKzoe3uaZ
	u1+rLsMGsx2dzhpQ7lokG/5UfFU2PIlQXZTw0kpqJpdIHw/7gTKlUf0CrqQky0ZH
	rH0d+AXa4HoOMJds2JDKowsEWDNKP8UrVa9uFJ5miVoC+ksuBX4quMv7AG+QVg97
	p8iHsi8uhoZt05Cyrp8Xt0j/AvjPiKTcHYP/LszhlFWEvHAjTXQICqEY+BNQNj27
	ZSMqSFsjPojvZHiCsK+5NzdFbqeiP7ULSZbOkEFbefBJ2vnmLIU9AeygbA7WS1o1
	3UrWAi2fhyQogQPc72wXVhUuNzP5EGKWS++BZcxyCMnNkFHqAoMfLW50shq5pbKN
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rtpujrh81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 07:15:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 00:15:08 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 00:15:08 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 0/1] Cherry pick commit from master to update webkitgtk to 2.40.2
Date: Fri, 14 Jul 2023 15:15:03 +0800
Message-ID: <20230714071504.2894925-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yfJG-rfsRII4zeBJ9Ab_mZGKWXcOIBhe
X-Proofpoint-ORIG-GUID: yfJG-rfsRII4zeBJ9Ab_mZGKWXcOIBhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_04,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1011 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=3 suspectscore=0 mlxlogscore=446
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307140066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 07:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184253

From: Kai Kang <kai.kang@windriver.com>

Hi,

I've discussed with webkitgtk maintainers about api compatable issues on 

https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003887.html

> WebKitGTK 2.38.x is backwards compatible with 2.36.x, you can safely update
without needing to change applications. In general, we always keep the API and
ABI backwards compatible.

Note that the current stable releases (2.40.x) introduce a new API level
when using GTK4, but I suppose this is not a problem because most likely you
are still using GTK3


I suggest we apply the update in mickledore too which solves lots of
CVEs.

Regards,
Kai

Alexander Kanavin (1):
  webkitgtk: update 2.38.5 -> 2.40.2

 meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
 ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
 ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++-------
 ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
 ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
 ...ebkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} | 15 +++++--
 6 files changed, 111 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} (90%)

-- 
2.34.1



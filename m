Return-Path: <ian.ray@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 62A836FF72
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 07:28:58 +0000 (UTC)
Received: from pps.filterd (m0048275.ppops.net [127.0.0.1])
	by m0048275.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	u087S6IA022650 for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jan 2016 02:28:59 -0500
Received: from cinmlip13.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.4.1] (may be forged))
	by m0048275.ppops.net-00176a03. with ESMTP id 20a7h8r242-2
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:28:59 -0500
Received: from cinmlip01.e2k.ad.ge.com ([3.159.213.48])
	by cinmlip13.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	08 Jan 2016 02:28:59 -0500
Received: from unknown (HELO clipsmtp.clients.em.health.ge.com) ([3.187.7.87])
	by CINMLIP01.e2k.ad.ge.com with ESMTP; 08 Jan 2016 02:28:58 -0500
Received: from builder0.em.health.ge.com (builder0.em.health.ge.com
	[3.187.7.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by clipsmtp.clients.em.health.ge.com (Postfix) with ESMTPSA id
	C3D8310BC4A3; Fri,  8 Jan 2016 09:24:16 +0200 (EET)
From: Ian Ray <ian.ray@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 09:28:50 +0200
Message-Id: <cover.1452235739.git.ian.ray@ge.com>
X-Mailer: git-send-email 2.4.5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-08_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310008
	definitions=main-1601080142
Subject: [PATCH v2 0/1] More fixes for a distro with a merged /usr
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
X-List-Received-Date: Fri, 08 Jan 2016 07:28:59 -0000

When building a distro with a merged /usr[1] the linux-firmware
recipe causes /lib to be re-created because of hard-coded paths.

Replace /lib with nonarch_base_libdir, as discussed in the email
thread for the first version of this patch.

Tested by building an image and verifying that rootfs contains a
link from lib to usr/lib as expected.

1. https://wiki.freedesktop.org/www/Software/systemd/TheCaseForTheUsrMerge/

Ian Ray (1):
  linux-firmware: remove hard-coded paths

 .../linux-firmware/linux-firmware_git.bb           | 134 ++++++++++-----------
 1 file changed, 67 insertions(+), 67 deletions(-)

-- 
2.4.5



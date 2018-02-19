Return-Path: <konstantin.shemyak@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 457D8782CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 15:20:20 +0000 (UTC)
Received: from pps.filterd (m0047962.ppops.net [127.0.0.1])
	by m0047962.ppops.net-00176a03. (8.16.0.22/8.16.0.22) with SMTP id
	w1JEXKLI001184 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 09:36:29 -0500
From: Konstantin Shemyak <konstantin.shemyak@ge.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Feb 2018 16:35:53 +0200
Message-ID: <1519050954-29266-1-git-send-email-konstantin.shemyak@ge.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [3.159.212.191]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-19_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=662
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1711220000
	definitions=main-1802190182
Subject: [PATCH 0/1] cve-check-tool: correctly exported web proxies
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
X-List-Received-Date: Mon, 19 Feb 2018 15:20:21 -0000
Content-Type: text/plain

Commit 0466c81f has lost passing web proxies to the download process,
which makes whole CVE checking fail.
In turn, in cve-check.bbclass setting the proxies is not needed, as the
called process does not connect to the network.

Konstantin Shemyak (1):
  cve-check-tool: correctly exported proxies for updating the DB

 meta/classes/cve-check.bbclass                               | 3 ---
 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.7.4



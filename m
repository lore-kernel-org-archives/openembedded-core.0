Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D366672165
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:02:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAL627cI013170
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 22:02:07 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 20 Nov 2014 22:02:07 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 01:02:04 -0500
Message-ID: <cover.1416549482.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][Dizzy] serf: uprev to 1.3.7 for fixing CVE-2014-3504
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
X-List-Received-Date: Fri, 21 Nov 2014 06:02:14 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The (1) serf_ssl_cert_issuer, (2) serf_ssl_cert_subject, and (3) serf_-
ssl_cert_certificate functions in Serf 0.2.0 through 1.3.x before 1.3.7
does not properly handle a NUL byte in a domain name in the subject's
Common Name (CN) field of an X.509 certificate, which allows man-in-
the-middle attackers to spoof arbitrary SSL servers via a crafted
certificate issued by a legitimate Certification Authority.

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3504

The following changes since commit 081fddd3e464935e5f438a7686eb8f8856da6281:

  bitbake: data_smart.py: fix variable splitting at _remove mechanism (2014-11-19 10:46:41 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/dizzy
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/dizzy

Wenzong Fan (1):
  serf: uprev to 1.3.7 for fixing CVE-2014-3504

 .../serf/{serf_1.3.6.bb => serf_1.3.7.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.7.bb} (82%)

-- 
1.7.9.5



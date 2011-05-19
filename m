Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMt2G-0008BU-JU
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 04:32:24 +0200
Received: by pvc30 with SMTP id 30so1026172pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 19:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=MQENIzQhd0pq5mrAfOurRlfEQPRD/hMX2K7ySA9M2vM=;
	b=Eu1XRoLHZHLLac6c5berSk813kxVS2/pezz/sWNfsbs1ra0rjX5zwFm6d9+pzM2MJO
	6Ux5s7AAVqSGJnDr2URW4cwToCm911TxBE5eWRk5sqJY7fVHtsmdFZgHPLhaCV5Xhgmf
	OlHw/kV0+scupKqYqMBjXUyNOimHlWXAvrEBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=E+EcylxPJnDy4Jlju7DEhwenC25vr8e4U8IzAYUV2hTDzJn/4jxj1zgGFK/sG79ADb
	9iwlh3gK17gprQ38guL4n+29mmuG9VsPuI+huj69nmMhkIvgbETE8QGoY+xTK8iNv1V1
	uz1blxf3SB3diCmOvCEC3X9ByHbrpeA4rJFJM=
Received: by 10.142.63.29 with SMTP id l29mr1559669wfa.86.1305772167551;
	Wed, 18 May 2011 19:29:27 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w18sm913889wfd.15.2011.05.18.19.29.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 19:29:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2011 19:29:16 -0700
Message-Id: <cover.1305772107.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] Fix recipes to build with uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 02:32:24 -0000

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/uclibc
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (3):
  uclibc/site_config/funcs: getloadavg is unimplemented
  distcc_2.18.3.bb: Fix compilation on uclibc
  nfs-utils_1.2.3.bb: Fix compile failure on uclibc

 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   16 +++++++-----
 .../nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch |   26 ++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 +
 meta/recipes-core/uclibc/site_config/funcs         |    1 -
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   18 ++++++++++----
 5 files changed, 49 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch

-- 
1.7.4.1




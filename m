Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyQOi-0001za-FJ
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 16:06:28 +0100
Received: by iyb26 with SMTP id 26so3734914iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2011 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=o24dV/D+zgM7+ukmeZB0Irk4di+nYbRShGWBAniUWwY=;
	b=rofTnKNqScmJ0TKMP+PycGMs2Ch8snP04rHTdkHpN4xRwziJr8fSyDg2NADNb+bJIS
	kcQpWr9Bf6S6+acloPiuz8HlAmC6J5u70XFrpmGhsROLhgkaQ2O2FYex1KNtM7u/njnv
	9aLguV+M7Xk2tJZdCOOzv+jOBbzy7vpiEFfjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=CsJFowfBcOTNuFAv2EWGTQliUg+UVKalX8qxd+lRqjbP+YEfc7Orsq6/G0FeHJGFh5
	XJfl5oAJehCw/Bu7Jmo1FFsfV8plk/GkisVljLTyjxQHLRpd8sfASeuTddmK5P5/+NzL
	xzWy6Rb4+9Oy9fUCBcVX6SQ/UTb1BZuS+tEW8=
Received: by 10.42.145.198 with SMTP id g6mr3010682icv.131.1299942285442;
	Sat, 12 Mar 2011 07:04:45 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm4590306ibg.15.2011.03.12.07.04.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 07:04:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Mar 2011 07:04:34 -0800
Message-Id: <cover.1299940883.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Sat, 12 Mar 2011 15:06:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Richard



Pull URL: git://git.openembedded.org/openembedded-core-contrib.git
  Branch: kraj/own-mirror
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/own-mirror

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  own-mirrors.bbclass: Bring own-mirrors.bbclass from oe commit
    0ef914b250df46a41348479446214575668943fb

 meta/classes/own-mirrors.bbclass |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/own-mirrors.bbclass

-- 
1.7.4.1




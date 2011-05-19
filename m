Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QND44-0006Q4-LE
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 01:55:36 +0200
Received: by pvc30 with SMTP id 30so1476868pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 16:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=dFtcS/VVe3kFfTdlnv0nyfADPqh9u4eUV2/hccEdaPA=;
	b=shqiI3vlvveQdWmuUYr6FGdkcOSUOYvpd3ufWwIHUu7ykuMBualovy8YN9Ubj+J/HL
	pqZZD71JhwjzGEfyHXVPBLcitR86mJQ0yaOZaIERJTXtfnHOxVWl+DE0AbYKY4QWOZgN
	seQq0q6VMuv7rhNfrbUDepfz8MbmKVvQMb0e8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hbgwydWZfP7nTNExeOwICZ4eO3tvbwZzxI8B172aTj2dvIqYlOgryctuf46woOd9Wm
	9I0ufK0WvCqIroNggKxsDh4sOkGMBmIxlFMd+Rkl416nfH8+vC239QjIpBrQquouxtc1
	0FG8p2xAXmv+3Ysrcu3Asz9o3NcbxApcPfBSc=
Received: by 10.68.30.39 with SMTP id p7mr5713243pbh.34.1305849158953;
	Thu, 19 May 2011 16:52:38 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q5sm2063149pbp.65.2011.05.19.16.52.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 16:52:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 16:52:19 -0700
Message-Id: <cover.1305848960.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCHv2 0/2] opkg updates
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
X-List-Received-Date: Thu, 19 May 2011 23:55:36 -0000


This incorporates the comments from RP

The following changes since commit b0cbb0f5a98e9406a5007aa5ce5091c1be8e82db:

  opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS} (2011-05-19 16:45:03 -0700)

are available in the git repository at:
  git@git.openembedded.org:openembedded-core-contrib.git kraj/opkg
  http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/opkg

Khem Raj (2):
  opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
  opkg-utils: Synchronise with OE

 .../opkg-utils/opkg-utils/mtime-int.patch          |   29 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    7 +++-
 meta/recipes-devtools/opkg/opkg/headerfix.patch    |   19 -------------
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 4 files changed, 35 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch

-- 
1.7.4.1




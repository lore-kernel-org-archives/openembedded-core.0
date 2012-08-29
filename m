Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6jOG-000777-HV
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 16:37:08 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 07:24:52 -0700
Received: by wibhq4 with SMTP id hq4so5310104wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 07:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=OI2VLraJX9+cV4pkd6yGq6eo4X9I3eMD57SnDetAW9A=;
	b=DdxAEotbkFHPrPwMKAtuNCNmnxfgk17x5TJfTwOzJtUh9mTulrLqVsnUV6Vl2uR6cy
	uQYBSZ1cZ86ofsPmFMsuuAp9FNDHkm5PACZKFLxdEu8gNvsXHP4NYMzZAyp55XZljCB9
	pV13gi+d8Br/hinof9PPDEzMabspiERMVZ9CydCaK76GvGFCmXlFNSTxWihPYNwKmhss
	eQLBVSd79QVLLuiUkM6CeaW/nTAawSGV7YoHHcLrPjWlcEZya1zU9TIEkkszVvqytHt7
	2inYoUBxsYE+//a9PZ/jFmLWzBE1knwbXofYNiKT8jwTIOZQtzG8ze4yE1MMxuf+eLzC
	cK5w==
Received: by 10.180.107.163 with SMTP id hd3mr4111288wib.19.1346250290838;
	Wed, 29 Aug 2012 07:24:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l6sm10491621wiz.4.2012.08.29.07.24.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 07:24:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 15:24:07 +0100
Message-Id: <cover.1346250187.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlL7/bZW4joS0RmjCIRsp/pYsBj+AxMErN0V3OHw7c9l7sBVbuDCLPDpthlTwBrA+wMGMDg
Subject: [PATCH 0/2] tzdata fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 14:37:08 -0000

tzdata is missing a file to make the local timezone detection actually work in
many programs, and isn't architecture specific.

The following changes since commit 603f6c631e9454d10517599e229943f2b26d08a5:

  atom-pc: Drop glibc --with-tls option, its now the only option for glibc (2012-08-21 12:15:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/tz

for you to fetch changes up to ba35808d6976ff17d3732ffcdb56e71f8014137c:

  tzdata: install /etc/localtime alongside /etc/timezone (2012-08-29 15:21:48 +0100)

----------------------------------------------------------------
Ross Burton (2):
      tzdata: this package isn't architecture specific
      tzdata: install /etc/localtime alongside /etc/timezone

 meta/recipes-extended/tzdata/tzdata_2012d.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Ross Burton (2):
  tzdata: this package isn't architecture specific
  tzdata: install /etc/localtime alongside /etc/timezone

 meta/recipes-extended/tzdata/tzdata_2012d.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.10




Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 977A960761
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 22:44:58 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id vz6so6056491pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Oc4fxrFVJZVdljEo5MuPUZw2nyq6dd9WLg6ree2dBPA=;
	b=S3lTNqZXJ68mLoGnHX0NZnjEAmbBP2IZJOVHcVWFycvZDdrBqy/UoBlFJbiEJf6X36
	fXWJ4x9ZhqtDtiuXmjVLFz5yu2nlRVtJbqHPQ0CWmiohxYwfuCHB7ZukmFFGz30FzFkq
	M02mtiXl13VXQb//L+eT03+Qk58UAbQFM3MoC0QHl4YPXMdRWDcFgE0Ujq54w+HGY/6t
	njfVTHNSLrxPiVO3aIkguFf91HfG6dy8HoW2IAV9weUcxmWzR54CAf20oHCYQSRuric7
	GVaImE38D7zcBNBgz7eB52d66qOTmlsLIZkAjNEhUZooKj3VEjI9qVnP8g7kGng9pwYu
	BYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Oc4fxrFVJZVdljEo5MuPUZw2nyq6dd9WLg6ree2dBPA=;
	b=WhHTlnD+VV/aDeZQtYwEK+FesVGhTddQaBDYB/rPcglBVPo9d9O0Libf1tgE436U4n
	iyVANDLi8yfqcfZ7PasKhTiYm1M8rWVeg1TfIC6/eAqam9OojhWxHeqg7DqHC3kOyCmx
	WOK3kl0zHHuCdYASf/u3F0ERdS+SAl/E7Ak9ampBa9ICoRR2/MP5WxMFs4x8+Ic8gsfZ
	vsxamKKDi3vvkVAmfRv0NzcBpudhdwvTUWR6wAw867fpjaeNAhzcIF2bcuSvelFEgYNy
	ZY1Cw+Ndzr1mIoBCFN6/px6kCPIiq9cpeJGPTCJjML+Tj9iyWseyrzjRgSYT+EGFF6+f
	cWWQ==
X-Gm-Message-State: AE9vXwMkkx8uynUVvknEtfqcZBk8RFNMpRYI3mIoelhe+obD/Ksga/P+wQStWptSVT0q5w==
X-Received: by 10.66.217.170 with SMTP id oz10mr42177418pac.61.1474238699507; 
	Sun, 18 Sep 2016 15:44:59 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:64bb:faf9:2b9d:369a])
	by smtp.gmail.com with ESMTPSA id
	an11sm26319723pac.26.2016.09.18.15.44.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Sep 2016 15:44:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun, 18 Sep 2016 15:44:42 -0700
Message-Id: <cover.1474238169.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/13] Jethro-next pull request
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
X-List-Received-Date: Sun, 18 Sep 2016 22:45:01 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these security and bug fixes for Jethro.

My krogoth-next stagging branch has a complimentary set for the security fixes.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next: 7a24bd8a38a2819965b8c1926d33042bd61d1f0b

The following changes since commit 6b732a392289a7bb50b0e3716c066c62fa32a14d:

  curl: security fix for CVE-2016-5420 (2016-09-02 08:48:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=akuster/jethro-next

Armin Kuster (8):
  openssl: Security fix CVE-2016-2177
  openssl: Security fix CVE-2016-2178
  bind: Security fix CVE-2016-2088
  git: Security fix CVE-2016-2315 CVE-2016-2324
  openssh: Security fix CVE-2016-6210
  openssh: Security fix CVE-2016-5615
  openssh: Security fix CVE-2015-8325
  wget: Security fix CVE-2016-4971

Ismo Puustinen (1):
  libpcre: Fix CVE-2016-3191

Ross Burton (1):
  openssl: add a patch to fix parallel builds

Yi Zhao (3):
  tiff: Security fix CVE-2016-3186
  tiff: Security fix CVE-2016-5321
  tiff: Security fix CVE-2016-5323

 .../bind/bind/CVE-2016-2088.patch                  | 216 ++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   1 +
 .../openssh/openssh/CVE-2015-8325.patch            |  33 +++
 .../openssh/openssh/CVE-2016-6210.patch            | 114 +++++++
 .../openssh/openssh/CVE-2016-6210_p2.patch         | 110 +++++++
 .../openssh/openssh/CVE-2016-6210_p3.patch         |  62 ++++
 .../openssh/openssh/CVE-2016-6515.patch            |  54 ++++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |   5 +
 .../openssl/openssl/CVE-2016-2177.patch            | 286 ++++++++++++++++++
 .../openssl/openssl/CVE-2016-2178.patch            |  51 ++++
 .../openssl/openssl/parallel.patch                 | 326 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   3 +
 .../git/git-2.5.0/CVE-2016-2315_2324.patch         | 307 +++++++++++++++++++
 .../git/git-2.5.0/CVE-2016-2315_p1.patch           | 115 ++++++++
 .../git/git-2.5.0/CVE-2016-2315_p2.patch           |  89 ++++++
 .../git/git-2.5.0/CVE-2016-2315_p3.patch           | 160 ++++++++++
 .../git/git-2.5.0/CVE-2016-2315_p4.patch           | 237 +++++++++++++++
 meta/recipes-devtools/git/git_2.5.0.bb             |   5 +
 .../recipes-extended/wget/wget/CVE-2016-4971.patch | 294 +++++++++++++++++++
 ...mping-and-continue-behaviour-with-ftp-pro.patch | 108 +++++++
 meta/recipes-extended/wget/wget_1.16.3.bb          |   2 +
 .../libtiff/files/CVE-2016-3186.patch              |  24 ++
 .../libtiff/files/CVE-2016-5321.patch              |  45 +++
 .../libtiff/files/CVE-2016-5323.patch              | 103 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |   3 +
 .../libpcre/libpcre/CVE-2016-3191.patch            | 174 +++++++++++
 meta/recipes-support/libpcre/libpcre_8.38.bb       |   1 +
 27 files changed, 2928 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210_p3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6515.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/parallel.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_2324.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p1.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p2.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p3.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p4.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2016-4971.patch
 create mode 100644 meta/recipes-extended/wget/wget/Fix-timestamping-and-continue-behaviour-with-ftp-pro.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch

-- 
2.7.4



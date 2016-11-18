Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E176719B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 03:25:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y68so12641760pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 19:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MNa7OyG6sHovRW+/XGHN/m0Xf3sAShHHHM/ATjh0YKA=;
	b=VoHpSuADoSU1e/bWCm93cmk386O6WRSHbIV+GboMhL7/JHDL9RkHwMt3q+PNAXFNXV
	mzvRlWrCF8c1kR83pwa+5tODXklq7vS5Bhq2DE7pi6802h3OrGAmWpqpAXSddWkOkcdb
	9XK6O3OZgkZseRQKVocEle0JstYtU91mTxt330YmCOIj+728KGO06kNk0cpahopXxJ8i
	oiVl5mOSs4gBr/2IBaAuZZMDY5e+6MlNX2qtms8X2CIp6RL9yAlOlijY/5cuAncgdnaO
	uDXoYsFdWCL3u12yF4NwbRA3egIm8vh9FHK9oMyv0Fta6DLnW3Y0DqmYiaUK68pZBM/h
	/P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MNa7OyG6sHovRW+/XGHN/m0Xf3sAShHHHM/ATjh0YKA=;
	b=I0Oybm4AvIFctBf4uAa4gznA+EBhT/Ez7KAIl9NlZ3Ol8r2obGGKjRy4wjTKxYyd26
	IbcO1aKAlZdrsMZyq3QJae2nsttMEZ0e7GdE6xpDFiyvTGT1J1RJxrExfaDjjFzQPvCn
	e82CWtjRxJ18EobD37w/Y06Js2gTvT38aLXFspjNAGjeGgUo/nF3WMWhw2roT9JKApiC
	wtMt4R0h5JKyx80pyf8DpC+BSHMdFN+uszj+JZKi9KXY82ZxtEceGX/DEA7s/c6GOsDw
	cxrTJrh7C/jPe/udrs08LFlcDL0zM/wOCGOmGtgVECpXWlX3Zcw3xHWE0mFbLFHilgWi
	DmNw==
X-Gm-Message-State: ABUngvcOTJuBbRTQ2wULmjQR2faofCdFylsix05vjryL5Ls6uc213SRBvPENwN9sGeE5xQ==
X-Received: by 10.99.251.5 with SMTP id o5mr4275100pgh.152.1479439505837;
	Thu, 17 Nov 2016 19:25:05 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:e516:3069:2e5f:dd9])
	by smtp.gmail.com with ESMTPSA id
	n25sm11851075pfi.33.2016.11.17.19.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 19:25:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 19:24:48 -0800
Message-Id: <cover.1479396619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/13] Pull request jethro-next
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
X-List-Received-Date: Fri, 18 Nov 2016 03:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these for jethro-next

The following changes since commit 820b835e3cbfefb1ed11faca95a67ef6f5475fb1:

  dev-manual: Fixed typo for "${INC_PR}.0" (2016-11-16 10:38:29 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/jethro-next

Armin Kuster (13):
  gnutils: Security fix CVE-2016-7444
  bind: Security fix CVE-2016-2775
  bind: Security fix CVE-2016-2776
  openssl: Security fix CVE-2016-2179
  openssl: Security fix CVE-2016-8610
  python-2.7: Security fix CVE-2016-0772
  python-2.7: Security fix CVE-2016-5636
  python-2.7: Security fix CVE-2016-5699
  python-2.7: Security fix CVE-2016-1000110
  tzcode-native: update to 2016h
  tzdata: Update to 2016h
  tzcode: update to 2016i
  tzdata: update to 2016i

 .../bind/bind/CVE-2016-2775.patch                  |  84 +++++++
 .../bind/bind/CVE-2016-2776.patch                  | 112 +++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   2 +
 .../openssl/openssl/CVE-2016-2179.patch            | 255 +++++++++++++++++++++
 .../openssl/openssl/CVE-2016-8610.patch            | 124 ++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   2 +
 .../python/python/CVE-2016-0772.patch              |  42 ++++
 .../python/python/CVE-2016-1000110.patch           | 145 ++++++++++++
 .../python/python/CVE-2016-5636.patch              |  42 ++++
 .../python/python/CVE-2016-5699.patch              | 162 +++++++++++++
 meta/recipes-devtools/python/python_2.7.9.bb       |   4 +
 ...code-native_2016g.bb => tzcode-native_2016i.bb} |   8 +-
 .../tzdata/{tzdata_2016g.bb => tzdata_2016i.bb}    |   4 +-
 .../gnutls/gnutls/CVE-2016-7444.patch              |  31 +++
 meta/recipes-support/gnutls/gnutls_3.3.17.1.bb     |   1 +
 15 files changed, 1012 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2016-0772.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2016-1000110.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2016-5636.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2016-5699.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016g.bb => tzcode-native_2016i.bb} (68%)
 rename meta/recipes-extended/tzdata/{tzdata_2016g.bb => tzdata_2016i.bb} (98%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch

-- 
2.3.5



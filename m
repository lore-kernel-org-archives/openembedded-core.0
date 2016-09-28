Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C351360557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 01:54:58 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q2so1437392pfj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=+8leORSUYxcNKma587TdozD8IXa2HfcuWcFlMfwNPVQ=;
	b=Wd7gGsAu7W3pY1+oX18ahJD0pDMVbEa+uqq7JL3hEFzEIKcs8UiBS6IZV1UQ3c1zVA
	avjQ+EkL5vFvnK6n0oe162JGiCQ0TCg7NsxFCuCeoeKWgtvKdRclWuQlvRuXn/LeInbz
	tFQEM0SHmndANd7R4VtcCV1OFeGamxJvbj6bae33+WOJ5ojD0qcRwuvB6jgsqe3PPvr0
	SpJ+kXUTdIFJ+8DNq9VikfPvAOWtQSq9jGBcyifChSpzrIfmKZnAkqYl6zcrlQG6Yja3
	i5N3kuWBLnf5Gx78ZAt07MCH7jBjmqHOw+Gd9zSp1h2QjX883D6IcvTF/QKCV7vQA8vn
	Y7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+8leORSUYxcNKma587TdozD8IXa2HfcuWcFlMfwNPVQ=;
	b=YI+gKzJTURLMun8m4gW1NePdVmHUn/fW+HKaMYykNxZI/lyUFlrMkkwRNXRokocU5A
	9vI+7tbNFpKD3LNtEdWR7ATe9pgDgUhyIzFq3KOF1iiootXmP3h9+rs1rIFYkIuv25ug
	yeZ2k6VW/WQ8QijtGSJXJRNZew5yySn7qWhzOZL0N2ed0BPWM4hfNFnS1sM8dBjTIgNx
	zUMbww2cy0f5JZzHE6qrtwShY0XLBhNcgTBDfweSVzkvtzK2i19HiKpWP8SteQnuI/Aj
	BubTSGEs9SI2tdRSByGFvX8RwolFnqZ3wOpfVvVqmrK5ihELr3YSzAt5lSfsyQpTfh72
	H5/w==
X-Gm-Message-State: AE9vXwMK0D3hi53YJVZse29JH3J9HXiTv8gHOV3lkEVCiFTQgxnFjqv9/71s31dnvUlvoQ==
X-Received: by 10.98.26.139 with SMTP id a133mr53165700pfa.167.1475027699901; 
	Tue, 27 Sep 2016 18:54:59 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	p73sm7641439pfk.60.2016.09.27.18.54.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Sep 2016 18:54:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 18:54:48 -0700
Message-Id: <cover.1475027575.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/9] jethro pull request v2
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
X-List-Received-Date: Wed, 28 Sep 2016 01:54:59 -0000

This fixes some typos in the commit message for the openssl fixes. 
Added timezone update.

The following changes since commit c9c85df86cd2270b144fa824ef76adedd3636c8a:

  util-linux: Security fix for CVE-2016-5011 (2016-09-23 23:21:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/jethro-next
  http://cgit.openembedded.org/cgit.cgi//log/?h=akuster/jethro-next

Armin Kuster (9):
  openssl: Security fix CVE-2016-2180
  openssl: Security fix CVE-2016-2181
  openssl: Security fix CVE-2016-2182
  openssl: Security fix CVE-2016-6302
  openssl: Security fix CVE-2016-6303
  openssl: Security fix CVE-2016-6304
  openssl: Security fix CVE-2016-6306
  tzdata: update to 2016f
  tzcode-native: update to 2016f

 .../openssl/openssl/CVE-2016-2180.patch            |  44 ++++
 .../openssl/openssl/CVE-2016-2181_p1.patch         |  91 ++++++++
 .../openssl/openssl/CVE-2016-2181_p2.patch         | 239 +++++++++++++++++++++
 .../openssl/openssl/CVE-2016-2181_p3.patch         |  30 +++
 .../openssl/openssl/CVE-2016-2182.patch            |  70 ++++++
 .../openssl/openssl/CVE-2016-6302.patch            |  53 +++++
 .../openssl/openssl/CVE-2016-6303.patch            |  36 ++++
 .../openssl/openssl/CVE-2016-6304.patch            |  75 +++++++
 .../openssl/openssl/CVE-2016-6306.patch            |  71 ++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   9 +
 ...code-native_2016e.bb => tzcode-native_2016f.bb} |   8 +-
 .../tzdata/{tzdata_2016e.bb => tzdata_2016f.bb}    |   4 +-
 12 files changed, 724 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016e.bb => tzcode-native_2016f.bb} (68%)
 rename meta/recipes-extended/tzdata/{tzdata_2016e.bb => tzdata_2016f.bb} (98%)

-- 
2.7.4



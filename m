Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id A34BD60167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 15:52:08 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id fb4so10939174wid.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Oct 2014 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=3DIFnKoSNXvb2RWcC72tm/FeCjs9iJ4TrPrRIBI0I+Q=;
	b=E6NXQhy9imIWNOoDsN2UQUb2/88uBJvpwF7gQ/aBfa437D45tGWZy4wBTAvdhdfT6f
	OKf8tSuz39+qUs7qMmqCiU8nJ3Z98MM0b65I5ekzjo9/KvhGdEGn28Xs+GFDXl9JAbZ2
	Pz6u2Ure44BluAS2qHsaCLQzVeImX0MRLsPQV2OBmYw7rnb+Tk3/yd57aGAClKxL472+
	TVlhGpb4kJoIxrTDVpXvWIn7y7TqrSBn1jBou4wqc7VyMsLxxybVNzBCeKo6AK+LXCPp
	GtRvCpMzufXLCq0ENfHOAWbD6XOHSvT4DUxo+snZPeGzH8EmR9eA3t+mhxnhBVJ4zcN4
	NFfw==
X-Received: by 10.180.94.163 with SMTP id dd3mr35582629wib.31.1412783529202;
	Wed, 08 Oct 2014 08:52:09 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id pk9sm527948wjb.16.2014.10.08.08.52.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Oct 2014 08:52:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Oct 2014 17:51:59 +0200
Message-Id: <1412783520-14196-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: systemd: make symlinks for gudev instead of moving around
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
X-List-Received-Date: Wed, 08 Oct 2014 15:52:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Moving libgudev was introduced in

commit 58c432b2725ad8b78d02cb91a6ab405d425c01cc
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Wed Sep 3 15:08:58 2014 +0800

    systemd: upgrade to 216

As mentioned in [1] it is breaking packages depending on libgudev due to 
libtool library (and pkg-config file either) pointing to wrong location.

Martin has already sent a fix removing gudev movement [2]. So it is up to decide:

* move of libgudev is not really required: use Martin's patch
* libgudev is required in ${rootlibdir}: use patch following (if accepted)

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098350.html
[2] http://lists.openembedded.org/pipermail/openembedded-core/2014-October/097713.html

Andreas Müller (1):
  systemd: systemd: make symlinks for gudev instead of moving around

 meta/recipes-core/systemd/systemd_216.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.8.3.1



Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id AEBB16E9BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:30:15 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id q8so3298276lbi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 01:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=BGjthHdyUu5H81ufQUzP4Hu8hG6mtI/eTp/q3RliHxA=;
	b=hjfePGaBCYFL/rOCa6y8UhXavwtxJLJ4ygYUTISUpBQzYScXlCYNNgD0Un8SrGfd3r
	IiGKDfU+WiiGdVtjbpH/BFk1oMKpHhl/yfGU9qqx3XVFobxJ7klCH51sC9g5yACodDpf
	aXNC/8R/DiKSffsuii6mlHaho6Rb8kSJKQhW6SY8FVCb4Ot5K+KLQs1mkOyw32xmcA7k
	DoG5/zhRy6Nfrq7m501Vmm00687/qM5Smwfc46175e/QU0lbjH8SbcbW9GCojURKDo3C
	VoSS+KQKw/HyPJhV8L8YPsBnhMC6xxAEKeIX0hMjvhcHXjTTdXB3h9LAu4UJJR69y1gE
	7sog==
X-Received: by 10.112.234.194 with SMTP id ug2mr24360lbc.86.1391160615934;
	Fri, 31 Jan 2014 01:30:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id rt7sm9529175lbb.0.2014.01.31.01.30.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 01:30:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 670391C601B; Fri, 31 Jan 2014 10:30:08 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 10:29:59 +0100
Message-Id: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCHv2 0/5] Final patches for SDK rootfs creation.
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
X-List-Received-Date: Fri, 31 Jan 2014 09:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this pathset, All postinstall dependencies from oe-core will be 
available in the nativeSDK tarball.

David Nyström (5):
  postinst-intercept: New recipe to include postinstall intercepts in
    nativesdk
  nativesdk-packagegroup-sdk-host: Adding nativesdk-postinst-intercept
    to SDK
  nspr: Added nativesdk to BBCLASSEXTEND
  nss: Add nativesdk to BBCLASSEXTEND and bugfix
  nativesdk-packagegroup-sdk-host: Add nativesdk-nss to default
    inclusion in host SDK

 .../packagegroups/nativesdk-packagegroup-sdk-host.bb  |  2 ++
 .../postinst-intercept/postinst-intercept_1.0.bb      | 19 +++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.10.2.bb              |  2 +-
 meta/recipes-support/nss/nss.inc                      | 11 ++++++++++-
 4 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb

-- 
1.8.3.2



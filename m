Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2126E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 00:52:42 +0000 (UTC)
Received: by iggf3 with SMTP id f3so1643366igg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 17:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pY9OKvCXKnuBDAcEUKBDUlDws7vDprN6bca3zUWzF64=;
	b=0ZH+ERPOPPtTvn3gDUcUZyFBapb/LNcg6Mgqd0LMlDUkm6yBa6//uIExR1v+XrjKDk
	4N+8fz3oCAn4Rwhpxm63yxXye/yFsxrCBRFCzHT5qjgfMETVlLH+MD6Ovhx15VHXfwL0
	Ko0JbtAtBngHYjdNYl8nh9OkJluUv44EQQ9/H91Aa9Io1NUvN/UoBHAUb7bDjEkOy8Q8
	dQFKD5dbXUVVbr6xgqzlx1ESz8Dre5DFSPsnv5xFIcsb4ZxmbGl8F9ierGW9xbFhHomh
	kYSSHWyqbxEx9FgRnXO+N3ZKwVIt3JuVqFC5sWas+2KTpYRGNaGhOX9oApe/BQwCnQp2
	P8TA==
X-Received: by 10.50.136.194 with SMTP id qc2mr576715igb.6.1438822362516;
	Wed, 05 Aug 2015 17:52:42 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x4sm3355789iod.26.2015.08.05.17.52.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 17:52:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:52:33 -0700
Message-Id: <1438822355-23346-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] libiconv_1.11.1 build, packaging and QA warning fixes
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
X-List-Received-Date: Thu, 06 Aug 2015 00:52:46 -0000

Andre McCurdy (2):
  libiconv_1.11.1: fix LICENSE declaration, LGPL -> LGPLv2.0
  libiconv_1.11.1: merge build and packaging fixes from libiconv_1.14.bb

 meta/recipes-support/libiconv/libiconv_1.11.1.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
1.9.1



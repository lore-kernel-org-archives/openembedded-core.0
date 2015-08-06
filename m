Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id ED759766D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 19:41:41 +0000 (UTC)
Received: by pawu10 with SMTP id u10so69914584paw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=f0Z0Dv1EdcTFUXI+zwEiBXDXiwofpMHNVIzJjKAq9AA=;
	b=BuniZ+h7EhdTOrHZHlB4vU7a9louKf4mNqsE84mnT5Q91dDOFobSnNhiUTtYGW8xBY
	S1lvywjM0aE1wtT/ce6roEFSt/a++9NAb/DW9hqShNlLG/afh8Qu3GxMpw4XImaDSu3/
	DkHp4NqYEwcqXFcqkDciLsG6sl3mOfPchecRbe00xhoam/HdQItIeUoHK+PFO0lMnuqi
	dGSDJTfT1gJZu1RvQa7Pp3jAgqnLhFJ3pJ5hTI/VorDuLzwZK++R2NA06jD6f0H4+1WU
	LVlzzYiZgA4nDFZ62akFeJ0O0/g+2lW7MrYIGb5yJEm3Tyc9B4ipqSJ4lsCgDfNItTAu
	v69g==
X-Received: by 10.66.220.5 with SMTP id ps5mr6596768pac.157.1438890101496;
	Thu, 06 Aug 2015 12:41:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	aw16sm7491315pac.29.2015.08.06.12.41.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 12:41:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 12:41:23 -0700
Message-Id: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] fix uclibc build with security_flags.inc
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
X-List-Received-Date: Thu, 06 Aug 2015 19:41:44 -0000

Andre McCurdy (3):
  uclibc.inc: remove unused UCLIBC_EXTRA_LDFLAGS
  security_flags.inc: clear SECURITY_CFLAGS for uclibc
  uclibc.inc: avoid immediate expansion for UCLIBC_EXTRA_CFLAGS

 meta/conf/distro/include/security_flags.inc | 2 ++
 meta/recipes-core/uclibc/uclibc.inc         | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.9.1



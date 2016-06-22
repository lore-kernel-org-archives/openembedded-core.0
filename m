Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id B01B373178
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:30:01 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id i123so18756665pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=NdOBv1wd67VkwC7bjvFFP192Kmvw0jLFoQlMpNXgAZs=;
	b=ekNLVZo+Thud66u2I+agy8kyInuahxwsEO04JHDFloAhTIKjTy1qX8BK+jSut+W9kY
	7sx2tVRsrASTZoVb1Ac2sJS3gWBbeElLKsoJvWG7z45/izKCrCqvXK6Owl32KmR/MBPD
	IU7cM112nJLWhh8/EZfCw2kAOrsMCyIoUw4BPLyoOTjsvpG5gz92m3Tq6lfOYWNIbSXw
	kBVFRFdVLu6pa2+y9KrAy3z3f7s+/D/w3oOwmOFp2DWQe3GH+DGuZb9m7ILRkot94OIx
	nttz6c7qrU1Rv8v3hxPCvvwB0aRODccU8qNvLWUtHJo4gCawfZ61BJYxZMwrw+piDk1j
	ljXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NdOBv1wd67VkwC7bjvFFP192Kmvw0jLFoQlMpNXgAZs=;
	b=XdrvtSDbgAnUbkkzG5PZLo/TfuqY5bE4WpiNdYS9gl458O5DGZCZlUvqQvjS0gbpgv
	dOV+aUv5AAZhKYmggxGmjCdlXVpYYyR82KVw7PTw4AmZ4exOVREMVcN1xvU1Fq4l4b6J
	XVKMxREjIDwPSKC8Wb5rSALtn3luc8xRc7Ys58nNhl73icRu4xmXQKfSN1Cmgt74d1Xn
	rjNKuTNLhC1y7pRJF1SRIbv+RznSB6x2fAiY76HQ+/r2JLvWaJEQsPOjn7l8Cf3TTlKa
	Z9K4eVTjed4MWZo6pVYCQxNZGMrp/F0JsQgBIsXRPg+tXuOPp97ToR5DmGssXa8KtH1L
	RYKQ==
X-Gm-Message-State: ALyK8tJtwuq06i+hWbJXia3EdQvQVzY296EPwWgr4ZSGAqLgYqV108/cy5HbNaCZAq5TPA==
X-Received: by 10.98.72.80 with SMTP id v77mr24698110pfa.133.1466609402105;
	Wed, 22 Jun 2016 08:30:02 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id qc16sm811450pab.1.2016.06.22.08.30.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Jun 2016 08:30:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Wed, 22 Jun 2016 08:29:56 -0700
Message-Id: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/2] Add gcc version and tclibc to build summary
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
X-List-Received-Date: Wed, 22 Jun 2016 15:30:01 -0000

Since there are two gcc versions supported and any number of tcglibc,
it would be nice to know which ones are being used.
Add those to the build summary.

Build summary
TCLIBC            = "glibc"
GCC_VERSION       = "6.1"

Not sure if the gcc version bit is best practice.

Armin Kuster (2):
  build summary: add gcc version being used.
  build summary: add TCLIBC being used

 meta/classes/base.bbclass | 2 ++
 meta/conf/bitbake.conf    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.3.5



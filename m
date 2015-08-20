Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6998D608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:04:17 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so32091271pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l3hmgS8qax+2KYm8Ubq53/wNbNrYRSQZjS3I/zfEvxo=;
	b=OW5/bVB9YLv+LhfwjWKKaDfMdkFZ6I/74w8Z2cVTU7V2giJTpRLPKq2vBQvoMoHDYS
	awAI+/32GEtjf+4b5/8cBzMuCAsRExfgTbC0iOn3dgrrY8hUQmTawLUOQvzXAlBINnJ0
	8m8NGArSyhlaAqyKAQiJpHXF0Ser834jWOiWFEYglW8udT30uNeNRIW0AvqqLIGJt7VN
	0rVEGSc2VoiTNGIG/Sw2r1H+5Ug3r1Wkd+ywNcX68xoZRo2i3hZauOyMRyNHJidW6cS5
	dlUlstwpiiY1cPHDgalRNIUEWJgQUg9Sun1DkMAZU0ZWjaoUMM1h0HOhbxKVSXo0cBW9
	HfGA==
X-Received: by 10.68.109.97 with SMTP id hr1mr10936187pbb.110.1440111858057;
	Thu, 20 Aug 2015 16:04:18 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	qc2sm5476585pbc.79.2015.08.20.16.04.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 16:04:17 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 16:04:47 -0700
Message-Id: <cover.1440111536.git.avery.brian@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [FIDO PATCH 0/1] toasterconf: remove master as a branch option from fido release
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
X-List-Received-Date: Thu, 20 Aug 2015 23:04:18 -0000

Toaster from FIDO can't reasonably be expected to be able to build master due to unforeseeable incompatibilities. This removes master branch as an option.

Alexandru DAMIAN (1):
  toasterconf: remove master for fido

 meta/conf/toasterconf.json | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

-- 
1.9.1



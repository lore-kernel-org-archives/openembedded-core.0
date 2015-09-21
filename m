Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id E887373CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 23:44:21 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so130056823pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=A9SCvzCbpRrXf9uc2McMONY+nTmKRM4cCzMatEP4UKU=;
	b=kuAB6mKtEOFHgR7e0Z8mMD3txLO93wT6UVEaqF/jUX7rOgfrRdJWgFEpZ0M70VjzIS
	k8SSSxi4aUFhuokmYt25tk89+OhOqRa4kKXyO1z37MnRx86esxuWoSWSUxgikC2GJKWH
	DPkF9x4WwQNn+/I9EhxNX0gO7Wc4bceCHxPZauP1JFTKlqW1MMZ9Ui6joxobHE53gWtX
	HfFOn5me/9I6Cmpzdrt5HqCEL6O0kfXmtyJVQjilGWcPRfmE6dj2bMSlyJraQwTccoGK
	nG8CZoup/lcRDAvsEA/QTAmv8PB6nOmVr90ezi/9sbVIZwW28hDnXVvegGrD6kopQAZy
	kRng==
X-Received: by 10.66.131.10 with SMTP id oi10mr27959227pab.87.1442879061571;
	Mon, 21 Sep 2015 16:44:21 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	qy5sm26655639pbb.16.2015.09.21.16.44.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Sep 2015 16:44:20 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 16:45:44 -0700
Message-Id: <cover.1442879015.git.avery.brian@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Create error recipe and error image, for testing
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
X-List-Received-Date: Mon, 21 Sep 2015 23:44:25 -0000

This provides an error recipe and an error image in meta-selftest.
It's initial target is for toaster selenium testing.

The following changes since commit 7b86c771c80d0759c2ca0e57c46c4c966f89c49e:

  bitbake: bitbake: bb.fetch2.git: Import errno module (2015-09-19 22:38:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/test/error-recipe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/test/error-recipe

brian avery (1):
  meta-selftest: add error recipe and error-image

 meta-selftest/recipes-test/error/error.bb        | 11 +++++++++++
 meta-selftest/recipes-test/images/error-image.bb |  8 ++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-selftest/recipes-test/error/error.bb
 create mode 100644 meta-selftest/recipes-test/images/error-image.bb

-- 
1.9.1



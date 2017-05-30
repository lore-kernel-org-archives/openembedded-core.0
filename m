Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB2B780C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 07:46:36 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id 99so44361710lfu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZCAZ2ZfdhN3m3ISH1h4nEx+zIyoH9WtgZSkuMk7123A=;
	b=n4yHrPVVO816qTMzdfXSGwqkrlXo/jYzE73Fjwi3Lxw9OmIxobqMeZ/8z9PYWacQX+
	hJpL+2enAAtC72dX2ivtPG5iE7/B5rfCTz14nR5LBZtWt0oWtAVQotbolTlM/gWVbEX/
	lywD+ObMRe+k/vU2S7ycpGjZZsghsbOJcSmS7HtYXJppaKoV+vKdLW7FTAt5Y9TwidKo
	YsZol1t6d/CezSdRi4Lfh7c/FB42WcyFL4CViCz8F3Cg38y5eBrOO7ip2rgGOqZICIkB
	dEBTF4wdu5SaV0ydFLWal0NBxe3MfmAMvSTDH5rdYQfPQa8m/TgRVpDmoifSnIo0yHnd
	REkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZCAZ2ZfdhN3m3ISH1h4nEx+zIyoH9WtgZSkuMk7123A=;
	b=Qmj6DLUHd5nhDo5JVwQm1Mqxx53maR+UD6vzmKK03EHZFi4+VhvWoqTgU2TBtVreXR
	ikeiz2ertDsxjtFRZjJFJC5ohsjI2rFm4p45JluCfrp/fRWTcsWfYn+oum8yms9zjMqH
	X7OSX52kUHhDaoRmujn/X4DP+wzrkMqdSEzPwW0WnSQ0gf00X5M+ylcNFo83dVLz+YAH
	saiXHD9S0gphlHKdtHBkQchJVXjCT0O1SNr3ch2H3W5AeaQOXASTNZDglXbEEEAAnkWb
	LI4Zf7ieKcC19J9IcyqLYZCYwjOPfDVOb8T9hKqhdJjRikbCOZFTNXV2l93k9XsgbhaX
	Igzw==
X-Gm-Message-State: AODbwcAlE3+5o6uz+02M34n3tokUzzpCbOpYRBgh1wXtqN5WOrMuvEuw
	eRSAHUjGSwrCsHSg2K9I3Q==
X-Received: by 10.25.18.84 with SMTP id h81mr4597651lfi.63.1496130397145;
	Tue, 30 May 2017 00:46:37 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	d10sm2481713lfb.38.2017.05.30.00.46.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 May 2017 00:46:36 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 09:46:21 +0200
Message-Id: <1496130382-852-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <8e87fb4b-6180-efdc-6f60-4e8ca6d5564c@mender.io>
References: <8e87fb4b-6180-efdc-6f60-4e8ca6d5564c@mender.io>
Subject: Re: do_image: Adding support for IMAGE_ROOTFS_EXCLUDE_PATH.
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
X-List-Received-Date: Tue, 30 May 2017 07:46:41 -0000


Updated the patch and included documentation.

It wasn't clear to me how to write a test for this. I couldn't spot any tests
for the surrounding variables, but I might be missing something. If this is
important, please let me know where I should add them.

-- 
Kristian


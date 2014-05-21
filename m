Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C9EA665EDC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 05:09:03 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so1015390pab.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 22:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2rg/5sBtWni8ei0zoVWZsoyS9Gv0W8/RsrhwW1By3YE=;
	b=RBBgkktFDG4EeB89k9TgysABdht9nYWkINKlF/Kj8xN2jzbdSW62RaOSgMH2Z30Jak
	XC6aEbkEgzngLFGgaqkqn6yUCBxkeD9OnYx3/q8ShkO0bQpBcD+kmoIb7zGN5JfUWxVj
	/VD+EE2Jiz8hs3OXq8wWRTx5zzmvdhvDw5ziXkfGwWwQA0ltfu+GKArL9JFImQ1qZw1B
	MO+nVAd8RFxe4Mwk/VafL4xEiIHuPdeFEPzpmoRVPrmIrowfog02GlevUvWhoGOzr32K
	CihxPvxrVkjLTuIrkdfVfCMQJDnrPuK54lvYJe5rfBCduSidDW1oAds265ZzagOyqVIt
	SykA==
X-Received: by 10.68.190.74 with SMTP id go10mr17091198pbc.16.1400647547355;
	Tue, 20 May 2014 21:45:47 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ck10sm99308401pac.0.2014.05.20.21.45.45 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 20 May 2014 21:45:46 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 May 2014 21:47:27 -0700
Message-Id: <1400647649-27570-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] Create ${CPAN_MIRROR} option
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
X-List-Received-Date: Wed, 21 May 2014 05:09:06 -0000

From: Tim Orling <TicoTimo@gmail.com>

* Perl modules are beginning to fail to fetch
* Default CPAN site seems to be flaky lately
* Add option to mirrors.bbclass to use metacpan.org
* Continue to use main CPAN site as default in bitbake.conf

Tim Orling (2):
  mirrors.bbclass: add ${CPAN_MIRROR} option
  bitbake.conf: add default ${CPAN_MIRROR}

 meta/classes/mirrors.bbclass | 2 ++
 meta/conf/bitbake.conf       | 1 +
 2 files changed, 3 insertions(+)

-- 
1.8.3.2



Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrANd-0001B0-O9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:12:09 +0200
Received: by bkcik5 with SMTP id ik5so444251bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=/K5sYt7dJsuVVvRzR6k6c2gM3zfRI6XEDj6rp9DYrSA=;
	b=KmYQg24ReygiKmWW1Q+e+dNhLpvSG1KiozUH7IMHowIqEX2I7y7k6STBa3wslio+p4
	V21nIdJASoID2sRrgHGTfR3DD7TOYwYofTPw1GdYMPWmvXGxVDllUhKS244P7yFbvgMm
	4yCzTQ9+WGyRKA24E1kBr7K/t2LXCHGTXsqRGpbrK/FHdJthKjZUsBHN0bxjbn/I9+xX
	LVlzNyjjhu9KjQ7SDFPlwrhic0PG70pRdURuuG/I6tjJEtYp/NhMurbu/jyxENwVjBcJ
	FOsbaZkVJJhiZGAUZP922NnsogXJfnaUXQLg/GZUPE22i4EKkkrl/VahIohfU91gO5b5
	lztA==
Received: by 10.205.119.210 with SMTP id fv18mr1614056bkc.10.1342540850088;
	Tue, 17 Jul 2012 09:00:50 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id hs2sm10324407bkc.1.2012.07.17.09.00.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:00:49 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:00:40 +0300
Message-Id: <cover.1342540673.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnNsP9Xd65m/vlOtvW3MiVVzuYBnXTtQCgfjMRDjnZW7krKsJGNobw6b58NlQMKYObUt/q/
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH V2 0/3] Update connman to v1.3, fix dependencies and runtime
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 16:12:09 -0000

Update connman to v1.3.
Fix dependencies needed for tests.
Add patches to fix runtime segfault on mips and ppc.

The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:

  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/connman1.3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/connman1.3

Andrei Gherzan (3):
  connman: Update to version 1.3
  connman.inc: Add missing dependencies needed by some tests
  connman: Add patches to fix connman on fs with no d_type support

 meta/recipes-connectivity/connman/connman.inc      |    4 +-
 ....c-If-there-is-no-d_type-support-use-stat.patch |   44 +++++++++++++++
 ....c-If-there-is-no-d_type-support-use-stat.patch |   56 ++++++++++++++++++++
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |   10 ++--
 4 files changed, 108 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (47%)

-- 
1.7.9.5




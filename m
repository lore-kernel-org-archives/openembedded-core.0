Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFtq0-0005g1-2s
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:03:24 +0200
Received: by wibhj13 with SMTP id hj13so22404wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 13:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=k+0s8h158d3M8IklN/u9tl7YnUXAv42MBluDh3LZUmk=;
	b=S4PEeCYwnXwG0hSz1cM67QFwq5eefgYIluisP7JbKsLWaBSS8BqeuX7CBjeZyWvKeG
	YpLPVDDwHus+gzKWx3JVc6BvzyUmYpDQqlIQcuSQY6sOI+jRsrOgE0lDzfNyFjFBimYT
	B6cjQwNrHaqrvE+2otjN4Qq4BAMeAfJNm6sjp4O98dnpiHhPASOorbLcSiBEZ9R7zDAL
	5jmMqbekYWIJ5Ufw6dd3Fqz34Tv5fwsSbdthnsZ4oZp/K0qObNJAMJDilDOcHSZbCYiI
	9dzgWTpCbMw3RXkLADQmqSX9Dff2KKscM9dt2HaUyUQJELt6oLH13Dg8dhVvCf3fBe4a
	bauA==
Received: by 10.216.132.216 with SMTP id o66mr2580670wei.14.1333659252005;
	Thu, 05 Apr 2012 13:54:12 -0700 (PDT)
Received: from localhost.localdomain ([79.115.103.32])
	by mx.google.com with ESMTPS id fn2sm612954wib.0.2012.04.05.13.54.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 13:54:10 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:54:03 +0300
Message-Id: <cover.1333659001.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkqYnIFBVel154RSvKoArm9mbZFiE3qSHU6iMegPgOa0QGiqJXCz57CD9JuDH6Mxh01MV4g
Subject: [PATCH 0/6] Add patches to compile some modules and to skip warnings about some other
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
X-List-Received-Date: Thu, 05 Apr 2012 21:03:24 -0000

The following changes since commit 5607729d9901c394b7cd4db6e38fe7fb19116f39:

  self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 17:17:55 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/pythonbug2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/pythonbug2

Andrei Gherzan (6):
  gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in
    include/gdbm
  python: Add patch for 64bit platform
  python: Add patch to search for db.h in inc_dirs and remove warning
  python: Add patch to avoid warning about bsddb module
  python: Add patch to avoid warning about _tkinter
  python: Add patch to avoid warning about sunaudiodev module

 .../python/python/avoid_warning_about_bsddb.patch  |   23 ++++++++
 .../python/avoid_warning_about_tkinter.patch       |   25 +++++++++
 .../avoid_warning_for_sunos_specific_module.patch  |   23 ++++++++
 .../python/check-if-target-is-64b-not-host.patch   |   57 ++++++++++++++++++++
 ...search_db_h_in_inc_dirs_and_avoid_warning.patch |   40 ++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    7 ++-
 meta/recipes-support/gdbm/gdbm_1.10.bb             |   13 ++++-
 7 files changed, 186 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_bsddb.patch
 create mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
 create mode 100644 meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch
 create mode 100644 meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
 create mode 100644 meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch

-- 
1.7.5.4




Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 018B270E61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Aug 2014 01:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310837"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:19 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:36 +0300
Message-Id: <cover.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/9] Fix for YB6538
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
X-List-Received-Date: Fri, 22 Aug 2014 08:49:38 -0000

The following changes since commit c1ee6cdfde5d1fe5f38a1e8eef5b7b0dd086df95:

  README: add required version for django-nvd3 (2014-03-06 13:43:30 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6538
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6538

Roxana Ciobanu (9):
  error-report: add 'Submitted on' column
  error-report: add 'Submitted on' detail
  error-report: add 'Submitter' column
  error-report: add 'Edit columns' menu
  jquery.cookie.js: add the Cookie Plugin
  error-report: remember state of the menu
  error-report: sort table by 'Submitted on' column
  error-report: add css customization
  error-report: add top 'Show rows' menu

 Post/createStatistics.py         |   4 +
 Post/getInfo.py                  |   3 +
 Post/parser.py                   |   3 +-
 Post/static/css/custom.css       |   8 ++
 Post/static/js/jquery.cookie.js  | 117 +++++++++++++++++++++++++
 Post/templatetags/__init__.py    |   0
 Post/templatetags/projecttags.py |  12 +++
 Post/views.py                    |  27 +++++-
 README                           |   2 +
 templates/base.html              |   2 +-
 templates/error-details.html     |   2 +
 templates/search-details.html    | 179 +++++++++++++++++++++++++++++++--------
 12 files changed, 322 insertions(+), 37 deletions(-)
 create mode 100644 Post/static/js/jquery.cookie.js
 create mode 100644 Post/templatetags/__init__.py
 create mode 100644 Post/templatetags/projecttags.py

-- 
1.9.1



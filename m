Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8E50D70E61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Aug 2014 01:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310860"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:28 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:39 +0300
Message-Id: <ba468b5c29a51c4fea5d1f18dc52dfdd6b4c27e8.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 3/9] error-report: add 'Submitter' column
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

Show the submitter in the search results page

[YOCTO #6538]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 templates/search-details.html | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/templates/search-details.html b/templates/search-details.html
index 3941a1f..b6c2b7e 100644
--- a/templates/search-details.html
+++ b/templates/search-details.html
@@ -27,6 +27,7 @@
 								<th>Host distro</th>
 								<th>Branch</th>
 								<th>Commit</th>
+								<th>Submitter</th>
 							</tr>
 						</thead>
 						<tbody>
@@ -49,6 +50,7 @@
 												{{ detail.BUILD.COMMIT|truncatechars:10}}
 											</div>
 						            </td>
+									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.NAME }} </a></td>
 								</tr>
 							 {%endfor%}
 						</tbody>
-- 
1.9.1



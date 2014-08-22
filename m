Return-Path: <roxana.ciobanu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 03C4C70F3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2014 01:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310939"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:38 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:45 +0300
Message-Id: <5e5231849afefff579cd7da5d4075fffe23d65ea.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 9/9] error-report: add top 'Show rows' menu
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
X-List-Received-Date: Fri, 22 Aug 2014 08:49:44 -0000

[YOCTO #6538]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 templates/search-details.html | 50 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/templates/search-details.html b/templates/search-details.html
index fb1f3c1..ca428d0 100644
--- a/templates/search-details.html
+++ b/templates/search-details.html
@@ -34,6 +34,49 @@
 				</div>
 				<div class="navbar">
 					<div class="navbar-inner">
+						<form class="form-inline pull-right">
+							{% if no > 10 %}
+								<label>Show rows:</label>
+										<select class="paginationLimit input-mini" onchange="javascript:window.open('{% url entry_args %}?items='+this.value+'&page={{ details.number }}&query={{ d }}', '_self')">
+										{% ifequal items "10" %}
+											<option selected="selected" value = "10">10</option>
+											<option value = "25">25</option>
+											<option value = "50">50</option>
+											<option value = "100">100</option>
+											<option value = "150">150</option>
+										{%endifequal%}
+										{% ifequal items "25"%}
+											<option value = "10">10</option>
+											<option selected="selected" value = "25">25</option>
+											<option value = "50">50</option>
+											<option value = "100">100</option>
+											<option value = "150">150</option>
+										{%endifequal%}
+										{% ifequal items "50"%}
+											<option value = "10">10</option>
+											<option value = "25">25</option>
+											<option selected="selected" value = "50">50</option>
+											<option value = "100">100</option>
+											<option value = "150">150</option>
+										{%endifequal%}
+										{% ifequal items "100"%}
+											<option value = "10">10</option>
+											<option value = "25">25</option>
+											<option value = "50">50</option>
+											<option selected="selected" value = "100">100</option>
+											<option value = "150">150</option>
+										{%endifequal%}
+										{% ifequal items "150"%}
+											<option value = "10">10</option>
+											<option value = "25">25</option>
+											<option value = "50">50</option>
+											<option value = "100">100</option>
+											<option selected="selected" value = "150">150</option>
+										{%endifequal%}
+										</select>
+						</form>
+						<span class="divider-vertical pull-right"></span>
+							{% endif %}
 						{% if tablecols %}
 							<div class="btn-group pull-right">
 								<button class="btn dropdown-toggle" data-toggle="dropdown">Edit columns
@@ -95,9 +138,9 @@
 						</tbody>
 					</table>
 						<div class="pagination pagination-centered">
+							<form class="form-inline pull-right">
 							{% if no > 10 %}
-							<div class="pull-right">
-								<span class="help-inline">Show rows:</span>
+							<label>Show rows:</label>
 									<form>
 										<select class="paginationLimit" style="margin-top:5px;margin-bottom:0px;width:60px;" onchange="javascript:window.open('{% url entry_args %}?items='+this.value+'&page={{ details.number }}&query={{ d }}', '_self')">
 											{% ifequal items "10" %}
@@ -137,8 +180,7 @@
 											{%endifequal%}
 										</select>
 									</form>
-								</span>
-							</div>
+							</form>
 							{% endif %}
 							 <ul>
 								{% if details.has_previous %}
-- 
1.9.1



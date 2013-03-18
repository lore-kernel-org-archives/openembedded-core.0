Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UHZQ3-0000TU-7D
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 13:44:03 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 18 Mar 2013 13:27:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 90B03288B02;
	Mon, 18 Mar 2013 13:27:14 +0100 (CET)
From: <maxin.john@enea.com>
To: <constantinx.musca@intel.com>, <radu.moisan@intel.com>,
	<sgw@linux.intel.com>, <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Mar 2013 13:26:43 +0100
Message-ID: <1363609608-11554-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org,
	"Maxin B. John" <maxin.john@enea.com>, dexuan.cui@intel.com
Subject: [PATCH 0/5] liburcu upgrade and removing COMPATIBLE_HOST check for lttng
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 12:44:03 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Latest version of liburcu supports MIPS architecture with this commit:
http://git.lttng.org/?p=userspace-rcu.git;a=commit;h=e1259cb17954e4e03954ba7376d3ed61649116cd

We can remove the COMPATIBLE_HOST checks present in babeltrace, lttng-ust,
lttng-tools and lttng-modules recipes after we upgrade to liburcu-0.7.6

Maxin B. John (5):
  liburcu: upgrade to 0.7.6
  babeltrace: remove the COMPATIBLE_HOST check
  lttng-ust: remove the COMPATIBLE_HOST check
  lttng-tools: remove the COMPATIBLE_HOST check
  lttng-modules: remove the COMPATIBLE_HOST check

 meta/recipes-kernel/lttng/babeltrace_1.0.0.bb    |    5 ----
 meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb |    5 ----
 meta/recipes-kernel/lttng/lttng-tools_2.1.0.bb   |    5 ----
 meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb     |    5 ----
 meta/recipes-support/liburcu/liburcu_0.7.4.bb    |   23 ----------------------
 meta/recipes-support/liburcu/liburcu_0.7.6.bb    |   19 ++++++++++++++++++
 6 files changed, 19 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu_0.7.4.bb
 create mode 100644 meta/recipes-support/liburcu/liburcu_0.7.6.bb

-- 
1.7.5.4




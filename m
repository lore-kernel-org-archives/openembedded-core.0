Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E1B8E784BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 08:24:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 01:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1162711497"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2017 01:24:07 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:24:21 +0800
Message-Id: <1502785464-89944-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/3] recipetool: bug fixes and enhancement
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
X-List-Received-Date: Tue, 15 Aug 2017 08:24:08 -0000

Hi,

This series of patches are bug fix implementation for 11389 and 11393.
These changes are crutial in terms of improving recipe creation in
recipetool. The recipe should at least buildable and able to find
SRCREV on specifc branch/ tag if it is not master.

This patch series is dependent on 2 patches on mailing list:-
recipetool: create: fix incorrect URL variable usage
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/140789.html

and

recipetool: create: disable PREMIRRORS and MIRRORS by default
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/140618.html

Thanks and best regards,
Rebecca

Chang Rebecca Swee Fun (1):
  recipetool: create: being able to set branch when revision is provided

Stanley Phoong (2):
  recipetool: create: handle git URLs specifying only a tag
  recipetool: create: replacing PV in SRCURI

 scripts/lib/recipetool/create.py | 73 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

-- 
2.7.4



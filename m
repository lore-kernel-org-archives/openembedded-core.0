Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 250AF7FB3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 01:18:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2019 17:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,345,1571727600"; d="scan'208";a="299536371"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2019 17:18:48 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Dec 2019 17:18:35 -0800
Message-Id: <20191223011837.4646-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [RFC][PATCH 0/2] buildtools-extended-tarball
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
X-List-Received-Date: Mon, 23 Dec 2019 01:18:48 -0000
Content-Transfer-Encoding: 8bit

As certain distros--such as CentOS7--age, we are increasingly fighting
for instance the ancient version of gcc on the host. As we look forward to
a plan to create an LTS release, we need to have a mechanism to continue
to build components 2+ years into the future. While this can be done with
containers (YOCTO #13643), a less invasive approach is to extend the
existing buildtools-tarball to also include gcc and other essential
tools.

The current work-in-progress adds the nativesdk equivalent of build-
essentials, but this has not been tested on the autobuilder yet and
tools provided by binutils, such as ar and ld, do not appear to be
properly symlinked in the resulting sdk.

If your organization cares about CentOS7 support, please test and
comment on this patch set.

The patches can also be found at:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/buildtools-13714

Tim Orling (2):
  nativesdk-buildtools-perl-dummy: add dependencies for autoconf and
    automake
  buildtools-extended-tarball: add recipe with build-essentials

 .../meta/buildtools-extended-tarball.bb       | 32 +++++++++++++++++++
 .../meta/nativesdk-buildtools-perl-dummy.bb   |  3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/meta/buildtools-extended-tarball.bb

-- 
2.20.1



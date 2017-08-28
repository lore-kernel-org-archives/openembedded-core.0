Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6667821B;
	Mon, 28 Aug 2017 15:25:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 08:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="142784056"
Received: from swold-mobl2.jf.intel.com ([10.255.74.240])
	by orsmga005.jf.intel.com with ESMTP; 28 Aug 2017 08:25:13 -0700
Message-ID: <1503933912.27472.227.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: OpenEmbedded List <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture@lists.openembedded.org
Date: Mon, 28 Aug 2017 08:25:12 -0700
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Usage of "elf" IMAGE_TYPES
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
X-List-Received-Date: Mon, 28 Aug 2017 15:25:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Folks,

I know it's late in our 2.4 cycle, but we recently discovered that
mkelfImage fails due to a recent upgrade to binutils. In doing some
research, mkelfimage was removed back in Oct 2014 from the coreboot
repo. It was replaced with cbfstool.

Unless I hear otherwise, I recommend that we mark elf Images as
deprecated for 2.4 and remove them in 2.5.

I have not yet dived into exactly what binutil change triggered the
failure.

Further thoughts?

Sau!



Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A66C07017D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 20:25:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Nov 2017 12:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,448,1505804400"; 
   d="scan'208";a="5532371"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2017 12:25:01 -0800
Date: Fri, 24 Nov 2017 14:34:25 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <20171124143425.2751a5e3@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <3c7c379d-44d8-162a-d941-a7d13ba48460@linaro.org>
References: <1511552846-1887-1-git-send-email-andrey.konovalov@linaro.org>
	<3c7c379d-44d8-162a-d941-a7d13ba48460@linaro.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH] weston: add patch to set pitch correctly for subsampled textures
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
X-List-Received-Date: Fri, 24 Nov 2017 20:25:00 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Nov 2017 22:58:20 +0300
Andrey Konovalov <andrey.konovalov@linaro.org> wrote:

> This exact patch also applies to pyro.
> Should I send the separate "[OE-core][pyro][PATCH] weston: add patch to set pitch correctly for subsampled textures" email,
> or just asking to merge it into pyro as well is enough?

better if you send another patch with that subject so the non-master maintainer can pick it up.


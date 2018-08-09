Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7951971985
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 15:54:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2018 08:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,215,1531810800"; d="scan'208";a="74074862"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.3.112])
	by orsmga003.jf.intel.com with ESMTP; 09 Aug 2018 08:54:39 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: <openembedded-core@lists.openembedded.org>
In-Reply-To: <20180718111747.54105-1-raphael.kubo.da.costa@intel.com> (Raphael
	Kubo da Costa's message of "Wed, 18 Jul 2018 13:17:47 +0200")
Organization: Intel Corporation
References: <20180718111747.54105-1-raphael.kubo.da.costa@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Thu, 09 Aug 2018 17:54:38 +0200
Message-ID: <874lg3h6wx.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [pyro][PATCH] gcc: Backport upstream r261799
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
X-List-Received-Date: Thu, 09 Aug 2018 15:54:39 -0000
Content-Type: text/plain

Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:

> The upstream commit merges several bug fixes into the GCC 6 branch; we are
> specifically interested in the fix for GCC bug 83623, which was causing
> Chromium 68+ to fail to build on ARM and aarch64 with
>
>     In file included from ../../third_party/skia/third_party/skcms/src/Transform.c:176:0:
>     ../../third_party/skia/third_party/skcms/src/Transform_inl.h: In function 'exec_ops':
>     ../../third_party/skia/third_party/skcms/src/Transform_inl.h:459:32: internal compiler error: in convert_move, at expr.c:299
>          v = (U16)( ((v<<8)|(v>>8)) & 0xffff );
>                   ~~~~~~~~~~~~~~~~~~^~~~~~~~~~
>
> Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>

Friendly ping. Is there anything else I'd need to go do get this into
pyro?


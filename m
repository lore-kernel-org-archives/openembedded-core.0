Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 082766FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 03:08:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 27 Dec 2016 19:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,420,1477983600"; d="scan'208";a="43903131"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga004.jf.intel.com with ESMTP; 27 Dec 2016 19:08:40 -0800
Message-ID: <1482894520.106950.47.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 27 Dec 2016 19:08:40 -0800
In-Reply-To: <374bb6a728f368a801f961fb524290f205bb4625.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<374bb6a728f368a801f961fb524290f205bb4625.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: naresh.bhat@linaro.org, meta-luv <luv@lists.01.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/9] iasl: move from meta-luv to OE-core
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
X-List-Received-Date: Wed, 28 Dec 2016 03:08:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> From: meta-luv <luv@lists.01.org>
> 
> This is an unmodified copy of
> github.com/01org/luv-yocto/meta-luv/recipes-extended/iasl revision
> 4be4329.
> 
> iasl is also provided by the meta-oe layer's acpica recipe. iasl is a
> bit simpler and thus seems more suitable for OE-core.
> 
> When the meta-oe layer is active, PREFERRED_PROVIDER_iasl-native must
> be set to avoid a warning. It can be set to "acpica-native" when
> something from acpica besides just iasl is needed.

It would be worth pondering whether to use this recipe or the one that
Fathi Boudra maintains.



Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 725DB7002B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 03:17:55 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 27 Dec 2016 19:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,420,1477983600"; d="scan'208";a="47313391"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by fmsmga005.fm.intel.com with ESMTP; 27 Dec 2016 19:17:56 -0800
Message-ID: <1482895076.106950.50.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 27 Dec 2016 19:17:56 -0800
In-Reply-To: <3b1fda1a385e78c1ef5692b123fafd66078a2a5e.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<3b1fda1a385e78c1ef5692b123fafd66078a2a5e.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] ovmf_git.bb: enable parallel compilation
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
X-List-Received-Date: Wed, 28 Dec 2016 03:17:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> The Fedora srpm [1] seems to have no problems with parallel
> compilation, so let's also use that for the target. The native
> tools however indeed have dependency problems:

True. It is good to paralize what we can. This also looks good to me.





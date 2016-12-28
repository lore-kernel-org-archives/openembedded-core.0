Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACB76FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 02:58:09 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 27 Dec 2016 18:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,420,1477983600"; d="scan'208";a="43901573"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga004.jf.intel.com with ESMTP; 27 Dec 2016 18:58:10 -0800
Message-ID: <1482893890.106950.43.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 27 Dec 2016 18:58:10 -0800
In-Reply-To: <dcef684cc3818883cc4a4787396cb79d86379c84.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<dcef684cc3818883cc4a4787396cb79d86379c84.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: meta-luv <luv@lists.01.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/9] ovmf: move from meta-luv to OE-core
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
X-List-Received-Date: Wed, 28 Dec 2016 02:58:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
>  create mode 100644
> meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch

We added this patch because we were interested in enabling BGRT for our
own Linux kernel testing purposes. I am not sure if this patch is of the
interest of the wider OE-core audience. I would think it does not.



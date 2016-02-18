Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A78287317D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 13:22:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2016 05:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,465,1449561600"; d="scan'208";a="906002437"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2016 05:22:17 -0800
To: openembedded-core@lists.openembedded.org
References: <5174C2003D56485DACF46FA90CEFE553@RD3>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56C5C4DE.6040003@linux.intel.com>
Date: Thu, 18 Feb 2016 15:19:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <5174C2003D56485DACF46FA90CEFE553@RD3>
Subject: Re: Error building core-image-sato
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
X-List-Received-Date: Thu, 18 Feb 2016 13:22:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2016 07:02 AM, winiston@futuraautomation.com wrote:

> NOTE: Runtime target 'xf86-input-tslib' is unbuildable, removing...

The recipe is in meta-openembedded/meta-oe layer, not in oe-core. You 
should probably try to build it in isolation and figure out why it 
doesn't build.


Alex



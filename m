Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC716FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:18:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 03 Nov 2016 01:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,585,1473145200"; d="scan'208";a="26931926"
Received: from mdonthir-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.161])
	by orsmga005.jf.intel.com with ESMTP; 03 Nov 2016 01:18:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Nov 2016 21:18:03 +1300
Message-ID: <1509534.FlCVrqxQCM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.9-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <db66dad07cfa38a56436a7df05ce4ff0e3c91e90.1478141595.git.paul.eggleton@linux.intel.com>
References: <cover.1478141595.git.paul.eggleton@linux.intel.com>
	<db66dad07cfa38a56436a7df05ce4ff0e3c91e90.1478141595.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] devtool: update-recipe: decode output before treating it as a string
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
X-List-Received-Date: Thu, 03 Nov 2016 08:18:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 03 Nov 2016 15:53:53 Paul Eggleton wrote:
> When you receive output from subprocess, with Python 3 it's a stream of
> bytes so you need to decode it before you can start treating it as a
> string.
> 
> Fixes [YOCTO #10447].

Oops, that should have been 10563. I've corrected the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


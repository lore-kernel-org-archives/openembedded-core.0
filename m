Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CB86977CCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:56:38 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2017 13:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,359,1503385200"; d="scan'208";a="137196709"
Received: from ylee17-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.148.38])
	by orsmga004.jf.intel.com with ESMTP; 10 Oct 2017 13:56:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Pascal Bach <pascal.bach@siemens.com>
Date: Wed, 11 Oct 2017 09:56:21 +1300
Message-ID: <4077545.9283kxmC9p@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1493825320-356-1-git-send-email-pascal.bach@siemens.com>
References: <1493825320-356-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: allow override of image LICENSE
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
X-List-Received-Date: Tue, 10 Oct 2017 20:56:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Pascal,

On Thursday, 4 May 2017 3:28:40 AM NZDT Pascal Bach wrote:
> Currently the LICENSE of every image is hard set to MIT.
> This allows this to be overriden in derived images.

Sorry to dredge this up, but when do you see the need to specify a different 
image LICENSE? 

Logically, an image recipe's LICENSE can only refer to the recipe itself and 
whatever files might be pulled in by it directly (usually none, but some 
people re-enable do_fetch and do_unpack to allow this), since otherwise the 
contents of the image are covered by the licenses of all of the recipes that 
build the packages that go into it, and we already assemble a license manifest 
for the image to cover those. Does that match your interpretation?

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F13B677D03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491905735; x=1523441735;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=uTclKJq8bGIe9jJ4Mw4Y3MZEOu1dHekUgyH1SzEAW/w=;
	b=p55FA+5WRrQuTHR8+DP6nGpLzxW+tS7iKbSgHg9PUC3jMReVEj3jdfA6
	GbJCTkcpF8yQHAU4teCBIiUEtRpS0g==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 03:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="247186001"
Received: from lheah-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.133.64])
	by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2017 03:15:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 11 Apr 2017 22:15:30 +1200
Message-ID: <1636904.5z37o6m8AP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20170411092243.12262-1-alexander.kanavin@linux.intel.com>
References: <20170411092243.12262-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsolv: correctly attribute musl fixing patches
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
X-List-Received-Date: Tue, 11 Apr 2017 10:15:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 11 April 2017 9:22:43 PM NZST Alexander Kanavin wrote:
> Also, they were previously squashed into a single patch; restore
> the original two-patch arrangement.

Didn't Mark H just send a patch to fix this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


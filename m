Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8085177D08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491906350; x=1523442350;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=mZP9Iik4Yq1i6+c4gdE3R1B6WB3e/DFx8B8Z4sx/l5c=;
	b=Wx7Di4LbopyOYInYp+8rYQj84sfOjbyg9gJz1AMLYIJNWik9+r6BnE60
	RqVQdcXpVcKZ5PNdiuIULYX3/eMLNQ==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 03:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="86019163"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 11 Apr 2017 03:25:48 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <20170411092243.12262-1-alexander.kanavin@linux.intel.com>
	<1636904.5z37o6m8AP@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8c478a3d-e1cd-d46f-a5d3-434492520342@linux.intel.com>
Date: Tue, 11 Apr 2017 13:25:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1636904.5z37o6m8AP@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 11 Apr 2017 10:25:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2017 01:15 PM, Paul Eggleton wrote:
> On Tuesday, 11 April 2017 9:22:43 PM NZST Alexander Kanavin wrote:
>> Also, they were previously squashed into a single patch; restore
>> the original two-patch arrangement.
>
> Didn't Mark H just send a patch to fix this?

Mark's patch incorrectly changes the recipe patch so that it doesn't 
apply to upstream source anymore (the stuff in CMakeLists.txt, I think).


Alex



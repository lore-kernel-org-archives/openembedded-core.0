Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 175D971A8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 15:15:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 08:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="966851575"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 May 2017 08:15:41 -0700
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
Date: Wed, 10 May 2017 18:15:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 15:15:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 06:02 PM, Davis, Michael wrote:
> Won't this cause a lot of issues for those of us that require FIPS?
> I don't think 1.1 is expected to get FIPS support for some time.

https://www.openssl.org/blog/blog/2016/07/20/fips/#comment-3277656289
"There's been a delay on starting due to a priority focus on finishing 
the TLS 1.3 implementation; we're still waiting on a final TLS 1.3 spec.

Schedule estimates are difficult, not only because we haven't actually 
started yet but because the FIPS 140 validation process is notoriously 
unpredictable. Based on the first five open source based validations I 
would be surprised to see a final approved validation in less than two 
years after we start, but my prognostications have been wrong before."


Would you be okay with staying on yocto 2.3 release until this is 
resolved? Otherwise, this can be delayed somewhat, but "we haven't 
started yet; we have no idea how long it's gonna take; probably two 
years or more" does not seem like a reasonable ask. There are other 
users of oe-core, who do not care about FIPS, and at the same time do 
want to have 1.1.

Alex



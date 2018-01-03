Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 18EAC6E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 08:48:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 00:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,500,1508828400"; 
   d="scan'208";a="7051435"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2018 00:48:17 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180102200049.44793-1-jslater@windriver.com>
	<1514933138.5525.101.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e3528177-a042-0ac5-2a06-6cb9b279fd89@linux.intel.com>
Date: Wed, 3 Jan 2018 10:43:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1514933138.5525.101.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] allarch: do not set baselib
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
X-List-Received-Date: Wed, 03 Jan 2018 08:48:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/03/2018 12:45 AM, Richard Purdie wrote:
> Sorry, but I don't think this can work :/.
> 
> Do the sstate sig selftests pass with this change?
> 
> I appreciate this will make some things "work" but it will mean that
> allarch packages rebuild for each architecture or multilib and that
> isn't right either.
> 
> So we need a better solution here. Why do we need libdir paths to run
> binaries anyway? Is this a libexec issue? Perhaps the things in
> question shouldn't be allarch?

I think Ross has spent some time developing a fix for this same issue, 
perhaps he can chime in?

Alex


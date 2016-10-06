Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2ABAD71A84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 02:44:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Oct 2016 19:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,451,1473145200"; d="scan'208";a="1050078046"
Received: from gdhillon-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.169])
	by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2016 19:44:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Tan, Raymond" <raymond.tan@intel.com>
Date: Thu, 06 Oct 2016 15:44:25 +1300
Message-ID: <2516668.4mzeNKWul5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
MIME-Version: 1.0
Cc: "Gupta, Rahul KumarXX" <rahul.kumarxx.gupta@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: openssl: OpenSSL 1.1.x update
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
X-List-Received-Date: Thu, 06 Oct 2016 02:44:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Raymond,

On Thu, 06 Oct 2016 02:11:59 Tan, Raymond wrote:
> Greetings, I would like to know if there is any plan / schedule to upgrade
> to openssl 1.1.0 into OE-core?

I am not aware of any discussion about this (and my answer shouldn't be 
considered authoritative), however it does look like upgrading to 1.1.0 will 
result in compatibility issues with code that links to OpenSSL, thus I expect 
we would need to evaluate the impact of doing so. In any event we are in 
milestone 4 of the 2.2 release in which as a general rule we do not do version 
upgrades except when absolutely necessary, so the earliest we would look at 
this would be for 2.3.

Note that for 2.2 we have kept up-to-date with OpenSSL releases on the 1.0.2 
branch to date as the risk of compatibility problems across upgrades there is 
significantly lower.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


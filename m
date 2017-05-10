Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E9FCB60107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:34:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 12:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="85259117"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2017 12:34:05 -0700
To: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
Date: Wed, 10 May 2017 22:34:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
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
X-List-Received-Date: Wed, 10 May 2017 19:34:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 09:56 PM, Gary Thomas wrote:
> Why not do this in a "softer" way - make the new 1.1 package have the
> obscured name (and not be preferred by default)?  That way existing
> uses of the older 1.0 package can continue but users can migrate to
> 1.1 as they see fit?

I have an answer which you might not particularly like. But here goes:

What will actually happen is that no one will do anything to port their 
stuff until it's time to remove 1.0 because upstream has EOLd it. And 
then there'll still be complaints that more time is needed for the 
transition. I'd like to gently push people to plan this transition 
already now - and it's as gentle as it can be: if you pull from master 
and your things no longer build, make one simple change and they will. 
It's part and parcel of being on the bleeding edge, or rebasing to the 
new yocto release: not everything works exactly as before, and most 
components are newer and different and not always fully compatible.

The other reason is that it's more work for me: I would have to update 
everything in oe-core to use the new recipe, instead of fixing just a 
few recipes that need to stay with 1.0. And then again the same thing 
will happen when 1.2 is out.

Alex


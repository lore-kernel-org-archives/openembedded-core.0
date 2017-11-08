Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F39BE71BE5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 13:09:41 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2017 05:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,364,1505804400"; d="scan'208";a="173688660"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 08 Nov 2017 05:09:41 -0800
To: Paul Eggleton <paul.eggleton@intel.com>
References: <499138bd-32cc-1487-e36e-fc4e5aceb4b2@linux.intel.com>
	<14953303.KfuyF98Oh2@peggleto-mobl.ger.corp.intel.com>
	<a01ffbee-b133-0481-9836-11239fad8294@linux.intel.com>
	<2194500.PL2B6VVPY9@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dbfc55d1-aac9-e1e6-c440-7d0e3bae60a0@linux.intel.com>
Date: Wed, 8 Nov 2017 15:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <2194500.PL2B6VVPY9@peggleto-mobl.ger.corp.intel.com>
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: automatic recipe upgrades - making them better and sweeter
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
X-List-Received-Date: Wed, 08 Nov 2017 13:09:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/07/2017 10:17 PM, Paul Eggleton wrote:

> So there is a method to this madness, but it's less about your use case than
> it is people making customisations that they are best advised to put somewhere
> else - I'm trying to make the user think about where the changes should go
> beforehand, because the nature of devtool finish is that you can't easily go
> back and shift the changes elsewhere after you've run it. It would be trivial
> to add an option that put the recipe back where it came from without you
> having to be explicit though, so we could add that; potentially we could have
> a configuration option to make that the default for you and others who more
> commonly update the base metadata. Otherwise, I'm open to alternative
> suggestions, but preferably I still want to avoid making it easy for users to
> make a mistake and update the original metadata when they really should have
> pointed it at their own layer.

That's fine with me. Unlike specifying version/revision on the command 
line (which at the moment need to be manually determined, and change 
every time), the layer destination is more or less static and can be 
hardcoded in a wrapper (or finger memory).

Alex


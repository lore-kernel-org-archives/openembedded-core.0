Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C46760670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 12:02:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2015 03:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,743,1413270000"; d="scan'208";a="660453605"
Received: from fcrouzet-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.81])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2015 04:02:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 12 Jan 2015 12:02:33 +0000
Message-ID: <4820854.OTUYMMuQ9m@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1501080549270.20648@localhost>
References: <alpine.LFD.2.11.1501080549270.20648@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what are all the recipe reserved suffixes?
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
X-List-Received-Date: Mon, 12 Jan 2015 12:02:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Thursday 08 January 2015 05:52:40 Robert P. J. Day wrote:
>   current YP dev manual advises to not create recipe names with
> reserved suffixes -native, -cross, -initial or -dev. 

That's not quite what it says, it says don't use them unless they apply for 
the recipe (and that's really only applicable to -native, -cross and -
initial). Strictly speaking I wouldn't really describe these as "reserved" 
since that would suggest you could never use them.

> i already know i should add -ptest to that list, what is the full list of
> reserved suffixes so i can make sure the dev manual is accurate? thanks.

I think the answer is probably to think twice before using anything in the 
default value of PACKAGES unless it makes sense (i.e. your recipe matches with 
the purpose of the naming convention).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


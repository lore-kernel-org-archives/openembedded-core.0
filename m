Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F692605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 23:10:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2015 15:10:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,410,1444719600"; d="scan'208";a="871227362"
Received: from exxie-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.26])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2015 15:10:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 11 Dec 2015 12:10:06 +1300
Message-ID: <4228975.a0v1780AQk@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <20151210183720.GO2246@jama>
References: <1449772407-30369-1-git-send-email-armccurdy@gmail.com>
	<20151210183720.GO2246@jama>
MIME-Version: 1.0
Subject: Re: [PATCH] documentation.conf: document PREFERRED_VERSION wildcard limitations
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
X-List-Received-Date: Thu, 10 Dec 2015 23:10:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 10 Dec 2015 19:37:20 Martin Jansa wrote:
> On Thu, Dec 10, 2015 at 10:33:27AM -0800, Andre McCurdy wrote:
> > PREFERRED_VERSION values containing the '%' wildcard should only be
> > used when the wildcard pattern is known to only match one available
> > 
> > recipe. See longer explanation in:
> >   http://comments.gmane.org/gmane.comp.sysutils.bitbake.devel/1038
> 
> Thanks

Note that documentation.conf is not intended for notes like this. There are 
far too many caveats to using our variables than can be reasonably covered by 
the short descriptions that go into this file - we have a reference manual with 
a detailed variable glossary for that sort of thing. We need to update the 
manual instead.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


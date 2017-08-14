Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A167C783B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 13:23:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 06:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,373,1498546800"; d="scan'208";a="123384297"
Received: from mlehtone-mac02.fi.intel.com (HELO [10.237.66.45])
	([10.237.66.45])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2017 06:23:42 -0700
User-Agent: Microsoft-MacOutlook/f.20.0.170309
Date: Mon, 14 Aug 2017 16:23:41 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <613E1CA3-F24E-4866-8BE7-F60DDD56D32C@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2 7/7] dnf: expand dnf selftest to test signed
	package feeds
References: <cover.1502465021.git.markus.lehtonen@linux.intel.com>
	<04a99644f879ebd4539f3819d4c641ac1c51ba89.1502465021.git.markus.lehtonen@linux.intel.com>
	<fd3f230d-e551-a44d-0a8c-b66750f5023c@linux.intel.com>
In-Reply-To: <fd3f230d-e551-a44d-0a8c-b66750f5023c@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH v2 7/7] dnf: expand dnf selftest to test signed package feeds
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
X-List-Received-Date: Mon, 14 Aug 2017 13:23:42 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 14/08/2017, 14.16, "Alexander Kanavin" <alexander.kanavin@linux.intel.com> wrote:

    On 08/11/2017 06:35 PM, Markus Lehtonen wrote:
    >   
    >           import re
    > -        output_makecache = self.dnf('makecache')
    > +        output_makecache = self.dnf('-y makecache')
    
    Why add '-y'? Can you add a comment (just prior to this line) explaining 
    what question dnf is asking?

Dnf is asking whether to import the new key.

    
    > +        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
    >           self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
    >   
    >           output_repoinfo = self.dnf('repoinfo')
    
    Do 'makecache' or 'repoinfo' print any indication that repo signing is 
    in use and working correctly? Can you check for presence of that in the 
    commands' output?

No


Thanks,
   Markus 




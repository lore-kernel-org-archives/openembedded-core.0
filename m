Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E0894719DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 09:19:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2017 01:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="209893510"
Received: from mjtierna-mobl4.ger.corp.intel.com (HELO [10.252.21.200])
	([10.252.21.200])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jan 2017 01:18:59 -0800
User-Agent: Microsoft-MacOutlook/14.7.1.161129
Date: Thu, 05 Jan 2017 11:19:03 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <D493DC27.6E783%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/8] oeqa.utils.metadata: drop 'unknown' git
	data elements
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1482930164-15721-4-git-send-email-markus.lehtonen@linux.intel.com>
	<edb7398f-c7f9-8ec4-daf5-c5c350c0d671@linux.intel.com>
In-Reply-To: <edb7398f-c7f9-8ec4-daf5-c5c350c0d671@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH 3/8] oeqa.utils.metadata: drop 'unknown' git data elements
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
X-List-Received-Date: Thu, 05 Jan 2017 09:19:02 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 04/01/2017, 17.30, "Mariano Lopez" <mariano.lopez@linux.intel.com>
wrote:
>On 28/12/16 07:02, Markus Lehtonen wrote:
>> It's better just to not have the xml elements than to have elements with
>> faux data. One could have git branch named 'unknown', for example.
>>
>>
>
>I don't think is a good idea to completely remove the layer from the
>metadata when such layer is not a repository, it would remove valuable
>information for later analysis. And if you ask would do such a thing, I
>would, I have my own debug layers that can mess with testing.

I'm not removing the entire layer. I'm just removing the
<branch>unknown</branch> and <revisio>unknown</revision> elements. So the
layer elements are still there.

Thanks,
   Markus




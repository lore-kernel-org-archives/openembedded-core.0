Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2397808C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 15:43:44 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 12 Jul 2017 08:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,350,1496127600"; d="scan'208";a="125729358"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2017 08:43:44 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<1e9c0f3ee67bdcb9a810c1a3e0bdb31a283a6c0c.1499803885.git.anibal.limon@linux.intel.com>
	<1499842297.20211.103.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <7127c3cb-ce85-e682-2aab-2f20615ca027@linux.intel.com>
Date: Wed, 12 Jul 2017 10:44:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1499842297.20211.103.camel@intel.com>
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/30] selftest/cases/package: Call parent setUpClass method
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
X-List-Received-Date: Wed, 12 Jul 2017 15:43:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/12/2017 01:51 AM, Patrick Ohly wrote:
> On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
>>      def setUpClass(cls):
>> +        super(VersionOrdering, cls).setUpClass()
>> +
> 
> In Python3 one can simply use super().setUpClass().
> 
> Not sure whether that's worth a V2 by itself. There's also plenty of
> other code outside of this patch which could be simplified like this.

Yes may be is better to send a patch changing all the cases to the new
py3 form.

Anibal

> 


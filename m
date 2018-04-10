Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1349744C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:45:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 05:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,432,1517904000"; d="scan'208";a="42179849"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 Apr 2018 05:45:23 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
	<20180410124338.GA1343@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a9c4058e-e33b-8c31-6cd7-915dcaa11437@linux.intel.com>
Date: Tue, 10 Apr 2018 15:39:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180410124338.GA1343@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/5] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 10 Apr 2018 12:45:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/10/2018 03:43 PM, Martin Jansa wrote:
> On Tue, Apr 10, 2018 at 03:07:43PM +0300, Alexander Kanavin wrote:
>> Openssl 1.0 can still be utilized by depending on 'openssl10' recipe.
> 
> Does this really work now?
> 
> I think it will fail again when both openssl versions end up in RSS.

The only known case where this happened was Qt5 (because it also wanted 
python), and Qt5 gained openssl 1.1 support in the latest released version.

Alex


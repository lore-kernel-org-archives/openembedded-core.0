Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6DF6FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 15:31:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jul 2017 08:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,354,1496127600"; d="scan'208";a="1151207844"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2017 08:31:37 -0700
To: Christopher Larson <kergoth@gmail.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
	<3c793129b4cc43b00dcd1028ab04abb8ca72a9a9.1499887935.git.anibal.limon@linux.intel.com>
	<CABcZAN=o5vUm-O=6BOZCxVNaSaOzg5JOLrtxmJZD1UV+7t=x_w@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <6015b8a5-381e-091b-99be-485dd8261d45@linux.intel.com>
Date: Thu, 13 Jul 2017 10:32:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=o5vUm-O=6BOZCxVNaSaOzg5JOLrtxmJZD1UV+7t=x_w@mail.gmail.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 04/29] bb/tinfoil: run_command handle busy status in bitbake server
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
X-List-Received-Date: Thu, 13 Jul 2017 15:31:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/13/2017 10:20 AM, Christopher Larson wrote:
> On Wed, Jul 12, 2017 at 12:36 PM, Aníbal Limón <anibal.limon@linux.intel.com
>> wrote:
> 
>> When tinfoil request a command to bitbake is handled in async
>> manner [1], sometimes is this ends on return a Busy status.
>>
>> This is a workaround a needs to be fixed in proper manner
>> inside bitbake code.
>>
> 
> I’m assuming you verified this doesn’t cause issues with synchronous
> commands? Not all commands are async, after all, but the comment in your
> retry logic acts like they are.

Yes, this a workaround, and now only is applied to clientComplete
command that is async, we need to review the bitbake code and make the
proper fix.

This patch could be removed for the integration.

Cheers,
Anibal

> 


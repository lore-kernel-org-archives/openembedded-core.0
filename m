Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2021E7FA8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 21:31:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 14:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="189738819"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga007.jf.intel.com with ESMTP; 28 Oct 2019 14:31:13 -0700
To: openembedded-core@lists.openembedded.org
References: <20191022235935.19461-1-nick.owens@eero.com>
	<20191023175939.14612-1-nick.owens@eero.com>
	<20191023175939.14612-2-nick.owens@eero.com>
	<600949430430d26d2c62d0e5c99868b2752978a0.camel@linuxfoundation.org>
	<CAFQxptWDXReMxPvH4a2y5BiHqquhOhdFnNUpHgFFyU+3FaMjtg@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ea2e47f6-9ca3-338e-adc1-95583b1b590e@intel.com>
Date: Mon, 28 Oct 2019 21:31:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFQxptWDXReMxPvH4a2y5BiHqquhOhdFnNUpHgFFyU+3FaMjtg@mail.gmail.com>
Subject: Re: [PATCH] distutils: pass along parallel make flags to setup.py build
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
X-List-Received-Date: Mon, 28 Oct 2019 21:31:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 24/10/2019 19:25, Nick Owens wrote:
> i see, it looks like i should apply this to distutils3.bbclass and not 
> distutils.bbclass, since python2 never got support for --parallel. does 
> that seem right?

Yes.

Ross



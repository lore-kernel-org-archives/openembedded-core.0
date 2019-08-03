Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2FA87C274
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 20:17:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Aug 2019 13:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,343,1559545200"; d="scan'208";a="167560032"
Received: from mekarim-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.49.129])
	by orsmga008.jf.intel.com with ESMTP; 03 Aug 2019 13:17:52 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
	<20190802203719.20437-9-ross.burton@intel.com>
	<CAMKF1soeb69h2dkmV_LdpugZrAEP8OFQiVxb7qxrBw-9G0VPDQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <031d721f-f30c-0684-3992-37b65c61660e@intel.com>
Date: Sat, 3 Aug 2019 21:17:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soeb69h2dkmV_LdpugZrAEP8OFQiVxb7qxrBw-9G0VPDQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] libx11: update to 1.6.8
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
X-List-Received-Date: Sat, 03 Aug 2019 20:17:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 03/08/2019 13:30, Khem Raj wrote:
>     Move most patches to libx11.inc so that they're applied to both
>     libx11 and libx11-diet.
> 
> Aren’t we deleting libx11-diet then we might not want to accommodate for it

Potentially.  This way even if we do remove it, someone can recover 
libx11-diet 1.6.8 from git.

Ross


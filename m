Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF317FC56;
	Mon, 20 Jan 2020 11:24:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 03:24:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; d="scan'208";a="228356518"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by orsmga006.jf.intel.com with ESMTP; 20 Jan 2020 03:24:23 -0800
To: Andrey Zhizhikin <andrey.z@gmail.com>
References: <20200117141632.3809-1-ross.burton@intel.com>
	<CAHtQpK57OxO8z=iBERfc52w72H19XYyygzpL4gt7QxtLHAmfbw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c9210040-bd8f-9b1a-f870-f48d40c7d295@intel.com>
Date: Mon, 20 Jan 2020 11:24:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHtQpK57OxO8z=iBERfc52w72H19XYyygzpL4gt7QxtLHAmfbw@mail.gmail.com>
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC PATCH] python: remove Python 2 and all supporting classes
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
X-List-Received-Date: Mon, 20 Jan 2020 11:24:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/01/2020 22:23, Andrey Zhizhikin wrote:
> I've just realized that this breaks entire
> [meta-openembedded/meta-python]. I'm now in a process of removing
> Python2 recipes, and just wanted to check that I'm doing the right
> thing and this is actually intended. Or am I missing something in my
> build config that is required to be set that Python2 gets disabled and
> I would actually not need to eliminate those recipes (some are
> actually dubbed by python3- versions but some are not)?

The python2 recipes are already copied into meta-python2, so the py2 
recipes in meta-python should be deleted.

Ross



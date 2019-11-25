Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D883A7FAB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:06:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Nov 2019 06:06:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; d="scan'208";a="260408900"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2019 06:06:48 -0800
To: openembedded-core@lists.openembedded.org
References: <CABPh3UNv+RcyrU8crvf4PAU--s-trBgBYj0-Er5eHan9_Gy6RQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <d3760388-0877-17fc-3467-8c3e2feb01d6@intel.com>
Date: Mon, 25 Nov 2019 14:06:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABPh3UNv+RcyrU8crvf4PAU--s-trBgBYj0-Er5eHan9_Gy6RQ@mail.gmail.com>
Subject: Re: Oe-core: python and BBCLASSEXTEND = "native nativesdk"
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
X-List-Received-Date: Mon, 25 Nov 2019 14:06:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/11/2019 15:21, nick83ola wrote:
> Dear Openembedded developer,
> 
> a lot of python recipes need to add the
> 
> BBCLASSEXTEND = "native nativesdk"
> 
> To the recipe to build the native version of the package.
> Wouldn't be better to add it to the pythonnative.bbclass by default?

No.

pythonnative.bbclass means "I build-depend on python-native and would 
like that python to be on $PATH before the host python".

None of that is relevant to whether a recipe can be built for native or 
nativesdk.

Ross


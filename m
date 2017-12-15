Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 181A678295
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 14:57:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Dec 2017 06:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,405,1508828400"; 
   d="scan'208";a="2988816"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 15 Dec 2017 06:57:03 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
	<9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
	<b3867bfb39444851865a5d7db3046e55@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <41a1f283-7a53-2c18-ee78-f43292159d18@linux.intel.com>
Date: Fri, 15 Dec 2017 16:57:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <b3867bfb39444851865a5d7db3046e55@XBOX02.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Fri, 15 Dec 2017 14:57:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/07/2017 05:06 PM, Peter Kjellerstedt wrote:

>> +    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
> 
> Remove the True argument to d.getVar().
>> +    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
> 
> Remove True here as well.

Thanks, done.

Alex


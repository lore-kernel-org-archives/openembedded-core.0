Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EC79271AC1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 09:53:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 02:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,352,1498546800"; d="scan'208";a="888500357"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2017 02:44:44 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20170809111602.9117-1-alexander.kanavin@linux.intel.com>
	<CAJ86T=W994zJ_CBLx+8oPv3k-DMdW6SaRd=EQMDRgoRd2WoV1g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cef68257-165c-4270-260e-5068dbd29fce@linux.intel.com>
Date: Thu, 10 Aug 2017 12:41:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=W994zJ_CBLx+8oPv3k-DMdW6SaRd=EQMDRgoRd2WoV1g@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Thu, 10 Aug 2017 09:53:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/09/2017 06:12 PM, Andre McCurdy wrote:
>> -# ensure OpenSSL is used for HLS AES description instead of nettle
>> -# (OpenSSL is a shared dependency with dtls)
>> -PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
>> +PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=nettle,--disable-hls,nettle"
>> +# Provide a fallback to openssl 1.0 when using nettle is not acceptable or desirable
>> +PACKAGECONFIG[hls_openssl10]   = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl10"
> 
> The option which isn't enabled is going to cause "--disable-hls" to be
> added to the configure command line, so this isn't going to work as
> expected.

That's right. Ignore this patch; the previous version should go in. If 
someone wants openssl, they can add the switch manually to configure 
(later options supersede earlier ones in autoconf, as far as I remember).

Alex


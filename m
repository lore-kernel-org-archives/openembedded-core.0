Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBF460616
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 11:04:43 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 02 Oct 2017 04:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,469,1500966000"; d="scan'208";a="158321154"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 04:04:44 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<d270479c-2e98-0211-1cc0-b7775a318d1b@linux.intel.com>
	<CAP9ODKopd3YGyd7wfz-Xyc+QDEJSJX3yeCwY7ced+aFAY4+Lgg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2adc6b6c-9538-bede-9235-b3642b0d5ccc@linux.intel.com>
Date: Mon, 2 Oct 2017 14:01:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKopd3YGyd7wfz-Xyc+QDEJSJX3yeCwY7ced+aFAY4+Lgg@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lib/oe/package_manager.py (rpm): Signature check is enabled by default
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
X-List-Received-Date: Mon, 02 Oct 2017 11:04:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2017 01:00 AM, Otavio Salvador wrote:

>> NAK both patches, I'm afraid. gpgcheck and repo_gpgcheck are two different
>> options, which control different things, and you thoroughly confused them
>> here.
> 
> I did test both patches and this is not what I figured. Did you test it?

>> Again, 'gpcheck' option has nothing to do with verifying signed package
>> feeds. NAK.
> 
> Oh really? so tell me why it fixed my error?
> 
> Without this patch I need to use:
> 
> dnf install --nogpgcheck <pkg>
> 
> and it is sub-optimal as I did not enabled signed support.


Oe-core has support for two different things:

1. Signing and verifying individual package files. This feature is 
controlled by RPM_SIGN_PACKAGES option in build configuration and dnf's 
gpgcheck config file option at runtime.

2. Signing and verifying repository metadata. This feature is controlled 
by PACKAGE_FEED_SIGN option and repo_gpgcheck config file option 
respectively.

The above two things are completely orthogonal, and can be enabled and 
disabled independently of each other. Now please look at your patches 
keeping this in mind.

I assure you, both of the patches are incorrect. Exactly why is left as 
an exercise for the reader.

Alex


Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CB80C65C8F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 08:54:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 01:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,278,1493708400"; d="scan'208";a="975480021"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 01 Jun 2017 01:54:39 -0700
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMKF1spQcs7rHhT=NgHBWhDESzEzbJx4XReBmREtr=rs5c9FjQ@mail.gmail.com>
	<12b1e915-31c9-3258-1013-46854abb78ae@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f960d84e-0372-07f1-22f9-0768f5792f8b@linux.intel.com>
Date: Thu, 1 Jun 2017 11:52:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <12b1e915-31c9-3258-1013-46854abb78ae@windriver.com>
Subject: Re: AS_NEEDED and rpm4
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
X-List-Received-Date: Thu, 01 Jun 2017 08:54:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2017 05:06 AM, Mark Hatle wrote:

>> We added entry for disabling AS_NEEDED for rpm5, now that  we have move to rpm4
>> is that entry sitll required in "conf/distro/include/as-needed.inc"
>
> Unknown, I hadn't realized this was done.  Should be easy to clear it and see if
> everything is still working.

Yes. That's why I really don't like those global include files that 
change flags behind recipes' back - any exceptions to default settings 
are very easy to miss and they really belong in recipes themselves. You 
are welcome to try and submit a patch.

Alex



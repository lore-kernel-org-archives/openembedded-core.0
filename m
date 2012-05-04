Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQR7t-00036l-Fl
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 00:37:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2012 15:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="162145321"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2012 15:27:36 -0700
Message-ID: <4FA457D8.4020102@linux.intel.com>
Date: Fri, 04 May 2012 15:27:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <CAF6bG8djbQrRN5RoSPTdTha50qqEOp=CTxFk-AzWcprTvzO9+A@mail.gmail.com>
	<CAMKF1sr3__=2kd6UneGYb4-QyO7+J3-ATtkJUbbjA7NsGFsFjg@mail.gmail.com>
In-Reply-To: <CAMKF1sr3__=2kd6UneGYb4-QyO7+J3-ATtkJUbbjA7NsGFsFjg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Getting nonexistent files from debian.org not erroring but saving html-page as destination file, Was: [Patch] Update dpkg to one available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 22:37:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 02:59 PM, Khem Raj wrote:
> On Fri, May 4, 2012 at 12:49 PM, Marko Lindqvist<cazfi74@gmail.com>  wrote:
>> On 4 May 2012 19:06, Saul Wold<sgw@linux.intel.com>  wrote:
>>> On 05/04/2012 04:29 AM, Marko Lindqvist wrote:
>>>>
>>>>   I'm trying to make my first openembedded-core build. That failed due
>>>> to dpkg-1.15.8.5 being not available for download any more.
>>>>
>>> This should be still available on our MIRROR.
>>
>
> Saul
>
> actually with OE-Core I also hit similar problem and we need this patch
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=044dd59a6288064d7325a93684660443340c2460
>
>
Khem,

thanks, submit this as a proper patch against 1.2.1 and we will get it 
fixed up.

We have seen this before and I thought we had a bug filed, to check 
mirrors when the checksum fails.

I will file a bug.

Sau!



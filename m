Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCFCf-00052Q-0B
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 21:35:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2012 12:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,418,1344236400"; d="scan'208";a="203220088"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2012 12:23:18 -0700
Message-ID: <505232A6.6040806@linux.intel.com>
Date: Thu, 13 Sep 2012 12:23:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <CAP9ODKpy==dnOV-MtxLck0nLm0juBPiVSNwf=_M3gt12tCqXXQ@mail.gmail.com>
	<505230C4.5090107@windriver.com>
In-Reply-To: <505230C4.5090107@windriver.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: Possible bug in bitbake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 19:35:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 12:15 PM, Mark Hatle wrote:
> On 9/13/12 1:41 PM, Otavio Salvador wrote:
>> Hello,
>>
>> Rogerio and Daiane, here copied, found a bug in bitbake (we managed to
>> reproduce it in denzil). The output in console when it happens can be
>> seen at:
>>
>> https://groups.google.com/d/msg/meta-fsl-arm/7W9bwxqslnk/htEiOcaJMH8J
>>
>> The way to reproduce it is very easy:
>>
>>   * bitbake gnutls -c cleansstate
>>   * remove gnutls from download cache
>>   * bitbake gnutls
>>
>> Adding gnutls back to download cache make the build succeed.
>>
>
> There is a stamp file in the download cache.  If you don't clear that,
> then it will think it's still there.
>
> bitbake gnutls -c distclean
>
I think you mean cleanall!

I don't think we have distclean.

Sau!

> that should remove from the download cache, the stamp file, and all of
> the actions of cleansstate.
>
> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S28JU-0005kx-FZ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 22:40:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2012 13:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115397904"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2012 13:32:28 -0800
Message-ID: <4F4BF66C.7000706@linux.intel.com>
Date: Mon, 27 Feb 2012 13:32:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330369680.git.sgw@linux.intel.com>
	<1917f9e3ccf8558491f0f671ba0525319cd3cf02.1330369680.git.sgw@linux.intel.com>
	<CAMKF1sq+4=fD2kyK2BHjuCcompqcb01ThpJak+59VvD1EycDxw@mail.gmail.com>
In-Reply-To: <CAMKF1sq+4=fD2kyK2BHjuCcompqcb01ThpJak+59VvD1EycDxw@mail.gmail.com>
Subject: Re: [PATCH 03/13] util-linux: Update to 2.21
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
X-List-Received-Date: Mon, 27 Feb 2012 21:40:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 11:31 AM, Khem Raj wrote:
> On Mon, Feb 27, 2012 at 11:10 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>>
>> -CACHED_CONFIGUREVARS += "scanf_cv_type_modifier=as"
>> +CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>
> can you explain this change ?
>
The configure setup changed from the "type" -> "alloc", so that cached 
var needed to change also.  This was originally needed due to it being a 
cross-compiled check.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



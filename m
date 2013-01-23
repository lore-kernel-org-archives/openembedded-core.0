Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ty8AW-0005La-1F
	for Openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 22:47:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2013 13:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,523,1355126400"; d="scan'208";a="194464591"
Received: from unknown (HELO [10.255.15.108]) ([10.255.15.108])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2013 13:31:51 -0800
Message-ID: <510056C3.6090805@linux.intel.com>
Date: Wed, 23 Jan 2013 13:31:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <2021B186DC632746BD5A3CE32F12BD289FCCF37B@EU-MBX-03.mgc.mentorg.com>
	<51005369.70401@linux.intel.com>
	<20130123212632.GC14381@jama.palm1.palmone.com>
In-Reply-To: <20130123212632.GC14381@jama.palm1.palmone.com>
Cc: "Belal, Awais" <Awais_Belal@mentor.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Openssl - config file not being pulled in on the install
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
X-List-Received-Date: Wed, 23 Jan 2013 21:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2013 01:26 PM, Martin Jansa wrote:
> On Wed, Jan 23, 2013 at 01:17:29PM -0800, Saul Wold wrote:
>> On 01/23/2013 12:10 PM, Belal, Awais wrote:
>>> Hi Guys,
>>>
>>> This probably went un-noticed because I forgot to put a subject the
>>> first time around... my bad!
>>>
>>> I have a question regarding openssl. The openssl.inc file under the poky
>>> package creates a -misc package which is not directly installed unless
>>> either put in RDPENEDS or RRECOMMENDS. This package (-misc) contains the
>>> openssl configuration file which is required while generating
>>> certificates on the target otherwise the command says:
>>> /
>>> WARNING: can't open config file: /usr/lib/ssl/openssl.cnf//
>>> Unable to load config info from /usr/lib/ssl/openssl.cnf//
>>> /
>>>
>>> In an older version of the recipe attached here, the correct method is
>>> being (this is my understanding) to get that file in on the target while
>>> installing.
>>>
>>> Any guidance here would be much appreciated.
>>>
>> Based on reading some of the history and such, I think the best answer
>> would be to move the openssl.cnf file to FILES_${PN} line, since
>> ordering wise it will get pick up that file and it is needed, not
>> recommeded.
>
> Can you please use u-a for that config file if you decide to do it?
>
Excellent suggestion!

probably need to do this with a few more of the config files also!

Sau!

> Some recipes want to provide own openssl.cnf which requires bbappend
> like this one:
> https://github.com/webOS-ports/meta-webos/commit/f2650858ae6f78b016107e622ab7be8a67e954c7
>
> Cheers,
>
>>
>> We would welcome a tested patch.
>>
>> Thanks
>> Sau!
>>
>>> BR,
>>> Awais Belal
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



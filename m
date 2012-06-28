Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SkK51-0008Cr-Q6
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 21:08:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2012 11:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="164136462"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2012 11:57:43 -0700
Message-ID: <4FECA927.20204@linux.intel.com>
Date: Thu, 28 Jun 2012 11:57:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAF1ZMEftbcYLjj-qFiXgGQysr_pnfMMonXJz25TO3+UXXj4ckQ@mail.gmail.com>
	<85obo3s3ht.fsf@cl-t066-141cl.privatedns.com>
In-Reply-To: <85obo3s3ht.fsf@cl-t066-141cl.privatedns.com>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: xcursor-transparent-theme-0.1.1: upstream source vanish
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
X-List-Received-Date: Thu, 28 Jun 2012 19:08:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2012 11:19 AM, Mario Domenech Goulart wrote:
> Hi Dennis,
>
> On Thu, 28 Jun 2012 14:08:48 +0800 "Dennis.Yxun"<dennis.yxun@gmail.com>  wrote:
>
>>   Hit following error, seems that upstream source vanished
>> either provide with another valid download url, or deprecated this package?
>> any idea?
>>
>> Dennis
>>
>> ARNING: Checksum error encountered with download (will attempt other s[92/1931]
>> URL: 'http://matchbox-project.org/sources/utils/xcursor-transparent-theme-0.1.1.
>> smatch!
>> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has md5
>> fcb1fd1747066a1402eb3a when 7b0c623049d4aab20600d6473f8aab23 was expected
>> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has sha
>> 9e6cc99db0fc24b24fc544458d7e42dd0b2efc20bad174eb0700e634f when b26adf2d503d01299
>> 220de09423be0364e9a060bf7e4 was expected
>> ERROR: Fetcher failure for URL: 'http://matchbox-project.org/sources/utils/xcurs
>> -0.1.1.tar.gz'. Checksum mismatch!
>> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has md5
>> fcb1fd1747066a1402eb3a when 7b0c623049d4aab20600d6473f8aab23 was expected
>> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has sha
>> 9e6cc99db0fc24b24fc544458d7e42dd0b2efc20bad174eb0700e634f when b26adf2d503d01299
>> 220de09423be0364e9a060bf7e4 was expected
>> ERROR: Function failed: Fetcher failure for URL: 'http://matchbox-project.org/so
>> transparent-theme-0.1.1.tar.gz'. Unable to fetch URL from any source.
>> ERROR: Logfile of failure stored in: /home/dennis/oe/oe-core/build/tmp-eglibc/wo
>> sor-transparent-theme-0.1.1-r4/temp/log.do_fetch.2231
>
> At the moment I cannot access the svn repository (linked from
> https://matchbox-project.org/get_involved.html).
>
> The download links from https://matchbox-project.org/download.html are
> broken.  https://matchbox-project.org/sources.1.html gives me an empty
> page and http://handhelds.org/~mallum/downloadables/ (for older
> releases) gives me a 404 code.
>
This is being looked into, at the matchbox site side.

Can you get the file from here:

http://autobuilder.yoctoproject.org/pub/sources/xcursor-transparent-theme-0.1.1.tar.gz

This is a mirror that should be accessed, do you set your PREMIRROR to 
something?  See the meta-yocto/conf/distro/poky.conf for an example for 
setting to the Yocto Project Mirror.

Sau!

> Nobody connected to freenode's #matchbox at the moment.
>
> Do you know of any alternative to xcursor-transparent-theme?
>
>
> Best wishes.
> Mario
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



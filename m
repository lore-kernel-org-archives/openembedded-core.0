Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SHQg1-00082s-LT
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 04:19:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3A2A7Yu013977
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 19:10:07 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Apr 2012 19:10:06 -0700
Message-ID: <4F83967D.6020403@windriver.com>
Date: Tue, 10 Apr 2012 10:10:05 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333966697.git.liezhi.yang@windriver.com>
	<857BE142E5399E46B20FD45B9DB8A7BC0FD32945@SHSMSX102.ccr.corp.intel.com>
	<4F82D450.2000602@windriver.com>
In-Reply-To: <4F82D450.2000602@windriver.com>
Subject: Re: [PATCH 0/1] meta-toolchain: runqemu falied on	FC16/Opensuse12.1 x86_64
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
X-List-Received-Date: Tue, 10 Apr 2012 02:19:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/09/2012 08:21 PM, Robert Yang wrote:
>
>
> On 04/09/2012 06:36 PM, Lu, Lianhao wrote:
>>
>> Robert Yang wrote on 2012-04-09:
>>> Test info:
>>> * Have tested on:
>>> * Fedora 16 x86_64
>>> * Opensuse 12.1 x86_64
>>
>> Robert,
>> Hongna just found a qemu launch error on openSuse x86_64 using the 2.15
>> eglibc-nativesdk, something about the SDL initialization error. Did your
>> platform work well?
>>
>

Here is the update information from Hongna:

I have finished the test on opensuse x86-64, both qemuarm and qemux86 do
cross debug pass using 2.15 toolchain.

// Robert

> Maybe he just used "ssh" without "-X" or "-Y" ? There would be an SDL
> initialization error when ssh without "-X" or "-Y". It worked well for me.
>
> // Robert
>
>>> * Ubuntu 10.04
>>> * The testing commands are:
>>> $ bitbake core-image-sato meta-toolchain meta-toolchain-sdk
>>>
>>> And untar the sdk, then runqemu from the sdk to start the target.
>>> // Robert
>>>
>>> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>>>
>>> runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15
>>> +0100)
>>> are available in the git repository at:
>>> git://git.pokylinux.org/poky-contrib robert/tc
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tc
>>> Robert Yang (1):
>>> meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
>>> meta/conf/distro/include/tcmode-default.inc | 4 ++--
>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> _______________________________________________ Openembedded-core
>>> mailing list Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> Best Regards,
>> Lianhao
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



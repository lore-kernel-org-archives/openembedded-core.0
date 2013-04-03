Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UNFhc-00034u-Aq
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 06:53:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r334aP0X001763
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Apr 2013 21:36:25 -0700 (PDT)
Received: from [128.224.162.206] (128.224.162.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Apr 2013 21:36:26 -0700
Message-ID: <515BB1C8.1060706@windriver.com>
Date: Wed, 3 Apr 2013 12:36:24 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1364551873.git.hongxu.jia@windriver.com>
	<CADkTA4MeGQQajjwdGk0An80zS09BRs7CfOEAXdp85G5TPY8SYg@mail.gmail.com>
In-Reply-To: <CADkTA4MeGQQajjwdGk0An80zS09BRs7CfOEAXdp85G5TPY8SYg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1][yocto-kernel-cache]meta: update atom-pc-wifi.cfg for audit purposes
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
X-List-Received-Date: Wed, 03 Apr 2013 04:53:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2013 01:01 AM, Bruce Ashfield wrote:
> On Mon, Apr 1, 2013 at 10:34 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> The following changes since commit 0fac9380caa5eaf8038536413366511c48b579b0:
>>
>>    meta: Remove Cedartrail Machine (2013-02-10 23:54:01 -0500)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib hongxu/fix-atompc-kernel-warn
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-atompc-kernel-warn
> Thanks for the changes, they look good, but we have a couple of process items
> to fix!
>
>   - make sure to cc me directly on kernel config or kernel changes,
> otherwise I may
>     miss them.
>
>   - cc linux-yocto@yoctoproject.org (you need to subscribe) instead of
> oe-core, I'll
>     update oe-core once the changes are merged
>
>   - modify the linux-yocto-<version> meta branch, not the kernel cache
> directly. I'll
>     merge changes to the kernel-cache when integrating the change to the release
>     kernel.

Got it, I will resent the pull request.

Thanks,
Hongxu

> Cheers,
>
> Bruce
>
>> Hongxu Jia (1):
>>    meta: update atom-pc-wifi.cfg for audit purposes
>>
>>   bsp/atom-pc/atom-pc-wifi.cfg |   11 ++---------
>>   1 file changed, 2 insertions(+), 9 deletions(-)
>>
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"




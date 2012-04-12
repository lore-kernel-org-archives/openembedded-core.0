Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SINB5-0001tN-5b
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 18:47:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3CGbvHB002709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Apr 2012 09:37:58 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Apr 2012 09:37:57 -0700
Message-ID: <4F8704E4.7020400@windriver.com>
Date: Thu, 12 Apr 2012 11:37:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Steve Sakoman <sakoman@gmail.com>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
	<CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
	<4F86F8D2.2050402@windriver.com>
	<CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
In-Reply-To: <CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
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
X-List-Received-Date: Thu, 12 Apr 2012 16:47:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/12 10:55 AM, Steve Sakoman wrote:
> On Thu, Apr 12, 2012 at 8:46 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 4/12/12 10:36 AM, Steve Sakoman wrote:
>>>
>>> On Thu, Apr 12, 2012 at 6:39 AM, Steve Sakoman<sakoman@gmail.com>    wrote:
>>
>>
>> That is very odd, the system is supposed to identify all of the dependencies
>> needed for the first set of packages... (the three base-passwd, base-files
>> and shadow).
>
> Perhaps the issue is with the bash package -- for some reason rpm
> doesn't realize that bash provides /bin/sh?
>
>> The end result is a list of 10-12 binaries to be installed that meet those
>> requirements, as well as the original three requested packages.
>>
>> We also shouldn't specify bash because busybox provides /bin/sh in a lot of
>> configurations.
>>
>> Which image did you try to build and I'll see what I can replicate here.
>
> The images I built are not standard oe-core/yocto images, they are
> custom images that don't include busybox.  Perhaps that is why I am
> seeing the issue and others aren't.
>
> If you are really interested in replicating let me know and I can
> provide you with pointers to my image recipes.

Ya, if you could point me to the image recipe that eliminates BB and uses the 
discrete versions of things I'll look into this.

I can try to do it with hob, but I'm not sure of everything I'd have to select.

--Mark

> Steve




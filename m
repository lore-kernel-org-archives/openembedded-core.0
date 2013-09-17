Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53B396BEF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 05:12:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8H5Bxjq005594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Sep 2013 22:11:59 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 16 Sep 2013 22:11:58 -0700
Message-ID: <5237E49C.7090608@windriver.com>
Date: Tue, 17 Sep 2013 13:11:56 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com>
In-Reply-To: <523501AC.4010208@linux.intel.com>
X-Originating-IP: [128.224.162.231]
Cc: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Tue, 17 Sep 2013 05:12:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年09月15日 08:39, Saul Wold wrote:
> On 09/14/2013 12:10 PM, Burton, Ross wrote:
>> On 14 September 2013 05:35, Khem Raj <raj.khem@gmail.com> wrote:
>>> It does not come with out a price. Have you measured how much 
>>> performance
>>> degradation it brings in ?
>>> We need that to assess the trade off and also describe the machine
>>> configuration where this option is helping
>>
>> Agreed - there's a bug which is tracking this from Kai. As far as I'm
>> aware the failure cases are 32-bit hosts (3GB limit per process) or
>> 64-bit hosts with limited memory. I suggested that we benchmark with
>> and without this - if the performance hit is measured in seconds then
>> we can probably enable it for this recipe out of the box.
>>
> Joe / Kai:
>
> Please test as Khem and Ross suggest and report back with the results, 
> also please include the [YOCTO #5160].

run command 'time bitbake webkit-gtk -c compile' on the host which failed:

without patch till compile fails:
real 49m2.496s
user 102m47.789s
sys 31m18.698s

with the patch:
real 44m9.000s
user 106m45.182s
sys 30m53.223s


On the host build doesn't fail:

Without patch:
real 76m1.646s
user 86m36.704s
sys 38m39.103s

With patch:
real 63m36.193s
user 86m9.274s
sys 37m48.431s

It seems the link option doesn't increase the compile time.

Regards,
Kai

>
> Ross, I am going to assign this to Joe.
>
> Sau!
>
>> Ross
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>


-- 
Regards,
Neil | Kai Kang



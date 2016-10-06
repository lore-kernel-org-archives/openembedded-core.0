Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5432A600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 15:39:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u96FdtFg007761
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 6 Oct 2016 08:39:55 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Oct 2016 08:39:54 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
	<a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
	<CAMKF1spG=v7_wb_VYktNBL7NTan28NbB47G7u2B_-E43jBL8vQ@mail.gmail.com>
	<687e0950-a18a-5d44-aeae-18517df275e6@windriver.com>
	<4F081825-2EC8-4F85-9E55-1E24F215723D@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <89015693-dfeb-5b47-7c2b-386c85571dec@windriver.com>
Date: Thu, 6 Oct 2016 10:39:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <4F081825-2EC8-4F85-9E55-1E24F215723D@gmail.com>
Cc: "Gupta, Rahul KumarXX" <rahul.kumarxx.gupta@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl: OpenSSL 1.1.x update
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
X-List-Received-Date: Thu, 06 Oct 2016 15:39:58 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/6/16 10:22 AM, Khem Raj wrote:
> 
>> On Oct 6, 2016, at 7:21 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> On 10/5/16 9:59 PM, Khem Raj wrote:
>>> On Wed, Oct 5, 2016 at 7:33 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> On 10/5/16 9:11 PM, Tan, Raymond wrote:
>>>>> Greetings, I would like to know if there is any plan / schedule to upgrade to openssl 1.1.0 into OE-core?
>>>>
>>>> Currently 1.0.2 is the LTS version of OpenSSL.  1.1.0 is not scheduled to be LTS.
>>>>
>>>> For the upcoming release (soon), I would NOT expect 1.1.0 to be in it.  There
>>>> are still too many incompatibilities with other components.
>>>>
>>>> For the next version of OE, I think it is appropriate to include 1.1.0, but I
>>>> would also like to maintain 1.0.2 for the time being.  (Beside LTS, it also is
>>>> still the only way to have FIPS-140-2 module, as there is currently no module in
>>>> the 1.1.0 -- and there may not be for a while.)
>>>
>>> What do we get with 1.1.0 ?
>>
>> Latest and greatest code of course.. :)
>>
>> Reality, not a lot more over 1.0.2... there are some significant redesigns that
>> should help improve overall security of the OpenSSL library and items using the
>> library.  But various things will have to be updated to make use of this.
>>
>> The OpenSSL community itself is looking at 1.1.0 as a transition to newer and
>> better design/api/etc... which is why it is not marked as a LTS release.
> 
> api changes can be a bothersome point from integration POV, do we know if there
> are some forwarded porting incompatibilities in APIs already?

I have not investigated it, as my focus has been on the LTS version at this point.

--Mark

>>
>> Beside my basic understanding (above) there should be information as part of the
>> 1.1.0 release notes.
>>
>> --Mark
>>
>>>>
>>>> --Mark
>>>>
>>>>> Thanks!
>>>>>
>>>>> Raymond Tan
>>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> 



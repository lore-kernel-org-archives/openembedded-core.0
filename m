Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qp7aF-00006S-K8
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 01:44:11 +0200
Received: by iyf13 with SMTP id 13so3793683iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 16:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=hHuP/cI5a4Wk1Iv08BriDcpii4hJ6oXbuNc/mBPUDOs=;
	b=TRNXoXi03f/lHCoUu5suoucjMWE8RCiuYbiuq+03FpKyr7UXHtz6yNSULUATpiFDfS
	KpVKJqd92FvoN9uwqUW+2+x8MGMbutuSCW5yJx8LTF5fxl5aK+Rq5eeb8X6rwB+kcZ+/
	3iUMyEsp8OM51OrnUf1xyWAqp8evTRiNv4i6A=
Received: by 10.231.1.32 with SMTP id 32mr1126576ibd.40.1312501187220;
	Thu, 04 Aug 2011 16:39:47 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id fr11sm1562050ibb.63.2011.08.04.16.39.45
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 16:39:45 -0700 (PDT)
Message-ID: <4E3B2DBF.7090800@gmail.com>
Date: Thu, 04 Aug 2011 16:39:43 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
	<CA+M6bX=xN7Ek_rh4Qu=RxbRJQ5CrSK7qRy=Vh=S7L-OdR4SHyw@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F588@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F588@orsmsx504.amr.corp.intel.com>
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Thu, 04 Aug 2011 23:44:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 03:58 PM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Tom Rini
>> Sent: Thursday, August 04, 2011 3:49 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
>> support for glibc recipes
>>
>> On Thu, Aug 4, 2011 at 3:04 PM, Kamble, Nitin A
>> <nitin.a.kamble@intel.com>  wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of
>>>> Phil Blundell
>>>> Sent: Thursday, August 04, 2011 2:51 PM
>>>> To: Patches and discussions about the oe-core layer
>>>> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
>>>> support for glibc recipes
>>>>
>>>> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
>>>>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>>>
>>>>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>>
>>>> This commit message is very terse.  Why is this change necessary?
>>>
>>> Because meta-x32 layer has glibc, which needs these support files. I
>> will update the commit message in the tree.
>>
>> Can x32 not use eglibc?
> Not yet, x32 work is done on the glibc tip, and eglibc is not there to pick up the work.

glibc tip is pulled into eglibc svn trunk very frequently. So an 
eglibc_svn.bb recipe can get you what you want.

>
> Nitin
>
>>
>> --
>> Tom
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




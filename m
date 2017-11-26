Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 01197784D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 02:08:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Nov 2017 18:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,456,1505804400"; 
   d="scan'208";a="6318811"
Received: from davidsol-mobl.amr.corp.intel.com (HELO [10.252.250.52])
	([10.252.250.52])
	by orsmga003.jf.intel.com with ESMTP; 25 Nov 2017 18:08:51 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LbTSY6w1+K8tCoyh0MpSG2H+_AA0B+P-DHgZHxz7m1s9A@mail.gmail.com>
	<7079b2e6-b0e8-7882-9b7a-e8bafd94f78c@linux.intel.com>
	<0A2583BA-1CFF-4687-A22A-AAAB8FF39E11@linux.intel.com>
	<81105d2c-32f9-8002-2eb2-d9cac0b2fdf8@linux.intel.com>
Message-ID: <9ce73c70-d867-a174-7702-e8092dc29fd2@linux.intel.com>
Date: Sat, 25 Nov 2017 20:08:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <81105d2c-32f9-8002-2eb2-d9cac0b2fdf8@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Sun, 26 Nov 2017 02:08:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello once again,


I took a look at it and it was no typo, it had no effect on the end 
result but it was an actual error on the get_modules script (which I 
initially copied from the py2 version, hence the error), fixed and 
updated the branch.


Thanks!

Alejandro


On 11/25/2017 05:45 PM, Alejandro Hernandez wrote:
> Hey Tim,
>
>
> Nice catch!, sorry this was an error of mine, but its just a typo, 
> must've copied it manually at some point, sorry about that, I fixed it 
> and updated the branch!
>
>
> Thanks!
>
>
> Alejandro
>
>
> On 11/24/2017 11:04 PM, Tim Orling wrote:
>> Why does python3-manifest.json contain:
>> +            "${libdir}/python2.7/sitecustomize.py”,
>> ?
>>
>>> On Nov 24, 2017, at 4:51 PM, Alejandro Hernandez 
>>> <alejandro.hernandez@linux.intel.com> wrote:
>>>
>>> Hey Ross,
>>>
>>>
>>> Yeah sorry, at first I didnt realize why we needed the manifest for 
>>> python native, I will fix the commit message.
>>>
>>>
>>> Thanks!
>>>
>>>
>>> Alejandro
>>>
>>> On 11/24/2017 11:06 AM, Burton, Ross wrote:
>>>> On 18 October 2017 at 22:07, Alejandro Hernandez 
>>>> <alejandro.hernandez@linux.intel.com> wrote:
>>>>   - Removes the manifest from the python-native recipe (Why was it 
>>>> there
>>>>     in the first place?, native recipes do not get split).
>>>>
>>>> Was this commit written before you added manifest support to 
>>>> python-native?  :)  python-native needs the manifest to set 
>>>> RPROVIDES so that dependencies work.  Can you update the message? 
>>>> (just deleting this line will do)
>>>>
>>>> Ross
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



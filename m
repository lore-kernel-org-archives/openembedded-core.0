Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TrCoy-0000Dj-Bi
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 20:20:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jan 2013 11:05:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,412,1355126400"; d="scan'208";a="270038916"
Received: from unknown (HELO [10.255.14.154]) ([10.255.14.154])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2013 11:05:36 -0800
Message-ID: <50E727FF.2020502@linux.intel.com>
Date: Fri, 04 Jan 2013 11:05:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1356662690-16034-1-git-send-email-cazfi74@gmail.com>
	<1356662690-16034-2-git-send-email-cazfi74@gmail.com>
	<50E601F9.7010705@linux.intel.com>
	<CAF6bG8f5d8GbkRtT2L8ZS4ZCJ0n6FUByyZAcJ=M5V-oH5HnxXQ@mail.gmail.com>
In-Reply-To: <CAF6bG8f5d8GbkRtT2L8ZS4ZCJ0n6FUByyZAcJ=M5V-oH5HnxXQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: update to upstream version 50.1.1
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
X-List-Received-Date: Fri, 04 Jan 2013 19:20:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2013 06:17 PM, Marko Lindqvist wrote:
> On 4 January 2013 00:11, Saul Wold <sgw@linux.intel.com> wrote:
>> On 12/27/2012 06:44 PM, Marko Lindqvist wrote:
>>>
>>> This seems to fix HarfBuzz compile problems.
>>>
>> Just found a problem with this in my testing:
>>
>>> | configure:3983: error: No such directory
>>> /home/sgw/yocto/builds/world/tmp/sysroots/x86_64-linux/usr/share/icu/50.1.1
>>> supplied as the argument to --with-cross-build. Use an absolute path.
>>
>> Seems that icu lays down a /usr/share/icu/50.1 directory, not a ${PV}, so
>> this needs a little work.
>
>   Can you tell anything more about the situation where this came up? I
> tried to reproduce, but icu-native build created, and icu build used
> .../icu/50.1.1/... just right.
>
>   Was that with already populated tree where just the icu update patch
> had been applied? I'm guessing if icu-native and icu builds somehow
> happened concurrently, and icu-native was not ready by the time icu
> needed it. Then that 50.1 directory you saw could be leftover from
> earlier version.
>
>
Hmm, when you build the new version of icu-native, what does it create 
for you in your tmp/sysroot/x86*-linux/usr/share?

Thanks
    Sau!



>   - ML
>



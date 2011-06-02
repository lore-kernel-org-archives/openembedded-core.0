Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QS4H7-0008Eh-2k
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 11:33:09 +0200
Received: by wwb17 with SMTP id 17so565417wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 02:29:54 -0700 (PDT)
Received: by 10.227.58.65 with SMTP id f1mr542094wbh.3.1307006994262;
	Thu, 02 Jun 2011 02:29:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm263066wbh.12.2011.06.02.02.29.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 02:29:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110602063130.GG3281@jama.jama.net>
Date: Thu, 2 Jun 2011 11:29:49 +0200
Message-Id: <1B4F7800-9032-4A5F-9AA7-4266DD38CBD6@dominion.thruhere.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
	<1306960406.3119.6.camel@lenovo.internal.reciva.com>
	<BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
	<1306961600.3119.15.camel@lenovo.internal.reciva.com>
	<BANLkTimvA2gMHB=zmZmLqz+CdyAsR3dmXg@mail.gmail.com>
	<4DE6B299.2060507@linux.intel.com>
	<20110601215232.GE3281@jama.jama.net>
	<4DE6BAE6.3040406@linux.intel.com>
	<20110602063130.GG3281@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Thu, 02 Jun 2011 09:33:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 2 jun 2011, om 08:31 heeft Martin Jansa het volgende geschreven:

> On Wed, Jun 01, 2011 at 03:19:18PM -0700, Saul Wold wrote:
>> On 06/01/2011 02:52 PM, Martin Jansa wrote:
>>> On Wed, Jun 01, 2011 at 02:43:53PM -0700, Saul Wold wrote:
>>>> On 06/01/2011 02:00 PM, Otavio Salvador wrote:
>>>>> On Wed, Jun 1, 2011 at 20:53, Phil Blundell<pb@pbcl.net>   wrote:
>>>>>> On Wed, 2011-06-01 at 20:39 +0000, Otavio Salvador wrote:
>>>>>>> Are you able to reproduce it?
>>>>>> 
>>>>>> No, it works fine for me.  I get:
>>>>>> 
>>>>>> checking how to link with libpthread... -lpthread
>>>>>> checking for libdl... yes
>>>>>> checking how to link with libdl... -ldl
>>>>>> checking whether we are using the GNU C++ compiler... yes
>>>>>> 
>>>>>> This is with the current head of oe-core on qemuarm.
>>>>> 
>>>>> I am building for i586 but I doubt it is related.
>>>>> 
>>>>> I get:
>>>>> 
>>>>> checking for libpthread... yes
>>>>> checking how to link with libpthread... /usr/lib/libpthread.so
>>>>> checking for libdl... no
>>>>> checking whether we are using the GNU C++ compiler... yes
>>>>> 
>>>> I also built for x86 and beagle, both have libdl, can you check that you
>>>> do not have some kind of site configuration that is overriding, also
>>>> maybe post your log from .../gnutls-2.12.5/lib/config.log
>>> 
>>> here it tries to link against host libdl
>>> 
>>> configure:26050: checking for libdl
>>> configure:26069: arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
>>> --sysroot=/OE/shr-core/tmp/sysroots/om-gta02 -o conftest -O2 -pipe -g
>>> -feliminate-unused-debug-types
>>> -I/OE/shr-core/tmp/sysroots/om-gta02/usr/include -Wl,-O1
>>> -Wl,--as-needed conftest.c  /usr/lib/libdl.so>&5
>>> /usr/lib/libdl.so: file not recognized: File format not recognized
>>> collect2: ld returned 1 exit status
>>> 
>> Well that's interesting, since I see it linking using -ldl, there must 
>> be some other setting that's affecting this, I have been looking in 
>> gnutls to see if I can find something else that sets libdl.so vs -ldl,
>> I have not found it.
>> 
>> configure:26075: i586-poky-linux-gcc -march=i586 
>> --sysroot=/builds/world/tmp/sysroots/qemux86 -o conftest -O2 -pipe -g 
>> -feliminate-unused-debug-types 
>> -I/builds/world/tmp/sysroots/qemux86/usr/include -Wl,-O1 
>> -Wl,--as-needed conftest.c  -ldl >&5
>> configure:26075: $? = 0
>> configure:26085: result: yes
>> configure:26092: checking how to link with libdl
>> configure:26094: result: -ldl
> 
> what do you have in configlog for LIBDL?
> 
> here it's all empty
> LIBDL=''
> LIBDL_PREFIX=''
> LTLIBDL=''

I get for cross gnutls in lib/config.log:

grep LIBDL lib/config.log 
HAVE_LIBDL='no'
LIBDL=''
LIBDL_PREFIX=''
LTLIBDL=''

regards,

Koen



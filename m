Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qch4E-0001M2-I0
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 18:59:46 +0200
Received: by iwn4 with SMTP id 4so3233376iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Oz3LYHiRcVZwlq1D0vptKd5k7P17gLLwjWLDFZRzGwE=;
	b=AYmEMoFzmNW6VnaoGcCJnDsffgfMqB3LvdRhda902G/PFCVTZx+qXk+XcZXxonTW8q
	vb7r75cTEjp/UHqRBqhz4anVc8XLtXSmSBXvT/tYQinEbj9avQ0m5OuoF4Li3m7JZZHQ
	O4pHktB11mdIVynoJcYopnqLbILkAa4cDJhGU=
Received: by 10.42.168.2 with SMTP id u2mr3855775icy.317.1309539357649;
	Fri, 01 Jul 2011 09:55:57 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v16sm1960095ibe.17.2011.07.01.09.55.56
	(version=SSLv3 cipher=OTHER); Fri, 01 Jul 2011 09:55:57 -0700 (PDT)
Message-ID: <4E0DFC19.2040706@gmail.com>
Date: Fri, 01 Jul 2011 09:55:53 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1309243115.git.liezhi.yang@windriver.com>	<4E0D062C.5060302@linux.intel.com>	<2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>	<1309509178.20015.513.camel@rex>	<72100965-D39D-41D0-B6E7-78E18D6FD072@dominion.thruhere.net>	<7A98A269-0EB8-452E-839C-68A68128B5A3@gmail.com>
	<AB227B7A-755C-454D-A38E-7FF913801989@dominion.thruhere.net>
In-Reply-To: <AB227B7A-755C-454D-A38E-7FF913801989@dominion.thruhere.net>
Subject: Re: It's broken, please revert. Re: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Fri, 01 Jul 2011 16:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2011 07:01 AM, Koen Kooi wrote:
>
> Op 1 jul 2011, om 15:57 heeft Khem Raj het volgende geschreven:
>
>>
>>
>> On Jul 1, 2011, at 4:00 AM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>
>>>
>>> Op 1 jul 2011, om 10:32 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Fri, 2011-07-01 at 09:15 +0200, Koen Kooi wrote:
>>>>> incremental build with rm_work turned on:
>>>>>
>>>>> ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 for further information)
>>>>> ERROR: Logfile of failure stored in: /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092
>>>>> Log data follows:
>>>>> | + cd /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi
>>>>> | + do_configure
>>>>> | + sed -i '/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
>>>>> | sed: can't read /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/linux*.h: No such file or directory
>>>>> | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 for further information)
>>>>> NOTE: package gcc-cross-initial-4.5-r37.0+svnr175127: task do_configure: Failed
>>>>> ERROR: Task 764 (/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_configure) failed with exit code '1'
>>>>>
>>>>> Can this patchset get reverted please and reapplied when it actually has been tested to work?
>>>>
>>>> I checked and everything is fine with rm_work.
>>>>
>>>> Looking at this error, something is changing ${S} as there is no mention
>>>> of work-shared in the sed command yet there should be.
>>>>
>>>> At a guess this is coming from:
>>>>
>>>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
>>>>
>>>> where it says:
>>>>
>>>> S = "${WORKDIR}/${BRANCH}"
>>>>
>>>> and if that is changed to
>>>>
>>>> S_append = "/${BRANCH}"
>>>>
>>>> or removed it will likely work better.
>>>
>>> It was indeed a bug in meta-oe and the following fixed it:
>>>
>>> https://github.com/koenkooi/meta-oe/commit/8a917caaa5506fa0f875202243658a1c2fe60c40
>>
>> Additionally you would need to port the patch which mucks makefile fragment I think
>
> Any volunteers for that? My incremental build seems to work now, haven't tried a from scratch yet.

I had a patch for it half of which you already have. Once it builds 
through I will post.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




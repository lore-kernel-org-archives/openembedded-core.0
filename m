Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SplBl-0001EF-CN
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 21:06:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jul 2012 11:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="167831191"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 13 Jul 2012 11:54:49 -0700
Message-ID: <50006EF8.7070808@linux.intel.com>
Date: Fri, 13 Jul 2012 11:54:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342204577-9605-1-git-send-email-msm@freescale.com>
	<CAMKF1sq6g7uidfS5NXZ7xxujAjSz9vk7WFSreG1y2P1KUmLvcQ@mail.gmail.com>
	<CAEsOVNccp+nLyn7U=-Oz3=eMawi1r4haxkTQW6ROU+zD=pZdzw@mail.gmail.com>
	<CAMKF1sqEe-_gHEkVOcUs8tv6k+dmZNdGW7CbS1gxoX9q6jQtCg@mail.gmail.com>
In-Reply-To: <CAMKF1sqEe-_gHEkVOcUs8tv6k+dmZNdGW7CbS1gxoX9q6jQtCg@mail.gmail.com>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] gcc-package-runtime.inc: Fix QA warning
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
X-List-Received-Date: Fri, 13 Jul 2012 19:06:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2012 11:47 AM, Khem Raj wrote:
> On Fri, Jul 13, 2012 at 11:43 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Fri, Jul 13, 2012 at 1:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Fri, Jul 13, 2012 at 11:36 AM, Matthew McClintock <msm@freescale.com> wrote:
>>>>> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped
>>>>>    /usr/lib/libgomp.so.1.0.0
>>>>>    /usr/lib/libgomp.so.1
>>>>
>>>
>>> that should go into the real libgomp package not -dev package
>>
>> Err... all the so files? Or just the new ones?
>
> the ones that end with .so.* especially the above two.
> .so will go into -dev
>
Yes, Khem is right, I thought you had them originally in the -dev for a 
reason, so that's where the SOLIBDEV and SOLIB extension can used as 
they define .so and .so.* respectively

Sau!

>>
>> -M
>>
>>>
>>>
>>>>   FILES_libgomp-dev = "\
>>>> -  ${libdir}/libgomp*.so \
>>>> +  ${libdir}/libgomp*.so* \
>>>>     ${libdir}/libgomp*.la \
>>>>     ${libdir}/libgomp.spec \
>>>>     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
>>>> --
>>>> 1.7.10
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
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
>
>




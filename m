Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Spl5I-0004Kh-D9
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 20:59:24 +0200
Received: by eeit10 with SMTP id t10so518263eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=7GOrK6EYGz0lPd8lPYoQe4Cn1JWP7XyD7RjPKBVeg4E=;
	b=xqmwiOHdVnVXJn9tzIRFObczVcLo/NRgJCj98eX0CHcuhYw0SSYteCNfk4OwhIIELt
	pQ7UdfX+07EpQIdzczUzhja/QjHUEXgfzNPY87QTZoFn+bHMrkCMYPnMegGw5V+zlkCn
	srGCCRWKDo+Vds7K8EzHMti6blkG4EpxPQPl70TwTayXF81msEHzVOThCTG4W/oWTop8
	5WQmTUNSHOWZgBA4r894q9Ky3ktjfFGMmIb2GL8FDFaPZu3Nj4QjkorsnXdi+Si0KC7N
	G6HL39T7vz1b8GErS+2RrBP5WEZlYjui4EUW1DRsy/HftU7pTO3vwQdarqh6dE+Hfdte
	s83A==
Received: by 10.14.53.4 with SMTP id f4mr586401eec.93.1342205289833; Fri, 13
	Jul 2012 11:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 13 Jul 2012 11:47:39 -0700 (PDT)
In-Reply-To: <CAEsOVNccp+nLyn7U=-Oz3=eMawi1r4haxkTQW6ROU+zD=pZdzw@mail.gmail.com>
References: <1342204577-9605-1-git-send-email-msm@freescale.com>
	<CAMKF1sq6g7uidfS5NXZ7xxujAjSz9vk7WFSreG1y2P1KUmLvcQ@mail.gmail.com>
	<CAEsOVNccp+nLyn7U=-Oz3=eMawi1r4haxkTQW6ROU+zD=pZdzw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jul 2012 11:47:39 -0700
Message-ID: <CAMKF1sqEe-_gHEkVOcUs8tv6k+dmZNdGW7CbS1gxoX9q6jQtCg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 13 Jul 2012 18:59:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 13, 2012 at 11:43 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Fri, Jul 13, 2012 at 1:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Jul 13, 2012 at 11:36 AM, Matthew McClintock <msm@freescale.com> wrote:
>>>> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped
>>>>   /usr/lib/libgomp.so.1.0.0
>>>>   /usr/lib/libgomp.so.1
>>>
>>
>> that should go into the real libgomp package not -dev package
>
> Err... all the so files? Or just the new ones?

the ones that end with .so.* especially the above two.
.so will go into -dev

>
> -M
>
>>
>>
>>>  FILES_libgomp-dev = "\
>>> -  ${libdir}/libgomp*.so \
>>> +  ${libdir}/libgomp*.so* \
>>>    ${libdir}/libgomp*.la \
>>>    ${libdir}/libgomp.spec \
>>>    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
>>> --
>>> 1.7.10
>>>
>>>
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



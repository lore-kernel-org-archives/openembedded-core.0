Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THbKV-0008U9-9m
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 16:14:11 +0200
Received: by eaac1 with SMTP id c1so911300eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XT5EPphI5nNpif4M7aD6GOrSVfHKYjl8Nh/TkpOkr24=;
	b=lBVi2/kQhoZzy7OY3rOABR4pWE3HVMv9czyKAtAio2kYa97JChnUcfjbzJX76Gf/Hq
	O0ewXh5AJSFydcGbJ4aMii4KQqKtP2Bu4cRj29Ag3j5hRl+9hM5BvcKJ1D7FHktTrLOu
	P/j6Y20HaflF1LN6ngVPzJfv8Ft2nedyIk2bk4L4XLYk0dd4HU1aeiiKS6NwoUrh4xns
	s1kGMWWS1D9ORhRC3yIEROEjSmT5Zhinc2X9g/UK1gX1ZOh8bQiCwMDarCwi5yMO/12n
	aEc60vbo4j9bvDC5U0fjr5uzib5krZ7vRL2qEM5S9Io/IOeWlBDIcZzzu70amuAFBFe7
	5biA==
Received: by 10.14.202.71 with SMTP id c47mr10166771eeo.42.1348840877820; Fri,
	28 Sep 2012 07:01:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Fri, 28 Sep 2012 07:00:47 -0700 (PDT)
In-Reply-To: <5065ACC4.7080505@windriver.com>
References: <1348485983-8294-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<1348486253.31293.28.camel@phil-desktop> <506054A0.6090309@intel.com>
	<1348825951.32611.30.camel@phil-desktop>
	<5065ACC4.7080505@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Sep 2012 07:00:47 -0700
Message-ID: <CAMKF1sqXEBa8iTSw2Cym8bPCjtDqY1QMPB+O6zW1Fac0HFLMmQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix for dynamic linker broken offset
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
X-List-Received-Date: Fri, 28 Sep 2012 14:14:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 28, 2012 at 6:57 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/28/12 4:52 AM, Phil Blundell wrote:
>>
>> On Mon, 2012-09-24 at 15:40 +0300, Andrei Dinu wrote:
>>>
>>> On 09/24/2012 02:30 PM, Phil Blundell wrote:
>>>>
>>>> On Mon, 2012-09-24 at 14:26 +0300, Andrei Dinu wrote:
>>>>>
>>>>> +-          *reloc_addr += sym->st_value;
>>>>> ++          *reloc_addr = sym->st_value;
>>>>
>>>> That patch looks slightly dubious to me.  Are you sure this doesn't
>>>> introduce any regressions elsewhere?
>>>>
>>>>
>>> I have insufficient data to affirm that it doesn't introduces
>>> regressions.
>>
>>
>> Presumably it does at least pass the eglibc and binutils testsuites,
>> right?
>
>
> That patch is a workaround for an ARM issue related to thread local storage
> and TLS offsets during runtime and prelinking.
>
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=1443
>
> Note, this is simply a workaround and not a final solution as it hasn't been
> vetted upstream.

Thats ok however we do have infra to run eglibc testsuite in cross env
so if that was done would have answered Phil's question

http://sakrah.dontexist.org/?p=6

>
> --Mark
>
>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



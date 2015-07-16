Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 21ACE607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:41:17 +0000 (UTC)
Received: by oige126 with SMTP id e126so3695787oig.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QsPnNJcHofbeBIOMTq5nQM0es2EfTNecgbT2w74Yf8c=;
	b=HxR9a81htp4UPSpGKOExjSFqrIVXgr6yFkiJ/MMQ1FnAe9QHcot+ryltXRcBbeHMNf
	OPu6HxlIaMw44ncftIK6WHSsifGhEY/hJJ93hQPqyUSGBkfWy7gGbJFNHGroCL0re24A
	BHRIP8y0KHHgzHkhjs3T3Fy6obLWCVyPmv5w7ToCZ43klSUz6mCdqJpvXzSOQLooV+rH
	L8BuFTthx9z60Xha9Ij5fmVzhjj9Mv+8FT2VGZFd/trDxJA79es+OFsD9HY8Xf0qzDjX
	ToPUNcmkl6dEl7ZmZQGsBrsu7+rzSdr1shIp4w1OGAqQL0qs2yvf1nELcek1Z6cnFAkp
	DcWw==
MIME-Version: 1.0
X-Received: by 10.202.217.68 with SMTP id q65mr9247339oig.17.1437079277689;
	Thu, 16 Jul 2015 13:41:17 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Thu, 16 Jul 2015 13:41:17 -0700 (PDT)
In-Reply-To: <A4E25F8E-FBB2-4DF9-B208-3A58A2DC71C3@gmail.com>
References: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
	<CAJ86T=VE7a7rUMZMB8LTX0emuqkLOE=E_PvARh4JcQwZuJ+WCw@mail.gmail.com>
	<A4E25F8E-FBB2-4DF9-B208-3A58A2DC71C3@gmail.com>
Date: Thu, 16 Jul 2015 13:41:17 -0700
Message-ID: <CAJ86T=XJ1AR1cnYAYRJCJbMmaV9uBTDnFs4_SnwA89ee-ua4Mw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] glibc 2.22
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
X-List-Received-Date: Thu, 16 Jul 2015 20:41:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 14, 2015 at 5:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jul 14, 2015, at 2:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Hi Khem,
>>
>> On Mon, Jul 13, 2015 at 10:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Hi All
>>>
>>> glibc 2.22 will release end of this month. For some time I have put together the update here
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=02e73ea526d94f21c7ef82eb96b062eff8ebb825
>>>
>>> It works pretty well for machines I have tested it on ( arm/x86 ) but would be interested if more wider trial could be carried
>>> out and issues reported between now and release can be addressed.
>>>
>>> Please give it a try if you have spare cycles
>>
>> This was building OK yesterday, but today
>> "0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch" is
>> failing to apply due to this upstream change:
>>
>>  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=edcfe9eab03ea3dd1b3e04b6056a7663c40265c4
>
> Thanks for reporting. It has been fixed and branch rebased
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=c43cd1969696970affb094fc0b20ca02c966ecbd
> is new commit in rebased tree

It looks like upstream changed again last night:

  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=b632bdd3f7c0ba0c79f23f5e4404eebb87ebdaa8

so 0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch
needs another update.

>>
>>>
>>> Thanks
>>> -Khem
>>>
>>> --
>>> _______________________________________________
>>> yocto mailing list
>>> yocto@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/yocto
>>>
>


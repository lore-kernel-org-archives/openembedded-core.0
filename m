Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADB1760AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:44:42 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g73so92197637ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 06:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZxnHgGlI0dkModBfpw/AnKc2cyX5y4o69w6f1TltCbc=;
	b=CTDW/TznBzbINSycgABOyi0au5bLTiLNL3wr/9H54W7jP+DNJtPzl21jTvEAk1Mrgv
	BsEpJySpaJ2KRwkfW6Z6uXdGpb+GVIkGnCWA5lUz/A6hvCkc+DwSUeqhkToeoYVoP+H4
	N9ntqvK57ibIERL9M1Z2a4CM2kBFldWempEG0q9zgIa1xbBiMFJv2vp7HRBsdXN8F/ZZ
	r9djHhSqMVqHxLqWijPX7cJo9HCMw1v1cc2Zgi6kpYiBRWoV3H/58KqAh/HS/DqR7xh5
	q5cuJPTubfvoSBetQQBbuw+I6oLfr+uR2vF9ZwpuUVPXFvj+S2cI8acr5/BKQYu2rQih
	OEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZxnHgGlI0dkModBfpw/AnKc2cyX5y4o69w6f1TltCbc=;
	b=U/p+htXbUOkFOkImL9rssRHhT+Z/lVuNNRy3Wznogkw4VnUi1jk2GGh8qVXCTecLwf
	ho5gxpE6jIfsMD56Q73uVm4FvGQerJXPl7qRbQ/mP3K9Xgj72HfpvLtpJAfac2piQ2A+
	/ZCC4JEiOgOZHhTk9KAM9gWqnr8s1KklB3Dtul/DGvL1bOEmKVUqZl8FFQSPRF4C7GF3
	q2B+N1p1FiEAtllyvvdcNxgED3314CvKdhW+Oh3vtxu2z8lNMMEmZKsVGvpgwX/aqAwi
	ZotqkiyFNvoLa+zQfagZrhEaEGTVdOJJRYKcrdkhsrxcKt/1WaBqRsVCZzzFgVR+JxSr
	sKgA==
X-Gm-Message-State: AG10YOTu504OpdqH3JQhXes9Ofl8faF56L+PI+b84EWzp2tNC9PeQVs6FlDtzwPQX/kYh1IbD8Auxzua0Y58fQ==
X-Received: by 10.107.9.211 with SMTP id 80mr4335207ioj.112.1454078683628;
	Fri, 29 Jan 2016 06:44:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 29 Jan 2016 06:44:14 -0800 (PST)
In-Reply-To: <56AB73C0.8030505@linux.intel.com>
References: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
	<56AB73C0.8030505@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jan 2016 06:44:14 -0800
Message-ID: <CAMKF1spkRPwBzY+6j6pVM_epfB2sVYS37-i+s9rJw4-rTXOMbQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Glibc 2.23 and binutils 2.26
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
X-List-Received-Date: Fri, 29 Jan 2016 14:44:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 29, 2016 at 6:14 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 01/17/2016 01:54 PM, Khem Raj wrote:
>>
>> upstream glibc and binutils release branches have been cut out and are
>> being made ready for next release
>> I have put together update patchset for both of them
>>
>> here are the branches
>>
>> https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.26
>> https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23
>
>
> Hello Khem,
>
> when are you planning to submit these?

binutils exposes a problem for ppc as a result kernel fails to build.
The fix is to drop
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch

that patch makes generic ppc configs to be specific to fsl ppc.
but we need context as to why this was done

glibc is still not released.

>
>
> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


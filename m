Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD936B5C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 18:02:56 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id 13so6081818lba.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DLWiugsVPqvMHff/lh4+MP46zbXrdLb1OWiIDhaicRk=;
	b=wK7JneGfWbX9CYks2XEr5gSP0MHR9dBRexLTHi4053OUFdWrSwtVYz3TWzhK2ybrvx
	oM4bVWto3U4/GyPA+XaqkkP30JFaKoOK4lLt1ZGQwnCw0QxCEgoKcZboCfucOHLEe+o6
	KhuN6nbvwAkacF981H/95DhKKzJolcNI5P7MTNIMsGpXwtP1YWXgKVOwcEYgzQP+jeYi
	nd6UYUsu/ciTx5rO1l7KJAOyHPRLFt2uc5YHvLnyA6n8bUcP9TrX4gJY0l4ecXxiEm7a
	A07YpqVBnLpfsbG9F1Wj9B2mOH1+Qxew68ThGfp/Yce4kythjt/XQ6HlspcYvtFFStMm
	j6ww==
MIME-Version: 1.0
X-Received: by 10.112.35.225 with SMTP id l1mr2579263lbj.37.1376416976353;
	Tue, 13 Aug 2013 11:02:56 -0700 (PDT)
Received: by 10.112.158.229 with HTTP; Tue, 13 Aug 2013 11:02:56 -0700 (PDT)
In-Reply-To: <520A73D7.9030508@windriver.com>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
	<CAOMwXhP2nK2kjwseLjH0G-Wc9u20cOms-TWbF7zpYrya-GX8=w@mail.gmail.com>
	<CAOMwXhNFwVwt4G_v-SMMph=J3zvv=Z6Jh=LvEKZGVO=_zpChrg@mail.gmail.com>
	<520A6DDC.5060609@windriver.com>
	<CAOMwXhMnojFEXBG0H02CH4B7DTMiFQeJMOt9bvuGbCjWmh-2NA@mail.gmail.com>
	<520A73D7.9030508@windriver.com>
Date: Tue, 13 Aug 2013 14:02:56 -0400
Message-ID: <CADkTA4PNTCW9X33Otv6YNjomPVtdCH3Xc6sEbnuOywdahe+dcA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 18:02:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 13, 2013 at 1:58 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 8/13/13 12:40 PM, Laszlo Papp wrote:
>>
>> On Tue, Aug 13, 2013 at 6:33 PM, Mark Hatle <mark.hatle@windriver.com
>> <mailto:mark.hatle@windriver.com>> wrote:
>>
>>     On 8/13/13 12:23 PM, Laszlo Papp wrote:
>>
>>         s/which files/which lines/
>>
>>
>>     The kernel configuration mechanism has a tool that will combine the
>> original
>>     configuration, and any listed configuration fragments (.cfg files).
>> It will
>>     combine these, and then filter them in such a way that last-in wins.
>>
>>     See the Yocto Project Linux Kernel Development manual, section 2.2.3:
>>
>>
>> http://www.yoctoproject.org/__docs/current/kernel-dev/__kernel-dev.html#changing-the-__configuration
>>
>>
>> <http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration>
>>
>>
>> Could you please clarify how that is related to my question? What I wanna
>> understand is: I set something in the config as I wish, and then the
>> bitbake
>> file is getting chopped respectively like with "ifdef/elif" etc in C/C++,
>> but
>> this time inside the python script defined in the bitbake file.
>
>
> You asked: How will this know which lines exactly to disregard in the
> busybox include file (".inc")?
>
> My answer is that, according to the quoted documentation, the tooling, as
> described in the above URL, does this as a last-in processing, based on the
> filename(s) of the SRC_URI components.
>
>
>> I am well aware of that you can customize the defconfig, but my question
>> was
>> about the python function.
>
>
> Specifically for the busybox package, the python fragement "find_cfgs(d):"
> located in the busybox.inc file finds the .cfg files, and collects them into
> a list.  They are then processed by the 'merge_config.sh' script that is
> called as part of the do_configure task.
>
> I believe the merge_config script is provided as part of the
> linux-libc-headers or linux-yocto package, but I may be incorrect on that.

close, it's from the kern-tools package, but it is an upstream kernel script. We
use it from kern-tools to avoid fetching the kernel to use it for busybox.

Bruce

>
> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SFj3I-0003WN-QL
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 11:32:24 +0200
Received: by wera1 with SMTP id a1so719088wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=jNauHF1GEw0gNpT2nObkzVLx5aGvb2AO33FP+MgA52Y=;
	b=LFyVIRujkWibo8iqhljXEzewSpGceVM0pTg0x9l5Cb75AESE6buo8D2DdV34wgeWHy
	fA/b/570A6bxtioLI6ELm39Ia01XXuXw325fpnpIknr13AE7Px+ITVErkCUNEhkDrzz8
	LeXFt8uZ5PvoEAlYyDkmFr2OTQzNIB3aWMAid49Q5oAOQqFBSof3OcsXAqwENPs2mgwS
	DMmz9OIPVa6Fg/BdsQWdHk0o7I9NNZqTeUC7oGA0stfaKlmSrFCi8MzR0SvUN1qD8fWN
	BFMm1xnILX4ckpGTou5uD0yy32XmCnldkkrrOYgPjMbo2WOCONU2S9ekoEA6k7ZcTvbV
	xlvA==
MIME-Version: 1.0
Received: by 10.180.92.130 with SMTP id cm2mr3003991wib.4.1333617793499; Thu,
	05 Apr 2012 02:23:13 -0700 (PDT)
Received: by 10.223.104.68 with HTTP; Thu, 5 Apr 2012 02:23:13 -0700 (PDT)
In-Reply-To: <4F7D2490.5060102@windriver.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<2905489.oBl1N3jSJA@helios> <4F77BE14.6000304@windriver.com>
	<1967286.NbkyaBu6kN@helios> <4F7D2490.5060102@windriver.com>
Date: Thu, 5 Apr 2012 11:23:13 +0200
Message-ID: <CAGiJk9cMwG1JkC_NTyUHdBD20VnE7K3XWzyMnA+1+q1j4BWndw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 05 Apr 2012 09:32:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/5 Robert Yang <liezhi.yang@windriver.com>:
>
>
> On 04/01/2012 08:00 PM, Paul Eggleton wrote:
>>
>> On Sunday 01 April 2012 10:31:48 Robert Yang wrote:
>>>
>>> On 04/01/2012 08:47 AM, Paul Eggleton wrote:
>>>>
>>>> usr/bin/icemaker: No such file or directory
>>>
>>>
>>> This is a known issue, there is an work around, it seems that the MACHI=
NE
>>> is
>>> qemux86, and host is x86_64, we can:
>>>
>>> cp
>>>
>>> tmp/work/i586-poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd=
239e9
>>> 6d2ed61fc-r0/git/build/bin/icemaker
>>> tmp/sysroots/x86_64-linux/usr/bin/icemaker
>>>
>>> The problem is that we don't have a kdelibs4-native, and it seems it is
>>> not
>>> easy to add it.
>>
>>
>> Ah, I see I neglected to install kdelibs-devel; but on the version of
>> Fedora I
>> am building on when I do install it that executable is not provided (at
>> version 4.6.5 perhaps it is too old). I've copied it as you suggested bu=
t
>> then
>> I run into the lack of kconfig_compiler. On this machine "yum
>> whatprovides"
>> tells me that the only package that provides kconfig_compiler is
>> kdelibs3-devel
>> which is clearly not what is needed.
>>
>
> For the kconfig_compiler issue, I used a hacked workaround:
>
> 1) cd /usr/bin
> 2) ln -s kconfig_compiler4 kconfig_compiler
> 3) ln -s kconfig_compiler4 makekdewidgets
>
> Fortunately, kdelibs4-native has been successfully ported currently, we w=
ill
> submit the patch sooner, so these problems would be fixed with
> kdelibs4-native.
>
> Other problems you may meet are:
>
> 1) Sometimes the raptor and rasqal_git.bb may fail, just rebuild them
> =C2=A0 would fix the error, seems strange errors.
>
> 2) After then build successed, we can start the kde:
> =C2=A0 $ runqemu qemux86
> =C2=A0 edit /usr/bin/startkde there is a host absolute path in it:
> =C2=A0 LD_BIND_NOW=3Dtrue
> /host/path/to/tmp/sysroots/qemux86/usr/lib/kde4/libexec/start_kdeinit_wra=
pper
> kcminit_startup
>
> =C2=A0 Fix it to:
>
> =C2=A0 LD_BIND_NOW=3Dtrue /usr/lib/kde4/libexec/start_kdeinit_wrapper
> +kcminit_startup
>
> =C2=A0 Then
>
> =C2=A0 $ startkde
>
> // Robert
>
>
>> I can't help feeling we need to have kdelibs4-native and forget the
>> consequences of having to extend qt4-native if that's what's required;
>> otherwise it's just too hard for people to build.
>>
>> Cheers,
>> Paul
>>
>

Seems like it would be a good idea to provide a test image,
so testers have a quick and easy starting point.

I will see if I can create some low dependency images for
plasma-desktop and plasma-active.


--=20
Regards
Samuel



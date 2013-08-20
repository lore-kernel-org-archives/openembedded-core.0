Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id BBB986B6AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 22:15:15 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id u12so556600qcx.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eA1Q42KeoNSHX1SFAqiULeQBfkvcEWKVM55oH3vZzyw=;
	b=BPcXIzo8NaT8bPv/bg9RfXsOGJs/xosAQbhMAgNHRtCZ9h5JOQmc3+mGIYyF3Sgdvm
	pa9huNmmGK6HwiLGCBk8Q07PqxGggwf0cLqeriJW9c2S3DgjyIelLI6PDEzjCmD4a+oU
	cqrFwgX1krXN0YCaltY2Lk/CxV8BpJ/qtav4ZwFqdt1f2HcoRqPQKGml5X/i9/OjU6h9
	U8ASLsie1Mdz10iML/5mfOCTbdebk/cffm1VoHmtj+L6CHg3bJ2VyQ5xjyke2+wBOsNy
	wvneGY2t9FlrnPkmTf51P+oaf1Nt3/H/WuDXwTJDADL1XBGkEY1BN7yAiuWP8gGykXCA
	kSXw==
MIME-Version: 1.0
X-Received: by 10.229.230.129 with SMTP id jm1mr1183417qcb.7.1377036915806;
	Tue, 20 Aug 2013 15:15:15 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Tue, 20 Aug 2013 15:15:15 -0700 (PDT)
In-Reply-To: <1507505.mjujvFaXNS@helios>
References: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
	<11672169.pPNsTrMMam@helios>
	<CAF6bG8e=cCDyJGDNebVqaNSJ31PNYCUQ9xPNf_4p+mDVDUMbwA@mail.gmail.com>
	<1507505.mjujvFaXNS@helios>
Date: Wed, 21 Aug 2013 01:15:15 +0300
Message-ID: <CAF6bG8eN02y-jVmrF=onOjZfwbd_-9HVgfsgkNOHYE38ftL9JA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu-native build regularly failing
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
X-List-Received-Date: Tue, 20 Aug 2013 22:15:16 -0000
Content-Type: text/plain; charset=UTF-8

On 21 August 2013 00:16, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Tuesday 20 August 2013 23:26:44 Marko Lindqvist wrote:
>> On 20 August 2013 16:32, Paul Eggleton <paul.eggleton@linux.intel.com>
>> wrote:
>> > On Tuesday 20 August 2013 15:51:21 Marko Lindqvist wrote:
>> >> Build of qemu-native regularly fails with:
>> >> |   LINK  sh4-softmmu/qemu-system-sh4
>> >> |
>> >> | /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
>> >>
>> >> `_XEatDataWords'
>> >>
>> >> | collect2: error: ld returned 1 exit status
>> >>
>> >> This might be some dependency missing, as building first some packets
>> >> (+ more importantly their dependencies) that do not depend on qemu and
>> >> only then qemu dependant image success.
>> >
>> > Do you have something else causing libxext-native to be built by any
>> > chance?
>>
>>  Yes, it seems to be difference between the tree where build fails and
>> the one where build success that former has no libxext-native built.
>> Further, I tested just building libxext-native before building
>> qemu-native, and then the build succeded.
>
> The problem is we want qemu-native to be buildable both on systems without X11
> and systems with X11, so the dependency has to be floating, and this is more or
> less acceptable for a native recipe - there's only a problem when libxext-
> native needs to be built. I can't see a lot of value in building libxext-
> native in any case - what is causing it to be built on your system?
>
> Cheers,
> Paul


 I'm still running more tests - this seems to be complicated matter.
For one, I just got successful build from empty tree by building
qemu-native directly. That was build targeted to arm, while failing
builds have been for x86 (native is amd64). Also, I think (but cannot
be 100% sure any more) build has succeeded on trees where nothing
depends on libxext-native but still *something* was needed to be built
before qemu-native.


 - ML


Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 25FB1606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 15:01:58 +0000 (UTC)
Received: by obbea2 with SMTP id ea2so59315595obb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 08:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lGqx8P2Fz8oD2jU+QXIMtYw89B3jYgz+xZ97AVJMixQ=;
	b=Ub3vo89QPmD5UhzqQdlZXEr+W/JBOp33t86txu7vbdnrGrkybgiDbf9se/qxSU2hUj
	DPnxfQLKzG4rPSCPZCYQYkk0g5TVVeWzUOyIw6K1ZtkMeVw8wwsf2SFrQdIxpe4OJB00
	4kZgRhl2Z7xRFlEV/XhWkzYOGA6HDfzYUMHv3C+QovrMWs3rC+FUF5cLMFiGvKvTSYVc
	g6cJs0v/9y868SFP+CcCIlssJrRTeQRDyZPjHHlTdT/PV05Kil4oQoBW1WJcPkkwuuLB
	2v6Wr2iv2Pjcrop7GErBFZS+R8s86faw/ffGBow/VzldpXKdc8jCqNTbF96gUGo2Xhb8
	6YMQ==
X-Gm-Message-State: ALoCoQm0GtTlyFsVLjPUM7/dKHZ/cbQCgA+zRjtU9z7K/EGY3C/QZL/yJY6F8hAWQCzlDf5QNec/
X-Received: by 10.202.57.137 with SMTP id g131mr6897844oia.122.1432911719936; 
	Fri, 29 May 2015 08:01:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Fri, 29 May 2015 08:01:29 -0700 (PDT)
In-Reply-To: <CAMKF1sqHevjfEVQUBA_SsRFz1Aku+n8Q9tNdCGei=Uvuwsh=9g@mail.gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
	<73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
	<CAHiDW_F3w8FTR7Z_AWOMfCJfMy9sMpQofRB9uDuHErReAMJZyQ@mail.gmail.com>
	<CAMKF1sqHevjfEVQUBA_SsRFz1Aku+n8Q9tNdCGei=Uvuwsh=9g@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 29 May 2015 18:01:29 +0300
Message-ID: <CAHiDW_EPNdW-cqbe7x_Uw5ThwJ72PjsxT44qjHED7JAR0-h-uw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Fri, 29 May 2015 15:01:59 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2015 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> On Thursday, May 28, 2015, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>> On 28 April 2015 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
>> > I have had wayland/weston updates lying on my tree for some time now
>> >
>> >
>> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=eb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b
>> >
>> > tried git versions too
>> >
>> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=992c13dcd4b79fe64f4f9b8122627f918257ccef
>> >
>> > There are problem with emulator with 1.7 and libinput I guess where the
>> > mouse does not work
>> > in qemux86 as well as qemux86-64, it works fine with 1.6, I have tested
>> > all
>> > versions 0.8 and newer of lib input
>> > for no success. That was the reason I did not propose those patches.
>>
>> I've been testing this and it looks like mouse does not work even on
>> our current version of weston on QEMU, _if_ it's using libinput.
>> Current Weston recipe happens to work because we default to "
>> --disable-libinput-backend".
>
> On my contrib branch I have a patch for runqemu script to not use tablet USB
> device then it works. Also 1.8 release is coming out in couple of days the
> patches on that branch are tracking that too. Please test it out

I've tested with weston 1.7: the runqemu patch does indeed fix the
mouse problem (both with libinput 0.7 and 0.15). I think 1.7 is good
to go (at least on i965 it certainly 'feels' much better and
responsive), but if you feel like waiting for 1.8 that's fine too.

As for cogl: On QEMU cogl seems to fail regardless of weston/wayland
version, meaning anything using cogl fails to initialize EGL even on
current master.
On i965 everything cogl related seems to work on master, but the
clutter examples segfault after upgrading cogl and clutter to most
recent (Fedora 22 seems to have similar problems with clutter apps:
e.g. https://bugzilla.redhat.com/show_bug.cgi?id=1210992). I'll
continue looking at this but don't think it should prevent the wayland
upgrades.

Jussi


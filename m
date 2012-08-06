Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SyJv4-0000WF-Oj
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 11:48:14 +0200
Received: by ggmq1 with SMTP id q1so2040160ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=JDZWx8+ktJ2ZtIcrvo1SR9iNx2sr3IU/9mMQcpkmCsY=;
	b=TIct47nD4W+T9JJTXp4Ku3QqIaW5NEYpUfM1imJyh0u6Oavv2ICMHiRbK33LqEGZM+
	3vz/pi1HnR8zONZ8VgDfjXsNF3+3U4LFdAkjO1JWXMOjX+JSfn+8kgFr3gySxziJv+b5
	FH+KQlifGgf5KVXrnpt51qH3wJFkEBnh79kDJTKWm9pz0o0F2e2fkn3WqyxvSaYHRFTx
	DJcymGCARayhoD1o+zYgh2llP0/NX5Tf4HIDX9mmjE0vK1k5iTb/g2CIBSKj6f/YhJ77
	V/z/bJQBokUCoVtWHMS/z8/pjHxh7BdRvcz8Jc2DrwadcQsuTxD/L73Vzle4i2Iy7ncP
	ekAw==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr4820244igc.5.1344245789351; Mon,
	06 Aug 2012 02:36:29 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 6 Aug 2012 02:36:29 -0700 (PDT)
In-Reply-To: <501F8BEC.4080204@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
	<CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
	<CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
	<501EA63F.9090304@intel.com>
	<CALbNGRTmwH0yLJRQUrDUKBxLvC9bv7cE15_rnu50CCzDsUw0UQ@mail.gmail.com>
	<CALbNGRTevoBvucXfRxYi33_y48V=Bo237s1Knjhy2eFJzjfmvQ@mail.gmail.com>
	<501F76BF.9000605@intel.com>
	<CALbNGRSOR2wxo7jetrEAYAZesSBiLPqVxJx0r22Xzmfxb3D=3g@mail.gmail.com>
	<501F8BEC.4080204@intel.com>
Date: Mon, 6 Aug 2012 11:36:29 +0200
Message-ID: <CALbNGRRF6Vxga2mQmryyFazWQz3V_adcnPy1c6nOpF5Qg_n+CA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Mon, 06 Aug 2012 09:48:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 6, 2012 at 11:18 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
>
>
> On 08/06/2012 11:10 AM, Andreas M=FCller wrote:
>> On Mon, Aug 6, 2012 at 9:48 AM, Laurentiu Palcu
>> <laurentiu.palcu@intel.com> wrote:
>>>
>>>
>>> On 08/06/2012 01:49 AM, Andreas M=FCller wrote:
>>>> On Mon, Aug 6, 2012 at 12:30 AM, Andreas M=FCller
>>>> <schnitzeltony@googlemail.com> wrote:
>>>>> On Sun, Aug 5, 2012 at 6:58 PM, Laurentiu Palcu
>>>>> <laurentiu.palcu@intel.com> wrote:
>>>>>> You could give it a test yourselves and let me know your results. I =
will
>>>>>> send a version 2 of the patchset(as soon as we all agree on the
>>>>>> solution), with some changes suggested by Mark and some PR bumps
>>>>>> suggested by Koen.
>>>>> With the image I usually work with [1] and AMD Phenom II X6 1090 16GB
>>>>> RAM I get a measurable delay - see attachment. I would not be happy
>>>>> loosing latest do_rootfs enhancements (off topic - thanks for that).
>>>>> Remeber we are only talking of gtk-update-icon-cache. OK I could buy
>>>>> an intel host and work just with sato images but...
>>> I suppose you could, but nobody asked you to do that, it's your choice
>>> what's your build machine or what you'll be building for.
>>>
>>> Thanks for the measurements though. They do, indeed, show quite a
>>> significant amount of time (around 6 minutes). A run-once solution is t=
o
>>> be considered in this case.
>>>
>>>>>
>>>>> Andreas
>>>>>
>>>>> [1] https://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/maste=
r/recipes-image/xfce-full-image.bb
>>>> OK I know it is not that important: The image created with this patch
>>>> series creates tons of messages like
>>> Why do you think is not important. Please elaborate. Or is it irony?
>> Yes sorry - it was late night.
> It's OK, let's work together and find the best solution for all of us. I
> would also be pissed of if I had to wait an extra 6 minutes every
> do_rootfs run.
>
>>> I don't think is in anybody's benefit if you take this approach. :) All
>>> errors/warnings are important and they have to be taken care of.
>>>
>>>>
>>>> xfdesktop:446): GdkPixbuf-WARNING **: Cannot open pixbuf loader module
>>>> file '/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache': No such file or
>>>> directory
>>>>
>>>> and don't have icons at all. Did you run test that (on a hardware
>>>> plattform different to your host)?
>>> I only tested on qemu. And it worked just fine, without any errors. Wit=
h
>>> all icons in place.
>> Which hardware did you emulate? My tests were done for overo (ARM
>> cortext A8). I wonder if the created database is machine specific.
> I used qemuarm. As far as I know, the database shouldn't be machine
> specific. And, looking at the log you sent, it looks like all commands
> succeeded. Otherwise, the 'time' application would also signal in the
> log file if the command failed. Could please have a look, on your host
> (xfce-full-image-1.0-r0/rootfs/usr/share/icons/hicolor or
> xfce-full-image-1.0-r0/rootfs/usr/share/icons/gnome), to see if it
> creates the icon-theme.cache files? It does for me and I don't
> understand why it doesn't in your case...
>
I will check today evening since the machine with this data is at home...

Andreas



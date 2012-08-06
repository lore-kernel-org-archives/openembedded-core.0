Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SyJdn-0000D5-Qv
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 11:30:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Aug 2012 02:18:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="176449310"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 06 Aug 2012 02:18:37 -0700
Message-ID: <501F8BEC.4080204@intel.com>
Date: Mon, 06 Aug 2012 12:18:36 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
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
In-Reply-To: <CALbNGRSOR2wxo7jetrEAYAZesSBiLPqVxJx0r22Xzmfxb3D=3g@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Aug 2012 09:30:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit



On 08/06/2012 11:10 AM, Andreas Müller wrote:
> On Mon, Aug 6, 2012 at 9:48 AM, Laurentiu Palcu
> <laurentiu.palcu@intel.com> wrote:
>>
>>
>> On 08/06/2012 01:49 AM, Andreas Müller wrote:
>>> On Mon, Aug 6, 2012 at 12:30 AM, Andreas Müller
>>> <schnitzeltony@googlemail.com> wrote:
>>>> On Sun, Aug 5, 2012 at 6:58 PM, Laurentiu Palcu
>>>> <laurentiu.palcu@intel.com> wrote:
>>>>> You could give it a test yourselves and let me know your results. I will
>>>>> send a version 2 of the patchset(as soon as we all agree on the
>>>>> solution), with some changes suggested by Mark and some PR bumps
>>>>> suggested by Koen.
>>>> With the image I usually work with [1] and AMD Phenom II X6 1090 16GB
>>>> RAM I get a measurable delay - see attachment. I would not be happy
>>>> loosing latest do_rootfs enhancements (off topic - thanks for that).
>>>> Remeber we are only talking of gtk-update-icon-cache. OK I could buy
>>>> an intel host and work just with sato images but...
>> I suppose you could, but nobody asked you to do that, it's your choice
>> what's your build machine or what you'll be building for.
>>
>> Thanks for the measurements though. They do, indeed, show quite a
>> significant amount of time (around 6 minutes). A run-once solution is to
>> be considered in this case.
>>
>>>>
>>>> Andreas
>>>>
>>>> [1] https://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-full-image.bb
>>> OK I know it is not that important: The image created with this patch
>>> series creates tons of messages like
>> Why do you think is not important. Please elaborate. Or is it irony?
> Yes sorry - it was late night.
It's OK, let's work together and find the best solution for all of us. I
would also be pissed of if I had to wait an extra 6 minutes every
do_rootfs run.

>> I don't think is in anybody's benefit if you take this approach. :) All
>> errors/warnings are important and they have to be taken care of.
>>
>>>
>>> xfdesktop:446): GdkPixbuf-WARNING **: Cannot open pixbuf loader module
>>> file '/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache': No such file or
>>> directory
>>>
>>> and don't have icons at all. Did you run test that (on a hardware
>>> plattform different to your host)?
>> I only tested on qemu. And it worked just fine, without any errors. With
>> all icons in place.
> Which hardware did you emulate? My tests were done for overo (ARM
> cortext A8). I wonder if the created database is machine specific.
I used qemuarm. As far as I know, the database shouldn't be machine
specific. And, looking at the log you sent, it looks like all commands
succeeded. Otherwise, the 'time' application would also signal in the
log file if the command failed. Could please have a look, on your host
(xfce-full-image-1.0-r0/rootfs/usr/share/icons/hicolor or
xfce-full-image-1.0-r0/rootfs/usr/share/icons/gnome), to see if it
creates the icon-theme.cache files? It does for me and I don't
understand why it doesn't in your case...

Thanks,
Laurentiu

> 
> Andreas
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 



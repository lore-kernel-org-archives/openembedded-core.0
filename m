Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SyIZZ-0007rJ-Si
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 10:21:58 +0200
Received: by yhjj56 with SMTP id j56so1986932yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pJZJtU/HJBubmevtCYTqzaduue2yKzGrHO3WqMlqdb0=;
	b=iKWNfIspKP+YzoduN0wQkuxGMtrINMKg4wzdTG1+YJG1PGE5IrPputlU9FWp/AIsm6
	Cjcw1wq/Z1R3L8xo/CRdjKMLswoCjeUiEgs5dtzcy0StI9qTrOcBjyI66pSvmnUsa4kz
	7iQRoQ1vKxC6kHRK+cMoZgOmkMZBoRZ/9uk4kmvCWCo12PuoN1heCjHdCQ7m3IryoPOJ
	vVY1vP2O8OaO/L5XSzR66vzG7aCIh0wqbUeEV/ZhRiWPn+bEuMQdA2lF8sVkLAkO21j4
	MQHMkeRGZQ08vhLzfHozywOn3FEigVJATAooB60cMsbgaomkoOPsa75uVPwdYfgzz+V2
	BflQ==
MIME-Version: 1.0
Received: by 10.50.156.201 with SMTP id wg9mr4670870igb.45.1344240612648; Mon,
	06 Aug 2012 01:10:12 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 6 Aug 2012 01:10:12 -0700 (PDT)
In-Reply-To: <501F76BF.9000605@intel.com>
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
Date: Mon, 6 Aug 2012 10:10:12 +0200
Message-ID: <CALbNGRSOR2wxo7jetrEAYAZesSBiLPqVxJx0r22Xzmfxb3D=3g@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Aug 2012 08:21:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 6, 2012 at 9:48 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
>
>
> On 08/06/2012 01:49 AM, Andreas M=FCller wrote:
>> On Mon, Aug 6, 2012 at 12:30 AM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Sun, Aug 5, 2012 at 6:58 PM, Laurentiu Palcu
>>> <laurentiu.palcu@intel.com> wrote:
>>>> You could give it a test yourselves and let me know your results. I wi=
ll
>>>> send a version 2 of the patchset(as soon as we all agree on the
>>>> solution), with some changes suggested by Mark and some PR bumps
>>>> suggested by Koen.
>>> With the image I usually work with [1] and AMD Phenom II X6 1090 16GB
>>> RAM I get a measurable delay - see attachment. I would not be happy
>>> loosing latest do_rootfs enhancements (off topic - thanks for that).
>>> Remeber we are only talking of gtk-update-icon-cache. OK I could buy
>>> an intel host and work just with sato images but...
> I suppose you could, but nobody asked you to do that, it's your choice
> what's your build machine or what you'll be building for.
>
> Thanks for the measurements though. They do, indeed, show quite a
> significant amount of time (around 6 minutes). A run-once solution is to
> be considered in this case.
>
>>>
>>> Andreas
>>>
>>> [1] https://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/=
recipes-image/xfce-full-image.bb
>> OK I know it is not that important: The image created with this patch
>> series creates tons of messages like
> Why do you think is not important. Please elaborate. Or is it irony?
Yes sorry - it was late night.
> I don't think is in anybody's benefit if you take this approach. :) All
> errors/warnings are important and they have to be taken care of.
>
>>
>> xfdesktop:446): GdkPixbuf-WARNING **: Cannot open pixbuf loader module
>> file '/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache': No such file or
>> directory
>>
>> and don't have icons at all. Did you run test that (on a hardware
>> plattform different to your host)?
> I only tested on qemu. And it worked just fine, without any errors. With
> all icons in place.
Which hardware did you emulate? My tests were done for overo (ARM
cortext A8). I wonder if the created database is machine specific.

Andreas



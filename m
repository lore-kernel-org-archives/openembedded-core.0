Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id A90606061F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 14:12:34 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id e8so20173830ilc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 07:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZTusoQqTb2aswdzcgjSP7QROYIje5gabQs2t2RklBxc=;
	b=GMi8CYpWf2wuH7612uWUfuAXaPPqm+hVztIv3meioEDrJUuh4G62hnZ4ILXn/EwzGT
	KWq5U1FNN+uOQhZpCQKFDsZipcR7wl6HZ1HIBkFh/uzvmSxx7gLZyfMG25BXm/o+NnYw
	xv9bzZ0VmC2OPApl7PHpJne+6DaCD28flpdh5xoIKaGHwA7ZZ4WTlOIgeSWdkr8IWxR0
	0q7F5O0zCIAiCN6VN4FAC43T6Joxp5CK3JmYO7ubQRd8gPMII26WDSAIWDzsKu82zUPM
	auuN5VX8ZZ1ZInL/FWrck1k3TXOSQICSmeRleWJxPSGjohonW1AQmjYQTNmFOsga40/o
	BtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZTusoQqTb2aswdzcgjSP7QROYIje5gabQs2t2RklBxc=;
	b=ubz9UyTMqU5+nAFt+vohLDATlKElI6iJkt0+cesy2Yg4MO33+3Z38OZo/V4kS03BKH
	iydAbPZ+xX5d5IlTS+fjOqFqju8XqRHbooVjxg4b2CQ6EO1OmdgI+B6K07G/9l76FFBj
	uTWvAfsBHB6bBtvrQXnMEks7rZRKM/ovZpyDnP5ZqkVIfABwes0Q7JKd5PU/oEeRaYAH
	K1zyQsBoGPjQs/bTihI7AzccVYn/elsPsvLhswpmiti5YgCltG6utWHn14mVrRBarRwB
	sI8S+YNyb1LyEqhzEUjSRXMdZ/ex6ascCEHTMX/FK+lZSWtscXJaLWDpVd5Q3oGKR50J
	0JNA==
X-Gm-Message-State: ANhLgQ2wPLLeQtBwgwenllxiNPk9e8rn7QB9daI6FrvJp5qGlcX/j5ht
	c3pqCMkonfaE6ZNT0GGEvF2VPJA7AfigzulU0Z/aUQ==
X-Google-Smtp-Source: ADFU+vsdgOxrsk22zs0LLBIJ4pS9tLCf6uJQqaTFvTHTeR+4PaWJ+n/2N0e+/n9CzfvjUZmP30GN/IPHweyjRtGyWHY=
X-Received: by 2002:a92:d4d0:: with SMTP id o16mr5429459ilm.40.1584454355338; 
	Tue, 17 Mar 2020 07:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<CAMRc=MdcU5UTt6iLcpjUDxs5JkwD3db7QP--b2xjXBpqiHfguA@mail.gmail.com>
	<f1026c8fbd01e72648f487e024ce3b18e09581cb.camel@linuxfoundation.org>
	<CAMRc=Md9CECDMOq1VzgmxO0w9L=eD+HcXcUeZkRp3hGrXBsnvA@mail.gmail.com>
	<20200317134535.kle77hptmqsj5yf5@qschulz>
In-Reply-To: <20200317134535.kle77hptmqsj5yf5@qschulz>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Mar 2020 15:12:24 +0100
Message-ID: <CAMRc=Md8yU_LwfMXrs5fA0-TvUpDJSOFbjfiEz7QhjkcMOQ=xw@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: Guillaume Pain <gpain@baylibre.com>, Jerome Neanne <jneanne@baylibre.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Solving a circular dependency issue between the main image and initramfs
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
X-List-Received-Date: Tue, 17 Mar 2020 14:12:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 17 mar 2020 o 14:45 Quentin Schulz
<quentin.schulz@streamunlimited.com> napisa=C5=82(a):
>
> Hi Bartosz,
>
> On Tue, Mar 17, 2020 at 02:26:37PM +0100, Bartosz Golaszewski wrote:
> > pon., 16 mar 2020 o 12:01 Richard Purdie
> > <richard.purdie@linuxfoundation.org> napisa=C5=82(a):
> > >
> > > On Mon, 2020-03-16 at 11:48 +0100, Bartosz Golaszewski wrote:
> > > > There has been no relevant feedback, but I've been experimenting wi=
th
> > > > various things. I think that the best approach would be to make ima=
ge
> > > > artifacts installable into dependant recipes' sysroots (in
> > > > /usr/share/images/). This way the initramfs recipe could calculate
> > > > the
> > > > dm-verity hashes from the resulting ext4 image before it gets
> > > > deployed. We could also modify the kernel recipe to not fetch the
> > > > initramfs image from the shared directory but instead have it
> > > > installed in its sysroot.
> > > >
> > > > For this I tried to re-enable the do_install task in image.bbclass.
> > > > Unfortunately either I'm doing something wrong or standard tasks ar=
e
> > > > subject to different rules when it comes to dependencies. I've been
> > > > so
> > > > far unable to make do_install depend on any image tasks (i.e. make
> > > > do_install depend on do_image_ext4/wic etc.) no matter if I use
> > > > do_install[depends] or addtask or appropriate helpers from python.
> > > > Unfortunately I've been unable to find any information on that in t=
he
> > > > manual.
> > > >
> > > > Is there some trick to changing the dependencies of standard tasks?
> > >
> > > I don't know how exactly you're configuring the system but it should =
be
> > > possible to have the main rootfs built first, adding in the signing,
> > > then have the initramfs depend on that.
> > >
> >
> > I too thought this should be possible with current implementation and
> > yet I've spent so many hours on this to no avail it's not funny. :(
> >
>
> I haven't read carefully your thread but ran into what seems to be a
> similar situation two years ago:
>
> https://youtu.be/jtLQ8SzfrDU?t=3D2336
>
> So, TL;DR, couldn't create a fitimage with kernel-fitimage because of
> circular dependencies and we had to create a new fitimage bbclass which
> wasn't inherited in the kernel but by the image recipe IIRC.
>
> I didn't think at that time kernel-fitimage made sense because you can
> technically put whatever you want in a fitimage. I can technically not
> have a kernel in it. I thought a fitimage bbclass inherited by an image
> recipe made much more sense. It was two years ago, didn't share anything
> with the YP folks back then, so my bad. I haven't had this issue since
> then (no product requiring this) so didn't think much more about it :/
>
> I promised once we had something good enough we would give back to the
> community. Now that I've left that company and forgot to do it, you can
> throw rocks at me.
>
> Good luck and keep us posted please.
> Quentin

Thanks Quentin,

this is pretty much what Ernst suggested earlier in this thread too.
I'm not a fan of this solution.

Richard et al: do you think making the fitimage class something an
image recipe could inherit is a good idea?

So far I think there are three solutions to the problem:

1. Make wic image a separate recipe that could run after everything
else is done and deployed.
2. Make image.bbclass install its artifacts into whatever recipe DEPENDS on=
 it.
3. Make fitimage a bbclass that could be added to IMAGE_CLASSES.

Bartosz


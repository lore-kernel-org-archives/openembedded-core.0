Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sy9oc-0000Dn-FB
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 01:00:54 +0200
Received: by obc16 with SMTP id 16so1354045obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 15:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4Rk0oTLnbrx6QaT3zwdOi8kXxup35nUoNdyMCBrHdlo=;
	b=DDc8ro/+TEPNklZLBrWFQbm9QkpuoWZzpvVFW9t7Z8Sbm5fqFrbT1nK+COptXMNPOF
	XEGneMgMWGf1YqSG1kkkkfqeVBklGrTU2V7QcGJne1ocr0oaPxSxLO8CdtacgZoQDZP4
	wBFFnEHLyI0VytYAopRxzIxVvOKVHyp0BCst8fhD6IP6CUOhs1barsSbvgzELZ1Kd9gy
	hk//h4xfdtMErb0+F1g84BIVUhkeX1fCMr4uiVM6CkV5ZsEjnX4RzXOBFOZhbFesS6uf
	iFUqEmmOw7hRo0ciBZ+mSmtdFm4Htt+0K7Wa2SNPViAzSvWWfznI0mK5MeGZCAdqJcih
	fR1Q==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr3881754igc.5.1344206949490; Sun,
	05 Aug 2012 15:49:09 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Sun, 5 Aug 2012 15:49:09 -0700 (PDT)
In-Reply-To: <CALbNGRTmwH0yLJRQUrDUKBxLvC9bv7cE15_rnu50CCzDsUw0UQ@mail.gmail.com>
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
Date: Mon, 6 Aug 2012 00:49:09 +0200
Message-ID: <CALbNGRTevoBvucXfRxYi33_y48V=Bo237s1Knjhy2eFJzjfmvQ@mail.gmail.com>
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
X-List-Received-Date: Sun, 05 Aug 2012 23:00:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 6, 2012 at 12:30 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, Aug 5, 2012 at 6:58 PM, Laurentiu Palcu
> <laurentiu.palcu@intel.com> wrote:
>> You could give it a test yourselves and let me know your results. I will
>> send a version 2 of the patchset(as soon as we all agree on the
>> solution), with some changes suggested by Mark and some PR bumps
>> suggested by Koen.
> With the image I usually work with [1] and AMD Phenom II X6 1090 16GB
> RAM I get a measurable delay - see attachment. I would not be happy
> loosing latest do_rootfs enhancements (off topic - thanks for that).
> Remeber we are only talking of gtk-update-icon-cache. OK I could buy
> an intel host and work just with sato images but...
>
> Andreas
>
> [1] https://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/re=
cipes-image/xfce-full-image.bb
OK I know it is not that important: The image created with this patch
series creates tons of messages like

xfdesktop:446): GdkPixbuf-WARNING **: Cannot open pixbuf loader module
file '/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache': No such file or
directory

and don't have icons at all. Did you run test that (on a hardware
plattform different to your host)?

Andreas



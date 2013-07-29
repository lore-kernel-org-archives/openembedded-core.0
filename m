Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7F86B1EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:38:36 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so3009412eaj.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:date:message-id:in-reply-to:references:user-agent
	:subject:mime-version:content-type:content-transfer-encoding;
	bh=jlDBMPUinJ1zaG21pL0l4d8YQyoizlaHHrEpmdJSpMY=;
	b=mIDFSjy02O8TdyNRBlPYW4qSQ1xmeGsmuQY5oASz3/Z15gkml7us/3bHoh0LZAApYj
	h6bnnPm/HCB9k3oQWaoLqochLzjr49F2IUxaU1vjKvVmpk6RvpHJ/EPWK6XwhvMaSJQn
	VjtcBSLgI0CzBNI+lrkGLXeRewFHNSGDOPw3U3RjC6jQnGj0UTn4ULtHbpnDHqxprVCT
	T8ED6Ol+zumPUyQ0Dn+LMW9/S/CXtpIRi0OPcw05lQhCR/moE17JOXVIsKFWQGZiN9Q4
	Sacm0sp2hdmnA+WCNMBAlyB/sCKrsWWsIJAyN7Cso1vFBz58B+Si5EFe2Cfk9uwBFMLc
	u1SA==
X-Received: by 10.14.218.136 with SMTP id k8mr60769029eep.111.1375112316292;
	Mon, 29 Jul 2013 08:38:36 -0700 (PDT)
Received: from [46.206.9.55] (046206009055.atmpu0017.highway.a1.net.
	[46.206.9.55]) by mx.google.com with ESMTPSA id
	bb14sm1919154eeb.17.2013.07.29.08.38.19 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 08:38:35 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Date: Mon, 29 Jul 2013 17:42:11 +0200
Message-ID: <1402b178308.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <CAOMwXhOjyAtjsRbiHT3ufeApZVvkEE47pgBhXDsE0wxeHOZJiQ@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
	<CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
	<CAOMwXhO2A75jPxM4FdU=XBgVRjsxW24hDVLOf8eub2Wp4CmGDA@mail.gmail.com>
	<1402aa377f6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhOjyAtjsRbiHT3ufeApZVvkEE47pgBhXDsE0wxeHOZJiQ@mail.gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.4.0 (build:
	2100294)
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 15:38:37 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 29 July 2013 15:34:29 Laszlo Papp <lpapp@kde.org> wrote:
> No, it should be disabled by default based on the fact most people do not
> need this "rfkill" what even upstream has been disabling, and it would be
> only enabled for those two utils out of the several thousand out there,
> anyhow.

It was disabled just because of one guy known to notoriously use outdated 
toolchains on recent packages. But OK, I'm out of this whole discussion.

Cheers,
>
> I am just repeating myself as the same is questioned again, again, and
> again.
>
> ... or you really think that "rfkill" is needed for the majority use cases
> out there?
>
>
> On Mon, Jul 29, 2013 at 2:34 PM, Bernhard Reutner-Fischer <
> rep.dot.nop@gmail.com> wrote:
>
> > On 29 July 2013 14:20:05 Laszlo Papp <lpapp@kde.org> wrote:
> >
> >> Oh, it is actually also in danny. I was looking into the "files"
> >> directory,
> >> but it is in the other.
> >>
> >> It is definitely not in denzil though.
> >>
> >
> > Perhaps disable it only in the layer that pulls in these pre-2.6.31 kernel
> > headers?
> >
> > Thanks,
> >
> >
> >>
> >> On Mon, Jul 29, 2013 at 1:18 PM, Laszlo Papp <lpapp@kde.org> wrote:
> >>
> >> > Only _one_, not two.
> >> >
> >> >
> >> > On Mon, Jul 29, 2013 at 11:35 AM, Phil Blundell <pb@pbcl.net> wrote:
> >> >
> >> >> On Mon, 2013-07-29 at 11:22 +0100, Laszlo Papp wrote:
> >> >> > I disagree. This change should not have gone in the first place
> >> >> > causing the regression for the users. Please be consistent with the
> >> >> > history.
> >> >>
> >> >> If this was a recent change then I would have some (limited) amount of
> >> >> sympathy for your position.  But the commit you are complaining about
> >> >> has been in the tree for over a year, and it was presumably included in
> >> >> at least one if not two of the most recent stable releases.
> >> >>
> >> >> p.
> >> >>
> >> >>
> >> >>
> >> >>
> >> >
> >>
> >
> >
> > Sent with AquaMail for Android
> > http://www.aqua-mail.com
> >
> >
> >


Sent with AquaMail for Android
http://www.aqua-mail.com




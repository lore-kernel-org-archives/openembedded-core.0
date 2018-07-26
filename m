Return-Path: <rsalveti@rsalveti.net>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id BAED278C27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:37:23 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id g6-v6so1354977lfb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rsalveti-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UkgJSQ11yQZN7xEQdAe4BvbItahDHgLDT+l4jCNlsFo=;
	b=a37tEulM4mVl/rFw/TzyvcZmcNpIZOzc+yyWLTrpLDdrwNuGkuMdXW2FVNrLRWLO0X
	9WUrEGT+sIbDakET4ANJa23DUdcNKdtjBzpiLq9wPwHLHXqJleSmV80wzReofOxyl018
	D5qbO0RRMVo59XwEfEXuNJw4kYqfNtrxgmMydVbUVZEXMta41/bzGYT4Yy7aCAHnf4HK
	D60ej584ZGeeke3Cmzg9r+vFgwJSttk2XthByDI3kArSeULb3ADzkUhS4zFNDEYCrm7F
	8ZY5T/rSIgFeW2O/TPTLyYyRcAR9STmEchSgi4p9gcRZuD81/jM2VEse0+vCsJurrojF
	XnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UkgJSQ11yQZN7xEQdAe4BvbItahDHgLDT+l4jCNlsFo=;
	b=ZuREphvDnC8lbsPnUnPuQ4W3cdPKAsDl/Jbc+yKisQm/jzjd6UahzWRwUheYqDwXXF
	dpku+fPpZAgP4tQoCyCmMVShWoA3ObS6URvIVOk1OmNhqZES0mkxPK1aBbr6F8Za5xhz
	J4+xKB7pWc+/2fx8Elsh4wcPcJ4gpWA/nyXxlFP/5cFkhj6BUm6hBf/MiTmca6w777vh
	Io5uGS6Dg5l7NPZuSSoJHWp0J8tZe8xsJeaeL4lOeu7xqxlT9cxgVbArJLycFSUSz/Sv
	59EiQyi0dFzO8PIJZ5pRKBbeaxg36F0aAdqpaLQEd6r82gr6ywN5jyWkemKdgh4tpqcG
	iPOw==
X-Gm-Message-State: AOUpUlFANFI2EOFhrG1TnMVKg3hXHSoWzCHM4YzWiYOwlwAmWXG9qRIV
	8o5BdsMElV7MHzaaWO+kAsKC3JggZlfEABxj4/xTzA==
X-Google-Smtp-Source: AAOMgpfFNH0gYEvI7JYJ3fnbv7U9Ya3L7qktO4NneSMIhgdQAJ7YNGYHlA91f+r71kzEW6zixkkQr/4yW0Es330IJT4=
X-Received: by 2002:a19:2194:: with SMTP id
	h142-v6mr1558101lfh.75.1532615844306; 
	Thu, 26 Jul 2018 07:37:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c505:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 07:36:43
	-0700 (PDT)
In-Reply-To: <90a08929e5fe482b9cde1599fa2585a2@XBOX02.axis.com>
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
	<CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
	<105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
	<90a08929e5fe482b9cde1599fa2585a2@XBOX02.axis.com>
From: Ricardo Salveti <rsalveti@rsalveti.net>
Date: Thu, 26 Jul 2018 11:36:43 -0300
Message-ID: <CAHYQr0rsGOVc-4d-9ntLA0STTcZR2g+E8gqy9kpak1FD0Y6ztw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 26 Jul 2018 14:37:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 26, 2018 at 9:30 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of ChenQi
>> Sent: den 26 juli 2018 07:51
>> To: Ricardo Salveti <rsalveti@rsalveti.net>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
>>
>> On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
>> > On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> >> Upgrade systemd to 239.
>
> [cut]
>
>> >> 3. update-alternatives changes
>> >>    The utilities like shutdown, poweroff, etc. are now created as symlinks
>> >>    at do_install. So there's no need to use update-alternatives mechanism
>> >>    anymore to create the symlinks now. In addtion, I don't think we> now
>> >>    support multiple init systems at one running system, so there's really
>> >>    no need to use update-alternatives mechanism here.
>> >
>> > I noticed that reboot stopped working locally as I had busybox
>> > installed together with systemd, and the busybox version ended up
>> > being used as it was provided via update-alternatives.
>> >
>> > Looking for possible similar broken links, I found that
>> > update-alternatives ended up pointing reboot, halt and poweroff to the
>> > busybox binary instead of systemctl. Should we revert the changes and
>> > bring back update-alternatives for them?
>> >
>> > Thanks,
>>
>> I think the correct direction to fix this problem is to make busybox
>> only provide init utilities (reboot, halt, etc) when init manager is
>> set to busybox.
>>
>> We current have in busybox recipe's SRC_URI:
>>             ${@["",
>> "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') ==
>> 'busybox')]} \
>>
>> I think the init utilities should be moved to init.cfg.
>>
>> Please check my logic to see if you can agree with it.
>> We have two facts here.
>> 1. Init utilities (reboot, halt, etc.) are tightly bond to the specific
>> implementation of PID 1.
>> 2. We only allow one PID 1 in our image. (VIRTUAL-RUNTIME_init_manager).
>> So we can conclude from the above two facts that it does not make much
>> sense to have multiple providers of init utilities while we only allow
>> one PID 1 provider on image.
>>
>> After all, we are using update-*alternatives*, things that this
>> mechanism manages are supposed to generally serve as alternatives to
>> each other.
>>
>> Best Regards,
>> Chen Qi
>
> For what it is worth, we have a package that installs wrappers for init and
> reboot, which is now causing image creation to fail due to the change to
> systemd since both packages now try to install init and reboot. I can of
> course add a systemd_%.bbappend to remove init and reboot, but that means
> the systemd package is broken unless the package with the wrappers is
> always installed.

Curious to why you need such wrappers, but wasn't it a problem before
even when we had update-alternatives for such utilities (e.g.
update-alternatives failing to link init/reboot because of your
wrappers when creating the rootfs)?

Cheers,
-- 
Ricardo Salveti de Araujo


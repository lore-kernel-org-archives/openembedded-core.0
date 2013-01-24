Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TyNg0-0002tf-Vz
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:21:13 +0100
Received: by mail-ob0-f178.google.com with SMTP id eh20so9558851obb.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 06:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=IKPV+6QMfQhuwufynFxtbtkzsE/xHurm+ogg5ZLb4IE=;
	b=Df4ur/3c+cIb5k1HBFi9pfNQsKHmOSfUarkZQ5EEMA6s8yyQ9PgS40aAoqhBbumGIe
	Tl1uyz/j9xZ4e8z4JPH8T2PDqK0iWhYlXF5SrtquntXytwCKF1+6rLSM47VQkDuUDe5Y
	nx9TjbZdSdpVRuAEJZkMnOn4qV01cWj60f4Tc+RauMUm+A2pQcKMDW25VIYHfFYvzt7c
	0BMIfp5jKfDci3jcsVxCO3zyncAWirlWmnSsd3+3pndc8cbOofYDUzeT98oj6TP0o96Q
	5t1fsTgB5kud9//6tXRklVCMM5tlmJhHb+BpsGzyFe9oJkB8ntwrfzURAIorF8vdaOZP
	TJfA==
MIME-Version: 1.0
X-Received: by 10.60.31.195 with SMTP id c3mr1528686oei.57.1359036339722; Thu,
	24 Jan 2013 06:05:39 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Thu, 24 Jan 2013 06:05:39 -0800 (PST)
In-Reply-To: <CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
Date: Thu, 24 Jan 2013 15:05:39 +0100
Message-ID: <CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 14:21:13 -0000
Content-Type: text/plain; charset=UTF-8

2013/1/24 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2013/1/24 Radu Moisan <radu.moisan@intel.com>:
>>
>> On 01/24/2013 03:48 PM, Martin Jansa wrote:
>>>
>>> On Thu, Jan 24, 2013 at 03:36:02PM +0200, Radu Moisan wrote:
>>>>
>>>> this fixes a service dependency issue;
>>>> while graphical.target is the default mode, systemd
>>>> will try to start display-manager.service which is not
>>>> available.
>>>
>>> what about images with display-manager available?
>>>
>>>
>>> meta-efl/recipes-efl/efl/entrance/entrance.service:Alias=display-manager.service
>>>
>>> meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in:Alias=display-manager.service
>>>
>>> meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service:Alias=display-manager.service
>>>
>>> ?
>>>
>>> Making this change in global PKG_ARCH recipe doesn't look correct (and
>>> also missing Upstream-Status and SOB line).
>>>
>>> Cheers,
>>>
>> The problem goes both ways. If we leave it as it is, graphical.target as
>> default, what about images that don't need a display manager, like
>> core-image-minimal that is in particular the target, for the time being, for
>> systemd integration.
>>
>> Radu
>
>  ln -sf /lib/systemd/system/multi-user.target
> /etc/systemd/system/default.target  ?
>
Send too soon / wrong button :/

you want to change the default do
 ln -sf /lib/systemd/system/multi-user.target
/etc/systemd/system/default.target  ?

why not do that with .bbappends?

I'd prefer "vanilla" over hacky workarounds


--
Regards
Samuel



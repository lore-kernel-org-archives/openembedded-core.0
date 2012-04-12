Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SIMW9-0001FV-78
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 18:05:05 +0200
Received: by qao25 with SMTP id 25so1758900qao.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Dw/iv/IIOW5GSjyCRHvYHxC0Bufgk4zOhebm/19Hfnc=;
	b=tRj1k13CerLhAvz29QfIYmWgDql8IWe13KRtB9rkmxXkHSNYbghbsWK1aKoKjfhZhe
	22RqPTKAtwNsdf3K+pqGRtbJehc9XdEdrmyTw1A8gO90EHW4dAH1MhjL6Mobsi2PmPYq
	uYrRTvTRTHO5RBqpugUWxKjGiALncxoYiA/f/6mEhQ42mAnMntmfZ0C7igivQbSuPT67
	s/ZDfP9WfQzlo9tzOMgMHvLMP8upXD2hVz0qrKi2Gta5pRr/tCKSYWXvCdvmXIRw2DiF
	2K/gH5ySDoXg3JoxDUKUqtFg0u2BLmZmsZDZRXAaHpUJ0MFW/HhbbaM4PNwDss4EkAaE
	etAg==
MIME-Version: 1.0
Received: by 10.224.101.10 with SMTP id a10mr4777592qao.5.1334246144578; Thu,
	12 Apr 2012 08:55:44 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Thu, 12 Apr 2012 08:55:44 -0700 (PDT)
In-Reply-To: <4F86F8D2.2050402@windriver.com>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
	<CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
	<4F86F8D2.2050402@windriver.com>
Date: Thu, 12 Apr 2012 08:55:44 -0700
Message-ID: <CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
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
X-List-Received-Date: Thu, 12 Apr 2012 16:05:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 8:46 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 4/12/12 10:36 AM, Steve Sakoman wrote:
>>
>> On Thu, Apr 12, 2012 at 6:39 AM, Steve Sakoman<sakoman@gmail.com> =A0wro=
te:
>
>
> That is very odd, the system is supposed to identify all of the dependenc=
ies
> needed for the first set of packages... (the three base-passwd, base-file=
s
> and shadow).

Perhaps the issue is with the bash package -- for some reason rpm
doesn't realize that bash provides /bin/sh?

> The end result is a list of 10-12 binaries to be installed that meet thos=
e
> requirements, as well as the original three requested packages.
>
> We also shouldn't specify bash because busybox provides /bin/sh in a lot =
of
> configurations.
>
> Which image did you try to build and I'll see what I can replicate here.

The images I built are not standard oe-core/yocto images, they are
custom images that don't include busybox.  Perhaps that is why I am
seeing the issue and others aren't.

If you are really interested in replicating let me know and I can
provide you with pointers to my image recipes.

Steve



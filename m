Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RiXxW-0006hH-DU; Wed, 04 Jan 2012 22:01:20 +0100
Received: by lami14 with SMTP id i14so6346827lam.6
	for <multiple recipients>; Wed, 04 Jan 2012 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gCdfEjtWwGoN9Dbk42wRSKm8Z5/Qws4qckeOFQEODrQ=;
	b=T/g0mDYml6J3mvLzLH9s0n2SpEx12RT3IouEDh7UTSGhYezt2XMuVGdvLbZJM7VUvI
	jvC+Pvd+MVmcjMMaBUhwLtZ5aJiUGZIt8JfgzvZuF8Ok28mep65TGv4chfBtmtWUbws1
	7B5kPsBo75u3VQEs+FU+ptqHoYdYhkB20aGuo=
Received: by 10.112.87.226 with SMTP id bb2mr246347lbb.67.1325710436267; Wed,
	04 Jan 2012 12:53:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Wed, 4 Jan 2012 12:53:25 -0800 (PST)
In-Reply-To: <CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
References: <20120104181400.GD587@denix.org>
	<CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2012 12:53:25 -0800
Message-ID: <CAMKF1sqCETomiuAx=9zQf2kLYCO8SMxi5=UUwOQ3LGj4RRJXTg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: BlueZ old releases have new checksums
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
X-List-Received-Date: Wed, 04 Jan 2012 21:01:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2012 at 12:14 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Jan 4, 2012 at 11:14 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> The main archive of BlueZ/obexd/hcidump releases on kernel.org[1] finally
>> re-appeared after missing for long time since kernel.org compromise.
>> Unfortunately, all previous tarballs have new checksums, breaking builds for
>> anyone w/o previous copy cached. Old copies were also extensively mirrored,
>> so you never know which one you fetch next time...
>
> Heh, checksums changing after a security compromise, that's worrisome
> :) should diff their contents to see what's going on, or whether its
> just a gzip timestamp change or something.

exactly. Make sure the tars are sane

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



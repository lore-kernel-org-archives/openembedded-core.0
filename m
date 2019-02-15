Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id C863171984
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 12:52:26 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b3so16306272otp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 04:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZSyou6ag87Nmp14ONTIGhNT7aZhaD9ZSF9Ad7e4otl8=;
	b=CdQnFeBZP5T6zUsuDHA8zTcZ3Q0k20NR6wGDCiqatZkIkI2QsOdCErys4JkFniXdcb
	ghUbbpWStDUozSqI1i0GmFldwQdCjbkIcPJHHuJGgpqHQXJk+I/oG0iv9ECvhftRU7qb
	YcYhd8nieuJ/QWuMaG+TwyENZw3YrXYLE5qvWoEjt1CUwK1Frlb09OPtv4v1OTb4EJTu
	aB/ZEDsfOJ+IbQIHcf6kZO1GtEsrfKGKuUdEWQJuLD56ZWw31nP3m3i661nYd+7qr3w3
	Va0zlMDifGYjAmwwol8XXy3ZR9kMs+XjqMgtKw6ylU1sUc6RRQwkEgt0YOf7oI6xDsGI
	co2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZSyou6ag87Nmp14ONTIGhNT7aZhaD9ZSF9Ad7e4otl8=;
	b=ZFmbvaEkRUfAA9sq3KBfT10Xb2wSmL9c52YvVFmDqUfMcirWN2Z8hdijeMFX2CD6Uz
	phY22untiqQkpGPIdA1pRPK7/WkMnU5M8n/ksBENQXTioYXt1+/T3obPdMwvLdBc5ZsO
	zR577whKHgYOtZkJ+u0LsczUF++sfhngFrrm2qY3MkZ3qPPIGcloZzR4lVCMyUJXJHVi
	XIOFCPi+m2aidcGZkxsImqHokhewEhQ0bNPdr03LCSy4/YQkmBoSH+8pTO+uHHPpf7IG
	N7V+eG5ZR4cAaFzHPGtg68/ihrlgvpC/25hrWNzjuriJ8I/MkCYxuz/4epnXPugK9Lte
	1LWw==
X-Gm-Message-State: AHQUAubA0zDjtcRnGnEll8lBtRZSg3uDRgQnH81SdoeSHqmuSZnzKqbL
	yyp59U7tj7VxQ4xO8h+UXFWHkkXJlMFhl/1QvYs=
X-Google-Smtp-Source: AHgI3Iax+QyBLZyy6PSL2cLkNqavVUQTI6qp4v1RTqaBtZkiqQ2RR0GS/YokQQgUHF6Y2tkeew70XZT118XqZcsiHQ4=
X-Received: by 2002:aca:30c2:: with SMTP id w185mr5676567oiw.163.1550235147579;
	Fri, 15 Feb 2019 04:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20190215073207.30036-1-anuj.mittal@intel.com>
	<20190215073207.30036-2-anuj.mittal@intel.com>
	<CAP9ODKq0zcHhXON4xWvTTUpnYRoMHOHvwd0RSJHwQeSa2d7P7w@mail.gmail.com>
In-Reply-To: <CAP9ODKq0zcHhXON4xWvTTUpnYRoMHOHvwd0RSJHwQeSa2d7P7w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Feb 2019 13:52:15 +0100
Message-ID: <CANNYZj_pn3Ff0Bo+NhpSfq-psdeL9rwz0giS0NabW8Xa5S8ujg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 12:52:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019 at 13:46, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:

> I think this patch should be split off. First we should upgrade to the
> newer release and later convert it to use meson.
>
> This allows for better review and testing.
>
> If desired, we can do the upgrade on our side and Anuj can handle the
> meson convertion, next. Does it make sense?

Not really, in my opinion, it's just more friction and coordination,
and delays. It's better to just fix the issues with the existing
patch.
I'll send a fixed version in a few minutes.

Alex


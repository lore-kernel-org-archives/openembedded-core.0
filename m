Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3A60E6C46E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 22:28:50 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id f18so8382021otl.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2018 14:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SLiqQOjnPVZl6CPMqPeYBDgZUPWaWCFttLPrnZ8fYrw=;
	b=jtm2Cy/sLOyb0bNqWZ5N8GJKhSEdIpys1Path2wn6BOsgpiRwOrLg08QxMn0AqrGhm
	ylwM4mDuKBOLfQ9Ws2ofdhODb8Sfma8yUS+Xw8b9sDPjd2xbvfg1ayxt8l/H2zebJ4bO
	bW6KoTrBW67Hn5dzhU+0N70NKeIXUqR+H8YYX2BSsNjExoY7n2PpTJYKNyROzb1h8V0t
	+MqYIQnDrvhtanyYhCbTBgN8G+Dwsqm+KmUoEECJPh1mtNEa8OR1eutDhLXht3ms/E7M
	nWt/mfvkBEpnlOb24hgm4wjj2vsz6Y01gTlYNgAH7po5OmdQpqkRPkVknYWLKCgzWAir
	PfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SLiqQOjnPVZl6CPMqPeYBDgZUPWaWCFttLPrnZ8fYrw=;
	b=bnRkIylIiFWM3T5SZKnqRPJm6QBPXCAY1uXVG6MlA1e28ujD+bwtbuEBENa1tJ/sQ6
	om5El2WLkKlkrIiuZF5PJx3nhgqEiW8FGp+3acDUpaXITTxKK662nPlgBinI2ebJoKuw
	/IgOTor+16Mg5XlMWKl46a2njSItd/V9f9UDRJsbUVZYjH3FQckN2mN73VPDfHg9cdxW
	Dp/bZkg4LwfVdsYiP+5lYyPBzPrO2DmCd8zcPIEcVJ6bHptSkJYFhYYN4EvkUj6qEO3I
	sHCXEGyP/RiNWQ4nFz5wnC+cJenuXkWbeS/M1pHMH+5QGksfsvQavNh3vLhsbp6MV0hf
	vYYw==
X-Gm-Message-State: AA+aEWbbteqwqcnIksHFni3HMPpEwilW8H3En8Rgs1YptLMMnDfisOBp
	9gYdktMhn2ThB7FP8JrGO0ICAmWZ9xQt1NymWIA=
X-Google-Smtp-Source: AFSGD/VvBzczLuZW+fbk/3WeiTCMKaBK98SMigStLB2qUjn608eicJzVkGsDRaI01Y1m4prcNrPisAolomjDg1W8i2g=
X-Received: by 2002:a9d:69d7:: with SMTP id v23mr3709597oto.96.1543703331240; 
	Sat, 01 Dec 2018 14:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
	<CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
In-Reply-To: <CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 1 Dec 2018 23:28:39 +0100
Message-ID: <CANNYZj9ug7+q0v-kVVio7_a61BRo1JEBNxFmJ33XgB=CQGd7ow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Sat, 01 Dec 2018 22:28:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Nov 2018 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > > On Thu, Nov 22, 2018 at 7:42 AM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Also, change default meson option to building introspection files
> > > > (previously they were not built by default).
> > > >
> > >
> > > I wonder if this is causing
> > >
> > > http://errors.yoctoproject.org/Errors/Details/202291/
> > > http://errors.yoctoproject.org/Errors/Details/202280/
> >
> > "Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir"
> >
> > This file is coming from libgee - it has the necessary file, but does
> > not install it for some reason.
>
> I repeated this qemumips build on a different host ( running archlinux
> ) and it worked there. The host
> where it fails are centos7 and ubuntu 14.04

I just sent a patch for this to oe-core list - thanks for reporting.

libdazzle crash is a separate issue, I will look into it.

Alex


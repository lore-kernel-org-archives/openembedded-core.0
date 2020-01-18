Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF7C07F2A1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:08:35 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id b10so28754848iof.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eQX5lIhabNdwCv+ev0xDVKClhHremrgDCeNXv7yEtcA=;
	b=ACNsQNbRheTiIftKQ6dTVM2RXrC+F0iKJT1XHHr8ZSimGS+2ct2G7E8XBn75sECZdu
	53JKxND9On+ChOg5Ys0DEKySGqq0DHgW5cukFFdYgs9OjpR8niS3yfYL/IQHLnmuqemu
	RpIb6VbGiOUtkk9sYVAOREut/W5IAmfozX2rYi7hIl8VxEQGBFv3IdmnokX+SU9tr7Ca
	+lzoEP87zmeBkIuwTI49p5noaZgsY6ea81sw5GaqiBMPMquZb39aC9IMuFCa388/aNNa
	kPQHM+DZJ/230MPBc2E47nLzl0g8eWrVJV2qdryEui+ZLAqQQAtVDY9wWx9iaQEpTg6E
	x/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eQX5lIhabNdwCv+ev0xDVKClhHremrgDCeNXv7yEtcA=;
	b=Hmfm6/rdfw1lZD0LGWfJ0ko/qv+gWPnF7SBIEIVkolVYOo5NWVe2PjaYagHXo5DbVM
	kWxwcJq3ziB38IE7xL5T9H3QeNCCC6XVhi8GLVqlbAolBfzGJ/svfcQIpkf6FQGuQiYW
	ilt5718qjtma6AS4pZjGhT0YzIt1Ao4iOk3XBgN9MNnj8DoFdjlFZTDR920XLZlDJmqA
	FJB0LkqA6SbSU2U8mfWmbFWguBD7SGVIpnZ6RppmaEt3s8QYi8k197mMaikVclMX5tDp
	XwiKeGU2TFt2udgaT741apWeD8ftd4B0XRioAPPZwB/tN9KIwt8ubhh2U9L3scVT2PZ0
	n9GQ==
X-Gm-Message-State: APjAAAWTPwRQfhwn80TpR+P6LCZsnJD1MDx0j1bn3sVZDyPs+Y5VXGu6
	IEOMfB4S+0qyDumOX/1fPiCiGwgqzgs/XH5kj4Deg7OV
X-Google-Smtp-Source: APXvYqxl6a3w1exqox8GOkx4qaQdAWky0VlJG4AD0EloS4fEZvn57/F5D8G0Abtv+Unl1pPQpDUr4yadeeCrvuhce10=
X-Received: by 2002:a6b:e00b:: with SMTP id z11mr34384601iog.299.1579345716721;
	Sat, 18 Jan 2020 03:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
	<045bded79ff6636698fe2f9d2b64171fdebd61d0.camel@linuxfoundation.org>
In-Reply-To: <045bded79ff6636698fe2f9d2b64171fdebd61d0.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 18 Jan 2020 12:08:25 +0100
Message-ID: <CALbNGRSa9oFogL4xAfbbAuCPzzLQTOD0js6Znu=p1z_PUHubFw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2 00/10] Make MIME work on desktops
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
X-List-Received-Date: Sat, 18 Jan 2020 11:08:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2020 at 9:40 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> >
> > V1 -> V2:
> > * Shelve global path export thingy
> > * Add me as maintainer of itstool (let's consider '=C3=BC' in my name a=
s
> > test case :)
> > * Change "to to" to "to" in commit message
> > * Build shared-mime-info from git to allow automated upgrades
> > * mime-xdg.bbclass: Be prepared for packages as libreoffice: Desktop
> > files
> >   installed are absolut symlinks broken for us. In case other
> > projects do same:
> >   Offer asolution and guide recipe writers how to handle by
> > generating warnings
> >   with instructions how to handle.
>
> Thanks, this looks good to me. It did generate a warning on master-next
> builds in many places:
>
> WARNING: libfm-1.3.1-r0 do_package_qa: QA Issue: package contains desktop=
 file with key 'MimeType' but does not inhert mime-xdg: libfm-gtk path '/wo=
rk/armv7vet2hf-neon-oe-linux-gnueabi/libfm/1.3.1-r0/packages-split/libfm-gt=
k/usr/share/applications/lxshortcut.desktop' [mime-xdg]
> WARNING: libfm-1.3.1-r0 do_package_qa: QA Issue: package contains mime ty=
pes but does not inhert mime: libfm-mime path '/work/armv7vet2hf-neon-oe-li=
nux-gnueabi/libfm/1.3.1-r0/packages-split/libfm-mime/usr/share/mime/package=
s/libfm.xml' [mime]
Slipped through - will send a follow up
>
> It also generated:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1458
>
> which partly is the python2 removal that was in with the test and
> partly this series since itstool is GPLv3 :(.
Is there any activity required from my side?
>
> I have to admit I'm not sure how reasonable it is to keep hacking the
> gplv2 layer to work...
>
> Cheers,
>
> Richard
>
Andreas


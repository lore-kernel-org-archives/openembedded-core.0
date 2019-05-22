Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD6B7E348
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 01:50:00 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m18so492364qki.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 18:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5cgromtVTIe2uhdeYC9/siAjZC45g/Ggpqu1dfyeE58=;
	b=o5bjrZQ5SzBktNE3IwMAURJDXxBFLQ79ECiIrn60o25ZnEcvikB9mbhC5GzXf8M2Pe
	B+70U4Mu3KkVo8VYHoS61A118gF65ReXWhkkgFsIMjC435RMrD69TNe3HiE/iRVRQdFw
	Ey5PwukAnh9uL3ml6uzjVlie575um2LEgPcAhu/xVR485AOwzhT06pmqB8LPTt7BLVg2
	7RMXCPKuWEAWvz1mNXDMy+wIV8VIK9wlQF06s4LLxQt6GIOqlHNFI5bVx2TAvO8gEkt6
	FtaFDT0aon3tK0bq93/nhRguidWuRJi6iZ2LWE8qPcQcHqyJj0aQiYdC2EdlLZDCzvrb
	DqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5cgromtVTIe2uhdeYC9/siAjZC45g/Ggpqu1dfyeE58=;
	b=JCLaPrrJnIxTQYJQDywL5HEz2UEduAcGbUenfKgmMeeVY3wH9C/9qubKNeiKVEyLb1
	SJRUeOTuYSLO1RQYlEDI3fZfEW8WwLZ36HMgK4o3OdjVYuc/aTaXRm4ggl5U6XeCBqw2
	eb+UbaSzR88nza4Q/jxJZpWMt2diSId47meU1wExeJPOooikeZ605ZvLb234vL2Kh+PR
	n4dP+NgtYc6T5ipc1qaBzsZ5DgpLl1XLMmTaLeX24I29WHCOhkCvmegZKG0p8dlnnCvY
	cADFDQOPJNJvRIMNIwXwwZT/AY6w1NfLA9LnwZ+Ar/Qu6eI5MXqA+YmjxI2gViN5ESjg
	DVgA==
X-Gm-Message-State: APjAAAXYsoUlgBz1N5W/gKnaMjeWml1hWd++aDbzLXaMrPDC/iaUdvL7
	jQHfuO0kaeRJQIfc8kN/tAGQWEv+KbBRn2qo5Ls=
X-Google-Smtp-Source: APXvYqxN7O6j+AU/aqTeOx639Ye20caYbKgsJNt5tp8e+oPbirwNAa76W3be72hNRHmm6aKDV5KjHDTLq9IVXP4L5Q0=
X-Received: by 2002:a05:620a:14a1:: with SMTP id
	x1mr50200041qkj.312.1558489800996; 
	Tue, 21 May 2019 18:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
	<b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
	<CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
	<1cee8ee543463712e25b4ea4450fb40242a9e84e.camel@linuxfoundation.org>
In-Reply-To: <1cee8ee543463712e25b4ea4450fb40242a9e84e.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 18:49:35 -0700
Message-ID: <CAMKF1srz+_Tk5=GNWzBLpNRXoqdCYOmLyNm6XKkFJQFvGcpX=Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Wed, 22 May 2019 01:50:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 2:44 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-05-21 at 22:59 +0200, Andreas M=C3=BCller wrote:
> > On Tue, May 21, 2019 at 8:38 PM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > > No sorry mozjs uses old crap in their configurations scripts
> > > > nobody
> > > > else does (python which) and ask for python2 explicitly.
> > >
> > > I've been giving this a bit more thought and its our intent to try
> > > and
> > > remove python2 from OE-Core entirely so adding py2 modules back
> > > seems
> > > like a backwards step.
> > >
> > > I think this will therefore need to go to one of the other layers,
> > > painful as that might be from an include perspective.
> > Yeah a new burden out of thin air is born. You know what I do: Create
> > my own layers and am happy as I am with my other layers.
> >
> > Bye
>
> Its not "out of thin air". It was discussed over two years ago when we
> started a plan of trying to remove python2 dependencies:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D1fc2c9315faf65ea05=
fecf81450dd40b9a330435
>
> This was in line with what upstream python recommended. Upstream python
> has made a clear statement on this too:
>
> https://python3statement.org/
>
> For a release that will ship 3 months before that deadline, it seems
> unreasonable to add this back to oe-core, no?
>

the EOL is expected to be Jan 2020, lets see what happens but I think
it would be good for us
to first switch default python to be python3 and then remove python2
completely IMO, I do not
see any major distro planning to drop py2 at the stroke of it going
EOL as of now, situation might
change in coming months but many of them haven't even switched defaults.

Its good that project is taking lead here but we might leave many users beh=
ind.

> Cheers,
>
> Richard
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


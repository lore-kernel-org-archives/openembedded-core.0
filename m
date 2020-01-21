Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCF26C23A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 19:36:15 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d71so3996794qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 11:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2NJdM6rrxxi/as8V9bGPjKC0hD+/4Vs4M5mzQUoPHus=;
	b=qYnXRDQhigwzUK4gr6QC81EpuS7STS350rHZXqgeEpsaSd+6HGGDlDlJphkPgIinPz
	OANRCpK5a7g4H+hXOYYHTQeQdSd0YSVOz/v4HAtOVmRBY2TNIrxPJvd8vg54O5ApOkAU
	mtfQxBSGA+B1RmP3IcR7Y4rKL7TrMzr1cyPOqPbQFsdfWvK+tOXKHBG/1nnkN6HoT6Cn
	aCt5ibxUx2fCqvV7WT7wPD6KPButfeHTZ/+Yl5UFvop5kaCnxbw3byDARLeYWrXe9ta7
	dKckiXmW40I8jeLDKf2o8W4JAmQHl2/4rG1Hc6nGWqRiTIXPQcfVXauAX2W7etzZqGUC
	oP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2NJdM6rrxxi/as8V9bGPjKC0hD+/4Vs4M5mzQUoPHus=;
	b=WhOTLm3StuHbXTWR/Dy7OUkAge1VJ1V2k1YTb3mN5pZSNWUHN8oU2VI3tbo4EE1EQn
	4LOnpSbqhE90UT0yctrP4OwgWRWxxFDMwnOAXJs5GJR1matt1Of6Dm59nrcnDfUOm9gM
	/q9jNbgSHDKjUcePRZkWWbU9ABn1q7H+hWk6y0Ws1YjK9dV5T4kwWgD+32mXbBo6ddav
	J4Ti/UwPHwNbv+3Q3gh1Wd+dYMhQQQLseWEhOvQFTA0wX25pat8ewlmi7wkmdZ9VdenF
	GgOYYQWwg7mY/zrNlLkSYXc709+f4HlbgR9XJbUFjQh0fcKsH8pe+dG1QrQ2BV2hfmz7
	yE8Q==
X-Gm-Message-State: APjAAAXRItFz0fZ81kAMi488dK39bLw9oy+DL03gDKa9DpokzpB/W3pL
	gMuD+ZQY7LyTHN5is6Zbip2wTfXVGKMpIuikVeQ=
X-Google-Smtp-Source: APXvYqyUTKTx9Am5AwCYj8vyZCADz5gj8Q4NV3zWdsKHY8Su/DS6lGhfsg3Y1FMZkuN0UC2wp6AAFALT49pJuJvW4KI=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr5997039qkg.71.1579635376681; 
	Tue, 21 Jan 2020 11:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-5-alex.kanavin@gmail.com>
	<CALbNGRTcVRb7obS2g8d6fipNUervDr0ZYvJ+izLmCJH4h5QRyQ@mail.gmail.com>
	<1ccb46bd9806f74f4c61b774754e314ca72c368c.camel@linuxfoundation.org>
In-Reply-To: <1ccb46bd9806f74f4c61b774754e314ca72c368c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 11:35:50 -0800
Message-ID: <CAMKF1srhnkkSETdWK0Jb0V8OV-4bwpCLJ7MhJuJ9dOx5T3VzUQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/24] nss: update to 3.49.1
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
X-List-Received-Date: Tue, 21 Jan 2020 19:36:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is failing on qemuarm btw

http://errors.yoctoproject.org/Errors/Details/307410/

On Tue, Jan 21, 2020 at 4:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-01-21 at 13:04 +0100, Andreas M=C3=BCller wrote:
> > On Mon, Jan 20, 2020 at 6:26 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > > Drop a backport, and a patch that causes build errors with
> > > the new version.
> > >
> > > Add a patch to make ARM HW crypto optional; upstream for some
> > > reason does not allow disabling it.
> > Thanks and FWIW - I tried to subscribe to their mailing list to ask
> > if
> > that was intended. To my surprise I received:
> >
> > > Your request to the nss-dev mailing list
> > >
> > >    Subscription request
> > >
> > > has been rejected by the list moderator.  The moderator gave the
> > > following reason for rejecting your request:
> > >
> > > "Not an active NSS developer. Contact jc@mozilla.com to argue :)"
> >
> > Wow...
>
> That is surprising and rather sad :(
>
> It may be worth mailing that person and pointing out you had a question
> and where it should be taken? It would be good to discuss with upstream
> rather than carrying the patch. We are making slow but steady progress
> in reducing out patch load.
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


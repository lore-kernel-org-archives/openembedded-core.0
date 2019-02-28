Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id A91AF7CCEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 18:24:43 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id w4so24716048qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 10:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=377fldhCSqkIGkHntguBAIeCx3jExH7iWRdNRr3yKlw=;
	b=HzbGuAaCGZWZtIIXfV32fFGtNgbbeZsMmL/ivUnfZv7DDQ7Tik0h1nYfZeQUSqZ7/a
	aBIkpU8SpNwF7VJzjeh1+uyyzszqhtTpJilfC+wBCThEnjsHnx5gQ+2SJm9iT2iDZmLs
	9VhMeyKgpPB57Uyhh/0YjRrPk3wGNZtsf+i+lnBfqfelA53pPsjzrrGFHn/8M/mVVsXI
	PX4gzGJojjuIUzeYknmiAq/juj4XXMo25fbtDbkFwPaicsaouovYPn2xD7/F0f42MnF5
	vioint92VsDpxBxh2aCQlG0oFqvXwAKKFqELaR4W6M7MZ9nDMLvCT/pZV4o2URoWIzF8
	WHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=377fldhCSqkIGkHntguBAIeCx3jExH7iWRdNRr3yKlw=;
	b=sbyklSYUbiYEku9LOr/mMgfUk0lr+EzFphk+rMyWbBgT7m771kRDv3+J++fc2Tmwts
	dydv+ywBPlUuaAf7sw4csP+WkW4nrDbtAJNiuL0RlBkT8R5nNyZpkeTuiEp9ZxJPg+aY
	uokDYsSRnaAZJjpJiix0G9ygfmwKtMax4U2uK8JbGeu5Wckn5ITEIvboqK4xT6xFLWkw
	ysQ93/d250DF99G3PqeeE9ttJUkasQ7UPOSbIoIqMw8WNTdvu8BPHQDqpddmDb4lBf+F
	7rxwNdW51rZRp48uSlzWaKX67i9uv+UmgYGt7RIb+RcBwuq5OA8a9YsXn8Da1vhuPdZh
	9vPA==
X-Gm-Message-State: APjAAAUeh+hREZ0rz2vspLoBae1K++8GZa0h+dX6AKeVKucA1C4SYraR
	qHtNM7JQ8ndXC4mfiruF3hctwJXLNo/3ssj5Vrc=
X-Google-Smtp-Source: APXvYqxILf7fgrtKMBMhjqtHDjibVaA9tkcSPkcMklVvmko78wNWBPuFpkc1zGBquBQ+hN6zJFE7MYD6z6j+Pczsh+E=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr515933qtn.253.1551378284324;
	Thu, 28 Feb 2019 10:24:44 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
	<CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
	<CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
	<CAB2nKc_F0qF4Bakg5F6Z9k5vw9u9RF7hnjeTK=SjqUS10Ykbbg@mail.gmail.com>
	<CAL4iiOf=EGme65Z3w-2PthTdaDawxXh6=Djq4E=1muSKzYz+tg@mail.gmail.com>
In-Reply-To: <CAL4iiOf=EGme65Z3w-2PthTdaDawxXh6=Djq4E=1muSKzYz+tg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 10:24:18 -0800
Message-ID: <CAMKF1sp+Fx-K=1gdVS79zx8-j7ZgcHL12eg1FSgtJ7k2S8QKdA@mail.gmail.com>
To: Damien Riegel <damien.riegel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GO runtime crashes
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
X-List-Received-Date: Thu, 28 Feb 2019 18:24:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 10:19 AM Damien Riegel <damien.riegel@gmail.com> wr=
ote:
>
> Hi,
>
> On Thu, 28 Feb 2019 at 09:04, Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > Hi Khem,
> >
> > GO_DYNLINK_x86-64 =3D "" solution works as well,
> >
> > Best regards,
> > Vincent
> >
> > Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj <raj.khem@gmail.com> =
a =C3=A9crit :
> >>
> >> On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince
> >> <vincent.prince.fr@gmail.com> wrote:
> >> >
> >> > Hi Damien,
> >> >
> >> > With GO_LINKSHARED =3D "" it work fine.
> >> >
> >>
> >> Please set
> >> GO_DYNLINK_x86-64 =3D "1"
> >> to
> >> GO_DYNLINK_x86-64 =3D ""
> >> in goarch.bbclass
>
> Well, making a change in the goarch.bbclass is way more intrusive than
> changing the value in a single recipe, so it would be nice to (at least)
> give some justification about this solution.
>

this will make static binaries instead, so I wonder if its doing some
linking from host.

> >>
> >> > I'm very new to Go, does it mean that there is a mixing issue in go =
modules from Yocto and from node_exporter vendor folder, so it links wrongl=
y at runtime?
>
> As to why the GO_LINKSHARED =3D"" works, I cannot tell. I just noticed
> that our application was linked differently on my machine (where it
> worked) and in Yocto (where it didn't work), so I tweaked link flags
> until I got it to work.
>
> Cheers,
> Damien


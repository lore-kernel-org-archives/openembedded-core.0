Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 642D974F09
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 21:12:20 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f18-v6so2117332qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p3rqeMIN6b9G+8ub+4ccDFb52X4HqOIcU2m382U1Rqk=;
	b=s1CPs89NX53Mzb+6W8YmzXFzA23FezIMHjjkl2RsN8ufZ3dvjXPkgnRhc01axtAtwA
	Ka4tfcEsWT3A9NEAuQjuKCCPpdj8WHkMmvgYIiEWD8htAQ5RwXlZ4wLLh59PyoGviwg5
	tLzZbcGXNf6F2GxbiI/nk3+r0Of1tHk89oNtonozoOs9k0CzW4nHOfH97D5iKwHS5KWa
	OB6F7nwp6t+Hs8E9i+KwYLu0r+6TQcW7Afy4YB9CgekiwKR9NMhk3SrlbGa5cnUgh/Dr
	f8c7rw3MgbjvUsq2XIY3H9H2B+VNzpwKVD8kikuJJfFPdS43XCVq3Z6y5s+kgUE02Ano
	K4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p3rqeMIN6b9G+8ub+4ccDFb52X4HqOIcU2m382U1Rqk=;
	b=hsogSfwa5lt3NYR2r+25GerRabWslHr+5v1qp+UdlucMQXjouB1jFQ4us5Dd3F0aWQ
	kl5K5E1KUDZiHuXnKzK15lQXZ0Da6DdJgn4yVb9Hu4iaL7FSendnxvZMDs6/rnY8Zi6x
	J5W27o3SA/ydofzaeFjP6+943dPytUPLdAYlx2o9VvRUmfLO0NjnmgPTwJwFhOYQCVsm
	AZ6B3CJ8L5kNYp4I1+HwuHFciHRUfSSyuvZPbQbzCJQLPmfEthklzvHelOmZvlO2Wm70
	JBICqHtnNpcn4354qXZXwhGeuwum3RihQL1iW4sRz+yzL1olICDTMtX5DWRxnulbxMhi
	hgqA==
X-Gm-Message-State: AOUpUlGXkGpIA9oq8w0EdMP9EJjm5azmR4VKAN3TrwEaR8Xsg8bf0e58
	QF3BP+D6uaqXjv4HmC6JotCNtw39NPaXpL2dU6k=
X-Google-Smtp-Source: AAOMgpeZkAdf6RooSYKB19sxhXHgSdxsfriMfCpcIuC9VuBrl+SGTR5tWz5pPoiDWjElj6YVDXFePK8dhWD8EGuKO60=
X-Received: by 2002:a0c:9692:: with SMTP id
	a18-v6mr12833760qvd.16.1532380341023; 
	Mon, 23 Jul 2018 14:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180721162715.12611-1-raj.khem@gmail.com>
	<20180721162715.12611-3-raj.khem@gmail.com>
	<CAJTo0LaofRc4ifkmj84YBk0iQZ6K=YSX1+QPSYAcwZJFh1aKxA@mail.gmail.com>
In-Reply-To: <CAJTo0LaofRc4ifkmj84YBk0iQZ6K=YSX1+QPSYAcwZJFh1aKxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jul 2018 14:11:54 -0700
Message-ID: <CAMKF1soUs99mXdA64NaeXerUG22hPDxaeswEiCSCo3WnN4A_3w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libsdl2: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Mon, 23 Jul 2018 21:12:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 23, 2018 at 3:31 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 July 2018 at 17:27, Khem Raj <raj.khem@gmail.com> wrote:
> > @@ -29,6 +30,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
> >                  --enable-pthreads \
> >                  --enable-sdl-dlopen \
> >                  --disable-rpath \
> > +                --disable-wayland-shared \
>
> This isn't explained in the commit log.

disable dynamic loading support for Wayland as it seems to not load
the dependencies correctly.

do you want me to send v2 ?



>
> Ross


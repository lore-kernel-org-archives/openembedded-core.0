Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sx1BF-0000uj-O4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 21:35:33 +0200
Received: by yenl13 with SMTP id l13so8282325yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LnfEUSBbujy35rbgz0T/e3hNRBmGtbUOoK//oV0YkaI=;
	b=GSkTDqMB+pPFiAqZ2+TAI3BXXCX3FcvdU9+F8julU2XRAY8wOLxnrRoSifVL4pxlwd
	h7vB20PW37Fs3N09kI0nhxOk++zxAMMWrxbA+5ckFMpwFs1GKZUrIP7dRMyWRZ6sAJyG
	q84zoQLo+91TCmFtx8Y89lsHh1/QG3Fx37pzX3Rd6NwjJ3Q7Jk6h0d3Y/kVrgT0MTp3Y
	jRzkS1pRW6cI8fIQ7dWgBoJrf6HYvTTtUW5j0oVWihKlp8HkK9tqArJgpEU1/ItgZWOg
	fO3FMK9YMZ7Qi4H5qGbIhLM5Svsr7XJsn6YhtNtZogpgK2iboav5CLudYpcJipiHR5Ik
	TMbw==
MIME-Version: 1.0
Received: by 10.50.213.39 with SMTP id np7mr5614109igc.51.1343935433012; Thu,
	02 Aug 2012 12:23:53 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Thu, 2 Aug 2012 12:23:52 -0700 (PDT)
In-Reply-To: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
References: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
Date: Thu, 2 Aug 2012 21:23:52 +0200
Message-ID: <CALbNGRTJFg7yWMDEs9tF7VijLAgxGA178qasUYuh=Z_ky+CpXA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: pango modules postinst issue
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
X-List-Received-Date: Thu, 02 Aug 2012 19:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 5:01 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> sorry fur disturbing again - but:
>
> When starting X on a maiden image I receive:
>
> No builtin or dynamically loaded modules were found.
> PangoFc will not work correctly.
> This probably means there was an error in the creation of:
>   '/etc/pango/pango.modules'
> You should create this file by running:
>   pango-querymodules > '/etc/pango/pango.modules'
>
> and have no fonts displayed. Followed the suggestion
>
> pango-querymodules > '/etc/pango/pango.modules'
>
> -> fonts are OK.
>
> I checked: Besides other pango modules my image contains
> pango-module-basic-x. In the postinst of this package I see
>
> #!/bin/sh
> if [ "x$D" !=3D "x" ]; then
>   exit 1
> fi
>
> if ! [ -e $D/etc/pango ] ; then
>         mkdir -p $D/etc/pango
> fi
> /usr/bin/pango-querymodules > /etc/pango/pango.modules
>
> This looks OK so far ( besides that I would not have the $D in second par=
t ).
>
> Additionally log.do_rootfs says:
>
> Configuring pango-module-basic-x.
> pango-module-basic-x.postinst returned 1, marking as unpacked only,
> configuration required on target.
>
> Any idea what is happening here?
>
> Andreas

Nobody else seeing this?

Andreas



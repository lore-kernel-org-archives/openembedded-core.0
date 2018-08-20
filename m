Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB277908E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:22:26 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d131-v6so1329578qke.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tr7lUX2rDY10Mktwpl1hP5e1rUHt4lyYx5itIZNsNA8=;
	b=qOXn5+aRmECQHY5buBomMHG2NlexH8ikJUz12w/V4gOn9zTkIGlJ2Tlu6RYo81OJh6
	SbM/lL50xCWKlo2l97DVhpggFY89pmNHH1N/9e9GXa0mqWoE44p4IrZGSUtwPz6Uunm/
	rBmCzYPCn3N4AIotSrm49F/FbF4bgVhj36qSNPMpu4t5Hbtu+o1zImepTuYGGm2VyaKn
	+3lBpyR1RJ1Hpo1MQkkunXPV+0Ua6e5DpNPFZkPLVITwzvf6mvx8/FisPsSFWSvzPOv0
	osMAU9aeUc87kAlMoOYmVfJ/4BfVG3C94CSUd74ZwpY7jYs53aswJDe42YBavK51NGkn
	P+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tr7lUX2rDY10Mktwpl1hP5e1rUHt4lyYx5itIZNsNA8=;
	b=c8xgJS5K7qC9fBJ10vrpM6op6thuGG9rkVKZL5XjBtM141AeUZNrleTvWd/6pGuOYf
	nnTILOdSyet/tYA9AztrTeswe3WEdCBs+qc96n38lJ+VjgRuSyKS9akn6LmxSDVnMcBn
	ku/LyxAxCrRr0fCuz9Tj+NXR/t14DDkyUk9V0k3K78YhMc6wT7PvL6i6UzJzAhquHEgN
	YKxygV+U22p/OHkmvALtdwFx804PwN8ARWlZVUDI7TMCs99Fx2vlaPyNHN1H62ZNrQ3e
	x9B8eLt1bN1E7t+4JAmVFJSCEJCfhe97EeFLX7FJ1cXRrZ2Vp8pjyegS6yxrD3ZG5vKa
	xLWQ==
X-Gm-Message-State: AOUpUlH/Ml/Nxx+2FH3TsU/N8o4+c5YeFFEFp9j6ByEDt98QEkDflai4
	LiQpWNKUbR+ene/DXCFth+3tDhQ3X3ucSwQ+oMg=
X-Google-Smtp-Source: AA+uWPwpqvB3MFWyIdbr9LtYirt/4PtJ2GA9AO0QesUECH1n4HR9dZ/kvpUPlBzvq1W+P+Errs8G8AclhSa9sjv3tiM=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr40420101qke.406.1534785747166; 
	Mon, 20 Aug 2018 10:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534699224.git.raj.khem@gmail.com>
	<f1c6008db923f577cb03d5461c06ad97d55a57f6.1534699224.git.raj.khem@gmail.com>
	<45c972cc-6abf-8df2-e4db-ee84abd49dc9@geanix.com>
	<73a419cb40a67f5e2dfa71820c048645583a1d75.camel@linuxfoundation.org>
	<CAMKF1sqgKJ8-inLr3XHzgCLp5+kAHvFam0da5h65OE71c4NCpA@mail.gmail.com>
In-Reply-To: <CAMKF1sqgKJ8-inLr3XHzgCLp5+kAHvFam0da5h65OE71c4NCpA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 10:22:00 -0700
Message-ID: <CAMKF1sox+m+Mb-nYty1LhmZXHZ94kiHre=nMuQx-i2QjjeJOFQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] dos2unix.bbclass: Move to oe-core
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
X-List-Received-Date: Mon, 20 Aug 2018 17:22:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I updated this in pull branch to include recipe as well.
On Mon, Aug 20, 2018 at 10:02 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Aug 20, 2018 at 2:43 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2018-08-20 at 11:23 +0200, Martin Hundeb=C3=B8ll wrote:
> > > Hi Khem,
> > >
> > > On 19/08/2018 19.23, Khem Raj wrote:
> > > > - Import from meta-oe layer
> > > >
> > > > - This is useful for many packages where CR-LF
> > > >    needs to be adjusted, many recipes depend on it
> > > >    e.g. meta-multimedia libebml and so on.
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >   meta/classes/dos2unix.bbclass | 14 ++++++++++++++
> > > >   1 file changed, 14 insertions(+)
> > > >   create mode 100644 meta/classes/dos2unix.bbclass
> > > >
> > > > diff --git a/meta/classes/dos2unix.bbclass
> > > > b/meta/classes/dos2unix.bbclass
> > > > new file mode 100644
> > > > index 0000000000..3fc17e2196
> > > > --- /dev/null
> > > > +++ b/meta/classes/dos2unix.bbclass
> > > > @@ -0,0 +1,14 @@
> > > > +# Class for use to convert all CRLF line terminators to LF
> > > > +# provided that some projects are being developed/maintained
> > > > +# on Windows so they have different line terminators(CRLF) vs
> > > > +# on Linux(LF), which can cause annoying patching errors during
> > > > +# git push/checkout processes.
> > > > +
> > > > +do_convert_crlf_to_lf[depends] +=3D "dos2unix-
> > > > native:do_populate_sysroot"
> > >
> > > Shouldn't the dos2unix recipe live in oe-core also, when a class
> > > depends upon it?
> >
> > Not necessarily, we do have a number of core classes which aren't
> > directly used in OE-Core but are needed by many layers and having a
> > common copy makes sense.
> >
> > I'd agree it is good to try and have something which tests them though.
> >
>
> in this case, I think it would make sense to bring in recipe as well, sin=
ce the
> motivation to bring this into core is to unlink dependency on meta-oe lay=
er
>
> > Cheers,
> >
> > Richard


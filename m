Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id F226965CBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:08:46 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id b71so1276966lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 01:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oavNjZZU8lv6uhXmhtDBSvOK+9gbLbHKAkjY/yQQ6PI=;
	b=Y3ylKm9AI89QBl3RlV9XpfDKLCGlmSZGSmOYlQzYn8TfcbMdObrmSSFbim6AgWwP0Z
	C66Xu0mOF0KtmQVoCJeysz0jDjjj3BAFTJTHzgQcQsp06TZ2G6MwIh2Qc4a87BAJBrJx
	GyMiyaca5fnRaiFy+ybZc8RKyLwbU1VV1qZp2OKU/0RxYTmAXXMF0REiTRiD03M9blSc
	SiRQNghkNIR1jLg+2jHfBK1/oe/WeaFNUnv9KWKbhUkbzjmiFqJWzbR68pmneojZkSJP
	0hrJTtbYi3JeGz8aD4hcO9SYriif6Ee4ayKlw22zdgBIeZPRlnxAio2BjVnOUGMbOhZI
	ZP4A==
X-Gm-Message-State: AE9vXwMfEto9gDOI2Y7isa1FnnFwWXpDyFLbr0WG1ruk9lmFAfWMChbZBYJLG26whXP3gg==
X-Received: by 10.194.202.166 with SMTP id kj6mr21150545wjc.72.1474963727341; 
	Tue, 27 Sep 2016 01:08:47 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	iq2sm1308973wjb.19.2016.09.27.01.08.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Sep 2016 01:08:46 -0700 (PDT)
Message-ID: <1474963725.666.7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2016 09:08:45 +0100
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013A2E03AC@ALA-MBA.corp.ad.wrs.com>
References: <cover.1474875470.git.jackie.huang@windriver.com>
	<b4dd791086d6e09a415d5dcd2afafa7906aab3c4.1474875470.git.jackie.huang@windriver.com>
	<1474880010.31418.8.camel@andred.net>
	<1B858668EC6A94408DCA5225FDFA85AA013A2E03AC@ALA-MBA.corp.ad.wrs.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2 v2] boost: add support for additional boost libs
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
X-List-Received-Date: Tue, 27 Sep 2016 08:08:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Di, 2016-09-27 at 02:26 +0000, Huang, Jie (Jackie) wrote:
> 
> > 
> > -----Original Message-----
> > From: André Draszik [mailto:git@andred.net]
> > Sent: Monday, September 26, 2016 4:54 PM
> > To: Huang, Jie (Jackie); openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/2 v2] boost: add support for additional
> > boost libs
> > 
> > On Mo, 2016-09-26 at 15:56 +0800, jackie.huang@windriver.com wrote:
> > > 
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > > 
> > > * Added libs:
> > >   - container
> > >   - context
> > >   - coroutine
> > >   - exception
> > >   - graph_parallel
> > >   - locale
> > >   - math
> > >   - mpi
> > >   - wave
> > > 
> > > * Add PACKAGECONFIG to add proper dependencies for:
> > >   graph_parallel, locale, and mpi.
> > > 
> > > * boost-mpi depends on mpich which is in meta-oe,
> > >   and boost-graph_parallel depends on boost-mpi,
> > >   so they are disabled by default, but can be enabled
> > >   in a distro that needs them.
> > > 
> > > * context and coroutine are added only for x86 and powerpc.
> > > 
> > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > ---
> > >  meta/recipes-support/boost/boost.inc | 33
> > > ++++++++++++++++++++++++++++++-
> > > --
> > >  1 file changed, 30 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-
> > > support/boost/boost.inc
> > > index 5696b6a..7637a4e 100644
> > > --- a/meta/recipes-support/boost/boost.inc
> > > +++ b/meta/recipes-support/boost/boost.inc
> > > @@ -8,11 +8,14 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
> > >  BOOST_LIBS = "\
> > >  	atomic \
> > >  	chrono \
> > > +	container \
> > >  	date_time \
> > > +	exception \
> > >  	filesystem \
> > >  	graph \
> > >  	iostreams \
> > >  	log \
> > > +	math \
> > >  	program_options \
> > >  	random \
> > >  	regex \
> > > @@ -22,12 +25,28 @@ BOOST_LIBS = "\
> > >  	timer \
> > >  	test \
> > >  	thread \
> > > +	wave \
> > >  	"
> > > 
> > > -# optional boost-python library
> > > -PACKAGECONFIG ??= ""
> > > +# only supported by x86 and powerpc
> > > +BOOST_LIBS_append_x86 = " context coroutine"
> > > +BOOST_LIBS_append_x86-64 = " context coroutine"
> > > +BOOST_LIBS_append_powerpc = " context coroutine"
> > > +
> > > +# optional libraries
> > > +PACKAGECONFIG ??= "locale"
> > > +PACKAGECONFIG[locale] = ",,icu"
> > > +PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
> > > +PACKAGECONFIG[mpi] = ",,mpich"
> > >  PACKAGECONFIG[python] = ",,python python3"
> > > -BOOST_LIBS += "${@bb.utils.contains('PACKAGECONFIG', 'python',
> > > 'python
> > > python3', '', d)}"
> > > +
> > > +BOOST_LIBS += "\
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'locale', 'locale', '', d)}
> > > \
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'graph_parallel',
> > > 'graph_parallel mpi', \
> > > +                         bb.utils.contains('PACKAGECONFIG', 'mpi',
> > > 'mpi',
> > > '', d), d)} \
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3',
> > > '',
> > > d)} \
> > > +"
> > 
> > Rather than having two ways to define what packages to build,
> > PACKAGECONFIG
> > and BOOST_LIBS, where each of them only supports a different subset of
> 
> I'm not a fan of this way, I just keep using the way it was.
> 
> > 
> > boost's libraries, can we just have one, PACKAGECONFIG, and have it
> > support
> > all of the potential libraries?
> 
> Yes, I think it's possible, but it will most likely end up with many empty
> PACKAGECONFIG definitions like:
> PACKAGECONFIG[atomic] = ",,,"
> PACKAGECONFIG[chrono] = ",,,"
> PACKAGECONFIG[container] = ",,,"
> PACKAGECONFIG[date_time] = ",,,"
> PACKAGECONFIG[exception] = ",,,"
> 
> If you think it's a better way and no other objection, I think I will do
> that in a
> separate commit as follow-up.

I don't think you'd need empty PACKAGECONFIG[flag] definitions, see
base.bbclass.

Cheers,
Andre'



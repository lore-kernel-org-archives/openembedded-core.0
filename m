Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF697FD7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 16:35:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k25so3389614pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 08:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=nsAz1U5AazMtEAGNxsKf4bBDPs/CmxARHDSZxj6wAqY=;
	b=Vr7WHly49SLaGtitoPt4bbPaopjb9edTZbBwvEL+H1BWwyoD/N08KSNm84pSZPRzYO
	HnJyAM8dLdcfcsRAELibCIaFMtGja4h395jpmes++mGFOfChL8Dsan/AJtcRddd7BLlS
	eYd5Exgr9dElSt/3VRYRrqBsZzPJ7OPz/ylorBIoJhY/n2oa/FzZMIzmRTI+rgm49eRU
	60TRfCGWqOWnWbEX2qk4NsczY0bRCfUfRBnwTX5y+NFennRZRgzgTElfwF56oQW2uEat
	Tniyf3PKz5K+VJBNbnahT0Srfbqmsqcx206fgvJAzQpUm0pYxqB2ABpS1AOY1pVhlGQJ
	xWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=nsAz1U5AazMtEAGNxsKf4bBDPs/CmxARHDSZxj6wAqY=;
	b=NA8V8CxZUXjbp2C0aa77WgF1s+MJ1s0D7yXr7Z1hjghGjhznzOdYP4RHN4UgkiudMw
	sr79dm8wGivQjmCGcmsWvxKMFZpVKJKe/UFa0Ph+H88Yiy7EbYGB/SdA0zQugziOl0Vl
	4/Ho6yozXC1CecZeWfjoY3rrs3QUqvStsnC7tKafxkH85leboS6q4R6K0JfhrCOBtd3h
	nQyRa91GT0hnoKrsXOtL09MUX3xzW92h4FZ8WAvgCNKDFCNQCVN1rjr9VOTZJFwCwfa0
	s+xbUkpE84pAFJNH1jghVG1oHBIx58KwSDY4JY/SMFCcZRIIXeFeEgApyKGNQLSgPNy8
	LiTA==
X-Gm-Message-State: APjAAAVulEZAjvMwbTZ/0/rbMVripVXoyLcj124NysSPLTebojHdRwKh
	LGnmv8eIk4tUKy4vCtjfV9KYDjKQnXE=
X-Google-Smtp-Source: APXvYqxfflOjHBj7FtD89s6OBpMgaD8pCuvtqO4zwmHcdLz0lQ7AZDv+neW/m3NKqTO0S4cCRdFu8Q==
X-Received: by 2002:a05:6a00:2ae:: with SMTP id
	q14mr10623341pfs.155.1576773328783; 
	Thu, 19 Dec 2019 08:35:28 -0800 (PST)
Received: from tyche ([2601:646:9200:4e0::c389])
	by smtp.gmail.com with ESMTPSA id
	a13sm8873392pfc.40.2019.12.19.08.35.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 08:35:28 -0800 (PST)
Message-ID: <36aab2473b80d6822f5df449ef39629942e176b0.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 08:35:27 -0800
In-Reply-To: <679f8a273b8e113fadace659a84c35b1338ddbff.camel@andred.net>
References: <20191218233928.696037-1-raj.khem@gmail.com>
	<679f8a273b8e113fadace659a84c35b1338ddbff.camel@andred.net>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [PATCH] cmake: Displace VERBOSE setting
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
X-List-Received-Date: Thu, 19 Dec 2019 16:35:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-12-19 at 08:52 +0000, André Draszik wrote:
> Hi Khem,
> 
> On Wed, 2019-12-18 at 15:39 -0800, Khem Raj wrote:
> > Setting VERBOSE always, while is fine on one hand for debugging,
> > its
> > coming at an expense of creating lots and lots of logs, e.g.
> > qtwebkit
> > compile logs alone with VERBOSE is 163MB, there are many other
> > large
> > packages which use cmake e.g. WPE, webkitgtk etc which are in same
> > range
> > with out this option on, the logs reduce to 861K and also speeds up
> > build a notch
> > 
> > If user needs to enable this logs for targetted debugging debugging
> > that
> > could be added via
> > 
> > EXTRA_OECMAKE_BUILD += "--verbose"
> > 
> > in recipe
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> 
> I don't agree with the reasoning to always disable this by default. -
> it's
> way too useful in general. I can't count the number of times it was
> enough
> to look at the log.do_compile to figure out something is wrong.
> 

What details do you look into when builds dont break ? and how often?
perhaps that will help in understanding the case.

> Now you have to recompile everything with this merged, and something
> that
> took 5 minutes to debug becomes an arduous task.
> 

there are two aspects to it, one you described and another one is where
users and infra is just building it. They are not component developers
rather consumers. I think latter is more common by far.

> If the Webkit build is too verbose, you should make that specific
> recipe
> less verbose. E.g. you could always set
> EXTRA_OECMAKE_BUILD, and just clear
> it out in the webkit recipe.
> 

perhaps that is doable and after current patch it can be set globally
too. However, for an OE user its a bad experience

1. its not default cmake option to enable verbosity, so when someone   
builds their stuff with OE, they don't get good experience, I consider
that added impediment to use OE.

2. People who enable it know what they are doing.

> Otherwise, based on the same reasoning, you should disable all logs,
> not just
> cmake logs: kernel, make output in general, bitbake logs. They all
> take up space.
> 

if they are large perhaps they should be too.
163M is a lot of logs, with slow disks it degrades the compile time,
helps killing the disks quicker, all post processing it delayed, you
pay high price for something you will occasionally use.

> Seriously, those logs are useful, keeping in mind that often logs are
> collected on build-machines, and having easy access is a huge time-
> saver.
> 

One case where people look into these logs are when something breaks
and all error messages are logged without this option as well. 

> 
> Cheers,
> Andre'
> 
> 
> 
> > ---
> >  meta/classes/cmake.bbclass | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/cmake.bbclass
> > b/meta/classes/cmake.bbclass
> > index 8ccb1eefc7..8a44a0c216 100644
> > --- a/meta/classes/cmake.bbclass
> > +++ b/meta/classes/cmake.bbclass
> > @@ -181,9 +181,14 @@ cmake_do_configure() {
> >  	  -Wno-dev
> >  }
> >  
> > +# To enable VERBOSE option to emit all kind of logs for a given
> > recipe add following in it
> > +#
> > +# EXTRA_OECMAKE_BUILD += "--verbose"
> > +#
> > +# Then run do_compile again
> >  cmake_runcmake_build() {
> > -	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build
> > '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
> > -	eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build
> > '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
> > +	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}'
> > "$@" -- ${EXTRA_OECMAKE_BUILD}
> > +	eval ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}' "$@"
> > -- ${EXTRA_OECMAKE_BUILD}
> >  }
> >  
> >  cmake_do_compile()  {
> > -- 
> > 2.24.1
> > 



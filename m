Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4528D60853
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TBwZR5021979; Fri, 29 Jul 2016 12:58:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kq60QAN5_w8N; Fri, 29 Jul 2016 12:58:35 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TBwY3W021976
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 12:58:35 +0100
Message-ID: <1469793514.9142.61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 29 Jul 2016 12:58:34 +0100
In-Reply-To: <alpine.LFD.2.20.1607290750390.23975@localhost.localdomain>
References: <alpine.LFD.2.20.1607290725440.23675@localhost.localdomain>
	<alpine.LFD.2.20.1607290735180.23808@localhost.localdomain>
	<1469792913.9142.56.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1607290750390.23975@localhost.localdomain>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: want to verify proper use of run-postinsts, if i may
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
X-List-Received-Date: Fri, 29 Jul 2016 11:58:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-07-29 at 07:54 -0400, Robert P. J. Day wrote:
> On Fri, 29 Jul 2016, Richard Purdie wrote:
> 
> > On Fri, 2016-07-29 at 07:43 -0400, Robert P. J. Day wrote:
> > > On Fri, 29 Jul 2016, Robert P. J. Day wrote:
> > > 
> > > ... snip ...
> > > 
> > > > am i missing anything?  i'm assuming i'd use a .bbappend recipe
> > > > to
> > > > add the script names to SRC_URI, then define
> > > > "do_install_append()"
> > > > to manually copy them over, or is there a proper way to do that
> > > > i'm
> > > > not seeing?
> > > 
> > >   never mind, just found an example that confirmed just what i
> > > suspected:
> > > 
> > > https://github.com/meta-debian/meta-debian/blob/daisy/recipes-deb
> > > ian/
> > > run-postinsts/run-postinsts_1.0.bbappend
> > 
> > Personally, I wouldn't take meta-debian as a good example of
> > anything, that layer is doing some things which I'd find
> > questionable. Obviously they are free to do so though.
> > 
> > Most of the time the package manager sets up things to run under
> > run
> > -postinsts as needed. Yes, you can do this automatically, but why
> > not just write a postinstall for your package and defer it to first
> > boot if that is what you need?
> 
>   it's not just package post stuff here, i'm looking at run-postinsts
> to do a *lot* of subsequent setup of the target system -- effectively
> downloading and installing the entire proprietary application.
> 
>   yes, i realize i could just make that app part of the initial
> image,
> but there are reasons for this. so i'm assuming just manually
> installing and running some scripts via run-postinsts is the way to
> go.

Note that if there aren't files there to run, I think run-postinsts
disables itself from subsequent boots so it really is designed for "one
-shot" use. It may not run at all if there is nothing to run.

Cheers,

Richard



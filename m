Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CAE406B1FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:16:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NBQT72012012; Fri, 23 Aug 2013 12:28:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id odpcoZiRcH3P; Fri, 23 Aug 2013 12:28:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NBSGTI012027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 23 Aug 2013 12:28:17 +0100
Message-ID: <1377256570.6762.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 23 Aug 2013 12:16:10 +0100
In-Reply-To: <CAGiJk9d6-53fdswhsoNC_s7Q75BAgqtFWq8DrC5TPg8KXY_NBA@mail.gmail.com>
References: <1377180295.6762.19.camel@ted>
	<CAGiJk9d6-53fdswhsoNC_s7Q75BAgqtFWq8DrC5TPg8KXY_NBA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Web browsing and HTML in OE-Core
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
X-List-Received-Date: Fri, 23 Aug 2013 11:16:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 16:24 +0200, Samuel Stirtzel wrote:
> 2013/8/22 Richard Purdie <richard.purdie@linuxfoundation.org>:
> > We've slowly been shaking out the definition of OE-Core and as part of
> > that we removed web and web-gtk which were the only browsers in there
> > and were admittedly a bit limited/broken.
> >
> > There is no doubt that web technology has an increasingly important role
> > in the future and in embedded devices (e.g. kiosk type devices, digital
> > signs and so on).
> >
> > With that in mind, I think some kind of HTML support in OE-Core is
> > important going forward. Equally, I dislike having things there which we
> > cannot test. I know some people have looked into this and it appears
> > midori is the best option for something with a small number of
> > additional dependencies. I therefore currently think this is something
> > we should make a decision to include since it gives us significantly
> > better coverage of things like webkit which are a already in the core
> > yet totally untested at present.
> >
> > I'm open to opinions, equally we do need to make a decision on this soon
> > since we're nearly at the feature freeze point. Thoughts?
> 
> 
> Hi,
> 
> just some thoughts: Qt provides an example application that uses
> webkit called "fancybrowser"
> This demo it is located at the package qt4-examples
> (/usr/bin/qt4/examples/webkit/fancybrowser/ in the target sysroot).

The webkit with qt is a bit different from the standalone webkit and
would just test the qt version. Certainly something to think about but
I'm not sure its quite what we need...

Cheers,

Richard




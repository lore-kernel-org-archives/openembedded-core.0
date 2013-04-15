Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URi9V-00045x-BI for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 14:04:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FBlal9006020; Mon, 15 Apr 2013 12:47:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id maj4rztHUE3Q; Mon, 15 Apr 2013 12:47:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FBlY9G006005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 15 Apr 2013 12:47:35 +0100
Message-ID: <1366026432.8670.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yevhen Kyriukha <kirgene@gmail.com>
Date: Mon, 15 Apr 2013 12:47:12 +0100
In-Reply-To: <CADV-EXF-_FHVhfXje=4z7ayCpEOYNCp74=3wVpxKR7UZufUH_A@mail.gmail.com>
References: <CADV-EXFrm6O3x7mNEz4X87inG-jLd6Kb5UNDhszh4hLXGgOvXw@mail.gmail.com>
	<D36FF37C-5906-4F9E-AC08-57B159AEF560@dominion.thruhere.net>
	<CADV-EXHK9oo177UySi8kcpu4xrDx_Pw8q=S=0mXts3OyJrn28w@mail.gmail.com>
	<1366025009.8670.25.camel@ted>
	<CADV-EXF-_FHVhfXje=4z7ayCpEOYNCp74=3wVpxKR7UZufUH_A@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: Multiple *.bbappend files support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 12:04:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 14:34 +0300, Yevhen Kyriukha wrote:
> 2013/4/15 Richard Purdie <richard.purdie@linuxfoundation.org>:
> > On Mon, 2013-04-15 at 13:37 +0300, Yevhen Kyriukha wrote:
> >> Great, thanks!
> >> Best regards,
> >> Yevhen
> >>
> >>
> >> 2013/4/15 Koen Kooi <koen@dominion.thruhere.net>:
> >> >
> >> > Op 15 apr. 2013, om 12:26 heeft Yevhen Kyriukha <kirgene@gmail.com> het volgende geschreven:
> >> >
> >> >> Is there a way to use multiple *.bbappend files in different layers?
> >> >>
> >> >> I'm using meta-raspberrypi and my own layer.
> >> >> Both extend base-files with *.bbappend and both have PRINC = "1".
> >> >> But only first of *.bbappend files applied (that is in meta-raspberrypi).
> >> >> PR of base-files also increments by one (not by two).
> >> >
> >> > Yeah, try to make all bbappends use:
> >> >
> >> >         PRINC := "${@int(PRINC) + 1}"
> >> >
> >
> > I'd just add that with the PR server now in use, the need to add this
> > PRINC stuff should be removed...
> >
> > Cheers,
> >
> > Richard
> >
> 
> And what does it mean? What do I need to write in bbappend instead of PRINC?

Nothing. The system automatically detects changes in the metadata
through the sstate checksum and then automatically changed PR as
needed. 

http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#working-with-a-pr-service

Cheers,

Richard




Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UbHwx-0008BJ-2K for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 00:07:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4BLnS5w029962; Sat, 11 May 2013 22:52:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SASaxV9YkHQ0; Sat, 11 May 2013 22:52:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4BLpw7o030000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 11 May 2013 22:52:00 +0100
Message-ID: <1368308951.11129.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 11 May 2013 22:49:11 +0100
In-Reply-To: <CAP9ODKo4Knb2Ho5+XS3dGJ2K7DuxSasfhbiMUsLp_SkeOwbkEg@mail.gmail.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<1368224314.11129.65.camel@ted>
	<CAP9ODKo4Knb2Ho5+XS3dGJ2K7DuxSasfhbiMUsLp_SkeOwbkEg@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Patches, about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Sat, 11 May 2013 22:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-05-11 at 17:39 -0300, Otavio Salvador wrote:
> On Fri, May 10, 2013 at 7:18 PM, Richard Purdie
> > Adding mode dimensions to a problem we already struggle with seems like
> > a bad idea to me.
> 
> This sounds like you're against the modular design and it is no sense
> for me. These dimensions also need test and if it cannot be done, we
> have a design flaw.

You think I'm against modular design? Seriously? Keep in mind I'm the
person who played a big part in helping transition to the layers model
in the first place instead of the monolithic OE classic, split up the
fetchers in bitbake, split bitbake into client/server/uis and so on.

My instinct is suggesting the timing is wrong for this particular change
(it may be right for Tomas, I don't think its right for OE-Core). I've
said what I plan to say on this now though.

I will however raise the point that a lot of people currently have a
tendency to "hide behind" me in discussions. They see me reply and
assume that since I've said something, that is it and they can keep
quiet. I want to be clear this isn't going to work as on this and some
other topics, it looks like I'm a lone voice. If people do believe in a
particular issue, they do need to stand up and add weight to an argument
themselves.

Cheers,

Richard





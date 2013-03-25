Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UK7g6-0006gP-5c for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 14:43:12 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PDZtpo004674; Mon, 25 Mar 2013 13:35:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dO-dMsVahFOx; Mon, 25 Mar 2013 13:35:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PDZmNV004667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 13:35:51 GMT
Message-ID: <1364217957.3097.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 25 Mar 2013 13:25:57 +0000
In-Reply-To: <20130325125728.00004c11@unknown>
References: <1364172907-14541-1-git-send-email-paul@paulbarker.me.uk>
	<20130325125728.00004c11@unknown>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Gnupg recipe fixes
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
X-List-Received-Date: Mon, 25 Mar 2013 13:43:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 12:57 +0000, Paul Barker wrote:
> On Mon, 25 Mar 2013 00:55:05 +0000
> Paul Barker <paul@paulbarker.me.uk> wrote:
> 
> > I'm setting up a signed apt repository of .deb packages built using
> > OpenEmbedded and I've ran into an issue with apt-get on the target
> > board not being able to find 'gpgv' to verify the signatures. This is
> > installed as 'gpgv2' in the gnupg recipe. Therefore I've used
> > update-alternatives to create the appropriate link.
> > 
> 
> I've re-thought this already. Is update-alternatives the right thing to
> use here? Maybe not as there isn't anything else that provides gpgv and
> gnupg_1.* and gnupg_2.* probably can't co-exist on the same install. I
> could just add a line to do_install_append() to create the gpgv link
> manually, similar to how the link for gpg is already created. Please
> let me know which is the better solution here.
> 
> I also noticed that gnupg_1.4.7.bb splits gpgv into a separate package
> but gnupg_2.0.19 doesn't. I could write a patch to modify one of these
> to match the other if desired?

I glanced at this earlier and wondered what the alternative provider
was. If we have no alternative, a symlink is fine.

I'm open to separate packaging of the utilities if its useful and they
can use used one without the other. If we'd generally need both, they
can exist in the same package fine.

Cheers,

Richard




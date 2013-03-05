Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCvjR-0006Mo-Eo for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 18:32:55 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25HMiLb016273; Tue, 5 Mar 2013 17:24:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zfEKH1PnqtGm; Tue,  5 Mar 2013 17:24:14 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25HO9gQ016437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Mar 2013 17:24:12 GMT
Message-ID: <1362503769.11727.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 05 Mar 2013 17:16:09 +0000
In-Reply-To: <20130305142018.GB12023@jama.dyndns-home.com>
References: <1362403514-10122-1-git-send-email-Martin.Jansa@gmail.com>
	<1362492625.29587.95.camel@ted>
	<20130305142018.GB12023@jama.dyndns-home.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: move systemd support where it belongs
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
X-List-Received-Date: Tue, 05 Mar 2013 17:32:56 -0000
X-List-Received-Date: Tue, 05 Mar 2013 17:32:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-05 at 15:20 +0100, Martin Jansa wrote:
> On Tue, Mar 05, 2013 at 02:10:25PM +0000, Richard Purdie wrote:
> > On Mon, 2013-03-04 at 14:25 +0100, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-connectivity/avahi/avahi.inc       | 6 +-----
> > >  meta/recipes-connectivity/avahi/avahi_0.6.31.bb | 6 ++++++
> > >  2 files changed, 7 insertions(+), 5 deletions(-)
> > 
> > "where it belongs"? Is this due to the avahi-ui recipe?
> 
> Yes, avahi-ui is overwriting PACKAGES and systemd.bbclass was showing
> warnings since this systemd was added to avahi.inc

In future please put that in the commit message. I added it this time...

And yes, I'm going to talk to others about commit messages too. They're
getting too short in general.

Cheers,

Richard




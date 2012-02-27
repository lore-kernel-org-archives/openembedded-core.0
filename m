Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1zfE-0008Bo-9F for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 13:26:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RCI1QZ026954;
	Mon, 27 Feb 2012 12:18:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26081-06; Mon, 27 Feb 2012 12:17:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RCHrxq026948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 27 Feb 2012 12:17:54 GMT
Message-ID: <1330345075.4593.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niqingliang@insigma.com.cn, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 12:17:55 +0000
In-Reply-To: <1330340722.1086.122.camel@localhost.localdomain>
References: <17057774.C0TjevbrGC@kgy> <1330181716.13788.33.camel@ted>
	<41586593.1CLnZEXO8J@linux-oxe9> <4F4B5DDA.6010206@communistcode.co.uk>
	<1330340722.1086.122.camel@localhost.localdomain>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: empty dirs in glib-2.0
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
X-List-Received-Date: Mon, 27 Feb 2012 12:26:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-27 at 19:05 +0800, Ni Qingliang wrote:
> Same problem!!!
> 
> On Mon, 2012-02-27 at 18:41 +0800, Jack Mitchell wrote:
> > On 27/02/12 10:30, Gyorgy Kovesdi wrote:
> > >> rmdir was used specifically so we'd know if the directory wasn't empty.
> > >> What files are in there?
> > > ...../usr/lib/gio/modules:
> > >
> > > total 32K
> > > drwxr-xr-x 2 kgy users 4.0K Feb 27 11:26 .
> > > drwxr-xr-x 3 kgy users 4.0K Feb 27 11:26 ..
> > > -rwxr-xr-x 1 kgy users 2.0K Feb 27 11:26 libgiofam.la
> > > -rwxr-xr-x 1 kgy users  20K Feb 27 11:26 libgiofam.so
> > >
> > > It is reproducible now, even in a brand new checkout.
> > >
> > > Regards
> > > Gyorgy Kovesdi
> > >
> > 
> > I can confirm I also just ran into this issue on an Angstrom Master
> > checkout.

We need to add --disable-fam to EXTRA_OECONF. Since a lot of people are
hitting this, I've pushed such a patch directly.

Cheers,

Richard




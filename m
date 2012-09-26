Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGnVs-0000V3-4Q for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:02:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8Q8ngR8016704;
	Wed, 26 Sep 2012 09:49:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15900-03; Wed, 26 Sep 2012 09:49:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8Q8nVKw016698
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 26 Sep 2012 09:49:33 +0100
Message-ID: <1348649372.8662.90.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Wed, 26 Sep 2012 09:49:32 +0100
In-Reply-To: <1348611089.2853.7.camel@lenny>
References: <1348577690.31293.70.camel@phil-desktop>
	<1348610357.2853.5.camel@lenny>
	<1348610431.1335.11.camel@x121e.pbcl.net>
	<1348611089.2853.7.camel@lenny>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
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
X-List-Received-Date: Wed, 26 Sep 2012 09:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 18:11 -0400, Colin Walters wrote:
> On Tue, 2012-09-25 at 23:00 +0100, Phil Blundell wrote:
> 
> > That'd be inconsistent with other packages, since we do generally build
> > and ship the static libraries.  Having a big switch to turn off static
> > libraries globally seems like a fine plan, but I can't see any obvious
> > reason why the util-linux ones are any more useless than the rest.
> 
> Makes sense.  I wonder if there are actually any users of the static
> libraries.
> 
> For what it's worth in gnome-ostree I do just globally pass
> --disable-static by default.

I tested this a while back to see what performance difference it made.
The answer was "nothing too significant", I don't have the exact timings
handy. I do remember having to exclude sqlite-native from the list since
pseudo static links against it.

Cheers,

Richard




Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBo2n-0007IM-UR; Wed, 12 Sep 2012 16:35:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CENOhM020420;
	Wed, 12 Sep 2012 15:23:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19904-08; Wed, 12 Sep 2012 15:23:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CENHU5020414
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 15:23:18 +0100
Message-ID: <1347459798.11710.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2012 15:23:18 +0100
In-Reply-To: <CAJTo0LbTipjuhpvyxgL1Z=WTn0yHNcLB4tQqcQeXCUth8ygWkA@mail.gmail.com>
References: <CAJTo0LbTipjuhpvyxgL1Z=WTn0yHNcLB4tQqcQeXCUth8ygWkA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: libx11-diet removal
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
X-List-Received-Date: Wed, 12 Sep 2012 14:35:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-12 at 15:10 +0100, Burton, Ross wrote:
> On 12 September 2012 14:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I don't think there are many such users so I've merged the series. We've
> > had this mess around for a long time, keep talking about fixing and now
> > someone gives me a patch series so I really just can't resist ;-)
> 
> Thanks, Richard.
> 
> The final question is do we keep libx11-diet?  It is substantially
> smaller but the stubbing does knock out some non-deprecated
> functionality - as far as I'm aware both GTK+ and Qt fail to
> initialise with libx11-diet.
> 
> Two options:
> 1) delete it from oe-core
> 2) whoever actually uses it can have it, moving it from oe-core
> 
> I'll do (1) soonish unless someone speaks up in it's defence...

Is there any way to add in enough functionality that gtk/qt would work
but still save some space?

Cheers,

Richard




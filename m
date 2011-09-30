Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9gg2-0007I6-NG for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:15:11 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UHG0Ji000494; Fri, 30 Sep 2011 18:16:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QgpdtanSGinp; Fri, 30 Sep 2011 18:16:00 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UHFvNm000487
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 30 Sep 2011 18:15:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Sep 2011 18:09:31 +0100
In-Reply-To: <20110930164658.GB7364@jama.jama.net>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted> <20110930164658.GB7364@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317402578.12332.218.camel@ted>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Fri, 30 Sep 2011 17:15:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 18:46 +0200, Martin Jansa wrote:
> On Fri, Sep 30, 2011 at 03:15:15PM +0100, Richard Purdie wrote:
> > I'd not forgotten about this patch, just been distracted by other
> > things. I've run some further tests on the changes here and have
> > comments below. Summary is I think some pieces can merge, other pieces
> > need more work. Lets try and get the pieces that are ready merged, then
> > worry about the remainder.
> > 
> > Could we clean out the problematic pieces and resubmit please so we can
> > at least get those pieces in? :)
> 
> pushed as 6 patches to 
> oe-core-contrib jansa/allarch
> 
> 1st patch contains changes you've marked as fine
> 2nd is hal-info, which is imho not worth debugging it as nobody likes
>   hal nowadays (I've tried to patch configure.in, but recipe doesn't
>   call reautoconf IIRC..)
> the rest is kept as reminder which recipes needs to be taken care of.

Thanks. I've taken the two patches. I'd love to get rid of hal, in fact
its on my list of things that need to migrate out of OE-Core...

I'm left wondering what (if anything) uses hal in our images?

Cheers,

Richard




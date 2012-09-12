Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBng5-000699-FD for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:12:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CDxqIb020245;
	Wed, 12 Sep 2012 14:59:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19904-04; Wed, 12 Sep 2012 14:59:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CDxjYu020239
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 14:59:46 +0100
Message-ID: <1347458387.11710.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2012 14:59:47 +0100
In-Reply-To: <CAJTo0LYVeNZ5==q97TOj=Fhhznvkej9F6UiGdV1xW-se6yu_Pg@mail.gmail.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
	<1347391088-30390-13-git-send-email-ross.burton@intel.com>
	<CAJTo0LYVeNZ5==q97TOj=Fhhznvkej9F6UiGdV1xW-se6yu_Pg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 13/18] libx11-trim: remove, it's the same as libx11 now
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
X-List-Received-Date: Wed, 12 Sep 2012 14:12:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-12 at 12:46 +0100, Burton, Ross wrote:
> This is the only patch in the series that isn't ready for merging as
> far as I'm concerned.
> 
> Are there sufficient users of libx11-trim on non-debian-renaming
> systems that use package feeds to add conflicts/replaces for this?

I don't think there are many such users so I've merged the series. We've
had this mess around for a long time, keep talking about fixing and now
someone gives me a patch series so I really just can't resist ;-)

Cheers,

Richard




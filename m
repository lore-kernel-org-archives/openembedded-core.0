Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvRfs-0007b4-Rf for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 13:00:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBjZYh023713;
	Wed, 16 Jan 2013 11:45:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23524-01; Wed, 16 Jan 2013 11:45:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GBjPb8023706
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 16 Jan 2013 11:45:26 GMT
Message-ID: <1358336724.3276.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 16 Jan 2013 11:45:24 +0000
In-Reply-To: <CAP9ODKoom8bBhU-YJZTFLxmNt6uAW+T6GnmWtWiCxmgbiFA3Aw@mail.gmail.com>
References: <1358171300-970-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKoom8bBhU-YJZTFLxmNt6uAW+T6GnmWtWiCxmgbiFA3Aw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Christopher Larson <chris_larson@mentor.com>, Patches,
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] archive-*-source.bbclass: Handle all package classes
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
X-List-Received-Date: Wed, 16 Jan 2013 12:00:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-14 at 15:33 -0200, Otavio Salvador wrote:
> On Mon, Jan 14, 2013 at 11:48 AM, Shakeel, Muhammad
> <muhammad_shakeel@mentor.com> wrote:
> > From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> >
> > * Add archiver tasks correctly for any 'IMAGE_PKGTYPE'.
> >
> > [YOCTO #3449]
> >
> > Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> 
> I'd prefer if this patch would be squashed in the first one. It does
> looks like the same change for me as you're adding those hooks here as
> well.
> 
> Richard, can you comment here?

They do like different changes to me...

Cheers,

Richard




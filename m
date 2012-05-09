Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SSEID-00013d-BA
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 23:19:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49L9YWO029085
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2012 14:09:34 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 14:09:33 -0700
Date: Wed, 9 May 2012 16:09:26 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120509160926.2e297150@wrlaptop>
In-Reply-To: <1336597189.2494.80.camel@ted>
References: <cover.1335922726.git.peter.seebach@windriver.com>
	<24944576961308660582b4a62b2c609fcef0bcea.1335922726.git.peter.seebach@windriver.com>
	<1336597189.2494.80.camel@ted>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] sanity.bbclass: Check for bogus values in BBCLASSEXTEND
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
X-List-Received-Date: Wed, 09 May 2012 21:19:29 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 9 May 2012 21:59:49 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> FWIW, this isn't going to work. Its checking the sanity in
> "configuration" space, pre recipe parse so it won't pick up on the
> errors we want it to.
> 
> So whilst its well intentioned, it isn't going to work as designed and
> we'll have to rethink it. I can't think of a good way to fix it right
> now, we don't really have a structure for recipe checks at this point.

Oh, that has to be per-recipe?  I thought BBCLASSEXTEND was top-level.

Adding recipe checks of some sort seems useful, but that is a bigger
project, so I guess we can drop that.  Note that this was in sgw's
consolidated pull request, too.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.



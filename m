Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrUPL-0004Ew-1J for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:35:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDNsRt025201
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:23:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23940-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:23:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDNjwi025194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:23:46 +0100
Message-ID: <1342617829.513.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 14:23:49 +0100
In-Reply-To: <CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1sq_D4nDSSOctRRht=_93yacfMNfnO9AENCg-aTGyPNreg@mail.gmail.com>
	<CAMZjud0ZtRDiE-kpNw6mZz33BQEBJN3LzG5shHEzMn6wk5+sSA@mail.gmail.com>
	<CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Wed, 18 Jul 2012 13:35:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 09:03 -0400, Bruce Ashfield wrote:
> On Wed, Jul 18, 2012 at 7:30 AM, Marinescu, Bogdan A
> <bogdan.a.marinescu@intel.com> wrote:
> > On Tue, Jul 17, 2012 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> Why is recipe renamed
> >
> > Wasn't I supposed to do that when I upgraded the package from 3.4 to 3.4.3 ?
> 
> No one replied to my other question (or at least no one replied that I
> noticed), about
> why we even bothered to bump it to 3.4.3 ...
> 
> I have the same elements in that question .. but from a different angle.

I think Khem's question is a little vague and I'm not sure how I'd
answer that.

As for policy of updating the kernel headers against stable releases, it
can't hurt and we needed to bump PV or PR anyway as Martin mentioned so
that was the main reason I took the patch.

I think there could be a perception issue if we don't update, on the
other hand it could be considered unnecessary churn. So I think in
future this will be on a case by case basis. If there was a header fix
in the stable series (which is conceivable), we would want to take that
for example.

Cheers,

Richard




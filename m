Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q2i9R-00041S-1u
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 11:52:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Mar 2011 03:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,236,1299484800"; d="scan'208";a="724082428"
Received: from unknown (HELO [10.255.16.82]) ([10.255.16.82])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2011 03:50:31 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20110324074926.GR2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
	<1300896184.3488.17.camel@scimitar>
	<20110323175229.GN2224@xora-desktop.xora.org.uk>
	<1300921337.3018.45.camel@rex>
	<20110323235316.GQ2224@xora-desktop.xora.org.uk>
	<4D8A88FF.8070600@balister.org> <1300926448.3018.69.camel@rex>
	<20110324074926.GR2224@xora-desktop.xora.org.uk>
Date: Thu, 24 Mar 2011 10:50:25 +0000
Message-ID: <1300963825.2752.3.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 (2.32.2-1.fc14) 
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Thu, 24 Mar 2011 10:52:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-24 at 07:49 +0000, Graeme Gregory wrote:
> On Thu, Mar 24, 2011 at 12:27:28AM +0000, Richard Purdie wrote:
> > Have either of you ever tried to explain some of the concepts we're
> > dealing with to people who aren't deeply engaged engineers?
> > 
> Yes, everytime I apply for a new job/contract getting quite used to
> explaining it.
> 
> > Having a model showing the kinds of things layers can do is extremely
> > helpful in explaining the concept to people.
> > 
> > Part of OE's problem and the number one complaint about it is that its
> > hard to understand. If as I/others try and put things into terms that
> > others can understand get undermined with this kind of response its just
> > going to further the impression that OE is nice but never going to be
> > useful in the real world.
> > 
> > As for whether that diagram is practical, I actually believe it is in
> > some cases, like the one I described above. Certainly not all but its
> > worth trying to strive to simplify and make things fit simpler models
> > if/when we can. If we don't even bother trying, there is no chance
> > things will improve.
> > 
> 
> You miss my point, Joshua's email reads to me like "our goal is to make OE
> like this diagram" which if true would cripple OE to being incredibly simple
> and non flexible.

It certainly wasn't my intention to imply that, in fact the "me too"
strongly indicates that I agreed with you and that I personally thought
the diagram was a useful *aide* in explaining layers.

> 
> My vision of a seperated out OE is to seperate components out into logical
> boxes. Ie the gnome box, the kde box, the xorg box. Then like we used to do
> with our lego or mecheno sets. When we want to build something we know what
> components we want so we select the boxes that contain those components.

FWIW, this is the same vision I was already agreeing with.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre




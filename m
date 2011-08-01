Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qnvvh-0008TH-Ie for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:05:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71H15BU008884
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 18:01:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08397-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 18:01:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71H0vjM008878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 18:00:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312216211.30326.537.camel@phil-desktop>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
	<e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
	<1312216211.30326.537.camel@phil-desktop>
Date: Mon, 01 Aug 2011 18:00:45 +0100
Message-ID: <1312218045.2344.515.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/8] multilib: Add support for compiling recipes against multiple ABIs
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
X-List-Received-Date: Mon, 01 Aug 2011 17:05:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 17:30 +0100, Phil Blundell wrote:
> On Tue, 2011-07-26 at 22:53 +0100, Richard Purdie wrote:
> > +MULTILIBS ??= "multilib:lib32"
> > +BBCLASSEXTEND_append_pn-linux-libc-headers = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-eglibc-initial = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-eglibc = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-libgcc = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-gcc-runtime = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-libtool-cross = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-zlib = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-binutils-cross = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-gcc-cross-initial = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-gcc-cross-intermediate = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-gcc-cross = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-busybox = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-util-linux = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-gettext = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-bash = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-ncurses = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-expat = " ${MULTILIBS}"
> > +BBCLASSEXTEND_append_pn-eglibc-locale = " ${MULTILIBS}"
> 
> What's the significance of this set of package names?  I couldn't
> immediately spot an obvious reason why these particular recipes were
> getting special treatment.
>  
> It seems particularly weird to have update-rc.d in there since that is
> an allarch recipe and (one hopes) isn't going to change much under
> multilib.

It was the basic testing set of things we'd tested with multilib. We
still need to better handle "all" arch, likely by adding in some
RPROVIDES and disabling the class extensions themselves.

Its intended this list go away in time and the extentions work with any
recipe and this is purely a transition artefact.

Cheers,

Richard




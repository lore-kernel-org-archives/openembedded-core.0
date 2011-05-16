Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLyFA-0008UB-Vu for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 15:53:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GDopVj020012
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 14:50:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19500-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 14:50:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GDohaF020006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 14:50:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <982B5C11-301B-48C4-91A9-E73BF47FEF8D@dominion.thruhere.net>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<13617913-C458-40F1-AA46-489ACEADF340@dominion.thruhere.net>
	<BANLkTik7k7pd5+cc+5-K3-Di7+hdryow9Q@mail.gmail.com>
	<1305546068.3424.33.camel@rex>
	<982B5C11-301B-48C4-91A9-E73BF47FEF8D@dominion.thruhere.net>
Date: Mon, 16 May 2011 14:50:41 +0100
Message-ID: <1305553841.3424.76.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Mon, 16 May 2011 13:53:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 15:11 +0200, Koen Kooi wrote:
> Op 16 mei 2011, om 13:41 heeft Richard Purdie het volgende geschreven:
> 
> > On Mon, 2011-05-16 at 02:55 -0700, Khem Raj wrote:
> >> On Sun, May 15, 2011 at 11:58 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>> 
> >>> Op 16 mei 2011, om 08:04 heeft Khem Raj het volgende geschreven:
> >>> 
> >>>> Do not define DEPLOY_DIR_IMAGE
> >>>> Append -uclibc to STAGING_DIR_TARGET only for target recipe and cross
> >>>> recipes
> >>>> Append -uclibc to STAGING_DIR_HOST only for target recipes.
> >>>> 
> >>>> These changes make sure that we still share the native sysroot
> >>> 
> >>> I still stay we append tclibc unconditionally.
> >> 
> >> yes thats would simplify things if we agree to use TCLIBC in bitbake.conf
> > 
> > We can't depend on TCLIBC in bitbake.conf since someone still has the
> > option of not using the standard configuration boilerplate we're
> > providing.
> 
> So we can't add TCLIBC ??= eglibc to bitbake.conf?

No, I can just see the bug reports for uclibc building in a directory
called XXX-eglibc as the user had only set the PREFERRED_PROVIDER
variables.

Cheers,

Richard




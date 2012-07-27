Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SulRB-0007ER-BD for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 16:22:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6REBAVG006626;
	Fri, 27 Jul 2012 15:11:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06353-01; Fri, 27 Jul 2012 15:11:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6REB0eP006601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Jul 2012 15:11:02 +0100
Message-ID: <1343398257.9574.139.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 15:10:57 +0100
In-Reply-To: <1343396986.18260.10.camel@lenny>
References: <1343389394.9574.127.camel@ted>
	<20120727114631.GJ3621@jama.jama.net> <1343391537.9574.132.camel@ted>
	<1343396986.18260.10.camel@lenny>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gobject-introspection: Drop the recipe, it has never worked and if it does cross compile, we can add it back
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
X-List-Received-Date: Fri, 27 Jul 2012 14:22:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 09:49 -0400, Colin Walters wrote:
> Hi Richard,
> 
> On Fri, 2012-07-27 at 13:18 +0100, Richard Purdie wrote:
> 
> > If the latter, add "gobject-introspection-stub" to DEPENDS and this
> > should resolve it. See the patches I just sent doing this for OE-Core.
> 
> Just want to say thanks for picking this up and running with it; it'll
> reduce the delta between how we currently build GNOME components and
> what OE needs, which is a big win.

Thanks for writing the stubs! :)

I've been wanting this for a while. Since Ross had sorted out gtk-doc,
this seemed like the next logical step and I think things look much
better in general!

Cheers,

Richard




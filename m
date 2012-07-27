Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1Sul73-0006zJ-TH
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 16:01:54 +0200
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 98C4820848
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 09:50:23 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 27 Jul 2012 09:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=P2A8pcKPiMA+Wis/ToFICD
	yIqgI=; b=UbN+7JikRS7JZc5e5RluIo6MHrj6Nw5NosMBno6NEE7Q5E/xJapOAh
	f1l3X0cHKijpxz/nBrDa1ozngdpTrDiIZf6kp97gYWAmCK1A5LvqHRl6/kxDPnMz
	DnFqSw4GSKRnMQvtG2fJSUsFPqGRO5Cw/cOc2QQ1v8YP/48j4cKbw=
X-Sasl-enc: KJJ2invGgu3FYITGnkqP9uxzOvOg1fbWVyEppUOzkMvA 1343397023
Received: from [10.0.0.200] (unknown [193.144.60.254])
	by mail.messagingengine.com (Postfix) with ESMTPA id 16690483608
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 09:50:22 -0400 (EDT)
Message-ID: <1343396986.18260.10.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 09:49:46 -0400
In-Reply-To: <1343391537.9574.132.camel@ted>
References: <1343389394.9574.127.camel@ted>
	<20120727114631.GJ3621@jama.jama.net> <1343391537.9574.132.camel@ted>
X-Mailer: Evolution 3.4.3 (3.4.3-2.fc17) 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 27 Jul 2012 14:01:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Richard,

On Fri, 2012-07-27 at 13:18 +0100, Richard Purdie wrote:

> If the latter, add "gobject-introspection-stub" to DEPENDS and this
> should resolve it. See the patches I just sent doing this for OE-Core.

Just want to say thanks for picking this up and running with it; it'll
reduce the delta between how we currently build GNOME components and
what OE needs, which is a big win.





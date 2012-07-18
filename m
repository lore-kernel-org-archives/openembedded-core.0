Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1SrIc0-0006Nx-9h
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 02:59:32 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id DF85620BB7;
	Tue, 17 Jul 2012 20:48:13 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Tue, 17 Jul 2012 20:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=ysLv3A5FhjNATlkfVlYCcU
	Vg6uo=; b=A6lC1EZP2V3NQ0Ptn1MPYy631FOI5zWBup5lyaZirzFdHPDbQlMHeZ
	jhzNXHvkWAj5KzcIsunSQZaaXBvRob2J63cfXiDvz2SOrx/10dkOr6R9CIhqiraz
	TcgPtsNBqDsN6n/GqQd0DVWgmIZeNXJ1unanmmT25RXcROTC0Fn7M=
X-Sasl-enc: apyiUGekbTI4xIFjsfsdDCv7CqQ8FrBThEFLOoLaG4PM 1342572493
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8C63A8E0152;
	Tue, 17 Jul 2012 20:48:13 -0400 (EDT)
Message-ID: <1342572457.2860.11.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jul 2012 20:47:37 -0400
In-Reply-To: <5006049E.40509@linux.intel.com>
References: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
	<5006049E.40509@linux.intel.com>
X-Mailer: Evolution 3.4.3 (3.4.3-1.fc17) 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFC 1/2] glib: upgrade to 2.32.4
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
X-List-Received-Date: Wed, 18 Jul 2012 00:59:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-17 at 17:34 -0700, Saul Wold wrote:

> It seems to be getting the native sysroot python instead of the more 
> correct "#! /usr/bin/env python", this is causing a dependency failure.
> 
> If you could look at this please.

I ran into this a while ago with flex/bison:

https://lists.yoctoproject.org/pipermail/poky/2012-January/007403.html

Apparently the "correct" fix is to set an environment variable like e.g.
PYTHON="/usr/bin/env python" ./configure --prefix=foo ?

That seems fairly gross though.  Some more generic solution would be
nice...I don't have any great ideas offhand though.  I wonder if there's
any actual use case for hardcoding the paths found at build time into
the generated binaries.

See also:
https://bugzilla.gnome.org/show_bug.cgi?id=650763
https://bugzilla.gnome.org/show_bug.cgi?id=670718





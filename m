Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TcwuO-0001lC-Ji for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 12:31:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAQBHGih022197;
	Mon, 26 Nov 2012 11:17:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20329-02; Mon, 26 Nov 2012 11:17:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAQBH5cq022191
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 26 Nov 2012 11:17:07 GMT
Message-ID: <1353928626.21863.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 26 Nov 2012 11:17:06 +0000
In-Reply-To: <CAP9ODKrCMHknzX62fb23=AXaKT8-CD2o6Pgmu1PV8T2wwKdh1g@mail.gmail.com>
References: <1353874980.21863.20.camel@ted>
	<CAP9ODKrCMHknzX62fb23=AXaKT8-CD2o6Pgmu1PV8T2wwKdh1g@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] allarch: Allow class to be included but overridden
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
X-List-Received-Date: Mon, 26 Nov 2012 11:31:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-11-26 at 09:08 -0200, Otavio Salvador wrote:
> On Sun, Nov 25, 2012 at 6:23 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > We have cases where we'd like to inherit this class by default but allow
> > special cases to override it. This change makes the code of the class
> > conditional on PACKAGE_ARCH remaining set to "all", allowing it to be
> > overridden. packagegroup usage is one case this is desirable.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> 
> Richard, I fail to see the usecase of packagroup. Can you clarify?

packagegroup.bbclass previously set PACKAGE_ARCH = "all" which was
confusing other code. Anything using the all package arch should really
use allarch so we are consistent about how we set the various variables.

Even though packagegroup.bbclass now uses allarch, we need specific
packagegroup packages to be able to override the class e.g. marking
themselves machine specific. This is why we need to make this change.

Cheers,

Richard





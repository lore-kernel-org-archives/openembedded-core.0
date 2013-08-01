Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7898861883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 13:08:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r71DIkJL020466; Thu, 1 Aug 2013 14:18:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UDnkbpRVD4os; Thu,  1 Aug 2013 14:18:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r71DIgre020458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 1 Aug 2013 14:18:44 +0100
Message-ID: <1375362513.3362.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 01 Aug 2013 14:08:33 +0100
In-Reply-To: <CAP9ODKrKdvyBtMLUzDztyfZHgC0=Y6p37Q_nHjoVb-cZ8=6CJg@mail.gmail.com>
References: <1375283605-25870-1-git-send-email-otavio@ossystems.com.br>
	<1375342673.3362.7.camel@ted>
	<CAP9ODKrKdvyBtMLUzDztyfZHgC0=Y6p37Q_nHjoVb-cZ8=6CJg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2013 13:08:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-01 at 09:19 -0300, Otavio Salvador wrote:
> On Thu, Aug 1, 2013 at 4:37 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2013-07-31 at 12:13 -0300, Otavio Salvador wrote:
> ...
> >> +    # Avoid readding the removed features later
> >> +    d.delVarFlag("DISTRO_FEATURES", "_append")
> >> +    d.delVarFlag("DISTRO_FEATURES", "_prepend")
> >
> > I quite clearly said this was a hack to allow you to see what the
> > problem was with the code and that it was *not* an acceptable change to
> > go into the core. I don't see any mention of that now and that is a
> > little frustrating to see this being proposed as a patch.
> 
> I forgot to add it to commit log, sorry. The idea was to send the
> working code so people using it could use a valid one. I understand we
> need to find a better solution for this but I am clueless about where
> to look.
> 
> I can work in another solution if someone can tell me what needs to be
> done. I looked at bb.data_smart code and didn't find any other way to
> fix this.
> 
> The finalize code would be the other place I can think about changing. Any hint?

Using existing API, did you try just d.delVar("DISTRO_FEATURES") and
then setting it again? Unlike the above, that doesn't assume any
knowledge of bitbake internals.

Cheers,

Richard




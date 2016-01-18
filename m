Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 404BF6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D45A5180BF;
	Mon, 18 Jan 2016 17:12:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id b4hkOLdxyFLe; Mon, 18 Jan 2016 17:12:50 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 42429180B6;
	Mon, 18 Jan 2016 17:12:50 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id EB9511477;
	Mon, 18 Jan 2016 17:12:49 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id DF5181387;
	Mon, 18 Jan 2016 17:12:49 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id D64373424A;
	Mon, 18 Jan 2016 17:12:49 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Mon, 18 Jan 2016
	17:12:49 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 8C9CB9C724; 
	Mon, 18 Jan 2016 17:12:49 +0100 (CET)
Date: Mon, 18 Jan 2016 17:12:49 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160118161249.GQ31212@axis.com>
References: <20160118124428.GK31212@axis.com>
	<1453127827.27999.64.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1453127827.27999.64.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PV from filename, not reflected in siginfo?
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
X-List-Received-Date: Mon, 18 Jan 2016 16:12:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16-01-18 14:37 +0000, Richard Purdie wrote:
> On Mon, 2016-01-18 at 13:44 +0100, Olof Johansson wrote:
> > Hi,
> > 
> > I'm currently investigating reports of bitbake not correctly
> > handling a type of change to a recipe, where the only change is a
> > filename rename to update the PV.
...
> > Is this a known issue? Any ideas on how to solve this? Nicer
> > workarounds?
> 
> It isn't known but I can imagine how this could cause a problem.
> 
> I suspect (but am guessing) that:
> 
> PV[vardepvalue] = "${PV}"
> 
> might happen to fix this...

Indeed, that works! Thanks a lot! It's not completely obvious to
me why it works, but I'm guessing that this is just a way to make
sure PV is expanded before siginfo is dumped?

Is something based on this acceptable for integration in oe-core,
or is this just a (much) nicer workaround?

-- 
olofjn


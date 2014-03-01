Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BFEA76F45A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 18:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 6901C2E3B4;
	Sat,  1 Mar 2014 19:05:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id yC26qAJFdxjK; Sat,  1 Mar 2014 19:05:40 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 0C7982E395;
	Sat,  1 Mar 2014 19:05:39 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A9B3EBB4;
	Sat,  1 Mar 2014 19:05:39 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9E11DE4F;
	Sat,  1 Mar 2014 19:05:39 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 99A98134626;
	Sat,  1 Mar 2014 19:05:39 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Sat, 1 Mar 2014 19:05:39 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 623A19C29D; 
	Sat,  1 Mar 2014 19:05:39 +0100 (CET)
Date: Sat, 1 Mar 2014 19:05:39 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20140301180539.GO30721@axis.com>
References: <1393599649-10573-1-git-send-email-olof.johansson@axis.com>
	<CABcZAN=xGp6Kua1uPhZJGUwyG2JE5RWhJzA9T=XVxtpqypXiow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=xGp6Kua1uPhZJGUwyG2JE5RWhJzA9T=XVxtpqypXiow@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Sat, 01 Mar 2014 18:05:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14-02-28 16:28 +0100, Chris Larson wrote:
> Out of curiosity, why not just use fnmatch for this
> implementation?

No reason. That would probably be far superior. I'll send a
revised patch some time early next week! Thanks!

-- 
olofjn


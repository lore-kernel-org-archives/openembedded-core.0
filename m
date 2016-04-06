Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4862F76E70
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 10:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u36ADVUt019950; Wed, 6 Apr 2016 11:13:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id azxqSeExKHRZ; Wed,  6 Apr 2016 11:13:31 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u36ADTaT019946
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 Apr 2016 11:13:30 +0100
Message-ID: <1459937609.7348.201.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Date: Wed, 06 Apr 2016 11:13:29 +0100
In-Reply-To: <5704D900.3000505@mlbassoc.com>
References: <cover.1459934955.git.liezhi.yang@windriver.com>
	<5704D900.3000505@mlbassoc.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] Fixes for len(TMPDIR) == 410
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
X-List-Received-Date: Wed, 06 Apr 2016 10:13:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-04-06 at 11:38 +0200, Gary Thomas wrote:
> On 2016-04-06 11:30, Robert Yang wrote:
> > The following changes since commit
> > b2dc5a68e74dafedf7960ef77ad3d73912ed7960:
> > 
> >    bdwgc: use github repo for source location (2016-04-05 11:48:09
> > +0100)
> > 
> > are available in the git repository at:
> > 
> >    git://git.openembedded.org/openembedded-core-contrib rbt/long
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/
> > log/?h=rbt/long
> > 
> > Robert Yang (2):
> >    sanity.bbclass: fix a hardcode in check_path_length()
> >    wget: fix build when len(TMPDIR) == 410
> > 
> >   meta/classes/sanity.bbclass         | 2 +-
> >   meta/recipes-extended/wget/wget.inc | 5 +++++
> >   2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> 
> How are these patches related and what is magic about a path length
> of 410?
> Are you sure that it might not be 569 on my system for example?

410 is the maximum we've ever managed to make work for the core
recipes. We're basically trying to ensure we don't get worse. In an
ideal world there wouldn't be any restrictions but that would take
significant resource investment for questionable return.

Cheers,

Richard


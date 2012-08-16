Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T22qW-0005UY-DH
	for openembedded-core@openembedded.org; Thu, 16 Aug 2012 18:22:56 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 7C6211EBB7;
	Thu, 16 Aug 2012 09:10:59 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org,
	Chris Larson <clarson@kergoth.com>
Date: Thu, 16 Aug 2012 09:10:46 -0700
Message-Id: <1345133447-12833-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <CABcZANnFML0a-qAZA33skkJK+=9sTN_bG=KWsGbLYfXZgqDbnQ@mail.gmail.com>
References: <CABcZANnFML0a-qAZA33skkJK+=9sTN_bG=KWsGbLYfXZgqDbnQ@mail.gmail.com>
Subject: Re: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
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
X-List-Received-Date: Thu, 16 Aug 2012 16:22:56 -0000

Chris Larson wrote:
> Please just use os.path.normpath() rather than reinventing the wheel here.

Learn something new every day.  Fixed.

Andy




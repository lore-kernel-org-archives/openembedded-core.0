Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1QCE-0001sN-R9 for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 00:02:15 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M39I7029253 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:03:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qdSGnbgnweR2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 23:03:09 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M32Ca029237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:03:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <68679302c46936d2e2f7b0980ec325c398dd5e73.1315411864.git.sgw@linux.intel.com>
References: <cover.1315411864.git.sgw@linux.intel.com>
	<68679302c46936d2e2f7b0980ec325c398dd5e73.1315411864.git.sgw@linux.intel.com>
Date: Wed, 07 Sep 2011 22:57:00 +0100
Message-ID: <1315432620.13021.25.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PULL v2 1/1] cpan.bbclass: fix native perl issue
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
X-List-Received-Date: Wed, 07 Sep 2011 22:02:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-07 at 09:12 -0700, Saul Wold wrote:
> When configuring cpan packages, the directories passed to MakeMaker
> are the target directories. There was a patch that was applied to the
> native perl to find perl.real and convert that to perl.  This does not
> apply for the target perl modules and therefore MakeMaker finds perl.real.
> 
> This patch to cpan configure modifies the Makefile after configure and
> changes the perl.real to just straight perl so we have the correct paths
> and shared state info in usable.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/cpan.bbclass |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard




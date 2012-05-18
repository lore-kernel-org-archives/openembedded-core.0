Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVOO6-0001JI-B7 for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:42:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEWY4H017525
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:32:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17487-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:32:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEWQvQ017519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:32:28 +0100
Message-ID: <1337351545.28145.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2012 15:32:25 +0100
In-Reply-To: <9e0928b2bbffb04eb4888be4d937e3b432160269.1337286797.git.mark.hatle@windriver.com>
References: <cover.1337286797.git.mark.hatle@windriver.com>
	<9e0928b2bbffb04eb4888be4d937e3b432160269.1337286797.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] sstate.bbclass: Make sure we don't have an empty fixmepath file
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
X-List-Received-Date: Fri, 18 May 2012 14:42:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 15:34 -0500, Mark Hatle wrote:
> Jason Wessel noticed that a package without any fixmepath entries would
> generate a sed warning about no input files.  This patch resolves that
> by ensuring that an empty fixmepath file never gets written into the
> sstate archive.  Also we avoid a second message by only doing xargs if
> we got input.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/sstate.bbclass |   17 ++++++++++++-----
>  1 files changed, 12 insertions(+), 5 deletions(-)

Merged to master, thanks.

Richard




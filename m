Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG608-0004lQ-Oe for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:34:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OACCt4027536;
	Mon, 24 Sep 2012 11:12:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26940-04; Mon, 24 Sep 2012 11:12:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAC5J6027530
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:12:06 +0100
Message-ID: <1348481526.4654.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 11:12:06 +0100
In-Reply-To: <1348467891.4444.250.camel@x121e.pbcl.net>
References: <1348467891.4444.250.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] util-linux: Ensure that ${sbindir} is respected
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
X-List-Received-Date: Mon, 24 Sep 2012 10:34:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 07:24 +0100, Phil Blundell wrote:
> The configure script uses a hard-coded value for ${usrsbin_execdir},
> which is the path that we know as ${sbindir}.  Adjust configure to take
> this from the environment if it's set there, and have do_configure()
> pass it in.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
> v2: now with correct header on new patch
> 
>  meta/recipes-core/util-linux/util-linux.inc        |    4 +++-
>  .../util-linux/util-linux/configure-sbindir.patch  |   18 ++++++++++++++++++
>  meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    3 ++-
>  3 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/configure-sbindir.patch

Merged to master, thanks.

Richard




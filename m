Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzXSw-0006WU-Lf for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 19:23:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82HIk3m027858
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 18:18:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27097-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 18:18:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82HIe3h027852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 18:18:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <572ada82123de7827679cc56e0a2dd8ae83abca3.1314915824.git.josh@linux.intel.com>
References: <cover.1314915824.git.josh@linux.intel.com>
	<572ada82123de7827679cc56e0a2dd8ae83abca3.1314915824.git.josh@linux.intel.com>
Date: Fri, 02 Sep 2011 18:18:22 +0100
Message-ID: <1314983902.5939.621.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] util-linux: fix packaging of readprofile
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
X-List-Received-Date: Fri, 02 Sep 2011 17:23:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 15:25 -0700, Joshua Lock wrote:
> We rename readprofile to readprofile.util-linux so we need to use that binary
> name in the FILES entry for the readprofile package.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc       |    2 +-
>  meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard




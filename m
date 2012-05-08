Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRmL3-00079F-Ro for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 17:28:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FIg7S004290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:18:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03507-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 16:18:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FIXoP004284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:18:34 +0100
Message-ID: <1336490318.30349.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2012 16:18:38 +0100
In-Reply-To: <53bfc4a4c70630c2d546e49fcb93eb2ad7315d27.1336487657.git.edwin.zhai@intel.com>
References: <cover.1336487657.git.edwin.zhai@intel.com>
	<53bfc4a4c70630c2d546e49fcb93eb2ad7315d27.1336487657.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] pango: Fix modules load failure in multilib environment
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
X-List-Received-Date: Tue, 08 May 2012 15:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-08 at 22:43 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Multi-libs of Pango need different modules, thus different config files and
> utils. This patch separate config file and utils with different MLPREFIX to
> avoid conflict.
> 
> [YOCTO #2356] got fixed.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  .../pango/pango-1.28.4/multilib-fix-clean.patch    |   40 ++++++++++++++++++++
>  meta/recipes-graphics/pango/pango.inc              |   13 +++++-
>  meta/recipes-graphics/pango/pango_1.28.4.bb        |    7 ++-
>  3 files changed, 55 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch

Merged to master, thanks.

Richard




Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1UWop5-0001Ih-F9
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 16:13:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TDuCSq032081; Mon, 29 Apr 2013 14:56:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4b-NecgvP2BP; Mon, 29 Apr 2013 14:56:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TDu9XB032008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 29 Apr 2013 14:56:11 +0100
Message-ID: <1367243669.5379.21.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 29 Apr 2013 14:54:29 +0100
In-Reply-To: <1366894048.14512.87.camel@phil-desktop.brightsign>
References: <1366894048.14512.87.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: Move alsaconf to its own recipe
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
X-List-Received-Date: Mon, 29 Apr 2013 14:13:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-25 at 13:47 +0100, Phil Blundell wrote:
> 18575b082a4042376fd1575465e69562dea04ddc added bash as a dependency of
> alsa-utils-alsaconf so that the script interpreter will be available at
> run time.  However, this has the undesirable side effect of making bash
> be a build dependency for alsa-utils and, for those folks who don't need
> alsaconf but do want some other part of alsa-utils, this cure is worse
> than the original disease.
> 
> Fix this by moving alsaconf to a separate recipe so that the bash
> dependency only applies when alsaconf is specifically requested.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  .../alsa/alsa-utils-alsaconf_1.0.26.bb             |   22 ++++++++++++++++++++
>  meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb  |   12 +++++++----
>  2 files changed, 30 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb

I merged this however I'm not convinced its the right way to handle
this. I'm wondering about a PACKAGECONFIG which when turned off, deletes
alsaconf. I suspect that might be a nicer way to handle this kind of
issue going forward...

Cheers,

Richard






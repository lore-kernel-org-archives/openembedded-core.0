Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTjQa-0007AM-F4 for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:14:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP07WmL032626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:07:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32588-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:07:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP07O5e032620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:07:25 GMT
Message-ID: <1322179650.10928.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 00:07:30 +0000
In-Reply-To: <e4edb77cfaf1aa7e5aed01ad7d279fe2a37d11d8.1321439619.git.kai.kang@windriver.com>
References: <cover.1321439619.git.kai.kang@windriver.com>
	<e4edb77cfaf1aa7e5aed01ad7d279fe2a37d11d8.1321439619.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] eglibc_2.13: update SRCREV
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
X-List-Received-Date: Fri, 25 Nov 2011 00:14:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-16 at 18:36 +0800, Kang Kai wrote:
> Update eglibc 2.13 SRCREV to 15508, just to sync with upstream
> Remove glibc_bug_fix_12454.patch, because it is already merged.
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../conf/distro/include/distro_tracking_fields.inc |    3 +
>  .../eglibc/eglibc-2.13/glibc_bug_fix_12454.patch   |  179 --------------------
>  meta/recipes-core/eglibc/eglibc_2.13.bb            |    5 +-
>  3 files changed, 5 insertions(+), 182 deletions(-)
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch

Merged to master, thanks.

Richard




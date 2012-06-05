Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sc1zG-0002ZR-Uo for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 00:12:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55M20qc002884
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2012 23:02:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02845-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2012 23:01:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55M1kCa002878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2012 23:01:51 +0100
Message-ID: <1338933706.20169.279.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jun 2012 23:01:46 +0100
In-Reply-To: <1338922277-26222-1-git-send-email-cristian.iorga@intel.com>
References: <1338922277-26222-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] ltp: Add patch to correct failing build
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
X-List-Received-Date: Tue, 05 Jun 2012 22:12:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-05 at 21:51 +0300, Cristian Iorga wrote:
> ltp makefile does not interpret correctly the result of git describe
> command and assumes that it is working with a git repo, while in fact
> working with a source code archive.
> Added a patch to corect makefile system.
> 
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../ltp/ltp/fix_building_fom_archive.patch         |   13 +++++++++++++
>  meta/recipes-extended/ltp/ltp_20120401.bb          |    4 ++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch

Merged to master, thanks.

Richard




Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiSJx-0001WA-5k for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 16:00:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04Eqj1l019866
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 14:52:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19653-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 14:52:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04Eqaj2019860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 14:52:37 GMT
Message-ID: <1325688754.20759.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 14:52:34 +0000
In-Reply-To: <1325682549.28005.46.camel@phil-desktop>
References: <1325682549.28005.46.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: remove some redundant/unnecessary variable exports
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
X-List-Received-Date: Wed, 04 Jan 2012 15:00:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 13:09 +0000, Phil Blundell wrote:
> Specifically...
> 
> SLOT: apparently redundant, deleted.
> STAGING_IDLDIR: likewise
> QMAKE_MKSPEC_PATH: no longer exported, moved to qmake_base.bbclass
> STAGING_SIPDIR: no longer exported, moved to sip.bbclass
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/qmake_base.bbclass |    1 +
>  meta/classes/sip.bbclass        |    2 ++
>  meta/conf/bitbake.conf          |    7 -------
>  3 files changed, 3 insertions(+), 7 deletions(-)

Merged to master, thanks.

Richard




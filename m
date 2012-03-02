Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3TC0-0004cy-Ba for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 15:10:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22E2E2O001064
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 14:02:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00908-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 14:02:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22E24Wf001057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 14:02:05 GMT
Message-ID: <1330696928.309.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 14:02:08 +0000
In-Reply-To: <948126e8b9392e90f86f18a7095589586cc22d42.1330465479.git.scott.a.garman@intel.com>
References: <cover.1330465479.git.scott.a.garman@intel.com>
	<948126e8b9392e90f86f18a7095589586cc22d42.1330465479.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] sudo: upgrade to 1.8.4
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
X-List-Received-Date: Fri, 02 Mar 2012 14:10:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-28 at 13:45 -0800, Scott Garman wrote:
> During the upgrade to 1.8.4, the UCB-licensed fnmatch.c was replaced
> with a non-recursive BSD-licensed version, hence the removal of UCB
> and addition of BSD in the LICENSE field. This led to checksum changes
> in the doc/LICENSE file, and we now additionally track the comment
> headers in redblack.c.
> 
> These changes were confirmed on the sudo mailing list:
> 
> http://www.sudo.ws/pipermail/sudo-workers/2012-February/000736.html
> 
> This upgrade also fixes CVE-2012-0809.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/recipes-extended/sudo/sudo.inc                |    7 ++++---
>  .../sudo/{sudo_1.8.3.bb => sudo_1.8.4.bb}          |    4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>  rename meta/recipes-extended/sudo/{sudo_1.8.3.bb => sudo_1.8.4.bb} (84%)

Merged to master, thanks.

Richard




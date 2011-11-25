Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTjKe-0006sz-C9 for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:07:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP01M2b032425
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:01:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31842-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:01:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP01DS1032419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:01:14 GMT
Message-ID: <1322179279.10928.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 00:01:19 +0000
In-Reply-To: <ea4995cfbec9d75978131ba7566e30d3a20f99fa.1321516924.git.lei.mei@intel.com>
References: <cover.1321516924.git.lei.mei@intel.com>
	<ea4995cfbec9d75978131ba7566e30d3a20f99fa.1321516924.git.lei.mei@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] rpm: Flush old logs by change the DB_CONFIG
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
X-List-Received-Date: Fri, 25 Nov 2011 00:07:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-17 at 16:32 +0800, Mei Lei wrote:
> Fixes [YOCTO #1174]
> 
> Rpm logs will grow indefinitely, so change the config to flush those old logs.
> 
> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
>  .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   12 ++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    5 +++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch

Merged to master, thanks.

Richard




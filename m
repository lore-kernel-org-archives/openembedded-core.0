Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D33D5606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 580A22E170;
	Thu, 26 May 2016 15:01:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RnWTzgEFD6nA; Thu, 26 May 2016 15:01:41 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 17F002E2A1;
	Thu, 26 May 2016 15:01:40 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id CB0C616C8;
	Thu, 26 May 2016 15:01:40 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id C053916BE;
	Thu, 26 May 2016 15:01:40 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id C0126F43;
	Thu, 26 May 2016 15:01:40 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 3B8779C09F; Thu, 26 May 2016 15:01:50 +0200 (CEST)
Date: Thu, 26 May 2016 15:01:50 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160526130149.GW21318@axis.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
	<285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] gnupg.org-hosted recipes: Change SRC_URI to https site
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 May 2016 13:01:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16-05-25 16:29 +0300, Jussi Kukkonen wrote:
> https version seems more reliable and in an informal test fetching
> all gnupg recipes now takes <20% of the time it used to.
> 
> Define GNUPG_MIRROR in bitbake.conf so future tweaks to this are
> easier. Replace some slower mirrors with the official ftp site
> and another from gnupg.org mirror list.
> 
> Change gnutls to use GNUPG_MIRROR as well: they have their own domain
> but the ftp site is the slow, unreliable gnupg.org one.
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
...
> -SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
> +SRC_URI = "${GNUPG_MIRROR}/gnupg/gnupg-${PV}.tar.bz2 \

I'm not fond of having variables like these, since it makes the
URL in the recipe harder to work with and interpret. Maybe not a
deal breaker, but we already have PREMIRRORS, which can be used
instead of variable indirection. A similar patch, almost a year
ago, was rejected.

 http://lists.openembedded.org/pipermail/openembedded-core/2015-July/108217.html

-- 
olofjn


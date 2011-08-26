Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwzR2-00026G-13
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:39:12 +0200
Received: by wwe32 with SMTP id 32so2969796wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 09:34:23 -0700 (PDT)
Received: by 10.216.229.224 with SMTP id h74mr2120205weq.66.1314376463173;
	Fri, 26 Aug 2011 09:34:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m20sm820226wed.33.2011.08.26.09.34.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 09:34:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cd76d454663469daf196ebac80eab51de527f19c.1314370503.git.noor_ahsan@mentor.com>
Date: Fri, 26 Aug 2011 18:34:19 +0200
Message-Id: <9AAE579D-BC67-4D49-9670-2D3140CB8245@dominion.thruhere.net>
References: <cover.1314370503.git.noor_ahsan@mentor.com>
	<cd76d454663469daf196ebac80eab51de527f19c.1314370503.git.noor_ahsan@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [meta-oe][PATCH 2/4] lmbench: Add version 3.0-a9 (initial recipe)
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
X-List-Received-Date: Fri, 26 Aug 2011 16:39:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 26 aug. 2011, om 18:31 heeft Noor, Ahsan het volgende geschreven:

> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> 
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -0,0 +1,56 @@
> +DESCRIPTION = "Tools for performance analysis."
> +HOMEPAGE = "http://lmbench.sourceforge.net/"
> +SECTION = "console/utils"
> +LICENSE = "GPL"

which version?

> 
> +RDEPENDS_${PN} = "debianutils"

That needs to go next to FILES_* and friends



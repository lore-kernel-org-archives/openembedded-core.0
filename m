Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 35A4360881
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 17:23:17 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id CCEEED22DE; Thu, 30 May 2013 19:23:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E1730D22B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:22:37 +0200 (CEST)
Message-ID: <51A78ADA.2060308@juszkiewicz.com.pl>
Date: Thu, 30 May 2013 19:22:34 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1369932321.14887.320.camel@ted>
In-Reply-To: <1369932321.14887.320.camel@ted>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
Subject: Re: Issues with gcc 4.8 sstate "contamination" on the autobuilder
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
X-List-Received-Date: Thu, 30 May 2013 17:23:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 30.05.2013 18:45, Richard Purdie pisze:
> I want to make people aware we're seeing some issues with gcc 4.8 on the
> autobuilder.

When we are at sstate and gcc...

I noticed recently that libunwind may break gcc builds:

https://bugs.launchpad.net/linaro-oe/+bug/1183087

The issue exists only when libunwind was built before gcc was started.

To reproduce:

bitbake -ccleansstate gcc libunwind
bitbake libunwind
bitbake gcc

Did not yet found proper working solution.


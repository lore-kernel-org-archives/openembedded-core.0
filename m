Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 521106E885
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 23:35:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s13NYwWB012800; Mon, 3 Feb 2014 23:34:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0aZryWaqDheb; Mon,  3 Feb 2014 23:34:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s13NYqbe012795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 3 Feb 2014 23:34:54 GMT
Message-ID: <1391470486.3330.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ulf Samuelsson <openembedded-core@emagii.com>
Date: Mon, 03 Feb 2014 23:34:46 +0000
In-Reply-To: <D4601ED0-3B88-46B4-A507-BACB35D3FBC9@emagii.com>
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
	<52E8EF66.5040609@emagii.com> <1391000162.24655.67.camel@ted>
	<52ECBCAF.1060403@topic.nl>
	<D4601ED0-3B88-46B4-A507-BACB35D3FBC9@emagii.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Mon, 03 Feb 2014 23:35:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-03 at 22:23 +0100, Ulf Samuelsson wrote:
> 1 feb 2014 kl. 10:21 skrev Mike Looijmans <mike.looijmans@topic.nl>:
> 
> > On 01/29/2014 01:56 PM, Richard Purdie wrote:
> >> On Wed, 2014-01-29 at 13:09 +0100, Ulf Samuelsson wrote:
> If bitbakes can track the loading of the CPU, then maybe some parts
> in the later part of each recipe can be delayed until loading is low (maybe already doing this).

It doesn't. We did try this, the Linux scheduler is in fact rather good
and we only ever slowed down builds when we tried adding hints.

> If the toolchain/native stuff could be pulled down from packages as part of a build
> it would be real cool.

This is called sstate ;-).

> Today you can install cross compilers for certain Linux distributions.
> Maybe there should be a possibility to generate automatically the .rpm/.deb etc.
> and make that the default way to get stuff done for those distributions.

Its a maintenance/bug report nightmare...

Cheers,

Richard



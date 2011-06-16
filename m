Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXAHW-0001vR-Bb
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 12:58:38 +0200
Received: by wwb17 with SMTP id 17so1191016wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 03:55:07 -0700 (PDT)
Received: by 10.216.59.81 with SMTP id r59mr757996wec.40.1308221707041;
	Thu, 16 Jun 2011 03:55:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm763208weq.9.2011.06.16.03.55.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 03:55:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201106161136.13911.paul.eggleton@linux.intel.com>
Date: Thu, 16 Jun 2011 12:55:03 +0200
Message-Id: <BCCB45E5-7D70-4CC4-8E61-09FE15C4BDE3@dominion.thruhere.net>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
	<1308216925.25285.4101.camel@phil-desktop>
	<201106161136.13911.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Thu, 16 Jun 2011 10:58:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 16 jun 2011, om 12:36 heeft Paul Eggleton het volgende geschreven:

> On Thursday 16 June 2011 10:35:25 Phil Blundell wrote:
>> These changes look like they will have a rather wider impact than just
>> the sato image.  I'm not sufficiently au fait with connman to say
>> whether this is a good thing or not (although my immediate reaction to
>> adding extra RDEPENDS tends to be that it is not), but if they're going
>> to be added globally then the checkin comment ought to reflect that and
>> explain why it's being done.
> 
> Dongxiao, I'm somewhat in agreement in that I don't think we want to force 
> ofono to be installed for people who only need connman. Ofono support in 
> connman is a plugin, so we should be able to have this as a separate sub-
> package and then make only that depend on ofono.

Have a look at connman in meta-oe, that has some nice plugin goodies.



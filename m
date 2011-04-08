Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q8BnQ-0005mc-IC
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 15:32:20 +0200
Received: by wye20 with SMTP id 20so3331972wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2011 06:30:08 -0700 (PDT)
Received: by 10.216.182.212 with SMTP id o62mr1980919wem.52.1302269407875;
	Fri, 08 Apr 2011 06:30:07 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t5sm1355817wes.9.2011.04.08.06.30.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 06:30:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D9F0B82.9080803@mlbassoc.com>
Date: Fri, 8 Apr 2011 15:30:05 +0200
Message-Id: <8B7010C5-9902-4372-BF78-252D85C4BF46@dominion.thruhere.net>
References: <4D9F0B82.9080803@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-core oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Early image startup
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
X-List-Received-Date: Fri, 08 Apr 2011 13:32:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 8 apr 2011, om 15:20 heeft Gary Thomas het volgende geschreven:

> I have a Poky image which uses a number of kernel modules.  For
> whatever reason, the raw image has not had the modules configured
> (no /lib/modules/.../modules.dep)  This file is created by 'update-modules'
> but that is run too late in the boot process.  The problem is that
> other code, e.g. I'm using iptables via modules, requires the modules
> be configured early and this fails.  If I reboot (after 'update-modules'
> has run), everything is fine.

Sound like you need http://patches.openembedded.org/patch/1917/



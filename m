Return-Path: <openembedded-core@emagii.com>
X-Greylist: delayed 396 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Jul 2014 17:25:38 UTC
Received: from smtp-out21.han.skanova.net (smtp-out21.han.skanova.net
	[195.67.226.208])
	by mail.openembedded.org (Postfix) with ESMTP id 05D3065CCF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 17:25:38 +0000 (UTC)
Received: from [10.175.196.23] (213.66.90.56) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 53804BED00FB1225 for openembedded-core@lists.openembedded.org;
	Thu, 3 Jul 2014 19:19:00 +0200
Message-ID: <53B59084.1090608@emagii.com>
Date: Thu, 03 Jul 2014 19:19:00 +0200
From: Ulf Samuelsson <openembedded-core@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>	<CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>	<20140623123922.GF2437@jama>
	<20140623124437.GG2437@jama> <1404405934.6362.89.camel@ted>
In-Reply-To: <1404405934.6362.89.camel@ted>
Subject: Avoiding getting the login prompt on the LCD at boot
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
X-List-Received-Date: Thu, 03 Jul 2014 17:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Running a Beaglebone with an LCD.
Running Yocto-1.5 with meta-oe, meta-ti, meta-arago, meta-qt5 added.

Would like to have boot process where the LCD looks like the following:

1. Boot LOGO
2. psplash
3. QT based application.

Between 2 and 3, I get an ugly login prompt.

Removed the FRAMEBUFFER_CONSOLE from the kernel build,
but then I do not get a Boot LOGO.
The screen is black, blinks and then psplash starts.

Any ideas?

Ulf Samuelsson




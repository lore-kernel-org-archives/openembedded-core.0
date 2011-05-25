Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPKaC-0003aK-NR
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 22:21:32 +0200
Received: by eye27 with SMTP id 27so50388eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 13:18:26 -0700 (PDT)
Received: by 10.14.51.144 with SMTP id b16mr845eec.126.1306354706562;
	Wed, 25 May 2011 13:18:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b1sm12957eeg.19.2011.05.25.13.18.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 13:18:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306353358.3120.29.camel@lenovo.internal.reciva.com>
Date: Wed, 25 May 2011 22:18:23 +0200
Message-Id: <F5A970A1-AB66-4024-B885-C607158374D4@dominion.thruhere.net>
References: <1306352857-12211-1-git-send-email-koen@dominion.thruhere.net>
	<1306353358.3120.29.camel@lenovo.internal.reciva.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] dbus: split X11 dependant dbus-launch into its own subpackage
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
X-List-Received-Date: Wed, 25 May 2011 20:21:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 25 mei 2011, om 21:55 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-05-25 at 21:47 +0200, Koen Kooi wrote:
>> +FILES_${PN}-x11 = "{bindir}/dbus-launch"
> 
> That doesn't look quite right.

Gah, copy-paste mistake from meta-oe, I'll send a new version



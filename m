Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QxD3p-0005ly-DR
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 09:12:09 +0200
Received: by wwe32 with SMTP id 32so3345313wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:07:20 -0700 (PDT)
Received: by 10.216.157.8 with SMTP id n8mr2660733wek.48.1314428839968;
	Sat, 27 Aug 2011 00:07:19 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fg5sm1899055wbb.6.2011.08.27.00.07.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 27 Aug 2011 00:07:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314415580-21925-1-git-send-email-joelagnel@ti.com>
Date: Sat, 27 Aug 2011 09:07:16 +0200
Message-Id: <A84D9649-CE65-4C70-86CD-430D4D22A2B4@dominion.thruhere.net>
References: <1314415580-21925-1-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: (No subject)
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
X-List-Received-Date: Sat, 27 Aug 2011 07:12:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 27 aug. 2011, om 05:26 heeft Joel A Fernandes het volgende geschreven:

> v2 Changes:
> Addressing Koen's feedback on patches
> * Added a PR to all recipes
> * Changed meta-ti in subject to meta-oe
> 
> Patches in the series:
> 
> [PATCH v2 meta-oe 1/4] gedit: Imported from OE classic
> [PATCH v2 meta-oe 2/4] gtksourceview: Imported from OE classic
> [PATCH v2 meta-oe 3/4] libgnomecups: Imported from OE Classic
> [PATCH v2 meta-oe 4/4] libgnomeprint: Imported from OE classic


Same feedback as for Noors series:

1) drop PR = r*
2) RDEPENDS_${PN} is sorted with FILES_*, so don't put it next to DEPENDS



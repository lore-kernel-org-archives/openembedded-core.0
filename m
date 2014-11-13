Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3A560167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 08:27:42 +0000 (UTC)
Received: from ad.chargestorm.se (83.233.19.145) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Thu, 13 Nov 2014 09:27:41 +0100
Date: Thu, 13 Nov 2014 09:27:04 +0100
From: Anders Darander <anders@chargestorm.se>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20141113082704.GA19230@ad.chargestorm.se>
Mail-Followup-To: Hongxu Jia <hongxu.jia@windriver.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1415699201.git.hongxu.jia@windriver.com>
	<37d7153a864b4dee5748a3a30054c0c62e243f02.1415699201.git.hongxu.jia@windriver.com>
	<FB878F6E-62D1-49FB-A373-EF554D0A274D@dominion.thruhere.net>
	<54640951.3040005@windriver.com> <54640CC9.1080509@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54640CC9.1080509@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] avahi.inc: rename package to use avahi to instead of avahi-daemon
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
X-List-Received-Date: Thu, 13 Nov 2014 08:27:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Hongxu Jia <hongxu.jia@windriver.com> [141113 02:44]:

> On 11/13/2014 09:28 AM, Hongxu Jia wrote:
> > On 11/12/2014 06:27 PM, Koen Kooi wrote:
> >>> Op 11 nov. 2014, om 11:52 heeft Hongxu Jia 
> >>> <hongxu.jia@windriver.com> het volgende geschreven:

> >>> The package avahi does not exist, as SUMMARY said, we should
> >>> use avahi-daemon to instead. It avoids the do_rootfs failure
> >>> while IMAGE_INSTALL += "avahi"

> >>> For compatibility, let avahi to provide avahi-daemon.
> >> As stated before:

> >> 1) Fix your IMAGE_INSTALL

> > Could you describe what's wrong with IMAGE_INSTALL?
> > I have no idea about it.

Koen means that you should use
IMAGE_INSTALL_append += "avahi-daemon"
and not avahi... (I.e. package name, not recipe name).

If you still insist on creating a package named avahi, you might as well
create avahi as an empty package, RDEPEND'ing on all sub-packages.

> >> 2) This breaks upgrade paths

> >> Do you *really* want to break existing installs just so you can 
> >> pretend that your recipename==package name assumption isn't wrong?

> > What does *upgrade paths* means?


> Do you mean use package management to upgrade the
> package, such as "smart upgrade". If yes, I think you are right,
> we could drop patch 1/3 and 2/3.

Yes, that's exactly what Koen talks about when it comes to ugrade paths.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


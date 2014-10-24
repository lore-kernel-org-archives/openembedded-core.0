Return-Path: <anders@chargestorm.se>
X-Greylist: delayed 333 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Oct 2014 07:07:53 UTC
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id 77E6C65E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 07:07:53 +0000 (UTC)
Received: from ad.chargestorm.se (83.252.255.124) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 24 Oct 2014 09:02:18 +0200
Date: Fri, 24 Oct 2014 09:01:47 +0200
From: Anders Darander <anders@chargestorm.se>
To: Chong Lu <Chong.Lu@windriver.com>
Message-ID: <20141024070147.GA16284@ad.chargestorm.se>
Mail-Followup-To: Chong Lu <Chong.Lu@windriver.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1413960370.git.Chong.Lu@windriver.com>
	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
	<73178E47-C311-4EA8-9B4C-6691A7E6B82A@dominion.thruhere.net>
	<5449EEC4.4070303@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5449EEC4.4070303@windriver.com>
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
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Fri, 24 Oct 2014 07:07:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Chong Lu <Chong.Lu@windriver.com> [141024 08:17]:
> On 10/24/2014 02:10 PM, Koen Kooi wrote:
> >> Op 22 okt. 2014, om 09:09 heeft Chong Lu <Chong.Lu@windriver.com> het volgende geschreven:

> >> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
> >> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
> >> in the sdk:
> >> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
> >> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
> >> gconf-3.2.6-r0.0.x86_64

> >> Move org.gnome.GConf.service to ${libdir}, then the conflict was fixed.
> > And I suspect its dbus service won't work anymore after moving the files. How have you tested this change?

> I just focus on the conflicts, not to test dbus service.
> Or do you have any suggestion to fix this conflicts?

Well, if you move a file to a new location, everyone assumes that you
have verified that the file still will be found by the application that
needs it. Basically, that's what Koen's question was about. Have you
made any run-time tests, to verify that your patch doesn't break
anything?

Besides, there was the other remark whether or not it makes sense to
have multiple versions of gconf installed...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


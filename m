Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C23DB6EC51
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 08:49:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1M8nWba022206; Sat, 22 Feb 2014 08:49:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KtPwWKPvvGKX; Sat, 22 Feb 2014 08:49:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1M8nSO2022203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 22 Feb 2014 08:49:29 GMT
Message-ID: <1393058961.5181.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 22 Feb 2014 08:49:21 +0000
In-Reply-To: <8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Sat, 22 Feb 2014 08:49:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-02-22 at 08:57 +0100, Koen Kooi wrote:
> Op 21 feb. 2014, om 16:21 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Fri, 2014-02-21 at 16:16 +0100, Martin Jansa wrote:
> >> On Thu, Feb 20, 2014 at 02:18:56AM -0800, Khem Raj wrote:
> >>> This patchset upgrades systemd to 209 as can be seen some enahancements
> >>> to uclibc were neeed. As of now. It builds for me on both uclibc/eglibc
> >>> Please test it out in your setups and report back any issues
> >>> 
> >>> The following changes since commit 9a98b8bfe13b94d89a9e39cca821f26fdeaeffc3:
> >>> 
> >>>  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:37:03 +0000)
> >>> 
> >>> are available in the git repository at:
> >>> 
> >>>  git://git.openembedded.org/openembedded-core-contrib kraj/systemd-209
> >>>  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-209
> >>> 
> >>> Khem Raj (2):
> >>>  uclibc: Add new functionality needed for systemd 209
> >>>  systemd: Upgrade 208 -> 209
> >> 
> >> Thanks for upgrade
> >> 
> >> I've noticed pulseaudio failing to build when it tries to detect old
> >> libsystemd-login lib:
> >> 
> >> | to the PKG_CONFIG_PATH environment variable
> >> | No package 'libsystemd-login' found
> >> | configure:26263: $? = 1
> >> | configure:26277: result: no
> >> | No package 'libsystemd-login' found
> >> | configure:26310: error: *** Needed systemd support not found
> >> 
> >> do we want to enable compat libs or update pulseaudio to use new
> >> libsystemd?
> > 
> > FWIW the git recipe I was using enabled compat-libs...
> 
> And that needs IFUNC which only x86 toolchains support :(

I did run test builds of the git version on the autobuilders and didn't
see any failures? 

Cheers,

Richard



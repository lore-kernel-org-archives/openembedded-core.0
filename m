Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A34797037A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:35:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6G8Zb5d022180; Wed, 16 Jul 2014 09:35:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P9afl-EtF2NM; Wed, 16 Jul 2014 09:35:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6G8ZYkM022177
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 09:35:35 +0100
Message-ID: <1405499727.20402.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 16 Jul 2014 09:35:27 +0100
In-Reply-To: <53C5EB06.3030403@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
	<c6ba65dc4b22e743a8aef32cf77b08c6eca388fc.1405433828.git.liezhi.yang@windriver.com>
	<CAMKF1so50VJx-iL4dXbmR_RNpgvSPJYNOPkPGth7uTFmNL=VoQ@mail.gmail.com>
	<53C5EB06.3030403@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/38] gnu-config: add perl to RDEPENDS_gnu-config
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
X-List-Received-Date: Wed, 16 Jul 2014 08:35:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-16 at 11:01 +0800, Robert Yang wrote:
> 
> On 07/15/2014 11:40 PM, Khem Raj wrote:
> > On Tue, Jul 15, 2014 at 7:19 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> >> Perl script:
> >> gnu-config/usr/bin/gnu-configize
> >
> > will it impact native recipes too ?
> 
> Yes, it will, thanks, update it to target only in the git repo,
> 
> RDEPENDS_${PN}_class-target += "perl"

Please don't do that. perl-native should be in ASSUME_PROVIDED so we
should be safe from that angle (but we should check).

The autobuilder showed an error with these changes:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/170/steps/BuildImages/logs/stdio

(see the bash-native ERROR) so we probably need to add bash-native to
ASSUME_PROVIDED to fix that.

Cheers,

Richard


